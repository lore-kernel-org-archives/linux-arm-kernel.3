Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C963CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 03:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z+2lgYT5AdwNVejrbpCLq1bID8j6vgX8/sYNGb+SUj8=; b=DRAxq4yU5ZCwpzS6D1CGcEiUmI
	elH/zZKWIkWFdyVeXMM+smg2Z6uMO4WGv4whmU3rajGq3lpLdkwWYiSTNr87raHmdYbM1A46nJ01i
	Cj6yR8Y1FQksDtKSGftLhOgbmFCEj777GHKRVjcAnAHBxm3yAJTsNtmrsIq24EXhmou1wyQ2dYAJn
	MC40MzHswGxAKG6UbzJ0LENZAqoVowdBr1zCRZ6jI9/UyBFdN84YYZeUPO3zCYiasWS6RH4RzH3Nq
	mhBwOdu+I5+2JTT9bIHWdWL7tQWcHsuIsrFTFqZpGAH4NqAcp5v0LlpMfLA3GZxvKyyHpXF8IEOfO
	dVHGEfww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHEf-0000000CAH2-0sp7;
	Mon, 11 May 2026 03:23:13 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHEd-0000000CAG5-0KiX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 03:23:12 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b4583f0a1aso23397415ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 20:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778469790; x=1779074590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z+2lgYT5AdwNVejrbpCLq1bID8j6vgX8/sYNGb+SUj8=;
        b=LPFbh+Re4a4QmMPpuZOOsFL+JAUb+GbZqrks8iSck9iRtXN0f76pJw+/NM/ng/HZV2
         qQ15/5cEu6hTN5H6z6XO0vFSXb8xILZPsA4j+H2/LRFPk8wnOB/G/lBCJ5yZdJ0SSb4U
         DovvCqUH+4gHxJYL4YVY/9q7HS2JfZE1UhPa/YqBsD+K4xaxd5IwE9n7JOs0QqhrPJsQ
         ny0T0hqfxBgZb/rRgOsrYxKitU7fIPDiueohmkpHt6mx8CvnoHE/50PhgMmcTTZ0r0Q8
         uXqcySbFRoIB395bMPZGX3jIh92+kxix6Iasr6lwSiFbtjygur2IuYjUj3rQlnUncK00
         FfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778469790; x=1779074590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+2lgYT5AdwNVejrbpCLq1bID8j6vgX8/sYNGb+SUj8=;
        b=kunDEbto8Zyit5ljfuHHQbNBvpTysk/spv0NT/DzXTIj/a1qdPwxC3aR6MxUXzF+jR
         V3Qg97cIO40tDbjPWglBcyq9UN9M8KiD5RH+MdQKctp8TGe4NwhtDZr/D/3Y92w9jvEK
         sw/9dU8piMIG8/HTQOelB8iNarrPVrus5zfv6jg7sYnCuGvaELtt2WRJ5bEkljwiWarN
         +itIG7Q+ES//hNYMeKsnjBjFOjgbKDdF1qsRqODcFQDwd2PY6RHrEqEThSkSs6IMltpa
         aTsLlmiyXa0FuqPKNYTimFWfd7B9ZwuGh3xbmJAu9PCqHc9CxwsMT75JtulfKxOBxXMT
         upvw==
X-Forwarded-Encrypted: i=1; AFNElJ8BxnkeXBt7nhgLciZ3zIb75YQd/7Owibdwm3JTo4eFqlQaCNVt3DunweZkX1QjwS0OGtKNkvTJsev0OKZdNtfd@lists.infradead.org
X-Gm-Message-State: AOJu0YwwW6jy3/kWTQRT+8ZyzPSoMKhnE8uW2rbnn99fLnbfiQRi20AF
	E6TfA/rTCdgstsByA9XajuK9P1iwVvf/Hc5fwkdvqlCp1O46+3aUOAIq
