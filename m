Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF5C606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lTnbNAvu;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=l1fyxFv7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ePrsVSLHOazOx0HMWSmYTqUTzH56gfKoj6zo4wVR04o=; b=lTnbNAvunywzLv
	CqEIXmShEX8a+jEKqmRGaXbcAfF05Er2+oS2mmGpZ+g444GXY1OKpi89LdyeuhbTXHCEIMGhSaWPp
	yLMuiV5n1NXSOoDkUJK8/mRmqWa4a61dpPLKqs9Fq5Om+MeWtGBqa7G/kfF3LXJYISfLuzRSURryM
	v4c4XRCIrjERSD6jiUO1kyDgTtv6++uPlL7EMNkhtQLp31UdIda7Sn2N0EBCUxD+SZBa2uWCmfC9x
	FWsuYm8/m51n2DGJtrMsSSPK8Qi8zRoYfBaNzPqqQoSOiNuQwm4Ye/llGSIQMT5dYQUQcS0DXO1iM
	6sDc7J8lFrB/3Bm6oJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNFF-00000008xfg-2vZq;
	Thu, 29 Oct 2026 10:20:29 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNEA-00000008wkj-3QH6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:19:24 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28B601B39;
	Thu, 29 Oct 2026 11:17:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793269028;
	bh=WUlZW1014EuhUxL6GPv1hrKSixrPeuChokLZAULZp4o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l1fyxFv7LS7uj5BIRYX6hs7sT84tmR727nx+zPxYV+sdzZVRKtYZyPfCX8qOwo7UD
	 yOOEKhI1Rj/XQh8WCaPv7/BUAfnE5djwNJGDhgh74yAqCldumHjMf5cbsl5UHkLEys
	 VZQ42LsKP7eRz6kpFyTFpkiIesJFiyi/6BMaEkEg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 29 Oct 2026 12:18:57 +0200
Subject: [PATCH v4 11/14] drm/tidss: oldi: Add power domain support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-beagley-ai-display-v4-11-dc7f2b532478@ideasonboard.com>
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
In-Reply-To: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4490;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=WUlZW1014EuhUxL6GPv1hrKSixrPeuChokLZAULZp4o=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq4x2ZTnfNJlvDGauGT6s+HBW6LD7kPSN687/Z4
 1YauvRe52SJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCauMdmQAKCRD6PaqMvJYe
 9YQ9D/oC8ai1N1A9k1+N7VZSLhWA+7F/reAdar8CUjaE2AfCH6pQjCEcOo1qwf2PUaxDesA4VjA
 Bjhcrb0Q9zUhDem/YPnSIuvjQdqvwfY0+hQKjyOCNsjmPE49td6IZkGYm+gjyljZklvLFLJklLM
 r4c1TK1yx6UiD0a+qcpDj+MAhS9hsyo57zRzqUckLx7/zp0yeeDkmqBejXRsehawZ0cXb1CqdGw
 d72f17B24/pkZLxwekhsfCYPHRfulIOX6znqSOxUq9Z2EDhwBYXILcT/z8+wgzNejo/EYazKNMu
 JlK47Ougm9YhWaxt8GNzfqqhn9H4soPX2hdxZ99AxCbPk+e7ldfOoKi+AawHNLfRvs0y0yVHGOY
 CbxySR1PnOIUoCgDPg0/5fwwO8Yd++5YT/NkGKkVsUpXpRHKWIbJHUV1vSTQZjGw5DZi0o8/kpO
 UaiXgCTsYjuIPK+TnFBcGDZhtexW2wsmav1I6Rm7F1CCz8fd2JnuqXU3DtXMkABwxsE3GOd/Zm5
 Wcuuz6FUl0UPSYjqwQnKCFk9/jtp44lHalrCvRkB0vz5PQI0wIM+Lfbu7dXB2jL1bxKcM2ALWOt
 HXUZ+r+xs2PQ65quRGpWq2HKCILB2xdyhKVifGLk2PMe7NwlV6+Pg+tEEoZhuVWZW389QsGEiKa
 ZgkBd0aSG5aARFA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_031923_010652_D365870F 
