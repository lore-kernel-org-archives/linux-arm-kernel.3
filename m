Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E698CCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 15:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIri8gPwCvgxzuVNcP5Ad0/5z9CcdBUeY3ByihuZDbc=; b=lpnSYjS7/1ymx6FMQP3FslvYCr
	ETsxMtSZUzI8VwSSbb9Pk+nUheKnDT/E9zFfPxXQ7nCz7yW67geuutAVHDM/U3Zpnr815N48ZHuvW
	IVIPKX3OF+Jz9ItBMG9GS0Q50Sc2qoLBkI2atjKhqspGBUf+rzkDN0enhYA4EmU4QTtNucKrZ/Lw2
	Rzj2tR3QjZSu9nrKXLQTxFWFLOiKmMDeeAKW1SdeHgBerHrnioJYcxIHu6D9Y6HRO624T3fHzFGiP
	EHGatxnQwO8UOEhD7stlbK/X1OKLz9NofLXU5yv0DxhC+Niq5s5iOmHQnLQdaVFqVBDIanM1lMLGp
	y9a85lew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAreX-0000000E5qc-3SC6;
	Mon, 20 Oct 2025 15:18:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAreV-0000000E5pV-1NRW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 15:18:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-471b80b994bso25015175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760973505; x=1761578305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIri8gPwCvgxzuVNcP5Ad0/5z9CcdBUeY3ByihuZDbc=;
        b=Goo03ncWHcMO3YaVhEjpEUDfVt0wOccvUQ9yDMq3VxBUIkpO9PkR+/eCIzF756s6n7
         Bwe65VJdw4WUKW6O0Q5eQ/DDew1diWVWsK7hf1FqmkIbZ+YGY2xVGB0J7qCsdNZPbw2C
         3ajL6fA2TqiKahQJ8XQGIL6z4OWco74NH3juZ1D1qTwdhgzCfKhYh+gtOXbJ2wEnhldB
         vNb3Y7OwfE0U2/1dh2QTMEo+6+T/lxcVQKzzzMgBTsB2slmHC+RwFhHpiniQzQWO7Zux
         lHn/7Vjodw1znVmEOMGuMrf8WYkHcvo2rHD+Uc036KqNDrfNBEr/P04PRyhMxll/kZc8
         VOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760973505; x=1761578305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIri8gPwCvgxzuVNcP5Ad0/5z9CcdBUeY3ByihuZDbc=;
        b=EG9kQZjbr23KqpPb5Lpljesbez5hkRn5CZpaHMxstoZWOuZX9eCbrx2BnFkjD0UFWh
         ODI2ouXt0ybEyibsjotR2b2WzSgok8LkevAcEzn9ecHwdalzT22OnGDGa4KDN6svnCVC
         ALRFd+HFCy6g0qntF4vgPSF9iLrKU7AXhQ9WLVFf80tBuZx02osDHLxcZeZ1JrB/Y2nr
         Q1ELC69N6yllicPTOyP2MswjfuP1qxK1DWZPmpieh63UMUIGSTtPjOjtPDI2uD283tZ6
         MShkwm7bZJQTXgcKruv7gnMiA34lUwaoNIvhAagg6zlqguyT8MjXS2C27iuFFjI54+5O
         K+2A==
X-Forwarded-Encrypted: i=1; AJvYcCU5O8AKTspkE9QjaazX1Y31jaItXVTMgY3TsqdPNhU0qtDO1I2gXbkaKSRneBr85YjpaNsnLS6a2CpORv8T+1dJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwVXAEwpfDIEe0hBKS/VH7Ny9JeymxPp+nkojuiMiqi2zUgzctV
	Do6KRUVGrEvoPPmUYwdRhE5CQWL2rfluMAy6UA6CTO5JBo818hmSU3OYx3b49A==
X-Gm-Gg: ASbGncuKbLVzFHFCBPA6AoK8eZDIDiyp1Ps8ZOQtvAPnxgzLdjfYQf6Yq+n/oiKDZKp
	9ao2RRZf0bUz7o6JZce8GVoai2GtCqXuEox3oYelVbE1qZkyYK1sGzD1Kei+3cbEC9g0DwdLGme
	sO5TUtlmxQ5sCLes5XfUzouVKuiTLqYd3y6QK+kPBLK2WdB3biIfWesh4NTZraxbwAyyrANYr7r
	MRtHadEjXYB/9QYWMsoLJ0MEcMxs7jwhndFtdx2iHCTDVgWlL2pKi1tR43EuKC2lxdwCmN6HHHD
	SfO6IqySMdszh2V4LxgV+vMukNQKHHAwnTcGi7wK9EJl+uBby3dDe/kxTyFnXlTLZ73Q05St7tF
	1Si8cn1Kx4RgeEzRmTUbEHH48sgI6MIhiF03l1+ysoEXBV4BTV7TCGFn61ppPjI9Ra3x55M1vqT
	BCwUwdHpGC3ct1UKtYwBvNixNumrklSnMq7dVhWWVkItZO9cSAjEvWoD68/1AGvx5qdilw
X-Google-Smtp-Source: AGHT+IHQEYoBMcfx1b6Nsx/IivzRuTLpzyAZ455r3ZJisHcjzwPbpeFkoct3AeG4wC3jqAyj6VhBUA==
X-Received: by 2002:a05:600c:45c9:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-4711791c601mr98951155e9.26.1760973505153;
        Mon, 20 Oct 2025 08:18:25 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce178sm15617638f8f.46.2025.10.20.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:18:24 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: devicetree@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/4] dt-bindings: bus: don't check node names
Date: Mon, 20 Oct 2025 17:18:23 +0200
Message-ID: <5930653.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
 <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_081827_400488_C3CF92A0 
X-CRM114-Status: GOOD (  10.71  )
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

Dne ponedeljek, 20. oktober 2025 ob 08:09:50 Srednjeevropski poletni =C4=8D=
as je Wolfram Sang napisal(a):
> Node names are already and properly checked by the core schema. No need
> to do it again.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> I'd suggest to give subsystems some time to pick this patch before
> Rob applies it?
>=20
>  .../devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml        | 2 +-

=46or allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  .../devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml | 2 +-
>  Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml       | 2 +-
>  Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)




