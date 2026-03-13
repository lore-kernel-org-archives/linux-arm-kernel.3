Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E4FFED2F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 00:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PeETB9eQltddP5mF2mJA8o9tnQJB7YnT8JvFDCE8DGE=; b=O/MFdY62odXVEMFKt/PH6OacmL
	YsOeekuOGGAXnhAMfFSzJOjkxP85mCGI8ue6T3mBlcqBKhm/B8OSK6Sz3XAFSyXTWLuPZXDgQyBhD
	8gzQv0qfPfu+IA2Pjm7f6oZ1rgcucDq5wUDQMYAh5N0ofGNsoklROOozuQsuV4AUr6O7zDVecpjzA
	eqI5bBo1aQvkXf8OFunMzj95KMzsd9fvq+IPacO8zaDKZOSqPtQJFacaQULdWxVNReV4ifVRRX15b
	VypniTehUwBa+ade19HkRafBq9I72Rv6ve8miK1HTBd+W0eCSSsOzxsatUN0lVNmKrKNnwEVHkJgx
	noGzGTuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qHe-0000000FuRB-1OLk;
	Fri, 13 Mar 2026 00:21:42 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qHc-0000000FuQX-02tv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 00:21:41 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-64d5a7926cfso1767615d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 17:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773361299; x=1773966099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PeETB9eQltddP5mF2mJA8o9tnQJB7YnT8JvFDCE8DGE=;
        b=HMtFoc++XWtCgdqfQhLoB80/WRcuVP1YuCxDjfgV/6H2tX2l3X3ctWxEJjQVi9caA9
         /6P0SZezJxyWydJCVhMrmuszk2+vxCIgvrFal5cxmBw14+VexigXIbQ62ziGSvE6fx52
         VT4aSeIMqfvAxmgDs+1P19mazSCrYIo63LiOSNIlexbnWD+yGkSJpKxcmv6UDljo1EKS
         77IDhkMJSJRCFlS35I7Ch4K3eaB6qz6jPuCfplf4y3sYisGsAhFPjBlCR4MXg45CmJSD
         bjAZXZ9YkEkel0UiHRUswB2Wr90Omvmm3FzcuZpYsRK3kBbBR1YtwGfDHgj3pHkaxaAV
         EcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773361299; x=1773966099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeETB9eQltddP5mF2mJA8o9tnQJB7YnT8JvFDCE8DGE=;
        b=UJh6YCUAWgoNAg9FEHiedbJ2h6kQHqiJNhtRrED6UJb61K3aVqL0/K8XV0LMCt3vaK
         L//re16eZM6A+Q8byhqzthvAVajqNLn6HJfMEowlbY23wLjsqqIveQWCKuQSe2CGurtH
         tR8ZiIWmxdWfQEz7IyQGhHRMPCWbv1tzXPxk+YZZkx02mpxrqHWaRkgHPHy1d/0uCmMp
         UsFBCr7EjugvkiViCFtnI/l8SyC9g9dpUbHe17Fn4ht1z3E5eXqHwWdsMRTf+EdHvNGY
         /sS4er1hvI0Ez7TOMbrNkDBfoOIfkKIeuujQMVHBRar2K/FrJZFVyUGNCJIjIgFSV+hK
         QmHw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ/brS1QvI6UeLjnF7HqAYLy5t5XqwVbAfUA4pb236Raw8l5KVDc8riBm8wZg7T/cI95hHSdvYzDhtq/n+3hcj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/qBCGVo3dJM0ZPBECrYsMlbyTs7Ir/zykhpuQ7RUND7+GDfxM
	CIfKdhF7FMBbZU2kIuXNCWE9STBfwa5G7bYIloYVm604VUpDS1YwXosB
