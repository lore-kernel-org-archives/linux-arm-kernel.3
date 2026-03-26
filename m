Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71639109E54B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 04:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S8CT+l+wfSvXRtXeW5bTLnPhjYdMNmeNRgewcvM6cYM=; b=a4xJVeFqwTMvZCb9mgjw+prhtd
	1a/tmq47D+QEH3roTcVwF+OEAaPfRqZxnqyaJSo0g4M0LqBkbGAywtnlnjxipgDAG69sXbJtPzEIp
	HxeqnW5soeY6y0nB6rFkeyJ9hp/Cmro3OC/NuWzfmql37sLfaRcf5lg0wFSEOnaavEyXoPglEZwJa
	T0loG4L5Uqs4ckVNYAJxw2UpHNoonjmCMmxRzxVIEmj7MX/wvl3yUETeF0oc263j3tySZuAXSz2UY
	/7KS2kn3vbqeidksljHqpsr/bnraC62m0C5rRebJ3nNYnzzm7hi4LV2NQlfI9g8FoITW7A24U1fyN
	T6uc0cjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cj3-00000004h47-21F1;
	Thu, 26 Mar 2026 04:53:45 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cj1-00000004h3m-0e0e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 04:53:44 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b062069f80so3282095ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 21:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774500822; x=1775105622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S8CT+l+wfSvXRtXeW5bTLnPhjYdMNmeNRgewcvM6cYM=;
        b=rP0gQnylmi7ZJvG/42rtbfWN9TOtPvFujq6Ff/x8/nS5EX9OxIzpPtAsLntjZ5a5XD
         EJZc3uNcbGAPB8v0kJPEFqHQnOjNyoPyfOhE7/B3W1i3dkcPSbcC/XSsll/lTdO5luFO
         PXd5VR6bJeBURFiFVWitutiSmOm+v1ifyo7wM8qeDRR5FcXiEoyT4spHKWaA0ZnSvGmt
         MYYMym0VxADYGve1O/5p5ekKVj+IQnOnGwCqV6BQW2fK8lihTnDI9ShZCEJ2P/9VKeNx
         WaNBnz2dR1gINkIddUncxQNsTVho0PxzIFVSW9zHjt7nrTb14HQHgI4nr5z7vgFhZY8r
         EBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774500822; x=1775105622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8CT+l+wfSvXRtXeW5bTLnPhjYdMNmeNRgewcvM6cYM=;
        b=NWNO7C+kn2iZE/Zr17HvKsv7jGSui0PZRrumeUAnAkIP1EmIgM6UG8aAZNXcHEbEXj
         vf/plU8fiKkAKapC+VZS5Z1+frMN5IBWTnFoZjziECR/alUt5mepfz2mzp6kanqBEN/F
         hJRh7LYfpWMR5uxZ3//yDRz3ekPlFWuGFsopDHtCguWeyjkJBRjfaUGDlP/rdGOBK/ro
         1+2QqHyqgOyR2jtKv1RdnEwhYMSu9VLtl/xgxJI+UIpExhLa/o3Wx/LMx6qz1VcOaYe/
         EN4s5MLOXeFyRvEQC33Cc3suYBMIPpfcaecMSxN+FVVRv0VYjvS6wOksy6nwGx267fin
         DGEg==
X-Forwarded-Encrypted: i=1; AJvYcCUSEURk5L7+pjgXayLtUjz6AEe/q869viV0xqwIUNt1AmeC2xPGvjZ8UvPcLVW09WDHaiMKLaNEhrhl1QJu9VJ8@lists.infradead.org
X-Gm-Message-State: AOJu0YwPyKVlMD0DzClz/buJv6veMNj7NYP27g+uJp/9aa7zEs+oTGy4
	nTF4EgjnqTsZqobMQBamXlXQhh8oUnbl377WKE5iIkPDIWfbYZhNHioj
