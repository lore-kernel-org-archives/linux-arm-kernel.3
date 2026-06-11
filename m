Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6BACD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 12:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owBBxTmvRRiYJTmyDYOVDNQMmnMPZCmfdiOT84fn6U0=; b=ctRF/0/g83xXhLZHoO8rcH7QWB
	s3IrF1EsC/tcpTeIH9T6n531SSwxlVArefr8/lg3Qgwqz9hPE8rTwvmnBYMPvf2PAEfg/Qwa9/k2G
	sAgD0q1WrXIBFfLU5CrMu2sZW+IWW6OgY3TZ/QmAPQ1hkEIf7ErtJ9mM33kbt/XYqjA16bom1zL9+
	EfVW/9Z1Upe6AJ9TWt9MtGa85SDkUnkkZvE0ngSyjRE0l1RKBnCEdHeveKzwOh7WvKACjoNsZj+Mf
	sYIkZEDtooBdrv7gcUzBt74FIujLTo+T+0WWiySZgD8SjNLI7OP+shSjp95wS8CLogec2JHGh1xzs
	ZSOkLM8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXeg2-00000009Q7X-0gkR;
	Thu, 11 Jun 2026 12:38:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXeg1-00000009Q74-1B5H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 12:38:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0137A442F8
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 12:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D845F1F00899
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 12:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781181508;
	bh=owBBxTmvRRiYJTmyDYOVDNQMmnMPZCmfdiOT84fn6U0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m+dxvwGWzjjQwmYa86A3fsbavh6gY0P5a+NiirLIlKuB3wRTfwWtOGo+O6why7gtA
	 /2XbvbffiR7JQFZz4sFB7iXO0kqu4OwpBnxNlxgCBG4VFZnvDFUwv0mSYsyf30YFlw
	 TrVYoWwsfrPepwbAPT2Z/1Pvi8gbxgpzTgFYqT858L7zjjcFP6cbi909gZZ+4T0JnR
	 gewij0mYXn8bsneyhFy40+tPM8NSgb1KapENhzRghJ0YYnmuKpbrAs0QvO9E6tNcdJ
	 FOkVszmfwZfzIpeZ+xyVWrCCG+Bpiuq1jzvOfTQBoOS1OWzxqfgDMhqPQ5KafAPpos
	 6oR23JVVa4qNQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39666aac20cso59381911fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 05:38:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YzTDHb3+GT0RcYDFh++UF2LYEkU4hX6Hwwiok//7Iavn1Lht7In
	WFQJab+v/bZAAE5XZ0wSPF70VPumogsTQ1ifKNpoyx/1YfAR0qP/tppSOnYxptzbXg2B9WRCGjY
	bij6np0dED/vlEO0F3V9Zx4fahNd2/+Q=
X-Received: by 2002:a05:6512:250e:b0:5aa:8822:b875 with SMTP id
 2adb3069b0e04-5ad27fba618mr914171e87.47.1781181507622; Thu, 11 Jun 2026
 05:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260611004700.395759-1-enelsonmoore@gmail.com>
In-Reply-To: <20260611004700.395759-1-enelsonmoore@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:38:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLnD2EU=YfABb1ySRtgeOPVzQKH3iMjZtj2AsW+RK8M6mQ@mail.gmail.com>
X-Gm-Features: AVVi8CeWaQRs6OD0fjTRubeNODMGoLh-fwJtQ_OHVuMnQkm2SN7cEndQbFdkJbc
Message-ID: <CAD++jLnD2EU=YfABb1ySRtgeOPVzQKH3iMjZtj2AsW+RK8M6mQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: remove references to removed CONFIG_CPU_ARM92x_CPU_IDLE
 options
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Russell King <linux@armlinux.org.uk>
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

On Thu, Jun 11, 2026 at 2:47=E2=80=AFAM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:

> Several assembly files in arch/arm/mm contain comments referring to
> CONFIG_CPU_ARM92x_CPU_IDLE options, which have not existed in the kernel
> since 2.4.21. Remove them.
>
> Discovered while searching for CONFIG_* symbols referenced in code but
> not defined in any Kconfig file.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Please put this patch into Russell's patch tracker.

Yours,
Linus Walleij

