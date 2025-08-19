Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BD5CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 11:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZciOKLRsCJe6+CO8UzeOSGDAbt35EFDJxrVlWismP8=; b=RdBZbPgmqOx0tmGvVY+buRyZX0
	guOxDaQgflO6GkT+kiY+tdbOxuXxZulW9GAYxGyftXbi5f59BSDk7gVUV1gNDPVJI2N5dkcfu/W94
	2QXzgOvLq1Jk20YGy4myzuzQoF0YROS7GNcQ9ChXzVgz9xmU+bjReCKlj3dZhVsl4hsAElfAyVMcc
	nYQFpH9mLbzlOaTFOUzuWeos7tTgHx3XIC0cKBX/TmNB0IAYXryBKGO80p9zGRQNEYtZ4jFWknLLT
	8j9Upmdl8/NPGB47qK6fEbRrOiAqsgkhBaKGyb8/cqcI67TC2bQrW4aaLiuN5K/Z85vkcwi/7UKhh
	Cm0a0d4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKNU-0000000AFt7-29U2;
	Tue, 19 Aug 2025 11:19:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIkN-00000009ysz-0wqk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 09:35:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CE351BD0;
	Tue, 19 Aug 2025 02:35:04 -0700 (PDT)
Received: from [10.57.56.191] (unknown [10.57.56.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4496B3F58B;
	Tue, 19 Aug 2025 02:35:03 -0700 (PDT)
Message-ID: <e4f546cd-67c0-4198-975d-266a7cb9807a@arm.com>
Date: Tue, 19 Aug 2025 11:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 13/18] mm: Map page tables with privileged pkey
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Cc: "x86@kernel.org" <x86@kernel.org>, "maz@kernel.org" <maz@kernel.org>,
 "luto@kernel.org" <luto@kernel.org>,
 "mbland@motorola.com" <mbland@motorola.com>,
 "willy@infradead.org" <willy@infradead.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "david@redhat.com" <david@redhat.com>, "rppt@kernel.org" <rppt@kernel.org>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pierre.langlois@arm.com" <pierre.langlois@arm.com>,
 "Weiny, Ira" <ira.weiny@intel.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "jeffxu@chromium.org" <jeffxu@chromium.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
 "kees@kernel.org" <kees@kernel.org>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "jannh@google.com" <jannh@google.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "will@kernel.org" <will@kernel.org>,
 "qperret@google.com" <qperret@google.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "broonie@kernel.org" <broonie@kernel.org>
References: <20250815085512.2182322-1-kevin.brodsky@arm.com>
 <20250815085512.2182322-14-kevin.brodsky@arm.com>
 <616011cf17f1654ac3ad8757f0f33425b3af1ddd.camel@intel.com>
 <b6579c2a-2262-4279-81a5-8235092bea13@arm.com>
 <c8196481fdd338e9d066376b6e9bf1dfcd6ea462.camel@intel.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <c8196481fdd338e9d066376b6e9bf1dfcd6ea462.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_023515_334362_898EDFCB 
X-CRM114-Status: GOOD (  14.07  )
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

On 18/08/2025 19:01, Edgecombe, Rick P wrote:
> On Mon, 2025-08-18 at 18:02 +0200, Kevin Brodsky wrote:
>> The benchmarking results (see cover letter) don't seem to point to a
>> major performance hit from setting the pkey on arm64 (worth noting that
>> the linear mapping is PTE-mapped on arm64 today so no splitting should
>> occur when setting the pkey). The overhead may well be substantially
>> higher on x86.
> It's surprising to me. The batching seems to be about switching the pkey, not
> the conversion of the direct map.

Correct, there is still a set_memory_pkey() for each PTP.

>  And with batching you measured a fork
> benchmark actually sped up a tiny bit. Shouldn't it involve a pile of page table
> allocations and so extra direct map work?

It should indeed...

> I don't know if it's possible the mock implementation skipped some set_memory()
> work somehow?

In fact you're absolutely right, in the mock implementation I
benchmarked set_memory_pkey() is in fact a no-op :( This is because
patch 6 gates set_memory_pkey() on system_supports_poe(), but the mock
implementation [1] only modifies arch_kpkeys_enabled(). In other words
the numbers in the cover letter correspond to the added pkey register
switches, without touching the page tables.

I am now re-running the benchmarks with set_memory_pkey() actually
modifying the page tables. I'll reply to the cover letter with the
updated numbers.

- Kevin

[1]
https://gitlab.arm.com/linux-arm/linux-kb/-/commit/fd75b43abb354e84d06f3dfb05ce839e9fb13e08


