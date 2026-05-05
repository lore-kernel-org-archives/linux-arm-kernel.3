Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A0FFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 21:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rNuMGfmxMip0cWapRhuAN/YH+anSCWLVtZVC9Uw49jg=; b=xYusyemAnfxiG/9W9WqqPhrJGR
	hQzl690ujvzQ5yS7+7c6MC9dr+p5hM8G4zoMO3tpoETsrdmKhJuFthbhNZc7K3qdtZeRTlzf6X1H5
	Eiz2L0izNQiVH3Zl74tPaOG0WMVH3BlPFKqkcyp9Ql+sJ4WyW7qd4pXsdxPip9Xh00cq9aYhRJOob
	AY3SbiL/PQ4YtEPBU6A9sxWPc27/H/Z+QpHLISOulhuJR8Xs70fhy1w/7zJPGvZYgDFk+pyqctHoo
	yPxoBJRmhikpOL7DNUnz/v7tRucHqIShPOQXQbb/NOBC08lgioIVxhLxK01yv6EWkX/9CG/irWYvz
	ERMDqD+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKN5o-0000000HVhx-1ILJ;
	Tue, 05 May 2026 21:14:12 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKN5m-0000000HVgz-0Jgd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 21:14:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso2656614f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 14:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778015648; x=1778620448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rNuMGfmxMip0cWapRhuAN/YH+anSCWLVtZVC9Uw49jg=;
        b=eSjNudTnKwxillJ6HsaMXEC/dHOMmX8X1SMUxbvvTJbzoZRB0P7NwhLHqO00sa/Klg
         MuMQr+dJezRaPIdo00YZndv2uOVAO2RIx2xXoAexK5BGiSzBmHxgaK1WcIgBrce2FiZ8
         kuMJTG4UY7jt2AVtc+8gjWEPh6n4TuW5hHPBy5Gez8qm1fK+pSa1LeD5HK1PBUyCIghJ
         FBGugoauJHJ72Rp1n/kosAu+PuvyIJhnNWMyh5K7CGi02g4aE4uxCY3vrysJ9Pble1Pg
         vTfzcJpqE18cy226ICL/6E5bsuTIu3CZ7mLLxBJHpvx+RUV3O6pxXjBorQ4MmnD7nGR4
         RwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778015648; x=1778620448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNuMGfmxMip0cWapRhuAN/YH+anSCWLVtZVC9Uw49jg=;
        b=Q6ErziaiZ1tw+qRlGSr+ssa2S2SfxqCcbEbhTw0gSvYmUzK/DNocCIt3tTW4TvTd6c
         Aiv8EEALz1mBbU8+DLic9f7EVqTtNt/Cam6e8B4O+1upfxitUwm/Cs+pVAOMJn6TbfDt
         vs1s5Yl1/dAZmNSeMOx+xJwLRFyZD1bmXAwdEwmgiOAt6uHcHDPLyc5BHp6JYq2wYqI5
         8qHJHDo41wVHOz+gSh1GJnOs6vqGEY/sSmtyrN+kggnHykKa4JZH0FMndwUhQFIlNxFS
         JVMtliGzXSmqEvcUuxnY8/CDa6f0CXvPtW5vfx4O4F8HqhTLfzzeRckEGYoY9GS6aEjf
         RZ5w==
X-Forwarded-Encrypted: i=1; AFNElJ+uZrQjcX91uVvu4N4FIE2YFjAr7kMpyeFSgpEAB+elDYsbC1EMO6CjKFvtmzWNvmjdCINLyxvlrRM7xAM+u67Y@lists.infradead.org
X-Gm-Message-State: AOJu0YynNYXu2ixAm1bhKE2wnQtyXOya/XdUykqLckO9xt4myxLvH/at
	3llpmh2JpQkViQzXSufltREb8ocDaUr8fI5XGd/K3DntMYqhv0A4kFtM
X-Gm-Gg: AeBDiesJquL+QgWPSkDG6TeGc9xdYZntAXADMdGJcBOB4ijSmAdtey7reCLVtCr7HH0
	3/QzL4CxPZtLfFy3uG7NVNdpqcjPtAoOwyvtno90/sCjzbMayHOMiKyrcO2PM6FkiP+DaM8Jghu
	zQ9bINFZhdxSY09Ue5w2PmOmdyRoeopLYTrWQOC3sdG0ZYLnzAq2oqsUCf9w1oj0RmkRuQKPNUk
	o5aZhG4uM/1FHNdRK1QpaPG5L4qvcQBjAG08V3+tfTnXWPXIFzd6jSYBct+pwhwhbGAtCtk9aL4
	CNDY5n3WzGYlZj45AwB+9uA31PC8CKc65cdgr5qzor1VHqzdeS36yxJBdLp8ajW3rYnqO/qIiPP
	z8NCBVY9LmF4K+IYbUsva7nF2pR5QPCy9x1Q6Q61YxnQ2ksaTbNJ7hsxU3ov2qir5FUbBuTMCnP
	scSnVOMkYLUw+N/x/aM4WSHwQc0hj73fs9SlRMZSjL
X-Received: by 2002:a05:6000:4010:b0:450:d4f4:ade7 with SMTP id ffacd0b85a97d-451579a640dmr1159505f8f.0.1778015647581;
        Tue, 05 May 2026 14:14:07 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03e04sm7493786f8f.21.2026.05.05.14.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:14:07 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND v2] soc: mediatek: mtk-mmsys: Restore MT8167 routing masks lost during merge
Date: Tue,  5 May 2026 22:13:16 +0100
Message-ID: <20260505211345.318647-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_141410_132162_1E60102B 
X-CRM114-Status: GOOD (  11.32  )
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

The original patch that was sent to the mailing lists included the values
for the route masks, but they got lost during merge: add back the full
register masks where missing.

Fixes: 060f7875bd23 ("soc: mediatek: mmsys: Add support for MT8167 SoC")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Link to the original patch from 2020:
https://lore.kernel.org/all/20201027160631.608503-2-fparent@baylibre.com/

 drivers/soc/mediatek/mt8167-mmsys.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index c468926561b4..eef14083c47b 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -10,24 +10,29 @@
 #define MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN	0x06c
 
 #define MT8167_DITHER_MOUT_EN_RDMA0			0x1
+#define MT8167_DITHER_MOUT_EN_MASK			0x7
+
 #define MT8167_RDMA0_SOUT_DSI0				0x2
+#define MT8167_RDMA0_SOUT_MASK				0x3
+
 #define MT8167_DSI0_SEL_IN_RDMA0			0x1
+#define MT8167_DSI0_SEL_IN_MASK				0x3
 
 static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 	MMSYS_ROUTE(OVL0, COLOR0,
 		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
 		    OVL0_MOUT_EN_COLOR0),
 	MMSYS_ROUTE(DITHER0, RDMA0,
-		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_RDMA0,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
 		    MT8167_DITHER_MOUT_EN_RDMA0),
 	MMSYS_ROUTE(OVL0, COLOR0,
 		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
 		    COLOR0_SEL_IN_OVL0),
 	MMSYS_ROUTE(RDMA0, DSI0,
-		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_RDMA0,
+		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
 		    MT8167_DSI0_SEL_IN_RDMA0),
 	MMSYS_ROUTE(RDMA0, DSI0,
-		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_DSI0,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
 		    MT8167_RDMA0_SOUT_DSI0),
 };
 
-- 
2.43.0


