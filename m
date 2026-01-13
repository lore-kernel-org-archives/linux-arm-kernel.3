Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E203D29DE8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3myMyulk7lK3TMytcWJfWx7gGDSOCSp6Y5r6kIKvvv4=; b=NXna6gGfDblZ+1YnHsF+O/FEcC
	neMPdmgptyEGaOX/U3oRgnm8qjbDemXD0hk1Yg8I+RdnBHUJj3wqjZT63VWmZ1lTyEOIsyYBfH0OW
	EZyTWvDNLUfEU8C+Tjbsfp6C1ft6XaoWd8OVxI2lUM8hv6bjjtL/x9q6Jmu6kT+B3W7tHegP0sw2t
	Caquv1WB6PIlokjPJyPjbux179LXJQytiGd+ETjHnQqaYwk67+1TNfDz7xhuJk8jcx+3x2cI/uhc8
	ablREm7auHjiyVYVMIgdNRLN8iFMebrRfwqf4YWToyMaADRD1EScJZGVtafsFS8ORu1QHhCuxMgdj
	NCvB+t6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaNQ-00000006npM-00B6;
	Tue, 13 Jan 2026 09:07:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaNM-00000006nmK-0qZC;
	Tue, 13 Jan 2026 09:07:46 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EE7C2E0;
	Tue, 13 Jan 2026 10:07:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295237;
	bh=yhc2p8mv6ev7MJOu6/5Z04VanMMnTHyoknUD8DPOCKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=krfmXr4fP9RsUIFXQ5/mTeHXKYcmVBzPxHj2/gsJRbwW0CDhNGi2YTfT0o0D/90Qf
	 DWRtqEqHM+R3WTP11NXfULH6geN5F0Cxi3Bmd/+3OGSC+QR8ykYLtSxULCGyd22LQY
	 Cu+7KaQtrPWhxl20D+/X0eaU02IajbMe8UAUJ/+c=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:35:22 +0530
Subject: [PATCH 02/10] platform/raspberrypi: vchiq-mmal: Support ISP
 parameters and stats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-b4-vchiq-isp-v1-2-ea0b300bffc8@ideasonboard.com>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
In-Reply-To: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4938;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=yhc2p8mv6ev7MJOu6/5Z04VanMMnTHyoknUD8DPOCKE=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgtE2m1yON+5mGDfmSptZJi1Ey4bJ2xdPqLJF
 dPHhcU68yiJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLRAAKCRBD3pH5JJpx
 RcoLEAC78P4sk4mCCBgvlUmGxEpVjyniQfPvfDFH+FDeJ2GzCwXdxAI6nTp5UXiNGk9HCKqB0IH
 hTo4gm2WJlDnO6t5wGX8JHiWRV2pXEDyTMoY2WS0pkkIKG53wiYUzBoeza5zIRaXnHw8+YUUTCC
 D2BuJgQuJPWSnTVUTpT/aJQf7o2L0oySJB61dBRPW/d6cqtuCsMvyFeGr7sn3OfpLLaM869flHK
 n2yAPaCewX8hHuo9zz/ULI9nv2DMHd2dOdPIUlIRWc5ecPvpHFde8YJ0EU16BeQv1n0+yxefmO3
 yHm0zkqCa5x97CXUyPvfR8ujdAvu8L+yocXJsD1dG6zQVTS62sYJNYSYbweXD0m3t8F9ywrGV0I
 fBAa8fJ9466CR+BYuQcq4n9AYx67LAzXt6eupyD2Qyfl4m7ubgqnvwwBF0Xij0uFpKFNoICANeW
 /khg7A3FvRkpMdxPIKlteMH1zrj7Ld74iBLVt0U1caD+3QFpFR8Iva+R95A+k7DdOf8/0eihZ6u
 QoCvX9kywp+Fopojv1bBde6+eXkyCuW+8Tn/vTyLBTPXGJ6hX5SGUlPhsxPMFrR+HRjOc5hIsFi
 ZUmFOn3sOaGZpqK1NdZ+e8rnzGLP3oFZzZnC9oPRt/UG5w69JFHYuULp5B3AfPS5eycn10cBls2
 AIqFzxETZlVWKDA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_010745_011485_E581CDCC 
X-CRM114-Status: GOOD (  10.22  )
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

The ISP used on BCM2835 and derivative platforms is behind the VCHIQ
bus, where some parameters and statistics are accessed through the MMAL
layer.

So add the relevant structures, macros and enum values.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 include/linux/raspberrypi/mmal-encodings.h  |  4 ++
 include/linux/raspberrypi/mmal-parameters.h | 86 +++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/include/linux/raspberrypi/mmal-encodings.h b/include/linux/raspberrypi/mmal-encodings.h
index e15ae7b24f73fd055806e2e88e5eec0e1b8bfe9d..eadf2e9814082c861a93ae8119e8ecb27a2fb331 100644
--- a/include/linux/raspberrypi/mmal-encodings.h
+++ b/include/linux/raspberrypi/mmal-encodings.h
@@ -73,6 +73,10 @@
  */
 #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')
 
