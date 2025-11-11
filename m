Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5038BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+hmxQBj7IsYd1S8pXVYnG/VuhGQ2SVQVtQG6+CGoaw=; b=Kdx5KMckS9zJU6GgK16uW/6t9n
	RhgsPWoryHj1DPYu7XyvISNnZnSZRA7oKi/SqhuyMuEgA/eF8RvBDu2ZjDNDCvNPbiUm9mj77xRT1
	JfY8Aqe+JEpf8O6wE1BlsADsriu28ztInxomkuKWlAvRniHjHqkYNWSRh9vXTZAwYk5/hm7X/caXb
	JSFG7gtgGCg+8rs8Qy2ip5uo6eeQna3tzAYHm5QJoTudGjF9U9iFuJ39JmPAMCkEXj748Fk5z9h40
	GY1j+ZuzncZWP9Uh8kczTDRGjssPuv3wEKvzL4SLv61LtH6mEdJt1uc00aqRmaQfTzFjas16iXPR1
	3PgDeyUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIk0O-00000006nev-29rx;
	Tue, 11 Nov 2025 08:45:36 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIk0L-00000006neX-41er
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 08:45:35 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b98983baeacso1571555a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 00:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762850733; x=1763455533; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+hmxQBj7IsYd1S8pXVYnG/VuhGQ2SVQVtQG6+CGoaw=;
        b=mdgvwfb0FuTsK5nI1kxcEAFtHWR2s3lGHlPz/+EKw+E5teJg2StupquuwcULhvs+0E
         SNzdomOm7Wbz9GWvGVYuqI6bkKQy6arTzXRgjS4NNDYIMJShM+rQGo/37pKtHEbd2b91
         7CII5Dyoj9bRtIsIRqUiP+Hpmt2XFb6AiLybqs5mfYFppxbmxfstU6j4C8aUJg3htmrO
         49PnscoOOgIBQ8/Od19XHN539DNVYV+1Z920RtbUxWjqxZHiHD75Ku9GBXNwddGy4Hpe
         4tjNF9qaLpemfa2OhDHGe/AidF2BFqXzd15IAQeGGbWkdHm19xI0ybAcIjszZe6sxHHe
         rNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762850733; x=1763455533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5+hmxQBj7IsYd1S8pXVYnG/VuhGQ2SVQVtQG6+CGoaw=;
        b=gzICs16B6KfyoT7N8D/hzMf9CF8SB8wgJpqxJxSWJVUPpxSeTf6kyGa8Fizx1v5PGJ
         fXU5oXQaoELP6ucJ9kCrha6s15ZKe66sPrKoBC4J2T7QimBkWXrfBrusNyPre7CjxOlc
         jIOJndBMaVk21yuWksyRe0z6yvKp7N1pCtBrIDCTBY6ARU73M/LXZmaJpJG4BgvMi2yp
         pSUxufxS7xJq7+6cbkJ6IFTaKk5C7UyVlwOYAAo1JaPCyRMBdRiLtbQHANr4y/gJXoT4
         +iSNsiyujAlyXq7SEWQjcG1g/NgZr79g3OyeyC1bC4eLNQLb1tpWM1pSQI8rjgJkN3wd
         0YHg==
X-Forwarded-Encrypted: i=1; AJvYcCWJKC9Ft7iLsx019nymYBRntCFu+pkuTaodpajgTsyIqLoFwZxdDsQkWzNeHHN0hUjlk8iicY9r/A3StnmdvPtJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+xUWeKbYUn5gy6LpDpBYYQyukc69KhH9gtIyT5dnrV0NQvkE9
	sQ0QI5mDfteJMmso05OE/vkK6H2rmT9pemuOhWBWMCoIahTFOqy0ivY52NxN6CbGgxWXX/eimHq
	GyJexVjjLfkVPXtAFq9UTC4QNXoBMrb0=
X-Gm-Gg: ASbGnctDeBH8QdVw6wZBb5zZOY+bSSPb6fNhgDvZ7ZNR/6L6lu7LMHWdZ43EsB691VU
	rMcfW7luUdx0Mq8cbySS90ZkQCknanQoHlM9/KNZlLUOFmbHF5k9A/X/zYtLoB0LBzAePv2kscb
	3HZTPGx/bVcS4k62xKikGrnzUDSuc8swFMeRYaKSvA5EEhObudFXGK/betLajvC5O0MgeuvKFYh
	VWq/2FgRBXvZZrTuJBpEmXI4CWp65qAekR2+eOhe9lRKCn/y58MM6SLvIVVl0bhwd6U
X-Google-Smtp-Source: AGHT+IEbIBPvg62Y1Iztl106EfvgBmmryD6TUmDM5qu02qmAT6MmSP20+OStlbhgquJhSpSV9FwS3gQC37Rdo9EXvMw=
X-Received: by 2002:a17:902:e80b:b0:295:7453:b580 with SMTP id
 d9443c01a7336-297e5715410mr146810455ad.58.1762850732603; Tue, 11 Nov 2025
 00:45:32 -0800 (PST)
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <9d48a54c-0585-4524-b9d5-30696f5ecc8b@kernel.org>
In-Reply-To: <9d48a54c-0585-4524-b9d5-30696f5ecc8b@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 11 Nov 2025 10:47:56 +0200
X-Gm-Features: AWmQ_bkje38QBVH41X3V5QeZd3T9fbYsWDLt3kUsgCWuUpLG1ylXQ7gyr6WQwdA
Message-ID: <CAEnQRZCvpXzGt=7NGv7-s+y0gvOg7Jx4OqbfbW3uv8jDp-jroQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, alexander.stein@ew.tq-group.com, 
	dario.binacchi@amarulasolutions.com, marex@denx.de, 
	Markus.Niebel@tq-group.com, y.moog@phytec.de, joao.goncalves@toradex.com, 
	frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_004534_002699_0EFAC181 
X-CRM114-Status: GOOD (  16.65  )
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

On Mon, Nov 10, 2025 at 10:12=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 09/11/2025 22:45, Rogerio Pimentel wrote:
> > The FRDM-i.MX8MP is an NXP development platform based on the i.MX8M Plu=
s
> > SoC, featuring a quad Cortex-A53, Cortex-M7 co-processor, 4GB LPDDR4,
> > 32GB eMMC, Wi-Fi 6/Bluetooth 5.4/802.15.4 tri-radio, Ethernet, HDMI/MIP=
I
> > display interfaces, camera connectors, and standard expansion headers.
> >
> > Based on the device tree found in the NXP repository at github
> > https://github.com/nxp-imx-support/meta-imx-frdm and on imx8mp-evk
> > board kernel mainline device tree.
> >
> > This is a basic device tree supporting:
> >
> >  - Quad Cortex-A53
> >  - 4GB LPDDR4 DRAM
> >  - PCA9450C PMIC with regulators
> >  - Two NXP PCAL6416 GPIO expanders
> >  - RGB LEDs via GPIO expander
> >  - I2C1, I2C2, I2C3 controllers
> >  - UART2 (console) and UART3 (with RTS/CTS)
> >  - USDHC3 (8-bit eMMC)
> >  - SNVS power key (onboard power button)
> >
> > Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
> > Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
>
> Incorrect DCO chain. Please look at submitting patches which explain
> what is DCO and how it should be organized.

In addition to that, Rogerio please read:

https://docs.kernel.org/process/submitting-patches.html

At this moment I think you should keep the original author of the
patch.

Then mark your contribution as follows. If you just picked the patches
tested them and made minor modifictions only add your S-o-b

e.g

Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>

If you made significant changes add your C-d-b like this:

Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
Co-developed-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>

