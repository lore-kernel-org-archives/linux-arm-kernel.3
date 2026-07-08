Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1EAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FeTFZKGeXcKtdGzHWtUv5E1DeHN3B2mS7xb47BxMxw0=; b=1Y1HNZhpEj0pZo5PMcyNMo17ss
	U+wpKAiSahFHlWb4/uZXVvsH300yOMrSy2PUAgocs83Ke7naO3tMIT0f4H+WeqZOqXy84x8S8776F
	Bv8V0lVIVyUpuCNiw0YKwQIvL+G15ljzLOgjOBSd2JeqiFmFJQPOWeRTepDh8v83xlGWvgK5pzkUB
	cp9BkUtj+HzDvectEHMmetS1WIUrHZEuTzhBrxAoNruALiGL3D4xHhU0J3yA4z7HDTrE7DYscD6Vq
	vC0W8Non0OYXEx7Z+usdS2bpxa8zi085o8UeojKRmh5bgrBE/iA/Ut7wYbkTWDpf40ug1zx36Xkbu
	XL+t1EaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRc4-0000000H8Ug-3Wwd;
	Wed, 08 Jul 2026 12:42:52 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRc1-0000000H8TG-2zBR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 12:42:51 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8478cc93299so648640b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 05:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783514569; x=1784119369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FeTFZKGeXcKtdGzHWtUv5E1DeHN3B2mS7xb47BxMxw0=;
        b=NH+AQhEvffnzctiDU/ENoewgB0O9n7tqq3BTdt5G7HLzMJcr4Yk1tZIJbpJVOH4yeB
         y+h0E1O+L9NS4qEBHBmLgq2WWxbWbnXTnDANqgKTm5YVWmJTgv+l83JT/Wrrn+FuBBNO
         jBlWLcDBKO240be3iuvqFcdDwn+bPlY0QqONJMYlbNk7wLfhaRzCaOOjwd7CfLr5YAGB
         XhNYV4eINbfPuz+AW7USZsOgaMJcPtVAhhPrEWfEpA4PgDnnrc97TPqwnYUQyG+FVjoM
         HDH83e0GdhSLddo9fD/61/JCrHnVxthmZY3u7v3L0OLRgs8L9TbLYhPz1gQF1XtdF+SR
         DWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514569; x=1784119369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeTFZKGeXcKtdGzHWtUv5E1DeHN3B2mS7xb47BxMxw0=;
        b=tITPh8gNwcP7cWeTevI+RdzlBo9lOpBw3kNO3vrfE5tFNYRbRNanuE0Qs/ghvKtV24
         aekG7pE2tkmdZ9ayRP/LxpLQO5TUlAIyYlNSPqZkUuiZC/UbKU6R8XkcCN+WPFhxQiSt
         NcoUkBEHvANCo2jcw+xqe+tGT69PDq/tKv8KQth0YbfavX7u0fhIW/EFYHmr3IWTSdp7
         gjrfAZinvvNAZEwX1yqwxkXK3z+btDcnMAaKPKSUNKZZdaA56H7R9tJeiJBFz8byG4V+
         HYseZrtc6RbFRC78PgdHfy/SARB+kk8ol3adMIiozPDwXqGjzt1kWMdx8TP+NsTMeqr4
         aYcQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCRJ9cXia/25F9iL0PxhGeikH1p/OGaiYuLNk2EjI3w9TmbzcSd8jUBj4G/QsiIPTGCY4bD7G8viZyf++HFF+C@lists.infradead.org
X-Gm-Message-State: AOJu0YzEvmM4yvNZxsz7SBMEhppOkOAuSuHYqjlJzT6yEgPoOfWqXG6h
	NoK4b5GG2P5jAnJHNBX6tRh8AQsGDx9CAxfDuNJT1O7263JrX2kIttcU
X-Gm-Gg: AfdE7ckRBEoB5OsLjfjTvRkOGFcSK0PlfORSHolMWFKfXeZi+G3+I3jQhHIzYXXkY09
	ZBPKv1kcnkJUw9trqp4Af7zXV9owNHm8Y6WxjoBQkv9trO3EsL5f6bF/tNFmNZnJ/M3HsmZo78j
	WDr9or0nTLgJPvN4pZWUDGrcgwz+tDhL+zCpaezD7jkW6Y2NqV+pRgA4/tBFn+vEYspFXbIpT/C
	sTlTSehUFBun+YmfCzq8qf/U6UkuIPPgDVG39XFdzEdsPzUdqJnC1hVe4+MhHN0p3xPCFHrUNMu
	dzd7Yi0vLp/1UUGWGyMjKWLNuToJkrbXRQcPyhdeXyaNiPNdJiVjzEW+hCv9mRHtRCmNrdPsnNs
	ycbjbZdLSecHj7NiQctT4IuaoVPQCyewbqYPsDMCw/LP0sqy0dRPVvHtuMxU6+d0jpc+TD5tX+g
	YNgA==
X-Received: by 2002:a05:6a00:3021:b0:847:8b1d:22fe with SMTP id d2e1a72fcca58-8484341100bmr2523607b3a.50.1783514568759;
        Wed, 08 Jul 2026 05:42:48 -0700 (PDT)
Received: from lgs.. ([101.36.106.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7c2casm6963729b3a.43.2026.07.08.05.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:42:48 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: vcodec: unregister VPU watchdog handler
Date: Wed,  8 Jul 2026 20:42:35 +0800
Message-ID: <20260708124235.763036-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_054249_752326_05BE0AA3 
X-CRM114-Status: GOOD (  15.75  )
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

mtk_vcodec_fw_vpu_init() registers a VPU watchdog reset handler and
passes the vcodec device as the private data.

The handler is stored in the VPU device and can outlive the vcodec
device. If firmware initialization fails after the handler has been
registered, or if the vcodec device is later removed, the VPU watchdog
table can keep a pointer to a vcodec device that is about to be released.
A later VPU watchdog reset can then call the reset handler with a stale
pointer and dereference freed memory while walking the vcodec context
list.

Add a VPU watchdog unregister helper and clear the vcodec watchdog
handler from both the firmware initialization failure path and the VPU
firmware release path before dropping the VPU device reference.

Fixes: 01abf5fbb081 ("media: mediatek: vcodec: separate struct 'mtk_vcodec_ctx'")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c    |  4 ++++
 drivers/media/platform/mediatek/vpu/mtk_vpu.c     | 15 +++++++++++++++
 drivers/media/platform/mediatek/vpu/mtk_vpu.h     |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index 3632037f78f5..c79a78c371ea 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -40,6 +40,9 @@ static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
 
 static void mtk_vcodec_vpu_release(struct mtk_vcodec_fw *fw)
 {
+	vpu_wdt_unreg_handler(fw->pdev,
+			      fw->fw_use == ENCODER ? VPU_RST_ENC :
+				       VPU_RST_DEC);
 	put_device(&fw->pdev->dev);
 }
 
@@ -120,6 +123,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use
 
 	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
 	if (!fw) {
+		vpu_wdt_unreg_handler(fw_pdev, rst_id);
 		put_device(&fw_pdev->dev);
 		return ERR_PTR(-ENOMEM);
 	}
diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..f59f45fecc75 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -437,6 +437,21 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(vpu_wdt_reg_handler);
 
++void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
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


