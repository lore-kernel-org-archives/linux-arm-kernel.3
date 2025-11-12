Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D3DCD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xtn1agn38vYYRSDmrX8xmfCfXiGeMgWG3lL/9kBn0bY=; b=1Z9ibZZWSxIf3ahFec6lO6eWDP
	R8rtRg24TKOksV745OGYAlxhzMSAN9nKMv7QgRTE23gg2Yx6sbkEVUHAHga3nZsME36sSIxESuQDF
	cjrJV5Ayu1zPaxczJ7SXCAC4T5VGI16elM7Y8ZHrhZPmL6DKTRhjg6PW0EfnjpnIDo/IYYwm0hBm8
	PZIctzL4gph+w1xTWJ8rfRuE0XY1Joxm4RJX14laom17LMNXYZhqb8y6vy2NkUc5/BcmejnMACm4J
	SQjbLBphkLhzSIk9mVXw5J1+DoiEHnyVc+2pHUqJA+8ZmBnCApiAK9XeJC1dL5yAxmegeL6NQ0XfX
	XAB5uqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ86C-00000008Yx8-2KiP;
	Wed, 12 Nov 2025 10:29:12 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ868-00000008Ytk-2J5j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:09 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b2a64d425so83819f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943347; x=1763548147; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xtn1agn38vYYRSDmrX8xmfCfXiGeMgWG3lL/9kBn0bY=;
        b=bSfYg+Q9N7Yk3yQ7HEL8ITBAdEssrBPqTumvbvBQ+5dLx9v/6V0ffvVtCpW/emO172
         7KPcYwqQf9QOJ/ProiueJHnARX+DGH1cxRz7neI45WTNbMfEsc+jzLEDlqWFMjQfUnVI
         F01WGuQjbWwlSuwnEXtyxTLMyRpwdPV453a8yLhUlzG9QsmLUnXKZ+8Z4e2YKuMf+8yw
         ujU/Hje09QnGFdInDV45kzlWEjJx0edvOuG9pSjtEZXoA1SLWSy5di/JL2QABwGZQ3RU
         Hasvm+3rmxSchAVjDWD8assZpaEFt//K/o2F/yWpcwHPswtolAOwKla46kyEuUwgD22V
         W5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943347; x=1763548147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xtn1agn38vYYRSDmrX8xmfCfXiGeMgWG3lL/9kBn0bY=;
        b=AR68x+0K+xF4r6R4/wTgvP+gnYGA7TEMD8mJDnI7Alp+xfmGFfQobQROOuIPz8Ivtr
         8cvCFM0nX3Q+nsa+T3q9ktgTtFzNBJGTUJpPCqk7OqG9hGrfdAeNyqFIdXJihciHowSJ
         4tkc674X9hqk4P9Zdnuf1O6/56UhUSG2DeSUTu0oEF1E8q+mByLPQXsQRUpfAIeRStUc
         VoUNVU8Wmny7j+iJx3GIFwtGcZrHWgcTqMs3wW2D6Tz+OijttdvybQRVL005B1mmxi4v
         5Q9uFieVocpW7HWI4E+vieF6BBWe7eNMey8b9tgRla1X9Ysso9EOyN/26K28BuLaU14D
         z3iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiHlRu0RUdWMjE1SUrrA5Jh+kqL+gdGfBd30e+Loks0SeXDvUKTs44VnbJeTeN7uP+wCVhQKRRbDtBcycmWwRE@lists.infradead.org
X-Gm-Message-State: AOJu0YxkFQax7dc4TpuiLiFOaUnPT8ZcBw2APN/UacCrBnK2xL0Z2+m7
	/F9eGlwU4kzJmWtnLwj/8Na20XGurocRs2Raxb3r1SAP6bS9gj4nIa3N0CpsXQ6sHCw=
X-Gm-Gg: ASbGncsQcY1R7KCVXclL6m9mLCoynaX/ZkpCkJx/0G4G54IuZ7MAbsbvpXwUqsCWoQq
	ruW5zQYfF+9WPSiSxHDssyuvlKs64xfvLIiwBYezBkaSCjxiD+cvMbguWif+KDoIZydw2oK3ztx
	qxgI2Vu57Nc/PWZBUdcvPwlu9Cr0rOCtO6/y61y+a9anUrXaN9EbHzzsowsyfmQ6Rayo/3TA7Lu
	uBoJ0TekGoFsdh08ldZOaUFv0mB5ur+o/n8h5mXeZ0krwQkjXj5gZZMaS+MplBNjAyBh6O281zm
	e6wPny9zCW2LdxrUq3/06t/dDAE6RMcRCq+ajzb+Zp7+RkPPCd1LPvI3susRtQIOXy1fDAi21HR
	7M+OXfhVHsWlkNPHijBkl02BsW5K59LktTtRJ45g6Z+zcOM7/z9uARMt4CJvWXm1Ld/361c5Qeb
	dQMqhvn4AqgXwzlNHQ
X-Google-Smtp-Source: AGHT+IEqw4rhZRyDy+yPmdGyXuh1FmIzLY034EYTwmwGfWZRi5DR0a/TjWaTQc0ZSjDYk6R/6C4iqQ==
X-Received: by 2002:a05:6000:2087:b0:42b:2da3:ac30 with SMTP id ffacd0b85a97d-42b4bb875c4mr1198295f8f.2.1762943346620;
        Wed, 12 Nov 2025 02:29:06 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:46 +0100