X-Gm-Gg: ATEYQzxeq63pKw+1cTvJ/+QsIGtK1/ZLKr6WtJ16IPU9v3+GC+l/pxtAwpFCgFJ9DDV
	Q2jy0doycfOzrfA6qPaW73prUwQWD3z350XE84nhQeN2MfTthmk5Zj/eHi1+j3kVE/fMEKRlG+j
	HWCTwLh0ClKGLkh8LkgibvEzG6Le1BEYCsBoZ86gzzoSrA+vDVUEsXhjVgp9eVvZrZRUIpWgVzR
	REgQZ6336pkWzu2E3hVVnH1PvEz5hN1QV3UnYnyNEpRUBn+K/9cHsmjjYKLBg3gb6KKz79dtgEh
	C6LUEDqJ+al+8H2ajiBzB1qKcQukvACLa+b7P1txThh/PEgengPnGxSRxPAjDwRv2RomJugoUp4
	AaoV/ilUTfPD8BZUW+CZQr4DBQQcMvtCDXdxKuRAfznUe1NYAguV1ROmYaSPcq4eVqPqMRmM+Ih
	Uc1N7hG19Ua4gFklXwZiirHBqof8ZwGIBpqhaabvnCF+WwcOFSC1zA6Jc=
X-Received: by 2002:a17:903:3b8c:b0:2ae:5a55:3ded with SMTP id d9443c01a7336-2b0b0b23849mr67968835ad.45.1774500822031;
        Wed, 25 Mar 2026 21:53:42 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7add48sm16079885ad.30.2026.03.25.21.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:53:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: bcm: iproc-asiu: simplify allocation
Date: Wed, 25 Mar 2026 21:53:24 -0700
Message-ID: <20260326045324.240150-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_215343_369089_CC768F4C 
X-CRM114-Status: GOOD (  11.80  )
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

Use kzalloc_flex and a flexible array member to combine allocations

While at it, take clk_data out of the struct and move it into probe.
It's not used anywhere else.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/bcm/clk-iproc-asiu.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/bcm/clk-iproc-asiu.c b/drivers/clk/bcm/clk-iproc-asiu.c
index 819ab1b55df3..56a813227981 100644
--- a/drivers/clk/bcm/clk-iproc-asiu.c
+++ b/drivers/clk/bcm/clk-iproc-asiu.c
@@ -27,8 +27,7 @@ struct iproc_asiu {
 	void __iomem *div_base;
 	void __iomem *gate_base;
 
-	struct clk_hw_onecell_data *clk_data;
-	struct iproc_asiu_clk *clks;
+	struct iproc_asiu_clk clks[];
 };
 
 #define to_asiu_clk(hw) container_of(hw, struct iproc_asiu_clk, hw)
@@ -184,22 +183,19 @@ void __init iproc_asiu_setup(struct device_node *node,
 {
 	int i, ret;
 	struct iproc_asiu *asiu;
+	struct clk_hw_onecell_data *clk_data;
 
 	if (WARN_ON(!gate || !div))
 		return;
 
-	asiu = kzalloc_obj(*asiu);
+	asiu = kzalloc_flex(*asiu, clks, num_clks);
 	if (WARN_ON(!asiu))
 		return;
 
-	asiu->clk_data = kzalloc_flex(*asiu->clk_data, hws, num_clks);
-	if (WARN_ON(!asiu->clk_data))
+	clk_data = kzalloc_flex(*clk_data, hws, num_clks);
+	if (WARN_ON(!clk_data))
 		goto err_clks;
-	asiu->clk_data->num = num_clks;
-
-	asiu->clks = kzalloc_objs(*asiu->clks, num_clks);
-	if (WARN_ON(!asiu->clks))
-		goto err_asiu_clks;
+	clk_data->num = num_clks;
 
 	asiu->div_base = of_iomap(node, 0);
 	if (WARN_ON(!asiu->div_base))
@@ -236,11 +232,11 @@ void __init iproc_asiu_setup(struct device_node *node,
 		ret = clk_hw_register(NULL, &asiu_clk->hw);
 		if (WARN_ON(ret))
 			goto err_clk_register;
-		asiu->clk_data->hws[i] = &asiu_clk->hw;
+		clk_data->hws[i] = &asiu_clk->hw;
 	}
 
 	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
-				     asiu->clk_data);
+				     clk_data);
 	if (WARN_ON(ret))
 		goto err_clk_register;
 
@@ -248,17 +244,14 @@ void __init iproc_asiu_setup(struct device_node *node,
 
 err_clk_register:
 	while (--i >= 0)
-		clk_hw_unregister(asiu->clk_data->hws[i]);
+		clk_hw_unregister(clk_data->hws[i]);
 	iounmap(asiu->gate_base);
 
 err_iomap_gate:
 	iounmap(asiu->div_base);
 
 err_iomap_div:
-	kfree(asiu->clks);
-
-err_asiu_clks:
-	kfree(asiu->clk_data);
+	kfree(clk_data);
 
 err_clks:
 	kfree(asiu);
-- 
2.53.0


