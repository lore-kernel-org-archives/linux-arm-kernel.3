Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8554BC4450C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yypRmBCUWIxl+HGMvLm537bNGK8OjqXD29gbJvwfD6w=; b=UxXrgtMbqhNac9CpgQpDRGj5BG
	xvMSNbNnHH6PQu6t+qxKcwghaBsVjpJS0fmtrnRBXDvuVQdm6mE99oMKnh6emZ+IqknpZlsaVLEjS
	Zrq62d/OXijzUEkKiSiAniXsUhzt3LRYjDNGGIBYdpCoqCmzXsR27E8d9Mopx50E4I6G5RaSVdXH9
	2RBdqnGqZJNp0XagGdliMhYJV7FdipHffMSVra6aDTestTaEAc/ah1mriymfnYmpYfD9OqIBjiVmp
	3k+HTIDs0f2Hi4/Ues4hFGSDv5HGFOXYLHYYt7O1HMUFQdrxA/5knZaQlVId6WbVw0cLp5Wl9Y+4G
	dQAawp+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm5Z-00000001xPn-0KHJ;
	Thu, 09 Jul 2026 10:34:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm5V-00000001xNi-31B4;
	Thu, 09 Jul 2026 10:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783593275;
	bh=o0Yw5UvJ7mIldIg8Qe+QDn/C3b8GslyK/JoVs7xCZ6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HSNEDKBOFib8MTQf+hrPqmbH71R1tXAjNZerMBPLlnNDeivPoqXY3N/1zsQT0FE11
	 oo/rnxOpnH1nesh3Os8UU7O9zRbgXXJ1vRfBPLFYyNMzwrVMGAURBy5pMRj88HPOdc
	 4GzrQaEzz69MtW4vjwsnEWGBeiz6wjS75WSopU/9+EuttRbz+/97TB6KVXDr3/pfa9
	 8Uc02k0cj8bpeCTW4G98RFvaeI12pgSiJi4Hfk53CYoYPgDJUPrTno85D4yyJw9HuO
	 3ahPEB+qMyjXaDKSXN+sqthHJ4F4OyjDkuQvyTw+VJWzMpWOTnNdoL6k6WytoHVQ83
	 4bHf+H9crGHzw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E0ED517E0CDE;
	Thu, 09 Jul 2026 12:34:34 +0200 (CEST)
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
	jitao.shi@mediatek.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	dmitry.osipenko@collabora.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v3 01/11] dt-bindings: display: mediatek: dp: Deprecate nvmem efuse data
Date: Thu,  9 Jul 2026 12:34:21 +0200
Message-ID: <20260709103431.46616-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
References: <20260709103431.46616-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_033437_902993_BB0B5989 
X-CRM114-Status: UNSURE (   8.91  )
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

Deprecate nvmem-cells and nvmem-cell-names and clarify their
purpose, as those are for PHY calibration data, not for the DP
IP itself, and that data shall go in the PHY binding instead.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dp.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 8f4bd9fb560b..980f76667ada 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -30,10 +30,12 @@ properties:
     maxItems: 1
 
   nvmem-cells:
+    deprecated: true
     maxItems: 1
-    description: efuse data for display port calibration
+    description: efuse data for display port phy calibration
 
   nvmem-cell-names:
+    deprecated: true
     const: dp_calibration_data
 
   power-domains:
-- 
2.54.0