Subject: [PATCH v2 01/11] of: Add wrappers to match root node with OF
 device ID tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3774;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=97pN+hZe6aOdQXzqXH/jzMv6/WG6YtpXykn+P6/wWxo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFkNYeOuoYzpykLoG20VsmMhHx83ITlx4eh3
 nQhR2/+8c+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhZAAKCRDBN2bmhouD
 1+WoD/0TKoeUAmx+UOxM0JybjWAMODukmdMBn6gauxFIVRlljF/oKwZMabgzYrNN21aWkVxl2Gx
 YzAxkQ/qwOh0Kdg86awylIZT+BceJmpZHLGj/zlXD7z1Kp2Ib/Kvukk1qf78AAs+4CkVn6XLbMm
 SfzvNCXZAFS/Wmwt570i9P1qKzGcXPrFmD4MBRBDKcQbzpnZXtKtATET5wD1DdrmwA6VvwTWg8L
 p0SrRLcNqaiA690mMfLZ7XlwD14yyWMuYn3NzN0WwFvYKWh2yqTxVxjNKzEoCRxn+6Lh6E//R1R
 UotKfqNNiO5iZadxiAimw/mkju2Kc5uaLsCPVtoLaIALM1ORhiyi23/oZKufSjy2XuBogIcXmzT
 fUnq0U1+Oeh5KRBAcI4FJ5EDuOL2QM3vVPw5CHBaTVxUvCg72PkhHxk2T41dJ0MliQNhFjNBVIM
 i0zNFwh00b3UiSNkrkGSas79QDK4rhMiYBsgfZUGYjST+qh/p6kM7ccxpbMz3tirdbvMsZxEufo
 M7xuNl4R9dMgRs7AKLfaIIsojl8PL6NpZNLEoFVh6RzLDTt1v687levEf1VfBoqiRy85HTPXUJr
 NsuSFe0RR2EjGM7CjvRbVfguXXSnUnV9PtpU259qszWKt0OBGoXxH4O/Co15e4lndqJuZVDKFX0
 WigE1E0XpsiiR1A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022908_631712_FEC80E36 
X-CRM114-Status: GOOD (  17.20  )
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

Several drivers duplicate same code for getting reference to the root
node, matching it against 'struct of_device_id' table and getting out
the match data from the table entry.

There is a of_machine_compatible_match() wrapper but it takes array of
strings, which is not suitable for many drivers since they want the
driver data associated with each compatible.

Add two wrappers, similar to existing of_device_get_match_data():
1. of_machine_device_match() doing only matching against 'struct
   of_device_id' and returning bool.
2. of_machine_get_match_data() doing the matching and returning
   associated driver data for found compatible.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

All further patches depend on this.
---
 drivers/of/base.c  | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h | 13 +++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 7043acd971a0..0b65039ece53 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -434,6 +434,53 @@ bool of_machine_compatible_match(const char *const *compats)
 }
 EXPORT_SYMBOL(of_machine_compatible_match);
 
+/**
+ * of_machine_device_match - Test root of device tree against a of_device_id array
+ * @matches:	NULL terminated array of of_device_id match structures to search in
+ *
+ * Returns true if the root node has any of the given compatible values in its
+ * compatible property.
+ */
+bool of_machine_device_match(const struct of_device_id *matches)
+{
+	struct device_node *root;
+	const struct of_device_id *match = NULL;
+
+	root = of_find_node_by_path("/");
+	if (root) {
+		match = of_match_node(matches, root);
+		of_node_put(root);
+	}
+
+	return match != NULL;
+}
+EXPORT_SYMBOL(of_machine_device_match);
+
+/**
+ * of_machine_get_match_data - Tell if root of device tree has a matching of_match structure
+ * @matches:	NULL terminated array of of_device_id match structures to search in
+ *
+ * Returns data associated with matched entry or NULL
+ */
+const void *of_machine_get_match_data(const struct of_device_id *matches)
+{
+	const struct of_device_id *match;
+	struct device_node *root;
+
+	root = of_find_node_by_path("/");
+	if (!root)
+		return NULL;
+
+	match = of_match_node(matches, root);
+	of_node_put(root);
+
+	if (!match)
+		return NULL;
+
+	return match->data;
+}
+EXPORT_SYMBOL(of_machine_get_match_data);
+
 static bool __of_device_is_status(const struct device_node *device,
 				  const char * const*strings)
 {
diff --git a/include/linux/of.h b/include/linux/of.h
index 121a288ca92d..01bb3affcd49 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -407,6 +407,8 @@ extern int of_alias_get_id(const struct device_node *np, const char *stem);
 extern int of_alias_get_highest_id(const char *stem);
 
 bool of_machine_compatible_match(const char *const *compats);
+bool of_machine_device_match(const struct of_device_id *matches);
+const void *of_machine_get_match_data(const struct of_device_id *matches);
 
 /**
  * of_machine_is_compatible - Test root of device tree for a given compatible value
@@ -855,6 +857,17 @@ static inline bool of_machine_compatible_match(const char *const *compats)
 	return false;
 }
 
+static inline bool of_machine_device_match(const struct of_device_id *matches)
+{
+	return false;
+}
+
+static inline const void *
+of_machine_get_match_data(const struct of_device_id *matches)
+{
+	return NULL;
+}
+
 static inline bool of_console_check(const struct device_node *dn, const char *name, int index)
 {
 	return false;

-- 
2.48.1


