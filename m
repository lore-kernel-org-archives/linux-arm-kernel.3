Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C9BCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=; b=fLNhrVywjL7t9lPmqhgkat59bL
	v8ALnt7K4Jr+F2iHxmx1rYGET2H7F+qiZJPwmNQ8QdPp4/jqEl3rl1UYjymNHQQuxP1gusZ0gjfZK
	WHYcxqoggISFbsak+QhsNr0SWmG8I5871XJetZpYwssBMTn0y38THHahIBYPo84r7OLqimWsp72gr
	uZf4ITibc5purvv2QRYVutviny0wJayEzTbGy9n9bd/p78Inq1+3vTpCmMKKwI5HOa6hBQGa4/M6y
	1WfCSeCbq1u4skRPEg2uW0+bVOLO3NKrhMZjaQ0SfzEsAICxUY6YImf/BuwKMlXr/HKl9ljGgybDo
	Yyo8/HkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0U3-00000008CQG-3ys2;
	Tue, 09 Sep 2025 15:42:15 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvKx-00000006HfZ-41A9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45dec601cd3so9084405e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412750; x=1758017550; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
        b=gH34Ql+HDTkE5K9TQQkP90D9wyugC7W3fpg9DgjYgJngwMWy9P2M6f/mtXF6R45vMQ
         QRt++d0jogPlDcSFCgDsm1pWL67qr6p1KIDAc/2ddxi2X8k4KNn4x8vxHv9tuiV+NS1J
         6K3qSxYE+EtZNKEMMksez8O9HzpMID7dlsXDcv6YG73wyaSHm2Z0TCGJDwwNCdSrT0Jr
         6knqwfCcobudtXMSvidQRNgbFGygG32J2tU9fZhHGTLohhOkULok5ZyN/t+S9PafTaqQ
         CXjozc7KHc+uzaEGFcCDo95yoT4y97F/sPgSCGAjPTLoCBw09FzqF+EC5mrwnyfFQpzf
         du7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412750; x=1758017550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
        b=ny8otdEskguUt0pUTYiuKvmBXY5GyLK4d3ccIpUjCXsVEzX/oRkrQ3PP4gdKFSjkRC
         ivINZuMP2ejbebhR8ZWdR2Jn1ASGe7kQnCmZtXMCXMAF/HWgeyQ7qUsfLL57heKkhlgt
         kl/nZ2M3V0OF9gKivZ4mLwqAHXqTkU913hFCNXM+Okxg1ZOpfdBxiT/zu2oM5V6uuMuf
         zfrkVfG/1YiBzfbLlmIOQdWQE02jBsivCHAUKvlVIXbJyBvt+48QisgABp7cOnbdfaZs
         DWUGvqqkqZxKnEgWY/msDI8huGU374SpjGGhMjKmfRww8FyXHbDtBhnONv/sf9QdMOK8
         f9ow==
X-Forwarded-Encrypted: i=1; AJvYcCWVSzJodm4lT/1MS5MubAizh1JsCUtsqiowyvx3jz3dMA1enKqtMXVSek3bolSvBdRX7PiiuYKT3phIR5M3IbsP@lists.infradead.org
X-Gm-Message-State: AOJu0YxOAfIah1M30r12/sZbfqMh7v4lTLjT13OaHJpsvU5mwTcdPR7j
	U79K/C0fupQ8ldlyVGpZiCQScwlE2RHdlz5I2gkdbdwQDbUi1SmbV1MY
