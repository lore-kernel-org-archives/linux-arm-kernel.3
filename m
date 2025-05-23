Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EE8C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVuyQaWXDo32LSLemr1Wiyb/FTBR994cD4zXDWOXk7w=; b=gthIp6esRtvBxv5TrOR9dEWeCC
	DVwBcism3L8LQtY7FmFJ+eeNrD9DNX8ZM9XeOtRCh7x8UB+0rGhrbtIWWKRUuzfpOus11ErAyejPq
	/D1WPnJ9DAUy9JbtnVA+2NSclBv1HYVV0uUrLyjmyxt+wN+YcvGfFLg8EQXEw/5p38l4UEYD+PwlY
	2pk8YWmTXT41NOiCeX+v1wmV+dmbsia10YPBATHXG34KPRb1fcr7JyUKxmHDu2krj5uSHiaNG7vlY
	MxMV6mAmAu8z4GW2BeUx+v1WSJuRE2YgL3WMURJtpwfbHRdY9zSeshYQrNfZfumYiGcJOTmDVlr3F
	NPW2u6CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbC-000000045dm-357R;
	Fri, 23 May 2025 14:42:14 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISdf-00000003zHN-0T8p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:40:44 +0000
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-550e2ac6bc9so10061836e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007641; x=1748612441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVuyQaWXDo32LSLemr1Wiyb/FTBR994cD4zXDWOXk7w=;
        b=wr0IITUkLWfm2rsOgQTt5VjqWYHKjl8NSb/jTdLiZx1gm2EBbGUk1tEtPlVeV+NxIM
         YRQZfW49XyGUrXt3vndrMSBkeEF/RQGLo2XVd4oyF60tKuKSeKL/XVRomv9+kJc8hojK
         zqUTKabYZ+8sAFDDY56WI3mqw+tzIBs4lQKPVbwtEo/9yKH9v+2ngPqxcw/ZxKIQrxyf
         /U/6owEvNrynyl2w+l3TS9vj4spDXNNENxAHgQ+brhKZtVj1TXWG0UKTk0etfcsNUQUP
         nRfdVvTN7i1xSt1ULMWctBWU5znyk8u9ZN8ansHVlB3cJZOppLS0pbpVq8H2RrpUlPT/
         BGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007641; x=1748612441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVuyQaWXDo32LSLemr1Wiyb/FTBR994cD4zXDWOXk7w=;
        b=jhrPrLZFDmB0cgMMr/2BQrSHdiKYeqxNST7OG4m0vvpHw8hskmvkBq4CfHa2EdnTHg
         +sgf8RNnZfYrxAqiCh8aDtqoMCceTAOulyUqTzRg8A71qLXxz6tq26vWJRNEhnhX+yo3
         /ESQJBBC4VjVTmMIXU5IwtqWy80c45Vw53ysIF0KNO27EfZOVkl7qQ5iPryyMqO+FLdn
         S163jsDeNPJH4Jwx+yqdMqM4vrQklVAJPYtjmarKsbDtZAmXkPph2RaT5dH4tdDvUfLg
         3slaCPN4soOqIH695tb7xIqMthipL3mLa+IvxurkyklQQ9SQiREkhIyxd6tuTCoWfksf
         ZO9A==
X-Forwarded-Encrypted: i=1; AJvYcCU533nZnZlAAEi/E/U4Cni114jQDV56IxkoFAsM/kbquG0tQqatCbCgrDu99mVd0lEL6/fubD76PCO8asy3Qoc8@lists.infradead.org
X-Gm-Message-State: AOJu0YwsxGFGfaacZr5i013D0ue1Z5ETG8kGlvlvdMn4CUCEqJ3QSOn6
	KwJ78HueiKpC/KLas83WSkPu59TvrngTXeJa39oqSaQZeo12xITrT2ze63SsZLWaBYA=
