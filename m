Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCA7C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLoMIJgubi/4cvpvs3WmBPRGnJMeyrBZc1JViSgU2O8=; b=vzKfkP5d1g2n/6tNhHP5oAjWfb
	+8yfNI2pwWL53p08CwiOHK0ig5b35738D3RmxHeCYS1xulDSxJ3CW8wD7iz9Wn0axdyDz/TCtV8Nt
	yOIQAYquwyB7vcJi0YcqrmIPR1Jn6odWAauogsaKyG3+jDaJZ/p1lAI+bxlZwt1I3J1F2ir1lL4vQ
	7CFA7tpJe+fWGXhKZO714xLc/G8kRe+vWcvAAmeW8+EcFyzpVSGnJ4LWjZBX9SE3NEQt0T2GYgs3N
	sEJevrs8OvskhHwPCs1Q+sl2Su6yj0t9bsBR6yTcMkrjGaGf5Yuqo+6LnMjhLPLiuhTgJ8TW9nq59
	dSq6pPSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QFp-0000000DKBr-0FqK;
	Thu, 17 Apr 2025 14:30:13 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QBL-0000000DIdT-0HgE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:25:36 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54d65eb26b2so758875e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 07:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899933; x=1745504733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLoMIJgubi/4cvpvs3WmBPRGnJMeyrBZc1JViSgU2O8=;
        b=cHd1tsPQC59VZMlfJOZkLRrQHRCewdC6X2ZH/7hWhnE2Bk9M9P452oJLZPWVYAjf+s
         dlI6YIAEGu82o0E8N8olEH8qYR8y7Yfz35CIE9nSH9IO96bEHSNKmYPOPEslivolq7Hk
         0a0cjcDA62HDgvaoDLLiJbFDj/daQ+nDX5AU8gxLx/umz+ahK6Rg5YW0TGwR1FOkkJe3
         gNA1ioTDPFLJCr6BVwDRgXFkqGTm2rDE9o62OnCkhz2CR7De8zRsSOmCdMEou0oW9UCp
         tXu3o0tck4e05WOWViKgfODXXnvi82/WvXOqdpLIyNAfSSXILlt1c4PAeEVYqtwJFtnd
         Eljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899933; x=1745504733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLoMIJgubi/4cvpvs3WmBPRGnJMeyrBZc1JViSgU2O8=;
        b=aTc2S7gJwvx3cNGqFZUHkGD8XsY5EJRQ8M97w2rNboJ1WZ7ahooxQtJMlVqfwGl3R9
         6sKFlwaLlySxpmocweyfoxnkWFqcsJ9nNOlhEQfx0LWcltSjiUeMpgDip0ap1o6d9xYN
         RxmVHfrUktLwi9TN3NPPBpboRQx2WxTIW1jKnbnVc4LUsa/iOgl1SOWLrTGIcoxCrH+M
         JO5yepqryfjm5WIDKUIGETe44ZZx+UHdgr/THX0YkCH3EIj0TfURmHtOgZcMQ8pnko95
         IaQ+kHff31TIB79M7UeBwALs7ErS4tcQ1LlCPzxl8BbT62wU3kUM9hGIlPdVounFWMGK
         eeLg==
X-Forwarded-Encrypted: i=1; AJvYcCWyK39nsIdjpPiTA82yNQbaoCn5KljjpZhclwRqjQMN1MoAEreAGWbFmBGjE3hjBFIXX1Qu4+eYCjXd9aUcRJPf@lists.infradead.org
X-Gm-Message-State: AOJu0YycdJ1NJzbZ3fWTK67B+/k8PI2LvYDC4fO8uDVzlsy3VxqlOQkm
	JVwAipB6yzinJTJoxVh6LF6SUvl7DIHJ7NEEuzD3k7XiLuH1rCV2NWLYNHhhUMk=
