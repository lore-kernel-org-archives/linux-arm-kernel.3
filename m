Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F193C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dwV7gI+Nsvg70NFtF53M46En6xO9EIKkeyF4GjRazs=; b=fBm/173cIidhfKcUvm30JPR1TL
	LvUcuuYFsr8zPcFR8YjsFxzMBeQ+GVLxb0yACivDXE5X9INKvqDopGzuSUki+rYK6bpnEJLGQw4c1
	Wit6JzqXiD20Ku2gafvIppNbRzqXI02kLvdRrKb4eh+75q8ZYt2/9splVCiceBH6uPlOr0TzUi0ur
	xvWTSwNehSSKhwJgcaQJNiiOSjH1ec1m+G8r1YLu/8aK6nEAc/eyfhmbAi2erq348NGmG3AVjhsfn
	qLOEOIN7FZ+7Ce7jkBmcqc32wHBFsJLUGkY0/yJZuh5R8ch7q9S3ZJPePlFtyPrZ9jlKjzLv1BRYY
	t+qqWNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbD-000000045e7-1DhA;
	Fri, 23 May 2025 14:42:15 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISdh-00000003zHk-3r1g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:40:47 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-550eb498fbbso8779808e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007644; x=1748612444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dwV7gI+Nsvg70NFtF53M46En6xO9EIKkeyF4GjRazs=;
        b=PfDHt1RfEBicGD52w6ttSFO/zcU74hx44Kd88RsfaXIWp/nimThevPUCvONu9M0Tjy
         /MY3onfdlJk81jmnZTYar/1oapplBNTeJ490QD5O233DXBBtfnC0zU0oHQaWby+MN+ob
         l3INtD3HmN/utGjV2XZGA3KhRx5xOICWhAkZ/9qqRaYoeEzyQz96YzgWcem2ckpDqtAt
         s8DqvbpB7Ln0+IHWTTUjKlU44vdyD25vg4l6ZFfO10mpgcVI/SYA+jMUYB58ci1+dsCj
         VI6ec69QxcdDuCblkpbv/+4rX3WTY4mPp/qzUCLoGX3Bze1/98LDnEfaeiX14uRQ+P+z
         3ueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007644; x=1748612444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dwV7gI+Nsvg70NFtF53M46En6xO9EIKkeyF4GjRazs=;
        b=vApKQYtsZQhZjqQ2srY07lsmdulLdYd6j+SVkzxoXKKHRVUdntVzWS7HyAAhIGf0qI
         er3+S6Gsj40ol0Rbi/DghFM6ulJdUlKXPQU8lz1cwX0MW409Xwr6WKoFKem7kzvJpv5W
         HyT/JP1cvzGM2dFDQiexf0PwkDRL0+T95KfhThnrg+GJrJAXoMF7BPkqMwsJo2t2wngc
         o2HF6MXxbcaNY8km6GMHWqM8hR9R3LRwjfe7JIm49fiDIZ7gHxt5iPDAvSm4CXJPMipJ
         TfLEYASM7nGKlrhNhxSL6CYliFRPpIj1SNyLPXaSVsEtSubE/x+jQ0WEha6l+imeBnxU
         llnA==
X-Forwarded-Encrypted: i=1; AJvYcCUs2C9ZOOB0RtE9h7WzwrFTSNGlfbYfWBhj95d6S9JXeLKDSthA6rEZxll/x2Vdz8SimcEZHcMhojE+hMlCLYD5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7yqfvzWL+gmcn/DR4vRogeU/p1xigLJ7ljiV+I+bpd2gzM2OP
	cWCb+oQKF8YP9hnMjLsNJwAOzggFhxA+5h8RcShqOz+3CDS8oYQ8Rb/PML4PA+SpWyw=
X-Gm-Gg: ASbGnctWe5CFespna9ZVim3JHeV0f+w30CF9OzaSooNrhHjcNY8UC1T2sQDBxLQda2z
	yQSbhUvqJEO6BxeHTqSAIa8e4snDR1kdxZ6zHdhpwRGeEkKXw7BmMyQzVFedUK9wNxXHttrxyHv
	viT2sllPDL37odROVqERzw+H1GCsTMUR+mv8v1M6onk8gqKNx1sA5oyS/vgf+ItfPkr46PyvkFr
	MHPnZtWdZp7HG1eB1Iw6abP3K7tQfaxcD3IxlrwwOQsjPo2krfARQrnQKL7PVhqX9lxCrmm0zCB
	HiVt5/RWvlJgCszaVOTd40LUI/m24/3DCLLCiE6mYvll/Iqg/2291CObkCGZC4HVjKhtK0Zbydy
	5QJIEPD5mLIoOh5UpPpg7JTNuBw==
