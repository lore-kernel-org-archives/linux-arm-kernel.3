Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF812C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 09:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bygF4+CGk1HszXnKQxQkJUMmXmQwnL2yRQrBPqNom6w=; b=klKbcDsBiURlFhTeRc7Ogy/su7
	SQ7u8xo4JYOU+/eeIxgKPfHP31kRztHDMX9gLRC7k9oywPLbjA4nJOsw3ev94chrQydfNEe6pgUYv
	kQNCeBvpsgUneLJxlNZ3QxuETmWtdy7qRd8vDPYHPtgegKsfLgIRiBVXoIF/vl9lpsVFZjuOmOxVX
	AsfS5TLyOEzLgNxPhfq9D8DUPPZ5/bwjIM9qSRDHpi9EaxVqX233p0Ug+8868cqTNXUEXTf9aXg7f
	PoRl+CHZr+CSg/JjP4hi89JlbxDEA70JvHak1fLluoomq/ej7FXb8Nay5JFBxhdvbYApmcMe1EBZs
	v2hpnjzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdoy-00000009F4g-1Iv4;
	Sat, 08 Aug 2026 09:58:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdou-00000009Ezz-3GQ3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 09:58:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47fe45db360so32573f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 02:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786183103; x=1786787903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bygF4+CGk1HszXnKQxQkJUMmXmQwnL2yRQrBPqNom6w=;
        b=au9Tu+Oi3Wvd9PhLjB+yQ7sKGi93smGviHCA6PNz6jmc0rdr7nswbY6SOmSZZDY6S3
         4PfyURBJCvYRt4AHcfP/AM1OjSYoh25t+w8Ld2OM9cbI3QOU0y12P1sdHXoEDpEhp/mJ
         /AojC1ysHHIVmbRe8qxc6A0kMe78DurN1tYecXEvGGWGjswJSOddJjg4tsAy1QBSzsgT
         XnZemR/1Xhp4OLIffJfhzWYLcUXj1aNJp2SerG2v64/8ipXtb4hM+WqU0GrdFwD7Ki/y
         MWonUK6z2+HWBJyL0tLXFvB2DgiItltUfkD1ey90JvIMTjXOUH71CbrIbcbKZ4cPGbnG
         ns3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786183103; x=1786787903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bygF4+CGk1HszXnKQxQkJUMmXmQwnL2yRQrBPqNom6w=;
        b=I2795tbSqj2OsIsVGtWc0LwPm4M/0Zh0UTHZYZxPVBcsqqeTBLay/8Vp4sZYv+X2d6
         QAK2moSSNmg4mBoXzo6BBvvWeoXYJhJnDv7H4w0l0sHawLSe9xRyfQ79i/cYu6WHTu8d
         iipsG8nYbF41SWyI+F05wmCTtDDd0olfvcbEoUDziRQQTvS4KDYhx56N8AtOU1Rn1uGR
         IpiwL4VblCc/eE+B1DwUiL22aMgw8q6Gf6MPNX8XfMaY//y12R2BqiOKHuRj9lnMTzuQ
         04z3zFfDGInpECzWN1y8yPEGDprwmkfi+sugQ2ZpDIfJhsbR6x+BxbEri7ro4yudU4P8
         QVHA==
X-Forwarded-Encrypted: i=1; AHgh+RoErnzlxavCrbqTnpGoOZDFKpgiZSGNArKuc8UVpsTQC0BayNTFL0buE8CKlWfioGKbQdUZ8Y95CKbTInHyc/B3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm2MLU9BEqaH10rUI/RU+nyklFo4KNhhXzLYvlypg+yfbjcrMM
	xTgjF8UJWPcTTyHQXUh9Rxs8DCLhshR/n4kM8ee/Jz5g58BwSCLjkkM3
