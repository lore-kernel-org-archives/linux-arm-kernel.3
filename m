Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F55C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pw83rsiBFZIUZWx5sliCML1fBJ0c8WhT+nfZEUBGdLM=; b=zFUNWz8JdBuy7ZmYKND8n46Puo
	ivWOdmCDTYaAmPWDa6VbjwzChJHwbD3bxlq1MbUJzNwagizwwrD/Qd891sn5nzhrWeb1RHBUJE0Ej
	f8HybITUdEwIBfYwBcfG9TeJph6Eln9ukp21OScqd6uGv5W1rOzNTEye57aCVjzTaduf0DU0mpRZi
	bsDLQ52auD7zBd8OSSVgwRnCvb0UW8q6MgXKE9NWod5RHk8qdv1qBk2GO7InVMVUJgGb1JThoRQx/
	d/HRAZOVAFXv1zLn4Y6DivmcGE+S+A+MdiKCrthJA+XyNj6kKGjgpfvR/7S4YzP5lMLfDZ3cR9JlO
	EYEBzODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBK8-0000000Eao7-0Not;
	Mon, 29 Jun 2026 12:42:52 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBJu-0000000Eah2-1xGl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:42:39 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4745492ed3aso444610f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736957; x=1783341757; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pw83rsiBFZIUZWx5sliCML1fBJ0c8WhT+nfZEUBGdLM=;
        b=M7qBc7x/F7pzUCSb9tCiRnqG9+GsJ4os166ZkUOasgiVWlZY3me/JaomNdlJBI/T3R
         BR96f1tKFG9y+TQIos7GIVlmYfUtLDzs4lXldb0aR5G+DNRU13VXD0GDwCMOLsBZFoaR
         pR14DNUVTb21WG7yc0QNMhjHOWi8HBub8n1DmgGgiYMlBmpS0XrKUqoELTUH7B4wN7VB
         xjdiowwpuntZTjkiLY95RFytk7LpDCrjpe2ngPTtbW5KNPpbJiQOWGFraaJ5Uw+2qWzI
         D7NfBm5xMX/2apcGZDRGNm/TML39XhyvrjyRbGuvGPrQXVqI5wE2TDrxkn0V5K0j6FXf
         gkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736957; x=1783341757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pw83rsiBFZIUZWx5sliCML1fBJ0c8WhT+nfZEUBGdLM=;
        b=bSCSLy45MuqnW//JvLzvZgxwXQ9mg131F54iar4PT7Gt4IxH68FQj3AxvJ/yEGagQM
         CEUj5yOFNjmh5w4kEVpN3t1Y3GgunTf6m2WbDDD1/8wnoGLc5gC8p6atgxkqUKr86TCa
         IR/LW1IkYMOK5zynIyPqtWpC1Z1jbqDjJLruzLQ83ozsrerG3Ptv/rFZ+L+/b0MiYKrd
         yZTHAex7fhNyjw522UGMF6wSFnorBdgChdiq1Mpdd6Gxt+eltYtfGTq89+7GfkTMlBtn
         oZ2VlfjU0R0hkitvVimJOqX5pKvDLMa2zrJ6emSsrXL/DQQAOYd8G2/eirlgCGIBDuv8
         KRLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPR9+qufZy+q/e2gLDyItqcdoDDXFkFqWEJ3t+D+PqYUCshWxB5B1Xsrb2CJKaT9Z6rt9e5s+mgspGA5EsCeM1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhe1C92WcKEFut6FGZh6uqqK/U0kiWPDfSC+NnPjUNXcZY1YSN
	Duon+PlmXJ0ujg9mXyjCLXXCELiBUg9EuFHHVJ6KJMRQ6sbymCD/xYN4rx5kQ5v7BX0=
