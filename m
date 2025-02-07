Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C2BC02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 14:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snMwSaLP8lnNXVIs56gsvdEex7XhNiEE64iH6ynGayQ=; b=e+UcKe05mC+BI4YfpKwYFEBRvb
	bkBVC2snd6tebsZdvQ3Mg/6ETZC+dRROc1OlufO7pAa83VU0ucgTP0kUsIto0OG3WZcwhPUeqVZPM
	RkE9qgpL0vfZF847/yt48a3FJZZQ7i8z/LrtVx0GGHOVo7zCpEoxNhwsNVxhy/va8RGwMpG+srLu5
	MyrtlYPwfWki+np2+D7KL3Hii62WBKA1hKBSquuFIQtc1q466yBj9hw7raVxOeuM9ifcU/966fFqs
	pCck0YSKYt7nST71WjE9H6aoXAHEhcNsSNYhtUy3Q3MWr1BaHwg3mtzimpAvuBGCNxlVldDVJaYpX
	E1u7W+FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPRd-00000009sly-33gK;
	Fri, 07 Feb 2025 14:35:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPQE-00000009sLI-1nYx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 14:33:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBAEA113E;
	Fri,  7 Feb 2025 06:33:53 -0800 (PST)
Received: from [10.57.80.179] (unknown [10.57.80.179])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEA383F58B;
	Fri,  7 Feb 2025 06:33:26 -0800 (PST)
Message-ID: <69b78d77-0dbd-4257-8076-260a3c64a81d@arm.com>
Date: Fri, 7 Feb 2025 15:33:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 08/15] mm: Introduce kernel_pgtables_set_pkey()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org
References: <20250203101839.1223008-1-kevin.brodsky@arm.com>
 <20250203101839.1223008-9-kevin.brodsky@arm.com>
 <CACRpkdZ_eGsfZh2vkG8dtSyZDbStMfDUuj7s7TQ4FcDwThJVkg@mail.gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <CACRpkdZ_eGsfZh2vkG8dtSyZDbStMfDUuj7s7TQ4FcDwThJVkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_063334_515122_841CE73E 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

On 06/02/2025 20:01, Linus Walleij wrote:
>> +static int set_page_pkey(void *p, int pkey)
>> +static int set_pkey_pte(pmd_t *pmd, int pkey)
>> +static int set_pkey_pmd(pud_t *pud, int pkey)
>> +static int set_pkey_pud(p4d_t *p4d, int pkey)
>> +static int set_pkey_p4d(pgd_t *pgd, int pkey)
>> +int kernel_pgtables_set_pkey(int pkey)
> Aren't these all discardable after boot, so the whole set should
> be tagged with __init?

Good point, I was thinking of this function as a relatively generic one
but in reality there's probably no use for it after boot. In any case
it's only called from a function marked __init at the moment, so it's
safe to mark all those as __init too.

> Other than that it LGTM.

Thank you for the review!

- Kevin

