Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2612CFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 03:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLWnGZIr20U/8NXRxTbpdrnOVEAiLhYCZ2NPvdWXNF8=; b=n741vxDqZfnNXjQ9QBHasBbrU4
	mvEH++SDVkVZYe/VGt2rXtR9AoVHTbYQRcfb9X6QS4DWz51o9j2ltJvFs9uIz1rVPa3Ctod0IV1tY
	MQ3zK/lPGTiEoUo1/4rB91z+rAeNDYjzcVApRjeFFISHthf/OB8IrINdR0hOG29N/GdH6Qm7o4TLA
	EM3CvAcAUWPejrJeEj945dW41zyGTGzh1uqzRsKDMHsKBH3DL7RLRw8kqhR5J1lUntaGfPy1p3krB
	K+rK1y5/nc+b7OH6djhBXvdAjmXF/WqRT+Bp+ptVDmMWZuNXT/s4jsRGfnBm5p/Wc26DODbL4Ba1T
	HYYhmFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCu1-0000000G75m-2PWo;
	Mon, 27 Apr 2026 03:44:57 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHCtu-0000000G70e-1brp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 03:44:51 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35fc2b18363so10472315a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 20:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261489; x=1777866289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLWnGZIr20U/8NXRxTbpdrnOVEAiLhYCZ2NPvdWXNF8=;
        b=KDAijN4UbJVbUC5rgO2u5e3cspPex5d2MBPSr00Owq7wO9BnkCuTRc4GDnpP4i5FQH
         5MtV0O3PHwryn4z4R4ZfhN9lXl4TMt4GV/EC3ps3IzuU6rFNoCiiH4HyponGBxTkRYE5
         CPFtPK1NNyJnU7aVje3vK6/dSj4P9bX6So7BIdV9mupBcKNu60NAXgUDnvhpKSQcjdH/
         BdRXBVqai3AvT/E13Ckfw2cDNvDM8oTba9wuO7fKeQzGb0h7taakwJvF+Mq1rydVzsmq
         GvRHtiQxBiw98Db685+q5ATfMIf5G9l9xzNU640fYYGAm1N01jP2jdtQkI9sSBdPOLvB
         oQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261489; x=1777866289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KLWnGZIr20U/8NXRxTbpdrnOVEAiLhYCZ2NPvdWXNF8=;
        b=rX85+vbKxq9ruGXjT6arbNbujJ5vwH2nDk/QT1XjRZXh9ZkWAmLzds5bHjDBfALfDl
         pBKwTXhlLkI5JuOOsRbawOlnwBC9LIrYW9aCO2p4KBWVPdn79Elec6BTyo6RoRIga5Ag
         a8cRtMYWCN3l/t+IWK512/hYeDBMr0erWErV5OuSK+/cJ5mmfrvh0X+7GWUyO+FMS26h
         /w4Wnwai/3edH+GB054OHIy51Rqf8WRyv2MAGYlI+1xEUxvyEGC9XCVwmtDzT+evVbHY
         UZ8Svlv6os/oGNqjMqkdCzc6VmZUCnppkx0a7mkOorQJz29kAn8egxXDaSOe3u5g2q7V
         FDhg==
X-Forwarded-Encrypted: i=1; AFNElJ9Tyby8XdX96row8QeP3wwU+235nXD9x68qfFhWUaRbOoQ0+HrBpRnC40OMZrsV9PPnNTa47Egjkt4SLiJaeLuI@lists.infradead.org
X-Gm-Message-State: AOJu0YxRYmtFp8R8GsW7SB8hmNtFRPwu7l1J0yTM4qbLmWs81gXlI3Q+
	8Da2tDIHGvLpbAXjMD0IkI6TyF0Qphr1JOuPXTaNlXwsDnsMxxGGCa+0
X-Gm-Gg: AeBDieuQTv9uT5pwVypMyMgMIQ7OmkVIDqtEXXvVNhVxBff08sSDLuSY37KNeOpP3fq
	Ip/mWwQA2neOinR1Qb208AkQ8ipfs8QFzSjLzSKRJpeIKB5sV1mKACuG89K+cXICwC857N9Z/Z6
	/MyK/op/uZ43OLejslk2b9mT6PkbdoDpXbp/2JJQQYFOuFt5jjxup3OGiQuugxBAHIZyeNwuXGW
	Iq6R/CYKprXJFaCwuybHakHQr1Bs7yWWggomKxwLt4GpHBUQ5zt7A1BR4yMk7LDuZUPbhZVtA7N
	Ynv6QdXFrlc4XDMVjDHY7J+pgDw/oTWMM+a9cWKkT52uzR6JkXqjSeOsspRYMSqOcWcWjn0weFD
	m3mxFKXuaGSeOzkqWw50YQwa88gzUfdSvNwRJGCqCe79d3q8t8VC729B98Al0+OD4nupxcVgA/E
	1eXLdACGkrdHk1S+n9HOIG5/eLI+wwc8IW0lMKFuie12K4fBQUx6I/2Xvd4Jp8CRXtqdIBzcSUN
	8uZbxvKv7HzBT7tMmRgV3zKpw==
X-Received: by 2002:a17:903:37c3:b0:2b7:aba0:ac10 with SMTP id d9443c01a7336-2b7aba0aea6mr161097325ad.11.1777261489333;
        Sun, 26 Apr 2026 20:44:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm290610585ad.36.2026.04.26.20.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:44:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-wireless@vger.kernel.org (open list:MEDIATEK MT76 WIRELESS LAN DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mips@vger.kernel.org (open list:MIPS)
Subject: [PATCH 2/3] dt-bindings: net: wireless: mt76: remove mediatek,mtd-eeprom
Date: Sun, 26 Apr 2026 20:44:26 -0700
Message-ID: <20260427034427.881389-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427034427.881389-1-rosenp@gmail.com>
References: <20260427034427.881389-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_204450_418688_B64C6893 
X-CRM114-Status: GOOD (  11.15  )
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

mediatek,mtd-eeprom is a widely unused binding that predates and has
been replaced by NVMEM. As there are no users, remove it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../bindings/net/wireless/mediatek,mt76.yaml  | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index ae6b97cdc44b..482c22cd6627 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -87,21 +87,6 @@ properties:
     description:
       EEPROM data embedded as array.
 
-  mediatek,mtd-eeprom:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      - items:
-          - description: phandle to MTD partition
-          - description: offset containing EEPROM data
-    description:
-      Phandle to a MTD partition + offset containing EEPROM data
-    deprecated: true
-
-  big-endian:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Specify if the radio eeprom partition is written in big-endian
-
   mediatek,eeprom-merge-otp:
     type: boolean
     description:
@@ -314,8 +299,8 @@ examples:
         compatible = "mediatek,mt76";
         reg = <0x0000 0 0 0 0>;
         ieee80211-freq-limit = <5000000 6000000>;
-        mediatek,mtd-eeprom = <&factory 0x8000>;
-        big-endian;
+        nvmem-cells = <&eeprom>;
+        nvmem-cell-names = "eeprom";
 
         led {
           led-sources = <2>;
-- 
2.54.0


