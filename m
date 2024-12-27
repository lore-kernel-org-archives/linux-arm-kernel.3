Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14775E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQ0brnuopVNUKDJwJH0/VSRDFgILtmVRCbF+TM2fmxQ=; b=mQFOBtd/zm3MjVgKw8bI7Vq/iK
	79Gc4B1YfVK1qL3oKCwFLH7OfsNx0882yWFbY/u4kel7pG6sHrLlouEIPQuhOr16TgSvkpjMw0Td7
	13tJjeA0DYXu1PP3qmglKFhFhv7ftuPkTJ33MF+wPhL77kUlx/SeJCKHBYSNtlkoaB6uSALxpj7OJ
	GQ9R0gabzxjF7uNQL09QQ8+q6PQLUe1YF/n8s9qG9MzbTzcXleTJr3awXRJw2320o1zIk7Wv+4xPO
	s78KHy+ezLS1mTF1UJeWE6Q3J0QhkZCbxSxxfC3uxi6ufTahWyKUV4Ym8OJ8/0vD4YgGOvQi8GJXo
	UmgR1qrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRA8I-00000000FYB-07F3;
	Fri, 27 Dec 2024 13:12:02 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9yf-00000000DNu-0sDJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 13:02:07 +0000
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id QmX6tCKuRvH7lR9yetJj5M; Fri, 27 Dec 2024 13:02:05 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R9ybt7ojdlDL5R9ydtTWJH; Fri, 27 Dec 2024 13:02:04 +0000
X-Authority-Analysis: v=2.4 cv=LLtgQoW9 c=1 sm=1 tr=0 ts=676ea54c
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=wzO6rqTgGfghY9OkdcwA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tQ0brnuopVNUKDJwJH0/VSRDFgILtmVRCbF+TM2fmxQ=; b=Yzi1ziXfJy8NL8AebiULmP7Ils
	K/4BYc0CWzvLLrM9lheBvesS+BPX6v96fudiSI12J94Tt4kTdMitRwBFJKdp7huOOndtYMzTO85P7
	3Rl7IX3hilPz1ycdx2AT4a4+yB1mGNaS8Kr/Z/Se7LTKA6JNIxMrbIkzDETpBz6Sir/fQNgcNfWMZ
	uO2wGayElu4Ox0VbeIU0zNr5JrjDqESMKPEKqdjPH3YmCOSzHPRF2DSqL++DjkXDW67mHnPT92CxU
	UJT5Bb+v9rwyt8UzVCCg9KQPhIJHtTWqLR+gb1xDQwPdbRJvwsKc3DJYjsoRsGnTAem1Aw1zUpblA
	os5S+V8A==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR9yX-002EaQ-24;
	Fri, 27 Dec 2024 18:31:57 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 18:30:57 +0530
Subject: [PATCH RESEND 08/22] dt-bindings: arm: sunxi: document Szbaijie
 A133 helper board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-8-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304469; l=1029;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=jEGKbLhjRFmr2GAicFc1z+s3hUCh595jXAXzn9My3y0=;
 b=qYvrnOVWt4oHHLK8nYnervSC9ncB1eBiBn0gsifoaS6OCJ3yH0CyQnoxhFjNqN1chhmeIFcKP
 15WL92YNfCGDGsIqnj2CjgFF4NvJeP5HsxzVvk4W5wtbGjcA+ivZxRW
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR9yX-002EaQ-24
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 261
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPvDb4N6SXwMDXIXk1jc1PfkZjhXvv1x6q8ptdHpGS19FidIRSx+hgOQMxnxLZ+/MYh9QuWFTHVAetz+xboCWtzMDhw5xAqvF3P/jZSdNk7fX4J88yiq
 rTComHrUT/uEPpk3XzNVLYxNQYY1go8AHfMCQt9TsZUItHSjf2lytrTL0lWzl/ZnIuhDem9mZSpo8FWWr3ptZj7nMy3srzy/HGp9VEd/Ss8md9z2+OOSCotb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_050205_290273_4E77EFAF 
X-CRM114-Status: UNSURE (   5.16  )
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

Szbaijie Baijie Technology A133 helper board is an evaluation
board of their A133-Core SoM. Add its compatible (with the
SoM compatible) to the sunxi board DT binding file.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 046536d02706..eb19f8b1fe68 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -891,6 +891,12 @@ properties:
           - const: allwinner,sl631
           - const: allwinner,sun8i-v3
 
+      - description: Szbaijie A133 Helper board
+        items:
+          - const: szbaijie,helper-a133
+          - const: szbaijie,helper-a133-core
+          - const: allwinner,sun50i-a133
+
       - description: Tanix TX1
         items:
           - const: oranth,tanix-tx1

-- 
2.39.5


