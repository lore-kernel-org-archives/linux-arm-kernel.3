Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DB0C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 11:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S+ws8im8ohTlJQtEnzDmiWkVTfAf613mtu+yQQ/ls+Y=; b=Vrn8v5UAHlH5qmd48H5690E32u
	S5ny9e4VNzAPKaGxTatyMfdVZeTvXi34dWFvniT5joIguLXZ5u7HNx4oWYc62P8aV7TJASreEGW3x
	X8hnIcbVYPmIWEcCAG9ruG4AcEfNY63fjR6Yo6UYr0VmpacOZxcO8BNcaB7KhRa/jSvclf1MoOGC6
	EHvROxXvxXPHsUvVrdSMasiOHZCakTMs10PAE2TjlfRwTv/Bb0taHjVTKcwNfBuZHu8fxo/RA64j1
	sNeKbfw78CfmUu7EFtJGmwMZtKtPRlhtCK5RQl4u+F8/lNmcHx3fUFpidVtCpc9BhrQNWkBltvwGw
	rXAiQ+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZOO-00000002iLA-23Yu;
	Tue, 01 Apr 2025 11:02:52 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZ7e-00000002fTy-3NVM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 10:45:36 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-22409077c06so145413415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 03:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743504333; x=1744109133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+ws8im8ohTlJQtEnzDmiWkVTfAf613mtu+yQQ/ls+Y=;
        b=Eej/rhtFRVTw7j7S1HT9GBVwmn4BrTheZ4NRn1Di+33gvI1R51EnuYyCORqv1iRPVC
         5aAhS/r/Rd2ymsKhBUsYsL1tgvIYbaKGgpWXRsKjWCG59cGx25EZsG2WVERUagMp5/Bo
         otWBC27pO9MaWj4nN3/anufJB3h1lh/AvRJtvkiYetAqCojAD/UB2feRU3EuqDaol1/K
         6oKbsPg8zswsRPIBs3QOIZewVEXm2ZNk8Mt4xXnmFIcGMYCD9XjsoDy5OPQ9XDXZ6a8H
         T5TmuDG3BssReEB0tZzwH5MrvUPEbkSRmiu9lxE0g0W3+Kr4eSa8Mq9Dau1VDQB7A7Sf
         kzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743504333; x=1744109133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+ws8im8ohTlJQtEnzDmiWkVTfAf613mtu+yQQ/ls+Y=;
        b=MM50f8+B+CXKTDHoTxpomYkIwDZMBYBTCuhAco1RbmjHUC9qZltHs1imT2C+F4q83T
         +AcJQhnOGeF5yGu1y1ffUvqQTbEfsQGuu9Qgde+0YUAIddxPeJYMfUl4n0huWDompeMa
         bM7HyOB148tkzYxfJfRu3apLgP/f7XSOlnwxdJhV5ZNbQKfBly/1IhUiJwqURXAYJbqY
         PomsqSqsgzVzmeHvS/DNQn+Z5al70ZIB1Te/Q2307MCLya0tnWVLWoBj0pT4ifwMazxs
         F1nE0s6e3fjZoVy+7yb11EaI/V6Sy2jEhQIFHuyV1LeZzkIv8I3qxyzUyUv/0RHnEVoZ
         EM3A==
X-Forwarded-Encrypted: i=1; AJvYcCXCsKjl42Cy72WvbzSObPP8+5g21ghFbnxNl6wX4IXm5CCS3NFeEXTgALkZbqG7+fjKA6l2lefLkWLPVuPod2RH@lists.infradead.org
X-Gm-Message-State: AOJu0YyKpZ3magOjn64QtkAuavPTdsDEw7rQXsBFLVB6advOOjyGyMQV
	uF7KZZEMpgXNMojkvQP8+EWn6nLgfLWsQg59ik7ye4Ujlzedc6Vs
X-Gm-Gg: ASbGncuznPwKSrMgWdK2rChCg8XLZDO+hMEgepXw6809kGbZDlAA6HvSrLRtTEwWIB8
	rmmOJGEuf79VtcvBRX48fYoH2E87WeFCUhoXHFF7j5oVGYr+FO6nKkupQDgCYiFoz0C26GMZ0pN
	GK9JziNeAKkU2ESMCmwTScLEUZBoPfCZaxrHPVhEXxURwG+bifM0g6PqefJTXsWkgKVdpXIbW/0
	PIPbOeW6pyjQSo/tntQs2vqNsOAKAZZMsI6nwERHCT+cuvJL8IyI8/isn/4Xh0hoxm9Yeu62xtO
	TNK9ZCJ6chEHnJ0QYh0JFpn11+tS357Y58SbjH5c3LM0i4v3ooILqsLnr8FGpx90qpvQ7/4=
X-Google-Smtp-Source: AGHT+IFiE33VzXMHFadbE/k13q7hzIvU2xHpjvXzKZJeSnDxESI91BfikXodcenS9QgtP0ShUFDirQ==
X-Received: by 2002:a17:902:da88:b0:223:f408:c3f7 with SMTP id d9443c01a7336-2292f96232amr175133745ad.16.1743504333420;
        Tue, 01 Apr 2025 03:45:33 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf4ebsm84926285ad.155.2025.04.01.03.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:45:32 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: georgi.djakov@linaro.org,
	krzk@kernel.org
Cc: s.nawrocki@samsung.com,
	a.swigon@samsung.com,
	alim.akhtar@samsung.com,
	linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2] backlight: pm8941: Add NULL check in exynos_generic_icc_probe()
Date: Tue,  1 Apr 2025 18:45:18 +0800
Message-Id: <20250401104518.25391-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_034534_845295_B2ACAF69 
X-CRM114-Status: GOOD (  11.68  )
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

devm_kasprintf() returns NULL when memory allocation fails. Currently,
exynos_generic_icc_probe() does not check for this case, which results
in a NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: 2f95b9d5cf0b ("interconnect: Add generic interconnect driver for Exynos SoCs")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: The fix ensures icc_node cleanup on devm_kasprintf() failure
without restructuring the proven error handling workflow.

 drivers/interconnect/samsung/exynos.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/interconnect/samsung/exynos.c b/drivers/interconnect/samsung/exynos.c
index 9e041365d909..57e779b3e942 100644
--- a/drivers/interconnect/samsung/exynos.c
+++ b/drivers/interconnect/samsung/exynos.c
@@ -134,6 +134,10 @@ static int exynos_generic_icc_probe(struct platform_device *pdev)
 	priv->node = icc_node;
 	icc_node->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOFn",
 					bus_dev->of_node);
+	if (!icc_node->name) {
+		ret = -ENOMEM;
+		goto err_node_del;
+	}
 	if (of_property_read_u32(bus_dev->of_node, "samsung,data-clock-ratio",
 				 &priv->bus_clk_ratio))
 		priv->bus_clk_ratio = EXYNOS_ICC_DEFAULT_BUS_CLK_RATIO;
-- 
2.34.1


