Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA68C1061B20
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 20:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QuBN5LC4CCoVTyDBa2ABz4OuVl7GEpGiv+ePoy4pqeE=; b=4ItyDwka8GWMi0KTXJchQdS6KJ
	jlX7BFxgHRhcTs7RvHlsRX6flD9Wcq4BVqia4TDAdXBTfO9QhszIsBMiCRtcFZyShW/M/DQgZvrjT
	irDWiJCyU/qNIWCqbckST+iY1ga/M5vfnlcfWnIoZE8VlnyNQNPgAd/n6Y91PrS+IL+Gw85lMBvZ5
	Zxmbs2QbejU2QLL1pnWwyIDt+h5Z9v1d9cDrS52uS5J63qBQbZ5QqwbwZ3l52DLy0xzHW7YTnMyEF
	fmM/tb4fqLaPo1gTwzIpjxkGaR6zNxpmYRVbMfY8DWAvDN5NwNhVj6IJUfCCBtZ4Hhn4NzffZeWEm
	JdsnK9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Jdx-0000000BsPf-0qdG;
	Mon, 30 Mar 2026 20:55:29 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Jdt-0000000BsPF-2qyJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 20:55:28 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2b258d93ffeso6533805ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 13:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774904122; x=1775508922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QuBN5LC4CCoVTyDBa2ABz4OuVl7GEpGiv+ePoy4pqeE=;
        b=AWz76J2WH9GKaikfOOAOjP6n9SR2qGcjGjNZbr7rf3AHEXiv7G+S1y2Ib/fb4KR6dF
         McXIjD64BOp9HCDWZ/sLj8LVgkUt8jY10Tl6cb8+EhA+ctKcsSpoOrCnvi0AJaNCWN3q
         cUNnvFDbHxnrQwNn5+MtSxWc7NKuzSY/4urt5VwZRjzBSt97e2Precw/NOcTvBp7JqNJ
         w75TpxVweNg59GIgr6YbsOVl7pveQaXOmha9/RCEx45a2iHnBfKPowXu3kZiTi9p0xxP
         EY1Av72Hgh8gBGwNqo4UN/8WLXGBsQtU8sMcZxhwpeLt9bY79jpUtRFDFU6sila9+lvP
         hTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774904122; x=1775508922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuBN5LC4CCoVTyDBa2ABz4OuVl7GEpGiv+ePoy4pqeE=;
        b=NrCU5CC5nmE2FkMZysgkZOb4t33EcTzrfzS1BMGhlrn+PhEzpwAEgHOMnWWwZVcNVS
         Qm9wmLF+tFD+tjgQo7cx3C/JcLLb7vzkv0o3ViDTkAz/ZEv+VEr9jlYcrVXDF1QxESZ9
         P2Yp6DiRMrrwNJW/Bm4a+OuYOJ5lclH1B+rfSE+2twGRbe/whSK8O+G7KuZTvSVxZ6tx
         W5d3bOEd//UodTyzlOQTEaB/MDLdj9x1aQ5GjL0FOVnq5Vb/EydX2DXdImtoQ5k+GrNB
         cZ2szRSLTGnNYLd1rVFcx/Lcy0RVA0OdtutLQcl408rpnax3qfsUuUTL3+GF+2SEP1eE
         BydQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAhS/RFe6dRggQiGwpN0cW1oqMizfeDwqWLDKIIrSessEHYSdYjEI7cmEL+YFhjQYG2xYxCLs43hglgN7wIvqx@lists.infradead.org
X-Gm-Message-State: AOJu0YzUQw/ZSkFYteKKJJzxVBrZBKeYsB4o6JQt5D6GeXO7xcYT4m/U
	7HLbrZ7z0tDls1zkdcLmr431CMp8Vp0rOJu3uEw07ZLK5o71MsQDsmYs
