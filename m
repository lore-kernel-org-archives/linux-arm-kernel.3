Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B722CD32D7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 09:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxrUQLUGDquIvwNL+3vOZkd1Knzam6KbtGh2rdlC0zA=; b=k5UJhbr0HUnLesYF96f/GxOEh0
	oqjU8qTBX6zO+6eTiDQG1lMLrRsycOImUHGQGIyERXq5zr9Znm8QZ/53RiH6relO+kx3jT0+w5zXi
	mXQfeTJrN5qxDzh74afk9lLFtXnLpkb5XgycBSKs3oeW1TKe5eoejx+xgrbijk9UgghXEU3vm0a06
	aW/xw6OiyhH0h9jFSFnOzJe7vXBp7CrzOUAW2O2fFF8tOqKZYlQl17Jvljj2pkEJtbFaXc0HbSRNL
	omFCMwfJdiM+SXFW8GXxGnp0iw9T8IZ6nj8jdnq2FUgoEe2RuwKS56NFrs9p7msNoYZ25ctbL3SMv
	wkl3a/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnYP-00000002wCG-1ZW5;
	Tue, 12 Nov 2024 09:51:21 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnUD-00000002vQg-3TpP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 09:47:03 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2fb56cb61baso39734701fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 01:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731404819; x=1732009619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxrUQLUGDquIvwNL+3vOZkd1Knzam6KbtGh2rdlC0zA=;
        b=FzvwCyYe+00axY1oHKDMmu3RwLqGRc3EsNZaoQRjzVYjR/SOJ8BblRfo0e2MJvEMbP
         SPZQjZf440B/wwtV5LQ24BRZt3p3/hWRRmg9UmmmpvFGmDMPbI5Xa0K5/EKUOgvzedbu
         fNjY4oMovOd+whxUebiz4Mp+rSH+GbvDS7xzmzR26+Z1pVgA+MwUawsgum3N2bSbOV+z
         1uQ9M9xz1czbyXj/1zlG9w7ouO6HVh/8g4VnVVeSJw6kLiob4qcGi+TxuPdA3k74BbcP
         /HtIi1VmdazJC2cpcOqWgdinVy+pb6tVem0IFS1fnDGPDacQ9ySABoRhZlhOafesI+Hu
         qhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731404819; x=1732009619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxrUQLUGDquIvwNL+3vOZkd1Knzam6KbtGh2rdlC0zA=;
        b=t/qwUw7cNAJmlsiClMmiALkrj0Mj4YPeF4r8mXfYnHZuSHGVH7Aa3qxzv9qmWhZRSs
         ATbV7r7GXnMdeAa1e5PS+BCAW2bI6Fbqn+p7m6RCB5J+G8Gz25Miww3sRFaNtXhtzPmH
         yvwTBl/KJUtzeHn96WhUl2QPn5qsfz2TPnx+t4sv5kqz5EQtEgPT/u0lvRf8yQ6s6EIP
         psAlQ9pyYGJmVuLdwSByhskmYIQVlyOzbragFMQ0mj0xhifSGRIbNoA5xibxoKrIUIBY
         AjD9NsZwG/a8WIciKI4XkObizmpbMbz+nfkVRW8yfv7IEtdWXg1KzyvPjn59uXGNSd1q
         T2hA==
X-Forwarded-Encrypted: i=1; AJvYcCUsdsboMJYOzanfQrrl5SEmBz31ot16iqtwtw0ywTQsgCfBkJK5Px20giPRB54yPElTZzVY+VTrdz9yNC7VANZh@lists.infradead.org
X-Gm-Message-State: AOJu0YxbFUlFfEQskDlXAsRC8MZ7atTlt4Sqh11NtvBJjUuQXLULEkwf
	ZcXeowsOA3/L+ECt2NuFLIpe3AOebbPqzyRNEAtQYYdKQjG1TvNb
