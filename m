Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02CB109E547
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 04:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uePC4t9zYdAqfWmLVP6FLg/cJ2NqG/wiW8h1ArBlvSo=; b=D/ynd9Kfdwt1/T4eOLQpYh5i8n
	R4wIl5N13w4EuDSbWVp5jQy7Q66yA/9YbXmtGvjY4F4VZnMmxNi87IAOFuOwDQS6Vu7nL7o6lS4aK
	95ADwR5RpnOuttJdhk6GSpwG4Rj5KJwLaIXcVcQEsHBlUjOeG6w/mz9qAX8TWtW+py8tXdRiRch7+
	AKq+lm2DkurM8rIOGmk7DUBKuC7WeF5LHJ7UKh+5mBtZxCptGN534nQtBvrWUOKhEenb9TUSvbDsm
	tp3PMsGcRxFI3GFpCKf+OjkXIMKd/9sK+f+Cm85qaRyYbiDEKLU1HZOvwDlP6C65eqiA8nZussDkH
	N+SlRc3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cFv-00000004fWZ-1g46;
	Thu, 26 Mar 2026 04:23:39 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cFs-00000004fWD-2k7a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 04:23:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ad9f316d68so2582475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 21:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774499015; x=1775103815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uePC4t9zYdAqfWmLVP6FLg/cJ2NqG/wiW8h1ArBlvSo=;
        b=krjnX1UZ9FF9SPRVmrHPmz/GeWclnhvtqW7DBDW1aGOpqzUmcMJf2xom1AYTJSoGrw
         b4hSqusRSkpwXhBHv8XFr+2eJi6dXECZ9/Bp+uaqCFetKLHvmyg5IBOLIWGrjg+0WynR
         uG895DmYoBOqAkA4M3Q3HrCapKggZHKAfrmVZKHlz3MQ8pJOZ21zdiadIyXjapAr3glV
         fCIbw/rIo55/lqgo1j3+eUSUXwCrQdUXiQh60TdS8iT+mtmaavn9/C/Is7FKfWzDGK8T
         91SmXXbNoie8xS/q5GjTQ98Cva44bmIJ/Wc6ocXqJzt2z4w08cULLlsZ9OImFTos+tYk
         c1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499015; x=1775103815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uePC4t9zYdAqfWmLVP6FLg/cJ2NqG/wiW8h1ArBlvSo=;
        b=CEBZTSgZm/Xn8YkYmGTPnijXOsipfZG4jf6EDptgpOhWW3GVTxi3JZZlXjDkM7io+u
         Wf6MCqkxYdC8r3U91lSqsBfHmylgAZk5eWffEQEpmVrjYdFRzsl1PIhY3hLxN8u0T3q1
         7Y6/90FYxHHn+UoJuvlGXVc3JENyZzHIsPyc1Q4hBphgXP6tokX5nGkkiYsKlGCa3k1L
         NXYZuEh7Xer4R1ytrSncDY3lrjhl7YU857SePY5QJKyexQjXWwj0R6kqoXj8tfIEIgtq
         9FywFNqCnM/uN+1oU1FUuZwM3gc5zP4nmbRz/f6Rc3Sw7kKobjLGjB/5Ykt614BfiTiJ
         /k0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjQgjGVgLtZDdLZKrptnxuUBiJyQxf7a1OBHXMQqwBbF/w76SUzBvSTNbcvEn/BWaoD4FMWEVwFF27jfq0ENmO@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmv0MjvjjTpvIJuKyOQDTj7v+0Qj6zN5ps/IEKZsHKcdtop0lI
	3g9PMvR2MASqDEZJ7Vvz+M5ATVWxE3rfYWRRrAMN/dnIXX/4qpuUhTp6
