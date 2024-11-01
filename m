Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F10E68948
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 10:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewtg0K16I6vEI9VCro/VP2IXg7P8FX0BQ2vY0LS22pU=; b=LHdCm9iIbEU1J3sS1K2968oiHS
	1vwRnr1G7g+oEw6A38Zh+j8VoBxFonJvlFieP3TmLuOmRh+muXsU92yQeKMElOAuee4ijMssUFE63
	IFAtkOZSvjh0qGRtCrf7lsrjYMlQXJcbGcWmafIkdeE0A2nDGs+XNXvoPPDwRDtoAAmkVMwTXy1Br
	9FaLlFyJfo8Me9Yg+F3j0RvVvn5dmnYrKfJOY43jasT8J/AkXJQM3etzjJupjsDBVZ2vwHoxYET+o
	35xKoSo/z4GtKFVajc52ZKSoOmfFwXxCjNt3LM1OtFL6yxVPsENJxk7Oif4nK/7Lgg1JxlAf6wXEd
	G8H+mIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oUV-00000006Ubw-3vfU;
	Fri, 01 Nov 2024 10:02:51 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oPW-00000006TKy-3iUi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 09:57:44 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5c9150f9ed4so2448995a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455061; x=1731059861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewtg0K16I6vEI9VCro/VP2IXg7P8FX0BQ2vY0LS22pU=;
        b=RRhrFKN4dEkGCC88v5Zbt1ov/EgXytZbJ2xUpXvKZ6YaeTUVy9jhRdjbrIF/+lO/US
         QU9dSikW9D6yZJqy81Ueq0yOvz0ZR/MTnh6fZVMXLoWDCBhqd8u8Zn+g1o95BT9Fd7de
         FcppMGcMY7OcLsJHukmZ0O05W/dosxzYLoQBT7HAndTfZhjzE7cw+8tUwVYhyqrhHZa0
         JUoOTxXKGHj6U8HDkb7oic1zOS3EN8I0PKdTjBa/f+6QOwIiQkyVeQWBN41W0IRgqNXv
         4DMb9SVr2ZGC+NQ5MBCghC+qqIShjPT1a2gtGfiIWM/lgpRMuMSroi3vKentgn7+jPXw
         zfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455061; x=1731059861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ewtg0K16I6vEI9VCro/VP2IXg7P8FX0BQ2vY0LS22pU=;
        b=THkE58Bdwu3Go00A1rbTp1tz2Fxe9l9rwGmVPFONmyQ6hket2AMgBSFEhF6vgrS7BE
         FFCDb9S4R3riRv/KOzlHZYs5cQ/fep/UefcZEoJA1UvZzZEpS3ybLpdp4qaF3o2U1RK0
         HGtRjdfUytNUvxp46UmiLTP6RX94rcboRApsitu1/xp390rTyH/QmRg9xPiMCxE5C0NP
         StFIvKA0ajh9w0tcQAOP5t2SaoGFpQP83lzA9l55IlQFJCRYFgcYeDq/0/0EqYg4/Nvh
         07iZ6fg1bG5WGG8HrEA3Dq/dLaiACWRy4R3J1tgwljIGExOrD42GkYjOxLxS3LdHy6AR
         zHxA==
X-Forwarded-Encrypted: i=1; AJvYcCVMuU/qwBAPmjGBLELRqIWEj7vWdqCYt/L/B3Vlaz7mKaXP7a/1zVuayNL9VYgqcUFcQrYnne1TZiWMnVroH5yf@lists.infradead.org
X-Gm-Message-State: AOJu0YygFqGmDrPQt5BiQAlIBbbRTsdNJGp3P/mU3GTyhOzblTX21TCE
	+hvwCQt6znjszWT+R8VaotCNeO4Uar5FWYb4gA+427peAwcc80mW/s5oc89Y3nk=
X-Google-Smtp-Source: AGHT+IEFGiN/u4W5r9i6MtaqopU2l9fL1FFrDwTz4s8iqC4tcmgZL2qm6/VdNeHlxydCj5OuRaUwEA==
X-Received: by 2002:a05:6402:350c:b0:5cb:69bb:ba8e with SMTP id 4fb4d7f45d1cf-5cbbfa78a8fmr13489266a12.34.1730455061093;
        Fri, 01 Nov 2024 02:57:41 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:40 -0700 (PDT)
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
Subject: [PATCH v6 2/9] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
Date: Fri,  1 Nov 2024 11:57:13 +0200
Message-Id: <20241101095720.2247815-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_025742_954090_C0E683F8 
X-CRM114-Status: GOOD (  12.15  )
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
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- collected tags

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


