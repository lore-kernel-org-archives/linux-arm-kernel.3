Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4733D3ABF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 19:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1vUWXu4zDKdaSJZeWtM1voreY4yk9aTKqi7yYAqNXw=; b=FOViUhPjGjm6/dbjJHnMw29uaP
	xPTXcsmOp+F0LLL/dBbGz7yClWK5fniDIsMArWGaUlM3RRbUHCuxJGtHMF3Lt/1UJ+cKrhl/ZYC2I
	d98ZZnHm+fJoftMTvIBtR7scjk0LnyCXw1Gy1pUPKvX15EtE+1ly/2DB+iIcbUKaByPFJKgNBdU6S
	HsVOYnKT7RGNF3Oo+aQP7P/6IhqP8HBCWCSoYjiQZNCl6HwNROd8wgxcF9ZtGTd92K+LHNEq0dJYk
	32Nua69q6LwN5kgAJFFQlF91NYIUHdeSICSmj/FMgYxpjsVESLUESpoQzVVjH8f/bf8TLkQas9HRV
	aipE6Pag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAa8E-000000013oc-3XGz;
	Mon, 11 Nov 2024 19:31:26 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAa6S-000000013ZJ-19aB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 19:29:37 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-260e6298635so2257553fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 11:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731353374; x=1731958174; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1vUWXu4zDKdaSJZeWtM1voreY4yk9aTKqi7yYAqNXw=;
        b=IJXu+UXyPPttvBVLQGSwOgARm3J22PtjVlWElPUSZ2RB4APBmDCimIWM4xPbOtKgvS
         AkjfrE5px5/7eGcnpHfUxXIBsJvPtgALA2ZkgB9pu6LBYAcr79XDKbLCWzmcByUc3QJx
         XB61dTz2cDGBdyiOWTFtDHTRhFOeOKoJOU5kRCwC0KHp8FHLMKVSf+TmXX9XQv8frfhb
         yoTUa4inJx4plMcx8TItlwSuR8ScBO7/oAnicewRjj/6C3jLlQcaQJ1DXwAK4zHPQEN9
         reULpzDG7mhYsJIJqYGkVhcg9oWaUudoREK6M6mRpstguZRZRMOo6mAKPiveMqHvFFOw
         9T3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731353374; x=1731958174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1vUWXu4zDKdaSJZeWtM1voreY4yk9aTKqi7yYAqNXw=;
        b=BXeQMoWn+myriAgrXLLhJgFkqXsSdwq5eHZN94Q9gpLDkZb7SwLn3OaN9zsTRAo0fY
         vRQTDeGS224J0u3WyIMOkls8vym8z1eeb3k++A/dPzHcovCO7PvPwoNfawbfT4iY5NDO
         O0I8lFd39Qu0Jcqk2Q8AREsyD16IYsJgP4Kwhq6+fn4t9Bhhk1lMOjl1RLBonqMXbxLm
         /lJJIOY8edosI432a2CZq2CqsDTFf5Q4WH5qr22MIWdzY7wWZEU3OTVMHMn5zCOQ3ORx
         srseeKTod2ve9K3FOzmDm/F3FlWtsiS/r/zgsTw6hKvuWOxtRxXFVKspAnLhexzudHBt
         RcaA==
X-Forwarded-Encrypted: i=1; AJvYcCXjLzAw1Sibiqn0IbT+kbUC6YPJJ294qr8VkpkDAqrgSF3RrGkj+Sd8lpZrYvdmDl77jXw/KVzIeXOyvmCxW625@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf0PJbkuIEX5+d9g74BK7EJyj9h8sND+KDlz6LiDU4P+8/r58+
	5RB3NOE+GDrv6e/3M0MOYwDjCiatBSh8jy9mvQVW/OEVSyr4oPrttwGXG+/Dx3SRq6ohClE85D3
	fPYNPTZ/gZyKwssCF/a6UYYh6JU8=
X-Google-Smtp-Source: AGHT+IGHBbFAE824Z7ejSxwNuhavp9mnBTJDMnAcM9e5ShF/vhmJU9L9bJA8yQotfmv6no01sHmmXUuBPlpSARUN7sc=
X-Received: by 2002:a05:6870:b06:b0:288:4eb9:5541 with SMTP id
 586e51a60fabf-2955ff9c48cmr8070771fac.0.1731353374567; Mon, 11 Nov 2024
 11:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com> <499869db340b2d4c257e12d20e15c200d0f815b1.camel@ew.tq-group.com>
In-Reply-To: <499869db340b2d4c257e12d20e15c200d0f815b1.camel@ew.tq-group.com>
From: Bruno Thomsen <bruno.thomsen@gmail.com>
Date: Mon, 11 Nov 2024 20:29:18 +0100
Message-ID: <CAH+2xPDip+mTxhMUHVXQfmYN5cROiMyFxMb1xzxT54y9cP5Acw@mail.gmail.com>
Subject: Re: [PATCH 0/8] TQMa7x DT cleanup
To: Markus.Niebel@ew.tq-group.com
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, =?UTF-8?Q?Jo=C3=A3o_Rodrigues?= <jrodrigues@ubimet.com>, 
	linux@ew.tq-group.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_112936_335756_EB900E80 
X-CRM114-Status: GOOD (  17.81  )
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

Den fre. 8. nov. 2024 kl. 15.03 skrev Niebel, Markus
<Markus.Niebel@ew.tq-group.com>:
>
> On Fri, 2024-11-08 at 14:49 +0100, Alexander Stein wrote:
> > Hi all,
> >
> > this series fixes some DT binding check warnings as well as removing
> > duplicated nodes. Eventually IRQ support for thernet PHYs was added.
> > Additionally add CONFIG_JC42 to imx_v6_v7_defconfig.
> >
> > Best regards,
> > Alexander
> >
> > Alexander Stein (8):
> >   ARM: dts: imx7-mba7: remove LVDS transmitter regulator
> >   ARM: dts: imx7-tqma7: Remove superfluous status=3D"okay" property
> >   ARM: dts: imx7-tqma7: add missing vs-supply for LM75A (rev. 01xxx)
> >   ARM: dts: imx7-mba7: Add 3.3V and 5.0V regulators
> >   ARM: dts: imx7-mba7: Fix SD card vmmc-supply
> >   ARM: dts: imx7-mba7: Remove duplicated power supply
> >   ARM: dts: imx7[d]-mba7: add Ethernet PHY IRQ support
> >   ARM: imx_v6_v7_defconfig: enable JC42 for TQMa7x
> >
> >  arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi  | 61 +++++++----------------
> >  arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi |  3 +-
> >  arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts  |  3 +-
> >  arch/arm/configs/imx_v6_v7_defconfig      |  1 +
> >  4 files changed, 21 insertions(+), 47 deletions(-)
> >
>
> For the whole series:

Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>

Thanks for the cleanup.

/Bruno

> Reviewed-by: Markus Niebel <markus.niebel@ew.tq-group.com>
>
> Thank you
> Markus
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/