X-CRM114-Status: GOOD (  18.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The OLDI TXes on AM62P and J722S have power domains of their own,
described in the DT, unlike the earlier SoCs. The OLDI TX nodes are not
real devices, so the driver core does not attach these power domains,
and nothing in the core turns them on.

Add support to attach the PDs with dev_pm_domain_attach_by_node(), and
manage the power state of the returned virtual devices with runtime PM
functions.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 88 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 5552c1c51074..df2326db3302 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -10,6 +10,8 @@
 #include <linux/of_graph.h>
 #include <linux/mfd/syscon.h>
 #include <linux/media-bus-format.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -35,6 +37,12 @@ struct tidss_oldi {
 
 	struct clk *serial;
 	struct regmap *io_ctrl;
+
+	/*
+	 * The power domains of this OLDI TX and, in dual-link mode, of its
+	 * companion. NULL for an OLDI TX without a power domain of its own.
+	 */
+	struct device *pd_devs[2];
 };
 
 struct oldi_bus_format {
@@ -238,6 +246,22 @@ static int tidss_oldi_atomic_check(struct drm_bridge *bridge,
 	return 0;
 }
 
+static void tidss_oldi_power_get(struct tidss_oldi *oldi)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(oldi->pd_devs); i++) {
+		if (oldi->pd_devs[i])
+			WARN_ON(pm_runtime_get_sync(oldi->pd_devs[i]) < 0);
+	}
+}
+
+static void tidss_oldi_power_put(struct tidss_oldi *oldi)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(oldi->pd_devs); i++) {
+		if (oldi->pd_devs[i])
+			pm_runtime_put(oldi->pd_devs[i]);
+	}
+}
+
 static void tidss_oldi_atomic_pre_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_commit *state)
 {
@@ -251,6 +275,8 @@ static void tidss_oldi_atomic_pre_enable(struct drm_bridge *bridge,
 	if (oldi->link_type == OLDI_MODE_SECONDARY_CLONE_SINGLE_LINK)
 		return;
 
+	tidss_oldi_power_get(oldi);
+
 	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
 	if (WARN_ON(!connector))
@@ -296,6 +322,8 @@ static void tidss_oldi_atomic_post_disable(struct drm_bridge *bridge,
 
 	/* Clear OLDI Config */
 	tidss_disable_oldi(oldi->tidss, oldi->parent_vp);
+
+	tidss_oldi_power_put(oldi);
 }
 
 #define MAX_INPUT_SEL_FORMATS	1
@@ -468,6 +496,60 @@ static int get_parent_dss_vp(struct device_node *oldi_tx, u32 *parent_vp)
 	return -ENODEV;
 }
 
+static void tidss_oldi_detach_pd(void *data)
+{
+	struct device *pd_dev = data;
+
+	dev_pm_domain_detach(pd_dev, true);
+}
+
+static struct device *tidss_oldi_create_pd_dev(struct tidss_device *tidss,
+					       struct device_node *oldi_tx)
+{
+	struct device *dev;
+	int ret;
+
+	dev = dev_pm_domain_attach_by_node(tidss->dev, oldi_tx, 0);
+	if (IS_ERR_OR_NULL(dev))
+		return dev;
+
+	ret = devm_add_action_or_reset(tidss->dev, tidss_oldi_detach_pd, dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return dev;
+}
+
+static int tidss_oldi_create_pd_devs(struct tidss_device *tidss,
+				     struct tidss_oldi *oldi,
+				     struct device_node *oldi_tx)
+{
+	struct device_node *companion;
+	struct device *pd_dev;
+
+	pd_dev = tidss_oldi_create_pd_dev(tidss, oldi_tx);
+	if (IS_ERR(pd_dev))
+		return PTR_ERR(pd_dev);
+
+	oldi->pd_devs[0] = pd_dev;
+
+	if (oldi->companion_instance < 0)
+		return 0;
+
+	companion = of_parse_phandle(oldi_tx, "ti,companion-oldi", 0);
+	if (!companion)
+		return -EINVAL;
+
+	pd_dev = tidss_oldi_create_pd_dev(tidss, companion);
+	of_node_put(companion);
+	if (IS_ERR(pd_dev))
+		return PTR_ERR(pd_dev);
+
+	oldi->pd_devs[1] = pd_dev;
+
+	return 0;
+}
+
 void tidss_oldi_deinit(struct tidss_device *tidss)
 {
 	for (int i = 0; i < tidss->num_oldis; i++) {
@@ -610,6 +692,12 @@ static int tidss_oldi_init_one(struct tidss_device *tidss,
 		}
 	}
 
+	ret = tidss_oldi_create_pd_devs(tidss, oldi, oldi_tx);
+	if (ret)
+		return dev_err_probe(tidss->dev, ret,
+				     "OLDI%u: Failed to set up the power domains.\n",
+				     oldi_instance);
+
 	/* Register the bridge. */
 	oldi->bridge.of_node = oldi_tx;
 	oldi->bridge.driver_private = oldi;

-- 
2.43.0


