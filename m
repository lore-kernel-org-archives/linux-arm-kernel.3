Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D91C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dx0DW8TwqIygstJ9zMPWt3nkbLDwbpec4hVzREE2itU=; b=1ZoGMR1XpQnIaTSciGXC1Pji4X
	GwYBpsnu1WyYe8vYTmxN6VYoQ3jEJ4BTfqUEqgcnncDG7ezgpF/1Ycy2VYb8WWO0iC49VGDJ7vgA7
	2M2Ky7tFzbcJKq7dFaUWiuTs68p1OO5EupLJVPL0wYR1TfAdJjsPsPRY87kq7lTvcB4utV+wRB4OV
	aeuauU1uZ7ZAOKh7uyDbr2vOb/YXKUA2rzKn6+LLofSvbZuUoZNkZV1VdWV/ixnESUz34y2lsczSP
	7i5XdS3WHAVkmisq1A4flaRokTcjo1VNghxZrDRElzB+DzmdhSNZutqh7dC9Ml/XgCkXqbuYRh0y4
	PSDAC/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWzF-0000000Gsxe-2jNM;
	Tue, 30 Jun 2026 11:50:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWzE-0000000GsxV-0YXX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 11:50:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 027F260120
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 11:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1D51F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782820242;
	bh=dx0DW8TwqIygstJ9zMPWt3nkbLDwbpec4hVzREE2itU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f2xJmmWKuIP2NiDSfKQeZ2RRPUBZjoWc3ZpvEiuS6ykxSN7C7gbYGbAWWzpEgXp/W
	 vC2XOMQ4fs+yfzRTsFE2lkXBNQVw7xHPJc5VqE/dDXYubkWZ7JT+oMPkvA4UjycYS0
	 AI6x4Fj6bJmlUp0CUeWSfRbXf175fH9npSuQUNPeUzcA+mKONjzOm3MBlvoegOSP2U
	 IqwhjsTMPpNv1tapf3kfy89KvHDAR33tRtCYt8EkCzdRjomSR6KRdk3085sfLF4dnf
	 BPIktB6C5LHeuW50Zfyd0bRFui5Y3Zc6p0jr2ct1Pvcaz6tOqf1qhcjXdks5ojug/N
	 buEqpeIMJ/ujg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aeb3c48da5so2754328e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 04:50:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpSEOQ1NfSOiuecvQD3D88spFfPjwllTGaMV7BFTyI8gYVpcJCNrnMoPUybYduX6ZPBKNumObIYL+R4FmIaXGXp@lists.infradead.org
X-Gm-Message-State: AOJu0YwbcnoNDyRYrNAHSj+IBHfr3RmKek3eQW66KJ0rf9pq70aiBUxg
	9zS0yUeuLb2m26zrQucQybdSyqo3yOtEeHkRTt+ZqyLw+9/cSC5hIW808oN+n87x4FG/xeG7E+u
	fDGIAwWgNqM2RszxH7MWpEPR+WjgoqPI=
X-Received: by 2002:a05:6512:3b96:b0:5ae:a9eb:c5bc with SMTP id
 2adb3069b0e04-5aec10cd2demr140406e87.54.1782820241366; Tue, 30 Jun 2026
 04:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 12:50:28 +0100
X-Gmail-Original-Message-ID: <CAD++jL=S6vEgSW=V4gu4z=RtuvASNFUiofJb0X+fGYMqNQT7vQ@mail.gmail.com>
X-Gm-Features: AVVi8Cer80S6zjP7PzgocOgzwyDqIkAXmZBTd6RrIFp-jFbe4jJs8f0f-g9bRXQ
Message-ID: <CAD++jL=S6vEgSW=V4gu4z=RtuvASNFUiofJb0X+fGYMqNQT7vQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/6] gpio: siul2-s32g2: add initial GPIO driver
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
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

On Wed, Jun 10, 2026 at 2:21=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> This patch series adds support for basic GPIO
> operations using gpio-regmap.

Sorry for my confused comment on jun 10, these patches all go to the
pinctrl subsystem so I should merge them.

Can you make a v12 based on v7.2-rc1 and I will apply them.
Pick up ACKs!

I will not apply the device tree patch, this will need to be queued
in the SoC tree.

Yours,
Linus Walleij

