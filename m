Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E042F3D5FC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 09:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TB/QPugCcb4AdM0Fj/XxB/blX3PBNtkMN7SH+oDhiFA=; b=NmbmCKIK2iC7Z9banPUvP5iPBJ
	WYbC3OJuEzuyZiyiTJbjos/M8NCkKyRGXgfWCQfzqg9iuw/kDy8uXP0dF2K8KmGDrHLCZ2+VLhGuC
	eNfsiGTfe7ulqjfeuJu5yMPNgIpS0gZ2Zpa3p4QS/zAPIqUHZ+xlttPFcPUXgj3Z1a6cl5lTvEGx/
	h6Gf/wD5KUn0i0sLidyAq2mtQxvjwHHszAAFoTUkzL2b5ovnDQfAywG87lafDVSFZ4h5b2Rqqtz62
	8KuYHxrFWojQjZqUC1njftlCr+7L6EE66J+4ZsmBKF+k2DhSgCLDhxu/IX0Mlq8jFc6RjnrvVklkP
	+WnN+lnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6mCL-00000009m3x-09oi;
	Sun, 29 Mar 2026 09:12:45 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6mCI-00000009m3J-3nHq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 09:12:44 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so2949740f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 02:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774775560; x=1775380360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TB/QPugCcb4AdM0Fj/XxB/blX3PBNtkMN7SH+oDhiFA=;
        b=c3KZYfnkjVAhcs1j+5vPk+NF/VTH12UfaL75UKux0nbpQl4pNe3yrOx17UGXx1qyNc
         qs6m85mrmERpw2Ru3xLmQ2ayVhBU0aDjB8wl5uzKBcvzC1YvRIBzm3nXL9PoJRO6fbxB
         KlHpvM4fGI3KRDIZ0Y8AG32Sayvu19BdHJPm4k9DnI3323VxJUetoMEBhFsLcwLLlxWK
         EwH7gM2/dpeT+cJJZSBcz82rP50Nulhhq8guCZmGXAILyJ23t8fb7P5LXS5SvDkgiKA7
         5KeUhxosZR+9KTGl9uf1HeTirKKG9GFhGDclUiA2eNlJTqv5dpzo5SW3j6TanwxgAWcM
         Rdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774775560; x=1775380360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TB/QPugCcb4AdM0Fj/XxB/blX3PBNtkMN7SH+oDhiFA=;
        b=PM3+0Nv4iJwujJpUsPSbQQd+SqfeMvIUfshVjnJIAYhcLXMAIWEp9v24LpNg+WOuwR
         I6bklSiP2u+EHlVTCEsm7UzHZuKQVpL5qmCqOwbR4pDjoHtvq77g86+z0HDTnJSe7YB5
         YwIK9RkSEJQKV2O6glssQOuCbWDpm81Z9aGQwXA726byLjOnpw1SQ6rTXTOMTAFu1atU
         bAvoCgKwlhBS34mb9h/R/pUDZGzF8g3+HN6Wq7EOG3BkHTqdfnGi1BpALstECFPHWBLJ
         A97Nlvb0sJ6fm+nH/4jur7l39LHfGN/c6NbgkOabCRS+tKOLXdiFQUoEXgsX1XXQTAUQ
         bOEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0oqLJVJSyQlpuwLuqhHGQM44G+37DspQUkvd3vIeu6n1OSwoCl9ItP7FE/0Tp9dIZQIKSAG3nHh6HOQ+UYZ+z@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy2qENeF8l49In239ujAG82RhiSOr5a0O0JBg1rCYmShKX1n9Y
	xYNeuG7JLwsRU7CSP3yRcdNhaYWca58Bt5yc2WDaVY2b/cKFw3ybptxC
X-Gm-Gg: ATEYQzze+rYXqraivMmDaskpikcS1DC09bfL/O6p8biVoUgJRaExP0AssGStP3ViXb+
	YaT7ticf/RU4XjxeiXBBnx8N6VRIcTHpfanjBfuKco+wixxcYYb6VMmUl1j4Oor8EO1yyYWRJ7P
	nGmh9zxsHFpMzONBJ3hPd+ipDuyipj97Yl4ZbHJNCLdy8BDLN+Jp3a2pBewZ00IN04gFbzgGDZZ
	gqSFnsfOHAN3kx9RmMoYAuBJZqqSQP816+nKf4mFTSsY9jqUZxvVxbCilZ5pbkyJ5E6YYRLSEgk
	rllwBGUHiTiuowKdVs11D7u2vrnLAdo/tsJX39MMbcLfaBRmRZNYWYvbfnz2m/vyGumCqvlOoxj
	sAIo6eHZhatt053MGL4a6yGDgZETMFHspKbQozgmlZk7zn4vWPDDC7IKJfKew67KpuJnVr5nrfQ
	ZWVKbf4H/TCpR3fBERlFY=
X-Received: by 2002:a05:6000:428a:b0:43b:5b25:67ff with SMTP id ffacd0b85a97d-43b9e9a97e9mr14703306f8f.24.1774775560242;
        Sun, 29 Mar 2026 02:12:40 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf90424fcsm4625813f8f.32.2026.03.29.02.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:12:39 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 RESEND] soc: mediatek: mtk-mmsys: Restore MT8167 routing masks lost during merge
Date: Sun, 29 Mar 2026 10:12:20 +0100
Message-ID: <20260329091225.4530-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_021242_959632_05E46E1B 
X-CRM114-Status: GOOD (  10.93  )
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


