Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923F8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAqfQAOpMlMDCw8VgFjXaKgS8Em1IBXIvmErmx2w6HY=; b=ccijecZXZ61/tZl9gzpmwlNH17
	x0yDTYUub3YRDtQFAoA1kwX296O3B4nQUZGd50mLcm7FZrhNxJnS0Ipt2ZGx86mm/Tc8opsKd/Idn
	0Zl0POQn0phBYb/SAIiSyzg4ZTEcgC3ZhGqq2Bf0s4WH2X/ciXFmii1WX571FNnq3UBunDkXvzfE9
	P1eUXdSqmqwhiHIIWMtQVEgjW5nJnWcuMMUYRNRjBCV9VXnNpY7Dh4fJQT2TY+grfnXyiIVM7sPQZ
	ELPCX2EeptP/47LKHJeteRH7117exmoset8VbmgKzJ2NdJsiyI83chJkGFKe1zHchar7oPJ9KfLLq
	Z285WGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcMj-00000006qny-1cXo;
	Fri, 03 Jul 2026 11:47:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcMi-00000006qnb-0FgP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:47:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 861C343BBF
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 11:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693461F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 11:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783079247;
	bh=PAqfQAOpMlMDCw8VgFjXaKgS8Em1IBXIvmErmx2w6HY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PiaJW733uwYb8erG29p49uhNQfoo3dgX4tI31n/7Cka2uYkC899P/0dvWym1mu/Iu
	 poc2i6mHcgT7zFGmBankKzqZLWdahpops2eopauVNQytOApiTcklTmxJl4+3up/Tu3
	 qLXVOycUKC9th+4dZhwvg3K0nHqS62HCX4epWVvvPGiKGZlDEGo1Lfxt2pciRgofYx
	 p4UkSpW92aQMmkkFzVQBy76H6y1NlsIMjle9SYRX9k4cKvLmCGWLI6LnIv7jOel0wp
	 XDF/ys6Df4nPSbTX5QGVZB6CdkMdPow4vItDPpAxtKylZ+zRcXJo3XBc76lLlYhqmK
	 OUyAeGOB6lk5A==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39b1f588471so4389901fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:47:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrpLx4+pj1JRBIO3MIj4q0EndBz1W0KscZ2oOkanf4FLFEdsVrEdV60HDlqIEBIJc05hs1lJU9H4c41T4ou/fuM@lists.infradead.org
X-Gm-Message-State: AOJu0YxbgZg8RliAQgWqNtCqxkthKMvVSQdoqXbLjEn8oF4cxECgiZbK
	D1wO7Nj67A9TI/JfoksosKTdWb7ouYsER7A68u+fl8MhctHfaecqvI6t6WbbKrAviO+UsNv2BNO
	PF8Q0NWv1GLj9+2Io9JckRZNua2UOMtY=
X-Received: by 2002:a05:6512:a354:b0:5ae:ba3e:a6f6 with SMTP id
 2adb3069b0e04-5aec67a2b83mr1899880e87.4.1783079246183; Fri, 03 Jul 2026
 04:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-arm32-cfi-bug-v2-1-9bf922593e00@kernel.org> <akd5_G5oA2dxdg89@J2N7QTR9R3>
In-Reply-To: <akd5_G5oA2dxdg89@J2N7QTR9R3>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 13:47:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLmnUX0EHpjqGc6Pk3bXr0XTp9r4+rPSNUYVwk+e0JMgTw@mail.gmail.com>
X-Gm-Features: AVVi8CfUHAbqySS7cIAW-rrONys-5i7T9Hv7PNMZ8MoGQJy-d4zcjDrgoR6pU04
Message-ID: <CAD++jLmnUX0EHpjqGc6Pk3bXr0XTp9r4+rPSNUYVwk+e0JMgTw@mail.gmail.com>
Subject: Re: [PATCH v2] RFC: ARM: breakpoint: CFI breakpoints only on demand
To: Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	slipher <slipher@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jul 3, 2026 at 10:59=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:

> AFAICT, hw_breakpoint_cfi_handler() is only intended to handle
> BKPT instructions executed in kernel mode, and even when the kernel is
> build with CF support, it doesn't make sense to call that for BKPT
> instructions executed in user mode.
>
> On arm64, we have separate paths for BRK exceptions from user mode
> (do_el0_brk64()) and kernel mode (do_el1_brk64()).
>
> Surely you can check kernel_mode(regs) or user_mode(regs) to distinguish
> the two cases, and only call hw_breakpoint_cfi_handler() when the
> exception was taken from kernel mode?

You're right of course... I'll add a check like that and see if this
solves the problem for the reporter.

Yours,
Linus Walleij