X-Google-Smtp-Source: AGHT+IE3pBqKFb6Yk8oEomko/aK/XSjtZ84xqvYa+rvcJru0YumfUY5+WY9OLJopre3IfMt0ghRnSQ==
X-Received: by 2002:a05:651c:248:b0:2fb:57b7:5cd with SMTP id 38308e7fff4ca-2ff201e6cc1mr71712251fa.7.1731404819101;
        Tue, 12 Nov 2024 01:46:59 -0800 (PST)
Received: from foxbook (bff246.neoplus.adsl.tpnet.pl. [83.28.43.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff179d85e3sm19798631fa.116.2024.11.12.01.46.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 Nov 2024 01:46:58 -0800 (PST)
Date: Tue, 12 Nov 2024 10:46:55 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Linus Walleij" <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Linux kernel regressions list"
 <regressions@lists.linux.dev>, "Kees Cook" <kees@kernel.org>
Subject: Re: cacheflush completely broken, suspecting PAN+LPAE
Message-ID: <20241112104655.777b0578@foxbook>
In-Reply-To: <014edf04-a5ac-4a02-af76-ca2616c3c4ab@app.fastmail.com>
References: <20241111233817.2f824c19@foxbook>
	<CACRpkdYsgnBFsyF9upr=xoLdMJ25DCXMEJ-co7rJTnRanJncug@mail.gmail.com>
	<014edf04-a5ac-4a02-af76-ca2616c3c4ab@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_014701_912896_8F0DE96D 
X-CRM114-Status: GOOD (  20.45  )
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

Hi,

On Tue, 12 Nov 2024 07:41:12 +0100, Arnd Bergmann wrote:
> I would guess that the problem is not the access_ok() but
> the actual access in v7_coherent_user_range() that does
> not appear to call uaccess_save_and_enable() or its assembler
> equivalent around the lines
> 
>       USER(  mcr     p15, 0, r12, c7, c11, 1 )
> ...
>       USER(  mcr     p15, 0, r12, c7, c5, 1  )
>

Yes, this is what fails and where I got stuck tracing this code because
I'm not exactly an ARM MMU wizard.

What I could tell is that this code hasn't changed much since the 3.10
vendor kernel which works fine with LPAE on the same CPU and userspace,
so I started looking for recent changes in arch/arm and found PAN.

According to comments, this routine is meant to return an error when it
catches a pagefault, so that's what I suppose happens here and that's
why PAN immediately caught my attention.

Disabling PAN fixes cacheflush for me.

> It's unclear to me if this problem is specific to the TTBR0
> PAN variant, or if it can also happen on any variant of the
> CPU_SW_DOMAIN_PAN. It seems unlikely that CPU_SW_DOMAIN_PAN
> has been broken for this long without anyone noticing, but
> I also don't see why it doesn't trap in the cache flush
> when the TTBR0 version does.

I don't know, but I booted the first kernel image I made for this
machine, which lacks LPAE and a few other things and barely works,
but it runs gdb without issues (and cacheflush returns 0).

--- config.good 2024-11-11 20:22:16.604586266 +0100
+++ config.bad  2024-11-11 20:22:10.641511948 +0100
+CONFIG_ARCH_DMA_ADDR_T_64BIT=y
+CONFIG_ARCH_HAS_PTE_SPECIAL=y
+CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
+CONFIG_ARM_LPAE=y
+CONFIG_CFG80211_WEXT=y
-CONFIG_CPU_SW_DOMAIN_PAN=y
+CONFIG_CPU_TTBR0_PAN=y
+CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
+CONFIG_HAVE_GUP_FAST=y
+CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
+CONFIG_MMU_GATHER_TABLE_FREE=y
-CONFIG_PGTABLE_LEVELS=2
+CONFIG_PGTABLE_LEVELS=3
+CONFIG_PHYS_ADDR_T_64BIT=y
+CONFIG_SWIOTLB=y
+CONFIG_WEXT_CORE=y
+CONFIG_WEXT_PROC=y
+CONFIG_ZONE_DMA=y

Regards,
Michal

