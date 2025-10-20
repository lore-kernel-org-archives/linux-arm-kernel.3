Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5A6CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGaC808GWK5LvOXihoY32Hd24hri1xoqdM6UgzacKUw=; b=WeQ60hpj2XgPktuc7GMCtl+Tth
	eQdLzJoUETELHSnQUnwFRxwa6rNdhGkE6Dxx2ojFqK2qTKkinGws+wl+5EYi6LUSx0CUXhwrg1wxb
	rDLI8O0hKpNWHMki52zpXM/tP9QDiTeefU8KwjJBWckPnp+3i22/wziyPViG5AWaah4u+LHidV3cT
	yPsggCeTuxBXJu7qUF7dgI3K+B/NzHqr68+j0hsz4cjanV1QvMKJ17Tsl4j/XtvPi+4LJHNV0AYaf
	03gLwotOjkj+ccguTD3WkUkB/KrMX3NONoKXrZA6FBxvgrW5RrexyrHC6J9dT2I/CFinN9vOK3dWb
	9dkZOJAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqhe-0000000Dvqx-3PgN;
	Mon, 20 Oct 2025 14:17:38 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqhc-0000000DvoR-0KUo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 14:17:37 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-36d77de259bso33384951fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 07:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760969854; x=1761574654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGaC808GWK5LvOXihoY32Hd24hri1xoqdM6UgzacKUw=;
        b=vDcygwhUEXb91hIBM6JxhG5g0tCoffFci8lEJDvJT+OMJfnAPV087VhRH7nWUH0wUq
         Na4OMjOphgVn9/054JvkHkkBepMjm3V4XuJA6RZ7EMXe41yjcFZvRKB5SEIPXXrNbyti
         iafi4tBmAv59sN3OAq4ZejRyQXuVsLZSAOFayoqH595AHpI3UpiQrzJibfBFp5wb6Nsu
         nL+/9mm2RXc0u44gv0MzaWI/wOa8avTBJ11NoHL0R5lg43mFNitNerq7Q9L7CqBLEDN2
         BXFUVq76dSKoa8MMFs5cu6LgzvbaOxNgrHCCcNEYS5sFjOMCHnBgp6TqWWGe9Ug8XcTH
         bQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760969854; x=1761574654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGaC808GWK5LvOXihoY32Hd24hri1xoqdM6UgzacKUw=;
        b=JiqPHpyD5yT7Lm3yCvHO9YeocvQx/W6+xJwkIBRUbr4/qNuHJGGQ/mfyclnQ1c0mnP
         HLUHJOkA+1ih5rzt90bZnpMOCKDn9R8+CGNXlSZPJIhZIFZnFY4MSkvTY5gA/q5LdNkB
         l/obzxJuBed3KVfZo7R0evp7R6XrNw3pr4ZINqzhNDMfbk9dl/jLd6klVxPDbL9rJe3s
         WyKNUawJ+IyYsRtPrSHkzhoPZyEwdox8RXHC7mhl8k9JpKlOVwJi3FLoCSru+CKoTk8e
         cboDr/su6qM+kX9geqZGwbU3AIUPSfd7abt9v0AhjvAunUs1toKQY/5stsREiWXK713s
         2GuA==
X-Forwarded-Encrypted: i=1; AJvYcCXSeXiiZF1g9kelA+r901dBZOSLn4/sft8mAP7WDYG4mkxK5hgShcwnVh/1IqI+EzMctyHFpjUd7LqK+jBTRRjT@lists.infradead.org
X-Gm-Message-State: AOJu0YyQiACDYtg5QeQ14QEDWDmZethQSf4pks/flbNNhmjI1TZU4+Lh
	HomG3/bPR0Mehvv/Bp1+kiROAm6DvAQ4hJcL/jX0zTchu3bbPBdk1NwYNjZu7NZx7HU=
X-Gm-Gg: ASbGnctGpEV/Q+tonchM1ujqCGLngg9R5fh97Ll5AO3Ox0PIMZCGGmZVMWGz3oQyK5O
	LbP0VUToGzNjOTU1BlGE4t7uJe1uWpk2WfvWY/Om0sYNyqWaefI26jUOOvpbxBs6iBfX0KivgIR
	Uyt/iJSV/wJriveEn31GZzMVnADSLvf/mq2pGS8qs215Dq5z7NQN60jp4YoDVc1asGuvv3Mlp+p
	Etfy6D3J6hkOAtbt6TuUYfWiDnkrEtYMUVq+f0kvmnvej9Bz1llf59NG8YAiJNWYmu6UE9xcLYF
	Xe4BOzdCL312SAMpGoLe2eMdnahv87kHzYUQFfRndZaVccWTB2tqr1JfCBnaqgwlUPdu/3eleKD
	w0bz3wfC4XCyFgTpWyCZb3Xf5oqI8Is/qUHVITAK9vXyhHfsRypcnBCsqVKaayrNkyd9KUymg4t
	bwgeNRrxqt82WquHixPz8zD6RCHyPrSW0HIiLOHGdIJFeUxXq8EwHRxtYnFhRX
X-Google-Smtp-Source: AGHT+IHq+N7kJam9BA4Q2VZUWH3bExEE+I696f8s201sUzMH8M2RHkReQkfdKWnv543fHUx9gbKhQg==
X-Received: by 2002:a05:651c:2343:20b0:377:c5b7:7bbd with SMTP id 38308e7fff4ca-377c5b77c4emr4089701fa.15.1760969853955;
        Mon, 20 Oct 2025 07:17:33 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a950a284sm20797191fa.36.2025.10.20.07.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:17:33 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 2/2] pmdomain: Extend the genpd governor for CPUs to account for IPIs
