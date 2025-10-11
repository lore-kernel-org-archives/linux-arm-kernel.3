Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A274CCD18C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 17:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5x7eGxSqdqahcsNsi4pIR40YqVTPrVGWyiJFId9Q6oI=; b=w8AlXsQ2DCz+lNBFXLc8fpEN2D
	HDtfTzSLgQRbcldnUS/PoCQAfvYDy3zjEKxB/x6f01HJkVoEL6zRR1GiLlsm+5j+wGXmShhfl7J/v
	MM0gyuE06Z66/RtnQl/AvsizEAe+UdC8cfEhjZp8G+uFEPoueyac0ZRLf8C2RvFU1zCNSzxcxsUpa
	o5fK0URXuS4nRDIWI8GdEEfS7D3EfADPotHLpByzzM8YAgIgvTDeKd1GU9lY9xCzzUsXekf04F7mG
	U7djUbbp9lLE9N5E5P1/0Fobjpl+BzXYqvLpjsCfrc8H1HLez8ynewbGW0qYK/1XY3wR/h9rdY+y2
	mZJUbK6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d0n-0000000AO5x-1vuE;
	Sat, 11 Oct 2025 17:04:05 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d0f-0000000ANr9-0GNX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 17:04:01 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVLz23MCz9shj;
	Sat, 11 Oct 2025 19:03:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5x7eGxSqdqahcsNsi4pIR40YqVTPrVGWyiJFId9Q6oI=;
	b=AWC4OY53P0Wshc74k1wNC20wUDmtqrSWR/i35Mu2ek4zG1/UNWgtxLJY8r0z0wuoYx7h0U
	KxKI3pzK2E/zEkSyDKnsDenuJemH1Ue9430hnvIgtKbA4+lpxEsDj9JJERgRVfx92ds7Jp
	2qwRDt/OlUsiUcsh4I10EL0OZgbsBkYfu7glx5Tl5YhNre7d3x4nZU/CdM5B5fCrMlEiWP
	SlN6za3Om5yhgI3SVOJ4tbaxzH9OMzE8hoVx9HRbhM6BN4ovHNM3COD19i3kF24uQFDfWC
	8r+l1SgeMPTEbvDJInT9VE6Ls56FYqh/IseEbi428VNWCLAUfL8tZcPEJH6/yg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5x7eGxSqdqahcsNsi4pIR40YqVTPrVGWyiJFId9Q6oI=;
	b=FPYwYHwGsgaKMJykXlYdeb8hfDk4QM3YCISlTRLSDQguvFJlTrAHPtw4UaFdJWWpS+0L3A
	egGY0DAAlPpJKk/5EV80+P1MUTmbWHiFlat5bHA/y7aGOOEoOJfhQptjBXZYk6LKGpgjnU
	q3aB5je22fs7g6HamzgRQ9JQLd/vMOiUWb/JQYH5yS7lT5QE7jemccpTVs+KYRgYPvEDnp
	0pT848f7AewIFDuLf/RifYHfc78wV4YMDNYP5iAPYPgXB6Mwww6ifKqldhQHW0gwWEVsNt
	xo4Nko9pt9BD6V332wC1uVhxeVJ6FkDZJrljly/aWI9D/3HEUG2DJXStnyxBmA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 22/39] drm/imx: dc: Keep FU unit running on i.MX95
Date: Sat, 11 Oct 2025 18:51:37 +0200
Message-ID: <20251011170213.128907-23-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 644aa3f3483981f0fe2
X-MBO-RS-META: dqrwba8s4rtthbm5cb5qayt8xn11umrf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_100357_311161_A4DD5D31 
X-CRM114-Status: GOOD (  12.88  )
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

The i.MX95 does not have CF inputs into ED, it must pull inputs from FU
otherwise the controller crashes into green screen panic mode. Keep the
FU running on i.MX95.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-kms.h   |  2 ++
 drivers/gpu/drm/imx/dc/dc-plane.c | 10 +++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
index 3e61dbb87afe7..af37523ae0be3 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.h
+++ b/drivers/gpu/drm/imx/dc/dc-kms.h
@@ -130,6 +130,8 @@ struct dc_plane {
 	struct dc_lb *lb;
 	/** @ed: content stream extdst */
 	struct dc_ed *ed;
+	/** @keep_fu: keep FU running on iMX95 */
+	bool keep_fu;
 };
 
 #endif /* __DC_KMS_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index d8b946fb90de6..18010c2b0bd78 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/container_of.h>
+#include <linux/of.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -185,9 +186,11 @@ static void dc_plane_atomic_disable(struct drm_plane *plane,
 	if (!drm_dev_enter(plane->dev, &idx))
 		return;
 
-	/* disable fetchunit in shadow */
-	fu_ops = dc_fu_get_ops(dplane->fu);
-	fu_ops->disable_src_buf(dplane->fu, DC_FETCHUNIT_FRAC0);
+	/* disable fetchunit in shadow on i.MX8QXP */
+	if (!dplane->keep_fu) {
+		fu_ops = dc_fu_get_ops(dplane->fu);
+		fu_ops->disable_src_buf(dplane->fu, DC_FETCHUNIT_FRAC0);
+	}
 
 	/* set ExtDst's source to ConstFrame */
 	dc_ed_pec_src_sel(dplane->ed, dc_cf_get_link_id(dplane->cf));
@@ -219,6 +222,7 @@ int dc_plane_init(struct dc_drm_device *dc_drm, struct dc_plane *dc_plane)
 	dc_plane->cf = dc_drm->pe->cf_cont[plane->index];
 	dc_plane->lb = dc_drm->pe->lb[plane->index];
 	dc_plane->ed = dc_drm->pe->ed_cont[plane->index];
+	dc_plane->keep_fu = of_device_is_compatible(dc_drm->base.dev->of_node, "fsl,imx95-dc");
 
 	return 0;
 }
-- 
2.51.0


