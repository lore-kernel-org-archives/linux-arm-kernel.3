Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2659E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nz9k9rGo2D0/lXq/+ouFIhcZyVjeXWbcNdo9F1ICcB8=; b=IIlR4wEU2+QmSyxm55VMUMZWuy
	Sl/kwJcfl12czyapM0mbcjepZ05S6R2FRMxcyEyplHtS0SD/GzFLcPSEfoRXUje1oEyPFr1nLqiIh
	RevkQ/3EYMTtomf7oWSjb1RzlsNIl6VxOE/gdZX2PGel/RE+C6/eKsylUvPp89nOyKi/B/rDRoofe
	/HC6eFX1nxIvfWdNFbuxl2yTQZOwtO6P31lljPk5ef9c87mCiTkoyFvUAZGvll2+BxVss95ZtotFl
	8epdh+v00KKkSA6H7wDlOLrwH7vMbWEwBn/B01+r+xPA+jrLON/JiRyHY2OdhD9yWF0Hy+LLCWCO0
	cxv87vog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwZi-0000000AtJ7-0x4O;
	Tue, 10 Dec 2024 09:30:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwXG-0000000AsFi-0Wd0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 09:28:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7082A113E;
	Tue, 10 Dec 2024 01:28:33 -0800 (PST)
Received: from [10.57.69.139] (unknown [10.57.69.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C5B73F58B;
	Tue, 10 Dec 2024 01:28:00 -0800 (PST)
Message-ID: <75a345d4-78ea-4434-a4cd-3f2095ce2b31@arm.com>
Date: Tue, 10 Dec 2024 10:27:56 +0100
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
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20241209102440.GI21636@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_012806_195777_FB69F095 
X-CRM114-Status: GOOD (  11.01  )
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

On 09/12/2024 11:24, Peter Zijlstra wrote:
> On Fri, Dec 06, 2024 at 10:11:06AM +0000, Kevin Brodsky wrote:
>> If CONFIG_KPKEYS_HARDENED_PGTABLES is enabled, map p4d/pgd pages
>> using a privileged pkey (KPKEYS_PKEY_PGTABLES), so that they can
>> only be written under guard(kpkeys_hardened_pgtables).
>>
>> The case where pgd is not page-sized is not currently handled -
>> this is pending support for pkeys in kmem_cache.
>>
>> This patch is a no-op if CONFIG_KPKEYS_HARDENED_PGTABLES is disabled
>> (default).
> Should not this live in pagetable_*_[cd]tor() in generic code?

This would certainly be preferable but it doesn't look like such helpers
exist for p4d/pgd. For p4d, we could potentially handle this in the
generic __p4d_alloc(), but I'm not sure we can assume that
p4d_alloc_one() won't be called from somewhere else. pgd_alloc() is
entirely arch-specific so not much we can do there.

- Kevin

