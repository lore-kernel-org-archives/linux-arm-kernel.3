Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF9D6082BE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ulXHfquY;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Y0qABuNN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bpBURpBXm/MMTzlPB/GAVzURYs7DsIf8ymLFXLYmJWs=; b=ulXHfquY8pNI87
	Ldg8HDEGvWwctcbhzoA6wsjoq6DdeXcEGGWokjWd9ILGUwBoYm0V09Nn4h+4U0frI1ksRqoiKp5EK
	JGxDRsz4xJRn4qQ1U2b+6bdsAa+cmQI7hfkEayluJYaaqsF2JRUoVVJL63vpW4QSqmB87Mh6vwZBS
	HCb2mmAi+kBth5HHl3xjWFyor3J0wpaGRmfQfc3wGWPeZNuR5m5lFLyqB3InEdVCiXBj6E7/oKR+0
	QPLHmyk7YftajOZNIxA38laMN81gHDiyVWvjlBA8j8wfzu5+b530lmyny1o16GYlRXplxu1rW7j9g
	4VdUHKLKDesV2snFxxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCoD-00000002CVw-2kfO;
	Tue, 03 Nov 2026 11:36:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCo7-00000002CM6-36s3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:36:04 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6064A243E;
	Tue,  3 Nov 2026 12:33:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793705625;
	bh=ujEBSZQxL+jUQzjM8s4pNuw/G+D4yaw4qDjeFkGdZ5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y0qABuNNa/OdDZu30jGBdZT5YqELt5e2uWDdzAZo3SNPC8ACntrnpmYljQjMul/WW
	 iFVQyJeP9Bd7f2ISK6e2C0yJ6VE96UJYMXhqFQVZW7LODkVxY59QGSeRFJuflZqUmp
	 ARsAO25i/TiZCqbHzjVyI7sEf/BT7Ghan+HhIfG0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Nov 2026 13:34:25 +0200
Subject: [PATCH v5 05/15] drm/tidss: Remove the unused vp_bus_type feat
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-beagley-ai-display-v5-5-f1c8d0e52bb4@ideasonboard.com>
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
In-Reply-To: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3488;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ujEBSZQxL+jUQzjM8s4pNuw/G+D4yaw4qDjeFkGdZ5U=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq6ccXbGpRddZtjQEcmqyrI3N8nGzVz3S4J4SR9
 ym28x4CHWCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaunHFwAKCRD6PaqMvJYe
 9TvzD/9Bym7yo1JAvV1Blee0fp2xAWIO/TWvW06EWr8MVstN9mAPDIDI818ufr/snzsi9duKSHA
 woiRfK6myIgNHODLHllv9UF0Yzx4Rog3ehrj6umzTFzMHZ/1yi4Zd2A1oPwi65pE1NKERk3jPSi
 TfJxbkMwlurGfERPgLU2JNmoq4qvI3An6zDIdH1mVyA9u/S+Zso9ancdAY+4I/aur8MM27lECSl
 mW8imOKFK6CwmitqISKeRdSJzeBap5WFC0+Pd3eYFF2ucOx2t8xPolkll39UT0CVh59Jy43Czq2
 XvXNGGkWshd4ySkV/hUQ/21iZa2ORGoHYPtzBfe/3goZ+RniWCKmg4DUhyGiaTB8TZsAHK+BrCH
 T9Y3cPXHhaZolrK77OTdUiv/ZK51XxMEb0Yrou9d5/Q+xOMGY2UNokdq/iS1RMaap+BKC6rVc6Y
 Ha7YFnYqRYp4Zt6gpvB2CScoZM/wN7rFEbSmBC299+fAabHwxxiUsACOkuD7D7USxJy4b7qRKzp
 kXtwdrQmhzNzXAEJ4vNcnYRoNo3p71Vw6b3CBqn5QBjheSA8hbjxnbp2+GqvA/BHktVEIT8l0C+
 UC+QDkAcehmWXYZsFtFQpPnXqQ8g9HFnKBhmicCJYEvaF592ZORrsTThfRoi5n/jn8d6ophcaTa
 HFoPodLo9c/cmsQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_033603_960890_33BCD5E9 
X-CRM114-Status: GOOD (  11.37  )
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

