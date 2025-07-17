Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5921DC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 10:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KTffJpKMpn8uJ1Va+yFB5k6/yxUZURkt0Rt5PLMCHI=; b=Hw4RETj5FvFWHfuqR7WpNRbp9e
	pxR9LnEHzJiy4v222UH1kg1viLhek3lgGiBcTojU9ilnOmVxx53OnIUyMXLM/J7vhJhXX9SGWo5Aj
	guGV/Bxqgoj0QoG4jmYsyLY2zApILz1hBbJdRVYg/fVzsx+eOGLhg2bIWBBp9TD9qLpdK8TmbVDBO
	2ikL1o82PH+c3OzEbmhv2SG5mpVV7ry1Hzmbv5JmdRQ6aEtcoiKw1fi0dAgbm0tZFSnUqqGkzM5KK
	HHMRljAjUs+KFCdVhsrcKdDdwgK9hH0YliOlsE8n4uRwf5jIXZ8BbUV5wKu8KzGOnKDsHNHK2Rdfa
	+4SDX1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM9m-00000009tIK-2Xib;
	Thu, 17 Jul 2025 10:48:06 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLv8-00000009qW6-0jZy;
	Thu, 17 Jul 2025 10:32:59 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-455b00283a5so4935085e9.0;
        Thu, 17 Jul 2025 03:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748377; x=1753353177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KTffJpKMpn8uJ1Va+yFB5k6/yxUZURkt0Rt5PLMCHI=;
        b=UNfnbooYHCTJKhKoEMGcWt3ViZA2qa8RCjQvmBx+v2fOXRK1FraL2NYiPehrrl/bwi
         Lv/isFiqi6FP5Eltr9q+W61i0WtaQ2+boEOdSjO4jibTeOhC9i8pIJpXc9uKK8z4AHE0
         zG8jvkhWuERroEzQK+RJ+Qv0adeXASDGfk0+86LWNj23uEZz6kf1elqCLl0Xxyj8ERec
         b+ncj4J89tb+0IqBtLzzVBNHMNGm5FZarSMJVkgrg9xI3zXNS05J7fDygJHwd/7IHIIR
         O3v6JXs4QHOXK/PCypwnEpUfM3d5IWy1PLF9MEz+aLLhkkC3wHsLZrE0sEtV5K7CQMp1
         9u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748377; x=1753353177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KTffJpKMpn8uJ1Va+yFB5k6/yxUZURkt0Rt5PLMCHI=;
        b=A7hUNXvSzAG5A+xAKSY60sVL3CPjNDiqYHNMrbALAM5RwzUuyI3nBF7+KJ2XocPXev
         lQeKo5trYVen2fLanY4oCB6NfPkbr8DdSdHIq/j8YwIAivR+rSz/N/a4DOBOgNCBWeyy
         EfA36ZsOHJc0hA13PpLUhdF8Rf16xJCE/UQDw30kExQsD4N3M7PcQYTHJAZ6xjdw0aP1
         JsVXlciLeTAIAhn/r6lwaINpq/sufMki9oHjrvXIzBmvSh2hfvk1YEv3fTFJaCPWJ+gG
         Y+FZ6Rrn21xstKbJMI8gGiljqRy3/qoIjWGu6AKAAUboL4VKbYAm3cvAjce8QUTJk1TD
         xOHA==
X-Forwarded-Encrypted: i=1; AJvYcCU3yx93VU5BuyHOOxEjDrd/BPhB+LFmQN2s+5DgToIbcOzl/1Ll1sVB5TdUeBClduGwj9O/eO2Vt2fBOcdcoeSR@lists.infradead.org, AJvYcCUjdrkiyCVWjxRWKAF7Iojza0kNb5aS3Y30ThcqBV1HG8y57Rg0ftnoGB6u8ZS4lnus9lLyWdNYhzF+teY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkbkpwN0Q9yWO/NbZrOMY/ChI4M8xEq7+kH1KRLDAEFOSAdxzg
	/uNgRomfmU7kimnV5rKz27FWU7z0zeUdpErOEB+FhAa1XU//Y0z4MWpb
