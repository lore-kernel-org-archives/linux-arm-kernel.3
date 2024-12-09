Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8416E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEhLMNTleL6gDMX+OMpFQyaTOOwXEej5ArGydUoWB/8=; b=fbYQ+K8opoa7vXd6GTs1K6rB4y
	b4bH/Bbh+Mb80j8MnSPsli1Yi8sJ0vPQcGsi5RzGn7Ws3g+an/ec9ipmp17rTSSQ1cJna2kRzs4gi
	Kg2QuQln1zd+l6eIrn0QyB0l+Ixt0XkPP7GW9fXGVBp76acHCgGikkO+VTlmNWizglFWuMbEls5ye
	oUzw4WBKEBZtOrt/8Od9OXMfzMCwtwiXHbS6VUgm/dy2DDDbEQbdQ5LdGcnGzrycpe+FPLIMgEJXe
	ST5mZVce+7TjllXoj9wNDCv8w+0y5kAotGpxPuBY3HMW7yx/HQ5Yc8UTW5XFrmVE3QE6OUrOUwIRW
	uzZCasIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbFg-00000007MBl-08Zm;
	Mon, 09 Dec 2024 10:44:32 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb5m-00000007JIU-3W4w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:34:20 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3002c324e7eso30566151fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 02:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733740457; x=1734345257; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hEhLMNTleL6gDMX+OMpFQyaTOOwXEej5ArGydUoWB/8=;
        b=WxHshEBw1nGZdFEKj4wIpG3ILOBIE7izX7wmgY3GGg0ExZZAZhxgAuyp/Y4efHGFyt
         t17kVfrE9JGSLXTeI5IViSbc42eiOQIY+RnA2IbyepsdpIQmk+4OStnfbebYUScnwCzf
         dL2AGelwufFCkoEr9OMQBPD1DSjJb+irehJ2O8fCwYzauOojdur+eaBKF6Mi9d10/4nK
         Vwf9qkuETdAQ+imDuTsZZYg9y1nz7Pm1pemUflEn56KGwi5KuPeXCwQMMCDZP1xPx6Sb
         rUpvkF0HhiuXl0RSauyy3uAaFkUw0qPJfwOw739TrorAsBGnu/4/e7lYNQWeFZtTOyZC
         5bmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733740457; x=1734345257;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hEhLMNTleL6gDMX+OMpFQyaTOOwXEej5ArGydUoWB/8=;
        b=Ohlp9zRLjby3l9heCai3sPH4HJd+iS9CohNTIUlYSyf5FoA4gilIDDONHdPfqZhHlE
         VbOrTTP9pXHycjkI8/N6kyXObGE820mhr2UiJqv/wsUTCm7FI8KLQvMSaTnXdIQmdNLt
         YKlzwUJ5cTyo0rEkgECM/GEawimB79D4zndJ6BuBjyAuT+lLumXULeJuGVm1kVnrGR8q
         OiYCdGdNvhW1+WsLjqSxozJnnn1Cn9xZbNudGI89VgVxshRlHW6dq4szRL6CQegvisGK
         itEkSPT0Fg7TexBBNWzAZi/7xKwErFWYudanejk5aMGj6mbGyxlLN6ImCsGm5HwwVlRM
         BBfA==
X-Forwarded-Encrypted: i=1; AJvYcCVdDf+lQMAw4CIgPU2cgUigUIW4uoswxjT3DWzEAH1dqq/DSVV3Bbqzvq5CH8fxVaXgopc5Cp8RRlPZ+vRDUitD@lists.infradead.org
X-Gm-Message-State: AOJu0YzYY4Mi/ae76QX9P8/uraIYU8Dik+/8mEcpYUYRmw96J7FD2LOp
	NU7h04glzsC/5VCY58CVXA3fT2+vVdNxQXltcCuO/3SHOATiWMcR0GXNq642vNk=
