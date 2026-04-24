Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A555DFB44C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaAr3D/sJYJM9KUktaMmbaJQ4TAUVyyqdpjSR1XE7gg=; b=kYdautGfe/ISIC8pn4T+JU++Ug
	YZ+OvAdt0rrtZAdeCrKfmqOEdYpVOyn5ajXFfSCpPMSryZx5VrzsALjtAqg4qMMelTpIKpC0lIQ5U
	oaFMSthgnMjfFhjtI9cc5KNwBDeZiN8xeU+CUTCFkXbjM3mTmC6CH/UtI+KMZupBQlVa1+aKflghz
	chdIKwMNRyGdpq+05QilqJUJNYFtxAW94UF1XDPDReXWnIkY3PYMt/lo/6wOnxlRB7nc0kU+Grjfv
	PVeUKoia6iMLXvBOcn+AAShfdR7NnIArKY87ZsXJcSXGXqA7rUJ8mRnnsrlhxy9fLUK5Uap9k35E0
	B+XPzoCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGATT-0000000CkoF-1OZ5;
	Fri, 24 Apr 2026 06:57:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGATS-0000000Cko7-0NUx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 06:57:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A5D6600CB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 306A1C2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013833;
	bh=SEr+WlmiWTO1JycrL0J1sw04K4DOCygSPT/tWDUVm/c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IjYWA03pWY1gpD6BqRC2PF0uWz1T9wIBft+Tacmzv/+oes08+XmxX2nhVIiu47+qI
	 OIOdtEnIWZ6D7EW5GqnkLS56vtU80ohCA1sca6MgmCFi1b7qJxgvdj4K98hGIcIuJd
	 qIbhGCd+CSjbyyFc/ystRkrdi+hqYC0OEZjFZO+2xtAgGKDH8qLwpBKxoHuR1OKuOg
	 o179q8kPysBwLyZsFD7DVzW2ln0jeIUHRf7cWCqpGfm86kFFATYNWq5wmrWiUfQgUd
	 L9aL1xdEdJMMacAjYQY2JgNswuuLGb2LW3s/sEbkjRphfAQgVfJNuj7Guk5JTH0Jst
	 vUy8rLjGehBrA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so8205067e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 23:57:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ryyVvX4yBo0MPRgbsA1NMR+1GTLY6iPdHMexfy/EUiaRfMtZ6eJ37C/qmjowLTK7N9hpgoGKlSAU8dI06zfYc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd/QJ0vondvZC+mfwoV32VxOpT50BJRF3FgSNTIT8Ra4jt4UCx
	MeY/Q4g1CmzbbN62H9yb6tms4CnrPyJwvLkH1CQaii7hNNPTvCLqyTuDr/No3hwWvqu9s4dVyMJ
	7qqBySjefRQsYkHScSpmTiWaeFJj5Yx4=
X-Received: by 2002:a05:6512:2248:b0:5a4:992:e8b2 with SMTP id
 2adb3069b0e04-5a4172e1c8bmr11414362e87.21.1777013831845; Thu, 23 Apr 2026
 23:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com> <20260412-defconfig-v1-6-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-6-a46918286451@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:56:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLkSTNbFwo7gwx+0e_ZwgXG0q0NS=L5-4fZ+k2kKEp6Fwg@mail.gmail.com>
X-Gm-Features: AQROBzADNxzrQDzMGVp1H4a-vD6pm520ZnRTwIt0L-Jg8slJtjbP66Ix_lrXjwg
Message-ID: <CAD++jLkSTNbFwo7gwx+0e_ZwgXG0q0NS=L5-4fZ+k2kKEp6Fwg@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: defconfig: Switch Ethernet drivers to modules
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, netdev@vger.kernel.org, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
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

On Sun, Apr 12, 2026 at 6:21=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Development of Linux kernel progressed over last 10 years and it is easy
> to generate now initramfs for building own kernel, e.g. with Yocto or
> mkosi.  Therefore for a few years of reviews on mailing lists, all new
> options enabled in arm64 defconfig were with assumption of having
> initramfs which can load bare minimum of modules to mount filesystem
> from network or disk.  Basically network driver as built-in is not
> anymore essential to boot the system, so switch almost all Ethernet
> drivers to modules to save on kernel image size.
>
> Similarly 9P network filesystem for QEMU, especially that testing kernel
> unuder QEMU does not have any size or build process constraints and can
> use initramfs with -initrd argument.
>
> Notable exceptions / diff explanations:
>
> 1. Intel CONFIG_IGB stays as built-in, because of dependency on I2C
>    which is also built-in.
>
> 2. CONFIG_BCM4908_ENET and CONFIG_BCMASP appear in the diff, because
>    they were default=3Dy (via ARCH_BCMBCA or ARCH_BCM_IPROC).
>
> 3. CONFIG_HNS3_HCLGE and CONFIG_HNS3_ENET are removed, because they are
>    default=3Dm.
>
> Moving code to modules has positive impact on kernel image size, thus
> boot time of all users not using above drivers and ability to flash
> fixed-size boot partitions.
>
> Old Image size: 41.11 MiB (Image.gz: 14.69 MiB)
> New Image size: 39.14 MiB (Image.gz: 13.82 MiB)
>
> bloat-o-meter of vmlinux:
> add/remove: 4/6139 grow/shrink: 3/51 up/down: 34547/-2046619 (-2012072)
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

In principle I think this is a sound change.

But looping in netdev and Rafal to touch  base on how this might affect
deployed systems. We've had issues with ethernet drivers that don't
really like deferred probe for example.

Yours,
Linus Walleij

