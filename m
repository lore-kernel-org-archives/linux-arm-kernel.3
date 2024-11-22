Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492E4D75E47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 13:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4difOWFZgJjnD1C8UcBJOhNA8o5YsQWO3tN/+p0Mf1o=; b=TRmt2ohahaRPIYf/4JKVSdDWi8
	WD+SRn1MaB0zYd/excjl3aIdaKyUopludziCzkTr4uHiJ7vaGyLmOPfsLAt50LQKmRqhjhXpTMGuO
	j0SUfHiVlAy0QhwKYAeXMpvK2n9SDMFpbT6FMfSjCIUWtMuTYA34+h5hrh+5A7GIdDeOw/uZ9S1S9
	NChiT/ljPGuUDGP9kY7gDrJSs07FODtncKGjmCrleSfa0on9XNjzPSK4ZyAIPYm/2lqbkPZZQQUn2
	r1K0q/zN0f01gJr9dezI6lQXcVBiIDi/lY/7n9mDoepJqTIrlzmehzU1iS6Ezu/Jdn533Jw31Yoes
	g1AcTMmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tETy7-00000002Ydq-3THh;
	Fri, 22 Nov 2024 13:45:07 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tETvM-00000002YI1-375c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 13:42:17 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53da2140769so2502745e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 05:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732282935; x=1732887735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4difOWFZgJjnD1C8UcBJOhNA8o5YsQWO3tN/+p0Mf1o=;
        b=ng/kT3mQXqWnWlWCKf9/cGvWQO1WFyh44vRVMTNzB0kfobjCEJkrS+8HwUCUyj07Y8
         MnY4gZNIdCFTtduEMCn8b7honBHJYxxWFIYlusvdrQBg8N+4EzeiXjI7H4rcKnd4Vjfn
         NrHUsixVzMw1PUO6Phyrs3pukWILay4K+lz7yvXFpakQhdxmaYMEyUgjwm+iWu7eG77C
         cteRM73vPOR5zSkO4/tng3IgEEqWQ4fGuM2oSG/iBMDW+6WslCC4pQCOLXpgHrZMvmnp
         BsDrUuG8kv8xtMxsz7UdsMwf/ad6wQqdRJjWBYu6B2Mny8L5ctldir+CCHY5RQ9wcQXY
         DVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732282935; x=1732887735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4difOWFZgJjnD1C8UcBJOhNA8o5YsQWO3tN/+p0Mf1o=;
        b=mEmeqTfearpE/v451R0CBe2hFbaOpVSZRCAm2QHqNU+duqyax+k6mk+57GxFo/ut6a
         7XEPb0/MBjaae/aLmThaL4dnHtc6Tw/PyfRC8mOvdXaQcdRNhVTYPQzvpaKQBHnSszSs
         mMnk/ZOWOnMuk4oWPWh83bi4JCuwpGPGT2ObyJiQFBTSXe3C6S8IFw2p9GNot8m0UNNE
         ccAFTJIs9A1PaSyxMkbP+17cSY/TSt4ATssAgpsUX6DWT8fyWiLWdRHSXIKbg+zoPY85
         FsWqPOQmJdA4WT6SZjpJsxh2rI9x/KxNrkc0qIT6O2GruEbxy5iR4DZh4yCZhvywVCLh
         owFA==
X-Forwarded-Encrypted: i=1; AJvYcCW60/etPSVQ/zfPcIyiUbHzCiGwYW6+wp9l7RDNVImHMlxk5CZUK2wNzHKN/NV2zXO89TW/heCGz9f0cfsRTDt1@lists.infradead.org
X-Gm-Message-State: AOJu0YzzU8xbPRiDYanxuMdwZL8CPsKWFcxGyMUOpoEkuSysPKHk7F+X
	rfJL6to8sfI0qFdn8dPU0qCklkGaw8l2bezHSr5E/S/zTb1RJIUYtViWrJsLh70=
X-Gm-Gg: ASbGncuxE30UUYe1p9R0K6vPKNLMlFd0TcLEMjshi9bIZRbR/un7m1aoIptxTQrzIZW
	1jsVC2invWq0CpzxzX7qHhTJtXRBgLGvAUufXjWwEDwB68BcdD8oSj3EuGm7YTpQt7ttPWg+Mvw
	N/TzXQnsZHc6Ld5NY9bFuFXc8S9PFSXIn4AEavOtIeUaJE2TOmCj3jhLXRKrhYFNpWSR0SkuqG/
	LNDiLZUPEcUBF8vZ9VspOpHK9DPMZfnDcI+pbXJBuOJTnQRPzNCWjOgTdqw7fW3tbLQqwHq6Fwe
	VO2PwT5A0umhjGqpdeCnfjlE
