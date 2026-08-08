Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC63C5AD56
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUzFgsK+uW+0joiMTH75XmXXqtMHA5YYrGPdzifhZ7c=; b=dOujnKJqZoeMmu8yD8WixbvVmA
	J+DstnRp+r4RuN/SZahjPEbcfEIwc4i2bFJWZC2g6fhpo9b7vcv1gaQH6mwoKAdNPio5EWLTtMjS/
	ipjVgxZJt3DqZjmEn83kaz/nm7cAKOfTpBQGhjxkIV5L6JtjPrtQWqVUzUdIUjas87z1m9IGuN9UO
	4e0h+prkEwECGuYLZen9t1tbPnFb1xn+b4rT1Gwrfp/RGWbtWrj9k9oCxoQOmAqYZ7IhbGn5PcOeI
	nKgaFxCM3nwESsW+e0gxPjbJs7+Z4g/F7UenKhsoou7jqs/w9/wUmV+wRHFiR3kz9ejiXuhXUz8+i
	FdEpA+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdot-00000009F0L-3sdL;
	Sat, 08 Aug 2026 09:58:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdoq-00000009Ey2-3vg9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 09:58:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47f502ff678so35384f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 02:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786183099; x=1786787899; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LUzFgsK+uW+0joiMTH75XmXXqtMHA5YYrGPdzifhZ7c=;
        b=hMn8i72qeHcT4NpZtDROKitus2ErF/Q6iKTFr5bZrg9ogOyUFMnY6fQPR06ITHPgFg
         Q1Rn6J7pEXefWw4qqrAQ9erMvKfJZhbdt0ld+UFSwInb6uexbilmfuegFlXt1xMaoyK5
         h6z0IQUxKE3RZtaYTtm7kfftQpkXYN9Y6L/ZAK3HRi/EN7lmaNnTmzwln0dtA0GD78fG
         N2MBmNJ3eBmZp+DoHN145poaN2wS8sVxrEJR6l54JOfYlJ5V5cJRBZVvhmrWJpr8Bv3u
         rLV+auEPPHEpEPNfz9OyTT8N2KL2k/+s3Ac8q0W+zRErvxQYDDEyvBhYHoEBG2rOoq3d
         Nb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786183099; x=1786787899;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LUzFgsK+uW+0joiMTH75XmXXqtMHA5YYrGPdzifhZ7c=;
        b=QuC0kavVEt93tMfyto7Rcq4NFGagtYwsRA5jlXQOjJ6uqdgjuUiwwlLaJjWSi2s/8d
         8Xm/4Q+W96629+C3MgKYBMyWkjZemGUa9HaRC2QIvjYeYvvzns/3+q2O8oGxVz0rp1bF
         6wDZM6+SEck/yM6d84mIsoHLVoOHEoaRQzjLHH0mFkgioiBiPEml6rYqvD85kq2mkczv
         41rlI1dUahRSDc+m1odyoTSei/VZSFW6tXn43QY+79lV9uaeHUXfn0kB14QzuuhfmXAq
         sd+SEkfQKXZVOl9vKzlATf8fkYdQPq/5ZlGWJmG3bfKtNh79OS4hIvuRAdE/AvDBsYGF
         3RHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDTOTfs2IL7t43Et5kiuF9XIdJoCclG09P2jW31GAy2fv8nkPJV3ndWr0PUH7NyFPv2fXVLb9l94topa6tTkZz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn+bD4ZD3+t2cVVcDDaFYL2M5x+6a7Y1t2TtAOmzys9Q4mbtc9
	J9QY8zbKVax7YkkGbxXCBb72qg6bZEtwdQg8hTTrauL+MGZe7twIdpSM
X-Gm-Gg: AR+sD106g2ZL6wzALlX7JoUWTAS4jQOhtXn0pDOoIyYCplyuOAyyK4Q/fwA6lsMUGcu
	Hn01uKK3APV3YN7gsiHTPFW8w3Hh+ykIsYy2jr1SYXUTDww7P2OAcWZe/Y6W5XiFu+7u+bXdcQQ
	OgZRvKqrfnj7TXn7IRoASP3Qx5fQQbgdJYnOKKjLSRUNWPzHSjax98dFriLW1xFPdgx0bJhD3/1
	WXsRdRY90qvdY7ft8FtGW8FEICPI/WjT6SYUqwVtn0fEvQeOHVvCbBqNPLh3Y2KdOxRGYvXg/lS
	DDuM7sLSld0AplUJkiOiyUAu+ehiG2ehxjX0Q8WkdyzqLPW5bqCrGuRo2evmXP/6iK/lR18zsid
	MOTv7ptetl68eLHZkibA4WTeDNb5ODs2llKq5bEgB/VYtH7KpdU9PKc77ZgICloGZqI1zar1ePb
	BI3kFRmRskT+Pal/KWCQgxoVJxgcITNeAmJXw3XFBFlqw4k4S9ZrNYJHp+kyHffffDgP4noWblq
	WNx13BIj8Rt+PcZXRYmqmIzi37aG4aOFYoc3WVNb2EaqHbGKxCFr9pqW6icDyoIgXbdAQ==
X-Received: by 2002:a05:6000:410e:b0:47f:e8af:7687 with SMTP id ffacd0b85a97d-47fec4ea9f6mr15258182f8f.1.1786183098980;
        Sat, 08 Aug 2026 02:58:18 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8E20009911270F4BEC2300.dsl.pool.telekom.hu. [2001:4c4e:1b8e:2000:9911:270f:4bec:2300])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480020be8f3sm13255725f8f.0.2026.08.08.02.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:58:18 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
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
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 1/5] drm/dp: Add drm_dp_hdr_metadata_infoframe_sdp_pack()
Date: Sat,  8 Aug 2026 11:57:20 +0200
Message-ID: <20260808095749.9428-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260808095749.9428-1-royalnet026@gmail.com>
References: <20260808095749.9428-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_025821_023036_E312C87F 
X-CRM114-Status: GOOD (  22.36  )
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

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 88 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 84 +----------------------
 include/drm/display/drm_dp_helper.h     |  4 ++
 3 files changed, 95 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 9c31e14cc413..7b3b079403c4 100644
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
index 6e3fa6662cbe..093a3b7961f7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5157,84 +5157,6 @@ static ssize_t intel_dp_as_sdp_pack(const struct drm_dp_as_sdp *as_sdp,
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
@@ -5253,9 +5175,9 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
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
index ab16c1be3900..c158628f0d38 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -32,6 +32,7 @@
 struct drm_device;
 struct drm_dp_aux;
 struct drm_panel;
+struct hdmi_drm_infoframe;
 
 bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
 			  int lane_count);
@@ -1029,6 +1030,9 @@ int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
 int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
 
 ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct dp_sdp *sdp);
+ssize_t drm_dp_hdr_metadata_infoframe_sdp_pack(struct drm_device *dev,
+					       const struct hdmi_drm_infoframe *drm_infoframe,
+					       struct dp_sdp *sdp, size_t size);
 int drm_dp_link_symbol_cycles(int lane_count, int pixels, int dsc_slice_count,
 			      int bpp_x16, int symbol_size, bool is_mst);
 
-- 
2.43.0