X-Gm-Gg: AfdE7clhH5B706JDWCJNZUiAUriwM8IJomFDsn/ORt2W58Y81Dj0Z1oodMOxX4VZmUL
	1FNrrTyeN3xCbudhuiVNLtFLg+azYV1Xz222SoVhxy1ba50DbVdqRe/G+jqZRxAtQm59/EN2Cn3
	pC/UBP/OjQRepEpBuYC2Ap6Ijk+sz1fTrB75/X1L0EKJ0yXk84sfqGtWl55v6SbfnMfAdSIlwt+
	gcoudqZtGnJZXNToB4HR3IfBqFhSQ3ReqhLLS2R8KkzEmHbid8UMDWtEgKR8b9tm4PkHvTdvmZf
	DJnNpo8GfvuqmP3AUMD2996diBf9kq9djMQgi3XWxiBqt/yFVM5tYahjT7BZKPJqyx56xRA+kAt
	uo9rY1DnimVE1AVCI5t3EAJSYhK8OL4DglKUVyKvEMKp5r1k8ZYRo3A66um0GlLhGYLrg8qrWVf
	2Lj/bj0Xp6bBU=
X-Received: by 2002:a05:6000:2c0b:b0:466:6ed8:1e1b with SMTP id ffacd0b85a97d-46dc263a79fmr26849485f8f.21.1782736956641;
        Mon, 29 Jun 2026 05:42:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46f9db29b15sm21643420f8f.18.2026.06.29.05.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:08 +0200
Subject: [PATCH v2 4/6] clk: sunxi-ng: div: add read-only operation support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-4-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=FoMUBVpR32MtJZer6V8lgBnEQWSbZvsirk0xN6alb7w=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgvEGszTwRXVQ3roYF7XUovP55Mn6aarufxX
 8kePw4A99SJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLwAKCRDm/A8cN/La
 hTF3D/wL66zdurLSHBXauyOo/Zxl5eIu+ExlDjOXHuoU9nsyPbxB/Fvr5arOgZKgvkzeEFBeNyD
 rAJUqyTmc6DVlZirO2UJrSavRMrcf+PRwdB+UnjMkSCdqVrVRG57FRA69nk1XXGZooC99EBbYdG
 bhssIXwrI+pW1uDUGU5nLIn5+FoTUHgyM1DL9Wldf6WnJjpfYxvSmQLtGGwBK6Jp80BbtvgBVka
 FTJVT0SjaBvXOqJOYhqJaAHPveNEpUEhV1DgPiydlgT0i88N6GkXizHXfgPNom3dpTjQ1vPrRum
 QCL5QHaaIPndE7AZcGSyZAQ4OaxI/yEOEIbKFlAggihe0wBUWdf9tH9wiUVdvDZWrpErGfeD92F
 c9w3gkhEKwy47mVjQJcH9gGIF+CTmr3ND2kG3EzotXk+61Ok3LmVZcKWPSDrddLk2rY4x6LNqh9
 dJyxjsiE4Ee3WyWGcaDN1ajaqAavcA25KwmSg3BooXCtZPsk9rMDvcvylni/8+CoIqKYOwNwh7c
 xdUuJ66mrS6VvpM8TLvIHuoyK2t9uhapPTa7a64zx7i4RW6FP+20MIBepUl4nU8BvisqT3l+iKy
 AfZQswZZ7g+C8UCJH2Xb000LCLKJRgS/Ym4EDI5eEbwLYMTbotAmQnFlaOzSmJoxoU3bav2VMNW
 v1fkXBQp4GKAnTQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_054238_523310_394B70D6 
X-CRM114-Status: GOOD (  12.41  )
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

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 11 +++++++++++
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb524..0e3d9e6e30fb 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -143,3 +143,14 @@ const struct clk_ops ccu_div_ops = {
 	.set_rate	= ccu_div_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
+
+const struct clk_ops ccu_rodiv_ops = {
+	.disable	= ccu_div_disable,
+	.enable		= ccu_div_enable,
+	.is_enabled	= ccu_div_is_enabled,
+
+	.get_parent	= ccu_div_get_parent,
+
+	.recalc_rate	= ccu_div_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index be00b3277e97..a30a92780a05 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -300,5 +300,6 @@ static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
 }
 
 extern const struct clk_ops ccu_div_ops;
+extern const struct clk_ops ccu_rodiv_ops;
 
 #endif /* _CCU_DIV_H_ */

-- 
2.47.3


