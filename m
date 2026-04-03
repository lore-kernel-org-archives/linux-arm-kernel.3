Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A823E8538E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 19:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VsvDVL5tc5VALviYh62qkT8pA+BxF0TiR0JTDFx2wc0=; b=YDVsDw23i48wIpGM9YFokFcTAj
	etC8yIHL3hQW2mKT4tFtcUfgRJdU2YZfxZ5MY4wv/xHGlcMryR/+Wu9KeqapPGh8of7mha7QBQpXn
	a0jOImn+m0WHdLQRNjMVIcQE5RnYVkNWfo125lYdYqiE7kdQbuMfUXA+SEge94QwR1x2Tk/BkIhEo
	Vh2YxyZm0WLelMOXwQnq+vRLGIS1tzhDEigTp1HHdqXUWsGMI8tGqkl20s4xadbBE3y+1hYIdkhTh
	JEMjGo8UmLTfV+GikMJqExtNkzLwwBLy7/MBcWChSxyIGxeLiPNXWKqd8JivjYlFYW+R71ffiQrBg
	3h5L70wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8kUG-00000002Vg8-1RoT;
	Fri, 03 Apr 2026 19:47:24 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8kUD-00000002Vfn-3iq5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 19:47:23 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a871daa98fso17079765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 12:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775245640; x=1775850440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VsvDVL5tc5VALviYh62qkT8pA+BxF0TiR0JTDFx2wc0=;
        b=YW2274EQGgoFffqwnjaMBDim7r9BXEep0yAun97iGWBvwWMfbn32kSfXequdllg2SI
         zqyo845/NdTBh+BvDamyRBIWFS4jsQ55CKOunrf6Bm8dadI9r5qmw4gAdM2el9xKA4KL
         4sAlm57gm0ULHGOFYaeYK0qdaeyShVpcq9V4nFLNs47t+RB5JspF8xXdX8R9KRoiJTmm
         abX8v2hVl/lRby8kWxWKwTnwqumICkAkVDNxMiLUtn2SQKCPzGZvbu+vmJk+f2Or6d5W
         GrbIHPH1zwUiPEd/L8olLznI2cbW4szyvzaPw88oleKf4bzQ8F6juBLFyZqvvrrc6QWw
         OuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775245640; x=1775850440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsvDVL5tc5VALviYh62qkT8pA+BxF0TiR0JTDFx2wc0=;
        b=FcZvsKHELHGbtNeNTfotocPbFNV9ePRjfgABrNUZbBiDBSXSXejJz20t3pfyvS/2Zf
         NYsePV9KVSNXRekHmTJdr4cxr7dzHTM3KXO6vlqmWbn/gtnQv6HDjhTgXfIOcMbsLbBX
         59kEBlcpIWZWQL7ego4sKFEHd0vEbXFzQHhKvBHMoElxElojvGaxYpDeK2JXRUHeJzcb
         Q6clAQrCUgDKNhij7m28+OYFCLEUO4EeA6CtSptWvS/WgoGjuRUY6NN3tT9MNqG9Yc+f
         34k5575kKrKPve/Mz+cTaBRUosg6v17PdQXCBqQTESzG54dBVhhfi2C7zRYwZw5RAzWa
         Oz5w==
X-Forwarded-Encrypted: i=1; AJvYcCVxHVigkL6RWMMcp9XfkSV9XO96edWehM8DtK6sd89lhlyVVIr9T8CvjTvvKaMeAzcLEc0yIAnCYCwWdJoDFWPB@lists.infradead.org
X-Gm-Message-State: AOJu0YyIOnbTcTolDP57zq3S+77YYyh83ceV7DneGgwufDYJqV+/F3vh
	JwJj780YwAi7kc2RrDohdlQA7UHP7Ojw6S7QZ45CA6lb9jLY6VQkfNjhriZvLw==
X-Gm-Gg: AeBDiet/RblDVBp/wGT/tIoDZ3qOFh7NW6DpXHsRnI26o2/CPnt+5mXELYut2hDDGL5
	J6ic94M/OO9/5giG7dDNmh4X+cdTWBe+caAmQWx9Q2+hTde3XDmif2i/M/0IIbabm7T/56avC6t
	kga4AghBdMoD2YRvd3/C6xFuZdAOM7uJiSrPrRgVVDIWPj9HUMaU64uFxWe3gF88mxZdlxDk2og
	IFT4wD/Ts4FH8p/mCZux1h/J3matndHbeBLpOiLatuQ9BKAqsWuQBg4RCdZFsoeSN5TZG7t2+y5
	uOtnpYk29xF77yXZZQKF1UuSujvwzSwgEmsl8aToVaWnj3PwPPx0na8JovglQ4ar8PrXU3/yhrO
	zJV1LDNgbeVwKgydUb0FILMBXTwXNsIH6YqRHLp88FT2f2WpC/cdAGr/YS+Kjne6JXoT+3q4xF7
	PiIXflnJNuhct1jCPcfgpJxl4in4D1peNZUUh4vRA5Sb+yW2SUkn0sOP4=
X-Received: by 2002:a17:903:3c6d:b0:2ae:8272:deb0 with SMTP id d9443c01a7336-2b2817361c8mr46732635ad.15.1775245639256;
        Fri, 03 Apr 2026 12:47:19 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d54bsm62706225ad.1.2026.04.03.12.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:47:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2] clk: mvebu: use kzalloc_flex
Date: Fri,  3 Apr 2026 12:47:01 -0700
Message-ID: <20260403194701.11902-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_124721_955462_75D564F7 
X-CRM114-Status: GOOD (  11.91  )
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

Use a flexible array member to combine kzalloc and kcalloc in one
allocation so they can be freed together.

Add __counted_by for extra runtime analysis. Move counting variable
assignment right after allocation as done by kzalloc_flex with GCC >=
15.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove now unused goto label.
 drivers/clk/mvebu/common.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 28f2e1b2a932..0f9ae5f5cefd 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -189,10 +189,10 @@ DEFINE_SPINLOCK(ctrl_gating_lock);

 struct clk_gating_ctrl {
 	spinlock_t *lock;
-	struct clk **gates;
 	int num_gates;
 	void __iomem *base;
 	u32 saved_reg;
+	struct clk *gates[] __counted_by(num_gates);
 };

 static struct clk_gating_ctrl *ctrl;
@@ -257,24 +257,21 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 		clk_put(clk);
 	}

-	ctrl = kzalloc_obj(*ctrl);
+	/* Count, allocate, and register clock gates */
+	for (n = 0; desc[n].name;)
+		n++;
+
+	ctrl = kzalloc_flex(*ctrl, gates, n);
 	if (WARN_ON(!ctrl))
 		goto ctrl_out;

+	ctrl->num_gates = n;
+
 	/* lock must already be initialized */
 	ctrl->lock = &ctrl_gating_lock;

 	ctrl->base = base;

-	/* Count, allocate, and register clock gates */
-	for (n = 0; desc[n].name;)
-		n++;
-
-	ctrl->num_gates = n;
-	ctrl->gates = kzalloc_objs(*ctrl->gates, ctrl->num_gates);
-	if (WARN_ON(!ctrl->gates))
-		goto gates_out;
-
 	for (n = 0; n < ctrl->num_gates; n++) {
 		const char *parent =
 			(desc[n].parent) ? desc[n].parent : default_parent;
@@ -289,8 +286,6 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 	register_syscore(&clk_gate_syscore);

 	return;
-gates_out:
-	kfree(ctrl);
 ctrl_out:
 	iounmap(base);
 }
--
2.53.0