X-Gm-Gg: ASbGncsB42G5IaYkgvhXXoLNitp+ASY/KGRWP5LV8J/X4OH9ydL+y7i5uHgL6VJ8Q7G
	Zo/CDjiEOBLnXzVrkHMxyteOEmsHNOyLErvYG40AzrOgg8ydB9pctOhITthZzUDB3wkQtQe8VWF
	rAY4GHP3aLsJe5M/CIIIHed/zjOe78L1izwK9SjtMQAO0+YuwpbfyTRt80mZo+sZgLDNLU+O99h
	EpzxnB3OQBywWgWvvJHoiHrnBOQJhpW3FlLo/rJ6SkFQaHAiy5tooLLkLs2czBj/oUhwTZIotqN
	v9KDTpmUYvbY2eE1XFmQ8R9b6vCLdWQyB1FRXhWQf/wtPGwHtMrczpKFI1o1mn9Mof7vyrbKtYO
	ZpdLHeuIR8jQ6m9WLuULiJ6Cl3g==
X-Google-Smtp-Source: AGHT+IEVIbZ36oRuBgtUIV/gY2wrVcuoRcXYW2ew4UfjOMiCZ3z4VNYKumXWYXyWKY98xtuLk0dWog==
X-Received: by 2002:a05:6512:22c9:b0:551:eb71:4aa8 with SMTP id 2adb3069b0e04-551eb714cbdmr4668192e87.25.1748007640612;
        Fri, 23 May 2025 06:40:40 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:40 -0700 (PDT)
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
Subject: [PATCH v2 01/21] pmdomain: core: Use of_fwnode_handle()
Date: Fri, 23 May 2025 15:39:58 +0200
Message-ID: <20250523134025.75130-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064043_148581_45F597F2 
X-CRM114-Status: GOOD (  14.04  )
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

Let's avoid accessing the np->fwnode directly and use the common helper
of_fwnode_handle() instead.

Suggested-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index ff5c7f2b69ce..9a66b728fbbf 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2557,7 +2557,7 @@ static int genpd_add_provider(struct device_node *np, genpd_xlate_t xlate,
 	cp->node = of_node_get(np);
 	cp->data = data;
 	cp->xlate = xlate;
-	fwnode_dev_initialized(&np->fwnode, true);
+	fwnode_dev_initialized(of_fwnode_handle(np), true);
 
 	mutex_lock(&of_genpd_mutex);
 	list_add(&cp->link, &of_genpd_providers);
@@ -2727,7 +2727,7 @@ void of_genpd_del_provider(struct device_node *np)
 			 * so that the PM domain can be safely removed.
 			 */
 			list_for_each_entry(gpd, &gpd_list, gpd_list_node) {
-				if (gpd->provider == &np->fwnode) {
+				if (gpd->provider == of_fwnode_handle(np)) {
 					gpd->has_provider = false;
 
 					if (gpd->opp_table) {
@@ -2737,7 +2737,7 @@ void of_genpd_del_provider(struct device_node *np)
 				}
 			}
 
-			fwnode_dev_initialized(&cp->node->fwnode, false);
+			fwnode_dev_initialized(of_fwnode_handle(cp->node), false);
 			list_del(&cp->link);
 			of_node_put(cp->node);
 			kfree(cp);
@@ -2916,7 +2916,7 @@ struct generic_pm_domain *of_genpd_remove_last(struct device_node *np)
 
 	mutex_lock(&gpd_list_lock);
 	list_for_each_entry_safe(gpd, tmp, &gpd_list, gpd_list_node) {
-		if (gpd->provider == &np->fwnode) {
+		if (gpd->provider == of_fwnode_handle(np)) {
 			ret = genpd_remove(gpd);
 			genpd = ret ? ERR_PTR(ret) : gpd;
 			break;
@@ -3269,7 +3269,7 @@ static int genpd_parse_state(struct genpd_power_state *genpd_state,
 
 	genpd_state->power_on_latency_ns = 1000LL * exit_latency;
 	genpd_state->power_off_latency_ns = 1000LL * entry_latency;
-	genpd_state->fwnode = &state_node->fwnode;
+	genpd_state->fwnode = of_fwnode_handle(state_node);
 
 	return 0;
 }
-- 
2.43.0


