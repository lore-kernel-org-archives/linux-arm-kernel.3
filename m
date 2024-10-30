Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1016D5CC96
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zIqqwXla8XXFQks2xCDUhtmqZI6NDOV+FlaKIa//Ps=; b=D0HQyfIScl5qeRfpsYE+sEolTB
	ROMd9nONfLNWPh5AoaZjTZhoHbF+9RLiYKKZLk5Jzl2RZC+z5wi9QsXS6wJWmfhrJf5Wu8eFW5sDm
	KK9B/eRSV+bqc1SctKq0idcHvtLAqnD/RXrtvNz32HuNfnq6OJR7o64FTpbpTZAs0kkWpCUPJ54+C
	2hNHL9dEzTibFX4xSPrUHWp7gVNWPH0UcyR+gioMmgvXdSupczwS5IaHFZ2+aRbnhut9mYd9mod9w
	rOMK6ya6CRSJ6sXqdY6sgRyrfd8nZYTPmk441ZapGkIyBlvg4GKmG3yI1ay95yAHKFlZOU4i1P7mP
	CNF/XqYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66jp-000000006lz-1hYI;
	Wed, 30 Oct 2024 11:19:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66SM-000000003fU-0xaf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:01:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so62177505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286100; x=1730890900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zIqqwXla8XXFQks2xCDUhtmqZI6NDOV+FlaKIa//Ps=;
        b=L7lxAIxrd9A99J1lV9jemlFAadF32zyuRmAuNAmhd4kRApE8bg11f70rQnfhjTaELJ
         McfbmY7aO1v/aFk1nQZhNYABtCxVu0hDL6zgcpEiYTiy03b+X8moW6wcTiEYUq41ISf7
         CaDatC+SESQ5s3/9bJ3CfbvffhoI5K3iD32kLDslinItC2kvpZIX2v4GF7gyn2qniFNt
         cyT1VUJE3MMaAh1GZMLAhvhJqoTkYGVFW/zHpugnZip4CT/9BP4dBD+6sCjzPOcKUEqW
         ZfJK4AnRGPMc7Y80mwh6X2CK9ZvR4N8Vwe6ZyRYgflXj5m+db3d76aQsn13JkZeCcjhL
         xJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286100; x=1730890900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zIqqwXla8XXFQks2xCDUhtmqZI6NDOV+FlaKIa//Ps=;
        b=Alv+gxIhT0kBdmA+U6yGNkwLztx3sbNoKdt88xg/V6yid3fkYf3Ov4qiFXYtArpjg6
         LIeVVB/AaYq8szYRJDwFLYLs5eLxCHAYeElJj04UiCE4HqupYO4/zyNpO81KXLu3JnD0
         rU0HSycrRUmlUgOs2un5GsM3Jom5ja8MAhaRszYJU2HnQgZO4wQBdg4Sr5ZHsxSOzfS8
         0mWj92f0hp4ISexa7+ddUZ9aaxI/1Q7V4kwn25mOd2/OkWqG/go8hrJWfrcQw34TBzJv
         CmhVU+xa8axvYquv2VBd3nzcswjygoXEiqTXSLxBRjt4ubO3Y7y7d6skZLzHZV9VVDuo
         93vA==
X-Forwarded-Encrypted: i=1; AJvYcCXBblPDPy+MpbF4Ci8bWoe0YlkDRRahR3q4eONcaN0OWDfW/c7K2j3ZUw5xn+kgDk6RfE4pubCWoMKi2i6mXc6m@lists.infradead.org
X-Gm-Message-State: AOJu0YwdJ3JoJHpY1+RgISkdzMhW+eFuvjNGLPIg2jvejwEk8wsT6LYM
	HZu2VskKbml6YeSnYDmfuYlQU3KH+5RfMqJqmDGvKqsGU0f/kfTsDq4vIIpeegE=
X-Google-Smtp-Source: AGHT+IEzFYp8eHXbfgCK6D2romhGEawaY5yFHitwbM0KqZrPl9MhxCwPdoh5AirYsRT0AM+eT9M2fw==
X-Received: by 2002:a05:600c:3b16:b0:431:58bc:ad5e with SMTP id 5b1f17b1804b1-4319ad0b8a9mr120556035e9.28.1730286100253;
        Wed, 30 Oct 2024 04:01:40 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:39 -0700 (PDT)
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
Subject: [PATCH v5 02/10] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
Date: Wed, 30 Oct 2024 13:01:12 +0200
Message-Id: <20241030110120.332802-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_040142_293647_468C6C87 
X-CRM114-Status: GOOD (  11.47  )
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

Add devm_clk_hw_register_gate_parent_hw() macro to allow registering
devres managed gate clocks providing struct clk_hw object as parent.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- collected tags

Changes in v3:
- none; this patch is new

 include/linux/clk-provider.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 75444e250a78..a49859ef3304 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -622,6 +622,24 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
 	__devm_clk_hw_register_gate((dev), NULL, (name), (parent_name), NULL, \
 			       NULL, (flags), (reg), (bit_idx),		      \
 			       (clk_gate_flags), (lock))
+/**
+ * devm_clk_hw_register_gate_parent_hw - register a gate clock with the clock
+ * framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags for this clock
+ * @reg: register address to control gating of this clock
+ * @bit_idx: which bit in the register controls gating of this clock
+ * @clk_gate_flags: gate-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_gate_parent_hw(dev, name, parent_hw, flags,      \
+					    reg, bit_idx, clk_gate_flags,     \
+					    lock)			      \
+	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, (parent_hw),   \
+				    NULL, (flags), (reg), (bit_idx),	      \
+				    (clk_gate_flags), (lock))
 /**
  * devm_clk_hw_register_gate_parent_data - register a gate clock with the
  * clock framework
-- 
2.39.2


