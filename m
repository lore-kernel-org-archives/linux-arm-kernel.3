Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161FCEBFD36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 10:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qn4b7ZWpiJEjeric1g/QPZ6VWA0MPNXyaxCPWQyZaE=; b=zEvFZweDHAESvyuxG5HzGwkNYW
	1NojazjKrPjkvp7b0DpyxnDGkR+1/+b+JUbTidi+i+Ftb+qGx6kA81SkatUs7ReRrpgc7vaSmRbWj
	LANkpaZTOpW/0O+Acf1X9pdXpGTcj9AJvHDDjAzO2NpU2eyRMDcEzhun+4LAv8DeLOFkti8nNoC+5
	Ar6KN2xjX1oMauNyM5ZWE8Wo6+JCN92pS6hJhgVckhvKqzuFmTzmesiXSoT/ObSJlB+72f37dm8Mm
	Pd5OtV34ZCWqYWxubdN1USb/YBvk3hm0U7H06VlBIvojmF9KLZO0YzUARxnIwB0BssEb4ZZeeZXFS
	prdnlE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEGT-0000000FSFs-1ebX;
	Mon, 13 Apr 2026 10:11:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEGL-0000000FS5h-2kOE;
	Mon, 13 Apr 2026 10:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6qn4b7ZWpiJEjeric1g/QPZ6VWA0MPNXyaxCPWQyZaE=; b=K0wEwLLXpnO6v2rBR/u6zvkFe1
	/ZE1diZeDbdafOxavpSp6j5MgRnIWywAuH8F3ugNapCzl6aAukKayUqyK66EbiWKT39V9I9Vjdc8w
	sLT/rvnTAyoHOaSWnO6SCjtfS/06d5sgAdjL61h2kTYiKHDv+ejTG9qX2C6uEH3Gtw6GMybZ524kb
	EP6jRvlkhxemfmiOqWHdJ8E1o+GSx4dWVYoijLJhumJSyz3RA4J1edd3OoLKtxEAarBFsm6HTwdGx
	qod+yfn2CSKJtvo9cxaC7yqI8va6TAZ2h7bzpKQtIxx703efPTLp1eRA9x0l2HxiF4qxVoM9IVfoI
	c75/Gm9Q==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEGH-0000000GZ6B-3Y2j;
	Mon, 13 Apr 2026 10:11:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1776075049; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FEUL1AZxBhLulwNyvsoHf59jGeaMvoKgJQbWqfFEAmzezA3hBiyC3PVygBwV4G7np2j0hGunigEkHsvqAnaWS8iVYr5h654OwYz7/D9WaY1qunZrUjNqi01qAtDa3iBvgBmzVmUv2Zbj2viGQ/k5ogvXCpmiVphHICDaFRDVPsM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776075049; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6qn4b7ZWpiJEjeric1g/QPZ6VWA0MPNXyaxCPWQyZaE=; 
	b=XYVl8rdJ3IYkr3priGfQpdX2mgDyyrUdLoJ+MCsMeDXoLZWyV/ze2CfBnQuTlpXfCDbXFMSkP8JIuWYvvWuaCBaEgVP8PK5rY28mg81MbaXN6OpEpg+kzDyhotI/KsVLBpg4UBt2f6OrsaD4FvWKcYx0oxC+/YSnbLN8mbTZrxc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776075049;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=6qn4b7ZWpiJEjeric1g/QPZ6VWA0MPNXyaxCPWQyZaE=;
	b=YsK9cZHoc1P8AaU4G8gDxx2YFS6hY6oO2paRrygsrywgKVHCAig4fkPCwISneTa7
	rjTd/vDJDaLH0x11Xh9fMtetbCwvynqbOw4Ay33WucjcfVjC4H1p7HcfTm5qdjDpbmw
	Vi4ASJmT5q1GMSjFHSWcNHGazEt4ZDnybIt6APJc=
Received: by mx.zohomail.com with SMTPS id 1776075047408170.7971357844874;
	Mon, 13 Apr 2026 03:10:47 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 13 Apr 2026 12:07:35 +0200
Subject: [PATCH v13 21/27] drm/connector: Register color format property on
 HDMI connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-color-format-v13-21-ab37d4dfba48@collabora.com>
References: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
In-Reply-To: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_111122_615568_BA34DF7A 
X-CRM114-Status: GOOD (  10.52  )
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

The drmm_connector_hdmi_init function can figure out what DRM color
formats are supported by a particular connector based on the supported
HDMI format bitmask that's passed in.

Use it to register the drm color format property.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d354ab77d3b8..048789032971 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -627,6 +627,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (max_bpc > 8)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
+	ret = drm_connector_attach_color_format_property(connector, supported_formats);
+	if (ret)
+		return ret;
+
 	connector->hdmi.funcs = hdmi_funcs;
 
 	return 0;

-- 
2.53.0


