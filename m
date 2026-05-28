Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6932CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 12:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOsam8NjoAr1MmJMyDY/LLfJ9CvvvTbgnZHck1lUMzM=; b=lOF+e1VKT10Q4bekyt34ULTIjc
	VEmou/Mui4cZYM1ebkM3LR1UB2dJBdbx5FNUU6q1RnwsfmlZfz6jexnlKO2xFxmILZrM1rn2nVQOj
	w6d4NbELJU6oZ0E9zbDC2eywtv/p9/Bf7pa0O4uCy9lhoYnrDf0v9QtrL0FtKSsJKwMGJt26ufCGP
	oahpSjpnMHE0rStveqVmSoy5wdCs41Ifa21yYiqS6yq7ru1EgwhbeCLjIebVAjBmr75qS5NnzQg7y
	MOraUz1Z2AtpkhQET26U3Bm2UCRJfaxDUj4+onYXOHvYB2/I6yCAlNfkHmgPpRAuIIol2iisKoVQV
	cd8trEBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSa5s-00000005jXn-1Bek;
	Thu, 28 May 2026 12:44:12 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSa5p-00000005jXQ-1Qvb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 12:44:11 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-4905529b933so43652015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 05:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779972246; x=1780577046; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JOsam8NjoAr1MmJMyDY/LLfJ9CvvvTbgnZHck1lUMzM=;
        b=K3eQKrcio90baPJtpDewscS1CD2cgqOzJoARl9QheHIoW36pcuEdFQ6KQICktbukJg
         NMS7ObzFHGd4LXauPC2cPNKqxgUClUACan5Rz9vHoVMUJGovEbkgW1L91J5+yjvbMXET
         ObDLlkcG6lTeJujpTVKUtaAWtS0rrd0KpkodUtS60cTQY/ZTPUyWyeU2Q4RLrJbumAr0
         vpM5YEHrBwSsd++3jHldaTYKSy6jNVroEdEYQxb9TAC9YwzHFv6LgAvzXZRCiGvAWQsR
         SpXXnS0wqSdnQJJGJ0swTUOCsFodTb0l2c5azVrL+ZNfGUoy1PB92BV85O/avGWep3Ap
         St8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779972246; x=1780577046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOsam8NjoAr1MmJMyDY/LLfJ9CvvvTbgnZHck1lUMzM=;
        b=Z+9HupxjzLIDuXhZ5OKXc5zAyAEFvHhKbAz49pJC0HxO+kGlEYxW86DkbF8rloL2pI
         Fe9rgh0pDNgS4F4JxcpY3qnuT7d2Zq7FAO36TIXaZjh4/aImRONnux1AG0SDR16nfiBm
         68VK565MBE7bBMT8iAZ51d7bRihAzG5ZJsUzADXvuw2MXwCEaRu7F3glpFv8r9re/PX4
         btzXL+V9lMssf2Kd362itwj1v45AYzSz9SFUeDOpeWQi9iFKJT0CUB8P65gL5YZ1oh7u
         mh4gyGHwIWc2D0YmivH34H/AsFUVIB53TqcPzIzbRKWPW8KxzAZWaKBaJawTp3XsAdwT
         d8zQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zCNPDWXBqKzMV9jCC6rsoOkvFftBkf80qXX5GSng9YINH1dpQS4TjZnrHpNBua/n5jG/QvxIAGJUOvLISwlcK@lists.infradead.org
X-Gm-Message-State: AOJu0YyjtpWitWneZfnuvHkCyGK7BJHrEXWUXr0FQvD1O32chb4OceYv
	RXdctUqBMYS+X/1qY5J9XzkXyfCVzV5bb3dExpIs+cMB9Aaf9ibspywLSc3P7J+o+bI=
X-Gm-Gg: Acq92OHolFiJrlzq2lY34QtXrqmoNex66+qKDTgoC2Ipb4oSK17U4qO2Cxg5DvVuphk
	XG+YLRZGaTGMpB2cy/00dBRYV33aPGcsTf11p+YeraztzNdpLlVb1HsSLLVOlbsrgWz6n+4SPrV
	3I/r+hxEIRXue9HQLhgo0HrmBWus9YZae9kVUwVV0NPhhHx4pJ03TQjGfm2GFR/OdAC8nl9FF0j
	Me7tue4PNqKrOUGOHxdml+Jmp4+AnOUIOO4RkzSXGsYzlX/M4OROUjzSrYx1plxRgIn1znjCwos
	E3fG9+j9iHq7wGwHRoN0ydI4+YzrGFR86WlJ+MWKoRQh+9FOKWDZFNOw+tXXH9ielVAuIbU2J9i
	P4E+++07zacqXkcYPgfuNeYMoroKkV082+mjQLdlALUNmip3OSl+KZgUvndGoFiq0QohKVWYKDV
	GHHyDGt9kwDyZqLDfLPAx56i6l84Q1IjZRmgmogAk8GDDhi4jrHhrX6leAJHFtSeQLyQ==
