Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C831DE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qcha0zHynfu3Ub0724lpoIRWfmwOKO+r/oksIEeJ2RY=; b=4nMDoHzIk+5HU0J/4WEurzdifR
	vLwuydnvX1n4esAdL1TKr/q65OSfzv/SsFU1krd/6dVjcP/MHvVNemn6M5o/tKJj8LYL/Ejiy4Qg+
	T3H1i58te9lp590bVM5Q9kR7vfAueLUltXrVCeBskFQuVn/2u+DcxWcIQ+4cORanoioGPk6PRtwJP
	y3u+mK2t3bvd5KYi0g2yiTZs8MKaaA3G2WT560euVCkiqlVG9jzQz5fPlMqDc28K7OBTtMy1WnL7I
	6wawNRINU7PZRuiAt/r+7PS25u9RdUk4KQSJH3cjwR8SGcs8vD9C9jEwwTq1r3B634A95iF3GOa1h
	NuwMjf7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb0S-00000007HlZ-3AlM;
	Mon, 09 Dec 2024 10:28:48 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKalY-00000007EYN-3ctz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:13:26 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e399f8bb391so3276748276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 02:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733739204; x=1734344004; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qcha0zHynfu3Ub0724lpoIRWfmwOKO+r/oksIEeJ2RY=;
        b=l3FJaeBKZxabN0U2yH0BZIgNMTnAyv2jr991KUOTJwthNlhHRUQSxC3c/ILBn8SqGL
         XjhDRViu8CObgW1jvtLi3GAcELKdmo9uzpIOQOrci4oWuSkHNZYQytSdm1ZN00Lm5VUd
         8jHd18xWn6J1JyBq54fShwpo0F75+C2HnLMgneDHxVaqu1EEXNMP6mHYxwRcoEWG1PgR
         LU7CNXaRZy5yRj0W/ctFKUNyo8kEidFn29jEIhv74Ovt+ZkRUBP5uP33i5ey73uqEPRA
         j9psB/uR68HryV5/A0tV6tEdLZOfly+w4UhuqoC8c6f9ArCcQiqisfNtkD7NMil9Fm29
         nnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733739204; x=1734344004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qcha0zHynfu3Ub0724lpoIRWfmwOKO+r/oksIEeJ2RY=;
        b=AenNDsF28NOIueWfWES+SDekJ/bpztPs+OgkoiHLiRbKltyDIrbF8ybqCQmllccMj0
         w9D+w23VZ0aZZLJRLdIPkW+UItaoFwvMBr1UqJnxmkwzgzH+y3uVDaHDrCIlRS6ed2g8
         Jb+BzpSV+Cy7G//vk2o3dQhRrAWWKozFnkThb/16cOXPEKm3YQzHJZe6QSYbwW6Uu5HK
         IAX94uZ54LGnxu5zq7BfYraFS+hCIiA8HpNclL4wyVqMDs7X4tt2991u6PB5PNYwX2AQ
         +1fC6k302WZxCVQobjoyZa0Fs/mVaqwmWd6xrJHbHCp2pUT3QzuLfkFSYV4owpEecLQ5
         aBCg==
X-Forwarded-Encrypted: i=1; AJvYcCW667eAuafoCz7tqASs9DXR924I9K94DvALW7ZKMzS+CeRR/vO4xxtBp78VU+FeUv4S21f8jjRFoc3LEiMTx6yT@lists.infradead.org
X-Gm-Message-State: AOJu0YwWladwXsYuD7GCGHjUTX15FpXEG5aXE4diggbBaw1tTreeHbS7
	pJuGkxp1CDaKR4SrJSPaB21jz5P57OffGt1YkN/Gf4osA+WjU0LEOj5RQAnQu4ndGq1i044fONG
	A3lzYMkMBEbzf97niNv73cNn/cHp1rgs6ftC8cQ==
X-Gm-Gg: ASbGncthXPwZ4m9SdPmX2cFvlu63mNsnkJePTxpWWrx/jSJSwT/l/2mk1FyHtnV194b
	C4F3wI0Gci/4bvTlrZ5+aAQ3NAVC1P2A=
X-Google-Smtp-Source: AGHT+IH2bT+gKDdOGRSmqtWgH0YUH5W9D5gi5OgCuogw+kN6ib1DMYcXSnWkxS48FLs9InNsXTrt1JIXrBK8w04Q03w=
X-Received: by 2002:a05:6902:983:b0:e30:b98e:b111 with SMTP id
 3f1490d57ef6-e3a0b0c4f08mr8343409276.17.1733739203685; Mon, 09 Dec 2024
 02:13:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1730172244.git.Sandor.yu@nxp.com> <411e42c70e71dce33a80059f663fb6c58fb2ac8c.1730172244.git.Sandor.yu@nxp.com>
 <efciuvoptv7qxwauswfseb6zlt5w4fmjdbm3huxfsn63a6bm7u@kfgkkvqoz5x4>
 <PAXPR04MB9448F638D47B5495CF78007AF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <z6p6bewmykmufsghdojr4lvziurmmfpnrr5m4w3pfjlqzobpwr@zq2d2ukjvtac>
 <PAXPR04MB9448D68A5CA9755036E9B23DF42F2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <foi2sizfkppmunq4yqt4pex47alsvsjyqi3rk32fwyz4f5xepn@zdsx74bzzda4> <PAXPR04MB94488E0A549E519CEB8AA40EF43C2@PAXPR04MB9448.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB94488E0A549E519CEB8AA40EF43C2@PAXPR04MB9448.eurprd04.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Dec 2024 12:13:15 +0200