Date: Mon, 20 Oct 2025 16:17:12 +0200
Message-ID: <20251020141718.150919-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020141718.150919-1-ulf.hansson@linaro.org>
References: <20251020141718.150919-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_071736_160153_CCD1F7CB 
X-CRM114-Status: GOOD (  20.07  )
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

When the genpd governor for CPUs, tries to select the most optimal
idlestate for a group of CPUs managed in a PM domain, it fails far too
often.

On a Dragonboard 410c, which is an arm64 based platform with 4 CPUs
in one cluster that is using PSCI OS-initiated mode, we can observe that we
often fail when trying to enter the selected idlestate. This is certainly a
suboptimal behaviour that leads to many unnecessary requests being sent to
the PSCI FW.

A simple dd operation that reads from the eMMC, to generate some IRQs and
I/O handling helps us to understand the problem, while also monitoring the
rejected counters in debugfs for the corresponding idlestates of the genpd
in question.

 Menu governor:
cat /sys/kernel/debug/pm_genpd/power-domain-cluster/idle_states
State          Time Spent(ms) Usage      Rejected   Above      Below
S0             1451           437        91         149        0
S1             65194          558        149        172        0
dd if=/dev/mmcblk0 of=/dev/null bs=1M count=500
524288000 bytes (500.0MB) copied, 3.562698 seconds, 140.3MB/s
cat /sys/kernel/debug/pm_genpd/power-domain-cluster/idle_states
State          Time Spent(ms) Usage      Rejected   Above      Below
S0             2694           1073       265        892        1
S1             74567          829        561        790        0

 The dd completed in ~3.6 seconds and rejects increased with 586.

 Teo governor:
cat /sys/kernel/debug/pm_genpd/power-domain-cluster/idle_states
State          Time Spent(ms) Usage      Rejected   Above      Below
S0             4976           2096       392        1721       2
S1             160661         1893       1309       1904       0
dd if=/dev/mmcblk0 of=/dev/null bs=1M count=500
524288000 bytes (500.0MB) copied, 3.543225 seconds, 141.1MB/s
cat /sys/kernel/debug/pm_genpd/power-domain-cluster/idle_states
State          Time Spent(ms) Usage      Rejected   Above      Below
S0             5192           2194       433        1830       2
S1             167677         2891       3184       4729       0

 The dd completed in ~3.6 seconds and rejects increased with 1916.

The main reason to the above problem is pending IPIs for one of the CPUs
that is affected by the idlestate that the genpd governor selected. This
leads to that the PSCI FW refuses to enter it. To improve the behaviour,
let's start to take into account pending IPIs for CPUs in the genpd
governor, hence we fallback to use the shallower per CPU idlestate.

 Re-testing with this change shows a significant improved behaviour.

 - Menu governor:
cat /sys/kernel/debug/pm_genpd/power-domain-cluster/idle_states
State          Time Spent(ms) Usage      Rejected   Above      Below
S0             2556           878        19         368        1
S1             69974          596        10         152        0
dd if=/dev/mmcblk0 of=/dev/null bs=1M count=500
524288000 bytes (500.0MB) copied, 3.522010 seconds, 142.0MB/s
cat /sys/kernel/debug/pm_genpd/power-domain-cluster/idle_states
State          Time Spent(ms) Usage      Rejected   Above      Below
S0             3360           1320       28         819        1
S1             70168          710        11         267        0

 The dd completed in ~3.5 seconds and rejects increased with 10.

 - Teo governor
cat /sys/kernel/debug/pm_genpd/power-domain-cluster/idle_states
State          Time Spent(ms) Usage      Rejected   Above      Below
S0             5145           1861       39         938        1
S1             188887         3117       51         1975       0
dd if=/dev/mmcblk0 of=/dev/null bs=1M count=500
524288000 bytes (500.0MB) copied, 3.653100 seconds, 136.9MB/s
cat /sys/kernel/debug/pm_genpd/power-domain-cluster/idle_states
State          Time Spent(ms) Usage      Rejected   Above      Below
S0             5260           1923       42         1002       1
S1             190849         4033       52         2892       0

 The dd completed in ~3.7 seconds and rejects increased with 4.

Note that, the rejected counters in genpd are also being accumulated in the
rejected counters that are managed by cpuidle, yet on a per CPU idlestates
basis. Comparing these counters before/after this change, through cpuidle's
sysfs interface shows the similar improvements.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v2:
	- Use the new name of the helper function.
	- Re-test and update the statistics in the commit message.

---
 drivers/pmdomain/governor.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/pmdomain/governor.c b/drivers/pmdomain/governor.c
index 39359811a930..ed2ce9b6f8d1 100644
--- a/drivers/pmdomain/governor.c
+++ b/drivers/pmdomain/governor.c
@@ -404,15 +404,21 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
 		if ((idle_duration_ns >= (genpd->states[i].residency_ns +
 		    genpd->states[i].power_off_latency_ns)) &&
 		    (global_constraint >= (genpd->states[i].power_on_latency_ns +
-		    genpd->states[i].power_off_latency_ns))) {
-			genpd->state_idx = i;
-			genpd->gd->last_enter = now;
-			genpd->gd->reflect_residency = true;
-			return true;
-		}
+		    genpd->states[i].power_off_latency_ns)))
+			break;
+
 	} while (--i >= 0);
 
-	return false;
+	if (i < 0)
+		return false;
+
+	if (cpus_may_have_pending_ipi(genpd->cpus))
+		return false;
+
+	genpd->state_idx = i;
+	genpd->gd->last_enter = now;
+	genpd->gd->reflect_residency = true;
+	return true;
 }
 
 struct dev_power_governor pm_domain_cpu_gov = {
-- 
2.43.0


