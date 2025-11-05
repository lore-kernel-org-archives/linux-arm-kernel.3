Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51872CCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBOXj6ZoRN4JEjEYRQfoLq6weWa6pU54gR5QKGP+lBY=; b=KM/5JDoxf5wko3UcjbAVhtAnBU
	kXPvGb0Faop04zTjxwpuVb5j6EoThGMnhKZah4qpW/7YArcrxIzX3JLA3lNBvVuw5rSNAMBsEasl3
	xXiTN+HtGjVlPEhZ9va29Re0tjkWF59nsod+iswIvuoSiiHgKUc29cz0o2kZo3owcAdxXd3I9/RB6
	z6n8thzusQL1HBMHNK46D9DoTa1C25dfbJSYhQdg5uyKCWKS7PqFSqL4OeA6o5iFPLFv0MK6621Rs
	LqCtHsuyx7vO0rKUEUhA3ckl2SQdUL3AYhODYn7O+7tOswE7fkzMigHnZNXR/SfyaeDMa54fDeKl3
	Pw7HpbyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaDi-0000000DQr9-14D8;
	Wed, 05 Nov 2025 09:54:26 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaDe-0000000DQp5-04Id
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 09:54:23 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b70fb7b531cso509568766b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 01:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762336460; x=1762941260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBOXj6ZoRN4JEjEYRQfoLq6weWa6pU54gR5QKGP+lBY=;
        b=rnkybXAzDDjk31h18BGfXNWqg8gZ0glMluNAC5XN68ujRzMXP4imXzHeQaYVHGAe2i
         vGlR6rzSKvrf/7hZPcJBjDyC6AUMuuYhEHXt7iJTMy0ZFgg2Pqvid1PykcM/8aFBy2En
         vf8T+moDQxZI6rTJS0JrvSL18wgsRGN2Bv6ihlz6TvB3nlwsR/Cm63OKmxypylPNRBDl
         X0Ubdqg4f7a1qTtYiWlfe+yrb9v21jAggMzohAm0F79QXG3sZRSfotXKB/6rjOEPCsnI
         M2VTycbrLShMqMm24RiaKtP0E2j2BhFSKqjVHPTOpkeVmcu5CSPl85qBnjovCbg+pZk1
         ZNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762336460; x=1762941260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBOXj6ZoRN4JEjEYRQfoLq6weWa6pU54gR5QKGP+lBY=;
        b=pNj8yfykfJiD3og5hp86/pOv0BEqOkMlwerBsn/lv0jGjnU3i/5zTMEmqgPLJEpWXa
         VPreEmnuFVOhyVIrOPCY0t+mHbY1IOFdNab3yT/OhqUjs1lfMxFzOeG6v6k5boITqi34
         W0v/bgS2sZt8SeexxLBRTVRIOxh6XoA3eAVy0MsBit5GmYDywOvplpAWz0NwdMtawwtZ
         DAocv0EDOz43Wp+tAX/szcpII3AjWolRvneKshoGOGv+ZAr4KYpDpi9uJr/tUCKvAe8l
         seQ/8pI9/IIuEisiVaWt0CV7bc2XJPJ/A6tJNqCN5McOxIw0DxPoonbJr3WjOPhGli6/
         nEVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZrzHcTa/v3qC3OytG9UXIPGTWz5TPXz7g65ISaIZNc6A1ilIuaqZyyg6dLm8JUYotLuqb9A733aenFXDhkCsc@lists.infradead.org
X-Gm-Message-State: AOJu0YwmVB7EiFnrjSZFT9nqk2xRE6QaVghdZ8853KsV94mi17MI/3bd
	6L9AjX24vRPfA5Rxvit0NzlHP8NgTfl3tlcF+oWgYcUaHNoIJg4b9L5JFI4+nVwn/WQ=
X-Gm-Gg: ASbGncsumg3VenrqyNhNtt2BkKfUT9XixhRQejZa1+fMjVaxizRUnurjSmXs4kSyu/M
	sYR3rUzcmAk5ATM/3Q8SNcZ49kgS81p4HcoY4hDQ1IAChVFAkRQ8oHkmh5EPVhIZaragOZXh7D6
	KLkCH96XiMD1QMJG3jU2ND0sE0GAqyAPHcBowmaVkwqYYxwXpcbOYEo0ppxWq1k5WMJV0fWC36F
	Aepl9CX4mFfYTxaMZbekvW9uoIyieOZ++sRmk1xD8rWjJJKTjRj3Dy1UiU7Y1WOBUxbtr9rO76V
	o353XQ/H5g9BH1hxFE4wScqc7LU3AzaWU6Xk2iRhcqJcgjsOTdJnY2TFjJpuk0rsSKXzvfLXOL7
	kr73ZuwKfMKIAGEv3mULfaD0DfpJhohuxaTJ+PA0YOjqbAyiCXMhzw85LhU2Sr/YzD69gja8bXb
	T1z8UPnQNJWnPVhkIpy+Q9rurUCu+M
X-Google-Smtp-Source: AGHT+IHp4c9KbYsoS0hxUKU9/CE02Blmb8ma0MooZ5efB9d/kZmNsLVjvvcNZeCgcm6J7Atz+j6iyg==
X-Received: by 2002:a17:906:794c:b0:aff:c306:de51 with SMTP id a640c23a62f3a-b72651558famr253914266b.4.1762336460211;
        Wed, 05 Nov 2025 01:54:20 -0800 (PST)
Received: from uffe-tuxpro14.. ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fe37cb9sm442571066b.61.2025.11.05.01.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 01:54:19 -0800 (PST)
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
Subject: [PATCH v4 2/2] pmdomain: Extend the genpd governor for CPUs to account for IPIs
Date: Wed,  5 Nov 2025 10:54:08 +0100
Message-ID: <20251105095415.17269-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105095415.17269-1-ulf.hansson@linaro.org>
References: <20251105095415.17269-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_015422_081876_C2073AFE 
X-CRM114-Status: GOOD (  20.70  )
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

Changes in v4:
	- None.

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


