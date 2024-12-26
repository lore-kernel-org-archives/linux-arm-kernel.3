Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F9BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 20:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLsVwUAfZmDtYibCKMVr36pxn6WsjEglULQ5ElBq4jE=; b=aCHQJcmfL/fVP+jVDCq4zJ84dN
	7Y9G70BonbZjwNxFENbjnNHI/OBzrqhYManatgiCOmO5Z+eaBH1xnEMcsva6djJlQo2mv7wx4vwPY
	0nQUjgWnaNThbvpKgq9pChmuYv5Xo06tQtnwKyG2EjhnL4vksR7PGXIwboOBFxYGfd3TdDHaWOsux
	Vg86g8fw8XLa2DwKo8h9S6kayjK9sur3EUhp88BuvAjX2MRGgo1zVJeuShiCjMLIKT7Tr+LmHpGe1
	HEIXndqJxs+pKhqHzI6fZIwQ99lAFhfdPbQa8swYZdZ0y4EFFGIz6AnN9/DoaRMdu7dzWT9Repp0X
	46gROwBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQuNL-0000000GMaB-2DVE;
	Thu, 26 Dec 2024 20:22:31 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQuM9-0000000GMRk-1pZk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 20:21:18 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e5390ed85a1so6193075276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 12:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735244476; x=1735849276; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jLsVwUAfZmDtYibCKMVr36pxn6WsjEglULQ5ElBq4jE=;
        b=lFp0Wo0lFdFaP9s7YsjrjSWDbqbORfBnehPliTFtmuFd+Tc9uVtLh+yyyNtnm2HdJR
         5LCRG6mTM+WcWJna5lU7Y5WViz0RBKnmq+2uX1UNPLMAqI5fFBE1bG7SQ04PNx2ezqQx
         6bNptA9/OIsBZtaZk9v/a41DOp/jHk0iC/DbU8qLdEi9IQt38Nd+Ztwm73hIMyMgDshA
         OtidJitS/Z1+iUxfqzeQ/8k7ueARB+Wc72OUpp0bwtnB4yDBjk/pnzYsaLUzpIoly22e
         TvushDq5HzJsMvWANVtXnlJlz9so7+ZIFb+Ag2bkZUUkJsDWMnt7usB0zOdn2ENWJeOU
         gy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735244476; x=1735849276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLsVwUAfZmDtYibCKMVr36pxn6WsjEglULQ5ElBq4jE=;
        b=weir3ZY9cx3CcI4WVU+TuFdm70DFV3pXHPPhX3CE2bqcBGFXo0HXpgdVOij/eC58yP
         FR9IOqc0F7bgNGP6OQQZ+x7dJsvfXZLKOinsb91ZR8HHyLM8TJpvkhdxLlf70XVwmvAR
         mR5JDmvH91R2PUZzupEX6ORaX29860i4GJ21XSTn5LeJcGkOZ7a8a7PEqbwKZoVT5oa3
         iIHP7sqCisSz0yODascRd95dZKO+5hflBdQq9F5YhoqqsyvhxSGotOCV92NknmNtanM3
         ers/qNfy30GEzrNmi4prT8pzFDWwe6T+qEZ8mNBGvNs+qRXe4xksk/cbZ1c5LmaZLIde
         j+xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTyhuBSliiaxoqQsblOZXewfUBcoWPAtg+P8olCvsiCkert/gNFtnsrm00W8Cgyv3GqF8Z3WIU3V520pnmcX95@lists.infradead.org
X-Gm-Message-State: AOJu0YzvZXCOTZFI7+0q7RfkRGAy0coEAb3EqhhCAjpxZ53D19GEOCPa
	bq5b213hBzxJE6CG66fMbTDr/QV3eEavDVjsj3zJ9hETzBTOAZQsJLhfNfhE8VX/SxfxUAoaFqq
	MYqXGxJ3Zzf7MVECgWXDwD/nXtZ2dq+U/+x9xtA==