X-Gm-Gg: ATEYQzxUglwqYTVY3IQXHCtPGpQGxAgTVaOSnsJpuzkFIVUlmnL2BA0mkwbvIehm8q3
	GRicvQrhO2ZtiwpK6Wv4SMywadld2uKfc06QiJCu+V29hUBA8l2mWGiewYMQfuiRtkEsApgbSj0
	fKp25KgLIjWFQMsEcGjuiFFEnzqG6E5VZVfSceHQDeVSXf2bOfMRNJbFhTRVTvJKABj+2GWOdU+
	VAye1MGZy2LVLPdCBhBXApUkCBo1yJGlVuph9rzCsEEQf0CHn47BmFQVFT2mFh96uQZodxJYc5H
	1eM35cg8Drg2RvfzqjWSf35yWdksMRjdOB5H77FZhWKfSoajridlurP3vt/2q+zse37mGoJNTSP
	G6kqMVO+ITSdKvkCA8EsdWn8P/2bpXS7ckr8eZbO9On1lu8VwYwMjEvOBGLCVKEr5alEwNFm84p
	E1QanwRKgrR9Yo6q4vs97Rl0MXWFY3sM+OHf+SJP3zQp9FzUUKXldfLJU=
X-Received: by 2002:a17:902:ea05:b0:2b0:5dcb:84cb with SMTP id d9443c01a7336-2b0cdc240c6mr134127465ad.2.1774904122159;
        Mon, 30 Mar 2026 13:55:22 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642887sm104673825ad.1.2026.03.30.13.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:55:21 -0700 (PDT)
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
Subject: [PATCHv2] clk: kirkwood: use kzalloc_flex
Date: Mon, 30 Mar 2026 13:55:04 -0700
Message-ID: <20260330205504.10143-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_135527_214231_8C4BF350 
X-CRM114-Status: GOOD (  12.60  )
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

Simplify allocation by using a flexible array member and kzalloc_flex to
combine allocations.

Add __counted_by for extra runtime analysis. Move counting variable
assignment to right after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove unused goto.
 drivers/clk/mvebu/kirkwood.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mvebu/kirkwood.c b/drivers/clk/mvebu/kirkwood.c
index ed061d82fb65..f4f62b241193 100644
--- a/drivers/clk/mvebu/kirkwood.c
+++ b/drivers/clk/mvebu/kirkwood.c
@@ -253,8 +253,8 @@ struct clk_muxing_soc_desc {

 struct clk_muxing_ctrl {
 	spinlock_t *lock;
-	struct clk **muxes;
 	int num_muxes;
+	struct clk *muxes[] __counted_by(num_muxes);
 };

 static const char *powersave_parents[] = {
@@ -297,21 +297,18 @@ static void __init kirkwood_clk_muxing_setup(struct device_node *np,
 	if (WARN_ON(!base))
 		return;

-	ctrl = kzalloc_obj(*ctrl);
-	if (WARN_ON(!ctrl))
-		goto ctrl_out;
-
-	/* lock must already be initialized */
-	ctrl->lock = &ctrl_gating_lock;
-
 	/* Count, allocate, and register clock muxes */
 	for (n = 0; desc[n].name;)
 		n++;

+	ctrl = kzalloc_flex(*ctrl, muxes, n);
+	if (WARN_ON(!ctrl))
+		goto ctrl_out;
+
 	ctrl->num_muxes = n;
-	ctrl->muxes = kzalloc_objs(struct clk *, ctrl->num_muxes);
-	if (WARN_ON(!ctrl->muxes))
-		goto muxes_out;
+
+	/* lock must already be initialized */
+	ctrl->lock = &ctrl_gating_lock;

 	for (n = 0; n < ctrl->num_muxes; n++) {
 		ctrl->muxes[n] = clk_register_mux(NULL, desc[n].name,
@@ -324,8 +321,6 @@ static void __init kirkwood_clk_muxing_setup(struct device_node *np,
 	of_clk_add_provider(np, clk_muxing_get_src, ctrl);

 	return;
-muxes_out:
-	kfree(ctrl);
 ctrl_out:
 	iounmap(base);
 }
--
2.53.0