Nothing reads the 'vp_bus_type' feat any more, and can be removed.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 9 ---------
 drivers/gpu/drm/tidss/tidss_dispc.h | 9 ---------
 2 files changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 8c537280faf5..028cf78df3fe 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -90,7 +90,6 @@ const struct dispc_features dispc_k2g_feats = {
 	.vp_name = { "vp1" },
 	.ovr_name = { "ovr1" },
 	.vpclk_name =  { "vp1" },
-	.vp_bus_type = { DISPC_VP_DPI },
 
 	.vp_feat = { .color = {
 			.has_ctm = true,
@@ -167,7 +166,6 @@ const struct dispc_features dispc_am65x_feats = {
 	.vp_name = { "vp1", "vp2" },
 	.ovr_name = { "ovr1", "ovr2" },
 	.vpclk_name =  { "vp1", "vp2" },
-	.vp_bus_type = { DISPC_VP_OLDI_AM65X, DISPC_VP_DPI },
 
 	.vp_feat = { .color = {
 			.has_ctm = true,
@@ -262,9 +260,6 @@ const struct dispc_features dispc_j721e_feats = {
 	.vp_name = { "vp1", "vp2", "vp3", "vp4" },
 	.ovr_name = { "ovr1", "ovr2", "ovr3", "ovr4" },
 	.vpclk_name = { "vp1", "vp2", "vp3", "vp4" },
-	/* Currently hard coded VP routing (see dispc_initial_config()) */
-	.vp_bus_type =	{ DISPC_VP_INTERNAL, DISPC_VP_DPI,
-			  DISPC_VP_INTERNAL, DISPC_VP_DPI, },
 	.vp_feat = { .color = {
 			.has_ctm = true,
 			.gamma_size = 1024,
@@ -328,7 +323,6 @@ const struct dispc_features dispc_am625_feats = {
 	.vp_name = { "vp1", "vp2" },
 	.ovr_name = { "ovr1", "ovr2" },
 	.vpclk_name =  { "vp1", "vp2" },
-	.vp_bus_type = { DISPC_VP_INTERNAL, DISPC_VP_DPI },
 
 	.vp_feat = { .color = {
 			.has_ctm = true,
@@ -384,8 +378,6 @@ const struct dispc_features dispc_am62a7_feats = {
 	.vp_name = { "vp1", "vp2" },
 	.ovr_name = { "ovr1", "ovr2" },
 	.vpclk_name =  { "vp1", "vp2" },
-	/* VP1 of the DSS in AM62A7 SoC is tied off internally */
-	.vp_bus_type = { DISPC_VP_TIED_OFF, DISPC_VP_DPI },
 
 	.vp_feat = { .color = {
 			.has_ctm = true,
@@ -422,7 +414,6 @@ const struct dispc_features dispc_am62l_feats = {
 	.vp_name = { "vp1" },
 	.ovr_name = { "ovr1" },
 	.vpclk_name =  { "vp1" },
-	.vp_bus_type = { DISPC_VP_DPI },
 
 	.vp_feat = { .color = {
 			.has_ctm = true,
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 3dff391d3fec..ebaf559d56e5 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -59,14 +59,6 @@ struct dispc_errata {
 	bool i2000; /* DSS Does Not Support YUV Pixel Data Formats */
 };
 
-enum dispc_vp_bus_type {
-	DISPC_VP_DPI,		/* DPI output */
-	DISPC_VP_OLDI_AM65X,	/* OLDI (LVDS) output for AM65x DSS */
-	DISPC_VP_INTERNAL,	/* SoC internal routing */
-	DISPC_VP_TIED_OFF,	/* Tied off / Unavailable */
-	DISPC_VP_MAX_BUS_TYPE,
-};
-
 enum dispc_dss_subrevision {
 	DISPC_K2G,
 	DISPC_AM625,
@@ -87,7 +79,6 @@ struct dispc_features {
 	const char *vp_name[TIDSS_MAX_PORTS]; /* Should match dt reg names */
 	const char *ovr_name[TIDSS_MAX_PORTS]; /* Should match dt reg names */
 	const char *vpclk_name[TIDSS_MAX_PORTS]; /* Should match dt clk names */
-	const enum dispc_vp_bus_type vp_bus_type[TIDSS_MAX_PORTS];
 	struct tidss_vp_feat vp_feat;
 	u32 num_vids;
 	struct dispc_vid_info vid_info[TIDSS_MAX_PLANES];

-- 
2.43.0


