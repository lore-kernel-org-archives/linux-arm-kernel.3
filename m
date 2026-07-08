Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC2BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bsvd183HUzNrbaQaZyJehydG+OJhqnijLN4x6jt8zdI=; b=0puD0fkWuZQB24EqvmdGWy9MFW
	JXGPVWLsxDOoZFuZeFZoAHiVz64/6LXh+SiH9+QhLB9TTQCvhKCDIra0jEfpmut+bpxWW6mA7+MxR
	JonBC67+P0SepTo2Xtv7J+E622pmbpcrMqv79IgcMlIoMdxpupXSmzLvx8eDAsTr/FPZkx4USOVrI
	FYSM2WaH9b6owsiIcXdWs8K9Uj1/NPFq4uM0YpsVYkHy8q/kDbShZwgiEzp1QEzgMWY+1IKX8BSRx
	NZcaTywi+9xfuVZ3YD9TRRcWpxo6/S0ATmByBsJryPsUKNHDvO0HpZkTBCI7LDdk4U1t54XwoCX7g
	pKnS035Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRHR-0000000H6vj-3T25;
	Wed, 08 Jul 2026 12:21:33 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRHP-0000000H6v0-1YFg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 12:21:32 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cace91f112so6369085ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 05:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513290; x=1784118090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bsvd183HUzNrbaQaZyJehydG+OJhqnijLN4x6jt8zdI=;
        b=ka78JC9pRp+GCbITMutAlCql5FiueCNOTw2+63edDcn5b6VIIDIbkX2roO9a02pg7q
         LOfSVvsz79+EY+Iv++wcjvQxbB15Vah2VxwIsME37fb+zx+L/iyGXf448JrjnK1aI/Ob
         moz5k+5XidTAMttXd/URlXqEfAAOqZqJRrtIYasmfleLxBjtfn2kKJqadOFuB2sa1MiU
         6BxcoRcFB0C6SosDTjebGa2Ll+00e2bBBHJanCAt+k9TDFIc6AYQcj9jsoGWUDjKmeX2
         l209wsx3lR3iN6sqi7lX8Pl+EnZbYyc2xEVHVccZvbGYR3jXpLJKXXYgtxoKEG/ow3uZ
         3sKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513290; x=1784118090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bsvd183HUzNrbaQaZyJehydG+OJhqnijLN4x6jt8zdI=;
        b=D0EIUqMvckYtaWHHFXIFa/bElwYF+cAcK2c1ifKRCgZhHCLU6DCMsToFtU24wssVrb
         SAEQiTzMqMhfi6ZORN24c1mWIrCWcydTvCtXtQGhAF5nYN2w2nS9Utr8KHwd7rlYmrKS
         vqBDHPcS2LO1/o5EW4EM+bwVoyo6sGFT91t8VV/Ioz5Yij7fSt5jYOh0WGQkMUkL8k+c
         O+ezYJgdbM/PQx7pjregsoTOCu/L/fX+X6wns67nvtkSV/ZEuXjbp/VFBQUFt8Aw0HDQ
         OHszwZBG8ktaVAxTnqcYf1T6Ga13T5jjHH/O/I34vpj5tFTgsguEszI27/adBath0C8y
         wi4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrIXvkwhiSOa3CxFsnPXIQ+7aSWoXPZZg2EtTvQFy9ulfM/zBysvyxmgocFZkS6psVjdnqLOXIOmCsjR30ve9wM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5VITcBHwr7W7/TKT5qlrrPiiE9KGrUxY1KEOacN7SN1M7XvN8
	Ddtx85gECunH4QoJUTboaPuwNt+p3CF5Q34duqNlR51VyXH0nVqLfMtX
