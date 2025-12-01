Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0C9D116F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9TWDjBRS8P9V4VPPn1wenSzkq9OL7GHycge0beocVM=; b=F9R2lnLKUcnjugmoTJ5tUAgY1e
	RGWHFrzbi2peBCy/Ij258EvF7CetPYzdlLJlPqPXLoTfhUD8/56TS6c+FZt0QNczUrmS3IkJwgSSH
	7CxwsJ90N/yruwdT2EtuBmWlup+8o42J5r5qoyH53phYXxHBve3GhfL5n8jlq1hjaefU99LcFnQU2
	YU6EQsBYzmnUD+T2pTOmpYG0mO6pCCa6koheXJsRVxzNsnF1crtC3N2eYW/lRH9kreQw44PxqsEci
	Ee8iagN5oVSAAb+78YQ63PLZjcU0w9HptIH0ZgP6ubB8K0HMBb4YT3bMOYvB2kSMzMcXK0lCV0V7p
	fxCqzmzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2sT-00000003X4T-1L3o;
	Mon, 01 Dec 2025 12:19:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2sM-00000003Ww2-1Jy7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 12:19:32 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEB501C4B;
	Mon,  1 Dec 2025 13:17:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764591431;
	bh=bq8m97BrlXpych44TdnTnBhBwOgtsiLZgTrTTPXQkkU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bw9o1JnXNELvE+bpAzJbuIIDIu/w1LIxwYjckn+b2hEltU9fmARJ6fyMFB0papU38
	 2qxC2C8aWwHr9Ouucn8ehIC/+96G8FbsMgnAl686ujhVPXu1u817maeHbYpvZ2a+PJ
	 NNW1v50a+j/0j7PcpB8UAbS1Bc8E8mU6j/XoLoiM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 01 Dec 2025 14:18:47 +0200
Subject: [PATCH v7 05/11] drm/fourcc: Add DRM_FORMAT_X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-xilinx-formats-v7-5-1e1558adfefc@ideasonboard.com>
References: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
In-Reply-To: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=bq8m97BrlXpych44TdnTnBhBwOgtsiLZgTrTTPXQkkU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpLYfDhFvaHECSbUDrCcH/GkUdjKpoOcFbwweLh
 u+UiYYupHeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaS2HwwAKCRD6PaqMvJYe
 9RM6D/92WU1bjzrIomzfXGH1UgoRMgq9L7dO1HzZ5WltyGJCTH1l44pUmQCWXpEyChhcZLvQzzh
 pqaMDJH/fSfBSVXs7OlDns2yffMzPPDbb4utfEMNXlEVysqX7Q24Xss29bbWtYxC/5gl8yf47oH
 ga2sTcnZd0sIhtw1RZlpO6TGEHK5GPTrKQt6vVAe+MMkRZ+Es7NsYDEELLPXsBBth85V7vCx2mb
 8sonYvrBMj/XZ0tRt3jicuT0RwcKZ3WhNJ/mKN6Y+0aNyzdNwRX3t8Vo7cVd+eSbwQroL0EBCxR
 70MUQxeieFPjvlMPerf6w1AsUJcD1VITBoN1HSB6JhccWRVljf/V5c3cg14atwTK2DGEr6Ee8LX
 bx1lJcHir4kDon7R3eL5xinHIajB1N0iPJlSECcKV1UpOnWeHc3dH3FnNs/aSaP+ZFIGGZnFFBV
 aOvYNeOAxco1HzDow5C5ThazgkqfNfR0yHKiEtv9POb+JfpymTs2LD20oWwMR62Jjm7UVdW/8BZ
 mMdH7qdXAJ9A6AAtqhC07AaSj599vl+QIaAIwrHn/4soVZbvbMZV6NqJjeylIU6pL+5C26Vpm8G
 g3RlHzKWHsxlqsJrOo0Ay9PN6jftaa0/ImBdZQYaidwo+nOoxd/Q9nw0z4WZOeWoLW1r+pSrUwk
 SRyoO2X5Q0SAG4Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_041930_502024_41DB709E 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

Add X403, a 3 plane 10 bits per component non-subsampled YCbCr format.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 3 +++
 include/uapi/drm/drm_fourcc.h | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 0d222f6c1a30..ab643dedd6d4 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -391,6 +391,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
 		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
 		  .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_X403,		.depth = 0,  .num_planes = 3,
+		  .char_per_block = { 4, 4, 4 }, .block_w = { 3, 3, 3 }, .block_h = { 1, 1, 1 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 0fd99ae32a06..abe6af8b5ac4 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -403,6 +403,15 @@ extern "C" {
  */
 #define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
 
+/*
+ * 3 plane non-subsampled (444) YCbCr
+ * 10 bpc, 30 bits per sample image data in a single contiguous buffer.
+ * index 0: Y plane,  [31:0] x:Y2:Y1:Y0    [2:10:10:10] little endian
+ * index 1: Cb plane, [31:0] x:Cb2:Cb1:Cb0 [2:10:10:10] little endian
+ * index 2: Cr plane, [31:0] x:Cr2:Cr1:Cr0 [2:10:10:10] little endian
+ */
+#define DRM_FORMAT_X403		fourcc_code('X', '4', '0', '3')
+
 /*
  * 3 plane YCbCr LSB aligned
  * In order to use these formats in a similar fashion to MSB aligned ones

-- 
2.43.0


