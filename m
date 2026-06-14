Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BCACD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 11:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSovo2PZqoPUZzCz7TwsyL7/LMkogfDdhMF3mspVec8=; b=C7H/88pVrkv9WuEp3RCXw4GcDH
	uKuL2dr+ws089tkdkEePtznGOxfHPG4OeEuVBaxSU/bdW3JzkCU4dJmgkKVbgL9N75cy55rS5xvcN
	VG7iRdE8ZPyNjPBDDUvVWhWTfYaCS/ij8ukQegZQrbnQlyxkbf+9lfkIq52ld9f1Q5kxzdP5K0HVn
	5eT4b2IH9KIKYmRQ8ci3azyWgpZs2YRjUKatDTF1I3137YTelerLm/QK9wRL5m+Sxv8v15fjuLFUt
	HXB0jydFXy3RX+gSayflxgcH5hLwGVUDNjzknbOPGaL+AOrsIEdf4+1x//c6SkAItSjkPffUUP06Q
	wU1XPJww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYjUW-0000000CwSZ-1NxF;
	Sun, 14 Jun 2026 11:59:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYjUT-0000000CwS7-32nw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 11:59:02 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-45efa80e0afso1930687f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 04:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781438339; x=1782043139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSovo2PZqoPUZzCz7TwsyL7/LMkogfDdhMF3mspVec8=;
        b=aaOkQkSE+/fQWgOKITmMAaZjAC6DF2dAwQ18i06BC0wT2nfiog5ereJsttJnMRLDe7
         ZeYdMTU9OmHcaS1tBmR2/6k5xnqcF3AWG9Mf9JK1kBN3XvCGwbxovu57OpiG5n3LAQJ1
         R9oMnGNr8iFPwMIxgWGM6XEJyFajTOG4CvmwoFOnyPAx6yGfDDZHV4vcgfO2PEtNgvHt
         2CKEtqzs6A9FbWW0csIdogey094Z0EP1/mmgAcozMiIuDoX9Drapa8J9nie9WZtKHt9z
         qnXrq75FrfsjOk5fgCWRa0rGOGWruKRiepkY21oNeRwYbX0dVzC9LCmptqTqmRuM1Rd2
         0Hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781438339; x=1782043139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSovo2PZqoPUZzCz7TwsyL7/LMkogfDdhMF3mspVec8=;
        b=OnubFyPy9vloYJ+D929/fhWDmfE0LwfLVN8y9YSi9TgYssixuEecUArog+gikt17iO
         RuWvqAKgd+5WI5NrP9ctZQ0FA6kB7vVeoYIliFkXFPftxXHL/bUVz1KI9x/utvpa0e2d
         BU65LAiOPBU6KTkK+IP12WaB/2ttloEBCGGHaGOJ1ylMLwxvBeMuYfZkcqlglxy5JYNi
         LHyeLMvDOF1ck+cdxB0LVz5uHAU/4fxmmvohSvsn0PzGMdyHylB+xe4CinMJZ+OXU/u8
         QFKkB6CoY9qwIyZyyj0JAeckCubqV8aT15M8bAZwEXiLy2QLgBs7XKc808gx43dM6Pir
         J+QA==
X-Gm-Message-State: AOJu0Yx8+zzaNFpLcmz9YRtgWMWTHmSIorWVDdBT3oPYOjVkavQYj4s8
	CsjR8plIpcNlORQXYYNslxKDFU7svES/9lxz+8zf3Wryz6JfUt82F9d9
X-Gm-Gg: Acq92OHluCj2Qx/9SsxsKt0s9d2Majb8MolnLGxAcD/lKvMVee57O+hZzL4bH6do1QA
	axmes6ElsvRm1pfRK5SvwUtJMVxcC6Ivzvrz5KCGvtd5X/+iVaiYkkp9HReIjZRmDeLtMLDAmG8
	rQ+ie1cib6mBctfN3babRoAueG+AihgBMAdV1zZEjXUKs4S374oDjSQ4FUCkDEorBs6MWPMQ3W0
	tgIygLrfB7KAW8iR2jhQksd4fnwCdEyzy5VcJqlFxg6uz1WwYnuUaPT/lR1zFScVg1Pm/PEkhaX
	mJ3uMtVSO0zYub3SyNT61fd7+ZOoFNJfaHssYpLb2LGnaXzsRohz5A05/yBILCxQzuBjP572Bsw
	Iz7NT17Mb5Gaap9OEYe8qkVbfcyjA4ZrwGlMIpmRMS8mOStcmcqF1AzWqdOFHBueMG/eaL8Eltr
	54jp0+PY0NKKyEFsRHOjZrpNEJsR5/xgWVk0wV2+bK7iT2SxQ5+zyABqjl9lKn
X-Received: by 2002:a05:6000:4912:b0:45e:de0a:1773 with SMTP id ffacd0b85a97d-4606dbf15b7mr14210900f8f.33.1781438339050;
        Sun, 14 Jun 2026 04:58:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm24759410f8f.22.2026.06.14.04.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 04:58:58 -0700 (PDT)
Date: Sun, 14 Jun 2026 12:58:57 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Russell King <linux@armlinux.org.uk>, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linusw@kernel.org>, Kees Cook <kees@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Thomas Weissschuh
 <thomas.weissschuh@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Shubham Bansal <illusionist.neo@gmail.com>, "David S. Miller"
 <davem@davemloft.net>
Subject: Re: [PATCH] ARM: disable broken eBPF JIT on the Risc PC
Message-ID: <20260614125857.398a0e13@pumpkin>
In-Reply-To: <20260518014920.135011-1-enelsonmoore@gmail.com>
References: <20260518014920.135011-1-enelsonmoore@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_045901_808715_2C9DADE7 
X-CRM114-Status: GOOD (  19.77  )
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

On Sun, 17 May 2026 18:49:17 -0700
Ethan Nelson-Moore <enelsonmoore@gmail.com> wrote:

> The eBPF JIT unconditionally generates ldrh/strh instructions, which do
> not function correctly on the Risc PC because its bus is unable to
> signal half-word accesses. Work around this issue by disabling the eBPF
> JIT when building for ARMv3 (the Risc PC is the only currently
> supported ARMv3 machine).

Isn't it more the case that the ldrh/strh instructions were added for armv4.
Whether the bus supports 16bit accesses is entirely different.

I'm guessing that WRITE_ONCE() gets implemented as two 8-bit writes and
the code 'just hopes' than an ISR won't care and won't do an update.

	David

> 
> Fixes: 39c13c204bb1 ("arm: eBPF JIT compiler")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  arch/arm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 1155c78bb6aa..8185d013e5d1 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -98,7 +98,7 @@ config ARM
>  	select HAVE_ARCH_TRACEHOOK
>  	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if ARM_LPAE
>  	select HAVE_ARM_SMCCC if CPU_V7
> -	select HAVE_EBPF_JIT if !CPU_ENDIAN_BE32
> +	select HAVE_EBPF_JIT if !CPU_ENDIAN_BE32 && !CPU_32v3
>  	select HAVE_CONTEXT_TRACKING_USER
>  	select HAVE_C_RECORDMCOUNT
>  	select HAVE_BUILDTIME_MCOUNT_SORT


