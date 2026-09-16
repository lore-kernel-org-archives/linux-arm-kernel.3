Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A6BC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+BiUHgQgQYNE2L4m1Bb5PmuouU+q3YJi9AuVU4r0HI=; b=3czyOvyQyHAY0xes0BGMxMHJzS
	Fo7mPebz/o4B8rjlf5YtpHIEFhIFmd/1rdw6yrHdksFv7EMRgrDQeLHecRRRq4+GwN2sve1V2e7Lv
	l92XrebJefbxGzuQv1cDlDxZlbALCkuBbZPCPJkeDCuwd7emFUoCaMcLN9dux6Dc44kOKxt9ekwwi
	xKXvxU7NHJMqPbxYKVefK54yoXGzeyC9IOQNfKattXS81xXcWuEI6MdVMtZvYqAtMA55LFAn6mi2J
	tMNmmInPfe0LcXW7IRT+YZv15LlnvG1EMthtNuQMo6EcWBzwt3XFcerun6bVQqxd7fpHPcZnYr+b+
	4oOPgHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lDy-00000008jwf-03Vx;
	Wed, 16 Sep 2026 08:42:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lDw-00000008jvh-0Ry4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 08:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=O+BiUHgQgQYNE2L4m1Bb5PmuouU+q3YJi9AuVU4r0HI=; b=UDHsMCCwG1eAsYCl+pY/R1H/fY
	T4mMtIuMC9XEjzqlw5Beu7CVyhCTPrdj7bZu3zbf378F8Oi6jmxD/3Bc1SMu6jl+HgrJrK07rEXTa
	pT6I8IDqRiNofYjzVLhWFEuJOkDTyZD2GYN6Ig5ATnqzNV42CguGJtTX8hOLxfobNmLpNTIZuSs5N
	kwwwXK4m0Ux2ZDIg5xWwE9feCOOUC8w9g8tSCh7jsrnKTU2SzRWmiIuT71z4DBrwaomaqvieoP+vk
	PVGUOB1grqZ3tDS8P3g4iFAPXPyZqLoR5tvJMqDAEK1qZrcr0x4BPnTmPTBdhpqgEaXk2RcBM3BVX
	n7tm40xA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6lDo-00000007duL-2mzB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 08:42:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6F8571A08D4;
	Wed, 16 Sep 2026 08:42:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42DF260337;
	Wed, 16 Sep 2026 08:42:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 595E611C7B019;
	Wed, 16 Sep 2026 10:42:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789548144; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O+BiUHgQgQYNE2L4m1Bb5PmuouU+q3YJi9AuVU4r0HI=;
	b=Q+QBmfiFTdP/nXqIBrAA+x8n0MeugBkZhHlGngTrxfkqTVa+axughkYJ5rC08yoA6ggm07
	Et6Z74QOlS/pJf2ms4r9N8u+1Zwr/72NIF8R9e6ZjErSMrcPmP2JYO7usveM1RdxNhB1Uu
	VYpKkxGrgZILtaWQobLffKl5F0g100nZ764Vs9rj/kyvCu14HoXTSAGBqvoTZrQlwcjuc2
	j0qrHgJ6oCms/3WFB/xzur/AIcmJVWFZG2qs6dTYriEggCr6BurdjKmY0oQtBl5E+c3NG5
	dAEhrYkGtHBUdTU9QieyGjzPl+WWyOmaAQueDqWmIto3MzX2NvEsTy228gqB9Q==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/4] drm: mxsfb: Add optional DPI output bus-width
 configuration
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20260813092836.38367-3-francesco@dolcini.it>
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-3-francesco@dolcini.it>
Date: Wed, 16 Sep 2026 10:42:13 +0200
Message-Id: <178954813309.214898.6895255097019153080.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_094231_146752_3317BFB2 
X-CRM114-Status: GOOD (  15.10  )
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

Hi Francesco,

> LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format. The
> format reported by the downstream panel or bridge describes the display
> input, but it does not describe how the LCDIF data pins are physically
> wired on the board.
>
> These can differ. For example, a 16-bit LCDIF bus can be connected to a
> 24-bit display by wiring the available color bits to the corresponding
> display inputs. In that case, using the display's 24-bit format to
> configure LCDIF selects the wrong data-bus mode and changes the assignment
> of color bits on the LCD_DATA pins.
>
> Read the optional bus-width endpoint property from the LCDIF output port
> and use it to select the media bus format used to configure LCDIF. This
> allows the LCDIF bus mode to describe the physical interface
> independently of the downstream display format.
>
> When the optional property is absent, or it has an invalid value, continue
> using the format reported by the downstream display device, preserving
> the existing behavior. The code is not validating the DT for
> correctness and just fall back to the previous behavior in case of
> errors.

Why? Generally speaking errors are better spotted immediately, not ignored
silently.

Otherwise looks good. I also tested on i.MX8MP with no regressions.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


