Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FE1D3ABCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 22:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8EbqN93yd2UWhay6/ImNRFz/xr1NIW/Z+LUt+/wm96k=; b=Os9fWM3zkixaaBZZ7y9Z5jTP9N
	wslGel+7zFgZfhahaigjksNYHFbwxsEXxmoLIcKD+7us+rlThaDpD5X3eRWCz0E7X8WFbzFwPgoaE
	QwUf/TyC2i5SK3OZ8GEKtuve8bMSnfPosXiCvVLl/rBs72m+h9v3Ltc7Z+wOK02ea7w07BqACIrbZ
	gtJqbE1NL/83i3lHKNadu0nh4HteIex4omn2OKsAz9kdk9ogUzTx6VVbC76kKHGfjCiBriSn4iGoo
	Gm7efEiuRT1FHlsB84JRYkuGXOKkB9kkguv4N/LJF6ydWlCcHry4PBC7KGUMu2ffpUY5ncRo16j80
	yjhze8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAd51-00000001XVd-1ImH;
	Mon, 11 Nov 2024 22:40:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAd3F-00000001XBq-44v9
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 Nov 2024 22:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8EbqN93yd2UWhay6/ImNRFz/xr1NIW/Z+LUt+/wm96k=; b=SbIWmHfsOanDX4rUr/YPcyQmq4
	DI/aPzFtVa32WO9eWIBe0q/+3733JuDql3GHINxo+/Kx3HjKFX8kOve34l+lwYhj0UZRqybllLiRD
	MbVa2fLkRSmQOiKPDczoxenNMIS16+HpBt82B3I6+Myv4pQLCfTHgEaVklbdxdYlxYSNdVk9OU3Db
	GGAMXOTKjtWaWdkC1y397SB0HZ8N3vYmkYsjdv47NLonKNy1votf0Jmmj0EKwT4hxcIZJaV0B4Q9K
	yZHl2GC6fJdAP53HhsPQ05ed3rew8rCIA4a4HhYAsiezAqqEUA3qhrqqfjCaSrgDc/6YHpe3nqYj4
	EydHznBA==;
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAd3C-0000000Cwxa-29Am
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 22:38:28 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53c779ef19cso5951958e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 14:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731364703; x=1731969503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8EbqN93yd2UWhay6/ImNRFz/xr1NIW/Z+LUt+/wm96k=;
        b=NGPoxMMxmWCQRb2p8X+Tt0aSV3Rwp/nfNoJmdq5D70B0igDzhBa001ioKJg2uKgppL
         MjDh2cuVFmGn6zlySfNUxYM3zwywIBUyYbkFr5m0nrYeoyPrSoFvgi9eFq+tE55KWWef
         aGDgn2cHiO8UfE/Iv0ODIfvPmsPbgX5nGjN/CsIG455XxsLBxI0Sbiqr/MeizmGNt7XT
         VjGe970kZCi+W96qTlm2TOvQXROgwtGTZNmXFzlEr4RMn54WI1yBzNq2q2+jEZ5SVcO8
         fbmYrXg5q7nMoZ4sM4KKOwiDzQg3xtcwfQgPspHAGHYhAnMZmSgEZnYmxTg6ylggVkOM
         pYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731364703; x=1731969503;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EbqN93yd2UWhay6/ImNRFz/xr1NIW/Z+LUt+/wm96k=;
        b=CUnDwX+iHgvCuN2SYx9vIu1kCiHAIhfKLtgiRAcspYQBlULOGVwb+lr0ZdimbSS0mZ
         PT7OB8CjMTUdSf0t+S07t/dlPkhbDzYT2AM0DpPko1eFvM/zJPXb3VMmSww3Z6j9ur3y
         Ub6XxgqqYj0/gFckaarQj9qg4NCHDC+KkxWS7fiJrM8iGZOzN2So3Bu+N6vviMNS/VEJ
         +AoCKueM5NtQWK+3C2HE4oCMkcjSxHeBy25Cn/MYW81ZvF+mJdManDOtOG0By1Kk0Pvu
         NXXOieesqmuPzq5Xj4TznALxmmK9nM5WCuLH/QF48SwKw5A0s9oO9eEpqzHq1Bp97hSf
         FiTw==
X-Gm-Message-State: AOJu0YxTvmFXhADIXXmTKj4B32WIs01ZCxktbB86K3eUWm8K02du0al2
	6tV/MBBWXoyKPWyPGnaeDNOcWNlbTBGdbk6cttwmOvnKkO+iXMyxKL3GQg==
X-Google-Smtp-Source: AGHT+IFozeSO1uP5AxxxtRE0XJzMCBfZblj4zdTGf1m3Jb114n9eoBjNlvPbihoU769OkbunHeHDhQ==
X-Received: by 2002:a05:6512:282a:b0:53a:40e:d55f with SMTP id 2adb3069b0e04-53d86289b09mr5832001e87.15.1731364702444;
        Mon, 11 Nov 2024 14:38:22 -0800 (PST)
Received: from foxbook (bff246.neoplus.adsl.tpnet.pl. [83.28.43.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d8269a86dsm1718742e87.31.2024.11.11.14.38.20
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 11 Nov 2024 14:38:20 -0800 (PST)
Date: Mon, 11 Nov 2024 23:38:17 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Subject: cacheflush completely broken, suspecting PAN+LPAE
Message-ID: <20241111233817.2f824c19@foxbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_223826_689944_02A585AF 
X-CRM114-Status: UNSURE (   9.73  )
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

Hi,

I installed v6.11.5 on Tegra K1 (Cortex-A15) with tegra_defconfing +
CONFIG_ARM_LPAE + a few drivers + minor patches for driver issues.

gdb segfaults on startup, strace shows this:

openat(AT_FDCWD, "/usr/lib/guile/3.0/ccache/ice-9/psyntax-pp.go", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 11
_llseek(11, 0, [477309], SEEK_END)      = 0
mmap2(NULL, 477309, PROT_READ, MAP_PRIVATE, 11, 0) = 0xb378a000
close(11)                               = 0
mprotect(0xb37da000, 43512, PROT_READ|PROT_WRITE) = 0
mmap2(NULL, 262144, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb374a000
cacheflush(0xb374a000, 0xb374b000, 0)   = -1 EFAULT (Bad address)
cacheflush(0xb374a000, 0xb374b000, 0)   = -1 EFAULT (Bad address)
cacheflush(0xb374a000, 0xb374b000, 0)   = -1 EFAULT (Bad address)
futex(0xb6f0bb14, FUTEX_WAKE_PRIVATE, 2147483647) = 0
cacheflush(0xb374a000, 0xb374b000, 0)   = -1 EFAULT (Bad address)
cacheflush(0xb374a000, 0xb374b000, 0)   = -1 EFAULT (Bad address)
--- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=0x4} ---

guile is apparently a scripting language with JIT compiler, disabling
JIT resolves the crash, so cacheflush is a big suspect at this point.

No apparent valid reason for those failures and no recent changes to
cacheflush handling that I see, so I searched for commits touching LPAE
(perhaps the most uncommon part of my system) and I quickly found the
ARM_PAN feature, which claims to monkey with page tables. Hmm...

Disabled ARM_PAN, cacheflush returns 0 now and gdb crashes no more.

So I guess it looks like there is a problem with this feature, perhaps
a missing "permit user accesss" somewhere?

Thanks,
Michal

