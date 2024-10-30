Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9F7D5CC9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJGzqHo9qrTCAAwlf27yjT302x4NzmzPRcOQ+gtBk24=; b=bjCKHlH5vdNt/ernmObhWhwsHG
	twntXpykJqo00w4jIJwJg4ZqJgUx59Z9dwPaXrW8k//AXYHH5FtXAkuLvMbmv7sHkfWVadaldQBP+
	lGJBVhnwt5YTQ5/OKGN6BjjvQkPQAyAhkNCpONHDonQzLJRD36blPopapUK0D+B8uTZIYqgxMETNH
	hKqWXeHNHPgF37ZvhW+HQDHysIxieExYnETM74TiRd8UF6Uu7S35MUwf/e53SA/vbW8teYsjS3SBu
	RULj+Q+Uo0+RbVqzbXPFb0oincQkVV1S89Mh33DNEttpwJZSoFPkBMdHtlDItOhM5qyGHy9nlKJwG
	ZhWfzC0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66oe-000000007dU-07yM;
	Wed, 30 Oct 2024 11:24:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66ST-000000003hD-0IA8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:01:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4315eac969aso4810965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286107; x=1730890907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJGzqHo9qrTCAAwlf27yjT302x4NzmzPRcOQ+gtBk24=;
        b=BFf3X/RF6VQR31rrBbO9pKs2GMPAEDKjmd4HfqvR4178zRQQf9mGIdu9gOhzUKJfv7
         Gzt2osv4tdqOJrqawkfLfcl8ULqPYa8gdg3BNvk+3QLRvIgZY7Ex7dJ9F6qHZjMsBSr0
         kSockfzbACRXO7fS0xufX5668X2x1AtVRL6gTxeeTKjMNu98n9z+/f08T/P8a2cj9Ury
         zQRXZr5NDkebMmGKBu/K0g3ucONqomOS0ctQ1Hd4coUTDcxX+wmNNdDxTV+pGGVJHjBa
         xrSKqFSk8R1OBCsKFnDH9afH2mTMp5S6h+xmgB/Mcp1SdTkd9GC3SHKH/hw0Mb8RgzVw
         9lCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286107; x=1730890907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJGzqHo9qrTCAAwlf27yjT302x4NzmzPRcOQ+gtBk24=;
        b=E3Wgd8jFa0eqRJfXy1mELHcbTe+FIxRBnnvwfvjc/ovHhE+eiysslt8IqMgyyhQ7fe
         VRPRnHldlpDmvA6f8KlJ3otrfgNx8kGsV+W3hfRNsotv16g6xpxqsVW4iUYQ45RH/LEs
         COeiyZFW8+lOgcjdxif6WJuOPJw6Nz3XhOzmAtkHdv63+NuPwNByVQBSCjrD3ysJ9D/7
         QTQhUJPU79DLOMpfkZE5XGvOs10XXwwx8u1IomayR3ztWCV6BvgfPpYY4Bvo9gayOTGO
         N4KVTY5DGcOnC7ALztmOSN3pDCwUb1dA1KXqXSo8P+tyoCHOeKzx1oHd0zathsATxzCL
         EhrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMJswVOEE56V4xfLd4l646jzjS8Ex8/0/nc4ueLUm7Aco879owemS5m1nz9Ec4H9JBhiF5qPFIgA0XAdsFvsPy@lists.infradead.org
X-Gm-Message-State: AOJu0YzSIwqb9zz2ETGN9CzHg4RbK8FA02rHSdO4ELp2wjvZrhJXC4v1
	s/khLHBAgkN3jRmzCd0ljzrT/TF3WCZocYS9k1votWTAqEmDeLIkUp7Q6ben+Bw=
X-Google-Smtp-Source: AGHT+IE5VulypisySsncZjnqUpvTj2AV1Yc80jON0brb1Iv05v/0FIWD5VcuOaypPQ/AlZFz+rbyng==
X-Received: by 2002:a05:600c:5253:b0:431:55f3:d34e with SMTP id 5b1f17b1804b1-431b5739d3amr42501345e9.15.1730286107092;
        Wed, 30 Oct 2024 04:01:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:46 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 06/10] arm64: dts: renesas: r9a08g045: Add VBATTB node
Date: Wed, 30 Oct 2024 13:01:16 +0200
Message-Id: <20241030110120.332802-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_040149_138166_8873ACE2 
X-CRM114-Status: GOOD (  12.63  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the DT node for the VBATTB IP along with DT bindings for the clock
it provides.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- dropped the status = "disabled"; for the vbattb-xtal node

Changes in v4:
- used clock-controller for the vbattb node name
- move the node near scif0 for ordering
- set the vbattb_xtal status as disabled to avoid having it exported
  in linux with frequency = 0 in boards that don't use it
- collected tags

Changes in v3:
- dropped the child nodes of vbattb; along with this dropped ranges,
  interrupt-names, #address-cells, #size-cells
- added vbattb_xtal as input clock for vbattb

Changes in v2:
- update compatibles
- updated clocks and clock-names for clock-controller node
- removed the power domain from the clock-controller as this is
  controlled by parent node in v2

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 067a26a66c24..a1d5084b074a 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -72,6 +72,18 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		vbattb: clock-controller@1005c000 {
+			compatible = "renesas,r9a08g045-vbattb";
+			reg = <0 0x1005c000 0 0x1000>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
+			clock-names = "bclk", "rtx";
+			#clock-cells = <1>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_VBAT_BRESETN>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@10090000 {
 			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
 			reg = <0 0x10090000 0 0x400>;
@@ -425,4 +437,11 @@ timer {
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
 				  "hyp-virt";
 	};
+
+	vbattb_xtal: vbattb-xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
 };
-- 
2.39.2


