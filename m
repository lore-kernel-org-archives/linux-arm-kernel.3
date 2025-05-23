Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44452C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGyEwCJhPN1ZKDIimFxnLW+xEyMfXf8H84gi9aCiP1o=; b=PCt7IXHb2AKzam1mN+Z2KXh45S
	fE/PqnC3FaGc2U4elfpn2NaMq+JNngWh0RYuDOvlJQukSU4U8lWjr32fBn/AjNWiOsrle2AOn5W/l
	fXMz0mrM4DuHDf71LXoH5cRXG9+ePo4s5/1A/AF7+1j0ZAT5sw6qzKuJhKP9rkbv1MZ0sApmZB8rE
	kXatfWiQF3Bm6YvS2W+EkxYgyVE/aNPsDYAMZ9P7OWIZwh4AZYk4ts5OJmq+VEKqlEtoe3vLniiiY
	DoWc1rqTr2tQ8SysAnapHgg5zxLnPkotF3z3dvq1B2MXWU1MbMrreawY+iH8NLFpZi5tjdt52YHFd
	R4K6B7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbX-0000000469P-0Iv1;
	Fri, 23 May 2025 14:42:35 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISeA-00000003zQh-1bHJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:41:15 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-551fe46934eso1063440e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007673; x=1748612473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGyEwCJhPN1ZKDIimFxnLW+xEyMfXf8H84gi9aCiP1o=;
        b=qxpxBZTGsA1s5/ZTZOQge4FnDq2wyZMKnpMmY3yeF1eTbjJvmQTtm8dMrON/mXhvbH
         8RX4DdJA/7kkw7vDHbfKlt3LKMCO0usMOGXYXsXsYa3CE8s1mjLhAIq16SkDyBddVKRN
         aQ67YlAG6blc+Ym9ePFUDvj4iXI0IRHZINJScHoSGuqQX3vMzZN6nPQ5kN0Ld4aMw/Un
         YWherm++RHY1WtRnpZuDX5ag/i4a65Pm3QIgziIt9wsNO8sHv93MXyTYNp4iqbWl4kXL
         L3IaPprO4BeePVMoz0MF23WFaiThikrfnNyAhbxLUx+jOTGbVcTiYTxJx048ZX7/H2c1
         7vBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007673; x=1748612473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGyEwCJhPN1ZKDIimFxnLW+xEyMfXf8H84gi9aCiP1o=;
        b=n/F22EC2EyVZMvS7LU66V0glRj4ASY1viX69o3CWJb2yP9qr/y3BejO2hlM4AxmSMX
         6Ls4SPwlDmIPLLRVZ7pOQaLiWWALTDuurN+GzG9K0TvB0LxEum7kDfYiecnXNamhbNmr
         Kp4Pq0kwqVolT9azCzP+VOvlI+QjB0d7q7X0JjmOSbHGbg8UOXPgfWiHxZG649qFHsk6
         IIau8FmvPanxEX92eMfWXOYosCu9JL1kHA71FPSkAF3IcJvOln6lVd7uruaSmXkRhwdh
         etLli3CSp6u8zq7GJoyx7/6YylCJbhV+m2l46uZ0s9YL9TKy4TdqD3rMhwDjmiHsk2Zm
         TABg==
X-Forwarded-Encrypted: i=1; AJvYcCW0E62/2EREEv5hEFzzf/XjA4D0Ejp6i1hl9U/7m72IgH7tQ2ypSu8N28pLobEBAuWyDSGqbrqMV9+EEqpWC0bL@lists.infradead.org
X-Gm-Message-State: AOJu0YwJXkQq+1uIYDeGkSdBXUMUDj7GoD7Biqa1UNrKdFjAlV5oO2Fu
	XtdXXgRer9IXvUYDp2EV7aoaWRCZNd2/C7/7EmN2TtL16mAa1kmTIaQPVTqJobMoHJg=