X-Google-Smtp-Source: AGHT+IGBn6n6EgDrMlkJDyd0jqLFfex9/E7P3NJi4ff8Az72HWi1omtWGQrPu5v8XW0RIf89Dfo3KQ==
X-Received: by 2002:a05:6512:6618:b0:549:c1e6:cbc9 with SMTP id 2adb3069b0e04-550e97a1835mr7651160e87.18.1748007643820;
        Fri, 23 May 2025 06:40:43 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:43 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/21] pmdomain: core: Add the genpd->dev to the genpd provider bus
Date: Fri, 23 May 2025 15:40:00 +0200
Message-ID: <20250523134025.75130-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064045_957611_5A0FB670 
X-CRM114-Status: GOOD (  15.78  )
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

To take the next step for a more common handling of the genpd providers,
let's add the genpd->dev to the genpd provider bus when registering a genpd
OF provider.

Beyond this, the corresponding genpd provider driver's ->probe(),
->remove() and ->sync_state() callbacks starts to be invoked. However,
let's leave those callbacks as empty functions for now. Instead, subsequent
changes will implement them.

Suggested-by: Saravana Kannan <saravanak@google.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index da515350c65b..8d5dca22e35e 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2637,11 +2637,17 @@ int of_genpd_add_provider_simple(struct device_node *np,
 
 	genpd->dev.of_node = np;
 
+	ret = device_add(&genpd->dev);
+	if (ret)
+		return ret;
+
 	/* Parse genpd OPP table */
 	if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
 		ret = dev_pm_opp_of_add_table(&genpd->dev);
-		if (ret)
-			return dev_err_probe(&genpd->dev, ret, "Failed to add OPP table\n");
+		if (ret) {
+			dev_err_probe(&genpd->dev, ret, "Failed to add OPP table\n");
+			goto err_del;
+		}
 
 		/*
 		 * Save table for faster processing while setting performance
@@ -2652,19 +2658,22 @@ int of_genpd_add_provider_simple(struct device_node *np,
 	}
 
 	ret = genpd_add_provider(np, genpd_xlate_simple, genpd);
-	if (ret) {
-		if (genpd->opp_table) {
-			dev_pm_opp_put_opp_table(genpd->opp_table);
-			dev_pm_opp_of_remove_table(&genpd->dev);
-		}
-
-		return ret;
-	}
+	if (ret)
+		goto err_opp;
 
 	genpd->provider = &np->fwnode;
 	genpd->has_provider = true;
 
 	return 0;
+
+err_opp:
+	if (genpd->opp_table) {
+		dev_pm_opp_put_opp_table(genpd->opp_table);
+		dev_pm_opp_of_remove_table(&genpd->dev);
+	}
+err_del:
+	device_del(&genpd->dev);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(of_genpd_add_provider_simple);
 
@@ -2696,12 +2705,17 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 
 		genpd->dev.of_node = np;
 
+		ret = device_add(&genpd->dev);
+		if (ret)
+			goto error;
+
 		/* Parse genpd OPP table */
 		if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
 			ret = dev_pm_opp_of_add_table_indexed(&genpd->dev, i);
 			if (ret) {
 				dev_err_probe(&genpd->dev, ret,
 					      "Failed to add OPP table for index %d\n", i);
+				device_del(&genpd->dev);
 				goto error;
 			}
 
@@ -2737,6 +2751,8 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 			dev_pm_opp_put_opp_table(genpd->opp_table);
 			dev_pm_opp_of_remove_table(&genpd->dev);
 		}
+
+		device_del(&genpd->dev);
 	}
 
 	return ret;
@@ -2769,6 +2785,8 @@ void of_genpd_del_provider(struct device_node *np)
 						dev_pm_opp_put_opp_table(gpd->opp_table);
 						dev_pm_opp_of_remove_table(&gpd->dev);
 					}
+
+					device_del(&gpd->dev);
 				}
 			}
 
-- 
2.43.0


