Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B21DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 20:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8HxtGS/+pDsEWZq9YYRCPV84sZrTTgU1WrgrxJbu3s=; b=VTPEXV0bSE0yvMpVkyQ+ywRA/E
	wgGrIyryASqvsKs6yxXR6Zh5o4vysJxypp7imVfC2I0cKkze5XTejRc2x7SesjIk+6KY1TW2OdZto
	LKo4futcQgWbTU3g+h7tAzKm8ym/TsSsqaRAQzj9MuOEFIpo263tEFatQWf0nH8KY0PkDe+Ppm360
	XwCHYr5TP7xQMQLXjntowqEECQty3Vgix5NITPsrzCZ4sClxynN6B78BBJBgBdF/NIlx9E87+6u0g
	Gvn0j1LWNzdgMMk4HK3iJitNAS96EISu3p/QEMiNGLOSkksxGmHbVSU8FC+C43EaOlfbe9pqAELx9
	Ll8e4zVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyem-000000039LO-0Peu;
	Fri, 14 Aug 2026 20:37:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyei-000000039IO-0I4a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 20:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786739851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y8HxtGS/+pDsEWZq9YYRCPV84sZrTTgU1WrgrxJbu3s=;
	b=XhOox8MxIbPFYG55de+bgrP8f3542IJ1WLqAG2tb2NwGP5Taqc1GcK1cEXAsScEEhFJ78r
	4ogsXYRiQPVUuCB+kxhP4v4oquMo/beniPIROl43ms649fhHoE4xvCfjEWobdr4Itboqpt
	F68UD8u6JgiLurAeRCMDmm1pmtkYJPo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-OoJM1A43PeiGF1bcosKBrg-1; Fri,
 14 Aug 2026 16:35:57 -0400
X-MC-Unique: OoJM1A43PeiGF1bcosKBrg-1
X-Mimecast-MFC-AGG-ID: OoJM1A43PeiGF1bcosKBrg_1786739754
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AC0B919560B5;
	Fri, 14 Aug 2026 20:35:53 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.233])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 12FBC197751A;
	Fri, 14 Aug 2026 20:35:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	intel-gfx@lists.freedesktop.org,
	linux-aspeed@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	spice-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH 1/5] drm/vblank: Add drm_device.has_hw_vblank
Date: Fri, 14 Aug 2026 16:35:29 -0400
Message-ID: <20260814203542.1405135-2-lyude@redhat.com>
In-Reply-To: <20260814203542.1405135-1-lyude@redhat.com>
References: <20260814203542.1405135-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: tK3jjs4-xdgANpvpczc15LEHxg3xzoZuzAZtIZD4HzU_1786739754
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_133732_205970_2918B390 
X-CRM114-Status: GOOD (  15.95  )
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

Currently the way we check if a driver supports hardware vblanks or not is
actually funny and cursed! Likely because it predates KMS.

As it turns out, we only check dev->num_crtcs to see if we have vblank
support. Why? Because it doesn't actually represent the number of CRTCs on
the device, unless drm_vblank_init() has been called - which sets
dev->num_crtcs. And as it turns out, this is the second place we keep track
of the number of CRTCs we have.

Let's clean this up by starting with adding a variable specifically for
tracking whether drm_vblank_init() has been called or not.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_vblank.c | 3 ++-
 include/drm/drm_device.h     | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index f90fb2d13e423..d317148af8cb3 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -557,6 +557,7 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 	if (!dev->vblank)
 		return -ENOMEM;
 
+	dev->has_hw_vblank = true;
 	dev->num_crtcs = num_crtcs;
 
 	for (i = 0; i < num_crtcs; i++) {
@@ -600,7 +601,7 @@ EXPORT_SYMBOL(drm_vblank_init);
  */
 bool drm_dev_has_vblank(const struct drm_device *dev)
 {
-	return dev->num_crtcs != 0;
+	return dev->has_hw_vblank;
 }
 EXPORT_SYMBOL(drm_dev_has_vblank);
 
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 768a8dae83c52..2df08c756afd3 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -287,6 +287,13 @@ struct drm_device {
 	 */
 	struct drm_vblank_crtc *vblank;
 
+	/**
+	 * @has_hw_vblank:
+	 *
+	 * Has the driver called drm_vblank_init() to setup hardware vblank support?
+	 */
+	bool has_hw_vblank;
+
 	/**
 	 * @vblank_time_lock:
 	 *
-- 
2.55.0


