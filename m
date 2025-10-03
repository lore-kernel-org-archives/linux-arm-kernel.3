Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8407FCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 15:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ox+4Or53Zo/RT8nK1iXRO8MRcxCOezKN0PgiKGiKSzk=; b=W8f5QnYb4wcLJuIYu+z1Ni6Bb3
	cRG0hKWKQ1K8QKLT6UjwtKcRGIZunOhykIvPmEV3oaUIzl3dAvkAMf+3xmaGzcd6l0unnf7/fEybL
	EZ/AhDDTqk8qVWlKhTc13b3nunRbE6vDK7dns4yjmxqMplq85Svb4iaGjPKC+vWF1bXw8PCGkGS6+
	rT/Hs/fhCBJlyB7kdajP0qXRG1qcGOvbH7PAi1ZGAcQ/dcQT3zkFr0Bf9EoZYUx3jbiB3osZuTa+F
	Qd1DdHQ2W7G0U2q5zd5qmoxtmn9RCTbEBfGW5k2zDDsVJIo84mUd9mrkz/d/AOSZFW/f0waoDwqGX
	55V9TK0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hJX-0000000CcSx-0tc0;
	Fri, 03 Oct 2025 15:03:19 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hJU-0000000CcQp-3FE8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 15:03:17 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-57e36125e8aso2239858e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 08:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759503795; x=1760108595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ox+4Or53Zo/RT8nK1iXRO8MRcxCOezKN0PgiKGiKSzk=;
        b=Cp2SVIJCvhSCN6N6qdPS1WChqFfPdCl4We9Pw+a2V5myswg8rAJyEpUyyxrztrhzCS
         Bh6LwLVtxTmdD3+FuVvJcEXVIqut6Y6gEk0xSF20EVLcsPXKlrioTCy22d6iOr7RpwYN
         imCk1DsIF7c5iG/CxRhzFxQ7Qnxae/bI1VdMM7D99loFRUqyp/dSLpMMAlbCmConsQo/
         TlzMDPktYlf5DT3I9xndEyHydhfWYzC8lJvTyXjWluYPCOMKkI5mzRBfUmKXOha91QOJ
         IpAlVzQzM6UAm2Rruu87IRk2p98vSq1jUvERUa14rlXzqtAuk4k3fApKVOwlYzVNDHiE
         5TOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759503795; x=1760108595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ox+4Or53Zo/RT8nK1iXRO8MRcxCOezKN0PgiKGiKSzk=;
        b=s8YsghydMRE0CbvdzY9eeA7cz0vZdawDQLWpcm/W79iL8bj4yUN71AfPWEAaORyADp
         +jinPNwuXGBN58FjTfWq40U60ksuXDpPbM0WyGWoo5TB86IWavoTosOXIxekut70DmNJ
         DTPrqD4BrE+w5BdF2cicObW6yhQYNWEO21dBlyWTNlXOY56V+PMQDCMw5o9ovpMzQNg2
         LY6nMnHbFMb2teZa10/zIWQsA1eFlsow83jROdUo/E7vrL/58TTnis+1cikv9/fdhG/i
         Cj3LXi+Z1b3elSx8/FutmqoevaCYcxvOkoBAb0CxjBybxXMNJ0WQ4HEc8uFMTeAgFcHz
         lKxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6gvRQFZZ2m3YFGf0QHpTuD8+Ip2TnsZ8+CPhN4IUyFeBTUVmQfv/emNi72fllIsD+ejrarhbonaER5hS4L4ef@lists.infradead.org
X-Gm-Message-State: AOJu0YyLaIVvuSzuPWv+6zpntvQjf7QYMXbAunE1123xt4xMNofG97S7
	nNPcpLDCNrLUlVtOfHk88IEk/+Powx5yBotnQXmACuqB5RB6ymHtkV0qEvYyGXd/lPg=
X-Gm-Gg: ASbGncv23L9W3Rv3nYqcLrDoqlYQCFXOJKZCfkX3za7pOhidhllwuID7Y3MlS/F8q22
	3SSuMcdSOZrQ6PC6wxEsJa6pFVkIJ49sXmLatSG/BGn1HYBbCjiMz3+yBsdhvmKJPLgp1IUoEzu
	dZyaz71ZvbziWjgJL+LDvS1HS4NnCSjmUP8h0EtXTXLctaxOTR0OQ8Bq5iJLfFAufK35hLTYvT+
	wT2+uHwv1RQBmpigMV74za/lnrse2CmlidJ7RhXhIMR6yzBkxsycYrJHrdF8Qt3af/hEDVX2aiM
	boSH4PymsfKT1r0xtdb31LJxQF9ZpozfWz32B7tYWf32JU4JOOu44v9I4AgM65lUtJIICHBolno
	vVa+5Lel3qzepnLefHM+lLtKcka1W/Hq64Dm1SpGco1SfRbGT5YPpkGUQlXGsooMqj8udW807oj
	s7G84j/U5aDs9WoZQsNGWvmz1F/RZkeKe3zY4=
X-Google-Smtp-Source: AGHT+IH13UMFUj7Zpgvxqzpadk8FthG6NhdcXG10MwTPwlzbyaOGt0KOWk+7mn3p72gNfh5AfAblSw==
X-Received: by 2002:a05:6512:3e10:b0:57a:de0d:d9ce with SMTP id 2adb3069b0e04-58cbb90df9cmr1031413e87.44.1759503792699;
        Fri, 03 Oct 2025 08:03:12 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011343b6sm1933369e87.35.2025.10.03.08.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 08:03:12 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Maulik Shah <quic_mkshah@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 3/3] pmdomain: Extend the genpd governor for CPUs to account for IPIs
Date: Fri,  3 Oct 2025 17:02:45 +0200
Message-ID: <20251003150251.520624-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003150251.520624-1-ulf.hansson@linaro.org>
References: <20251003150251.520624-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_080316_847548_3176886F 
X-CRM114-Status: GOOD (  17.76  )
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
S0             1994           551        10         24         0
S1             115602         801        4          56         0
dd if=/dev/mmcblk0 of=/dev/null bs=1M count=500
524288000 bytes (500.0MB) copied, 3.622631 seconds, 138.0MB/s
cat /sys/kernel/debug/pm_genpd/power-domain-cluster/idle_states
State          Time Spent(ms) Usage      Rejected   Above      Below
S0             2462           766        14         202        0
S1             119559         1031       9          253        0

 The dd completed in ~3.6 seconds and rejects increased with 9.

 - Teo governor
cat /sys/kernel/debug/pm_genpd/power-domain-cluster/idle_states
State          Time Spent(ms) Usage      Rejected   Above      Below
S0             3212           990        16         245        0
S1             202442         2459       13         1184       0
dd if=/dev/mmcblk0 of=/dev/null bs=1M count=500
524288000 bytes (500.0MB) copied, 3.284563 seconds, 152.2MB/s
cat /sys/kernel/debug/pm_genpd/power-domain-cluster/idle_states
State          Time Spent(ms) Usage      Rejected   Above      Below
S0             3387           1046       16         265        0
S1             206074         2826       19         1524       0

 The dd completed in ~3.3 seconds and rejects increased with 6.

Note that, the rejected counters in genpd are also being accumulated in the
rejected counters that are managed by cpuidle, yet on a per CPU idlestates
basis. Comparing these counters before/after this change, through cpuidle's
sysfs interface shows the similar improvements.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/governor.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/pmdomain/governor.c b/drivers/pmdomain/governor.c
index 39359811a930..7e81dc383269 100644
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
+	if (cpus_has_pending_ipi(genpd->cpus))
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