X-Gm-Gg: Acq92OFgQ/6byjuRYiL/b8At+gmZ8L8kL7TCT0WBgmEXOokVpz/uQUgyI4bzfU23G1d
	oteL78GfBgCBLrWSao7ROarLpO7EacPfvQHBDGrGs8hW03iQcFdrieQlmWGuMlBGe79ZiRXM6fy
	vYjzCPAzx5rA8fZYgVKPMWVq1zWFoAyE2LgeS4RpOPhN4rUAfs68LBSlNEU2DOyDDM4HrWQxx4P
	CgWFxa067TmNCR9VHrjKX3heTCXffJ31+u1Uk4m7B17dSoY05CUwOadUYCcdqXZMRqGRMVyYfGA
	K3GLuMeELbIL2WcbnB15ty2ZDDPaMHdcyJBRJBvFI5aSG+K3gWUgnAagSWMGpqkRZrDfZQsMqt5
	8CKOJuSXzMaPN44dw8NgAF1RbCRyPXQI4MFimEN/S4DBNBJ6Si1yx1JoZjdueqU0SP06K0XmaeE
	CWxueudalFGAMO1CN5mplt8QmGbWiKhKc2WIMsQ/K1sA4r7wZpiMLh/mjEBrMfTHmh07CIAW6BG
	37Xrd5sc/KpyUH9Jmg3zzqEu8OkLGRIoZc=
X-Received: by 2002:a17:903:3c68:b0:2bc:8f9a:3642 with SMTP id d9443c01a7336-2bc8f9a370emr72908175ad.16.1778469790096;
        Sun, 10 May 2026 20:23:10 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35bcfsm83911855ad.38.2026.05.10.20.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:23:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: rockchip: Use flexible array for clock table
Date: Sun, 10 May 2026 20:22:52 -0700
Message-ID: <20260511032252.361906-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_202311_116874_6B341D2B 
X-CRM114-Status: GOOD (  13.91  )
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

Store the clock lookup table in the Rockchip clock provider
allocation instead of allocating it separately.

This ties the table lifetime directly to the provider and removes a
separate allocation failure path while preserving the clk_onecell_data
lookup interface.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/rockchip/clk.c | 17 ++++-------------
 drivers/clk/rockchip/clk.h |  2 ++
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index ee8c79b938d3..dbb4b6f33abb 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -359,26 +359,21 @@ static struct rockchip_clk_provider *rockchip_clk_init_base(
 		unsigned long nr_clks, bool has_late_clocks)
 {
 	struct rockchip_clk_provider *ctx;
-	struct clk **clk_table;
 	struct clk *default_clk_val;
 	int i;
 
 	default_clk_val = ERR_PTR(has_late_clocks ? -EPROBE_DEFER : -ENOENT);
 
-	ctx = kzalloc_obj(struct rockchip_clk_provider);
+	ctx = kzalloc_flex(*ctx, clk_table, nr_clks);
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
-	clk_table = kzalloc_objs(struct clk *, nr_clks);
-	if (!clk_table)
-		goto err_free;
-
 	for (i = 0; i < nr_clks; ++i)
-		clk_table[i] = default_clk_val;
+		ctx->clk_table[i] = default_clk_val;
 
-	ctx->reg_base = base;
-	ctx->clk_data.clks = clk_table;
 	ctx->clk_data.clk_num = nr_clks;
+	ctx->clk_data.clks = ctx->clk_table;
+	ctx->reg_base = base;
 	ctx->cru_node = np;
 	spin_lock_init(&ctx->lock);
 
@@ -388,10 +383,6 @@ static struct rockchip_clk_provider *rockchip_clk_init_base(
 						   "rockchip,grf");
 
 	return ctx;
-
-err_free:
-	kfree(ctx);
-	return ERR_PTR(-ENOMEM);
 }
 
 struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 9e3503e2ffc2..d4033bf750f5 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -604,6 +604,7 @@ struct rockchip_aux_grf {
  * @grf: regmap of the general-register-files syscon
  * @aux_grf_table: hashtable of auxiliary GRF regmaps, indexed by grf_type
  * @lock: maintains exclusion between callbacks for a given clock-provider.
+ * @clk_table: clock lookup table.
  */
 struct rockchip_clk_provider {
 	void __iomem *reg_base;
@@ -612,6 +613,7 @@ struct rockchip_clk_provider {
 	struct regmap *grf;
 	DECLARE_HASHTABLE(aux_grf_table, GRF_HASH_ORDER);
 	spinlock_t lock;
+	struct clk *clk_table[];
 };
 
 struct rockchip_pll_rate_table {
-- 
2.54.0


