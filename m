Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3BDC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOKv0amJP5Mc1fnE99MZEHz42xwxCl37VMQhjVrkPzg=; b=0ex2eKwXh8lfASDK6NR8v5Mcqx
	ycJ2RGdD1vQZqYSnTBIrN/DCxhaM+7Mjgphl0SwxPiNtG0CTlMsyhrxo+fLcK63jVVjMuf3U2ZhgX
	CVSZMHVHQyr/Y0qKXj0gUDmXc79jkTmGuTIwstC6NpmvYMaY+UsNZa5yJ2MYiIWmhgn0j6i1staEo
	jHoBtgEqm+cqnzJSPa5lEOK0MIyy3HT8QC1FtvrLKtE7++aCZIClwYR0s6XvJMH6lRWtPjM2MSBNm
	aRtxbq94/icxQplwjw5DMm+QbtTIbW0Acj7rRoKOWtxW8N4wZ9IQA13gozZMehtTIzHITkYiJLHYR
	/rohvHIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEIt-00000007nNN-3ZCN;
	Wed, 12 Feb 2025 15:05:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEAZ-00000007ldr-0EbW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 14:56:56 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6108196C;
	Wed, 12 Feb 2025 15:55:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739372132;
	bh=SLMxDmiALWt+ezVaQr2cgceFWKVtJ/2zGn+XyPZTV/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EvWUgpGXCzSg2TYZONLLRHNUlpXgPY+uBnbz1VR6wVfo6+VKgmdoNn+7/K8x5RG3O
	 8T2oJB9ou5XDQz1OP2DTVsSbXHmfZ2BY62YyzBk+zI0XICwuKILg19AIaC6h+wjqc8
	 ofDoSnxGbA6wEyBHfgpRk3xaTQAueq0CQxBtsbGc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 12 Feb 2025 16:56:09 +0200
Subject: [PATCH v3 05/11] drm/fourcc: Add DRM_FORMAT_X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-xilinx-formats-v3-5-90d0fe106995@ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
In-Reply-To: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=SLMxDmiALWt+ezVaQr2cgceFWKVtJ/2zGn+XyPZTV/Y=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnrLaq/duQ8VCpeME8vpjSo6TOBzCN9hsAwJWsz
 a+ygeLSTC+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ6y2qgAKCRD6PaqMvJYe
 9ZPQD/9CbD3USTDGOb8HO4RH1Inbyx5zZ9rUuGku5DQ4n2YCZryPN77kQ8HS5a4MVITPShfu2zW
 69N721YwLctW2qVH7T/eGj26TDZ2b7P0d2qdEPxdZk37Bm+9730gs/CxxBfmXlAS8gM/OpEheAc
 ekkJ4W0UVByP9PZMsuHIa3FsAnvX6LRyrAWRNujk7Gh9OxOgYKE9U2Ig40k+AlPs3ktStH+wIpC
 +A+GpwzNI073ai3m5OjSQt2K93uJhtUXHbRTP2j+hoLkxzdoD7NFVVqat5L2QA+4Vq19U42MWT1
 Nya4633gg2wmWYzfDFeei0PLjlSKjqZJwPuMtIwgNtFCQZl4e2MFUhPSdrcLDnYVhfxNhsWn5Ce
 csYFPGjODmi1Ee6/ebJy7xuWnDSqepEK/re/RR2cXXDtBjKGaaHLQrY5mII0xZsM4AEOjhU91Hb
 8F/vzaFju4peoP1iwFvm22Sptgw9FtNR+XiqII/Wd08AAu+BxDAkeZBE6pCj+kwtEgrc2AU5beH
 Xcnm9u+r5WwJ7SrUuEiTFKZeNo3rNz8ylN9YauYEjD8AUytQexwZ82wpSzYjTRfWWHj+fatLQRi
 fp+gdgLoKou2vItGF/NC6j6AYnEpCGtf1ZBbVYN9DZbCklaQ1ejteRzxSAuSHpKlOpfKUMJ31iz
 ifpjCsKvYAWHhag==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_065655_235696_662B2E54 
X-CRM114-Status: GOOD (  10.13  )
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
index 155482d9a409..cc7e1ef4ef21 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -359,6 +359,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
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
index e87349d46325..f936cac2aebc 100644
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