X-Gm-Gg: ASbGncvEJHPPKe+dS6kVGRacSCAXMsKnJXCc4fNf7YpClx3Una9T6v7H+jC6GHH91hK
	UPv9vYjRhpcDga7bSsb28BsNRceHPGJgnEoafN/QJiMlku5OWjjfNa+eq7ktYQ18OWPKytzS219
	kkxEkMqDXm1BwhWCmwKamranbLVUWohcVwwak13ZHdrHbv1swGGeBeRuWICCSWPUxmZ7sInnJhL
	TqyS3ZNNynDbjPhYT3+9q+4q1qM1glzzcdyWhLlpNYhU4Yw3LKQCsaYDotlGDVviV0r3QYbWOxI
	8FHQ30NTu5FVJTp40g2QLEWaYFO5aQ==
X-Google-Smtp-Source: AGHT+IFNlBhxiOyHWAEAkiJz2Ehdp+m4AvAvGfaYvr8lFTl50vAiN44KAJkPfR3fGz840ZteQrXe4Q==
X-Received: by 2002:a05:6512:1248:b0:540:1c8e:b3eb with SMTP id 2adb3069b0e04-5401c8eb587mr1854409e87.44.1733740456809;
        Mon, 09 Dec 2024 02:34:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e336ca054sm975639e87.103.2024.12.09.02.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 02:34:15 -0800 (PST)
Date: Mon, 9 Dec 2024 12:34:13 +0200
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
Subject: Re: [PATCH v19 4/8] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Message-ID: <fqrxw7yc7btvqccqy6mksqufcacm6o52xmk6drlqeeepuyfp62@gpjiox76h4cb>
References: <cover.1732627815.git.Sandor.yu@nxp.com>
 <e32c909ea8744fc5ea89aa3b4eed501efbaad1c3.1732627815.git.Sandor.yu@nxp.com>
 <wk6w5ckor53mudcqfs2grnxryhg7zvsjjdmqatyfddyfgsdrwc@mxxoocsi5pe7>
 <PAXPR04MB944814380C7A72641C6002ADF43C2@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB944814380C7A72641C6002ADF43C2@PAXPR04MB9448.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_023418_905671_CE6227C5 
X-CRM114-Status: GOOD (  48.85  )
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

On Mon, Dec 09, 2024 at 08:38:01AM +0000, Sandor Yu wrote:
> 
> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: 2024年11月27日 3:21
> > To: Sandor Yu <sandor.yu@nxp.com>
> > Cc: andrzej.hajda@intel.com; neil.armstrong@linaro.org; Laurent Pinchart
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
> > Subject: [EXT] Re: [PATCH v19 4/8] drm: bridge: Cadence: Add MHDP8501
> > DP/HDMI driver

Please strip such headers from your response emails. They take a lot of
space and are useless. See how it's usually handled by other email
clients.

> > 
> > Caution: This is an external email. Please take care when clicking links or
> > opening attachments. When in doubt, report the message using the 'Report
> > this email' button
> > 
> > 
> > On Tue, Nov 26, 2024 at 10:11:49PM +0800, Sandor Yu wrote:
> > > Add a new DRM DisplayPort and HDMI bridge driver for Candence
> > MHDP8501
> > > used in i.MX8MQ SOC. MHDP8501 could support HDMI or DisplayPort
> > > standards according embedded Firmware running in the uCPU.
> > >
> > > For iMX8MQ SOC, the DisplayPort/HDMI FW was loaded and activated by
> > > SOC's ROM code. Bootload binary included respective specific firmware
> > > is required.
> > >
> > > Driver will check display connector type and
> > > then load the corresponding driver.
> > >
> > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > ---

[...]