X-Gm-Gg: AR+sD123lqjnPYhm3tMlyn6qfVZ9fxdaXEybYjuQmYo9BacSYxB2rT62bkV3SqScpek
	DVwhIjLgOooE23qmi4k/rcbKrFzxhcLJWJ5pA2CZmasr6amXXXZYQsK04VJzlBh+hKjyqt0wf3V
	LxAyMT4E3ETVZBfZBm6n3EnjYkvZPwYQr8v6W/ld0RlA9ivqPh63gXUzplNmoAQcdAtubA2MM0/
	iMSOsqYj3DB1o8jTqv5BybN+yZQI8itHcuTQTj7XdB95d7qlK5znirwoV96u3Q7+J9XGNf9y0zs
	rmUn4mnhbMaWJ6rRNs0yCH5xXKGRC14sGAkn8WMo7VxQ6dfZJdUEgVDdihGaUfUREnjoXMCze4j
	pwqREc2DkNfS368BVTlqOVE4TWxDFJChpBwrESHZQTM4sptbd3DwGF5p+Zbhxy8zwnbnh2+rksp
	1aaXkGRe7d0ONjQhoa+n843+YR5H7R1ZH+BBOta2TVjhwK2E2zRXJBTBC8yBChGo5LdrZLWP3Wu
	j5weNUYznf2PMdbXARUD7EAkBIJB37HJsVWAEOG8NBIB75kFANIWgbGjnbGC/o4EfnKeQ==
X-Received: by 2002:a05:6000:401f:b0:47f:7e91:3d55 with SMTP id ffacd0b85a97d-47fec520b24mr21741731f8f.2.1786183103128;
        Sat, 08 Aug 2026 02:58:23 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8E20009911270F4BEC2300.dsl.pool.telekom.hu. [2001:4c4e:1b8e:2000:9911:270f:4bec:2300])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480020be8f3sm13255725f8f.0.2026.08.08.02.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:58:22 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 3/5] drm/rockchip: dw_dp: Attach "max bpc" connector property
Date: Sat,  8 Aug 2026 11:57:22 +0200
Message-ID: <20260808095749.9428-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260808095749.9428-1-royalnet026@gmail.com>
References: <20260808095749.9428-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_025824_860723_7BF2BEE7 
X-CRM114-Status: GOOD (  16.99  )
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

The dw-dp bridge already filters candidate output formats on
conn_state->max_bpc in dw_dp_bridge_atomic_get_output_bus_fmts() and
validates the result against the link bandwidth, but the connector
never exposes the "max bpc" property, so userspace cannot limit the
bit depth. Attach the property with a range of 6 to 10, matching
dw_dp_output_formats[]: the smallest entry is 6 bpc RGB and the
deepest entries are 10 bpc.

drm_connector_attach_max_bpc_property() initializes
connector->state->max_requested_bpc and therefore requires the
connector to have a state. Rockchip binds its components before
drm_mode_config_reset() runs, so the freshly created bridge connector
does not have one yet - create the connector state before attaching
the property, exactly like drmm_connector_hdmi_init() does for HDMI
bridge connectors. The later drm_mode_config_reset() then re-creates
the connector state, and the preceding patch makes
drm_bridge_connector_create_state() restore max_requested_bpc from
connector->max_bpc, so clients that never set the property (fbcon in
particular) keep the full range instead of ending up with 0.

With the property attached, compositors such as KWin write "max bpc"
on every atomic modeset; any in-range value is handled by the existing
format filter and bandwidth checks.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 770ab042a187..4dc29963b5d8 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -172,6 +172,32 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 				     "Failed to init bridge connector\n");
 	}
 
+	/*
+	 * The components are bound before drm_mode_config_reset() runs, so
+	 * the connector has no state yet, but
+	 * drm_connector_attach_max_bpc_property() requires one. Create the
+	 * connector state first, like drmm_connector_hdmi_init() does.
+	 */
+	if (connector->funcs->atomic_create_state) {
+		struct drm_connector_state *state;
+
+		state = connector->funcs->atomic_create_state(connector);
+		if (IS_ERR(state)) {
+			dw_dp_unbind(dp->base);
+			return PTR_ERR(state);
+		}
+
+		connector->state = state;
+	} else if (connector->funcs->reset) {
+		connector->funcs->reset(connector);
+	}
+
+	ret = drm_connector_attach_max_bpc_property(connector, 6, 10);
+	if (ret) {
+		dw_dp_unbind(dp->base);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.43.0


