Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1C6C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhCzeeuIRn9U4lLFeFB39wEFdroIdbbgBLNLNN654Y4=; b=O5GSjxPN7KMtFOYBCau+Le6w48
	VCngmzjuP3pkPpP5jImWWn2TXHUGMYVQ1luNoank4TW82V64RQrd+NzesLZ6PMZc94WndHatLAJy2
	B915H0LVSnDhCDSdB7wTLB7qgszur7pfixDoI4M0yzaDpXSE0vzDdeou7mx9Ak35vtW64DGtHbNRZ
	6NDEwJL30OBRaMZPFGgN8H0Y6GOGPMqLA95954rV3EKapWXXbmqnVhoYaSFCstk7A3VDHQfVrodnd
	TSDUjSnwFIO3lNNaPKopgzQ6Ri1O0lRhT0a28XZAcf28DJ44hQkOJrYKdDNcfiX41zvAKV3ghNBMR
	kLovkAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QQq-0000000DMJv-2LhH;
	Thu, 17 Apr 2025 14:41:36 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QBT-0000000DIhY-31P1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:25:44 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54954fa61c9so1118897e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899942; x=1745504742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhCzeeuIRn9U4lLFeFB39wEFdroIdbbgBLNLNN654Y4=;
        b=t3xzIMNTx2qY+SvQQT8vRGR796k7sAUUW1/ciENOA6as0GbMBCA1ZxMF9rI2qjVAJJ
         mwUmkFeBln9480CbLTGI6j8TwYsnjDgmiXOVUk/n2spM8GqPc6wXybQtfwIb1ykJ1SZm
         nMFQORTTaHzvkcr43EDdDZEJmOcgKWqxgSjtiUlJ46JPHaCUa8MBolgXjr5g2neVLSSW
         vKBtakcFfzupl552rjWacpS8bbL2C847Q2yVYH9rmbEX4gHFxr1VHCVt1rVXn54tO4VQ
         mlkSv3Ko8RcO/l3BZVwUbLS3/7zli1/o3bpjySAj5rMfOG1SyI8YZssJRg02qvSdmK0d
         P8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899942; x=1745504742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhCzeeuIRn9U4lLFeFB39wEFdroIdbbgBLNLNN654Y4=;
        b=Pr8xLeTFzl4jCwfCtY0zQi9pqfwhnMgqQ0q6jfP98eMX7mmi7+yl5rCdgw8TmVcbtc
         IpOTbugOwFTilDdl4p2tlxfHVPP2ibw8INg023sjEmzIhzp6Cs36atzkw33BWcbyEsy9
         +FV6SUWRacYrP+x9HM6kNu7W1FMGKt1sBLnruTJpanURaJN7GrG+IVXHwPJG4xAuPy3k
         Ngc08xaBpr7bnbO8aoHmxkhtkF1RpXwgHvTA2B/nI9MJDcCmp/g8mVjPcwlXoAbwNmmN
         Bop4Of2kCuTv4Wd/uXpm/Cv/MVtv+6v4FuvxNyHKR6T73d6YQWOA+oyZGWH5WtWBlPP2
         FIDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAQcrwG7ehDreJtWST06t0fNKqDJmdwdNZBsy7id5xLQu8IM7DVPbWJICrsirH0MoDKIIJkpHoR+yxKxfirF3Z@lists.infradead.org
X-Gm-Message-State: AOJu0YwGKSuOTFSyh+TMaEqJt2FvNOPUtQiOtJAIThFe/BF7KjivNv2L
	KYahx414SclT7XDjen3G4nv6qaIJjmsTR8JvoDT+HD14AkNoCZsqw2+QKbmrAUo=
X-Gm-Gg: ASbGncsiLgd9MLdhHxaPoMBqXaV9rb++YBvBvel+6wPGYC/QXoMvr/aKxG9cdLeFzhz
	sey5vydYZNZpN9v4Vlba1Qb0cgS/qeWMyCAerV34TL7xtgMuAA3g9nW/gQ4RSmQFCX9R3kG6tgx
	upEKD+rnTXY0awVgIkdvW0zUAW2ylDa3UIC2JO7cDZHldvAbHA5glo7lfZ4sE3X43mVhomNFl19
	71PPeImQaKC2h4A8XR2WmFC4FoLxCMv4/R62wIFK7ljEAyRUkJ4MhuFEu1BBkkufrjt1aOnuPFU
	508bgXl9d5Ucly/6sG7rUzdO1KVlQQwxz87SZk484io35xfMSHaZ1DLRTCiGYJ87xjsx6a9qnAf
	bl/PNOTuULRrjpx4=
X-Google-Smtp-Source: AGHT+IEKg2sAljzc60RG1x7zQS31Y71/y6HRPvtwzajn+isSwZjg667wjhQKlzCNX2y4YKOKam9UjA==
X-Received: by 2002:a05:6512:10d5:b0:549:8675:c388 with SMTP id 2adb3069b0e04-54d64af3fbbmr2088472e87.52.1744899942203;
        Thu, 17 Apr 2025 07:25:42 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:41 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] pmdomain: core: Add the genpd->dev to the genpd provider bus
Date: Thu, 17 Apr 2025 16:25:04 +0200
Message-ID: <20250417142513.312939-7-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072543_764680_9348B88D 
X-CRM114-Status: GOOD (  14.52  )
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

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 3911d3e96626..5aba66ac78f1 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2640,11 +2640,17 @@ int of_genpd_add_provider_simple(struct device_node *np,
 
 	device_set_node(&genpd->dev, fwnode);
 
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
@@ -2655,19 +2661,22 @@ int of_genpd_add_provider_simple(struct device_node *np,
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
 
 	genpd->provider = fwnode;
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
 
@@ -2702,12 +2711,17 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 
 		device_set_node(&genpd->dev, fwnode);
 
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
 
@@ -2743,6 +2757,8 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 			dev_pm_opp_put_opp_table(genpd->opp_table);
 			dev_pm_opp_of_remove_table(&genpd->dev);
 		}
+
+		device_del(&genpd->dev);
 	}
 
 	return ret;
@@ -2775,6 +2791,8 @@ void of_genpd_del_provider(struct device_node *np)
 						dev_pm_opp_put_opp_table(gpd->opp_table);
 						dev_pm_opp_of_remove_table(&gpd->dev);
 					}
+
+					device_del(&gpd->dev);
 				}
 			}
 
-- 
2.43.0