> > > +
> > > +static int reset_pipe(struct drm_crtc *crtc)
> > > +{
> > > +     struct drm_atomic_state *state;
> > > +     struct drm_crtc_state *crtc_state;
> > > +     struct drm_modeset_acquire_ctx ctx;
> > > +     int ret;
> > > +
> > > +     state = drm_atomic_state_alloc(crtc->dev);
> > > +     if (!state)
> > > +             return -ENOMEM;
> > > +
> > > +     drm_modeset_acquire_init(&ctx, 0);
> > > +
> > > +     state->acquire_ctx = &ctx;
> > > +
> > > +     crtc_state = drm_atomic_get_crtc_state(state, crtc);
> > > +     if (IS_ERR(crtc_state)) {
> > > +             ret = PTR_ERR(crtc_state);
> > > +             goto out;
> > > +     }
> > > +
> > > +     crtc_state->connectors_changed = true;
> > > +
> > > +     ret = drm_atomic_commit(state);
> >  
> > I'd say, this looks like a hack to me.
> 
> Basically, those code followed the sequence as vc4 HDMI and i915 according review comments in v15.
> HDMI driver should " Reenabling the scrambler when a display is disconnected and reconnected".
> 
> To be honest, I'm not 100% convinced by this implementation, 
> as the code doesn't seem to align perfectly with the current DRM framework. 
> However, adding this feature would indeed address the issue of applications (like modetest) that don't handle HPD events 
> but still require cable plug/unplug support when operating in scrambler-enabled video modes.

Ack. This matches vc4's reset_pipe().

> 
> > 
> > > +out:
> > > +     drm_atomic_state_put(state);
> > > +     drm_modeset_drop_locks(&ctx);
> > > +     drm_modeset_acquire_fini(&ctx);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +void cdns_hdmi_reset_link(struct cdns_mhdp8501_device *mhdp)
> > > +{
> > > +     struct drm_connector *connector = mhdp->curr_conn;
> > > +     const struct drm_edid *drm_edid;
> > > +     struct drm_connector_state *conn_state;
> > > +     struct drm_crtc_state *crtc_state;
> > > +     struct drm_crtc *crtc;
> > > +
> > > +     if (!connector)
> > > +             return;
> > > +
> > > +     drm_edid = drm_edid_read_custom(connector,
> > cdns_hdmi_get_edid_block, mhdp);
> > > +     drm_edid_connector_update(connector, drm_edid);
> > 
> > Why?
> 
> MHDP8501 HDMI support scrambling.low_rates.
> The scrambler status can change when switching HDMI display monitors, even if the video mode stays the same. 
> The MHDP8501's HDMI code updates the EDID data to accommodate displays with different scrambler capabilities.

Ack. I'd suggest renaming cdns_hdmi_reset_link() to
cdns_hdmi_handle_hotplug() or any other similar name.

> 
> > 
> > > +
> > > +     if (!drm_edid)
> > > +             return;
> > > +
> > > +     drm_edid_free(drm_edid);
> > > +
> > > +     conn_state = connector->state;
> > > +     crtc = conn_state->crtc;
> > > +     if (!crtc)
> > > +             return;
> > > +
> > > +     crtc_state = crtc->state;
> > > +     if (!crtc_state->active)
> > > +             return;
> > > +
> > > +     /*
> > > +      * HDMI 2.0 says that one should not send scrambled data
> > > +      * prior to configuring the sink scrambling, and that
> > > +      * TMDS clock/data transmission should be suspended when
> > > +      * changing the TMDS clock rate in the sink. So let's
> > > +      * just do a full modeset here, even though some sinks
> > > +      * would be perfectly happy if were to just reconfigure
> > > +      * the SCDC settings on the fly.
> > > +      */
> > > +     reset_pipe(crtc);
> > 
> > We are not supposed to cause full-modeset flicker if we can avoid it. Is
> > it the case here?
> 
> My implementation differs slightly from the VC4 HDMI in that it doesn't check if the current video mode requires enabling the scrambler. 
> This is because we considered a scenario where the previous display was operating at 1080p60 with scrambling enabled, 
> and then the cable was plugged into a display that doesn't support scrambling at low rates. 
> This case also necessitates a full modeset.

Well, if this is a part of the hotplug, then of course there are no
flickering issues as it happens during hotplug.

> 
> I haven't found any video flickering issues in my actual tests.
> 
> > 
> > > +}
> > > +
> > > +static int cdns_hdmi_i2c_write(struct cdns_mhdp8501_device *mhdp,
> > > +                            struct i2c_msg *msgs)
> > > +{
> > > +     u8 msg[5], reg[5];
> > > +     int ret;
> > > +
> > > +     msg[0] = msgs->addr;
> > > +     msg[1] = msgs->buf[0];
> > > +     msg[2] = 0;
> > > +     msg[3] = 1;
> > > +     msg[4] = msgs->buf[1];
> > > +
> > > +     ret = cdns_mhdp_mailbox_send_recv(&mhdp->base,
> > > +
> > MB_MODULE_ID_HDMI_TX, HDMI_TX_WRITE,
> > > +                                       sizeof(msg), msg,
> > sizeof(reg), reg);
> > > +     if (ret) {
> > > +             dev_err(mhdp->dev, "I2C write failed: %d\n", ret);
> > > +             return ret;
> > > +     }
> > > +
> > > +     if (reg[0] != 0)
> > > +             return -EINVAL;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int cdns_hdmi_i2c_read(struct cdns_mhdp8501_device *mhdp,
> > > +                           struct i2c_msg *msgs, int num)
> > > +{
> > > +     u8 msg[4], reg[5];
> > > +     u8 addr, offset, *buf, len;
> > > +     int ret, i;
> > > +
> > > +     for (i = 0; i < num; i++) {
> > > +             if (msgs[i].flags & I2C_M_RD) {
> > > +                     addr = msgs[i].addr;
> > > +                     buf = msgs[i].buf;
> > > +                     len = msgs[i].len;
> > > +             } else {
> > > +                     offset = msgs[i].buf[0];
> > > +             }
> > > +     }
> > > +
> > > +     msg[0] = addr;
> > > +     msg[1] = offset;
> > > +     put_unaligned_be16(len, msg + 2);
> > > +
> > > +     ret = cdns_mhdp_mailbox_send_recv_multi(&mhdp->base,
> > > +
> > MB_MODULE_ID_HDMI_TX, HDMI_TX_READ,
> > > +                                             sizeof(msg), msg,
> > > +                                             HDMI_TX_READ,
> > > +                                             sizeof(reg), reg,
> > > +                                             len, buf);
> > > +     if (ret) {
> > > +             dev_err(mhdp->dev, "I2c Read failed: %d\n", ret);
> > > +             return ret;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +#define  SCDC_I2C_SLAVE_ADDRESS      0x54
> > > +static int cdns_hdmi_i2c_xfer(struct i2c_adapter *adap,
> > > +                           struct i2c_msg *msgs, int num)
> > > +{
> > > +     struct cdns_mhdp8501_device *mhdp = i2c_get_adapdata(adap);
> > > +     struct cdns_hdmi_i2c *i2c = mhdp->hdmi.i2c;
> > > +     int i, ret = 0;
> > > +
> > > +     /* Only support SCDC I2C Read/Write */
> > > +     for (i = 0; i < num; i++) {
> > > +             if (msgs[i].addr != SCDC_I2C_SLAVE_ADDRESS) {
> > > +                     dev_err(mhdp->dev, "ADDR=%0x is not
> > supported\n", msgs[i].addr);
> > > +                     return -EINVAL;
> > 
> > Why?
> 
> MHDP FW offers mailbox APIs for SCDC register access but no direct I2C APIs. 
> Individual I2C registers can be read/written using HDMI general register APIs, 
> but block reads (e.g., EDID) are not supported, so it is not a full function I2C.
> i2c_adapter was implemented only for reuse drm_scdc_XXX functions.

Please put this info in the comment. From your 'Only support foo' it's
not obvious if the hw/fw doesn't support it or if you are artifically
limiting it on the driver's side.

> 

-- 
With best wishes
Dmitry

