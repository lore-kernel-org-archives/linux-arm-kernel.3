Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC9F606EEA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tQm4gQ1X;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=oMms6RQF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fyf0HkWXwrADjtKLLnDgwBLxL4hS8GTpMPoqbGKcm5g=; b=tQm4gQ1XHG7J2p
	eOBmu1f73ha5TGAd2a1vYgfd7JTS7gdOutLoJfGg6lFOjCDZq+riZZnfJOD2dJwVtOzKse1Wns372
	VHEwyEUBSyNNEOr1tBben2A+tp73KmcXY+jFj38s6a9G1aOiCewe8IOLcWmGl0fUowAeXcS78oXSg
	eITo9XK0rgSAxlPZSS3hqvwg7vGprBZ2Fpa1r2GbZjD6OFMQ+jF0hQ6+qYyr+iNJAmZgn27MIq0V/
	eicas4Xwpdq/QgpGTht3FwpL+UyRRucLixKHAyrpuktJpjdpxDl2YYKerZ0hSZDDVs6AobGNAbsAl
	pwOm204qn/IzPktAMndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCo9-00000002CPx-3iiN;
	Tue, 03 Nov 2026 11:36:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCo6-00000002CLR-3YHe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:36:04 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F59C227A;
	Tue,  3 Nov 2026 12:33:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793705624;
	bh=0aVe2IheUet+lwru+DZezYT4mSteSH+CCdhQ6rpbnik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oMms6RQFo4uqyKAlU6IsrpoUhFcTPm9uTaMc5joM9EymDPvSqk1QOA/Pe5u+4lmSf
	 Fb/QFsjBRbAqTxqPykIsUugXZQMNjuMLi9JW8nkhV7Xt0DZetpEtBJYWTokQlW1NgQ
	 zMUWcoAPVDzYcDPl8SnOLDvJaAAHagc9Fg/mgRTQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Nov 2026 13:34:24 +0200
Subject: [PATCH v5 04/15] drm/tidss: Drop the tied off video port check
 from mode validation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-beagley-ai-display-v5-4-f1c8d0e52bb4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=0aVe2IheUet+lwru+DZezYT4mSteSH+CCdhQ6rpbnik=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq6ccWGRxgpFyxDhWymlJkVQfH613vPohuHWAYn
 U/lrxFvfmKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaunHFgAKCRD6PaqMvJYe
 9U7WD/9Zn1VUhrx3mDBNjZzGKxt1lrv/ocb/usGlQkza9tXVvpipZXn3KQBcQ+RFJIEWw9X88MZ
 YdYbv6S46u8ACrd9SHAOpUN65bC87GV79Rfcfa8sZ0vz7y2+yttf1aeAfl5zAnZZd/IyIG0dUho
 9T76UZXFpnwdswrNP8qwdbPQiKOVSp7lYW78HAWRzBZedrYYlVRI6gv4mHd9yCX5MQgP83P2deI
 3QOMmAHapiv+MY3U945xk51fQx0VIpnDQI1Y6S3fjNq8UXnjBubx20Ol4BaSHEVsLaONtAkuaAN
 Bx32smTfctUrb092VL9PniO7jWE71ngoGWvI1v/lQjYSiGrBAC4tysCMisTThZafay6kE2Zt6CM
 /W44wwIj1ffHmk50Fu4umomvjs7VlkhW1HFXtkSqitJooAGuziORtl8qD9JzAAX+affIUnsQ5so
 MHpkIVM/Quwa7OkEqef0VLm166cUN5L4RudH7UKTSA2pne8QWce178kTe566L4ue2QvVF42t3hZ
 uZW1Js2VOZBL0kdzxFtQx7VaathAcKWKIGCnNxa42Vv1pxf+3Y2F7MfjBbyqXx5kgZCWVq1pnkJ
 YuX14edaoKq0tcIwK4KS7WevueaB8wop0zLs0B4IFjDObNl2LsnREl5TSNhn41MkVEBVOPAuHtu
 /PFPAbGlPLOCoqQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_033603_056033_7132115F 
X-CRM114-Status: GOOD (  11.36  )
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

dispc_vp_mode_valid() WARNs and rejects every mode on a video port that
is marked as DISPC_VP_TIED_OFF in the 'vp_bus_type' feat.

The check is redundant, as nothing in the DT will be connected to the
tied off VP, and thus the driver can never do a mode_valid call for it.

Remove the check, and rely on the DT to be correct.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index efdabf046d64..8c537280faf5 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1342,12 +1342,6 @@ enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
 					 const struct drm_display_mode *mode)
 {
 	u32 hsw, hfp, hbp, vsw, vfp, vbp;
-	enum dispc_vp_bus_type bus_type;
-
-	bus_type = dispc->feat->vp_bus_type[hw_videoport];
-
-	if (WARN_ON(bus_type == DISPC_VP_TIED_OFF))
-		return MODE_BAD;
 
 	if (mode->hdisplay > 4096)
 		return MODE_BAD;

-- 
2.43.0


