Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F95C79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcSEJLSb+KPAcWrzfd13cySwpnusQrnIcgjvZmkYhdY=; b=1VxVp9wA+AfpYUrag4Jjx8arKH
	8XKpaWJ8yR8rXLg/pFENd9J/fqDHLYO3VqvHyJcCIzpwbcCmsC2xkyX4lAf+/8DrpJEhcYKB4uIdb
	UAw/ovyc1e9srLux0YCg8Zimqt17/jZHAWJf6WRSuo9iOMrp82fOLjl0wDCZbM02GGtouv1eM/Mpy
	pCwSy2pONFt5k3U2okKPPIMapEW7qslLBmBO8DQLvpVaA5nqHXkXHuwmFagJ9EVnyXeKxPEMgLet5
	zIjAYssF2jccUl3PW7+dV83Qw6uRMmo0K5kZIczySch9t4aXC5WTsltJ2kD/lQNWUEUj9yoNOrWxF
	tY+WiEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MDY-0000000CVS3-3tI1;
	Wed, 09 Sep 2026 17:36:16 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MDU-0000000CVNP-1eve
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:36:14 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482e1b55da8so574446f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 10:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788975370; x=1789580170; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcSEJLSb+KPAcWrzfd13cySwpnusQrnIcgjvZmkYhdY=;
        b=j6WyMu4aBOkjV3s51CIaEDnC5av3oypvQrLoUPImQBYg6v2+FzQOw09nh4CFqJehl/
         UULMPvUTezOrMhvpg5moqWmxG1d9ixCKLIg7+sNZXehNMKQqCTLhgRRRWTlVrb3FuZgf
         raGargjwwvyUiqwMvxvBPkxT+/+omXptDfQEuEY3BxeG16WPQKkN57x2xDm7twCKyMLZ
         ekF6STFyZ5pYufr48gyVO+1bofrtmJfrPQWxI2e31WXXkGZJnY0w6+mUe5Z4XwMg9jtK
         LVQADBkU5HFDqZ8fp0uZaIgmWD4hMnS1uTPMZ7Mv97tu74NNd1zGC8T+O14ui2xyJCBL
         irRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975370; x=1789580170;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcSEJLSb+KPAcWrzfd13cySwpnusQrnIcgjvZmkYhdY=;
        b=U4aEI8pn19jauX+DgTefvkZg3E4SsUFkEyjtxte667W4VXSR2ZZ+jgHcetiPe+O0J5
         g/909czN0jBd/t+bEXv4h84V02NTJNZuZpH0exEXDK2gmDxDgdzZho9njkFgAujzQej/
         pXLW5UWZT81EO+bqj84Bq2DVXGP792Wxwkrv1asnqjQI/QIe/gA+EfoIsVWnQ+2hETwK
         Mu9qM1EDKx6i8NCEFRgEXcrtl11PF11AGE/ek51eg3R7OErs38vyAW8xDV4fdhJkTqDF
         GAZmpvtPXkAQ9fWiF1MflYxGEP/iGeTCLMfb7SbKSJpDot6DpP3kVcVEKtKbH6uN46Zl
         Zfxg==
X-Forwarded-Encrypted: i=1; AKwUvBzuUmQMfV4ZaoI7QsvZ9BHtQOyqGI8MxfRh991xUkw1SB2ovVUdFt6JAFLnRqMMn5TimpNMYGPxilFZ2Twihw5N@lists.infradead.org
X-Gm-Message-State: AFuF++m599SWCDBJ2Pbj2d5UEytlyRFiHtOn0pFu3oeb0Ljks10neOMQ
	u6d4VqnNXFMizf6m0xrfTe+X9Xu+FYJGloYsQ9n3nhwQ7TV0U++ztXI5
X-Gm-Gg: AYBFou0pWyiTm0H5wZiEEflfH2tIU27tBeAtzj60giu+JJORzF1rOlVeAWZDRA05dwG
	vfgaIvgF6oIok6Vqac8yYNAY+NJ9QlWzlfZuStvh+TtYEcrWFEipHdQJGQilU1PGxYhzrAlRh4Y
	N29X3esuMJ/cGUuNq0X4W8KyR25SC5tE+7m3zvkpizilKx+FjfB+tYNVP/xz/wEyXF/EicWbpPV
	tV0DjUnn+AetVl/pmrO2P9ydtUQ500XraCuJ4mns48FcjQlSEj9CLzJ9vi04aLOKWEXl32O0/ei
	7Ucvr8/iWHEYahZXV4atP3gx55aX2CiOGtvdGLyRdGLESYV/ZwNfEG9276D/xGhyY0l9IuQDMgl
	hK3qLOxa50wM7eBd5+2M6dlEouCXdOVSzvZha8O4suI6OvTP85MHemlDFLqOenWZ8mlcKoNx1q6
	VniF1ZskcqkDQPnjXkxTXBO2NTnIyyf6fdCFv09jdEg/teFUPFTgX6oSvy3Mz/lcFwh/gIxhqdF
	eWNK4uPq3tanYFo2FaN0DVZ7QIhRXD+z2cNtEYKG0fICGEF86dELUxjmsp5fqjNtZsqzQ6Wi9WH
	iR4=
