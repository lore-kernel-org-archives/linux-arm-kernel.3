Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D46E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFHlJce+tj0dKx9Nr0h2tu85fnxZTCB9b2AakTaYe38=; b=ocMH9jSU79LRuCcwoZV0kQsdQB
	iQTMZoaJ7UU+DiDb1FmGs0pJIig+C87+wW2cIrWLmBbHQvO2OaiwrEbDdUG2ThebdQhcOc4OfgEA6
	q2XFhk4QGYJqKEs2gX74ueWGF1oVatRl1wvJO1tSDAYo2lb9Yn33oxU1I98R8r5+eRhn6I7G327ha
	KXFS15Xznthn9MiJG+FBVupEsDrPLipNGlI8OzLCxVrEr4s1aUCGeCExO+52/7uA9LtflKT+nVmkL
	kup4T4cVguzBKazXUYImen+Qx2QaRnhoxsHUVd1bUtId2uAvUy/VnensKnvezqdDE46DHquXhCacB
	z9Qd2RFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMtR-0000000F0Hb-1cWT;
	Wed, 11 Dec 2024 13:36:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMsL-0000000Ezzr-2pBf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 13:35:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 557CC1063;
	Wed, 11 Dec 2024 05:36:04 -0800 (PST)
Received: from [10.57.70.51] (unknown [10.57.70.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0238C3F720;
	Wed, 11 Dec 2024 05:35:31 -0800 (PST)
Message-ID: <8aedf3db-d1a5-4cc6-974b-a3d9fffe4f52@arm.com>
Date: Wed, 11 Dec 2024 14:35:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/16] arm64: mm: Map p4d/pgd with privileged pkey
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 aruna.ramakrishna@oracle.com, broonie@kernel.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, jannh@google.com, jeffxu@chromium.org,
 joey.gouly@arm.com, kees@kernel.org, maz@kernel.org,
 pierre.langlois@arm.com, qperret@google.com, ryan.roberts@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
 <20241206101110.1646108-13-kevin.brodsky@arm.com>
 <20241209102440.GI21636@noisy.programming.kicks-ass.net>
 <75a345d4-78ea-4434-a4cd-3f2095ce2b31@arm.com>
 <20241210122355.GN8562@noisy.programming.kicks-ass.net>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20241210122355.GN8562@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_053537_766409_5A41903A 
X-CRM114-Status: GOOD (  15.60  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 10/12/2024 13:23, Peter Zijlstra wrote:
> On Tue, Dec 10, 2024 at 10:27:56AM +0100, Kevin Brodsky wrote:
>> On 09/12/2024 11:24, Peter Zijlstra wrote:
>>> On Fri, Dec 06, 2024 at 10:11:06AM +0000, Kevin Brodsky wrote:
>>>> If CONFIG_KPKEYS_HARDENED_PGTABLES is enabled, map p4d/pgd pages
>>>> using a privileged pkey (KPKEYS_PKEY_PGTABLES), so that they can
>>>> only be written under guard(kpkeys_hardened_pgtables).
>>>>
>>>> The case where pgd is not page-sized is not currently handled -
>>>> this is pending support for pkeys in kmem_cache.
>>>>
>>>> This patch is a no-op if CONFIG_KPKEYS_HARDENED_PGTABLES is disabled
>>>> (default).
>>> Should not this live in pagetable_*_[cd]tor() in generic code?
>> This would certainly be preferable but it doesn't look like such helpers
>> exist for p4d/pgd. For p4d, we could potentially handle this in the
>> generic __p4d_alloc(), but I'm not sure we can assume that
>> p4d_alloc_one() won't be called from somewhere else. pgd_alloc() is
>> entirely arch-specific so not much we can do there.
> Can't we add the missing pagetable_{p4d,pgd}_[cd]tor() functions. Yes,
> it will mean touching a bunch of arch code, but it shouldn't be hard.

It does look doable. The p4d level shouldn't be an issue, it's unclear
why it doesn't follow the same pattern as pud already. pgd will be more
involved (no generic layer at all) but as you say it should just be
about some churn in arch code.

An extra complication is that the pgd level may be smaller than a page,
at least on arm64 (see pgd_alloc() in arch/arm64/mm/pgd.c). I suppose
affected architectures will have to define their own pgd_alloc_one().

I'll give it a try and post something separately if it looks sensible.

- Kevin

