Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3232FC44506
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 19:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aX2RnisGLr4E8o5po1MDvWbrusnd1W84soVanA/bOJY=; b=UuvXhRnLf9WIiKkkAJGSbJaO4W
	fRD+xLXb3s1hOzFKqdhvPIWqKONguKnp3+UNOOv2zRprZnktMLG5PjHB8v4pkVEBY9tzteaQEL86U
	02VFSwYZlnL4QT1zYKZJUSG//geSY2Ogq0XhOrn7nPYzot1QAuWmDRBoXZ8dW5vRcl+ogvSQwf1BG
	hWGzMry6czbHIpf68TS8i4FMyO3HpXlBeaxx/cR8bsAWFwnACOGjyyQfg37xLYL9UHvJaZ8WRB0df
	gdHsuZ+tcRvr8KH4S2mhCrPCApNS5bJSb4qaNB2C1/p5EPFiXJVJi5uTUzMIPfxQDx+LudXUTM5yj
	VHkahY3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1widNl-00000006o3y-3h6X;
	Sat, 11 Jul 2026 19:29:01 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1widNf-00000006nzN-340E;
	Sat, 11 Jul 2026 19:28:58 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D71117A00FF;
	Sat, 11 Jul 2026 15:28:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 11 Jul 2026 15:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1783798134; x=
	1783884534; bh=aX2RnisGLr4E8o5po1MDvWbrusnd1W84soVanA/bOJY=; b=V
	xj7jxrA68pMEZQS/nrdj6ixSTdxR39PPHFZcTBEgcs3wQMn4M1MRFqROemEJ/Djr
	Oyuy7yD4J1koJ4qDaP8awcdFErOZ0cRgLmz1+Bsd2OnEwzRx3cXT3h4g4WzM/70q
	VvWiao+8/yE5dXEFF7Fwo44/CapcGTpCdYv9gk4CZ8llanljmuhB8qrmzPAbErZa
	mDCvzAexy3Dco6fYP+oR4X0BLrRgAYa/eV7yrrwQPAZdq0jgVK+vxbRxUta+kcKT
	UMYU1cGePlk0o/lX5kABj9sfxHKMMu5PELE35sulnWeBOtCrMmVxNPt73P8TA76B
	IukLpEZTQA6b0CfPnC4ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1783798134; x=1783884534; bh=a
	X2RnisGLr4E8o5po1MDvWbrusnd1W84soVanA/bOJY=; b=CkKFC1uTJiRZ5De/2
	gGQbJ9veGg+/s+3thriIwhNy42PY0AN9GtYHDdsgZm8R48ivGyxJGa3qgafsWmWy
	Cxg+ydAMYeFuOWqhLA+pzMxLkeO90aEHkRCeZyxEZl4LXuO6q80SzsFWY0i6Fo7k
	+vFtSyrT/5AJugs+up+3yybV7qc+s8h/jBIV7DixiFwVElnNV9suaoZfLNa8Trs8
	9ciEIel7KGV1D844rP1knnJOZ1JV4KW0MJSXB7zyMKN900EALXua1YDLwtaXt7lT
	fIwg+RGfCvFoe+T1YoWgMnL7854gi2TlykVchJsJC4UAwTGzM40sCGi9yYJUwIoW
	xTfxQ==
X-ME-Sender: <xms:dplSaiK1eaQc_MLHqtf8kaEoV8HsZgcSZGxrVjH5vMCqnHEUMVTOqA>
    <xme:dplSagpLVD1YKbjxQmzme0tbUdELScBOudnRS8VWJ-Gqeh562QUL79jCdtZEFuCXe
    RBvA07KcKkHnHMBRjlR5B4asSQNcR92tyQbDGzTLJwBd5_CBn0sqA>