X-Received: by 2002:a05:600c:35cb:b0:49d:1da4:511b with SMTP id 5b1f17b1804b1-49d1da4515bmr96595615e9.1.1788975370286;
        Wed, 09 Sep 2026 10:36:10 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B836900B0110705BF092680.dsl.pool.telekom.hu. [2001:4c4e:1b83:6900:b011:705:bf09:2680])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm6876575e9.13.2026.09.09.10.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:36:09 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Igor Paunovic <royalnet026@gmail.com>,
	intel-gfx@lists.freedesktop.org,
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
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 1/3] drm/dp: Add drm_dp_hdr_metadata_infoframe_sdp_pack()
Date: Wed,  9 Sep 2026 19:35:38 +0200
Message-ID: <20260909173542.14030-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909163206.36409-1-royalnet026@gmail.com>
References: <20260909163206.36409-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_103612_494512_B6230448 
X-CRM114-Status: GOOD (  23.12  )
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

i915 packs HDR static metadata into an HDR Metadata InfoFrame SDP
(DP 1.4a spec, Table 2-100 and Table 2-101) with a driver-private
helper, intel_dp_hdr_metadata_infoframe_sdp_pack(). Nothing in it is
i915 specific: it converts a generic struct hdmi_drm_infoframe into a
generic struct dp_sdp.

Move it to drm_dp_helper.c as drm_dp_hdr_metadata_infoframe_sdp_pack(),
next to drm_dp_vsc_sdp_pack(), and convert i915 to the new helper. The
Synopsys DesignWare DisplayPort bridge driver (dw-dp) needs to send the
same SDP to support HDR and should not have to duplicate the packing
code.

The helper takes a struct drm_device pointer in place of the i915
display pointer for its two debug messages, and an i915-specific
comment about GEN11+ GMP register sizes is dropped. No functional
change.

Assisted-by: LLM checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 88 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 84 +----------------------
 include/drm/display/drm_dp_helper.h     |  4 ++
 3 files changed, 95 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e623ccb4c1d8a..7b80937255fe0 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -25,6 +25,7 @@
 #include <linux/dynamic_debug.h>
 #include <linux/errno.h>
 #include <linux/export.h>
+#include <linux/hdmi.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
@@ -3672,6 +3673,93 @@ ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
 }
 EXPORT_SYMBOL(drm_dp_vsc_sdp_pack);
 
