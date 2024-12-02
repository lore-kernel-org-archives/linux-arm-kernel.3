Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E21D4979F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 06:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vDhO31tk1fZx5nO1D34ac67vgcEF+XlfAfCpGqdW5mI=; b=SiwTCtwsRxsei4lQ5eIfNY1Dcu
	t7Ptf+6BRH2DaKw70xGVX7+WZOuMNRt7gia9IRvn17Z6Of5Ipxc3OdmK5iI70tBbfuxGDa+Pzykjm
	vZXw3b+2NU1EQ3ZJuMA4QVjmRPpDca+niRvpNEL8drInsxPF13nfSXaRfCIjofDrrbyfA06xQ7KRK
	n5oThQHFK5YMnz398yyrRmHct6ZVdWbhRBPhHwx8jQ+C6XK5wZK5ArPzZi324Y0gghZBa+Fm+hr/z
	QeSzUXM8fN4gYru0eXOa/u1ctMc6yi0VLP2kyDQHxXby4fqH1YiIwyfE6179sjLlD9XH2dBiWqxsa
	iyn8Mx9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHzgl-00000005Av1-0fya;
	Mon, 02 Dec 2024 06:13:43 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHyVZ-000000055J1-1znT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 04:58:06 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3ea60f074c3so2039752b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 20:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733115484; x=1733720284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vDhO31tk1fZx5nO1D34ac67vgcEF+XlfAfCpGqdW5mI=;
        b=TlPtTGEl4sG+pE543nnNo/KUiB+x1pQEOcuw+ErzmuEMtwwkhv1sJd0teeoL3v9sjZ
         Uj8OjLObdDsXnw+1fpUkEtTnsAY8dkM10szwzVHwUKqhWXWRmBYa4qGLFfawfWcVuNxg
         8EQiT8O+G4zMICT8qA3Q0fINK4ZziHwwlRwd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733115484; x=1733720284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDhO31tk1fZx5nO1D34ac67vgcEF+XlfAfCpGqdW5mI=;
        b=lD3yLVGkGHWmHl+JHi8DwMXAWvc8LrKbypdnJHHGqgZ0MeaV3FkeT7cjqKluDfhK33
         +h3X8IlZH/hgI5j8U59jlLrnXWU+xaqbTCNAUZNDNx900jvIXmS9u18yyPbmpkoBvliC
         ViLXuEeuKsQ8b3em3Hx6rqC7R4JqXUOriRhjnDwWUtgPyD44J8a6GcCXOgGwNGvdrCc3
         0mGVex/lWd6nhrHpQ4Gn3qB+ca7ClWFxxs6qggAK9+hhNCKdur73q/bBMcNFHhaylKpR
         o+PVCR01V/CyeBiYWimnQzgUoXrouhtoohtDxeW0MwzHnUxv1WSudrn0pSfjZPD12CxQ
         gnhA==
X-Forwarded-Encrypted: i=1; AJvYcCXiVvOsGfGfPEUiyWnLuc77Lu61PJmc+o3g/5ALa0aFQEU5sKQvEkKzcqFYzHitETTPm0ZsYblb+VwQcLUgFBVv@lists.infradead.org
X-Gm-Message-State: AOJu0YxY8TwEbPebXqhDUl+oZFrBIsdsoLfR27Tti+CkkYf71nbzjNY7
	LIfpaGf+9YwNqZJ8tElt2x095zOMmYF0JevsX0tINe2ujfdoFfZWjhTyjLCarA==
X-Gm-Gg: ASbGnctiBFvlWV1PNKRDYu9eCUeCwuWKlxsIpP055rZIyIi1UXW+f/XDAQg5z4UgxbF
	TyJz0vJPrZMrKnvrPhYWcROW4kIPNOmpLj3IbsdulFOdRkoW/weLZcs36Y7iqQFX7hiVfQfw34S
	W+k/pF2EY44t8L0Stiv4htEGc6gMW6cDKYzIQRROQG/RMVw2giIsjMfhdvMtcHsmut8u56uGY1L
	5frMMBDTo94X8Ue2ktd4RyOttFRK3G4XiRrvxFy2+hffIk668Oe4v/GQACug8YPARj7
X-Google-Smtp-Source: AGHT+IFb+ZRLH+3t3GZ+Wqs0KteaVy0F6ImlvlAlGAnh/Pchain6QOhSaXFDzaByBXFgCM7QNb8V/Q==
X-Received: by 2002:a05:6808:2018:b0:3e6:3860:596b with SMTP id 5614622812f47-3ea6db6410dmr21148963b6e.8.1733115484363;
        Sun, 01 Dec 2024 20:58:04 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:94c8:21f5:4a03:8964])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5be4sm6970599a12.3.2024.12.01.20.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 20:58:03 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	stable@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: fsl: cpm_qe: Limit matching to nodes with "fsl,qe"
Date: Mon,  2 Dec 2024 12:57:55 +0800
Message-ID: <20241202045757.39244-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_205805_546337_10D9D658 
X-CRM114-Status: UNSURE (   9.45  )
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

Otherwise the binding matches against random nodes with "simple-bus"
giving out all kinds of invalid warnings:

    $ make CHECK_DTBS=y mediatek/mt8188-evb.dtb
      SYNC    include/config/auto.conf.cmd
      UPD     include/config/kernel.release
      SCHEMA  Documentation/devicetree/bindings/processed-schema.json
      DTC [C] arch/arm64/boot/dts/mediatek/mt8188-evb.dtb
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: compatible:0: 'fsl,qe' was expected
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: compatible: ['simple-bus'] is too short
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controller@c000000:compatible:0: 'fsl,qe-ic' was expected
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controller@c000000:reg: [[0, 201326592, 0, 262144], [0, 201588736, 0, 2097152]] is too long
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controller@c000000:#interrupt-cells:0:0: 1 was expected
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controller@c000000: '#redistributor-regions', 'ppi-partitions' do not match any of the regexes: 'pinctrl-[0-9]+'
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: 'reg' is a required property
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: 'bus-frequency' is a required property
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#

Fixes: ecbfc6ff94a2 ("dt-bindings: soc: fsl: cpm_qe: convert to yaml format")
Cc: Frank Li <Frank.Li@nxp.com>
Cc: <stable@vger.kernel.org> # v6.11+
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
index 89cdf5e1d0a8..9e07a2c4d05b 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
@@ -21,6 +21,14 @@ description: |
   The description below applies to the qe of MPC8360 and
   more nodes and properties would be extended in the future.
 
+select:
+  properties:
+    compatible:
+      contains:
+        const: fsl,qe
+  required:
+    - compatible
+
 properties:
   compatible:
     items:
-- 
2.47.0.338.g60cca15819-goog