X-Gm-Gg: ASbGnctV941rSCjzIGs5fu262lFs2e/Zt7jqoXC+lERm5Mw6Msfs8dwGFUUBPwX3AX5
	nAVLvrKA3C+OedcA9owqiw7qdX1qpNDQ6R45Ltxnra2KK0thKjHBSo38/N3F2bwgYxP+/AYByHc
	rFCZbFQP2Hi3jRxkdwx4Le9We7USvRwkNZ0KPe+/UrB/+rPiT7euXN5PsjlJVg9InAeCJjBLBv9
	6EVMkwhqJZJMscp7G86QLX7woBTBblpee531mtSBEV6qhslpMxMpLMj0fqZmCI6wk9rxF5JFtSz
	m/UkUOTO+MA66dEMMkx2AWy8ybcQx+feqpkpvJqI8XTB6llZIspDumLs9uCjWcWN8j+H4Qt1Sfg
	vY+NP4EagpTd2ULg=
X-Google-Smtp-Source: AGHT+IGEHywzk0Uvrr5vva6qwKhkHAMRzineGZ+Ie2tYZ9oqV2dzLL/IgZ7exOPJtd8mc3KpgoduVg==
X-Received: by 2002:a05:6512:3a93:b0:549:8809:ee32 with SMTP id 2adb3069b0e04-54d64a9d570mr2067636e87.22.1744899933071;
        Thu, 17 Apr 2025 07:25:33 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:32 -0700 (PDT)
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
Subject: [PATCH 01/11] pmdomain: core: Convert genpd_power_off() to void
Date: Thu, 17 Apr 2025 16:24:59 +0200
Message-ID: <20250417142513.312939-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072535_107355_958B0BD0 
X-CRM114-Status: GOOD (  17.03  )
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

At some point it made sense to have genpd_power_off() to return an error
code. That hasn't been the case for quite some time, so let's convert it
into a static void function and simplify some of the corresponding code.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 3523d0331cec..574a0de1696a 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -908,13 +908,12 @@ static void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
  * If all of the @genpd's devices have been suspended and all of its subdomains
  * have been powered down, remove power from @genpd.
  */
-static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
-			   unsigned int depth)
+static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
+			    unsigned int depth)
 {
 	struct pm_domain_data *pdd;
 	struct gpd_link *link;
 	unsigned int not_suspended = 0;
-	int ret;
 
 	/*
 	 * Do not try to power off the domain in the following situations:
@@ -922,7 +921,7 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	 * (2) System suspend is in progress.
 	 */
 	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
-		return 0;
+		return;
 
 	/*
 	 * Abort power off for the PM domain in the following situations:
@@ -932,7 +931,7 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	if (genpd_is_always_on(genpd) ||
 			genpd_is_rpm_always_on(genpd) ||
 			atomic_read(&genpd->sd_count) > 0)
-		return -EBUSY;
+		return;
 
 	/*
 	 * The children must be in their deepest (powered-off) states to allow
@@ -943,7 +942,7 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	list_for_each_entry(link, &genpd->parent_links, parent_node) {
 		struct generic_pm_domain *child = link->child;
 		if (child->state_idx < child->state_count - 1)
-			return -EBUSY;
+			return;
 	}
 
 	list_for_each_entry(pdd, &genpd->dev_list, list_node) {
@@ -957,15 +956,15 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 
 		/* The device may need its PM domain to stay powered on. */
 		if (to_gpd_data(pdd)->rpm_always_on)
-			return -EBUSY;
+			return;
 	}
 
 	if (not_suspended > 1 || (not_suspended == 1 && !one_dev_on))
-		return -EBUSY;
+		return;
 
 	if (genpd->gov && genpd->gov->power_down_ok) {
 		if (!genpd->gov->power_down_ok(&genpd->domain))
-			return -EAGAIN;
+			return;
 	}
 
 	/* Default to shallowest state. */
@@ -974,12 +973,11 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 
 	/* Don't power off, if a child domain is waiting to power on. */
 	if (atomic_read(&genpd->sd_count) > 0)
-		return -EBUSY;
+		return;
 
-	ret = _genpd_power_off(genpd, true);
-	if (ret) {
+	if (_genpd_power_off(genpd, true)) {
 		genpd->states[genpd->state_idx].rejected++;
-		return ret;
+		return;
 	}
 
 	genpd->status = GENPD_STATE_OFF;
@@ -992,8 +990,6 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 		genpd_power_off(link->parent, false, depth + 1);
 		genpd_unlock(link->parent);
 	}
-
-	return 0;
 }
 
 /**
-- 
2.43.0


