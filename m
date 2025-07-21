Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23246C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 03:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwI2hpcy3lcVV+QnTniw+hVEeGQWL5HMOKObyfZtgEM=; b=5Gn0yyU1UzcKDB1ZHnVROFRU1x
	nLIM9BBwDG8ZBCVPHTIs+uLZI4kjZBnFTt0WdUSKNnD3RjKIvoBgoIhb7zyj9SIO6AEXd3qgkBsJ2
	Zsz2dgpNRGWbvCu9l8fIqpeYIOn3F73Dfpq/f6HOixG3RMiKoRF7MhYJcsAAoIubFm7zYmUc/5M5A
	pPpkAellFhV4fRr88ABjDsXsPyD+GBJO8NCD++p2bNSnPCx2CzcaqUJx2ioI0viJPTSXRqJVx1f+s
	aXm7pq9XReXsErw9ccqKpRhsXKvPI58iRFX5/uCv60wIxZuDYQiNmBGDHro82mSTxrcLD17UboASx
	IQYlifSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udhJa-0000000G6lQ-0cVz;
	Mon, 21 Jul 2025 03:35:46 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udh8q-0000000G5Tj-1Kea
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 03:24:41 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-87c09672708so91741339f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 20:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753068279; x=1753673079; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwI2hpcy3lcVV+QnTniw+hVEeGQWL5HMOKObyfZtgEM=;
        b=SN3oju6bbfe8gGkQ/XV4gzdA02o/H7TIcv0DjndfSRz/8vN/HedpSIUF4g3qXn/OB5
         4P3+xjGCFOvyDvS5dAOmXvUflsuVApqkp3Esa7aY8yT+5NdIKoUQllQZDRobgN/f5qno
         XLWPgvHu0DOCXuP3zo3fmNKFDBHH8XK1w84iOy80pyYrm63IFWDwbze/MU3m77dZbnM2
         P8Rev/dMEe5T3VsLeqGRPQqO9+bYZY9JmjGrWdzFLjeVMBLAhNjVkHRv1sGZLSIiLc9w
         1RbOTxiTxUCoH+4iq3T2w14b6xfsTmT8+BM094Tc76u0LHjRyps3PshXwuYuZicv8sN7
         9HfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753068279; x=1753673079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OwI2hpcy3lcVV+QnTniw+hVEeGQWL5HMOKObyfZtgEM=;
        b=NUnfQVoVjehWDbo2iWQA/wVdlC8xTu/cTscdL340hITqju5KU0gt1yxPMw4IyMJaAa
         bF3xFyKF8kYcnogPFDHGHqKIk3kgpjMRA+S836zSluOiFF8SwUNJANTBRX0EcdddVLFQ
         XSRzOnY2xRc0MPvEfXfIQ8WZcxsy+WYsdfhQTl3OV+8KNsGBiL2F9QvlIaMEPMsSMcRn
         cR4EyvxvKetWH2AhMbUzxU7BAI56xIqO07D7C4k/CGCTm/RYm3Uh+oV431N4ebBRfyW/
         bwZslpuxBZsYs4tvsYFsQCAtARcE9Uj04Oxp/Y2y4eCXvqBj34hIbyKj4IeqNhetcKJ+
         1veQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuyJY5FXbUOibGrmveg4jkA3dJ62bdf/yCU2HVMUAwtsztv9wPwDXzoR6fCjC+GXquyMBHVUNTAOXJu1O7+qi7@lists.infradead.org
X-Gm-Message-State: AOJu0YxOzs3KbvP3YLLLch7VJAyt0X6olbnpbp1KwpUwwy/F8bZoXBpd
	ppHk/eglSuhnxRyIroAjpcGwHQa5oooFaDVmu5dC9HJh9r5mWIldIwsjVEZX+irblvE7Ux+TwYN
	xl9oMFnZ4b88GTlodIS+9Tt72e8bS2XU=
X-Gm-Gg: ASbGncu3QTJGth1L3Onq+rtVWoA33a7O4/nwBA1geqsEFeaZMAxA7zWDbsEK9MqTnZ8
	u1DMOE9aw5rT9lzjHm/LP1D2mi5Jqe0G3OeZnh5JR1Wn3qL8JQ0ZRLXXkmtJc/IwjQfh3sjncUB
	90qh3uN/6Okr3fe1nnI1UQ7LDwB6ZvVVqfIyzDBVASkIqb5HpuOLw4qpmsKqyeNgy8sBg3TZf0m
	7Wjgb0=
X-Google-Smtp-Source: AGHT+IEc4eCE70WDmGsnRlEEKfMnJZ+xtO+dDhCQVQfDpz+1aJdPRzDCoXXMD8/WnfPbQf13oi/XE9aCmcR1NPGUpLY=
X-Received: by 2002:a05:6e02:2582:b0:3df:2f47:dc21 with SMTP id
 e9e14a558f8ab-3e282f5547amr213949295ab.22.1753068278812; Sun, 20 Jul 2025
 20:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-2-shengjiu.wang@nxp.com> <aHpzElP09pEOi4id@lizhi-Precision-Tower-5810>
In-Reply-To: <aHpzElP09pEOi4id@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 21 Jul 2025 11:24:23 +0800
X-Gm-Features: Ac12FXy5bUMTlHGaq7PpDN0ZSeNbIlr9FhbAx0Aren2E8HjpPRhVBNLuNDI2CRQ
Message-ID: <CAA+D8AOQ9v_qCHecfL1brXUJgpA3UjdDq-O3J9udQzp2xm3J9w@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: dw-hdmi: Add function to get plat_data
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_202440_356313_A5A38B75 
X-CRM114-Status: GOOD (  20.19  )
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

On Sat, Jul 19, 2025 at 12:15=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jul 18, 2025 at 06:11:47PM +0800, Shengjiu Wang wrote:
> > The enable_audio() and disable_audio() callback pointers are in
> > plat_data structure, and the audio device driver needs to get plat_data
> > for assign these pointers. So add a function to export plat_data
> > structure.
>
> drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
>
> Add API dw_hdmi_to_plat_data() to fetch plat_data because audo device
> driver needs it to enabe(disable)_audio().

Thanks for comments.  will update it to the next version.

best regards
Shengjiu Wang
>
> Frank
>
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
> >  #endif /* __IMX_HDMI_H__ */
> > --
> > 2.34.1
> >

