Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF49CF513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 03:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d6bAE765oO9RMv6HiG4ahAua9/sTwWO++ewXCfT3Hxk=; b=L3nNRV/yx5N9GK41G40QDWU979
	yef0dStfvpXCmoArIFoln36+RET7ovVnwFW9tPVi15vMXbypBEl16eod0lmknwqT9OKW6pVUU71AR
	kqwAD+sjDQCtAokurzEZay6aEgxC4XMImmbmEMj8fX0tM/WqLBZ1o8DdGmajxgwqxML8/9SGp25SR
	YdnPAiiy7Yn8HH3SATndhZ3vGxa5usUrbL6+34qKAyGLaU9RFXEDOkSuKu9147LwWcrAqUOtegnWb
	K24l44CzZwNrkqtJO2RlHTWLaInIpSEmH5GAyigHkifT4WR1NpCeTvMR1T8Xda/Vca/uDTUPelShQ
	T4F3OCHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLpB-00000002xPc-3AO5;
	Fri, 06 Mar 2026 03:26:01 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLp9-00000002xPH-18bC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 03:26:00 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c70b69ced09so2492788a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 19:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772767558; x=1773372358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6bAE765oO9RMv6HiG4ahAua9/sTwWO++ewXCfT3Hxk=;
        b=hci3SLr7OdkZMplDtkHOlX2mw2Gc+JghezdGXQObOpEBhWmiKvQxZrra5y0B3RG8L/
         l6Ok8KeGzed7RYk5mTIqv1ccz973pfAiU4nf5P5aFnVYiA97vFpLtgWOZggZCX6XSPi4
         qNaDyrmE7A6N1NNitFFjq/hwYLKHUFLRaQPSwjgA4CVCyyry+W+nOeIk2zPZ2oNTxPZX
         uN7Wa8w07+ANMgEyVkGAqtwy+H+4/92MCkU+IPnOyqhVu9fqL/uTwY02/dPehEc2KGTj
         AalNWEM5HHh+kxb9fWlJ2q/6zIP1hlkl4zOnXvpLRp4Sg21vED6bVS5ylNCF8XstFF3I
         CtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772767558; x=1773372358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6bAE765oO9RMv6HiG4ahAua9/sTwWO++ewXCfT3Hxk=;
        b=UuDCEGxr0QvsM/cqM6AmYTjZhBWvfd5q3K1yPTBc27QTxCz21Oi8SueuFJ5xV9UUHv
         OwSc9VNqemhfm7/CKC4b0DOBuyF/VQNH/1JJbKOLV9bDYCpSZKIVQjyDUgcSMR5Vf5Z9
         jEQpQOZRgoaY1mrUYp27moOAHMeXaddQZsLfv1F2aKjBSEYUK+bF9Cxn+XZdtic66aV+
         xXhSvhfqVOt4w38MWH/K/Ey2LX5iL01tXejkm6rEgj06+N3dUqm9m9jQJK+SXRjhCE9z
         6eJpmtFkfp9DjrYI+oySF63iOYQo0dvgbRA8ig4Gohp0jkmGDou7wQlOvkDYHVMmx35Y
         Ai1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1logFEa6Od9hpxiuQXsVHSfEtBh7GdsaukGMvuQ/lOdYqPVfCawQWsit1mMFl3gvXQv1GxS+KbjAheypEcZki@lists.infradead.org
X-Gm-Message-State: AOJu0Yx26QoCmE+lOdYRauQrV7oJefqfgdMPyr7Qn3EiJRP5XIxRXqo6
	KGb1tUWWVEKvG+Mkx+f9P6zfW9+WcNNJRdyjjJ3zSxhy6h0ZJUsOnGs7QiHcXmLLC/4=
X-Gm-Gg: ATEYQzyh33TBQcpoVy/PP3UegFgruG6P2EDQqEdBRYI0+FQ58Q+Jz931SyRjBL7HLqJ
	fzva6jshYGtfqbMkB8k1Zmz1IHzxi0xbLKCiIyID6ep+aPwORlw2QZjHgJ3HMSSm9E+QJi1E6U8
	hVreeJX8ajsXkg+1WEJkOLSpMMTyQ7XJHkXAPHsv1U95Ar+Jg3I3Oa05o7kdO6GwSWK1k99MsNP
	8NHkMqoqLt+HQqWA9rsRV8q3hkgzBadWWAlU1urINgDoDEWeJg9BF41Nc2R9g8UqSqXsvJ/qlhN
	dJbnFYjBciH/Y1MinqregNUxfMfRdQTyhZvOpUUJVDQhab/2U4YzdR63zqGHqn1BsF+pYrRjG7V
	7H1a3JBDeGsq2kFimPabX4+yluMjiFSOoTGvy5+6eYkaFUaWoVadS0DcQ7zpZJe0QO7us55Gy8I
	crsPy0VCr3i+5DPbadIk7dbu3oG/9buQuUY97RH8J0ZHmf9eUvGRfo13YdfzeHHWS+dA==
X-Received: by 2002:a05:6a20:6a15:b0:366:14b0:4b09 with SMTP id adf61e73a8af0-398590d61b6mr872614637.69.1772767558244;
        Thu, 05 Mar 2026 19:25:58 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0a70f9sm148424a12.6.2026.03.05.19.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 19:25:57 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC18XX ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] clk-lpc18xx-ccu: kzalloc + kcalloc to kzalloc_flex
Date: Thu,  5 Mar 2026 19:25:40 -0800
Message-ID: <20260306032540.47815-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_192559_316536_BACDB1CD 
X-CRM114-Status: GOOD (  11.94  )
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

Simplifies allocation by using a flexible array member.

Also allows using __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/nxp/clk-lpc18xx-ccu.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc18xx-ccu.c b/drivers/clk/nxp/clk-lpc18xx-ccu.c
index dcb6d0c0b41a..3793e701835f 100644
--- a/drivers/clk/nxp/clk-lpc18xx-ccu.c
+++ b/drivers/clk/nxp/clk-lpc18xx-ccu.c
@@ -27,8 +27,8 @@
 #define CCU_BRANCH_HAVE_DIV2	BIT(1)
 
 struct lpc18xx_branch_clk_data {
-	const char **name;
 	int num;
+	const char *name[] __counted_by(num);
 };
 
 struct lpc18xx_clk_branch {
@@ -266,6 +266,7 @@ static void __init lpc18xx_ccu_init(struct device_node *np)
 {
 	struct lpc18xx_branch_clk_data *clk_data;
 	void __iomem *reg_base;
+	size_t size;
 	int i, ret;
 
 	reg_base = of_iomap(np, 0);
@@ -274,19 +275,14 @@ static void __init lpc18xx_ccu_init(struct device_node *np)
 		return;
 	}
 
-	clk_data = kzalloc_obj(*clk_data);
+	size = of_property_count_strings(np, "clock-names");
+	clk_data = kzalloc_flex(*clk_data, name, size);
 	if (!clk_data) {
 		iounmap(reg_base);
 		return;
 	}
 
-	clk_data->num = of_property_count_strings(np, "clock-names");
-	clk_data->name = kcalloc(clk_data->num, sizeof(char *), GFP_KERNEL);
-	if (!clk_data->name) {
-		iounmap(reg_base);
-		kfree(clk_data);
-		return;
-	}
+	clk_data->num = size;
 
 	for (i = 0; i < clk_data->num; i++) {
 		ret = of_property_read_string_index(np, "clock-names", i,
-- 
2.53.0


