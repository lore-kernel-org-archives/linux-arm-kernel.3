Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B0AC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWK6OGQUPtJsrWaqiRqfJ/zsH5wseFrp650Wv3Bg60w=; b=vPiP5TidvtacOPXmtpKI6FPSHR
	rfsisiMJL73kWgJPHrTUXIhR3QI7NTXSxVb1nSGwlMPXHAY7/FaRhzQ1osE0dCHVdBy59K2Wbanvv
	q+dNt+FLrqWIvDQ6jhVoU2Ws6J3Vw1Tyw2k1Luwpl93enps4LkvR5D9R92zTf4Ionlhmy2cRQXwH3
	99TxAep9XtRXTfBfh8FpO2vTPHib0CO8WU8ALlpK4NkenFr0dMX4WuGdFzOQ0sOxJL6jXErLaPIhX
	F7MlCgnwbR+tng53TEWLRxjtIiAZ3FI7YyuFqBrL6oXDtLoP7f35d7f9vr7oXNuHMz5z8mRGpsJfA
	dGLvQaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QJU-0000000DKsj-2ckR;
	Thu, 17 Apr 2025 14:34:00 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QBN-0000000DIeL-3W5q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:25:39 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5499c5d9691so1035003e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 07:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899936; x=1745504736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWK6OGQUPtJsrWaqiRqfJ/zsH5wseFrp650Wv3Bg60w=;
        b=DiNOYqLhaXbc4RwliAQexoyur9W/GyKdeBt8/7affA5dtlZn0A0u5ySNL+EIqsGqhY
         JvSPrOgWZewsPuqDwPLWR2QZ7h0O9K8uacg+EfB13iQtpBGTYc4rU1jStfW1XpGJQHmI
         zAltg640B5WPK6lQCxWsxZRaCZy+fNXLBJi3WAvcfLZaQfcHsQaVaRNuR9JZVLMmrvpL
         P8QFL0PIVkECX6gTX3nn10ZC4Hd991N5phlPCuo5N5SLIlhg8qEqpmZQJmwTzBpDAkny
         vPCqkdGEVGYSgY8/wyUDV2BjerhDRTBACo+sIRR8V3583iJtXN1ud68IKRs5bnF+cr+n
         gcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899936; x=1745504736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWK6OGQUPtJsrWaqiRqfJ/zsH5wseFrp650Wv3Bg60w=;
        b=IHNOAY1cHqFeEmNju9ZjAWkoyYSWDLO275GURHyswx7XlX4welXJxLW1k63LNuBVc1
         MDrbRW/mR0YSDXPfV1eWKadV2uVV/Wbl00q6NbvB2UKFOHTd9SWoncPW/8qit7cNaLl3
         mws1wdyhNWJ63V91YZVPlRx0dXGUbbU5m/W8mLfjdQXz1KgacJ2dTDbxOEDyhYzKZKrW
         kIEXphcqfWHbMG/d7LONoYbiVsgaJCMEyOELhwUgtK78xZ/1iZYLdG9OKVkItaVt9wwl
         awOzZhk62OUt7zbki62ikdFYxFnSBngnZRvW6rbQrSX8M8AMVWoxsLMNA39MNjWNUQH7
         qycg==
X-Forwarded-Encrypted: i=1; AJvYcCWbKb/WY+MTn/v3USv7ECqmv+1Ml2fSSldH6njjw1Lgxq0zoVM6aTOPhOrSnqD+ntxVz7TZqwf92PTASUq/9Ner@lists.infradead.org
X-Gm-Message-State: AOJu0YxjB2eSzdWIqaBtm4gLiB4cMwxr4KBgnWNLLzxT6+oECXd2tLWr
	xHYm3ToeINPsJnH0tJmZkQBKtIIDPFNSEsmhCE+5ItmgPjs5g9VREh1n/aWBTFo=
X-Gm-Gg: ASbGncukWXBHOZiQ1xKYl6oyX63j/IbKc9eM7y966Zf8U4RTDgCzvTfxx7BQrEBTTke
	jPMyUNdcJ8MEv0g6PLy90AELqAJnCnPOdkw0UUpoGPzVGohBTL80dpLsFO2hXRb7mplu49kYodo
	lVhaU2DfCEbnj3lvZCP7/uOXa2qzJ6Iu9VctAGnBlwJ6U4WNASJ0DkKuyf2Vvy0kpA33RSKiS+0
	OoV6A3pGQiYiaJ5ribl+H+f1k7h4mhk3OYojzn9/lTX9EMQiU6Ea1nS5maXLGMU3JuZSD1Iq/Q4
	75f5bnix8EQCx0JotZsqejLjyuNgWN6QkwOqQpzSS1RX1zAqkm14qSPj+vWMOMDS5lhQG417DwG
	bwxnJdyID97LD3jg=
X-Google-Smtp-Source: AGHT+IFMIMS9W78LDELYwj19yc/UbKsawjkHWp2lDcIWNSaSrbDAkmZeYKJckcObhsbeji26HeVx/Q==
X-Received: by 2002:a05:6512:33d1:b0:549:91c6:96a8 with SMTP id 2adb3069b0e04-54d64a7b359mr1644875e87.7.1744899935896;
        Thu, 17 Apr 2025 07:25:35 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:35 -0700 (PDT)
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
Subject: [PATCH 03/11] pmdomain: core: Use genpd->opp_table to simplify error/remove path
Date: Thu, 17 Apr 2025 16:25:01 +0200
Message-ID: <20250417142513.312939-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072537_876946_09077FD2 
X-CRM114-Status: GOOD (  12.45  )
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

While we add an OF-provider we may, based upon a specific condition, also
assign genpd->opp_table. Rather using the same specific condition in the
error/remove path, let's check genpd->opp_table instead as it makes the
code easier.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 34a85bf347ad..035b65563947 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2343,6 +2343,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	genpd->provider = NULL;
 	genpd->device_id = -ENXIO;
 	genpd->has_provider = false;
+	genpd->opp_table = NULL;
 	genpd->accounting_time = ktime_get_mono_fast_ns();
 	genpd->domain.ops.runtime_suspend = genpd_runtime_suspend;
 	genpd->domain.ops.runtime_resume = genpd_runtime_resume;
@@ -2617,7 +2618,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
 
 	ret = genpd_add_provider(np, genpd_xlate_simple, genpd);
 	if (ret) {
-		if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
+		if (genpd->opp_table) {
 			dev_pm_opp_put_opp_table(genpd->opp_table);
 			dev_pm_opp_of_remove_table(&genpd->dev);
 		}
@@ -2697,7 +2698,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 		genpd->provider = NULL;
 		genpd->has_provider = false;
 
-		if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
+		if (genpd->opp_table) {
 			dev_pm_opp_put_opp_table(genpd->opp_table);
 			dev_pm_opp_of_remove_table(&genpd->dev);
 		}
@@ -2729,11 +2730,10 @@ void of_genpd_del_provider(struct device_node *np)
 				if (gpd->provider == &np->fwnode) {
 					gpd->has_provider = false;
 
-					if (genpd_is_opp_table_fw(gpd) || !gpd->set_performance_state)
-						continue;
-
-					dev_pm_opp_put_opp_table(gpd->opp_table);
-					dev_pm_opp_of_remove_table(&gpd->dev);
+					if (gpd->opp_table) {
+						dev_pm_opp_put_opp_table(gpd->opp_table);
+						dev_pm_opp_of_remove_table(&gpd->dev);
+					}
 				}
 			}
 
-- 
2.43.0


