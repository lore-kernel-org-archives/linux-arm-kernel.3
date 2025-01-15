Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0958CC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WudddrwsRAeK5i5/asPqdQLX3Xhdqs1xktaqiWAVLxg=; b=lomWs1RXfCLsFiY4oUth38eUDc
	twvnwv03Dsr3YP7A63RMrzXbprYr2gHrpeajPHmAHyhISY9KEgfw/dC3NurECIoxYSPGphzS0a1sn
	4gmw5eBYpggKZ/NlcokV7BQLR6yCD0efpwFR1TXU4S3lnfTd2Lt/UR+e+0W5w7mvkLaiGs5XfEP/i
	fMdV1CnGYp1V4W1w5ic6uj1p5usfFUam3MFNtD4gmCIMYXnuRxvlVk5h601kXhigUYiXR/HkZbE6W
	mjUyNcAsbAl8Xq3aAreFptSLMzZBSys6vDH24WF1oRwg1vjWvDtovRhag0BkBfF3sIO6wkrmSjmA7
	F1pXSECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzR2-0000000BFMS-0hi2;
	Wed, 15 Jan 2025 09:11:36 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzJi-0000000BDPm-2UYs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 09:04:03 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07BAD1648;
	Wed, 15 Jan 2025 10:03:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736931783;
	bh=o10kvymxI7IX4K5Z8GHR6ipSEBl5QcVhE5nldbyB7to=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i22h9XMlbpdvEfJ+x6cvhTAMH0V+LqNWNYqhQ4aZT8ZN7Bp6m+bJSWJdvOlHU06Fs
	 cRvMZgHSNfoMBouxZkVjpY4xKiyML9PykHvaYZpQnFfymtZq4Djtd4BVzwZMOc7kMk
	 uIFEPxfB3Tv5bNjQOGakFNlNuWampCkc8UeHv4M8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 15 Jan 2025 11:03:34 +0200
Subject: [PATCH v2 05/10] drm/fourcc: Add DRM_FORMAT_X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-xilinx-formats-v2-5-160327ca652a@ideasonboard.com>
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
In-Reply-To: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=o10kvymxI7IX4K5Z8GHR6ipSEBl5QcVhE5nldbyB7to=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnh3n5u10I8/ET89g+YpawG+ouQvNRxumyCktET
 FZ38MFzHqmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4d5+QAKCRD6PaqMvJYe
 9RTZD/9EbwnHoP44zKvHwBUeqyobpprWMF+SWOgeKgno+sWtGH4RQBDuxvyQEwZ1oNbORUx2BKp
 D7ZFkaJhcGmkR9wPsL3zFvQdnQxvjJPm1yy2wHZ+GHL2BTi+2lqDsWXF5Qbvq9xCTZPHnu0BWAk
 VmfPHs4v8Tce6v/U0uQ0MGT/z5F6dnEMepPXXFFWCUCk+4DAwarXtdrLUeVK7ho0ppmLBRXKrho
 f4L0dAOZHheKltFMApCzN+V+LZLKKP9ASXVAIqiYl6wjkzD5TKOMLYdV9iSAIDwaWalO+Ra/zTO
 E4e/gHHt9gEz+sTUl1D70jayVd6R3Be9hdbTU+0jI2TBl3EUgjw0vxyr4HTpIuoiSZ8+7VQPQ3F
 BEHpzH9gZL63EK/eBw+nDHHM5IbsjVSElnaOi513vE34gcv2o0lRLwrSSyIzDkHoBRTlBxHYKoe
 0Nf34z5rj1Gku7jO4XlIkeyMFVOcjfmvARrQynEziejsOBLuSOwH1+PjOdSq613RxWX47sbMHXd
 AbRdKYs3e6KSMLF5K9mkRV0exgw53pfIvSnAHSt8PtnEiYLv5t6Bwzk2GWFvllB2ttSobHD838/
 hLlLNwB1cUT/digBrq6NYQB+L7L27oJ04UJWgDeAa4hJCCDQWHI1LQcPdfbBm9TRSfrMwj4hYls
 ts0QV0Y+DyTWzug==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_010402_783948_C3608238 
X-CRM114-Status: GOOD (  10.35  )
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

Add X403, a 3 plane non-subsampled YCbCr format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 4 ++++
 include/uapi/drm/drm_fourcc.h | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 6048e0a191dc..219113b5924c 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -331,6 +331,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		  .num_planes = 1, .char_per_block =  { 4, 0, 0 },
 		  .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 }, .hsub = 1,
 		  .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_X403,		.depth = 0,
+		  .num_planes = 3, .char_per_block =  { 4, 4, 4 },
+		  .block_w = { 3, 3, 3 }, .block_h = { 1, 1, 1 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 03be2aa40265..a7a814a1472b 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -385,6 +385,14 @@ extern "C" {
  */
 #define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
 
+/* 3 plane non-subsampled (444) YCbCr
+ * 10 bpc, 30 bits per sample image data in a single contiguous buffer.
+ * index 0: Y plane,  [31:0] x:Y2:Y1:Y0    [2:10:10:10] little endian
+ * index 1: Cb plane, [31:0] x:Cb2:Cb1:Cb0 [2:10:10:10] little endian
+ * index 2: Cr plane, [31:0] x:Cr2:Cr1:Cr0 [2:10:10:10] little endian
+ */
+#define DRM_FORMAT_X403		fourcc_code('X', '4', '0', '3')
+
 /*
  * 3 plane YCbCr
  * index 0: Y plane, [7:0] Y

-- 
2.43.0


