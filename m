Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56681C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 07:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/S3cclAsN9hIgRcEo1wMY4GsJTg8hhVdaN6QhaC45E=; b=LmuZ8IEmf/6rBSYgVn2OiafZY1
	kXuOayjImmB8F2FO1f/gv8GkT/18wyfMV40MCJc5gGewFSvBID+8LW6/OGebNQffCHRX8Q4N+xTsP
	SB8sFCgZQDwpH6Bdnb0Yt9yh8JgeC8yxTdpWctOMK/OFif2EkNn0Rqp2w7Yu5KCVFxmbSDRB8gNqP
	qd2QMCm6A2CfM1/wmyKwqJOhV5MQgnnrN+DafwaUTBM3acREqdPFYzAwngLEmwBr0VUxHYbs0h+7e
	yWzLjXAT0TcU7MKHky1CuRSRbQAwxDcZTCCv5d0FL4DNLHJE5+cwhXKTKjkg61x7K4H1cg4W8xoWS
	qVNmn6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueU6C-00000004Gbz-11us;
	Wed, 23 Jul 2025 07:41:12 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueU1g-00000004GBp-2bmU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 07:36:33 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3e2c683524fso4457065ab.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 00:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753256191; x=1753860991; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/S3cclAsN9hIgRcEo1wMY4GsJTg8hhVdaN6QhaC45E=;
        b=IgKJ0G30pYhAnIHC1Gb79EMbTf+S2P7eqWGGorfSIgSZk9m83o7SGq2TcqBqyLaJV8
         hmQ1/c/9tBVHbr/4nqjbUYrZyD7qxBy49ju70DTWoi64XIckt1P/W+OtbWdonN/aPzkv
         dzlKjC6wIt/eoxfg5k1FKVaYkOak51JWNT4cdGT7cLxZ+5dCpnV3oo1g2QveAvtTrGIF
         mnvJ96SRWrlQLGxFWmg7/t1MMyxSvOVeBmVG0l5PKWT3BVP9N4psvmSXY67sdi34CYfF
         D4ihGzrjjkLGAd+7Ge8E2NDiN/fDhW6VmPyYBjak1CbL65d2L64y17pP4u7bvwRpVrmc
         UXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753256191; x=1753860991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/S3cclAsN9hIgRcEo1wMY4GsJTg8hhVdaN6QhaC45E=;
        b=e/wwOtq4gAJodmNVus/53tU7v9UfolK+GiUFfW6+mENzhKA+XrZEf1TWzswCxDqw8a
         ajkBec5aU1tpUn6U/p2MgDy0FspHqf4XyV9O2PeIHAqqJ08kmC8omMyhxsyB2hBDlCSh
         NLLF+SbsMNouh43yqMB+SowyAOcjXP1j6KkdsZWT0e85hgjoKHMbJL23DlnppSo0HpwM
         8nwnetnZHXMjggpqW+8lKlF/DjqJX2Id0DTh7Dm+7zwzqPbbFoVdhutPaU0zfno3VxzW
         +pY7CZL1S3qKXWlQNFqJrgDHxhUcsMIXf1BJq3WC+Fnm7TEmd/Z6YJce1vZ4FV9naPTo
         IKtg==
X-Forwarded-Encrypted: i=1; AJvYcCVjjFcdv4TZ/DLnPeh3udQ9MgVG+FBXjkAsAatTB3UvAVQe/99BjVl9xwmfVP0IdM4C/kmStp30n/nbPom33bA+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8/UE+BoNAHdaf6DNkRjPj8YQPiEFCVioPCKb3hPxHZ0hTaf0F
	MFKtSMhhXMzwBz8oGCkCBV+W6vUKQWyxCdvB5egvTkZwmZelk4PapOLAvlPyMSnxtFEcRbIrYY6
	LWyaqAD3C6euD6co5bonMWaVoY6dvddE=
