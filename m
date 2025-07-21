Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C71FC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 08:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5RTku7TFErU+Ht/NIT3PAL/cIoZFCkvx0+siU4EvMU=; b=DV4FHsLO2vQHfLCyjdTn7Hgkk6
	36U4UeSUXO2eyIiQrC8RK5ybqDMMdNeZAcnW46G902Ywf2Ig83BmEmDwwdsABuQmBH5PVQCqS33n5
	52zG23+dJYj2f0wtfGEIij8k83vUGHDBAwEu/El/xgKkCfXrUqy8a+kPLPNMK80K23zEMYwkaT5Ty
	R5NMeLOm73LJTLktWAC6U0KQBiG8uIIEwp01nJkGB05ggi0+3zjWfxuHvvfAagb+Ch86KvZZTyfiR
	NP3tJPIg2BWIacd3b1BY1SS3ylf4/2lhMwim+y7/Sy6gB/cmVCH0xyVEHVu8nGrs8Xt0DgT+RvPZD
	zlU6TlHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udm4z-0000000GgyS-40W2;
	Mon, 21 Jul 2025 08:41:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlhG-0000000Gc16-1CdK;
	Mon, 21 Jul 2025 08:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753085789;
	bh=w6sh/7u7ae2yAWUxtx6cgY5xdFm6qlPDPDfS1bNNr9M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ql7Vz9tszCFPv6ICq2j2HeW8YhQ/rWQg6eDqXi6u7jqFFvlqtK/7npwqHaIRVlnuj
	 prYaHEZJLTboETdYQi8j7Eytttphl6P7XOejOqmeTIt6aw25Gx3VS0bquszf+t9WW3
	 zlkrtwibyy5o6UWzpqv8U6nMbUX+AyefKPaDKW43jy4V1NPNGGkfnMyOu2Zf0w3lEa
	 /F8stPxdhySbNajuAuyBZeSd7OFZDSw+j15gjB5LFVVWH9pcrP28yxh2FHflPcU0qz
	 HAia5o6fHpw97g5vihxJ2T7+VShqH0WPKUXCQid2yuFDJmRBBHz04Wm9lc36ltaHtx
	 gZzDnVV4or+iA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:4487:69c6:40a:81be])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA0B917E0F66;
	Mon, 21 Jul 2025 10:16:27 +0200 (CEST)
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
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH 9/9] dt-bindings: nvmem: mediatek: efuse: Add support for MT8196
Date: Mon, 21 Jul 2025 10:14:59 +0200
Message-Id: <20250721081459.16278-10-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250721081459.16278-1-laura.nao@collabora.com>
References: <20250721081459.16278-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_011630_470074_82D36F9F 
X-CRM114-Status: UNSURE (   7.82  )
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

Add compatible for MT8196 SoC.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 32b8c1eb4e80..e209a1132a26 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -37,6 +37,7 @@ properties:
               - mediatek,mt8188-efuse
               - mediatek,mt8192-efuse
               - mediatek,mt8195-efuse
+              - mediatek,mt8196-efuse
               - mediatek,mt8516-efuse
           - const: mediatek,efuse
       - const: mediatek,mt8173-efuse
-- 
2.39.5


