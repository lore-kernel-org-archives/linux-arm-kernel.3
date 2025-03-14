Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A5FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2O/5cwkwdH0/bC3mxEibhJGOmZklnRGwTYbxWL/TKI=; b=Mmh7vq72Z0vuVkfteceokviUB/
	RharGb9s7BGO3w6p/FxToIagI3JIpvthJzhgHSdP+Cu6syEBHAHdnqX/1Gn9qPXbySzwJUK9kMAau
	8u9Y/iBHXU1IqZh4GQLJqhhHG7XsiM4enPnCwuGU9Ui0gvExHAijDTJHnFqiBRKXB3orBZxqp2zQ2
	SGGhcSfGhsmXQG6rezhnUmjadNAg6Q4UrgW8CMPxfzbx194uDauvo8UseO6ZCjDN+78ltonznEmpF
	fSFoBWyb0dnrwF3CiTGD3iK+2PQaZY2PiPBi6Mn364Ba483N5wZkVujwHwAUUvcGspAOrcnG2muWV
	YdUfwCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2XV-0000000DtRC-2D4F;
	Fri, 14 Mar 2025 10:45:17 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2KX-0000000Dr06-2433
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:31:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 919584427F;
	Fri, 14 Mar 2025 10:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741948312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a2O/5cwkwdH0/bC3mxEibhJGOmZklnRGwTYbxWL/TKI=;
	b=AdoOVcgrU/gxtG4PnYwY1X+P3hLsmp4fPb2JA78t9w9lSdvt20Y6huBuEkEbcYdZg5mGhM
	+G0s4ox6IlVgYSpl8jfrlPZs4clJuBLI/uIasuroUyoKVQhGOWQCv3EKgGWG+hTsIwHlfE
	JKLrdjRRTtdz4JzaFbIaBuKmWRIAGm0xMB9mC6VPZYNQP58bh9do8Ih3db6wlrApUxSl2+
	AWEsX8bHynVAbgA5OoieYdPk8HQYvKiIX7xKJs4Ey400YH0qKqU9/OOEcjE4CZjaBRquME
	//lL1A28mRKmStU8bABzooxELHO6FOXjM0NBXDqx5/T1jdFqZLUlnI1GCU+/4A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 14 Mar 2025 11:31:20 +0100
Subject: [PATCH v7 07/11] drm/mxsfb: put the bridge returned by
 drm_bridge_chain_get_first_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-drm-bridge-refcount-v7-7-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
In-Reply-To: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedtiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepmhgrrhgvgiesuggvnhigrdguvgdprhgtphhtthhopehjvghrn
 hgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehprghulhhksehshihsqdgsrghsvgdrihhopdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgv
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_033153_681200_9A687538 
X-CRM114-Status: GOOD (  11.04  )
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

The bridge returned by drm_bridge_chain_get_first_bridge() is
refcounted. Put it when done. Use a scope-based free action to catch all
the code paths.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v7.
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index dbd42cc1da87f82ef9cd4ccc70cdecbe56035174..21311cf5efee7d26c80316bffe80dd2bfed02238 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -433,7 +433,6 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_bridge_state *bridge_state;
-	struct drm_bridge *bridge;
 	u32 bus_format, bus_flags;
 	bool format_set = false, flags_set = false;
 	int ret, i;
@@ -448,6 +447,8 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 
 	/* Try to find consistent bus format and flags across first bridges. */
 	for_each_new_connector_in_state(state, connector, connector_state, i) {
+		struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
+
 		if (!connector_state->crtc)
 			continue;
 

-- 
2.48.1