+/** ISP image statistics format
+ */
+#define MMAL_ENCODING_BRCM_STATS       MMAL_FOURCC('S', 'T', 'A', 'T')
+
 /* }@ */
 
 /** \name Pre-defined audio encodings */
diff --git a/include/linux/raspberrypi/mmal-parameters.h b/include/linux/raspberrypi/mmal-parameters.h
index a0cdd28101f2dd67fd6b64ce1c95c0cbbfe15fc4..6ae5a7a1932c44a73bd482ae72e1191868871ea9 100644
--- a/include/linux/raspberrypi/mmal-parameters.h
+++ b/include/linux/raspberrypi/mmal-parameters.h
@@ -223,6 +223,64 @@ enum mmal_parameter_camera_type {
 	MMAL_PARAMETER_SHUTTER_SPEED,
 		/**< Takes a @ref MMAL_PARAMETER_AWB_GAINS_T */
 	MMAL_PARAMETER_CUSTOM_AWB_GAINS,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_SETTINGS_T */
+	MMAL_PARAMETER_CAMERA_SETTINGS,
+		/**< Takes a @ref MMAL_PARAMETER_PRIVACY_INDICATOR_T */
+	MMAL_PARAMETER_PRIVACY_INDICATOR,
+		/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_DENOISE,
+		/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_STILLS_DENOISE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_ANNOTATE_T */
+	MMAL_PARAMETER_ANNOTATE,
+		/**< Takes a @ref MMAL_PARAMETER_STEREOSCOPIC_MODE_T */
+	MMAL_PARAMETER_STEREOSCOPIC_MODE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_INTERFACE_T */
+	MMAL_PARAMETER_CAMERA_INTERFACE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_CLOCKING_MODE_T */
+	MMAL_PARAMETER_CAMERA_CLOCKING_MODE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_CONFIG_T */
+	MMAL_PARAMETER_CAMERA_RX_CONFIG,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_TIMING_T */
+	MMAL_PARAMETER_CAMERA_RX_TIMING,
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_DPF_CONFIG,
+
+	/* 0x50 */
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_JPEG_RESTART_INTERVAL,
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_CAMERA_ISP_BLOCK_OVERRIDE,
+		/**< Takes a @ref MMAL_PARAMETER_LENS_SHADING_T */
+	MMAL_PARAMETER_LENS_SHADING_OVERRIDE,
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_BLACK_LEVEL,
+		/**< Takes a @ref MMAL_PARAMETER_RESIZE_T */
+	MMAL_PARAMETER_RESIZE_PARAMS,
+		/**< Takes a @ref MMAL_PARAMETER_CROP_T */
+	MMAL_PARAMETER_CROP,
+		/**< Takes a @ref MMAL_PARAMETER_INT32_T */
+	MMAL_PARAMETER_OUTPUT_SHIFT,
+		/**< Takes a @ref MMAL_PARAMETER_INT32_T */
+	MMAL_PARAMETER_CCM_SHIFT,
+		/**< Takes a @ref MMAL_PARAMETER_CUSTOM_CCM_T */
+	MMAL_PARAMETER_CUSTOM_CCM,
+		/**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
+	MMAL_PARAMETER_ANALOG_GAIN,
+		/**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
+	MMAL_PARAMETER_DIGITAL_GAIN,
+		/**< Takes a @ref MMAL_PARAMETER_DENOISE_T */
+	MMAL_PARAMETER_DENOISE,
+		/**< Takes a @ref MMAL_PARAMETER_SHARPEN_T */
+	MMAL_PARAMETER_SHARPEN,
+		/**< Takes a @ref MMAL_PARAMETER_GEQ_T */
+	MMAL_PARAMETER_GEQ,
+		/**< Tales a @ref MMAP_PARAMETER_DPC_T */
+	MMAL_PARAMETER_DPC,
+		/**< Tales a @ref MMAP_PARAMETER_GAMMA_T */
+	MMAL_PARAMETER_GAMMA,
+		/**< Takes a @ref MMAL_PARAMETER_CDN_T */
+	MMAL_PARAMETER_CDN,
 };
 
 enum mmal_parameter_camera_config_timestamp_mode {
@@ -749,4 +807,32 @@ struct mmal_parameter_camera_info {
 				flashes[MMAL_PARAMETER_CAMERA_INFO_MAX_FLASHES];
 };
 
+enum mmal_parameter_ls_gain_format_type {
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U0P8_1 = 0,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_0 = 1,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_1 = 2,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_0 = 3,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_1 = 4,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_0 = 5,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_1 = 6,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U4P10  = 7,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_DUMMY  = 0x7FFFFFFF
+};
+
+struct mmal_parameter_lens_shading_v2 {
+	u32 enabled;
+	u32 grid_cell_size;
+	u32 grid_width;
+	u32 grid_stride;
+	u32 grid_height;
+	u32 mem_handle_table;
+	u32 ref_transform;
+	u32 corner_sampled;
+	enum mmal_parameter_ls_gain_format_type gain_format;
+};
+
+struct mmal_parameter_crop {
+	struct vchiq_mmal_rect rect;
+};
+
 #endif

-- 
2.52.0


