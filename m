Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD95C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEoinIILiTKHyRPgP5StMa4pYa/MZMpin1k/LVPTO6Q=; b=AqLOinIbkIwUIyyKSg9bYN4Lno
	6xJu8MNkz/d/M9Ss1lo885EcKcIDVf2zNsNFbeSDw63GHwhZ1Ftmqvx+KU3H4ECghDDF2YMoelk+s
	4YdMkj3t7vWWxXlygrawq5n7hx5gZAv+6QCKAeAtPwRc2NJVWP+84cDQN8UTP2Y7GnSPPi7mcwPss
	PihYJ+SVf5oKZJ3kOS8o8zrQj4t7Olu2/xTsqApbwiS05sPJDKnp8sS8zgrQMB4KcFx9xo9vrYHbZ
	q8i7fGOwf9pMUqGs6GxDsxO3iaWhETcz8XDAlmfcikFN3nYQmSxAc5WqJ1lN2wQmMl1J2ZHBG7V/g
	1ObzVZ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNCZ-00000005NAA-3VmX;
	Thu, 02 Jul 2026 19:35:59 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNCW-00000005N6y-2W75
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:35:58 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-c888c2cff98so920194a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 12:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783020956; x=1783625756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEoinIILiTKHyRPgP5StMa4pYa/MZMpin1k/LVPTO6Q=;
        b=nxG8IVWHkJgNB58GIzhlhuns6Iut/qf2BHMRcFdy1tdzssnZBlNo1YFL1736YsJAHi
         LgrJeQCCE0PHRS0BXDX7FcKCeNBuExvyYlw643XHm8bPfpo/W2a3qp7AGvmsRxYsEwOk
         cGURR0kXjmjURrGjXnUe5fw5BJxpbT0BF3YDgFlvH1Bj7vTtJzvBqKHaZD9IJ6leEPOO
         sJJDR+mm2j0qrXEKgFnSqKIvwO2o3keJzSE77AyRh1REWBAbB10QJw43Q0Z1tb4xOlWc
         0eWDK9IsuxnPpJ+TKxM2vgEfWHZ16EdaroItP6d9dSgOFpDPMZlL5ie82nR2P2w4VLmS
         cjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783020956; x=1783625756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEoinIILiTKHyRPgP5StMa4pYa/MZMpin1k/LVPTO6Q=;
        b=mvmYe6cEYukL8xVpyouiKsXFmJMIQ6VfF7eRhqf71+k6Qy3mj4Z/8O3C0aR1etRNhw
         6WsGtBIQpyL+KGHxsqVv/RjUBr5psaPslJSkaeaXHukIkv6BR2r4P2wGoVOIl9PlAGWi
         n0wRFOgGqC3QlhKZip37pE56lpJrvqevrXnLU2tVQWIF0Y+srroaWmbuRL5QSUd2hw33
         M7tN99ZqOlkF0bG95W3OPMdm6Y1BkvvlN+QscQL2/jr62Jhk031X9Fsdi3tD1DaGUe3u
         yQiy5xQtTdS0t/pfqmb4KsndtBhONWyN3GRIYgXm0iN+WDT4eGMR0tYf5r+YHkfbN0x6
         vU/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqbIla76cQyas3SOrj5wx2nEL14Ev7t9pTEOZ75/+Wib7IuTTY6DbwfrWvpBYeidwA4B7iKW/CfPVGBGvyGDc25@lists.infradead.org
X-Gm-Message-State: AOJu0YxLsoqUvP+qBIPYSQI+ksX0Qr2esFMzI/YRYD/g3wrpeEgVC14+
	69prLZwu1WR2/2yJN04LBI24wGl5hSXiIHnG/xYRKDddBYHmobmX130d
X-Gm-Gg: AfdE7ck9+GHqKbt1f5hl8JgFTbZnx58gB/vFwYxDfa46NOi8E9Jee+SwU+j3Tq7CN3H
	Y6NiCBBRl8Na1m2ThEJ/QFgG7hmLnaod3jzvT4hNq0FkqJEB3/izCRyDetD0kyq6iaVrS1e9uvQ
	eFebhgH24saKk5NtB4krjqlzM4sa45pWO4hsIuWD6s4DCB7WnSFlje9JLraYEWlm6XNDNXHrkWz
	mtuD0PCkkRlUdvU1X4tmGh4aePgjDtXy4hZJTWdL8PX1SXPTKj39ad/PhYMvyFeHuiWHqdEj5ub
	EDg7Ye/eAy3rvarVBEVCxdsvLfNbxat3Ad78WOZvXZ1sTZsdcn7F0ob7Sy+S5ec6kB3OMd9O+0j
	reBhqfAiXqbaK41DP03hCp660LcmdtOJushnVj2ET7q4TeazRPVrcdtFpMKe8HLE+T2Lo9rguTF
	b11CLa6669xS8=
X-Received: by 2002:a05:6a00:414f:b0:847:927d:47a8 with SMTP id d2e1a72fcca58-847c50163e9mr6426374b3a.18.1783020955950;
        Thu, 02 Jul 2026 12:35:55 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dc188sm1844249b3a.4.2026.07.02.12.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 12:35:55 -0700 (PDT)
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
	Coia Prant <coiaprant@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: rockchip: Add Graperain G3568 series
Date: Fri,  3 Jul 2026 03:35:37 +0800
Message-ID: <20260702193538.2195973-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702193538.2195973-1-coiaprant@gmail.com>
References: <20260702193538.2195973-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_123556_797910_56CAB5AA 
X-CRM114-Status: GOOD (  10.03  )
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

Document the Graperain G3568 v2, which is a development board based on
the Rockchip RK3568 SoC.

Graperain G3568 series also have an SBC series with the suffix "box".

Graperain G3568 v2 belongs to development board series, not SBC series.

Link: https://www.graperain.cn/RK3568/RK3568-Development/ (China)
Link: https://www.graperain.com/ARM-Embedded-RK3568-Development-Board/ (Global)
Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6daddec9e400458816dd4c57ba807fc3.pdf

Signed-off-by: Coia Prant <coiaprant@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d0..9eb2f66ba3856 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -684,6 +684,12 @@ properties:
           - const: google,veyron
           - const: rockchip,rk3288
 
+      - description: Graperain G3568 series board
+        items:
+          - enum:
+              - graperain,g3568-v2
+          - const: rockchip,rk3568
+
       - description: H96 Max V58 TV Box
         items:
           - const: haochuangyi,h96-max-v58
-- 
2.47.3