Message-ID: <CAA8EJprUKXxGbtP6M95Ep=2Lj2NSiUN31QNaysNJAzvO5g2LdQ@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v18 6/8] phy: freescale: Add DisplayPort/HDMI
 Combo-PHY driver for i.MX8MQ
To: Sandor Yu <sandor.yu@nxp.com>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>, 
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "airlied@gmail.com" <airlied@gmail.com>, 
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "vkoul@kernel.org" <vkoul@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, "mripard@kernel.org" <mripard@kernel.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, 
	Oliver Brown <oliver.brown@nxp.com>, 
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_021324_917145_03C8CDE4 
X-CRM114-Status: GOOD (  36.35  )
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

On Mon, 9 Dec 2024 at 10:16, Sandor Yu <sandor.yu@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: 2024=E5=B9=B411=E6=9C=8830=E6=97=A5 16:30
> > To: Sandor Yu <sandor.yu@nxp.com>
> > Cc: andrzej.hajda@intel.com; neil.armstrong@linaro.org; Laurent Pinchar=
t
> > <laurent.pinchart@ideasonboard.com>; jonas@kwiboo.se;
> > jernej.skrabec@gmail.com; airlied@gmail.com; daniel@ffwll.ch;
> > robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; festevam@gmail.com;
> > vkoul@kernel.org; dri-devel@lists.freedesktop.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org;
> > mripard@kernel.org; kernel@pengutronix.de; dl-linux-imx
> > <linux-imx@nxp.com>; Oliver Brown <oliver.brown@nxp.com>;
> > alexander.stein@ew.tq-group.com; sam@ravnborg.org
> > Subject: Re: [EXT] Re: [PATCH v18 6/8] phy: freescale: Add DisplayPort/=
HDMI
> > Combo-PHY driver for i.MX8MQ
> >
> > Caution: This is an external email. Please take care when clicking link=
s or
> > opening attachments. When in doubt, report the message using the 'Repor=
t
> > this email' button
> >
> >
> > On Tue, Nov 26, 2024 at 02:12:19PM +0000, Sandor Yu wrote:
> > >
> > > >
> > > > On Tue, Nov 05, 2024 at 02:05:51PM +0000, Sandor Yu wrote:
> > > > > >
> > > > > > On Tue, Oct 29, 2024 at 02:02:14PM +0800, Sandor Yu wrote:
> > > > > > > Add Cadence HDP-TX DisplayPort and HDMI PHY driver for
> > i.MX8MQ.
> > > > > > >
> > > > > > > Cadence HDP-TX PHY could be put in either DP mode or HDMI mod=
e
> > > > > > > base on the configuration chosen.
> > > > > > > DisplayPort or HDMI PHY mode is configured in the driver.
> > > > > > >
> > > > > > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > > > > > Signed-off-by: Alexander Stein
> > > > > > > <alexander.stein@ew.tq-group.com>
> > > > > > > ---
> > > > > > > v17->v18:
> > > > > > > - fix build error as code rebase to latest kernel version.
> > > > > > >
> > > > > > >  drivers/phy/freescale/Kconfig                |   10 +
> > > > > > >  drivers/phy/freescale/Makefile               |    1 +
> > > > > > >  drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c | 1337
> > > > > > ++++++++++++++++++
> > > > > > >  3 files changed, 1348 insertions(+)  create mode 100644
> > > > > > > drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > > > > > >
> > > > > > > diff --git a/drivers/phy/freescale/Kconfig
> > > > > > > b/drivers/phy/freescale/Kconfig index
> > > > > > > dcd9acff6d01a..2b1210367b31c
> > > > > > > 100644
> > > > > > > --- a/drivers/phy/freescale/Kconfig
> > > > > > > +++ b/drivers/phy/freescale/Kconfig
> > > >
> > > > [...]
> > > >
> > > > I'm sorry, my email client cut the email.
> > > >
> > > > > > > +static int cdns_hdptx_dp_configure(struct phy *phy,
> > > > > > > +                                union phy_configure_opts
> > > > *opts) {
> > > > > > > +     struct cdns_hdptx_phy *cdns_phy =3D phy_get_drvdata(phy=
);
> > > > > > > +
> > > > > > > +     cdns_phy->dp.link_rate =3D opts->dp.link_rate;
> > > > > > > +     cdns_phy->dp.lanes =3D opts->dp.lanes;
> > > > > >
> > > > > > Shouldn't this be conditional on set_rate / set_lanes ?
> > > > >
> > > > > PHY do not support reconfigure link rate and lane count.
> > > >
> > > > So, you don't support reconfiguring the rate / count, but you still
> > > > copy the new rate and lanes into your driver data. That sounds stra=
nge.
> > >
> > > The PHY will use link rate and lane count to configure its registers
> >
> > I'm not sure if I follow it. Do you mean that rate / count configuratio=
n is static?
>
> In DP controller driver, rate and lane count are determined during link t=
raining.
> These two parameters are fixed in the DP PHY driver and cannot be modifie=
d.

Yes, llane count, rate and swing are determined during link training.
However it's not a part of the PHY's job to settle on that. Usually it
is the DP driver who determines these params and then calls
phy_configure() to set necessary params for the next iteration of
clock recovery attempt or link training step. As a part of the calling
API the DP driver doesn't have to pass full configuration. Instead DP
driver sets only required parts of the PHY configuration and uses
these flags to specify which part of the PHY configuration should be
updated and which parts were not set and must be ignored.

--=20
With best wishes
Dmitry