X-Gm-Gg: ASbGncv7EqoNrTleKhnS1T1K242EVDTfQSag81EEdny26XI26e8x9j68xWpxzwJmUvg
	9Ktr4JOAoeZLLA4lCWA5L3esvQbBfQN/mmJlSDOD4fYxL9dfUlTv5Fi9M1UnGFa4dEWRPgQ==
X-Google-Smtp-Source: AGHT+IHpTK50yeGUEdpQbMNQSFdQBzjTFqErLlWqrFBeWf8+TuAIQeq3gV48/gavm3fRyyCFeJxcIJC5tp7UGxWvuvs=
X-Received: by 2002:a05:690c:fcc:b0:6ef:6035:82b4 with SMTP id
 00721157ae682-6f3f823d3afmr184345497b3.35.1735244476035; Thu, 26 Dec 2024
 12:21:16 -0800 (PST)
MIME-Version: 1.0
References: <20241224014701.253490-1-marex@denx.de> <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
 <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
In-Reply-To: <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Dec 2024 22:21:05 +0200
Message-ID: <CAA8EJppyPQETyJgYmJPZZu47kb-kVQ8tp9zjrbNO+GRavDXpEg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
	David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_122117_486619_9230D1F9 
X-CRM114-Status: GOOD (  33.99  )
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

On Wed, 25 Dec 2024 at 22:50, Marek Vasut <marex@denx.de> wrote:
>
> On 12/24/24 5:21 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 24, 2024 at 02:46:14AM +0100, Marek Vasut wrote:
> >> The dw-hdmi output_port is set to 1 in order to look for a connector
> >> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> >> The output_port set to 1 makes the DW HDMI driver core look up the
> >> next bridge in DT, where the next bridge is often the hdmi-connector .
> >>
> >> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> ---
> >> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: Fabio Estevam <festevam@gmail.com>
> >> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> >> Cc: Jonas Karlman <jonas@kwiboo.se>
> >> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> >> Cc: Liu Ying <victor.liu@nxp.com>
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> >> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> >> Cc: Robert Foss <rfoss@kernel.org>
> >> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> >> Cc: Shawn Guo <shawnguo@kernel.org>
> >> Cc: Simona Vetter <simona@ffwll.ch>
> >> Cc: Stefan Agner <stefan@agner.ch>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: imx@lists.linux.dev
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> ---
> >> V2: No change
> >> ---
> >>   drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
> >>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
> >>   2 files changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> >> index 9a480c6abb856..d8e9fbf75edbb 100644
> >> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> >> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> >> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
> >>   config DRM_IMX8MP_HDMI_PVI
> >>      tristate "Freescale i.MX8MP HDMI PVI bridge support"
> >>      depends on OF
> >> +    select DRM_DISPLAY_CONNECTOR
> >>      help
> >>        Choose this to enable support for the internal HDMI TX Parallel
> >>        Video Interface found on the Freescale i.MX8MP SoC.
> >> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> >> index 1e7a789ec2890..4ebae5ad072ad 100644
> >> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> >> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> >> @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
> >>      plat_data->phy_name = "SAMSUNG HDMI TX PHY";
> >>      plat_data->priv_data = hdmi;
> >>      plat_data->phy_force_vendor = true;
> >> +    plat_data->output_port = 1;
> >
> > Quoting my feedback to a similar Liu's patch:
> >
> > This will break compatibility with older DT files, which don't have
> > output port. I think you need to add output_port_optional flag to
> > dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
> > is set, but there is no remote node.
> Looking at the upstream imx8mp*dts , the oldest commit which adds HDMI
> support is commit:
>
> 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")
>
> That already contains the HDMI connector node. Every follow up addition
> of HDMI to another device has been a copy of the same commit, with
> connector, so I think it is safe to say, no upstream DT is going to be
> broken by this change. Do we care about hypothetical downstream DTs
> which may be missing the connector ?

I'd say, not really. If you have to resend the series for whatever
reason, please mention that in the commit message.
If you don't it should be fine.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

