Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24F960A6F6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zs6XxTzK;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PjBK1IWl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wi22ZUlQhK6uLRjmKgHQVyO5nztOuEF+4DU2hP7IztM=; b=zs6XxTzKbgUaoQ
	PkxFxeU1RMc8v3xgU/Zvq54XXHBvOUwg5lpeJGKnS5TYoIpG4dmCWCfBE+ZcRqL2LnMEc3GM+QwCo
	03SG4jk3LIlhJ6SySQTXqN8kINwfzo0nH3+FFpnZcEM2n9GlyM2Hb+rLx+PqDsC0DfPKwjx1w8BKa
	M11XMRC1rmXKK1dUnnlrN0Rd3j9JbO1d8FZyrQe5KseZsiDx2+q+nwxjHI4YxlRA1YuL2wzBoXxLn
	3Hvo46VwAu/4hVRlo3kBxLtM4N0incyP5dwK+4ywDsOpayO57/n2B9m/TiuxnT7DQvq1vfWBxJPDV
	eYSGjsZxOzqfhd54sgCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNEB-00000008wmA-2xLk;
	Thu, 29 Oct 2026 10:19:23 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNE2-00000008wg2-0Twf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:19:16 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3C83929;
	Thu, 29 Oct 2026 11:16:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793269018;
	bh=YhUarWvkFmo5BAU7y6W2c0/rlDRAPf7YwZkgeidtnY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PjBK1IWlqxPl565SY8k/Fk6uWiGjuOHjYOxbz8dQNajdIJy1qOQMghOyvrSP1SjD8
	 aH6MWMdQlwcL+HXuH7fv38pwh6uQkPDvwgQAgwh/JSOUcWzOGjJqYa5hhwO46qywVT
	 XMZd9J5TYRAXaQWiA2Hmigxn3ZF5LYUzjVc0kxo0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 29 Oct 2026 12:18:49 +0200
Subject: [PATCH v4 03/14] drm/tidss: Stop using vp_bus_type for directly
 connected panels
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-beagley-ai-display-v4-3-dc7f2b532478@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1460;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=YhUarWvkFmo5BAU7y6W2c0/rlDRAPf7YwZkgeidtnY0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq4x2WAngQ2+yyxc+nNGt0VaMvb+tX9kwxHQ4m7
 6QU5zeNBdmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCauMdlgAKCRD6PaqMvJYe
 9ZUbEACczkH4P+K0PGpZmASXOjmy5o8O68zj7a6M5err0YVTSGPXA+tq8V2B25nnliuigC4Dn1E
 u8Zfez5MdSd9wJg8T46y0uTaMz6M8+M4RtCBIZDDAxOSEIaE96KUkUEH+UBjsGCv4+HEtEZSXUO
 qlppx04cTv0FOVNzf6+sFrJKbDCaGrNtKYUJDy5R8tlMBhUcQfiFyhEP78WZ1E/IOwwKApEGw9e
 oD++x9/CD46C4qS4sbwWZE9jxPTAkjXeUHIBRZkVeFkS70sfJWJmUroRHTYSTyZiiZPRmPpFheH
 nhQXt34mv8RuR3/8E2r70IoFhVgOxHgtM+4fenTa/+a0U1qgNyGaroH/dZkYVF6C9BfWPuHCN0C
 WACYj53lAyvUY3nYqRiO5xhy1FjiYNsUgE9wg1mJ6MpKEeudbpNiA42ezr7keh1cZvJfZ9/XsSa
 QwUtPGTTZsbZErs/4xQ30tDh5sWUfVv7kxAcg16AWncKu9ZuGnKBQK6TsUQ9u1Qxyh9qPn+amM3
 lGFlEPgQX9mGWAv3I00EtU3lqfQt7VQk8EvEu5BptpkUJsgRYXApLSGhZIw97P4DJisNYIy6RQF
 Z6GXvyqLbF/mDrl0judW/UF6x7ZrtzIVzrsySFJ0D/raPKpfvb6g5aFKe46Fpj2nNQF97u/QJ5y
 ASrP7p7hHOKEfRQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_031914_311173_C8170F23 
X-CRM114-Status: GOOD (  11.11  )
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

When a panel is connected directly to a video port,
tidss_dispc_modeset_init() sets the encoder and connector types using
the 'vp_bus_type' feat. DISPC_VP_DPI selects DPI and DISPC_VP_OLDI_AM65X
selects LVDS. Any other type triggers a WARN and fails the probe.

vp_bus_type is problematic and is going to be removed. Change
tidss_dispc_modeset_init() to use dispc_vp_is_am65x_oldi() for detecting
the OLDI case, and default to DPI.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_kms.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index e55e7532e2f7..8b9c5fa96e47 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -232,19 +232,12 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 
 			dev_dbg(dev, "Setting up panel for port %d\n", i);
 
-			switch (feat->vp_bus_type[i]) {
-			case DISPC_VP_OLDI_AM65X:
+			if (dispc_vp_is_am65x_oldi(feat, i)) {
 				enc_type = DRM_MODE_ENCODER_LVDS;
 				conn_type = DRM_MODE_CONNECTOR_LVDS;
-				break;
-			case DISPC_VP_DPI:
+			} else {
 				enc_type = DRM_MODE_ENCODER_DPI;
 				conn_type = DRM_MODE_CONNECTOR_DPI;
-				break;
-			default:
-				WARN_ON(1);
-				ret = -EINVAL;
-				goto put_panel;
 			}
 
 			if (panel->connector_type != conn_type) {

-- 
2.43.0


