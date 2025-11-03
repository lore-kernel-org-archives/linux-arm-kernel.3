Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E5ECCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9sAcUtC3H99LGi5c5vTc31vswFYXuBu5HaI39PYNE9I=; b=iZ645gy++ptbKZoQkjQ8r9smMY
	Mu0jhc0GxaXd0vY4+9DhqfRJMd9Bs6ODOxNGJbFUZnGW55uI20ZGTZhfkDoSxBri+pgTOCmVb+KQu
	KejcF0BmxsjkUo0wNIVv7Sxav6k9tLtmH4woZr8RzgowGJuWlkDlLcDtTH4HCMq1abyaErrWSzE5w
	vPdDDYIBXjjjg22qv+v6PLXdnCQYmGNekFncVI7+mYfizAkJaFJbrO+jf5m6YmQFYBtmi5Ovn8Sfl
	LAXIB1N47tXsZ9x8Y83C2av8q7HE+YAKhwMcG+YUYhntzFFLTHpmMS7AHODAx3KMJcPrSQkSZ2O5M
	Eqx59FCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs0R-00000009eLp-1UC8;
	Mon, 03 Nov 2025 10:41:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs0P-00000009eLB-0yQ8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5453419AD
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 10:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AA9C116C6
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 10:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762166503;
	bh=ywHCDC6f70q+FVeVwqunZDaffuR4I1EUWoQ0AifeUk0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i2KRnNo2nLgcp0ju0M1YrqrrexGDv0pjZAm+p8PP1D261hfxiH2VgDYYQtWPFU2eI
	 vBJHYNtTXvQbSMZmuLHeH3BYZImua4W5iYahjt3wCb4QEyxFQsI7R828b9e629QRrz
	 p258VQ3CXkGgr9KV8bV33bgSUlajM+1x+0z+vVBOyZvM3bWdOvTBpJKmAFTqwd7tuV
	 +ua0y5c7vVNHkd8elgkQvqUZD6JPebbB4Crsy9GESsxWKr+0FQ2GEOMV6e2UPy4pfz
	 lebJv5yHWL82ORvjgvAHTq8hn3qpbCYLW/5yfI59Z2YHsxyTwFONfK9t6BKmh98Uhl
	 3MBVwbqH0QUSQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37a1267c45dso35390731fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 02:41:43 -0800 (PST)
X-Gm-Message-State: AOJu0YxIsOrX1RGZv5IAXVPqaqV1NKy3e2uBfhPYKvsWjEyXVZfIR0CB
	bRIDA/zAOgRdwEnHShK9Po0YDnkzyGimmyzZ8QlnO4YPQw1ZLMHLbsG8HdSRxKaw++E1kwA0Gph
	XJ4cRyG6F9ILBGozluPFLhme2bIHQaYw=
X-Google-Smtp-Source: AGHT+IGkM8viXJNBlQ80+5YfdV3jjNXsEEVUkp5Q6j2EjUrf25AVLVkvSj9qeEV5Pd0r/i3Y1KW9dhFw83oDj2eOFzM=
X-Received: by 2002:a05:651c:2103:b0:37a:15b6:f35b with SMTP id
 38308e7fff4ca-37a18d8ecabmr37322841fa.2.1762166501972; Mon, 03 Nov 2025
 02:41:41 -0800 (PST)
MIME-Version: 1.0
References: <20251103101545.760243-1-bigeasy@linutronix.de> <20251103101545.760243-4-bigeasy@linutronix.de>
In-Reply-To: <20251103101545.760243-4-bigeasy@linutronix.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 3 Nov 2025 11:41:30 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEv2iZ7UOiG7OSR3KQVguFtASh5yhpxMTXzuiZTOFz7_Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmpyUNLlkLPqZocz3nncFM6nY6pwBfeKiZVNBLewlkUVJzl7p9usZ6XIY4
Message-ID: <CAMj1kXEv2iZ7UOiG7OSR3KQVguFtASh5yhpxMTXzuiZTOFz7_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] ARM: Disable jump-label on PREEMPT_RT
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev, 
	Russell King <linux@armlinux.org.uk>, Xie Yuanbin <xieyuanbin1@huawei.com>, 
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_024145_311979_866E4E52 
X-CRM114-Status: GOOD (  25.83  )
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

On Mon, 3 Nov 2025 at 11:15, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> From: Thomas Gleixner <tglx@linutronix.de>
>
> jump-labels are used to efficiently switch between two possible code
> paths. To achieve this, stop_machine() is used to keep the CPU in a
> known state while the opcode is modified. The usage of stop_machine()
> here leads to large latency spikes which can be observed on PREEMPT_RT.
>
> Jump labels may change the target during runtime and are not restricted
> to debug or "configuration/ setup" part of a PREEMPT_RT system where
> high latencies could be defined as acceptable.
>
> On 64-bit Arm, it is possible to use jump labels without the
> stop_machine() call, which architecturally provides a way to atomically
> change one 32-bit instruction word while keeping maintaining consistency,
> but this is not generally the case on 32-bit, in particular in thumb2
> mode.
>
> Disable jump-label support on a PREEMPT_RT system when SMP is enabled.
>
> [bigeasy: Patch description.]
> [arnd: add !SMP case, extend changelog]
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  arch/arm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 2e3f93b690f47..92ca24336ec4b 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -80,7 +80,7 @@ config ARM
>         select HAS_IOPORT
>         select HAVE_ARCH_AUDITSYSCALL if AEABI && !OABI_COMPAT
>         select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7) && !CPU_32v6
> -       select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
> +       select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU && (!PREEMPT_RT || !SMP)
>         select HAVE_ARCH_KFENCE if MMU && !XIP_KERNEL
>         select HAVE_ARCH_KGDB if !CPU_ENDIAN_BE32 && MMU
>         select HAVE_ARCH_KASAN if MMU && !XIP_KERNEL
> --
> 2.51.0
>

