Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0533606EE9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WvhewYB/;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=hq2WYN3I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DSwTPqDgbORtmER3+L2+uWMiOMM8wJSshAv4D29Azbg=; b=WvhewYB/QJGAt2
	euEpEsevrXnaQeE1a3Qpz5w1Una1ZvrGizK/kf7wngaxRpRhYLPapIdv54lgLa4OwPth6fkqU2DoS
	IfyajfWtjz9lcZFteAJgyRQhzmDvmzG+SSTQ0T9i86ytP0CaXwfHE9PRe9UBEOU3VUGvpUqNdJ4mJ
	MJza5rlQwMfkwGLoxf7jBeGLoRFe1gvkX9JT8Yq1VjYYETUkshR6aU6e1lytwN/jCEyOuJrGoQh8y
	PFbdaCPKwQjUe1pXxW1S+tUFzO1yzhCVhngRV9Uzhe+yE7JGtGEZBbDS7HlqGN2q4m+P4qCZRcWSz
	jKbMJZ1LhiZB4lPXgZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCo9-00000002CPC-2R5s;
	Tue, 03 Nov 2026 11:36:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCo5-00000002CKj-2mA6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:36:02 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FC052022;
	Tue,  3 Nov 2026 12:33:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793705623;
	bh=nQxWPvOnHOEf49bvRxeDEbYKlPoV+LdS5+rxhamt3Vw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hq2WYN3IlV1aOeXHqCGjc5xuEDebbB6P2sOMoGZEO5dcZjxl5yA0orOzsTFPy3Y2D
	 TzwEHdQNdKCPrcMaCUuLoBgyHekP0nVVGySPeHxTXIFi2sZDPurGoYalH2AboyepY4
	 tUNcM9e9Ht2eoPYiVwQCUdWvSM/ad4vOHImEfjcU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Nov 2026 13:34:23 +0200
Subject: [PATCH v5 03/15] drm/tidss: Stop using vp_bus_type for directly
 connected panels
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-beagley-ai-display-v5-3-f1c8d0e52bb4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=nQxWPvOnHOEf49bvRxeDEbYKlPoV+LdS5+rxhamt3Vw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq6ccWHLqIYfEiZDqGG6mTCF/KsBI+OSJKt6gMV
 /G5te10M/qJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaunHFgAKCRD6PaqMvJYe
 9e5bD/9XC/UZFjpKf/MHmv15HgqyJCacl73oT9IVfHA1wZkZEex/YcsTz7OIQS8xqjNR8JvYeBI
 G5ZSDN3pc5xph+Yb938uFxMNIdPylMJAKXvd3qXzsouSBwIa2J1t22Yvu3QAP5wxS/N0Esi07SK
 LQiUw9EOiGnAhSb9GOy9pj13jC7sBZtKqTjlr+j4/iBcEuTP+B+U54JzaPKqhOvHIrAAEGZdalZ
 +ZQmRPWpea8ZD3XuPs8xEwY/QXmetUzPQLNi8Fhq3btG7DQ+VGA0Z1MIvK9z3ftLEjbYzQV2pW3
 qLwtEiv15+3RTjT33cgSYTBz84J1cHUHVTdu+rAYbLLDEf1rcPrfCjrRoQ/eYWTd4nSPWAv9RFJ
 Gy1iXjYRqwt+bMWn449fNSkktzUmH5EqyLmcHSB7A0+CC9Yq9mj29unDkNheYVmHNRzxNsvxldV
 40zrHbvHfPhtnrIuVknX1BEMEyGvdu7Pf2CQCkDSUupXzAJ/sWhpm75vinu9xKCsat5v+QME4X+
 KI5g4/YNYPs7/n+AtKcyHVUvQLA+yU3Xqh8F7frRQ3PrrssHriKHAQndgModUxGZyhGyUBuWB4o
 Q/4CgxRpCRd/vCyCI/sVRWy/nlTyEUynrvt2lxo07LaBHaLUk0z9nsuKdzDVAsoBb8GXNQKCYT7
 /mw2heS4w4UhPxQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_033601_867951_6D0168D4 
X-CRM114-Status: GOOD (  11.33  )
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

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
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


