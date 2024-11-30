Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7764BD735F9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 08:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbSnMoGC544U7zX5fIfp831y8T12sKgnt66TAb2i060=; b=sa/dhbwKDnaS9SVTYe/C6z0l8H
	5/zh+5boc5SqhqQSBdQqedGq+1OF9agPdNFWxQhuN63DPlFbQMcyUtaLybFZVU6vSALIG2nAA9Kfg
	OsAxeh5S23P38N2Z0lChheMNKsfsEPRhTMsjbGs4GNwjpEaEdkUBd8hgzmOkR+IDpkqy+am3YN5T3
	oKvPhuaIW1N7pjtzOLhw1HGy6eC2yRc2BAJKmdf5OFWhyiNWxqRQemUlW3ZmAbetXDz8+gbZseB5s
	VOcfnzA1cPT4aoDoDxB6mGeWyKvjKYPpHlfVuDekUWWDHK9meLGe+P7QZveTBONIlTWUU0yduEHhC
	a2t1tR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHIqm-00000001ctx-2h0i;
	Sat, 30 Nov 2024 08:29:12 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHIpn-00000001cmg-3ObL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 08:28:13 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53ddb99e9dcso2584837e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 00:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732955289; x=1733560089; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cbSnMoGC544U7zX5fIfp831y8T12sKgnt66TAb2i060=;
        b=skGJKF75LCfELQVC8liH9KHPLmOx6BJKOC3A3zi3cN8Pe/EjHzRRBVODCF+nWJA0s5
         xsF508nN8Du9V2D6+UvFaDo3Y3vHe0foqvq4VGPqN0jzEGdtHGsLs9P1Nj3L9ShYuNfW
         r+Rvd3khFHC2EyJWoeLNzxYi5VzgbUoSxiYfQNF8vFvbzxFXxndNRfmk4E3JWe6VTPnt
         A4FRl31M3jfJpwCDQulz1I+sV2v97OCWq8C/V+GkgSLZufrAm2+1fFlgsjnHo3bYDc1X
         OjjFN3JcQIr3qCxewJfNf1LrVniLG5XZ4T7f2h+mltnJGRsBPzoK6JjKJBP5uIBuII4v
         3N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732955289; x=1733560089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbSnMoGC544U7zX5fIfp831y8T12sKgnt66TAb2i060=;
        b=WSxtliIf/CtzlXnpw186HgeDt+UbIy+BwSf+C2Ejdx6/3rBdZqVnJKrShqAmswMz05
         Bng0vhEFZMmIH6IJTnXuzN/dq0M2OC7qqFW1WMhZ22hhSSjt9eTkxs2x9SdkYREByH1H
         r4bT2y84XZ4qpMm//wuH9dxIMYVHfffNwF2j6qHyBCKEVTlsBJ8PzQRlBA8gzAtIkvpL
         Rxa+hWCDvWWpsuluPewL2X/RXkfyKkfbGWV/bqOONaav03CoxKdpEk4445JXfVTx6qfA
         DPzkGTQz4LBH9wQ5n1GTmOcjXCo2UmYzR1Y+aDFNlwkZ59fGMchYyQyR930lOBD4pDzk
         VoMA==
X-Forwarded-Encrypted: i=1; AJvYcCV5uF64zkg+xjmKcBFNCRo5bVWL7U/JjoRqDrEs71gpx3o86f1UpMcTsC/Afl3rC1JpiqRC62k8GBhaUjtEjBcj@lists.infradead.org
X-Gm-Message-State: AOJu0Yybn4N2UpTnLuFvUKDYkBKUfLqNj5CjFLIs2embE1gEWDI6Rpsw
	oaD4FgMpZHp+bauujyYOX+NpvpyeVkbxL1fbj6MNbf5FPbafyjBHv0E8U/smZPo=
X-Gm-Gg: ASbGncu1RuTWzsvd0fYCdtJY0I2fPXx2vX5q8kZPTEar1gOy7Y0zlIrmaJH+dIg3G3P
	GWToA448zlx91xFVjUhcJ84PzByaeSBwVe2aW/IEKG/APRwCJkeuS/6EsMpWObyx4C4yisF+eEU
	jL11u/KeGv2dUNhsB0byhBZs5e3UpWAVB80hjHu2g1+3vEyopMXSiwi61dSxAH4cGCPV17Tiu2F
	01f2/c7zlUxjGBzZUygD1EXM2lj1Dk2NDtgXbdgnR//qEmm1S84Fsp2frbzzRVypOPZPc9tUY9T
	GMcilBRm8mjWuKSKcjL6G3spWngP0Q==
X-Google-Smtp-Source: AGHT+IFgWR3gAkOG9mafLXj/TmNlCERT2tB84SZRTKkdRAWB1jZom71zptQRqQUiP9OjF7eSxCiFOQ==
X-Received: by 2002:a05:6512:3c9c:b0:53d:e544:3fda with SMTP id 2adb3069b0e04-53df0114865mr9728745e87.55.1732955288602;
        Sat, 30 Nov 2024 00:28:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f2cesm689752e87.121.2024.11.30.00.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 00:28:07 -0800 (PST)