X-Gm-Gg: ATEYQzxcT55sMzC7ARUlxr8PHti1A5log/rWGb7+hmkaEtXb+JKSyWPjW1k1rvVtDmv
	/2hk8gvb+kBkRBdDpQtk1blWSm7FhdBdwE2BJwqmgX3KsO6kwIVbAY8QMIbC/mfxzSkLWe/GspI
	2IyKVVDxg4DjSuL3PtbfqDDx4rCaUsicY88f3txQrrXaq00jI+f7gdHu7Xd6rldf03dMjd5F7XO
	XYa5jsmXdLJ1r5WjdMDZP/JRREJrbv2AAqgqeXgu0k1qWb21uzvlHFBe4PlW7yrdW9TYgckTVsC
	/I5adELTIqqfrKVUwV0UNzDYci/WXbu4AelIuYWm054yqt0jIlz1yEh4e05mvobJq1iaMWjMZSZ
	OA7IqF5gtevh2q+EaTnDDpIK42CED8Rs3Wb5y9OqpimpDIVJrfDMRhrCpHX+P1cwT/NfMQPuVeN
	wZ7jdHi2orGZxh/WwF3L5/YCdh8KhsjGBLccm/6izVJUorYmNYqzs5SnE=
X-Received: by 2002:a17:903:3b84:b0:2ad:da28:98d with SMTP id d9443c01a7336-2b0b0aa685fmr63377505ad.37.1774499015189;
        Wed, 25 Mar 2026 21:23:35 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc883c0asm15566685ad.45.2026.03.25.21.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:23:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/TOSHIBA VISCONTI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] clk: visconti: pll: use kzalloc_flex
Date: Wed, 25 Mar 2026 21:23:17 -0700
Message-ID: <20260326042317.122536-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_212336_877401_0BDEFDE9 
X-CRM114-Status: GOOD (  12.14  )
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

Simplify allocation by using a flexible array member and kzalloc_flex.

Add __counted_by for extra runtime analysis. Assign after allocation as
required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/visconti/pll.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/visconti/pll.c b/drivers/clk/visconti/pll.c
index 6fd02c4b641e..ca29d12f9316 100644
--- a/drivers/clk/visconti/pll.c
+++ b/drivers/clk/visconti/pll.c
@@ -21,9 +21,9 @@ struct visconti_pll {
 	void __iomem	*pll_base;
 	spinlock_t	*lock;
 	unsigned long flags;
-	const struct visconti_pll_rate_table *rate_table;
 	size_t rate_count;
 	struct visconti_pll_provider *ctx;
+	struct visconti_pll_rate_table rate_table[] __counted_by(rate_count);
 };

 #define PLL_CONF_REG		0x0000
@@ -255,10 +255,6 @@ static struct clk_hw *visconti_register_pll(struct visconti_pll_provider *ctx,
 	size_t len;
 	int ret;

-	pll = kzalloc_obj(*pll);
-	if (!pll)
-		return ERR_PTR(-ENOMEM);
-
 	init.name = name;
 	init.flags = CLK_IGNORE_UNUSED;
 	init.parent_names = &parent_name;
@@ -266,11 +262,13 @@ static struct clk_hw *visconti_register_pll(struct visconti_pll_provider *ctx,

 	for (len = 0; rate_table[len].rate != 0; )
 		len++;
+
+	pll = kzalloc_flex(*pll, rate_table, len);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
 	pll->rate_count = len;
-	pll->rate_table = kmemdup_array(rate_table,
-					pll->rate_count, sizeof(*pll->rate_table),
-					GFP_KERNEL);
-	WARN(!pll->rate_table, "%s: could not allocate rate table for %s\n", __func__, name);
+	memcpy(pll->rate_table, rate_table, len * sizeof(*pll->rate_table));

 	init.ops = &visconti_pll_ops;
 	pll->hw.init = &init;
@@ -282,7 +280,6 @@ static struct clk_hw *visconti_register_pll(struct visconti_pll_provider *ctx,
 	ret = clk_hw_register(NULL, &pll->hw);
 	if (ret) {
 		pr_err("failed to register pll clock %s : %d\n", name, ret);
-		kfree(pll->rate_table);
 		kfree(pll);
 		pll_hw_clk = ERR_PTR(ret);
 	}
--
2.53.0


