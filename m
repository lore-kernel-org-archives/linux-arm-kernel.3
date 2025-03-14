Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3CCC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Suz7cKLNuXGtB0nBu0oVhma/Td/1dTahkXdO6vQ+7gU=; b=36ecoQ7u1Gh+X/Qi0bYXzbFdvq
	JeaUg+N6fZZiIJ8nYHUgJPe1BOk2yCEtM8p3/gXJEvp35LFEtw/hKRSQqJI+8idEyE8llbhMYBPGe
	UOMaHLH1K9RdaTE04JQhQhrOv2sG+4X2/u+ZjKd2CLI03q+DXwAljqKQlTSIkLNKaA6VRp6af3quv
	uWozuvLxu+d13Up0aqEXEVQ5HM+NQiErlH45w1c6fSc/Wmy3e2vfei9+cLYMyfOZNeSHoHJRlLViP
	gaWWjOcYaD8MW/xeMNgvO+qoKjJcXTy95UKk537RCPZQB4wFkIlsccqDtu9xdY57wGbPbyhanl5Gz
	xTDJF1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt200-0000000Dn5j-3vJQ;
	Fri, 14 Mar 2025 10:10:40 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1r2-0000000Dl3e-1uOd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:01:25 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30bef9b04adso19709291fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 03:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946482; x=1742551282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Suz7cKLNuXGtB0nBu0oVhma/Td/1dTahkXdO6vQ+7gU=;
        b=LLeM70dpmYF0HBc3lpGbOzGe+Jv5zHAeok9fixzUq5ERS9Yxe6J1RjwENF7lb09GMM
         1sIJsoa7y7PH84QnyJSknc8ZaN+0q6r80NeiXw8vO+ZuqbfUwsyFUWvk0NdfE3wMtrSF
         0oSDpzyK0ihWN8dToebaPOmA3vJBXrnLFUKfKRlp5DdmL+4PezzbdyWw1mURmOeHw0GV
         KLFCQKUgKIDBAlC+nZl4doVTIkXFSuqpNyexMo6K5J2+f507wmTehACuvs8borCd+8tr
         4ITwPt85sSGZjhGLkfxXbKKd0M+Al+uNrMC1oNfphXRByC2wy0UTEYN5POBjnwIvTILf
         V+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946482; x=1742551282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Suz7cKLNuXGtB0nBu0oVhma/Td/1dTahkXdO6vQ+7gU=;
        b=JUarcIgUtbIy+qcwpmTP1spmUrz4Ma1HjuElXleS564wHvqEoO2ss6RgRKm7f5JQVi
         +Z6DATa0EkgbYI5JVGIpwPyF290IPD+jzLL8CbhL/r73WhioIl7JpEhyKcf6AHfUyCrf
         6UvO2PkEOx1Bfb533XEiFw3uTiKsTiOmWiXrGcM++TDH6K/3xxlUTqoS5eP7aooaGaIx
         Dk8z4CnpaM6Mwj6bBcxnnp6d3lw9z4JvVdSzh5RM4NEBfA9JN2BSXRLhRP5tedInU2Op
         6Xlw+trWYTunHon/Ft6mUD6rza7sjU/t7RO/pRRDCzIjDsc/1Et35CCQTUFZzpZFZyqM
         tQfg==
X-Forwarded-Encrypted: i=1; AJvYcCWBbZqgW+2dyTrM3D0UG6GH0ysDSc9Ml/SfiIdKlX50X3/RvUE82Uj3ANJedzIpyJJOTp8jGAandzDLxUyLs6eP@lists.infradead.org
X-Gm-Message-State: AOJu0YxcKCY+VG8uJum5EXIdSev3ubBJBhIJR2L4UDKN7ZexTHDkY9sL
	F8sQqkRU5qr9z3Cl6vPt/Pfmi1v305ccJQXIdxy9FPFHSWHcelGSFfqMEQ2LAWY=
X-Gm-Gg: ASbGncsrhbdy90LqVraaM0SZmEAOG1k27lD3HllEMcoZfw3aH2aCQ7uZWfYTnSRkwdc
	ZEiZSrvUtK2xYB0SXxQ6FoqzVeS5QTNQK+czEnscwoEGzi9E0G7pgaTwrig9uvZZdXYijttWz+o
	YHXZkb0ArqODDrVBM0vx9QqPkNqRI5as0i6b77ZvJqm815W4Q96Je2Zbf3i8x1Z5s+F9PGyETuF
	jwWC9UW/r8+xD8Ha/WOeKUvwBwP9I/IGgjw8Lo7ytcZYyGhi8EGxDtxYXdSMiaCS57XemWvEowa
	emz/giP0HYDakBY0MQFAQ4/Czkua/Dhw5S/WJBkYc7uMwLZUSj1o0+y9lOS3GRXgfijrDX8E9Ou
	jIoG7UQ0MQmQvNJIHXEqU/Frtn/jtVw==