X-Gm-Gg: ASbGncvXcJmZtO1gPzDADzD9FhrT0otJkzSD0+zl/5S8G8ZB8p+/8m91YXfhjGSYRRV
	CDPZaKtN/hBNiykdMSGKOY76+3GIticROVPQRu1FVksJ7PXQyI2VrpGHmzunrxAfmmlaabT+w45
	YmH6wnsINDl7ahIa71+IuogwMgIZPCPCy4egkxPPINPsqvacHoTmWmNSQ5MtrjMZ6JSy/+jHkoM
	vhTvAI=
X-Google-Smtp-Source: AGHT+IHYow0XlvdEpZbbLeYgBBO2y4gBFRlSOQ97MzENf9ZWPixLLuVk3gzT14yo44EQSarqRYKCLdWkxl7mB1g6H/s=
X-Received: by 2002:a05:6e02:1a22:b0:3e2:c5de:5ff with SMTP id
 e9e14a558f8ab-3e33eabdbadmr33868505ab.3.1753256191292; Wed, 23 Jul 2025
 00:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-2-shengjiu.wang@nxp.com> <4731eb9b-9a29-4065-8dac-06f558e78e02@nxp.com>
In-Reply-To: <4731eb9b-9a29-4065-8dac-06f558e78e02@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 23 Jul 2025 15:36:17 +0800
X-Gm-Features: Ac12FXwK3jsd_JjUkeN-4HVNavY2uEVLQxHw3AgCqwKwIWwQEHZUSbjiR65_C0c
Message-ID: <CAA+D8AOkOV0850yH+96deZ-haFSsNCw=hE+G7m+svSJBsz3c6Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: dw-hdmi: Add function to get plat_data
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_003632_676730_15E47811 
X-CRM114-Status: GOOD (  21.00  )
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

On Tue, Jul 22, 2025 at 3:38=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Hi Shengjiu,
>
> On 07/18/2025, Shengjiu Wang wrote:
> > The enable_audio() and disable_audio() callback pointers are in
> > plat_data structure, and the audio device driver needs to get plat_data
> > for assign these pointers. So add a function to export plat_data
>
> {enable,disable}_audio pointers are directly assigned to plat_data in pat=
ch 2,
> instead of using dw_hdmi_to_plat_data().  dw_hdmi_to_plat_data() is only
> used in patch 2 to get hdmi_pai pointer through pdata->priv_audio.
>
> const struct dw_hdmi_plat_data *pdata =3D dw_hdmi_to_plat_data(dw_hdmi);
> struct imx8mp_hdmi_pai *hdmi_pai =3D (struct imx8mp_hdmi_pai *)pdata->pri=
v_audio;
>

will update this commit message.

> > structure.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
> >  include/drm/bridge/dw_hdmi.h              | 1 +
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-hdmi.c
> > index 76c6570e2a85..3dfa42178f6c 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -198,6 +198,12 @@ struct dw_hdmi {
> >       enum drm_connector_status last_connector_result;
> >  };
> >
> > +const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *h=
dmi)
> > +{
> > +     return hdmi->plat_data;
> > +}
> > +EXPORT_SYMBOL_GPL(dw_hdmi_to_plat_data);
> > +
> >  #define HDMI_IH_PHY_STAT0_RX_SENSE \
> >       (HDMI_IH_PHY_STAT0_RX_SENSE0 | HDMI_IH_PHY_STAT0_RX_SENSE1 | \
> >        HDMI_IH_PHY_STAT0_RX_SENSE2 | HDMI_IH_PHY_STAT0_RX_SENSE3)
> > diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.=
h
> > index 6a46baa0737c..a56a3519a22a 100644
> > --- a/include/drm/bridge/dw_hdmi.h
> > +++ b/include/drm/bridge/dw_hdmi.h
> > @@ -208,4 +208,5 @@ void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, vo=
id *data);
> >
> >  bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi);
> >
> > +const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *h=
dmi);
>
> Nit: Add a blank line as it was here.

will add blank line

best regards
Shengjiu Wang
>
> >  #endif /* __IMX_HDMI_H__ */
>
> --
> Regards,
> Liu Ying

