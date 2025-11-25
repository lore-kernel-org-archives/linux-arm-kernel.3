Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB96CFD37C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 16:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0tI7a9kzpEpcAUq5bkgeEv70xhEJJ55fDL6QvgHVSo=; b=5FWifg3cg8k6e0iNwISrOCnehA
	clyZS1V6/eMqdEGsHgD9RyaU/91pzJUOUkfQj7gaB/IKd2HIYNteRXnBKBFo8YyeMl6IYSaFdBQud
	GAmR+kh/uEysptBEHmFILmId3Ujl9w6bdO/W7m8K6Vfql5l0/bKWoilpDWVm5SsxuYErVHCAYWLqL
	FmAXu4DlI6bgc9jS+tmouz0dp8rojJbzAquq4+l50KnveUPtoqoG6PTcJrnoe/ntmwj1sr6oRUrSN
	pnKlIYkTnfx6+mWI+PVachQ9rprVQh0ehCnX6BWo0fg2z8oh/tqEiBqgt/mICXt72nTVO6AqkzbeF
	jn2smCnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvjw-0000000DZZC-0a3Q;
	Tue, 25 Nov 2025 16:18:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvjj-0000000DZLL-0L3y;
	Tue, 25 Nov 2025 16:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764087468;
	bh=4DAkv37ea+2d/7BYgVUeJPDn9xhNgNPTUmdoIJAvKNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iPSq7mxxyfNeGveBwVsVoCKMTXATIu6R2Cpwc2EAscZRhVEHQcPAWSuRHD7hj0trA
	 OgwbWJJYHwPqh0vf6NSMSCmzE7RuqkGlYsvyYOMz2eJ4ou4wT4ZbxoRfYSIFevVt5w
	 c8tb7/by2WVgdDrdYqDEPu8AQqGztgLu005aID5c0D+i2qWIpspc10I3SKBq7vpo3f
	 K+7oQO3lLQ20ciCVaDOzunGV4RkaAt8W5bS/WQ4tEb9dH/SxG3VUDnecyqxhnmKlij
	 2Petz1tBps93z7ZU6/pN6vzjTVVEZoV2qFmYobc2RCfXWFOo9c0uSJDjYR3QZhQlV6
	 DiDRygtxaItqw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:feae:4183:be92:e051])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 96F0A17E10E7;
	Tue, 25 Nov 2025 17:17:47 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: nfraprado@collabora.com,
	arnd@arndb.de,
	colin.i.king@gmail.com,
	u.kleine-koenig@baylibre.com,
	andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com,
	bchihi@baylibre.com,
	frank-w@public-files.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	fshao@chromium.org,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v5 8/8] dt-bindings: nvmem: mediatek: efuse: Add support for MT8196
Date: Tue, 25 Nov 2025 17:16:58 +0100
Message-Id: <20251125-mt8196-lvts-v4-v5-8-6db7eb903fb7@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251125-mt8196-lvts-v4-v5-0-6db7eb903fb7@collabora.com>
References: <20251125-mt8196-lvts-v4-v5-0-6db7eb903fb7@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_081751_317718_B12E0FDD 
X-CRM114-Status: UNSURE (   8.38  )
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

The MT8196 eFuse layout is compatible with MT8186 and shares the same
decoding scheme for the gpu-speedbin cell.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index c9bf34ee0efb..f9323b3ecfc8 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - mediatek,mt8188-efuse
               - mediatek,mt8189-efuse
+              - mediatek,mt8196-efuse
           - const: mediatek,mt8186-efuse
       - const: mediatek,mt8186-efuse
 

-- 
2.39.5