X-Google-Smtp-Source: AGHT+IFpXYUD+s/zi1m8hUlKbDnxnNx0uM97l+zyDIOWiFoCB6hbeMWDPChCxVJnNPG7XSOTrGoKsg==
X-Received: by 2002:a05:6512:3084:b0:53d:b998:b7e1 with SMTP id 2adb3069b0e04-53dd35a47ffmr1986425e87.3.1732282934904;
        Fri, 22 Nov 2024 05:42:14 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2481e73sm376432e87.120.2024.11.22.05.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 05:42:13 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pmdomain: core: Fix error path in pm_genpd_init() when ida alloc fails
Date: Fri, 22 Nov 2024 14:42:03 +0100
Message-ID: <20241122134207.157283-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122134207.157283-1-ulf.hansson@linaro.org>
References: <20241122134207.157283-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_054216_778766_F9FAE53B 
X-CRM114-Status: GOOD (  14.21  )
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

When the ida allocation fails we need to free up the previously allocated
memory before returning the error code. Let's fix this and while at it,
let's also move the ida allocation to genpd_alloc_data() and the freeing to
genpd_free_data(), as it better belongs there.

Fixes: 899f44531fe6 ("pmdomain: core: Add GENPD_FLAG_DEV_NAME_FW flag")
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 4d8b0d18bb4a..bb11f467dc78 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2172,8 +2172,24 @@ static int genpd_alloc_data(struct generic_pm_domain *genpd)
 	}
 
 	genpd->gd = gd;
-	return 0;
+	device_initialize(&genpd->dev);
+
+	if (!genpd_is_dev_name_fw(genpd)) {
+		dev_set_name(&genpd->dev, "%s", genpd->name);
+	} else {
+		ret = ida_alloc(&genpd_ida, GFP_KERNEL);
+		if (ret < 0)
+			goto put;
 
+		genpd->device_id = ret;
+		dev_set_name(&genpd->dev, "%s_%u", genpd->name, genpd->device_id);
+	}
+
+	return 0;
+put:
+	put_device(&genpd->dev);
+	if (genpd->free_states == genpd_free_default_power_state)
+		kfree(genpd->states);
 free:
 	if (genpd_is_cpu_domain(genpd))
 		free_cpumask_var(genpd->cpus);
@@ -2184,6 +2200,8 @@ static int genpd_alloc_data(struct generic_pm_domain *genpd)
 static void genpd_free_data(struct generic_pm_domain *genpd)
 {
 	put_device(&genpd->dev);
+	if (genpd->device_id != -ENXIO)
+		ida_free(&genpd_ida, genpd->device_id);
 	if (genpd_is_cpu_domain(genpd))
 		free_cpumask_var(genpd->cpus);
 	if (genpd->free_states)
@@ -2272,20 +2290,6 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	if (ret)
 		return ret;
 
-	device_initialize(&genpd->dev);
-
-	if (!genpd_is_dev_name_fw(genpd)) {
-		dev_set_name(&genpd->dev, "%s", genpd->name);
-	} else {
-		ret = ida_alloc(&genpd_ida, GFP_KERNEL);
-		if (ret < 0) {
-			put_device(&genpd->dev);
-			return ret;
-		}
-		genpd->device_id = ret;
-		dev_set_name(&genpd->dev, "%s_%u", genpd->name, genpd->device_id);
-	}
-
 	mutex_lock(&gpd_list_lock);
 	list_add(&genpd->gpd_list_node, &gpd_list);
 	mutex_unlock(&gpd_list_lock);
@@ -2326,8 +2330,6 @@ static int genpd_remove(struct generic_pm_domain *genpd)
 	genpd_unlock(genpd);
 	genpd_debug_remove(genpd);
 	cancel_work_sync(&genpd->power_off_work);
-	if (genpd->device_id != -ENXIO)
-		ida_free(&genpd_ida, genpd->device_id);
 	genpd_free_data(genpd);
 
 	pr_debug("%s: removed %s\n", __func__, dev_name(&genpd->dev));
-- 
2.43.0


