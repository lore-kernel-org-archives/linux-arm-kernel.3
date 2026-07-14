Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0E5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1ykrYlu6A+eLlYA49RfJpwJukIvrdEm0UWCuMZ77c0=; b=f6Sa3cs/Nl5+UgV2AAGUD86xHj
	wL6+h8rPuoVj8olaEM6ILOPPwoZG+3eeQoxL6x3b5cw5xj6KWNs5/rfbrL3pUhD/IaFCEozwbmVxE
	BoXFgOAvq3ESEmbCJVZT0wNSVJgi345J3nyT/MmgAej6paM3rM2JfuhCXt3goKr3f6HJ6LJl9BTDg
	/+tPWneUEZngA1x4/VrOXwzfphqujhKfNjhyfotQk3iM5CkdQc+LIhXotMZK1G+qmnsOyAe5wPrWr
	m/Yiz9YgCoiurY4lSmzj1gZFNkJGqVEZEZABRXWHsK/I+AR+7nMqFoVIMCqdJKuB+1oJS0Gb63luQ
	o2zfHHtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZX-0000000Bj7p-3vo4;
	Tue, 14 Jul 2026 11:45:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZ8-0000000BiOh-32xW;
	Tue, 14 Jul 2026 11:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029484;
	bh=o8YYKxiHeKp1LzjoQjOrfXbhQoZHP34rBrUqNiu0F80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ACH7/KghPskErSaYSNY5ctnedsi9Xx7ix6ZVXYmtihF293LEdkHL/qlmNvegIMDz2
	 a2N7jxftmz8qdeeGnxFKBTjFGwX/8U6kppYQ5NPNlziSGTg+Jm5XiG6SgHW/+fAOEa
	 lzgHwe2HmkRgHPV/pneROJ7EtE96YvNI+B+JwLNCIpqWAYDRGo+IEDgVn6mQ/EjykK
	 pYQZx/+3+dJ/cMckEsVeNLci4TZNnOikuUCjdf1YPltJMFhJVvmrjsWGwU4Oq0ZlFi
	 JaLeY+5CDcP3KAqW5i8WgpJKj86rGdmqW7h+2Cqw7P7PDWKjYEbMSmnANAMlbp5906
	 ZBshSGXp0wDvA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18AB617E0B89;
	Tue, 14 Jul 2026 13:44:44 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v2 12/46] dt-bindings: soc: mediatek: mutex: Allow #trigger-source-cells
Date: Tue, 14 Jul 2026 13:43:40 +0200
Message-ID: <20260714114414.184512-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_044446_984137_E5750811 
X-CRM114-Status: UNSURE (   8.81  )
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

This hardware controls trigger sources, and there's even a generic
binding just for that: allow #trigger-source-cells in MuteX, so
that this is allowed to provide triggers to external HW.

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index 5267cfe92572..886e6f904b78 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -54,6 +54,9 @@ properties:
     items:
       - description: MUTEX Clock
 
+  '#trigger-source-cells':
+    const: 1
+
   mediatek,gce-events:
     description:
       The event id which is mapping to the specific hardware event signal
@@ -116,6 +119,7 @@ examples:
             interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
             power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
             clocks = <&mmsys CLK_MM_MUTEX_32K>;
+            #trigger-source-cells = <1>;
             mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
                                   <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
         };
-- 
2.54.0