X-Gm-Gg: ASbGncvzpDxEyakPaaSfLqN1UJ4P7d/xnizjvk/9IA5pPOVHQdJzUlJc3FbgZNsbp5d
	KAPU7vmupHAqvlhYUKmv+TmEzj4jNXxkVFq7V3oWlyxjxnAGTuH4wxjz3r+kjTpkA2JvB5Rb/L2
	sJU8riVSzEBCkwNlBJkDm/+nt1LvsqDTZ1TPyLEZM7f1zKWOFMAbRVKNU82hnGpi5dnnBme6UN/
	XC8Egr+kvNB93GXbCG3mUmN99YRW2rgMVQ/jFFIBTQgT4GKzfdQss99Fn1cCmpG0fCUzv31t6d8
	8l/wHmUBzz1CAPFXJ6udeaaybYdyyXehB777t4FMAXIktT9Qmm4MkExTzHI/RYREqlEZv6bO9BI
	ecPtnOWEywzPFPn/wI5XrWiSFz3LNdTLXmCt0aepOBpx+4j6L2YQDPNUd7jY0wd+4CVXNBGmRJb
	2Zt757FSxaMibsrOlP5WJ4CXdQ
X-Google-Smtp-Source: AGHT+IHc8vQXtNpyThvJpHCdFDQv27nKu7NYwqVFIiEhHTf13nJ3NAM+LgvjkH4nGyp8L9aYlCB8Ng==
X-Received: by 2002:a05:600c:5246:b0:456:207e:fd86 with SMTP id 5b1f17b1804b1-4562e03bdf0mr74830065e9.2.1752748376435;
        Thu, 17 Jul 2025 03:32:56 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45634f4c34dsm18373635e9.6.2025.07.17.03.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:55 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] clk: ingenic: tcu: Embed syscore_ops in TCU context
Date: Thu, 17 Jul 2025 12:32:38 +0200
Message-ID: <20250717103241.2806798-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250717103241.2806798-1-thierry.reding@gmail.com>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_033258_215778_3DD508E3 
X-CRM114-Status: GOOD (  14.28  )
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

From: Thierry Reding <treding@nvidia.com>

This enables the syscore callbacks to obtain the TCU context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/ingenic/tcu.c | 54 ++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
index 85bd4bc73c1b..503a58d08224 100644
--- a/drivers/clk/ingenic/tcu.c
+++ b/drivers/clk/ingenic/tcu.c
@@ -53,9 +53,9 @@ struct ingenic_tcu {
 	struct clk *clk;
 
 	struct clk_hw_onecell_data *clocks;
-};
 
-static struct ingenic_tcu *ingenic_tcu;
+	struct syscore_ops syscore;
+};
 
 static inline struct ingenic_tcu_clk *to_tcu_clk(struct clk_hw *hw)
 {
@@ -332,6 +332,24 @@ static const struct of_device_id __maybe_unused ingenic_tcu_of_match[] __initcon
 	{ /* sentinel */ }
 };
 
+static int __maybe_unused tcu_pm_suspend(struct syscore_ops *ops)
+{
+	struct ingenic_tcu *tcu = container_of(ops, typeof(*tcu), syscore);
+
+	if (tcu->clk)
+		clk_disable(tcu->clk);
+
+	return 0;
+}
+
+static void __maybe_unused tcu_pm_resume(struct syscore_ops *ops)
+{
+	struct ingenic_tcu *tcu = container_of(ops, typeof(*tcu), syscore);
+
+	if (tcu->clk)
+		clk_enable(tcu->clk);
+}
+
 static int __init ingenic_tcu_probe(struct device_node *np)
 {
 	const struct of_device_id *id = of_match_node(ingenic_tcu_of_match, np);
@@ -430,7 +448,11 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 		goto err_unregister_ost_clock;
 	}
 
-	ingenic_tcu = tcu;
+	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
+		tcu->syscore.suspend = tcu_pm_suspend;
+		tcu->syscore.resume = tcu_pm_resume;
+		register_syscore_ops(&tcu->syscore);
+	}
 
 	return 0;
 
@@ -455,38 +477,12 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 	return ret;
 }
 
-static int __maybe_unused tcu_pm_suspend(struct syscore_ops *ops)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_disable(tcu->clk);
-
-	return 0;
-}
-
-static void __maybe_unused tcu_pm_resume(struct syscore_ops *ops)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_enable(tcu->clk);
-}
-
-static struct syscore_ops __maybe_unused tcu_pm_ops = {
-	.suspend = tcu_pm_suspend,
-	.resume = tcu_pm_resume,
-};
-
 static void __init ingenic_tcu_init(struct device_node *np)
 {
 	int ret = ingenic_tcu_probe(np);
 
 	if (ret)
 		pr_crit("Failed to initialize TCU clocks: %d\n", ret);
-
-	if (IS_ENABLED(CONFIG_PM_SLEEP))
-		register_syscore_ops(&tcu_pm_ops);
 }
 
 CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
-- 
2.50.0


