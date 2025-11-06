Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06452CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFhUWdS232/zvQ5zx8YGxHTaYNY9a/jDdBok4SLTbUo=; b=Ug/fD2ZsfISyNOY/2NsofH1T/k
	tj46jDhziUMUeJ8JkAO/Q5479eujQiIqjbaw16/ltnG1USj6jNAxWQLgBRNuhpbwp1LeRJ/JtRwK8
	DH0QOJBQPbUbTuJKhmM0M5pJ4nCMMJzygl4UkKq/oKjIB53LDray7WRoUS+3QJ57zVXotVluW2kT+
	BtOoaG35A3zqcnfPlqApHajp1Q1aIjNxLLy2rztDizHNsUlk2b3++u1rL+YYWgwjnH16nqFHtcxRe
	ttXGgRvcErA+jMB4CngF0JH8GdVMwhzgfq7r5UNy3c0ULlcs7GnuCSczQTtKY6UW1uHA+IardbxQQ
	GdmQHwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LV-0000000G8Ks-3XPU;
	Thu, 06 Nov 2025 19:08:33 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LQ-0000000G8CB-2N9M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:32 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-64106cfa518so236333a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 11:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456107; x=1763060907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFhUWdS232/zvQ5zx8YGxHTaYNY9a/jDdBok4SLTbUo=;
        b=FmpnlCkFveegQB7KDpgct3c5QgIBLilgwlxqou60OuHGgjuke2wPogWPqYbcJY+lFq
         jg1uhVscQlDjBJGbt8bSo4DjNXQQ05XdplY8osV4UeRZEi833LSwi9clDOeMYSTEusxx
         JDi+W9oyeBR1MZLh67QlDBfF7AaDsLL/3/Xf9sGwiqHNZV9tfm78n5oEx8w13xYOlwa9
         ZBCs8irWDIEcJjXO2cl/XAHSBVYIqZWMfxE+vvwbHl4tfet/mmiOXyWVmos07ay6AKjs
         W6u/LmtEQkHljyClp80U7V3o1uN5fhnxTlLT5uNdBUeaU6Ag0jP+2uxLcHZ20mIjeUHN
         Q+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456107; x=1763060907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eFhUWdS232/zvQ5zx8YGxHTaYNY9a/jDdBok4SLTbUo=;
        b=pKlgRM41kEn/71yHxWfEIDUQpFMCCFnHCTnflwHlflHnlJLyEG4Zg0DXrw559SO7Rq
         xEroZVGMFfeHopXzGoFlcNX2mmyrHF9H7H+C5Y6g7D6dWLR+pDNsXW3eJ78Fh6eA22nZ
         n1pEche9M1NvGB9mfBk20l6DYloDOyigHmP/bnxHzkLefMI0sOdPsaNJqf3TDG5mjHve
         KD6+q6lHbDN3+TTVvl7+lvaIuWVyQL8B4rd58bRv2ry60X16cf3GkQ8W0AI1YHxo2AnU
         bTddXreSRFgSHArIk2Gp2Ru3CV9MGTmllXSDPeftEnrMMIcuf4RQlLROk+ryksbqtwjU
         JHqw==
X-Forwarded-Encrypted: i=1; AJvYcCUoZzKo2esIT2ee0EsPfrRQm2FDZiY6rPDYyxw4K2GnANeUX2lMgYAoo2GMPfhM9yzwqXM5emFtdtSbZXTnGcDL@lists.infradead.org
X-Gm-Message-State: AOJu0YykjZ5VzRefJphk6CcQybYb4GWLkw8ynrxkcoDqo0PqPqJWDOKw
	eMMx5TsmaL7YsNBTRvg+nDgl1/+rPqx81ucTdxXuo4Mu4B5C4LkpZuJNpmaK8ACkYPs=
