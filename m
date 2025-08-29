Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E181ECA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 03:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfKsJTdQgTKprCHDD3jSWtPOt7a36P0+9S4imFiAXj0=; b=fwyQTjwOVJc2Qknd6sV4KKu114
	GDc45WneHyqhMLCPUN5mMKJ+lDqDKqxaDMDrDJul2G9J2b/Xa362rr+vMhMVlKrRNKV7eW4zv49Vs
	OOtO+RtvFNsv49vS0k7BghYKsQylBDcPwplaHLJbVyHdSS2fNYvIWElOQ2ROgJqFB/Huftr/E5X4W
	qffgHAJapgF2hUd+xeAFmoJTZAcJTua6uUFNTdVMeD+X47/sIxvrk9QW81LmkdYrWus+ZPLXbyx2V
	pfzNB2qGCYohFRRD1AZu2xxRdusAYFeOFLOxYI0hyQqFiCFEgdOvIxW70pXPm9Kfw74y7bydKjqdf
	FbgDT/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urpx5-00000004ErI-3DnI;
	Fri, 29 Aug 2025 03:38:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urn8p-00000003tdo-22gb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 00:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfKsJTdQgTKprCHDD3jSWtPOt7a36P0+9S4imFiAXj0=;
	b=G4it6+L2P9exKqWSeeKwnAiO2HWPPOiz8nXNRSD0zFVYLrVft26L4TfKkb8Mh+X0zXAjyM
	BZYU9XN1MckNtLXahgGX/Mn/bRYddFZ+cjDyx7l2V1Hp66LGnABpVT47Ca/v8W3vjus4Xf
	a0p9MiKu/+IE3WN1ZRMmtapS704o8pM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-1XRKppkvNqa-UPMQTJTfmw-1; Thu, 28 Aug 2025 20:38:53 -0400
X-MC-Unique: 1XRKppkvNqa-UPMQTJTfmw-1
X-Mimecast-MFC-AGG-ID: 1XRKppkvNqa-UPMQTJTfmw_1756427932
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70dfd87a763so10979796d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 17:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427932; x=1757032732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfKsJTdQgTKprCHDD3jSWtPOt7a36P0+9S4imFiAXj0=;
        b=FF/jD6l1ht/jXoyH4TZFuMs+7Y9gnvVKcNXNfOCXIaXd3sb946KCcdxXKtbfIMUjqs
         JdqbZRJ21K6jTFRr9N0/GtNt0bu5n4o2ellfpE5641lnHci058Z/14jr8wqCYX0fxuEc
         K17xi5y/ni/rBKLL5O8AeTdOcArOWxGdO5E6TTEdNHd442KTU6Jl9YBF3UkmNiHNdTAd
         APaszQm7QJXve6VFLpT69qi7VIA3YxKkMRaItLdTmn7e01VU5Yd8lY3LN/Aco5PjG7lx
         SHNNkhud/cIeJN18aw++W2T5pIQQnXq6J/ETJ7GmdKNVfdBPNrLzv3jyQS9b9mf7HHZj
         tCcg==
X-Forwarded-Encrypted: i=1; AJvYcCWbEcHZPy+9OI5MtFqFRsRPV/YhXP0/ajXYsld9touItETUIXjSnRZAyEFK+NcGBCK8hkViukkTQFaLoZtkf9bc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj4gEsPNpXuPH3VtIJ7v0yaD1qNvUazDx4qHTTAhwTD7DBuTl0
	Q6+Y+rU1O66amxKWlkIfiw4jgSbdQYem/P2Ww5dDj1TLyrsrxXEIyCdlRKjTHoo7NZjH08DVsFk
	t5BaML42UdEPuvgdjUNnf7HqfFowyfg67piM0YaFTaZ77gfwf71s5rsquNWfduYAUrTGjLKn44G
	3x
X-Gm-Gg: ASbGncuQx0mGybLc4BpJXUJ5J/zHJzO/7xvdweAVfmIBXI/EJyWVxbUwxSCeFON7j9N
	sDn4jfoHdpbaf47wGGn6mz0qUd7KWZTUjDTNy2F2DcwowLKc6RPqMaSYFaCVK7jpYN9ZCW0+WJ6
	eBS2CcaZE0RYoh3PfXT7NKVsZ9DSedG8eq0qPlEpEtVGMAFhGWettW+ebmdwwgLu7OxeaUVmYk/
	VMaDdVyuTCODQaCliS1dKhkKZ2e0HKQaUc9ikiCN9H5KEVhGZnGpJhda6g/61d0PxrbNbdHjkrF
	uIiqnN9D77Mxu2hAuCGTttfurwEJSaNxgJFxETmra2myMI4iXLMokwOtndgFyiQ6SUak0GIPG2B
	eTAtaiEL9YTEUxrHYwkxsl1Snnvjv45u17g==