X-Received: by 2002:a05:600d:8444:20b0:48f:e230:2a21 with SMTP id 5b1f17b1804b1-490428ee28emr338403185e9.32.1779972246309;
        Thu, 28 May 2026 05:44:06 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5579b8sm13618311f8f.9.2026.05.28.05.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 05:44:05 -0700 (PDT)
Message-ID: <a1bd5c1f-bf45-4eb1-a790-936fa13bc8b8@suse.com>
Date: Thu, 28 May 2026 14:44:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: module.lds: fix unwind metadata for merged .text
 sections
To: Egg12138 <egg12138@foxmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>,
 linux-arm-kernel@lists.infradead.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_69DC6E2A5B77E4D567CA4F552DD3A835590A@qq.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <tencent_69DC6E2A5B77E4D567CA4F552DD3A835590A@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_054409_404386_336DA210 
X-CRM114-Status: GOOD (  22.69  )
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

On 5/21/26 5:57 PM, Egg12138 wrote:
> Commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN,
> and related macros") made scripts/module.lds.S merge module input
> .text.* sections into the output .text section.
> 
> On ARM, the paired unwind input sections keep their original names.  A
> module can therefore contain .ARM.exidx.text.unlikely with sh_link
> pointing at .text, while .text.unlikely no longer exists.
> 
> This is a valid ELF relationship, but ARM module_finalize() does not use
> sh_link when registering module unwind tables.  It derives the target
> text section from the exidx section name instead:
> 
>   .ARM.exidx.text.unlikely -> .text.unlikely
> 
> The lookup fails and the unwind table is not registered for the actual
> .text range.  This can make module stack unwinding fail with:
> 
>   unwind: Index not found
> 
> Keep the ARM module unwind output names in sync with the text sections
> that scripts/module.lds.S now produces.  Coalesce the .ARM.exidx/.ARM.extab
> sections associated with .text.*, into the
> stable output names expected by the existing ARM module unwind code.
> 
> Fixes: 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros")
> Signed-off-by: Egg12138 <egg12138@foxmail.com>

A Signed-off-by tag should use a known identity, see
Documentation/process/submitting-patches.rst, Developer's Certificate of
Origin 1.1 [1].

> ---
>  arch/arm/include/asm/module.lds.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/include/asm/module.lds.h b/arch/arm/include/asm/module.lds.h
> index 0e7cb4e314b4..dc9adf8fa50e 100644
> --- a/arch/arm/include/asm/module.lds.h
> +++ b/arch/arm/include/asm/module.lds.h
> @@ -1,4 +1,12 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef CONFIG_ARCH_WANTS_MODULES_TEXT_SECTIONS

The Arm architecture support doesn't select
CONFIG_ARCH_WANTS_MODULES_TEXT_SECTIONS, so this #ifndef is not really
necessary. I suggest leaving these linker definitions unconditional, or
alternatively use '#ifdef CONFIG_ARM_UNWIND'.

> +SECTIONS {
> +	.ARM.extab		0 : { *(.ARM.extab .ARM.extab.text .ARM.extab.text.[0-9a-zA-Z_]*) }
> +	.ARM.exidx		0 : { *(.ARM.exidx .ARM.exidx.text .ARM.exidx.text.[0-9a-zA-Z_]*) }
> +}
> +#endif
> +
>  #ifdef CONFIG_ARM_MODULE_PLTS
>  SECTIONS {
>  	.plt : { BYTE(0) }

Besides the above nits, the patch looks ok to me. Please don't forget to
put it in Russell's patch tracker [2].

[1] https://github.com/torvalds/linux/blob/v7.1-rc5/Documentation/process/submitting-patches.rst#developers-certificate-of-origin-11
[2] https://www.arm.linux.org.uk/developer/patches/

-- 
Thanks,
Petr