X-ME-Received: <xmr:dplSagv6cEps1stkWy8-ZQ-2_iokHRe5Dr8bS7iN2yQRKPI6nzMso9lBNM44bLSscZ6S73zQtIJ0AjaDNVwM4uHPX1syv94NITIz_SnPiRJ-bAuIqiE>
X-ME-Proxy-Cause: dmFkZTEepNtIgoM1Fyk7GBGw4gbWyEgW9yAi38A4eO2Ck62KjI7ty8TSEaBFWZPUUJh1GJ
    nAzRXvy7afFiqmvvk6ftLKBtaqsODmPKwz5QvNVIqgGT0HeIi0mEvtLmMDW+9YXxWgw8+o
    oXCy2H91fxLVFsCUCqZYrJkVfQpyqtobi5FF8rZmnUuvbsLtUDdFkWgnb5YobqY8eJYnQI
    f/hck29y/TLcFpj9sZBoi5tSSWpZsL29DU/L3Azo1pXGNMPTEoNOog7Q1KA4IguljVS538
    G+HygWMF+jZcX2RkqjixM3gA6QTWG2eM7QhOEWAkBEcAAEt31NpmlBrlHYLV7LDSfLCDR5
    3nu4W1A9NUrS8EcSxP3bN11DhXdVbkwDERCWEqGpwiXJzLzJQ+DB9japMhLDoSW86xSb4S
    b2FvELtenVBnSax79yDQTPaY89IEGVI31byxELy1DJwBakqBiKm6wk3rmgJvNJ+2NbVnJJ
    7zZCNFVdMOl3O97EO65W/6zfL8hPf19pPf0rCAeOX+NG8ve0hafa+N2n0jZwaSd1GoegDA
    Q9K1c6wiRjjmHSC6cD6FEIPWH47NfbAw/wCM7E7f4VX5Se6efKn4G5opCYTP9r0HW5tWUO
    AgIU+UsI63UuYG7XY+mHu1HFkePiS2gXO+haM5NtDl5IaydFbE6YYmXN6b7g
X-ME-Proxy: <xmx:dplSaqKkjkwmwhWhChmvIh8KvkjFoSUwRmSB7m8k7y9kLUm3ETdA-A>
    <xmx:dplSavqH63vAJCDggmGp3PXxA0mBwINX9pSztEY66STm1Zwzh_8GHg>
    <xmx:dplSatV0sSPARW4pP1HEkGb9f3IRrBda7N_-cWeeTsIJ8bxiIBbvDQ>
    <xmx:dplSak1qWdPQcv3IfOI2Z0bi5VqCRDJXKZwt7slM-vEXnacz7QMSeQ>
    <xmx:dplSaqPvImcqBAD9mV7pbO3cI-r8BB4BtAxyADXu-AZ8j3EKczPPWeiD>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Jul 2026 15:28:53 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 3/4] dt-bindings: arm: rockchip: Add LincStation E1
Date: Sat, 11 Jul 2026 14:28:27 -0500
Message-ID: <20260711192842.845048-4-samuel@sholland.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260711192842.845048-1-samuel@sholland.org>
References: <20260711192842.845048-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_122855_833747_25F886C8 
X-CRM114-Status: UNSURE (   8.89  )
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

LincStation E1 is an entry-level NAS device powered by the RK3568B2 SoC
with two 3.5" HDD slots and two m.2 2280 slots for SSDs. It is marketed
under the LincPlus[1] brand, but the OEM appears to be Techvision
Intelligent Technology Co., Ltd[2]. The OEM model number is TVD8322R,
which is referenced by the vendor devicetree, a sticker on the board,
and a design patent (CN309443154S) matching the system chassis.

Link: https://www.lincplustech.com/products/lincstation-e1-network-attached-storage.html [1]
Link: https://cn.techvision.com.cn [2]
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..ca2e4327ac3f 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -779,6 +779,11 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: LincPlus LincStation E1
+        items:
+          - const: techvision,tvd8322r
+          - const: rockchip,rk3568
+
       - description: LinkEase EasePi R1
         items:
           - const: linkease,easepi-r1
-- 
2.54.0


