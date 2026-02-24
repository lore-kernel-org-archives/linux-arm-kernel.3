Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEB4E9B250
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6zyw58AOxXSub8QGwmMM/bb4H+WWArpgg93Ti+4E3I=; b=k3yWA3Tv/5uJStlIDDcg9lvun4
	NuBk9rPj07uerXGAYQZZSSMGqPqT3bEEfOzmip36XXgujfP/QPUYPnW9plWW6H4n7aPg6mS7p+0Qb
	yrXb1qxhw3mZLkvGwSYm9xEAL5zX0sVq7+w/aUHxJi8wn3VPj0izYqNItw+HeDXGlxrgIK5RTQMO8
	9SiLLqVIQEundgzeQHRPSTxJxiThiG9S9nN+MENNmNG5ZSIg/eWlR4oHFlJVmO8BMGVAnn63BrQbl
	eia7J5sThBPzH21Meiz+nvjBp5nT9zryO3SDbBIWvaMVGxbdQjYsOch0DCcDh9mbX0PUHQqM3285I
	rUUgWJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupdT-00000001r63-3kto;
	Tue, 24 Feb 2026 10:27:23 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupdR-00000001r5j-3bu8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:27:23 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59e646a4b9eso5305026e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 02:27:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771928839; cv=none;
        d=google.com; s=arc-20240605;
        b=TRSOF6PE4DQ5eqgkLAia4bjXf5NEApB8tMz0EFCO6zU7BETfMwN5xSikFkQbNE3/zd
         sENqzUFmLFoKn5rklOU6ELd5E5wkvZO4ACDYFdtWa81C2Vqoe1mwj2GgkNF6Zj9WM9gJ
         ynDQROdcH5yiFeyV/kSIklED/kOPrhwkAfOOzDRzsp0JQLjRvLDNmrv1zH5W4fXcEtb1
         8bFWiH/zgYrZIwbqy3Wf5kcvZ2ymlgTY7lIYObmGXD84HdAt7ZndHSRJw/1RNl+lgDaF
         g1UxOluf+4AiNg6Wb3rvegWpc6skshPKjzA9Mt626cIllIaUfSecMx0levQuslf0EgyG
         VRYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p6zyw58AOxXSub8QGwmMM/bb4H+WWArpgg93Ti+4E3I=;
        fh=6nqTCZ6rSHwq/iYqqYuOzx9vMoX8JHKbBj+ZbBBA76U=;
        b=GVINs7PqdVXwtMWVk3s1Vk5ByZVDnEvh6KfsijQmUVTGstYCX5IqY/4VEgDAUkUlFx
         iX/uDT3cpkRO7kC4curkqKmnGhN9aaRtfrkRa39J9sDONF5jmXReeeom8lRCEeJRJIt4
         gXH2SBIZh9N23GDyxAyvNnGCYDrv0gl6sdxxSvY9PciRlVOucqLtLOCJ1fwgDFWAJFcB
         OBDAuFXTrcsOehY/BKkiP6hKNITJQovJVteY8KOCNixGX4JE02Y3JqEnO/hgoFFodZmz
         Ml4yeBHNrDh9T45boB82vxdpJBAaPTWzkzLqXdCo435kITuQKuoV0xcTL+rRYq7xyC1A
         XA9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771928839; x=1772533639; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6zyw58AOxXSub8QGwmMM/bb4H+WWArpgg93Ti+4E3I=;
        b=aRv2qhb8olgwyC8W7wP0RqMEWiHPUpPczrNB4A45a8GGZH86sva1E8dkujDjatU+o5
         qvcdryjv+kphh/VNpz+BaNEHa68nwze25BR0glDLpJqjScIDLbBFp4Hq0ok1UrAUQkjU
         /qYtABoCABs6QFXBqHGHxFYibstMoewYv3Q/rLVXyATcFw8nwWEBibtQR6LxV6Y2Rc4S
         H4mmxgWcza+G4gJVjQcGFeWbEkOiUyBfIng+ju3ZaDUdWLE7brEn5+sYikrKCEJwm25Z
         //FDYRln9ZmgsdSAFvK6z4P/EcCu7AsfZMYhjZejX4wiIMFk1V4ZSsJEOVvHRc7YwGC1
         wi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771928839; x=1772533639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6zyw58AOxXSub8QGwmMM/bb4H+WWArpgg93Ti+4E3I=;
        b=EtZ7Yku1BxFwfcwI0oOi9AAhDrnFuhqKYvQmzXNtJGryN0guUpAvfd4da7eP1xkhje
         iZqzq0KNYfxUunjioUfeXxCbgNAPfM1SrL+vT5wXTGzpOKuRENQOOqGEdiHZDeLSPUEX
         X8yeT+LuegCFuknPTabHOVr+8LCPAvfcO+tSPQXWQ2mVZbz2Uvk+XsKJYfHZ4r+rCj7x
         2yYNugszyMKnLWHEcKPxAkg9q0Arhw5r0iMREJEkqTy6Ik/yom2Rfz8qEf6AQ0+/YMR7
         7r+IvAFR5JmXANBYdF/9RtQ3knjF5p23Jdb++L87lNoCFPKf2RI8TphT47ZjoAMcOHQ0
         seKA==
