Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC9BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 22:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIQYg38HKX2hWoFak3/raun5oGJ1Q4Ta/HKT5+91FRc=; b=CgbtE1CbsidMuJNZVrkohoYZpk
	1cu8WZpylDuNPF+YhSD7CZxnngcoNLqVsLTRahBuvbsmYwSnU1buMH/jXuUGCfYgmAUGLrHr3LuCu
	YuF8C2wzgHPJkg5q0zhPbkV7t1XZw03uyB0DWBAkU4PZYaQ5wZGLtAdkTPv+0mmeS6GYCoTO6Xq33
	jKwb9C/qf1SeScV1/oezmmKaSjzhQfpYZ4iM+cb6BHfgxBlxT6WMrM4076SDGskBb2grIrEiA6JYh
	vUnBn7a5Bw9TLo6Zt1qnIMUTzhW585F4MJ6UNP9EU01sd8S7ZZBkhg0wXxYc8Am7Y3jFQ5D4Gki94
	CKyoVn7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdbzN-0000000CoYS-2eR7;
	Sat, 27 Jun 2026 22:59:07 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdbzJ-0000000CoWw-06rM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 22:59:03 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-37fb434c547so571723a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 15:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782601140; x=1783205940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIQYg38HKX2hWoFak3/raun5oGJ1Q4Ta/HKT5+91FRc=;
        b=G/PjBG/YjrNPNMbYtJVABgBuilsa31X9fEC2Yx0xTJdtA2R81btJcw6o9x7Fc6lhvP
         laDMoufC3YLylBZfDN3zmB9yiKFBMq/B/EYFOQNtGfbA8nwvzwkJnd+LEBF+o1XxsDeV
         8aFB7W2YbCjU7qgWeTPwvaKwSgg0yJZaaecZj+vS7S26bVGcoi1byJWvJxydnhtuje+6
         P8IT2UX/4ETCfPvbdM5/+2nmn0GRQL5CbM1l2zx1KNHa5v4B1YzLsXmxoexsxXDDOgqQ
         8ifQbw6bEa6XWAZJNyS0M7fJ23ec7glHpHh8NqBlEu1928LFMbhrAlMjkI2WWAWgIh9o
         +Swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782601140; x=1783205940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xIQYg38HKX2hWoFak3/raun5oGJ1Q4Ta/HKT5+91FRc=;
        b=qSM7XzW8lIqSUt7kXU3mD+jU+V6X9FvV6cs26ySD5YWJTvQGdfYNkOOia+w15Vak+i
         3ZhDSGSYZSnkvYzm8hOOhwyTUuEQang6OQMmeuA5cALV0MucomCzpdapa1HSEk74DsTP
         1R6aLy1+I/KEZXYnCWX+M89D1QLZiHJqhwEJPs0HGBgnr8CJkIzWe0UY/CN3H9uH3F2m
         9ni/4atKv2cr0B/rAH9Mn68AtlSVbbiPC39rNbxtH9MqRl46H/yKWx14TkW2ywI0a7NO
         gw07VRidbIYdmNJDk6SgGq+yiO1A/228zZnIYCVDnefxl+i/6XrAQBdEXmFjoq4gdRA2
         Wp0A==
X-Forwarded-Encrypted: i=1; AHgh+Rr07ONFB7icZzU76gXCNX+dyFTYq1Ng3fVoEbT83hyyd7RtvFbM4i+k9hHBHjYQ8a9pdFn31gS86JfdpLGJ4pDF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy+jy4BJySvd7ijzVQvRYaCqFAwPqUFtVhJ0x0Px1WzHoddmDb
	5/UvC+SREDMnpvuGBrUfIQzaq+5ZLhTMImLTHiGi/5LKYOdD6HSZ4Y4U
X-Gm-Gg: AfdE7cma3kieofgR7UFcGzBBgrn0uPrjZTZwDuudYOIfDfwVW7I8o1WJpxko6C8OZ4s
	TZPtUeHKXxMhE8BaM4xDBreTCuwQHT7nNUcDX3LmloB6jSyOZuZFY1YwO/jF9ysLoCyVPrXEuq+
	DfeQtQFZe7kmxZ7fd0gLgzTSTIiMI6ZkJTFpy9dPLkVl/DONtMHfzZhEVSArVzSJzK0gE8FK0RE
	8m3Tq4Cu+ouRfPzhm3V/JvtctyBrgVU41NVWoFeqathYAx7dp9aj1Q1cFwiNcJZgVpCsYMndGss
	b0VyaF4kr8ocHc/oXaeWTwhHEt/7GOhgo/RaYYuoqkJJS4z70pQtkvQ7F4wo91lyglQKcNm4bXP
	RBGdeYufCmFtmkLRxkx99Xz1GdecMRUXkFKDstShM285cUyf2pCL1wH1O2v1RsKLJKtcNOCRgPa
	rLhe//n/hGYDc=
X-Received: by 2002:a17:90b:17c2:b0:36d:633a:e7e5 with SMTP id 98e67ed59e1d1-37df9f3821dmr11072345a91.3.1782601140142;
        Sat, 27 Jun 2026 15:59:00 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3b0ee6esm6313693a91.6.2026.06.27.15.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 15:58:59 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH 2/3] dt-bindings: arm: rockchip: Add Graperain G3568 series
Date: Sun, 28 Jun 2026 06:57:56 +0800
Message-ID: <20260627225755.1710837-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260627225755.1710837-2-coiaprant@gmail.com>
References: <20260627225755.1710837-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_155901_574807_7B243BE5 
X-CRM114-Status: GOOD (  10.38  )
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

This documents Graperain G3568 v2 which is a development board based on RK3568 SoC.

This series also have an SBC series with the suffix "box".

This board is development board series, not SBC series.

Link: https://www.graperain.cn/RK3568/RK3568-Development/ (China)
Link: https://www.graperain.com/ARM-Embedded-RK3568-Development-Board/ (Global)
Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6daddec9e400458816dd4c57ba807fc3.pdf

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde186..873d41bff 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -683,6 +683,12 @@ properties:
           - const: google,veyron-tiger
           - const: google,veyron
           - const: rockchip,rk3288
+      
+      - description: Graperain G3568 series board
+        items:
+          - enum:
+              - graperain,g3568-v2
+          - const: rockchip,rk3568
 
       - description: H96 Max V58 TV Box
         items:
-- 
2.47.3