X-Gm-Gg: AfdE7cntAK3RlaemwNO6EWBAqvp2sOnvSb9gXVWpuwtnmKnbZWgYE3Fb4O+LHiA/e3a
	bJQjLcEnPmSFNR+dZcHCPNwNtwGO9SjqDpH76dlPy9hPkExEK2VkqDBJyow5orNCcyAt8wEvQEL
	GZw2uOjJHBEqYo0LFOQk5c44DOyvamdyCG8Qv/4+4+QZWLa3Sx92me0QMjOKxq7bTD72rf5AQ6O
	zZWgMYwkrwfUVXjqz/jSL7tERcD9869n/cZzx5PfU9c3hC3YLizLZcyBM+Q/4kodD8L2sRWzYqV
	Wt7o21wkqAH6Onf97B54aSZjl/OgvvtQrJfFDg+GbQWsuOX7mv9KscdvLNVDANpPNvIbebXK0jM
	Y8om6m/4sIkqp7XrYHPKDMYq/ufMdePzWU8alfobnjxb5cJiqw89wh1gMCgF6ZwIchQKAA4Q=
X-Received: by 2002:a17:902:ff8e:b0:2ca:329:3da1 with SMTP id d9443c01a7336-2ccea3ca5eemr24449855ad.16.1783513290120;
        Wed, 08 Jul 2026 05:21:30 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d474sm27620135ad.70.2026.07.08.05.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:21:29 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Eizan Miyamoto <eizan@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: mtk-mdp: unregister VPU watchdog handler
Date: Wed,  8 Jul 2026 20:19:10 +0800
Message-ID: <20260708121910.758166-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_052131_408232_5BBBF553 
X-CRM114-Status: GOOD (  15.35  )
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

mtk_mdp_probe() registers the MDP reset handler with the VPU watchdog
code and passes the MDP device as the private data.

The handler is stored in the VPU device and can outlive the MDP probe or
remove path. If probe fails after the handler has been registered, or if
the MDP device is removed, the VPU watchdog table can keep a pointer to
an MDP object that is about to be released. A later VPU watchdog reset can
then call mtk_mdp_reset_handler() with a stale pointer and dereference
freed memory while queuing the MDP watchdog work.

Add a VPU watchdog unregister helper and clear the MDP watchdog handler
from both the probe error path and the remove path before dropping the VPU
device reference.

Fixes: ee18fc7b0b95 ("media: mtk-mdp: handle vpu_wdt_reg_handler() errors during probe")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 .../media/platform/mediatek/mdp/mtk_mdp_core.c    |  2 ++
 drivers/media/platform/mediatek/vpu/mtk_vpu.c     | 15 +++++++++++++++
 drivers/media/platform/mediatek/vpu/mtk_vpu.h     |  2 ++
 3 files changed, 19 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 8432833814f3..5ccb7aa925d9 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -221,6 +221,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	return 0;
 
 err_reg_handler:
+	vpu_wdt_unreg_handler(mdp->vpu_dev, VPU_RST_MDP);
 	platform_device_put(mdp->vpu_dev);
 
 err_vpu_get_dev:
@@ -254,6 +255,7 @@ static void mtk_mdp_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
+	vpu_wdt_unreg_handler(mdp->vpu_dev, VPU_RST_MDP);
 	platform_device_put(mdp->vpu_dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..5dc50a658c2b 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -437,6 +437,21 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(vpu_wdt_reg_handler);
 
+void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
+{
+	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
+
+	if (!vpu || id >= VPU_RST_MAX)
+		return;
+
+	mutex_lock(&vpu->vpu_mutex);
+	vpu->wdt.handler[id].reset_func = NULL;
+	vpu->wdt.handler[id].priv = NULL;
+	mutex_unlock(&vpu->vpu_mutex);
+}
+EXPORT_SYMBOL_GPL(vpu_wdt_unreg_handler);
+
+
 unsigned int vpu_get_vdec_hw_capa(struct platform_device *pdev)
 {
 	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
index 3951547e9ec5..2ccb481a04cf 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
@@ -141,6 +141,8 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
 			void vpu_wdt_reset_func(void *priv),
 			void *priv, enum rst_id id);
 
+void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id);
+
 /**
  * vpu_get_vdec_hw_capa - get video decoder hardware capability
  *
-- 
2.43.0


