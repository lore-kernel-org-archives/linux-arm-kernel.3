Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D0BD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWduyM9RlO+S4Fnf/tbYPskuyvgMrxmnLzQbsy0Fsm4=; b=sUCYg07UVNv6pgbn/OydhcpASo
	+IYLYcf1jRCNJk+vefAdod/ytKM1ScOT6gavb7lfZd+0YxdM/6qUbZqFk0RO7C2K+DeupUILjUoWz
	dgzDB6RUL0NVmQjmJqamAwBs6nSN63Dpkiv45zyqgQzqReKxOhyGI0Fh8aw4NJqIvyBjeDW/skkIC
	LQ/rXlfHZ31IIFyRLMdLvW31E411bSnJivkL2eXBaR+8elN+Vy6gyP/eeomPuaG7qiF8gIOxj9TWM
	K7FUmJb/v4SQI1iasfImhpLzz0L/r1t/VCx/xBX05eB0m87u4ounPPQ7jPqKHdlBWpACKmvPW/EaR
	VVW8v0Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAXb-00000003nFX-1pxe;
	Tue, 20 Jan 2026 12:08:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAXa-00000003nFO-20Wm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:08:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9152760136
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 12:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4864AC19423
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768910937;
	bh=wWduyM9RlO+S4Fnf/tbYPskuyvgMrxmnLzQbsy0Fsm4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=DCswIA6yG5bSVLokevhtRKzOiDjk5PmG+p/kcPu68Rgj2ZJ+Uus1Aod6ukvmY5VyB
	 VUWDFQrfNra2zlmB/N89m03P0Xr688h7w60rmcU1dTYpfCSO3yeEJyyWc/c6CMX9db
	 T6EKXnU3IYBTh0JYdRYi7pD+9JIWGilHKotlI5d2DbVZV6xWaE6YKZXms9igmLbiGJ
	 OWqU7Mq6UHNHpesG/J+TJDacagdK74huWY3b+1AcsSgC79VWlyp2wVnJjo7mV6xGzE
	 i4TPA5avHk7XmHYIlCEroDCZV2Z/HkYSKr+3PZCVhq0a//Uvc/PhKaHxrZebzfcf2w
	 F+cDN5zEB6qbA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38310ee9d40so48129641fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 04:08:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVI/yxcZ2WyIcB3XOivW7XcwXt69FsuxTb4P1/p6FA8Koyx+hxQb2YQVDidBeX0Zk+abz1y4EJH8UFYD5TurNDG@lists.infradead.org
X-Gm-Message-State: AOJu0YwByqyKSMsshb2F5fyv1fEIGDqugvlKnrZ9T+K9CE5OhC5bjaa2
	OSom9Yjw+JJdQ0/PfIlT5/iDtHk8z6ROgGeCms3WggBkurgjLkb7mV8opj9FlpWxtUwc1Fy/44O
	HLAGQ6yr/jW3unGtcj07pq50BtmgsKp0+lS5YUI97Rw==
X-Received: by 2002:a05:6512:2526:b0:59b:6853:f085 with SMTP id
 2adb3069b0e04-59dc8f2348fmr701250e87.16.1768910935983; Tue, 20 Jan 2026
 04:08:55 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 07:08:54 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 07:08:54 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260120115923.3463866-7-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-7-khristineandreea.barbulescu@oss.nxp.com>
Date: Tue, 20 Jan 2026 07:08:54 -0500
X-Gmail-Original-Message-ID: <CAMRc=McfjhfLwDR-wK=-WrC0yMZ3nt1YjAJ5RyQfsrgk1o6raA@mail.gmail.com>
X-Gm-Features: AZwV_QisPQ-QjOl5tcjlAYHwC875PPGQpfp236P6QoGB-8mZ48tjgJMnK8XIV-Y
Message-ID: <CAMRc=McfjhfLwDR-wK=-WrC0yMZ3nt1YjAJ5RyQfsrgk1o6raA@mail.gmail.com>
Subject: Re: [PATCH v8 06/10] pinctrl: s32g2: change the driver to also be
 probed as an MFD cell
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 20 Jan 2026 12:59:18 +0100, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> The old pinctrl bindings for SIUL2 are deprecated by a previous commit.
> The new bindings for the SIUL2 represent it as an MFD device:
> - one cell for combined pinctrl&GPIO
> - two cella acting as syscon providers for SoC registers access
>
> This commit allows the existing driver to also be probed as an MFD cell.
> The changes only impact the way the driver initializes the regmaps for
> accessing MSCR and IMCR registers.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