+/**
+ * drm_dp_hdr_metadata_infoframe_sdp_pack() - pack HDR Metadata InfoFrame SDP
+ * @dev: DRM device
+ * @drm_infoframe: HDMI DRM infoframe carrying the HDR static metadata
+ * @sdp: valid handle to the generic dp_sdp which will be packed
+ * @size: valid size of the passed sdp handle
+ *
+ * Pack a CTA-861 Dynamic Range and Mastering infoframe into an HDR
+ * Metadata InfoFrame SDP, as defined in DP 1.4a spec, Table 2-100 and
+ * Table 2-101.
+ *
+ * Returns: length of sdp on success and error code on failure
+ */
+ssize_t drm_dp_hdr_metadata_infoframe_sdp_pack(struct drm_device *dev,
+					       const struct hdmi_drm_infoframe *drm_infoframe,
+					       struct dp_sdp *sdp,
+					       size_t size)
+{
+	size_t length = sizeof(struct dp_sdp);
+	const int infoframe_size = HDMI_INFOFRAME_HEADER_SIZE + HDMI_DRM_INFOFRAME_SIZE;
+	unsigned char buf[HDMI_INFOFRAME_HEADER_SIZE + HDMI_DRM_INFOFRAME_SIZE];
+	ssize_t len;
+
+	if (size < length)
+		return -ENOSPC;
+
+	memset(sdp, 0, size);
+
+	len = hdmi_drm_infoframe_pack_only(drm_infoframe, buf, sizeof(buf));
+	if (len < 0) {
+		drm_dbg_kms(dev,
+			    "buffer size is smaller than hdr metadata infoframe\n");
+		return -ENOSPC;
+	}
+
+	if (len != infoframe_size) {
+		drm_dbg_kms(dev, "wrong static hdr metadata size\n");
+		return -ENOSPC;
+	}
+
+	/*
+	 * Set up the infoframe sdp packet for HDR static metadata.
+	 * Prepare VSC Header for SU as per DP 1.4a spec,
+	 * Table 2-100 and Table 2-101
+	 */
+
+	/* Secondary-Data Packet ID, 00h for non-Audio INFOFRAME */
+	sdp->sdp_header.HB0 = 0;
+	/*
+	 * Packet Type 80h + Non-audio INFOFRAME Type value
+	 * HDMI_INFOFRAME_TYPE_DRM: 0x87
+	 * - 80h + Non-audio INFOFRAME Type value
+	 * - InfoFrame Type: 0x07
+	 *    [CTA-861-G Table-42 Dynamic Range and Mastering InfoFrame]
+	 */
+	sdp->sdp_header.HB1 = drm_infoframe->type;
+	/*
+	 * Least Significant Eight Bits of (Data Byte Count – 1)
+	 * infoframe_size - 1
+	 */
+	sdp->sdp_header.HB2 = 0x1D;
+	/* INFOFRAME SDP Version Number */
+	sdp->sdp_header.HB3 = (0x13 << 2);
+	/* CTA Header Byte 2 (INFOFRAME Version Number) */
+	sdp->db[0] = drm_infoframe->version;
+	/* CTA Header Byte 3 (Length of INFOFRAME): HDMI_DRM_INFOFRAME_SIZE */
+	sdp->db[1] = drm_infoframe->length;
+	/*
+	 * Copy HDMI_DRM_INFOFRAME_SIZE size from a buffer after
+	 * HDMI_INFOFRAME_HEADER_SIZE
+	 */
+	BUILD_BUG_ON(sizeof(sdp->db) < HDMI_DRM_INFOFRAME_SIZE + 2);
+	memcpy(&sdp->db[2], &buf[HDMI_INFOFRAME_HEADER_SIZE],
+	       HDMI_DRM_INFOFRAME_SIZE);
+
+	/*
+	 * Size of DP infoframe sdp packet for HDR static metadata consists of
+	 * - DP SDP Header(struct dp_sdp_header): 4 bytes
+	 * - Two Data Blocks: 2 bytes
+	 *    CTA Header Byte2 (INFOFRAME Version Number)
+	 *    CTA Header Byte3 (Length of INFOFRAME)
+	 * - HDMI_DRM_INFOFRAME_SIZE: 26 bytes
+	 */
+	return sizeof(struct dp_sdp_header) + 2 + HDMI_DRM_INFOFRAME_SIZE;
+}
+EXPORT_SYMBOL(drm_dp_hdr_metadata_infoframe_sdp_pack);
+
 /**
  * drm_dp_get_pcon_max_frl_bw() - maximum frl supported by PCON
  * @dpcd: DisplayPort configuration data
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 113d767e62e9c..d0d3f517df85a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5189,84 +5189,6 @@ static ssize_t intel_dp_as_sdp_pack(const struct drm_dp_as_sdp *as_sdp,
 	return length;
 }
 
-static ssize_t
-intel_dp_hdr_metadata_infoframe_sdp_pack(struct intel_display *display,
-					 const struct hdmi_drm_infoframe *drm_infoframe,
-					 struct dp_sdp *sdp,
-					 size_t size)
-{
-	size_t length = sizeof(struct dp_sdp);
-	const int infoframe_size = HDMI_INFOFRAME_HEADER_SIZE + HDMI_DRM_INFOFRAME_SIZE;
-	unsigned char buf[HDMI_INFOFRAME_HEADER_SIZE + HDMI_DRM_INFOFRAME_SIZE];
-	ssize_t len;
-
-	if (size < length)
-		return -ENOSPC;
-
-	memset(sdp, 0, size);
-
-	len = hdmi_drm_infoframe_pack_only(drm_infoframe, buf, sizeof(buf));
-	if (len < 0) {
-		drm_dbg_kms(display->drm,
-			    "buffer size is smaller than hdr metadata infoframe\n");
-		return -ENOSPC;
-	}
-
-	if (len != infoframe_size) {
-		drm_dbg_kms(display->drm, "wrong static hdr metadata size\n");
-		return -ENOSPC;
-	}
-
-	/*
-	 * Set up the infoframe sdp packet for HDR static metadata.
-	 * Prepare VSC Header for SU as per DP 1.4a spec,
-	 * Table 2-100 and Table 2-101
-	 */
-
-	/* Secondary-Data Packet ID, 00h for non-Audio INFOFRAME */
-	sdp->sdp_header.HB0 = 0;
-	/*
-	 * Packet Type 80h + Non-audio INFOFRAME Type value
-	 * HDMI_INFOFRAME_TYPE_DRM: 0x87
-	 * - 80h + Non-audio INFOFRAME Type value
-	 * - InfoFrame Type: 0x07
-	 *    [CTA-861-G Table-42 Dynamic Range and Mastering InfoFrame]
-	 */
-	sdp->sdp_header.HB1 = drm_infoframe->type;
-	/*
-	 * Least Significant Eight Bits of (Data Byte Count – 1)
-	 * infoframe_size - 1
-	 */
-	sdp->sdp_header.HB2 = 0x1D;
-	/* INFOFRAME SDP Version Number */
-	sdp->sdp_header.HB3 = (0x13 << 2);
-	/* CTA Header Byte 2 (INFOFRAME Version Number) */
-	sdp->db[0] = drm_infoframe->version;
-	/* CTA Header Byte 3 (Length of INFOFRAME): HDMI_DRM_INFOFRAME_SIZE */
-	sdp->db[1] = drm_infoframe->length;
-	/*
-	 * Copy HDMI_DRM_INFOFRAME_SIZE size from a buffer after
-	 * HDMI_INFOFRAME_HEADER_SIZE
-	 */
-	BUILD_BUG_ON(sizeof(sdp->db) < HDMI_DRM_INFOFRAME_SIZE + 2);
-	memcpy(&sdp->db[2], &buf[HDMI_INFOFRAME_HEADER_SIZE],
-	       HDMI_DRM_INFOFRAME_SIZE);
-
-	/*
-	 * Size of DP infoframe sdp packet for HDR static metadata consists of
-	 * - DP SDP Header(struct dp_sdp_header): 4 bytes
-	 * - Two Data Blocks: 2 bytes
-	 *    CTA Header Byte2 (INFOFRAME Version Number)
-	 *    CTA Header Byte3 (Length of INFOFRAME)
-	 * - HDMI_DRM_INFOFRAME_SIZE: 26 bytes
-	 *
-	 * Prior to GEN11's GMP register size is identical to DP HDR static metadata
-	 * infoframe size. But GEN11+ has larger than that size, write_infoframe
-	 * will pad rest of the size.
-	 */
-	return sizeof(struct dp_sdp_header) + 2 + HDMI_DRM_INFOFRAME_SIZE;
-}
-
 static void intel_write_dp_sdp(struct intel_encoder *encoder,
 			       const struct intel_crtc_state *crtc_state,
 			       unsigned int type)
