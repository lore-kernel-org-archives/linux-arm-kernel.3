Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B892CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 20:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rqwwjElFE8r2tVuzO7w3VDnRiQGORrv7X2AdYrNZjA=; b=hUQVs9GAkyfXy0enNuEFPI3PDA
	rJ2swGkCKtdLWBroaLelvyLiD05aPvwBu+gMGLWZplfetDyvjiB7bettWkKdLxPo9VcwFDrSXdp94
	ZhL2fOvn2GE16iWTA3sC4KAYOU/KrJzaPBXHQ61pRaZ/rQuCsvWnGp2b36ZNAAokEuQ7CGVDTOiSq
	4JqufgBvKh3YGZQVOy3PhhRSmhtxccqNVdkN/AXKEN9XCyF9u/SwcB3S7s59dbpT2Qr7HchE4a7b8
	oens5Y+WWsMN7nPkf5tprkjEaR0cDORhc7MSdLD39Vv2cmFgKzgB7uTtmHtlInznB1R493xoiustN
	s06nJwgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMAaT-0000000BYIg-49Tj;
	Sun, 10 May 2026 20:17:17 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMAa4-0000000BYFA-2oHT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 20:17:13 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48e82c23840so1451145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 13:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778444211; x=1779049011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rqwwjElFE8r2tVuzO7w3VDnRiQGORrv7X2AdYrNZjA=;
        b=l2a2qPLBMLyi4lKrCKU6CgvMsJAPlb9Lr8PxbytFEzf0jDx4pb2grpdlpnwSlbt233
         dtC2ywfoTRTxQSMkxd3KbPfJHEaoFTqPfS+cOHU5Y4iWdiSkBN6x08CYwiTci39pD2DC
         l9/lkEStP/OTQ69LYEBzmhWwxAB4Yn3rdO4pnGSECUEKO50z0Sspv9ZAqHSp4s6VAHcq
         B6yYhseKa/vy0f202/U4OMMsBTzEqrF9hPrcatfd2yaaXKY36moXvFG9LO9It12peUNc
         MiqMMonYz9/Pe681Hm0yAEBs70nUMjh7YCMIbyj8zKYjzD79UkpCf6ECgFsdqQrhXnXt
         vyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778444211; x=1779049011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+rqwwjElFE8r2tVuzO7w3VDnRiQGORrv7X2AdYrNZjA=;
        b=X69gV27xjMeI4uu7bb66F8yn5ETCR6DRDwRNnC0hB+HnDvZs+vIZH67AZCJq22XLVd
         9GjYSM8qq1V/EEyBoKPt3QuDDgIMO4LLqtPnDuckeFW8SX1M8sTOI9XFhzMsqHi04yZQ
         ghuuyQb7bIX4UZvOSCF00oAZmlTNfv8QtKYzTTLzautK+sPcGKYPioI16mhokDkGmKsr
         SH4tw/cR45+3GGcLcP48/JDTM4nJxTuSt9yrlk2M9n8CSEmykUpI5d3+JbijIbsZXOWA
         1XU4BoMU1+53MqsuTIIpHUeBY+rfVB4w6CTw2BwsSqMQFm2OyCzRG1od2BLnCWLVrnD1
         xZsw==
X-Forwarded-Encrypted: i=1; AFNElJ8CVyvYDGDzMrK5PcSRRoxYGVpblmGNVRHUS0ujGqJXXIhBdptRJTqH2bPgdj/KFC3+FMDL627QiJ7bKv9rt5XF@lists.infradead.org
X-Gm-Message-State: AOJu0YzNFeg+Ucb0AUMEYQiv974ksFHXvOojiE4s9k6/zppZCfP2uQea
	zZspvBl9yggwk0zjW9qHl2uqgECGdEsjMgrU6v1b7SH78hUNzuNYa3xp
X-Gm-Gg: Acq92OHWbK5P2KwOcYIabUu49OfL40KfFNlfwVYwp6ZKC30X9gqaT1i9vxETG5EJOgj
	qh5A3rMY43B4Mw92baVUuODpRtfv2EcurSe4nxvX2Rimdvp2ZI0I2/k8s8YiEPlzU+kTTfKvGEY
	HHTcnFpV6ZCmYAAxbCFEfUo9M9EaS2Dh4XICZVV7ONNA4vNV+hOlGwSOVL5Tl+CrbASTdnaBW5+
	wQpZXKEF6wVuGweL2XQX/ogZinrxCmpoxD/SR8TPGTHG5dK9JQ+z5b522bzSDoihm+Vx6HKIRp4
	50r90FtW4K3VWbOSwR385AnSMSLgxiPdQnIMbji2wx+fKETyVhup6uVafy9yf2R309PO6Bcaavj
	aFVK5nLR4tR64iQv/Ghk6chMeIv4uymlt2FXVaTCoHdaKBy0bAHg0n/5m68Mfbbg9KXT8eBviyL
	4727I08gyvl8AroNvGFBXLHr2PoJLvz5IuSq0oPpKtdRWeJaFUEojl
X-Received: by 2002:a05:600c:3548:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-48e51e0a6a2mr320516385e9.4.1778444210848;
        Sun, 10 May 2026 13:16:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7040a8f1sm127667145e9.11.2026.05.10.13.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 13:16:50 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
Date: Sun, 10 May 2026 22:16:39 +0200
Message-ID: <20260510201644.4143710-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_131652_752639_897FB8CD 
X-CRM114-Status: GOOD (  10.82  )
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

Baijie HelperBoard A133 is a development board around their A133 Core
board. Introduce a compatible for both the Core and the development
boards.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---

Changelog:
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board

 Documentation/devicetree/bindings/arm/sunxi.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..d7b9dec81165 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -96,6 +96,17 @@ properties:
           - const: allwinner,ba10-tvbox
           - const: allwinner,sun4i-a10
 
+      - description: Baijie Helper A133
+        items:
+          - const: baijie,helper-a133
+          - const: baijie,helper-a133-core
+          - const: allwinner,sun50i-a100
+
+      - description: HelperBoardA133 Core
+        items:
+          - const: baijie,helper-a133-core
+          - const: allwinner,sun50i-a100
+
       - description: BananaPi
         items:
           - const: lemaker,bananapi
-- 
2.54.0