X-Gm-Gg: ASbGncvDhfZTWPwnNBt+Qm7JrWRNnCAq80KOh7wcn379IE3m1dy9BgRHYq7Cf+iSplR
	GZVmG09J5seC4158/xyKxUVCIcOEz/u7KiYGb3qK8tTpNkDXwPDHJa5ZTyO5TBKe49H5/BU2p/w
	ym51nx7Y8/ok19NytjhqQ59nFzqPfZ7OaAl5vA+26UctFfkB9wKdhG1GF48RsZxVbJ8dMCcLExH
	wAbPI8mB7sHcYRslTYtaAD38AQlo6hs17w3vdYJhtnuxL7H80knxkCMb7yhbWEQkf+jxk2GLa5T
	KGGZmexOrGkbOc++QdLbJMZZ7wSs7jfZ3UTeJ0Q4oHdzgTaJruMTnk0aNZZEdIWAE//oeFAwrxj
	vqm3s+D56jIiKMTYe458yv/hQJ2ZEIW6eLGuY/Y5df0QXAv90t6Eaufuxa34ySmSSWBFCjuuq/J
	NIWjH6hrpXc5XpahyX7AEdabX2hnxixk1KBNSLUA==
X-Google-Smtp-Source: AGHT+IHV0gcmtT5dHOFz2RWdjjPo4Ym0Dxek/nZLw6T0N6UfI+vf5qBD6z9VCh47UKxNTUDt+Fg2GA==
X-Received: by 2002:a05:6402:1d4c:b0:641:2a32:b8bd with SMTP id 4fb4d7f45d1cf-6413f062ecfmr273551a12.1.1762456106689;
        Thu, 06 Nov 2025 11:08:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:15 +0100
Subject: [PATCH 08/13] irqchip/atmel-aic: Simplify with
 of_machine_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-8-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=em6T/0hfaUrxxPHQSOCVHJqt17fZcoSzBpufVPMk75E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIQPP9Q0idGJx68rbMt6LPDzi2dtyc+qS5Mu
 2MGYLCnw72JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyEAAKCRDBN2bmhouD
 19RJD/0S4D7rWxJnMM5I0ZYvnbWMyO/Pj+zZl5eFKXP8jMODrKLvsKA6Fg3LnSAdO8L+5R5rOrn
 4EUnjlQYlM54t/RRDk+Nzjd/KH48/DE/2WCAFiGImlDsuBP056TT98RR3yrY4NzyX24N/8z3ax3
 8GZFPox1BIaAcX+3EomDyR36I+92AkCvbnhnFPDKUTooHlSVWPX+K3FdtM//a58/chL6TZ86jq6
 1SgBn6KYSc22lQ59475GTGt4ta3S+5ZvHrQi2366EGm69VLEQq9Ysm+AGe/x12eHW53kGE9p0AM
 wapt3PIh/Lvpie5yT6jh7TtmdKuIaka3XM6EOgFwnkDLzsSGOZCBPg2Rcpos//m5AjddN2J1KGl
 0EZJIVYOqxPDRKY61SJacWclPPPmdC+hJOMGk4tr4v3b3IMuXPSQOSyZSkCuum4QMkPYk7LPZO/
 MVGJ3XH65qFgUsUwv7MGHHUkz2dgMMvzpi2oFBbsriL+FY82SE0gsjda3sfKcjj4IKMEEb5wCRu
 jHeDHhMGRpgqfbXiosWKNkJQpOp4gHIsuCueX40vRwcWy89afIZXxJ9cyXTBcyDrzOQVF6NovFl
 9Nz4nRsyPVVgw3gPqrDfWqzQlrFQeSwu5UTDL0iIWxTLElBqYmjApnQ6PvZPKC1N8OTCYhLlGUy
 JC6bgRbAddOP0nw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110828_687868_8F661C27 
X-CRM114-Status: GOOD (  12.70  )
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

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/irqchip/irq-atmel-aic-common.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-atmel-aic-common.c b/drivers/irqchip/irq-atmel-aic-common.c
index 3cad30a40c19..e68853815c7a 100644
--- a/drivers/irqchip/irq-atmel-aic-common.c
+++ b/drivers/irqchip/irq-atmel-aic-common.c
@@ -187,20 +187,11 @@ void __init aic_common_rtt_irq_fixup(void)
 
 static void __init aic_common_irq_fixup(const struct of_device_id *matches)
 {
-	struct device_node *root = of_find_node_by_path("/");
-	const struct of_device_id *match;
+	void (*fixup)(void);
 
-	if (!root)
-		return;
-
-	match = of_match_node(matches, root);
-
-	if (match) {
-		void (*fixup)(void) = match->data;
+	fixup = of_machine_get_match_data(matches);
+	if (fixup)
 		fixup();
-	}
-
-	of_node_put(root);
 }
 
 struct irq_domain *__init aic_common_of_init(struct device_node *node,

-- 
2.48.1