X-Received: by 2002:ad4:5ae7:0:b0:70d:6df3:9a8a with SMTP id 6a1803df08f44-70d9740287emr335625136d6.58.1756427932233;
        Thu, 28 Aug 2025 17:38:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwEc61ysJKMEZh0lWoU9IOEqRG7fUQ4re7qEY+oU+35ItiYKJvIfxusraAgiqWCmyxfYtUOw==
X-Received: by 2002:ad4:5ae7:0:b0:70d:6df3:9a8a with SMTP id 6a1803df08f44-70d9740287emr335624916d6.58.1756427931903;
        Thu, 28 Aug 2025 17:38:51 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:25 -0400
Subject: [PATCH 6/8] clk: sophgo: sg2042-pll: remove round_rate() in favor
 of determine_rate()
MIME-Version: 1.0
Message-Id: <20250828-clk-round-rate-v2-v1-6-b97ec8ba6cc4@redhat.com>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=2918;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=yQjDlKucQbDfv9rLtsx5KS2YxuVB1vqwKzuSAh7+mnM=;
 b=NIACu2uEJBGAECXwzUlTYQmeDeO89xJedpYWiz+3jVOZMhats8C5aEq2W9Xgn57Xm3aQE46TX
 bO0ZY19dAj/ACNhybTA+CdBVvm/B0H9sIJNyaJ+3B0kXEmy97yyk1w2
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i3Q0KAl6uusohvyxTzdBcphOwFXG-oeLIQDxfNqSISU_1756427932
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_173855_616586_79675A45 
X-CRM114-Status: GOOD (  14.32  )
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

This driver implements both the determine_rate() and round_rate() clk
ops, and the round_rate() clk ops is deprecated. When both are defined,
clk_core_determine_round_nolock() from the clk core will only use the
determine_rate() clk ops, so let's remove the round_rate() clk ops since
it's unused.

The implementation of sg2042_clk_pll_determine_rate() calls
sg2042_clk_pll_round_rate(), so this folds the two into a single
function.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sophgo/clk-sg2042-pll.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
index e5fb0bb7ac4f97616f3b472fcab45e5729eb653e..110b6ee06fe4b61e89f3cbf2ce00eb03c078afb6 100644
--- a/drivers/clk/sophgo/clk-sg2042-pll.c
+++ b/drivers/clk/sophgo/clk-sg2042-pll.c
@@ -346,37 +346,30 @@ static unsigned long sg2042_clk_pll_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long sg2042_clk_pll_round_rate(struct clk_hw *hw,
-				      unsigned long req_rate,
-				      unsigned long *prate)
+static int sg2042_clk_pll_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct sg2042_pll_ctrl pctrl_table;
 	unsigned int value;
 	long proper_rate;
 	int ret;
 
-	ret = sg2042_get_pll_ctl_setting(&pctrl_table, req_rate, *prate);
+	ret = sg2042_get_pll_ctl_setting(&pctrl_table,
+					 min(req->rate, req->max_rate),
+					 req->best_parent_rate);
 	if (ret) {
 		proper_rate = 0;
 		goto out;
 	}
 
 	value = sg2042_pll_ctrl_encode(&pctrl_table);
-	proper_rate = (long)sg2042_pll_recalc_rate(value, *prate);
+	proper_rate = (long)sg2042_pll_recalc_rate(value, req->best_parent_rate);
 
 out:
-	pr_debug("--> %s: pll_round_rate: val = %ld\n",
+	pr_debug("--> %s: pll_determine_rate: val = %ld\n",
 		 clk_hw_get_name(hw), proper_rate);
-	return proper_rate;
-}
+	req->rate = proper_rate;
 
-static int sg2042_clk_pll_determine_rate(struct clk_hw *hw,
-					 struct clk_rate_request *req)
-{
-	req->rate = sg2042_clk_pll_round_rate(hw, min(req->rate, req->max_rate),
-					      &req->best_parent_rate);
-	pr_debug("--> %s: pll_determine_rate: val = %ld\n",
-		 clk_hw_get_name(hw), req->rate);
 	return 0;
 }
 
@@ -417,14 +410,13 @@ static int sg2042_clk_pll_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops sg2042_clk_pll_ops = {
 	.recalc_rate = sg2042_clk_pll_recalc_rate,
-	.round_rate = sg2042_clk_pll_round_rate,
 	.determine_rate = sg2042_clk_pll_determine_rate,
 	.set_rate = sg2042_clk_pll_set_rate,
 };
 
 static const struct clk_ops sg2042_clk_pll_ro_ops = {
 	.recalc_rate = sg2042_clk_pll_recalc_rate,
-	.round_rate = sg2042_clk_pll_round_rate,
+	.determine_rate = sg2042_clk_pll_determine_rate,
 };
 
 /*

-- 
2.50.1