X-Gm-Gg: ATEYQzxA963JZYqILSwRlZZOGVK7E16iQBW2APzrvuq+plIPynfk8hMC6TIerLh3isY
	80rJvoAvfGUNo50uTlmDTYVxrsY1jajjdyPdX0wapyRtISNjJlej/e62W9HdLZmTiuxmhAUNWzj
	UeS2zHhhAHJF/GoKKahhmfNQKmoR4WY3uCsIYAiXHq3Z8TKGKUIroYRaYF1RFVt45FeYgKBp81y
	RYRca9HHXU9xOE5Z8SlSjFuZFi9wZmw3zy0/VnxjG+h8Fh+k+xRK/R2wzNHG/qxG3jJ0OpEcOID
	vvFTdo7RfpeOqTfisS7ALAgeU8JkHjOtQ9rhZJtkT9Rjq7QAI6NPV7tCmUGoJDrWOHhDlbxpNc3
	Y5qL0OoyavzJgyhZHNO8Tfej2W+0hbITCZF4wqXTFAsbhbxPzUDNw79faBJ5cEzWHVV9tx9Pm9c
	2gxKFiXw3IQzTD3KbD34RHC+omm/WjqE3pWf6Jx6wi1p9xK8QXZMh2eTkNqXJAvW7A
X-Received: by 2002:a05:690c:c155:b0:799:182:17bd with SMTP id 00721157ae682-79a1c0e1676mr14239947b3.24.1773361298678;
        Thu, 12 Mar 2026 17:21:38 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917f1ecd9sm39089407b3.45.2026.03.12.17.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 17:21:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] clk: at91: use kzalloc_flex
Date: Thu, 12 Mar 2026 17:21:19 -0700
Message-ID: <20260313002119.118962-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_172140_054682_3DE73D53 
X-CRM114-Status: GOOD (  12.77  )
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

Convert kzalloc_obj + kcalloc to kzalloc_flex to save an allocation.

Add __counted_by to get extra runtime analysis. Move counting variable
assignment immediately after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/at91/dt-compat.c | 15 ++++-----------
 drivers/clk/at91/pmc.h       |  2 +-
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 5d543e807843..5c88cfafa31f 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -548,7 +548,6 @@ of_at91_clk_pll_get_characteristics(struct device_node *np)
 	int num_output;
 	u32 num_cells;
 	struct clk_range input;
-	struct clk_range *output;
 	u8 *out = NULL;
 	u16 *icpll = NULL;
 	struct clk_pll_characteristics *characteristics;
@@ -568,13 +567,11 @@ of_at91_clk_pll_get_characteristics(struct device_node *np)
 		return NULL;
 	num_output /= num_cells;
 
-	characteristics = kzalloc_obj(*characteristics);
+	characteristics = kzalloc_flex(*characteristics, output, num_output);
 	if (!characteristics)
 		return NULL;
 
-	output = kzalloc_objs(*output, num_output);
-	if (!output)
-		goto out_free_characteristics;
+	characteristics->num_output = num_output;
 
 	if (num_cells > 2) {
 		out = kcalloc(num_output, sizeof(*out), GFP_KERNEL);
@@ -594,12 +591,12 @@ of_at91_clk_pll_get_characteristics(struct device_node *np)
 					       "atmel,pll-clk-output-ranges",
 					       offset, &tmp))
 			goto out_free_output;
-		output[i].min = tmp;
+		charecteristics->output[i].min = tmp;
 		if (of_property_read_u32_index(np,
 					       "atmel,pll-clk-output-ranges",
 					       offset + 1, &tmp))
 			goto out_free_output;
-		output[i].max = tmp;
+		charecteristics->output[i].max = tmp;
 
 		if (num_cells == 2)
 			continue;
@@ -621,8 +618,6 @@ of_at91_clk_pll_get_characteristics(struct device_node *np)
 	}
 
 	characteristics->input = input;
-	characteristics->num_output = num_output;
-	characteristics->output = output;
 	characteristics->out = out;
 	characteristics->icpll = icpll;
 	return characteristics;
@@ -630,8 +625,6 @@ of_at91_clk_pll_get_characteristics(struct device_node *np)
 out_free_output:
 	kfree(icpll);
 	kfree(out);
-	kfree(output);
-out_free_characteristics:
 	kfree(characteristics);
 	return NULL;
 }
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 543d7aee8d24..123050b4356d 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -75,12 +75,12 @@ extern const struct clk_pll_layout sama5d3_pll_layout;
 struct clk_pll_characteristics {
 	struct clk_range input;
 	int num_output;
-	const struct clk_range *output;
 	const struct clk_range *core_output;
 	u16 *icpll;
 	u8 *out;
 	u8 upll : 1;
 	u32 acr;
+	struct clk_range output[] __counted_by(num_output);
 };
 
 struct clk_programmable_layout {
-- 
2.53.0


