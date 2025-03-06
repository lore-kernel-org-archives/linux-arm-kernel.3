Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59C4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1r0XL1092fmLSaUg6P9eZbIAeeU2xay/HqiLlb+zMY=; b=betOTw9kSqR6aFqRr80VfmBpBw
	fm4CBFNXHLDVGSbS8QpW5vvCKueECu60jJn1fS+XM8UgLXBaK+0FxxCtB77Nh+l7+40grDVYw1n7K
	4K8FLdS3vK1Aq4L+2NpuKXR3/DGLe/0WRBEfJYyGSOwcUP6zeLicoJpknXm+e0OMhR8YcaCXgyoHJ
	NSuQNEq+G6QuG1X+5HsgD4gF0oE5zpXIKzXn5yntqz1y+/BywC6NboAnHA1uRxHrfhk5/klLUHfRe
	0jz/Zj0hA6TcsqGANZaN48+bLHNaOtAvmX62PSmCmNo7MxykeunGwPgmWshPuQWJmNTJQ3XibEBge
	905XDsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCWx-0000000BEsr-15KO;
	Thu, 06 Mar 2025 14:48:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBIS-0000000B3lv-1EZU;
	Thu, 06 Mar 2025 13:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=y1r0XL1092fmLSaUg6P9eZbIAeeU2xay/HqiLlb+zMY=; b=HCT4K7N7sqkqQtAsKRUdwRszQ6
	6tMe+uBoEu2Y5ySW2JYTSSj2/DmgATvb/3UHc2+tVylwRwuc/Dt07hhHz3Z3nlh+DbjAk3Q0Ll5Pv
	hJ8kbyinD7Pf7I7rN1fS71NA89o0XH4tQe1Oe/8pIo8OOd4ZStQl+MCvEEW0t8+gZyA+mIJbG9i8G
	WxfrfFT/86tIBYFImCKuoO/Ae6GLo8FhVMOdXbBXrOKTqc+sAFIUyXJt8+Zt6fgZxooNoI1FgAXbf
	VEgmG3HpbT5gAFD2GItitHW832qJAnuqRSnQTPfDi8Eq1P3HW6n0TLOeevV/bdS/0mLYC6/r1m20K
	BtSlLxUg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBIP-0000000163X-0uNW;
	Thu, 06 Mar 2025 13:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y1r0XL1092fmLSaUg6P9eZbIAeeU2xay/HqiLlb+zMY=; b=Afl9wm+B0ta8/YCf8e7GaHaAlb
	w3e+75j86lq+KQZK6gvVoTYKa9zUilVpMQx83DWou9X3zPv1zbGTRICX4BYKVzKwDR6PTLcuX9bXM
	ec7/6WJhxRqCGCVZNjqTNbGOYiZUkCAVQd/gyRR+c9ZtXbKQbcp1uIfK/KtpI2Wm8xtltEdPFSblC
	MrghlQaA2pKnYO6u5kV9U5iz8BXaYTQ8B3183E+yHppVu7odwKQZPUPfOg3upIrUZKbtviFnsDKSL
	tZk4uboZ/98MB0VuFk+UmW2/J8K0DT+S5MVF4yEiTfhg4/oXod9vf2YgIjbxmFEvN97Wond06OK9W
	QhFdvwQA==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqBIK-0003LI-U0; Thu, 06 Mar 2025 14:29:48 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yao Zi <ziyao@disroot.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: enable SCMI clk for RK3528 SoC
Date: Thu, 06 Mar 2025 14:29:48 +0100
Message-ID: <4856313.kQq0lBPeGt@diego>
In-Reply-To: <20250306131016.281290-2-amadeus@jmu.edu.cn>
References: <20250306131016.281290-1-amadeus@jmu.edu.cn>
 <20250306131016.281290-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_132953_586466_1F7048FA 
X-CRM114-Status: GOOD (  10.68  )
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

Hi,

Am Donnerstag, 6. M=C3=A4rz 2025, 14:10:16 MEZ schrieb Chukun Pan:
> Same as RK3568, RK3528 uses SCMI clk instead of ARMCLK.
> Add SCMI clk for CPU, GPU and RNG will also use it.
>=20
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---

> @@ -110,6 +129,19 @@ gmac0_clk: clock-gmac50m {
>  		#clock-cells =3D <0>;
>  	};
> =20
> +	sram@10f000 {

That sram is part of the soc (and has an mmio-address), so I'd think
it should live inside the soc node?


Heiko