X-Forwarded-Encrypted: i=1; AJvYcCXFqCfZqp5CHB8r8r/9Ipt/0y14OOnYDjQlB2ZI8p1P8S4758HxV8IiZ07kat+6yWxIiRWoII+8uVM2jhrkkuSW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3UiZh4Xt4Vd5ja54ZFw/fIifWfjGl17vdVVtjGiu8yX72880L
	PTaszROFN14E6bN1FNQIjz58c2ktsbKjCB8mkRacxdZxwoO5BdVGhpC/5/RZg1V+2ZsWKLhIwhu
	QiGlWkJPtEvWNJbzBEk1RDjOKZeFkJ8E=
X-Gm-Gg: ATEYQzzL1ZDyjGJ8MamSR4yEnuIse1qoo8+lxQfuPfAlMi6xbslCgXhhf5yM1QJdYQO
	xqISV9Pwy6dLovA4RUQOdxaEy2+OFVz+f8SDnyIveFQ2F51U8iJ8cZFzoJ+X824A8IYW1NtsjNH
	g1DDcUQDr1qyFWCV/9FkFvRf5wbpQpC6SxQA1wS2m6aguGfHvWOrHhd1u+CHoXmH3ulvsqnIugh
	xxNbBTGt1ZaS/j4YWdgvE848oRPze31t/x/bVgFtXgNGgcHPhiqB65e+MUfoSjntrOSAcGGyxFb
	xjw+MNtBbmS6r0TORjbxZgodoOa+ddsXF7Ku/w==
X-Received: by 2002:a05:6512:2244:b0:59f:71c2:6a06 with SMTP id
 2adb3069b0e04-5a0ed87a0e3mr3947109e87.1.1771928838810; Tue, 24 Feb 2026
 02:27:18 -0800 (PST)
MIME-Version: 1.0
References: <20260224094527.169215-1-shengjiu.wang@nxp.com> <20260224094527.169215-3-shengjiu.wang@nxp.com>
In-Reply-To: <20260224094527.169215-3-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Feb 2026 07:27:07 -0300
X-Gm-Features: AaiRm52LfC9-UsCut8Tth636xjKLVR0axNCtj7qY01_2UMRqth2SAkou2H1hRPo
Message-ID: <CAOMZO5DW5Yo3A3kPOe+NdQNwTATzzWguCGBDyK2UFjCrHtwFeg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: add support for NXP i.MX8MP audio board
 (version 2)
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, daniel.baluta@nxp.com, 
	dario.binacchi@amarulasolutions.com, alexander.stein@ew.tq-group.com, 
	Markus.Niebel@tq-group.com, matthias.schiffer@tq-group.com, y.moog@phytec.de, 
	josua@solid-run.com, francesco.dolcini@toradex.com, primoz.fiser@norik.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_022721_943490_67A4EE66 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
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

On Tue, Feb 24, 2026 at 6:44=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:

> +&ecspi2 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       cs-gpios =3D <&gpio5 13 GPIO_ACTIVE_LOW>;
> +       pinctrl-0 =3D <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +
> +       spidev1: spi@0 {
> +               compatible =3D "rohm,dh2228fv";

I bet you don't have such a device populated on this board.

