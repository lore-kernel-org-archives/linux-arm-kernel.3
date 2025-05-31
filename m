Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C09DC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 21:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7u2qauzFTP/rcfL2a+zDfaRZel9Pi3gl/2pshUKS3Yk=; b=uPHbzGc2eUE2Vmrn6iUFTy7r86
	1j+8kKQVp1ZkQm1ojmthEouxdj4nxwC/ikgpUfGiKB5mC7iVpDKRcLUVTrW5WcQmexFo7Hjwmon9f
	0y0XCNeySiJ4q2MYsJK7iqL2+YiVWUJwbbnep13FVj4SsWomOOS/piAWsWs9o8CdhgW1W+dvR67qy
	k6gyTVCBA03OsguuXqZuatDyGnhO0PdWxeZOCj/jkPSu3kRDoSv7LUw570ijeLp7AjCYmtB9yub17
	GNfCIH9xX0LtcywyBDbX03NsQp/OJllylNB7v2xrc14uLMiRocbnR9tDNDMWiKBi5LdfNdIeVYQw5
	Vy9wP7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLU8Y-00000004ZMi-3gjM;
	Sat, 31 May 2025 21:53:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLU6Q-00000004Ynd-2HNz;
	Sat, 31 May 2025 21:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7u2qauzFTP/rcfL2a+zDfaRZel9Pi3gl/2pshUKS3Yk=; b=kymPPlJBkcnmuucB8OXSCyEip0
	aad1ClhYKqwnzUFW62h8LMRUauI/0nUjuSO7vt6CFO4BBVWh246MjR/nHmcJptBrA0y/Eait7AF3M
	SnUB7zFpIJqDKhjEkBp+je3wN9doOer9cGnwdB302NURH2n9ru6Hwt2xD4skQ5hrOSOQjXhj3Amq3
	KlOOHlbpPWffBPj6GspiIN5JskZPUz/HfHT8LZ/kGLpgtmNQAPuV0jgO2NCWCiglfUjZiu7BDH1ep
	QUpJ1wDCCW9MrR0vd8x4nxwPUUqDohT9qxufH3RBYn31GlfwcNohbldBfap/HNP6wTN1K537vKO2V
	uhbw6GNQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLU6N-00000000PF1-2TUl;
	Sat, 31 May 2025 21:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7u2qauzFTP/rcfL2a+zDfaRZel9Pi3gl/2pshUKS3Yk=; b=S/veJHBk4K4AhMATBTSQloGQ/s
	SExGYxn3vLkx2Q5mkmsp0Kv0K+HTFKscAq30eVlszyNmHjpIMlxe/wFsDhlRhxi/yl2bItdRpd/c3
	YP4DoEl8pZojG29DsB8iQbYu6yCJ0Id9+IuvCdPqOIV/cAMqalAKqDw6vmBtKD/L0UKJVIeHaLKg1
	S1cNU9BLdN+/Nw1QA81Z2eyTzfCHis7/U5yc1Vh/VPMWkmL45r+AKeIdy/7b3dTX39inxEWjBsoMT
	9Ij0k2rb6NW1oewrgOJadOIq1GjyOWNqT9uiD5ORDZ/YR9vh5FDP+HssP53zQGw5j8slLg9mO45xs
	RNYOc6kg==;
Received: from i53875a3e.versanet.de ([83.135.90.62] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uLU46-0001IH-Ji; Sat, 31 May 2025 23:48:30 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>,
 William Breathitt Gray <wbg@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, kernel@collabora.com,
 Jonas Karlman <jonas@kwiboo.se>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 4/7] soc: rockchip: add mfpwm driver
Date: Sat, 31 May 2025 23:48:29 +0200
Message-ID: <2188729.OBFZWjSADL@diego>
In-Reply-To: <20250408-rk3576-pwm-v1-4-a49286c2ca8e@collabora.com>
References: <20250408-rk3576-pwm-v1-0-a49286c2ca8e@collabora.com>
 <20250408-rk3576-pwm-v1-4-a49286c2ca8e@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_225051_727311_85415378 
X-CRM114-Status: GOOD (  25.45  )
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

Am Dienstag, 8. April 2025, 14:32:16 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Nicolas Frattaroli:
> With the Rockchip RK3576, the PWM IP used by Rockchip has changed
> substantially. Looking at both the downstream pwm-rockchip driver as
> well as the mainline pwm-rockchip driver made it clear that with all its
> additional features and its differences from previous IP revisions, it
> is best supported in a new driver.
>=20
> This brings us to the question as to what such a new driver should be.
> To me, it soon became clear that it should actually be several new
> drivers, most prominently when Uwe Kleine-K=C3=B6nig let me know that I
> should not implement the pwm subsystem's capture callback, but instead
> write a counter driver for this functionality.
>=20
> Combined with the other as-of-yet unimplemented functionality of this
> new IP, it became apparent that it needs to be spread across several
> subsystems.
>=20
> For this reason, we add a new platform bus based driver, called mfpwm
> (short for "Multi-function PWM"). This "parent" driver makes sure that
> only one device function driver is using the device at a time, and is in
> charge of registering the platform bus devices for the individual device
> functions offered by the device.
>=20
> An acquire/release pattern is used to guarantee that device function
> drivers don't step on each other's toes.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

actually trying to compile this, led me to

aarch64-linux-gnu-ld: drivers/soc/rockchip/mfpwm.o: in function `mfpwm_reg_=
read':
/home/devel/hstuebner/00_git-repos/linux-rockchip/_build-arm64/../include/s=
oc/rockchip/mfpwm.h:423: multiple definition of `mfpwm_reg_read'; drivers/p=
wm/pwm-rockchip-v4.o:/home/devel/hstuebner/00_git-repos/linux-rockchip/_bui=
ld-arm64/../include/soc/rockchip/mfpwm.h:423: first defined here
aarch64-linux-gnu-ld: drivers/soc/rockchip/mfpwm.o: in function `mfpwm_reg_=
write':
/home/devel/hstuebner/00_git-repos/linux-rockchip/_build-arm64/../include/s=
oc/rockchip/mfpwm.h:428: multiple definition of `mfpwm_reg_write'; drivers/=
pwm/pwm-rockchip-v4.o:/home/devel/hstuebner/00_git-repos/linux-rockchip/_bu=
ild-arm64/../include/soc/rockchip/mfpwm.h:428: first defined here
make[3]: *** [../scripts/Makefile.vmlinux_o:72: vmlinux.o] Fehler 1


during the linking stage - with the driver as builtin


> +inline u32 mfpwm_reg_read(void __iomem *base, u32 reg)
> +{
> +	return readl(base + reg);
> +}
> +
> +inline void mfpwm_reg_write(void __iomem *base, u32 reg, u32 val)
> +{
> +	writel(val, base + reg);
> +}

making that a "static inline ..." solves that.


On a more general note, what is the differentiation to an MFD here?

Like you can already bind dt-nodes to MFD subdevices, and can implement
the exclusivity API thing on top of a general mfd device, to make sure only
one mfd-cell gets activated at one time.

Other than that, this looks like it reimplements MFDs?

Also handing around a regmap might be nicer, compared to readl/writel.


Heiko




