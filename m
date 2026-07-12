Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B8AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 08:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xhgW2AIxRAsyir1bZV0tkAOlDMwlxqZpeTuaF9TQERo=; b=n1Eaj6WSJEgzO8VlASO04XEpnx
	y9yz/Py/JipawKaFZkTX/VXFqUTbiknbZIDu8yQo/SQHtyb3T1cvzrde+tdMKk4OUThlrJTh96NUj
	eaZVsRwLEW3WBfKhXA2WBZAQhj2MoRDzNI+Np0d/SQIqIZ6Yi7XJCFr99rouGYKEBJQ4+xkUrOImr
	yG7Y6Xmg8D4hh71CsVJKehDj2wfmBYIm1E98tyOco8axcR8lD6k1/FZktabeF1lcJRFXJk16XoxA3
	WQAoVTvSR5zQmeS9eOEGyTKZ0XSJ/7lBIJ46k5oXRpy2zM8rgZdiR5rRaRoVd728Cy68jC42loUV0
	1epukgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiobI-00000007DyJ-0QVP;
	Sun, 12 Jul 2026 07:27:44 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiobG-00000007Dxf-0iQy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 07:27:43 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so1977231b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783841261; x=1784446061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhgW2AIxRAsyir1bZV0tkAOlDMwlxqZpeTuaF9TQERo=;
        b=FtC3Srj6Di0TnT6v4YQPEF3g3udiBdk2qA74S1W+eKFaaON85F6errj9BeUPufWlue
         BCAAIXvabbfhhnE0usKZEkI5F0ARcBhCR1br9pKZi9CI20d14wboFxCIVUCxuYT7+7Nh
         2IO6Q9Ev4r6uZ9VQ4ZwNVP1faPkFlCDGUf/x2+zivQftx2yREL17R70adHBijqk2dB6a
         Y2ho0Q1jSgtAqHMtoip5IVPDIh5IHGPG7kEL41lJ/O239fMwYTj3/gP1PXN+mu1puiJ6
         lwO1oGZrP35fpyebcL8bJsaKXfL+wMm0fA9S7kPBJklR0WiFxESeqIvS6Y0sb14jAPJ5
         ejwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783841261; x=1784446061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhgW2AIxRAsyir1bZV0tkAOlDMwlxqZpeTuaF9TQERo=;
        b=jBM5RrStHVbTcBVqsebrw97OdZKMIGpAAzqKWc4wkSNT3raIyXZKkNkMJjh93fhape
         9zxEHlB7y3VpmKw8YL2XBLEjOa79f+a6RveFGHl/MwGsRjWlCk4hdb4Vyt9x4jnd8F05
         s4BtUjhxp86jW0rftXXbqrpoMLd3VMUiSFy5vWQhTqUB/bXPPIh3eLqrzl6K3l7DTr+o
         ac57Lqi7e77xU/NqZf2PxTidHuImcyQ1amVfdEaAdQUES8yBByYqjbpsvgBOwyBvliw6
         y7Ma+49opoDqE8XFGslAwItV1pQVBOfUj69YfzTOWv337ubc03P0o2SCp0Fa21kW8xNM
         gKpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9gAXgfW9LFzK6ABPZkIQPUCmGMCg6dQMyp0W47h7HU1gDFDeyEaMmFd+a8rQdl0R0CbaquRAp4ZdAn9xNZ2lD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9UzazkEDWUViNGEy3kv+bZEyDTgE1pIXMbiRuWeOz5enUpEfg
	0JdMj+dv9dVuOPqmJtP+TFcuLt4MfcMpQlcbg7E5XMG5cHcNu5WJ80yu
X-Gm-Gg: AfdE7ckuxgM0fr4j0qDWKI3y0xs5xR3vWEff2Prei7V5O6TQj9CJcuXrHHYq8iYTshs
	wUdxfjPEPNMHydR5I2P8N6Bh4Xvzx+xHMbtXRyB2CiEbDVOurlXH06dmv/FkR1oCxqs0rS1OUhL
	aJlPg4sK+0QJh52j1E4bzlLrsGVo+xsz1jg0MUjCdp1JmFLXptt6uGEi+PrxIKSUsx+90E9tf8K
	e9KIBSFbhPWKPXz+ZLjCvmmPCU4M+Vy9++4jU8piIaWqXSEvgAKT3PflRvcFVKRHapbMxdVKace
	Pd8aB163rhYm+5PWJg1jlhTKYQ5+LSp1/xZ9b+/pG9WWk1RPhj0RtJUdGqJo8tijh3IV/LbsTRq
	2EABbYf/7Tt6B1mBgzBmxfI+BALR2nECmQRzCYyzOTfHtDt/6WVlRjVSpQ0QB8CXSwCJ0LHBCD5
	beopR0DoTjeozsKGAcaB/3YP+V6SLaugPGwCAUzg==