Date: Sat, 30 Nov 2024 10:28:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sandor Yu <sandor.yu@nxp.com>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	"jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
	"airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"vkoul@kernel.org" <vkoul@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, "mripard@kernel.org" <mripard@kernel.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, 
	Oliver Brown <oliver.brown@nxp.com>, 
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [PATCH v18 6/8] phy: freescale: Add DisplayPort/HDMI Combo-PHY
 driver for i.MX8MQ
Message-ID: <ux55oif6kyp6thojj55ymlcjjgsmqbrc35wtmmfbaun7qlxfuw@k6fi3ea5laty>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <411e42c70e71dce33a80059f663fb6c58fb2ac8c.1730172244.git.Sandor.yu@nxp.com>
 <efciuvoptv7qxwauswfseb6zlt5w4fmjdbm3huxfsn63a6bm7u@kfgkkvqoz5x4>
 <PAXPR04MB9448F638D47B5495CF78007AF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <76D430C8-3DBB-4D89-9361-9B5D3EDCF067@linaro.org>
 <PAXPR04MB9448A7F6973D9DAE98115716F42F2@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9448A7F6973D9DAE98115716F42F2@PAXPR04MB9448.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_002811_862184_FFDC4206 
X-CRM114-Status: GOOD (  34.30  )
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

On Tue, Nov 26, 2024 at 02:12:04PM +0000, Sandor Yu wrote:
> > 
> > 
> > On 5 November 2024 14:05:51 GMT, Sandor Yu <sandor.yu@nxp.com> wrote:
> > >>
> > >> On Tue, Oct 29, 2024 at 02:02:14PM +0800, Sandor Yu wrote:
> > >> > Add Cadence HDP-TX DisplayPort and HDMI PHY driver for i.MX8MQ.
> > >> >
> > >> > Cadence HDP-TX PHY could be put in either DP mode or HDMI mode
> > base
> > >> > on the configuration chosen.
> > >> > DisplayPort or HDMI PHY mode is configured in the driver.
> > >> >
> > >> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > >> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > >> > ---
> > >> > v17->v18:
> > >> > - fix build error as code rebase to latest kernel version.
> > >> >
> > >> >  drivers/phy/freescale/Kconfig                |   10 +
> > >> >  drivers/phy/freescale/Makefile               |    1 +
> > >> >  drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c | 1337
> > >> ++++++++++++++++++
> > >> >  3 files changed, 1348 insertions(+)  create mode 100644
> > >> > drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > >> >
> > >> > diff --git a/drivers/phy/freescale/Kconfig
> > >> > b/drivers/phy/freescale/Kconfig index dcd9acff6d01a..2b1210367b31c
> > >> > 100644
> > >> > --- a/drivers/phy/freescale/Kconfig
> > >> > +++ b/drivers/phy/freescale/Kconfig
> > >> > @@ -35,6 +35,16 @@ config PHY_FSL_IMX8M_PCIE
> > >> >         Enable this to add support for the PCIE PHY as found on
> > >> >         i.MX8M family of SOCs.
> > >> >
> > >> > +config PHY_FSL_IMX8MQ_HDPTX
> > >> > +     tristate "Freescale i.MX8MQ DP/HDMI PHY support"
> > >> > +     depends on OF && HAS_IOMEM
> > >> > +     depends on COMMON_CLK
> > >> > +     select GENERIC_PHY
> > >> > +     select CDNS_MHDP_HELPER
> > >>
> > >> This can have problems with being satisfied on randconfig builds,
> > >> because CDNS_MHDP_HELPER is deep inside the DRM tree.
> > >
> > >Yes, it should be. Change it to "depend on CDNS_MHDP_HELPER" will
> > eliminate this problem.
> > 
> > No, depending on a non-user-selectable symbol is a bad idea. You should
> > either depend/select all necessary symbols or, better in my opinion, move
> > your helpers out of the DRM tree.
> 
> How about change CDNS_MHDP_HELPER to user selectable? such as
> 
>  config CDNS_MHDP_HELPER
>          tristate "Cadence MHDP Helper driver"
>          help
>            Enable Cadence MHDP helpers for mailbox, HDMI and DP.
>            This driver provides a foundational layer of mailbox communication for
>            various Cadence MHDP IP implementations, such as HDMI and DisplayPort

I'd say, it's a bad idea. Helpers should be automatically selected.

> 
> Finding a suitable location for the helper code is challenging. 
> It needs to be shared among various IP versions (essentially different SoCs) 
> and across different driver types to facilitate mailbox access.
> I've searched the kernel code but haven't found a good precedent. 
> Placing this helper in either drivers/gpu/drm/bridge/cadence or drivers/soc/ (as you previously suggested) has its drawbacks. 
> drivers/gpu/drm/bridge/cadence at least provides better context for readers.

Yes, I understand the issue. However you might as well use drivers/phy/
for the helpers: your DRM driver already depends on GENERIC_PHY, but
there is no dependency from the PHY onto the DRM.

> 
> > 
> > 
> > >
> > >>
> > >> > +     help
> > >> > +       Enable this to support the Cadence HDPTX DP/HDMI PHY
> > driver
> > >> > +       on i.MX8MQ SOC.
> > >> > +
> > >> >  config PHY_FSL_IMX8QM_HSIO
> > >> >       tristate "Freescale i.MX8QM HSIO PHY"
> > >> >       depends on OF && HAS_IOMEM

-- 
With best wishes
Dmitry