X-Google-Smtp-Source: AGHT+IEY83oFunB8w4RCdXC7/PTR7yqMmBEg98GVtkrv9yV920cpuM7Rd10omcbDGDOuiGclAjQbOw==
X-Received: by 2002:a05:651c:2101:b0:309:26e8:cb1a with SMTP id 38308e7fff4ca-30c4a8dcaaemr6886561fa.30.1741946482339;
        Fri, 14 Mar 2025 03:01:22 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0ea468sm5168221fa.41.2025.03.14.03.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 03:01:21 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-pm@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] cpuidle: psci: Correct the domain-idlestate statistics in debugfs
Date: Fri, 14 Mar 2025 11:00:57 +0100
Message-ID: <20250314100103.1294715-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250314100103.1294715-1-ulf.hansson@linaro.org>
References: <20250314100103.1294715-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_030124_494750_26748BBA 
X-CRM114-Status: GOOD (  18.61  )
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

When trying to enter a domain-idlestate, we may occasionally fail to enter
the state, which is informed to us by psci_cpu_suspend_enter() returning an
error-code. In these cases, our corresponding genpd->power_off() callback
has already returned zero to indicate success, leading to getting
in-correct domain-idlestate statistics in debugfs for the genpd in
question.

Let's fix this by making use of the new pm_genpd_inc_rejected() helper, as
it allows us to correct the domain-idlestate statistics for this type of
scenario.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-psci-domain.c |  2 +-
 drivers/cpuidle/cpuidle-psci.c        | 27 +++++++++++++++++----------
 drivers/cpuidle/cpuidle-psci.h        |  4 +++-
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index 5fb5228f6bf1..2041f59116ce 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -43,7 +43,7 @@ static int psci_pd_power_off(struct generic_pm_domain *pd)
 
 	/* OSI mode is enabled, set the corresponding domain state. */
 	pd_state = state->data;
-	psci_set_domain_state(*pd_state);
+	psci_set_domain_state(pd, pd->state_idx, *pd_state);
 
 	return 0;
 }
diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 1aff1ec555d5..26a0885444c4 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -37,6 +37,8 @@ struct psci_cpuidle_data {
 };
 
 struct psci_cpuidle_domain_state {
+	struct generic_pm_domain *pd;
+	unsigned int state_idx;
 	u32 state;
 };
 
@@ -45,14 +47,14 @@ static DEFINE_PER_CPU(struct psci_cpuidle_domain_state, psci_domain_state);
 static bool psci_cpuidle_use_syscore;
 static bool psci_cpuidle_use_cpuhp;
 
-void psci_set_domain_state(u32 state)
+void psci_set_domain_state(struct generic_pm_domain *pd, unsigned int state_idx,
+			   u32 state)
 {
-	__this_cpu_write(psci_domain_state.state, state);
-}
+	struct psci_cpuidle_domain_state *ds = this_cpu_ptr(&psci_domain_state);
 
-static inline u32 psci_get_domain_state(void)
-{
-	return __this_cpu_read(psci_domain_state.state);
+	ds->pd = pd;
+	ds->state_idx = state_idx;
+	ds->state = state;
 }
 
 static inline void psci_clear_domain_state(void)
@@ -67,7 +69,8 @@ static __cpuidle int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
 	struct psci_cpuidle_data *data = this_cpu_ptr(&psci_cpuidle_data);
 	u32 *states = data->psci_states;
 	struct device *pd_dev = data->dev;
-	u32 state;
+	struct psci_cpuidle_domain_state *ds;
+	u32 state = states[idx];
 	int ret;
 
 	ret = cpu_pm_enter();
@@ -80,9 +83,9 @@ static __cpuidle int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
 	else
 		pm_runtime_put_sync_suspend(pd_dev);
 
-	state = psci_get_domain_state();
-	if (!state)
-		state = states[idx];
+	ds = this_cpu_ptr(&psci_domain_state);
+	if (ds->state)
+		state = ds->state;
 
 	trace_psci_domain_idle_enter(dev->cpu, state, s2idle);
 	ret = psci_cpu_suspend_enter(state) ? -1 : idx;
@@ -95,6 +98,10 @@ static __cpuidle int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
 
 	cpu_pm_exit();
 
+	/* Correct domain-idlestate statistics if we failed to enter. */
+	if (ret == -1 && ds->state)
+		pm_genpd_inc_rejected(ds->pd, ds->state_idx);
+
 	/* Clear the domain state to start fresh when back from idle. */
 	psci_clear_domain_state();
 	return ret;
diff --git a/drivers/cpuidle/cpuidle-psci.h b/drivers/cpuidle/cpuidle-psci.h
index ef004ec7a7c5..d29cbd796cd5 100644
--- a/drivers/cpuidle/cpuidle-psci.h
+++ b/drivers/cpuidle/cpuidle-psci.h
@@ -4,8 +4,10 @@
 #define __CPUIDLE_PSCI_H
 
 struct device_node;
+struct generic_pm_domain;
 
-void psci_set_domain_state(u32 state);
+void psci_set_domain_state(struct generic_pm_domain *pd, unsigned int state_idx,
+			   u32 state);
 int psci_dt_parse_state_node(struct device_node *np, u32 *state);
 
 #endif /* __CPUIDLE_PSCI_H */
-- 
2.43.0


