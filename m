Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24E8D6B09D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qhyBy0UGiy712lAFCHNNTHqAhsRO5EoRden9HyKwIMM=; b=VPUl8+sRGQpnL81Go/F+SjLGfs
	p+NFkZLYilNwGeAJofZaqakhFhzO/9o09eFu7aNp+AdJSKt4IB+2kwABm/2rycWystsuNFN60iMis
	RCmXpqYBwd0IoOLD/E/411RV4C1hxqt3R6YympiWAgEVPwUbZV3l8eymAW/sY0GYQFrnehi631bCp
	YAZAFhAtjMhUW2f9iBcWZzgsHnKFZBuv0CWcHV98PaS6UVyBzx6EOkQsf83bjr2qzeAcbn1Z/cVLn
	DiSMLaARgkcXH8QjTyJJGbCchV7oqYFNg00mr5/0Ko8dPtXan5l/DtPLOHNAW9JJYJyKKBn2nJnbx
	G55m6lvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlV7d-00000000Min-1zDR;
	Thu, 29 Jan 2026 16:43:57 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlV7b-00000000Mhv-0ufR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:43:56 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4806b43beb6so9304815e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 08:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769705033; x=1770309833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhyBy0UGiy712lAFCHNNTHqAhsRO5EoRden9HyKwIMM=;
        b=dPVlk/LZYgRddytUnemx4Elsrl0QE3o6t+9leO9779jRJ4FHZyfYu8k1SX5BdbcP5z
         1hUFQQ/iyGOsZoLtFKL3j8g3+vwlnXGkaz3CbbNQw6y53wgwHplbcBpiWIIM78ptSxSw
         cCidjHG2dZOlIuJ9ZvPz346ZCQ2XP3ipDpSVb7i5enwa3IO0NicjoCaCXndkAACV1VDE
         Zl/BvUHDw1JSdq6Qwrs2xlIPOAw10rJKVred3Roh6JXflrZ7gxUEqIYD6N6MrlUpgC2z
         rHZ5Qim5LaFxeH0CUcdMRTuuLjXyk2pPyW22D31xxJQvbcFTy2AkMLzXTtfVGWiZCvZW
         oiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769705033; x=1770309833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhyBy0UGiy712lAFCHNNTHqAhsRO5EoRden9HyKwIMM=;
        b=pBtqEPkT+c0DTVgAeIfYgp4v47/p4ZQxRF+YDQEXHwseAGU5v3wEYdA4iZls/7Uuqs
         LeSgaJvvE6WmysMh42Fb0ybPbbp4VBD0+sGjCFJuNLGZtMeJeyT3RY61XmzlK5MoiHM3
         LhdPE28b4MWYU/bZA/VR0pVXfRb2spRCORuNacPevtlsX95ZSZNuThWbFKs4WotHrYiP
         pYInTy2M6G/hKeL6DAxktchTv31YKWydZDa8N5LCN5atE4qEyST21LCFUC/v781MImjK
         MvpYPgwAnMFj0YJcL+35l2kwnnVcLzOaAonABrfys83qT8pvonyH/5ZrVMc9y9tnqvVz
         5mQg==
X-Forwarded-Encrypted: i=1; AJvYcCUPk0kbbTL40ETeQYmgZFn+CVcNcuM0c3iuN4oOGnlLnSP5cXGf9U27u4tMAc+nQWy0mQmNzYDS2IBRMFSGAzye@lists.infradead.org
X-Gm-Message-State: AOJu0YxMqoU874uLE+opFFPyFCuXrpeTK39gHju2Vu9nWcEXcmiuAd+e
	QU4ITAtVEMHZ3ebcEeQ7VhnPGAvuQBbYFngvcK/uon1TyV3/QUCwp/l1
X-Gm-Gg: AZuq6aKd3wEToy8DamepZOLlImqIvTuERpTjcMJ2HPnkWdmYLJBf+UCRuQJXMPPynUM
	lLhsWeud/+Fy+0vLPGkcNSqnRJtjMwNKFJ2Xm6GWYXwoR6PKwOL0jBRio4ceFTDF01JHgT1zyCF
	WXU7lec9z4n67yHNfum76ADg5MdwMWQ5EJJO31HGTvRz7GqZkxKkr3h5EXGE4LoFnzlLIJvqeFI
	1BxxY+rfmFT1dq+ZnEjWlCZTgycre0GZGHMMmGjAmkP0XDwITeT8rE+nRjDcEvXfSMofU9iLXux
	FFvBWJOHFCYrdr6wII/DFM6wc7GR+hRBy/dVHQ69gYID9SgFmNBOmrF1NuGlYWIr7aHSDQTldN6
	H8h1tb+F3Chc51EWhjOHroJWcUwqP2IS1+MhW4+x8iODUsaxUiCOQJBkWBRpjwgNy97anby4y2w
	==