@@ -5285,9 +5207,9 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
 		len = drm_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp);
 		break;
 	case HDMI_PACKET_TYPE_GAMUT_METADATA:
-		len = intel_dp_hdr_metadata_infoframe_sdp_pack(display,
-							       &crtc_state->infoframes.drm.drm,
-							       &sdp, sizeof(sdp));
+		len = drm_dp_hdr_metadata_infoframe_sdp_pack(display->drm,
+							     &crtc_state->infoframes.drm.drm,
+							     &sdp, sizeof(sdp));
 		break;
 	case DP_SDP_ADAPTIVE_SYNC:
 		len = intel_dp_as_sdp_pack(&crtc_state->infoframes.as_sdp, &sdp,
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 5b05a7fbe174a..3e3f119775b38 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -32,6 +32,7 @@
 struct drm_device;
 struct drm_dp_aux;
 struct drm_panel;
+struct hdmi_drm_infoframe;
 
 bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
 			  int lane_count);
@@ -1035,6 +1036,9 @@ int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
 int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
 
 ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct dp_sdp *sdp);
+ssize_t drm_dp_hdr_metadata_infoframe_sdp_pack(struct drm_device *dev,
+					       const struct hdmi_drm_infoframe *drm_infoframe,
+					       struct dp_sdp *sdp, size_t size);
 int drm_dp_link_symbol_cycles(int lane_count, int pixels, int dsc_slice_count,
 			      int bpp_x16, int symbol_size, bool is_mst);
 
-- 
2.43.0