X-Gm-Gg: ASbGnct35VNN7yvrT5Rt04RUpyzy63UuIjBOBuUZBidvtgOTKsGoTAX51ADhnZhRV4K
	K08VvIhLBfEOk22mJtYueB5gFF+MF2C3vzemM4801KmVBooBvhRasW2p/A45sRdxKJa8JXfuNQe
	oBi2g1z4fNt+2UpCRMNKIcSmAeBMB/lAMQkq/320hQEAPW7Ht9NaJGmbY+/d1uv2RvCjrAXuylY
	kKO7ri7OkW6iiZpRU5vZdSHbC0Na+mVDK8V08UhXaSgJWJC44JrT50DA/9pNZXOoERQq3hl/Jp6
	FLN2pUQ9HZpgQkeyJANpzxM2nsaRlEZF/rKEymkdZzT39v5sGAqdG1hydVzOsO8O1raiDJ/yyKa
	kcvXA9VKD6jjiGicTjWKE+LP0cg==
X-Google-Smtp-Source: AGHT+IGPyCQFUdzHIALfteU0vTerPpV7oILLzxQIlLInZMqH94Tb+MaxZdvt9CEg2iCH7sWV6l9Bng==
X-Received: by 2002:a05:6512:3ba7:b0:54f:c1cc:1241 with SMTP id 2adb3069b0e04-552156cc6a3mr1224907e87.25.1748007672736;
        Fri, 23 May 2025 06:41:12 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:41:12 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 21/21] cpuidle: riscv-sbi: Drop redundant sync_state support
Date: Fri, 23 May 2025 15:40:18 +0200
Message-ID: <20250523134025.75130-22-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064114_420496_72F936AF 
X-CRM114-Status: GOOD (  16.69  )
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

The recent updates to the genpd core, can entirely manage the sync_state
support for the cpuidle-riscv-sbi-domain. More precisely, genpd prevents
our ->power_off() callback from being invoked, until all of our consumers
are ready for it.

Let's therefore drop the sync_state support for the
cpuidle-riscv-sbi-domain as it has become redundant.

Cc: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 83d58d00872f..a360bc4d20b7 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -44,7 +44,6 @@ static DEFINE_PER_CPU_READ_MOSTLY(struct sbi_cpuidle_data, sbi_cpuidle_data);
 static DEFINE_PER_CPU(struct sbi_domain_state, domain_state);
 static bool sbi_cpuidle_use_osi;
 static bool sbi_cpuidle_use_cpuhp;
-static bool sbi_cpuidle_pd_allow_domain_state;
 
 static inline void sbi_set_domain_state(u32 state)
 {
@@ -345,20 +344,6 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
 	return ret;
 }
 
-static void sbi_cpuidle_domain_sync_state(struct device *dev)
-{
-	struct sbi_pd_provider *pd_provider;
-
-	/*
-	 * All devices have now been attached/probed to the PM domain
-	 * topology, hence it's fine to allow domain states to be picked.
-	 */
-	sbi_cpuidle_pd_allow_domain_state = true;
-
-	list_for_each_entry(pd_provider, &sbi_pd_providers, link)
-		of_genpd_sync_state(pd_provider->node);
-}
-
 #ifdef CONFIG_DT_IDLE_GENPD
 
 static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
@@ -369,9 +354,6 @@ static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
 	if (!state->data)
 		return 0;
 
-	if (!sbi_cpuidle_pd_allow_domain_state)
-		return -EBUSY;
-
 	/* OSI mode is enabled, set the corresponding domain state. */
 	pd_state = state->data;
 	sbi_set_domain_state(*pd_state);
@@ -401,8 +383,7 @@ static int sbi_pd_init(struct device_node *np)
 	if (!pd_provider)
 		goto free_pd;
 
-	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN |
-		     GENPD_FLAG_NO_SYNC_STATE;
+	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
 
 	/* Allow power off when OSI is available. */
 	if (sbi_cpuidle_use_osi)
@@ -570,7 +551,6 @@ static struct platform_driver sbi_cpuidle_driver = {
 	.probe = sbi_cpuidle_probe,
 	.driver = {
 		.name = "sbi-cpuidle",
-		.sync_state = sbi_cpuidle_domain_sync_state,
 	},
 };
 
-- 
2.43.0