X-Gm-Gg: ASbGncvEGtOagDxmOtm+7VFFIWK0c8S2S2osyPC2KJzHKCpLYRtl8qXGD1eYB601CEL
	QikpEFjgdCrYCiu1oWkPDlKf+WIylaCXpRKW09MqdKV4ZRoZV/DFRLvYxzxYnHynq9BY6oX9LVg
	6n6aEwaSXVgllDsGgXwrW/y9i47bSFVaWHPLIj2Op9uoapFcalcfXiUzzTYNbxx3cIOEyUcwNBD
	9U+f6RU5m/yPXmT864MtEyrBVgjWhoBaWAe5bV6pp3ZMMmJqlFS9RmxyQTmL47hRNpMTE09DRTa
	ElQnOgqFyN3igeukbYM2pb+dOzJoV7oGwozivLiDbp9v9VYHgdLY5kCmoo9ko3pY+/E+sTnHQ9E
	llRgKWqmfzcE+Hre2IlLBxzzuaG0l1y6VEZZXgRWH4Oty+7yvQnGtO0m155a6erOxmISA+WI0CX
	bxNTlxpvt9lWi3REEq5AiJRFWFag==
X-Google-Smtp-Source: AGHT+IEtJ8wCuXdfIRpbS1GqIUUwZYEUFHZ7uVwR4/jyRcbOv5MLRiubr67nXFdjDm1kpxBCCCy3hA==
X-Received: by 2002:a05:600c:1ca8:b0:45d:e285:c4ec with SMTP id 5b1f17b1804b1-45de285c69bmr86525185e9.4.1757412750223;
        Tue, 09 Sep 2025 03:12:30 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8879cesm483992105e9.12.2025.09.09.03.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:29 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:14 +0200
Subject: [PATCH v6 07/20] dt-bindings: memory: factorise LPDDR channel
 binding into SDRAM channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-7-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_031232_099151_4AE1ED62 
X-CRM114-Status: GOOD (  14.99  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

LPDDR, DDR and so SDRAM channels exist and share the same properties, they
have a compatible, ranks, and an io-width.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 ...lpddr-channel.yaml => jedec,sdram-channel.yaml} | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
similarity index 83%
rename from Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml
rename to Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
index 34b5bd153f63..9892da520fe4 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
@@ -1,16 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,lpddr-channel.yaml#
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,sdram-channel.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: LPDDR channel with chip/rank topology description
+title: SDRAM channel with chip/rank topology description
 
 description:
-  An LPDDR channel is a completely independent set of LPDDR pins (DQ, CA, CS,
-  CK, etc.) that connect one or more LPDDR chips to a host system. The main
-  purpose of this node is to overall LPDDR topology of the system, including the
-  amount of individual LPDDR chips and the ranks per chip.
+  A memory channel of SDRAM memory like DDR SDRAM or LPDDR SDRAM is a completely
+  independent set of pins (DQ, CA, CS, CK, etc.) that connect one or more memory
+  chips to a host system. The main purpose of this node is to overall memory
+  topology of the system, including the amount of individual memory chips and
+  the ranks per chip.
 
 maintainers:
   - Julius Werner <jwerner@chromium.org>
@@ -26,14 +27,14 @@ properties:
   io-width:
     description:
       The number of DQ pins in the channel. If this number is different
-      from (a multiple of) the io-width of the LPDDR chip, that means that
+      from (a multiple of) the io-width of the SDRAM chip, that means that
       multiple instances of that type of chip are wired in parallel on this
       channel (with the channel's DQ pins split up between the different
       chips, and the CA, CS, etc. pins of the different chips all shorted
       together).  This means that the total physical memory controlled by a
       channel is equal to the sum of the densities of each rank on the
-      connected LPDDR chip, times the io-width of the channel divided by
-      the io-width of the LPDDR chip.
+      connected SDRAM chip, times the io-width of the channel divided by
+      the io-width of the SDRAM chip.
     enum:
       - 8
       - 16
@@ -51,8 +52,8 @@ patternProperties:
   "^rank@[0-9]+$":
     type: object
     description:
-      Each physical LPDDR chip may have one or more ranks. Ranks are
-      internal but fully independent sub-units of the chip. Each LPDDR bus
+      Each physical SDRAM chip may have one or more ranks. Ranks are
+      internal but fully independent sub-units of the chip. Each SDRAM bus
       transaction on the channel targets exactly one rank, based on the
       state of the CS pins. Different ranks may have different densities and
       timing requirements.

-- 
2.43.0


