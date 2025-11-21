Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9714ACFC266
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 11:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0tI7a9kzpEpcAUq5bkgeEv70xhEJJ55fDL6QvgHVSo=; b=vzmzi+oJwTRbdzw0ytAxbD9Wda
	Cz+ax6679Eybtqf4LAtjv1ulEehJSsmp+SLjwxI6OsDKiuwWdWx1KZUEPC0hR/Dwp3Y/s/bqwMaF8
	Y5rWqEuViId6Spk6b1oq9Wcivf9A1BghRvtOOUZsg8Gsi9KMDPuQ0kcc4tfk2hS4d0mPUr5bkBto5
	WP6lsLovTZuueyvjTVGppNu2aBefon5Wt+/NkENDSrztdEKxiS9KoHTgc4Ur+sdELJ9GOI9wDFYmC
	ILM1lwF9Jmu+n8Ktylp1KuoYPKI8UE8Cax38LdVe88f4quRMMABLZTKYss9f+NlM0GKcK66/9rofH
	4L6B2BNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8n-00000008IEV-3lE4;
	Fri, 21 Nov 2025 11:17:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8f-00000008I2X-3UUD;
	Fri, 21 Nov 2025 11:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763723835;
	bh=4DAkv37ea+2d/7BYgVUeJPDn9xhNgNPTUmdoIJAvKNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YuKux2y803kTOAJcF6X2LPMPlw3oOtE2QVU7UxPy8A8RkM1SyqxkdofM7e93VjNjb
	 37c2AcUJT9J+hyhSMJQ9d2FREgcdsKC9I9mlqCRT2XxTX9SDgj1uodXh8+9gciznCk
	 djtHadqgkkdy//S8rmr7wCe+deTIaxGw6izifKBGtam0AmlTt+9yDJMYV0PDFIJ0n+
	 woFJmXbPRRsVJNx1IUrtpas0HeuuOd6jUt5Hl8Ifif1dxV2p163zwF97S5DPMC79hH
	 sHb7l2Ei87LmE8YWsiXeZoYQTFgyVabVKxfJnUyXVPoDyK5/t9O4SiFCkTngtoap6w
	 5D9KdoCisehKw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:c4bf:9969:6e1c:dc69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3EDE717E3682;
	Fri, 21 Nov 2025 12:17:14 +0100 (CET)
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
	wenst@chromium.org,
	fshao@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v4 9/9] dt-bindings: nvmem: mediatek: efuse: Add support for MT8196
Date: Fri, 21 Nov 2025 12:16:42 +0100
Message-Id: <20251121-mt8196-lvts-v4-v4-9-357f955a3176@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
References: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_031718_025617_DFCD3FA9 
X-CRM114-Status: UNSURE (   8.34  )
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

