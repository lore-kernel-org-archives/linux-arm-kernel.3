Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EE9CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9aIatXLlfj49i3F2CejCYzrKCiTw8TnzOpfYBQFqbQ=; b=IDTus8U3A6zuGzkBPzZWUpxCo7
	/iFvMGTMi6YZR2o5TwUJsqQFyHA1cCkbZ+Kg+bTK9QcO/erP3XqYKFM1ctY871GA/8ITDK+P3fEf7
	iNEf9xMBO1fJBkTa6DQLeElOlc/YjhhZ5QMHJxvJZp+UYuSgs6QBfOaGRBDQhgrG6Rfd33zwc+uxI
	4fHEN/q8j3ubTA2O3BRkKNKeXOip6Guj2G7+UtWQA60GPmpv4lRM2Ov1ereT0bp7YsHMTdYVAEpeH
	PWfc+UQPhEKAhbt5x+2wXvNFh/SEDBygJHJRQr3Ehp84XmhvJsVj2eaHuNaaE8Qa249/hGz5Dg2Za
	xCvjAUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmst-00000005yYr-17WI;
	Fri, 31 Oct 2025 11:01:31 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmsj-00000005yW6-3ZMu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 11:01:23 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-592f1988a2dso3391720e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 04:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761908480; x=1762513280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9aIatXLlfj49i3F2CejCYzrKCiTw8TnzOpfYBQFqbQ=;
        b=ZaxoTXjVwvDv9PBCv0zKE/XYvATI7HYxjvPlVcIXNnN5MlQtzeWmcam3YZ1XQwUy2X
         xK/VX2bNrBZbihyF60njDG0QdnrIrTbUNqxlQYIt6Mr8TODS0vJkknZM9YMB0o0zdUGD
         XCQM51u6+7XUAVtC+s65n3hnj6FsSSs/vfZl249x0tOyyGwy6iobPTbvn3mEpoA9WQFf
         r3JaguzDc1+XNGBGPJKeahT7CpiAWX88tpQaxORIxG8EJTKzDWFvpjclGVf+dDwBmmi4
         KGFFEbRwkH2EmOGjooBTcDFzuRm2mb2MPgCh86FGo2H0J5dSAST4WkUdD7mDeXI/wTVq
         mSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761908480; x=1762513280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9aIatXLlfj49i3F2CejCYzrKCiTw8TnzOpfYBQFqbQ=;
        b=o11NwPp6S3Djhv5M6UW0gEkWjQqaOlNgV2wlZYEaP4vP/CqKDDKvIXHK0cUMwALp9G
         dKRz0qGjSPlQIadMhYJubla6wiWPPkau4bxP/IXsvIJcWbc+6lfsBJIyIoGp0+J6p+Xn
         PzJjjFjevrW7ONwY10MC2h9yvZJu6OaNXfyXznfOyIuS2wrddU8kg+GRVaeg3paSQXK5
         wguusWqxvtARw644jXiSdig0cOYo8ESrLL0YGq9AEjmRrU0zEvcOjv95XEIBolR2lOhA
         nNsAh7U0/8/tx3hrYWcp5khRcumluEB12DizE+EmGuZNHyRAspd8mDaO7vGB1BsAzboE
         1jMA==
X-Forwarded-Encrypted: i=1; AJvYcCXwLyPLOIPNp6gKHvp8x0Ny7io0YaRMMH+VtjSEl10UOMWL6h0zzfqcBJ0OKCAqQvVF7CYbsvfWGIJbIb1/7ufr@lists.infradead.org
X-Gm-Message-State: AOJu0YzPU9TfsRhZo/05Phakdtv8Jw4auJckMR/n4rFZNSivQ4q+0Lmi
	zT0w6Bgne4+8i1WiiwnW1rjUZO1oLY6vp6xyLIfN8zvfhnwxdWzZALBWK4a9gbW16X0=
X-Gm-Gg: ASbGncu0DuiW4HuUaOrwIgR5ixWOh/lM17Pdcm4ht3mLW8wtbw1hoYrYNQntV5IOLDz
	jyp9wJpU7P9iwlJEIlbHf4EU5LQO0Ak8vg2l/olOuee9Ryyyh7Ax/PTME3tD3+5OSUdHT+bme21
	YBfaz6hqQghDqcPWNjwYA0actW4mLPldK1yz9qi9FFMtZ7qyWtilPwRAxAXXVXhz/eUY/HthjYj
	8PLyej0SnLx2IjN5e6//hSEocag4328moNpMp97uw/rR6cCEAVkeUAZeaY9nQPvOxFFKbpVmvsc
	Q7Pvytx5cLWlmxDsfKEu4lEhrWw9DWi9H2+mGQY+jApc/3GPI23rhoQqUW8pRmro6buXNpX3cz8
	9B12U1IqBC5TmyV1do800wYu7ybI/iuY6dfePEehN/pDw9eZ3gvUdC3RdgmdIV0fqNvMcl1b4s2
	6oQHlcdiTENtea6vv+Ftil1LkG5UKQwntqJ+W5iLNKhdaFNO02HY0MFBYVCCFc
X-Google-Smtp-Source: AGHT+IEvmMm+SHsTsxbA+wx4szbKJtnGkNvIOtF29kV79GhvswIxNRBqKo3y48TrcsBUClr8bRcn2g==
X-Received: by 2002:a05:6512:b92:b0:592:fc90:f771 with SMTP id 2adb3069b0e04-59416d06f68mr2302670e87.1.1761908477406;
        Fri, 31 Oct 2025 04:01:17 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5bbaa9sm432721e87.77.2025.10.31.04.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:01:15 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v3 2/2] pmdomain: Extend the genpd governor for CPUs to account for IPIs
Date: Fri, 31 Oct 2025 12:00:58 +0100
Message-ID: <20251031110106.62394-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031110106.62394-1-ulf.hansson@linaro.org>
References: <20251031110106.62394-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_040121_958667_A9C93A93 
X-CRM114-Status: GOOD (  20.44  )
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

When the genpd governor for CPUs, tries to select the most optimal idle
state for a group of CPUs managed in a PM domain, it fails far too often.

On a Dragonboard 410c, which is an arm64 based platform with 4 CPUs in one
cluster that is using PSCI OS-initiated mode, we can observe that we often
fail when trying to enter the selected idle state. This is certainly a
suboptimal behaviour that leads to many unnecessary requests being sent to
the PSCI FW.

A simple dd operation that reads from the eMMC, to generate some IRQs and
I/O handling helps us to understand the problem, while also monitoring the
rejected counters in debugfs for the corresponding idle states of the genpd
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
that is affected by the idle state that the genpd governor selected. This
leads to that the PSCI FW refuses to enter it. To improve the behaviour,
let's start to take into account pending IPIs for CPUs in the genpd
governor, hence we fallback to use the shallower per CPU idle state.

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
rejected counters that are managed by cpuidle, yet on a per CPU idle states
basis. Comparing these counters before/after this change, through cpuidle's
sysfs interface shows the similar improvements.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- Use the new name of the helper function.
	- Minor updates to the commit message.

Changes in v2:
	- Use the new name of the helper function.
	- Re-test and update the statistics in the commit message.

---
 drivers/pmdomain/governor.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/pmdomain/governor.c b/drivers/pmdomain/governor.c
index 39359811a930..a46470f2261a 100644
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
+	if (cpus_peek_for_pending_ipi(genpd->cpus))
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