X-Received: by 2002:a05:600c:4f4f:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-4806c7cc86dmr126373465e9.16.1769705032532;
        Thu, 29 Jan 2026 08:43:52 -0800 (PST)
Received: from desktop ([149.88.24.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce56068sm132122215e9.13.2026.01.29.08.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 08:43:52 -0800 (PST)
From: Andrew Geyko <ageyko0@gmail.com>
To: linux-staging@lists.linux.dev
Cc: mripard@kernel.org,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Andrew Geyko <ageyko0@gmail.com>
Subject: [PATCH] cedrus: Convert bitfield macros to FIELD_PREP for clarity
Date: Thu, 29 Jan 2026 17:43:41 +0100
Message-ID: <20260129164341.104155-1-ageyko0@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_084355_269200_681414B8 
X-CRM114-Status: UNSURE (   8.16  )
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

Use FIELD_PREP macros for VE_DEC_H265_TRIGGER and scaling list registers
to improve readability and maintain kernel style for bitfields.

Signed-off-by: Andrew Geyko <ageyko0@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  | 28 ++++++++++---------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index 05e6cbc54..e8449859d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -344,8 +344,8 @@
 
 #define VE_DEC_H265_SCALING_LIST_CTRL0_FLAG_ENABLED			BIT(31)
 
-#define VE_DEC_H265_SCALING_LIST_CTRL0_SRAM	(0 << 30)
-#define VE_DEC_H265_SCALING_LIST_CTRL0_DEFAULT	(1 << 30)
+#define VE_DEC_H265_SCALING_LIST_CTRL0_SRAM	FIELD_PREP(BIT(30), 0)
+#define VE_DEC_H265_SCALING_LIST_CTRL0_DEFAULT	FIELD_PREP(BIT(30), 1)
 
 #define VE_DEC_H265_DEC_SLICE_HDR_INFO0		(VE_ENGINE_DEC_H265 + 0x20)
 
@@ -424,17 +424,19 @@
 #define VE_DEC_H265_TRIGGER			(VE_ENGINE_DEC_H265 + 0x34)
 
 #define VE_DEC_H265_TRIGGER_TYPE_N_BITS(x)	(((x) & 0x3f) << 8)
-#define VE_DEC_H265_TRIGGER_STCD_VC1		(0x02 << 4)
-#define VE_DEC_H265_TRIGGER_STCD_AVS		(0x01 << 4)
-#define VE_DEC_H265_TRIGGER_STCD_HEVC		(0x00 << 4)
-#define VE_DEC_H265_TRIGGER_DEC_SLICE		(0x08 << 0)
-#define VE_DEC_H265_TRIGGER_INIT_SWDEC		(0x07 << 0)
-#define VE_DEC_H265_TRIGGER_BYTE_ALIGN		(0x06 << 0)
-#define VE_DEC_H265_TRIGGER_GET_VLCUE		(0x05 << 0)
-#define VE_DEC_H265_TRIGGER_GET_VLCSE		(0x04 << 0)
-#define VE_DEC_H265_TRIGGER_FLUSH_BITS		(0x03 << 0)
-#define VE_DEC_H265_TRIGGER_GET_BITS		(0x02 << 0)
-#define VE_DEC_H265_TRIGGER_SHOW_BITS		(0x01 << 0)
+#define VE_DEC_H265_TRIGGER_STCD_MASK  GENMASK(5, 4)
+#define VE_DEC_H265_TRIGGER_CMD_MASK   GENMASK(3, 0)
+#define VE_DEC_H265_TRIGGER_STCD_HEVC  FIELD_PREP(VE_DEC_H265_TRIGGER_STCD_MASK, 0x0)
+#define VE_DEC_H265_TRIGGER_STCD_AVS   FIELD_PREP(VE_DEC_H265_TRIGGER_STCD_MASK, 0x1)
+#define VE_DEC_H265_TRIGGER_STCD_VC1   FIELD_PREP(VE_DEC_H265_TRIGGER_STCD_MASK, 0x2)
+#define VE_DEC_H265_TRIGGER_SHOW_BITS  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x1)
+#define VE_DEC_H265_TRIGGER_GET_BITS   FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x2)
+#define VE_DEC_H265_TRIGGER_FLUSH_BITS FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x3)
+#define VE_DEC_H265_TRIGGER_GET_VLCSE  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x4)
+#define VE_DEC_H265_TRIGGER_GET_VLCUE  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x5)
+#define VE_DEC_H265_TRIGGER_BYTE_ALIGN FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x6)
+#define VE_DEC_H265_TRIGGER_INIT_SWDEC FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x7)
+#define VE_DEC_H265_TRIGGER_DEC_SLICE  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x8)
 
 #define VE_DEC_H265_STATUS			(VE_ENGINE_DEC_H265 + 0x38)
 
-- 
2.52.0