X-Received: by 2002:a05:6a00:1d09:b0:848:2f58:e1ec with SMTP id d2e1a72fcca58-84870798902mr7166904b3a.39.1783841260602;
        Sun, 12 Jul 2026 00:27:40 -0700 (PDT)
Received: from kurosuda.i.sslab.ics.keio.ac.jp ([131.113.100.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162d3csm6904706a12.18.2026.07.12.00.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 00:27:39 -0700 (PDT)
From: Hiroki Nakajima <3na7nanana@gmail.com>
To: detlev.casanova@collabora.com,
	ezequiel@vanguardiasur.com.ar
Cc: mchehab@kernel.org,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiroki Nakajima <3na7nanana@gmail.com>
Subject: [PATCH] media: rkvdec: use DIV_ROUND_UP() for CTB counts
Date: Sun, 12 Jul 2026 16:26:52 +0900
Message-Id: <20260712072652.2881919-1-3na7nanana@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_002742_216274_B0AAE672 
X-CRM114-Status: GOOD (  12.92  )
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

Use DIV_ROUND_UP() when computing HEVC coding tree block counts
instead of open-coding the same rounding expression. This keeps the
rounding intent explicit without changing behavior.

Found using a Coccinelle rule generated from the DIV_ROUND_UP() macro
definition.

Signed-off-by: Hiroki Nakajima <3na7nanana@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c      | 4 ++--
 .../media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c  | 8 ++++----
 .../media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c  | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index 87abf93dfd5e..ff3942f91c5d 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -258,9 +258,9 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 		for (i = 0; i <= pps->num_tile_rows_minus1; i++)
 			WRITE_PPS(pps->row_height_minus1[i], ROW_HEIGHT(i));
 	} else {
-		WRITE_PPS(((sps->pic_width_in_luma_samples + ctb_size_y - 1) / ctb_size_y) - 1,
+		WRITE_PPS(DIV_ROUND_UP(sps->pic_width_in_luma_samples, ctb_size_y) - 1,
 			  COLUMN_WIDTH(0));
-		WRITE_PPS(((sps->pic_height_in_luma_samples + ctb_size_y - 1) / ctb_size_y) - 1,
+		WRITE_PPS(DIV_ROUND_UP(sps->pic_height_in_luma_samples, ctb_size_y) - 1,
 			  ROW_HEIGHT(0));
 	}
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index fe6414a17551..d07c74679552 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -261,8 +261,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	memset(row_height, 0, sizeof(row_height));
 
 	max_cu_width = 1 << (sps->log2_diff_max_min_luma_coding_block_size + log2_min_cb_size);
-	pic_in_cts_width = (width + max_cu_width - 1) / max_cu_width;
-	pic_in_cts_height = (height + max_cu_width - 1) / max_cu_width;
+	pic_in_cts_width = DIV_ROUND_UP(width, max_cu_width);
+	pic_in_cts_height = DIV_ROUND_UP(height, max_cu_width);
 
 	if (pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) {
 		if (pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING) {
@@ -275,8 +275,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 						  column_width, row_height);
 		}
 	} else {
-		column_width[0] = (width + max_cu_width - 1) / max_cu_width;
-		row_height[0] = (height + max_cu_width - 1) / max_cu_width;
+		column_width[0] = DIV_ROUND_UP(width, max_cu_width);
+		row_height[0] = DIV_ROUND_UP(height, max_cu_width);
 	}
 
 	for (i = 0; i < 20; i++) {
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index 3575338a531a..3462d995d4cf 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -287,8 +287,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	memset(row_height, 0, sizeof(row_height));
 
 	max_cu_width = 1 << (sps->log2_diff_max_min_luma_coding_block_size + log2_min_cb_size);
-	pic_in_cts_width = (width + max_cu_width - 1) / max_cu_width;
-	pic_in_cts_height = (height + max_cu_width - 1) / max_cu_width;
+	pic_in_cts_width = DIV_ROUND_UP(width, max_cu_width);
+	pic_in_cts_height = DIV_ROUND_UP(height, max_cu_width);
 
 	if (tiles_enabled) {
 		if (pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING) {
@@ -301,8 +301,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 						  column_width, row_height);
 		}
 	} else {
-		column_width[0] = (width + max_cu_width - 1) / max_cu_width;
-		row_height[0] = (height + max_cu_width - 1) / max_cu_width;
+		column_width[0] = DIV_ROUND_UP(width, max_cu_width);
+		row_height[0] = DIV_ROUND_UP(height, max_cu_width);
 	}
 
 	for (i = 0; i < 20; i++)
-- 
2.34.1


