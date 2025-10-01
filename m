Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D492ACCA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 14:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKLAYC4j9KDlgpKElsaQCZMFHUJovZT20hAAdQtCFec=; b=qinu49RJbom/ppvFRI+nQzuD0s
	eGNkeL7qFTbGQJwcmXK/Kl/O9DRmiZATgTDa56gqEPxhiXBgdnr43Lio2U0CS4Akt+zUjXZH/1yVY
	sw2CHgAuJI3iU4W1IJib2sGQjRjrNjPLpIg/OHxcgFgqMJVeby6bfadIg0aGXOoVlEunhvhVsobBQ
	OLFvClrmWQIqzYIKdwxCO7R7SvQHl4YtLD1quOtnQaPQYIyJtPDx9ps4l9YbDK8FfOHMdCe8Dax2m
	+25r72JVfW8LYIrnBI95lXlIz2iXfjxICNPXUaRC+S6NyhITkSunyzB3CzJhc1jiyYXMj3kUSaws0
	x3/tYLew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xvM-00000008CCc-2n9l;
	Wed, 01 Oct 2025 14:35:20 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xvK-00000008CBQ-0OR5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 14:35:19 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b3d5088259eso615515866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759329316; x=1759934116; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKLAYC4j9KDlgpKElsaQCZMFHUJovZT20hAAdQtCFec=;
        b=AVxMK0xcZeBdOEs8nATEnK3zBrUvFlWF6AFAdyyyfBaGjvVCAhxMB1ZgxQoehS+iHR
         YPdc1IHzstMOEJ9fPKDOgWy+Y63qFx0W7sUPeRa2D0AG0RhW8G2mzuJKP9p8yAbPS6NA
         f7boIxN5mUKgfbBk765wpaTcG4u6WRLSf/tL34iE7uC7zPedGkPXlip7Abqm5DCWX9i5
         zCVoRtnX9O01rSQrlObrPfFeCbGfgmesg5RhwXlLrYeNr5KbQtiN8Y3Ot/TWp9puDcjj
         RjXo6U5dEmFjrY1BDByYajzYXc9wy/4+fOzIKhRinYxDlXMP0YP0NQKYFeOCP2W1RCbb
         vaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759329316; x=1759934116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKLAYC4j9KDlgpKElsaQCZMFHUJovZT20hAAdQtCFec=;
        b=AYviRA4J4QF5g7GdvgpJqMqWDxcrnyCzSIP0SxrkdrAVHO6aBqSMGaXf2RY/vJq5DB
         yCw0VXCT4/V6oEE9TLdWRUEqFSTDI97RwOYVdXhyyWEzOaSz5hDRWCqHDxcD8hIWS+Dl
         uULb7G391alYFCdG7k890YsR1PhioIQX0IVBOPm63nzqKDY5409uiOjdcEiDo00Os72t
         cvkqLtGJQIH7ruhqFwzaciFr6eqgKEptc2OHXLs/JJGKBU5LLeDlzvrTvZKi2ScZtrnd
         hafGcJoGUajn4Wi72QqFHkQ5ELthOvIzM79DKMNOtn/BCxvlhmzuGRncYcoZQfgLCfwS
         FV2Q==
X-Gm-Message-State: AOJu0Yz/UPlcJxlrJNe9Qy1SCLR1q9f4zBejKYJmbQ6Vq0S7NeWNkYVp
	Ecgb7RGPAJexVFBGa6N9k0VLXhmFpOCVG2KVIykzad0GvQvy3dv3G4qlHCz+eleKpZYH6PrX3c2
	Ix3FwJCQ=
X-Gm-Gg: ASbGnct3GpCK9JRkcUYVcXb2lBEPRL650sVG6O9MvocH3kM+Eqdeg+nsvlRWDq15bD+
	82STWnn17kfUbPeAysVBUDFNLqiDrfXywPicOQTzoc2giL7y2zCJdtEM8CeTTUPjJDcOIzBiJG3
	tNrUukjU8wRO98T2DLT+CSu3+9HxqSOlYKKE5nNzcycaih/JvtYc+prGmpls6oCyDvbnOLHvORC
	fpywk+x6QVhF/KxmnURpoxCpWNxq8NRd8AwJqTjrE+ebrTLnomAk9+kqd94R0xTcFgwPGtfvdSm
	IWBWPJuyekQ1AMgatorylGN0jn5oBf+9V9qcOfUA/gXA9l1pKofCH1sj1FPX1yEFyQPwFRFOLfV
	mFwBW7exBdB+9bES9NOSav+5MWzJaI2Zwzp6159IEzmbT
X-Google-Smtp-Source: AGHT+IEYEURijCwuhDP0G34PhcYmv4fOEgcLLFjlM+TFZMLirjS7EIEOqa9JbLLvv3rtWABWVxPKzA==
X-Received: by 2002:a17:907:96a2:b0:b3b:9931:3aaf with SMTP id a640c23a62f3a-b46e22419f7mr453073866b.28.1759329315788;
        Wed, 01 Oct 2025 07:35:15 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-634ce748d4dsm8879086a12.29.2025.10.01.07.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:35:14 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Wed, 01 Oct 2025 16:34:13 +0200
Subject: [PATCH v3 1/6] arm64: dts: ti: k3-am62: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-topic-am62-dt-partialio-v6-15-v3-1-7095fe263ece@baylibre.com>
References: <20251001-topic-am62-dt-partialio-v6-15-v3-0-7095fe263ece@baylibre.com>
In-Reply-To: <20251001-topic-am62-dt-partialio-v6-15-v3-0-7095fe263ece@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217; i=msp@baylibre.com;
 h=from:subject:message-id; bh=CD8jS3mi5l0ptE5mloshmhyPStp+3Ujo5r6yvkMZV70=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhoy71l/2FPTNi1pzafNt2ZnqfP9lZyevVxbz2VLwpvu62
 bJwVWP2jlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZhIgQHDP81V6QbP/35ulzAs
 UC8/t8rzW8fzmy/9Z7mue8o8/fbyBQsYGW4vDF3BIZfN7cMXpZMqFc8Sanm0pWLW9lrRZX8mcoR
 p8gIA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_073518_153418_9B19FBFC 
X-CRM114-Status: GOOD (  10.23  )
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

Add the system states that are available on TI AM62 SoCs.

Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62.dtsi b/arch/arm64/boot/dts/ti/k3-am62.dtsi
index 59f6dff552ed40e4ac0f9c7077aa25d68d3b5283..b08b7062060ca12ecae83917a831ee779f1a288f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62.dtsi
@@ -46,6 +46,28 @@ pmu: pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	system-idle-states {
+		system_partial_io: system-partial-io {
+			compatible = "system-idle-state";
+			idle-state-name = "off-wake";
+		};
+
+		system_deep_sleep: system-deep-sleep {
+			compatible = "system-idle-state";
+			idle-state-name = "mem";
+		};
+
+		system_mcu_only: system-mcu-only {
+			compatible = "system-idle-state";
+			idle-state-name = "mem-mcu-active";
+		};
+
+		system_standby: system-standby {
+			compatible = "system-idle-state";
+			idle-state-name = "standby";
+		};
+	};
+
 	cbass_main: bus@f0000 {
 		bootph-all;
 		compatible = "simple-bus";

-- 
2.51.0


