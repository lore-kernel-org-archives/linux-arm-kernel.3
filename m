Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C7FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nbi6KRQjupOc9B3Hw9OyBwJ8mgQgydOW3Gn8fR9ycYc=; b=yXlGUs+wu4i5BJgaN4I3AKOv0v
	Zlb9HH97pBi7XGFEZnNfQ8Ll39UQAVNa2K60aTjQw2k3kcywS17Xr0KfcNbqWqsDaY3n7Y5XCdnce
	UbWVDWVWKRNpy8BwUdAJkNbws0FXOaegDrSfGj6lm++PjEK2DrbJcayq/QDg8+xW9MDfgh1rTID7T
	7c2QfzYXs6Mssm/3dRpzZxnYUE2psBKIldgxkJz2D0gMgnNI9m9IXTL4wkvXSMvYgjcfXYNojSnTP
	q+anPkvEmj6+ZaamVOFV43r6ZborsRH6NnSk79MvEhvjsNam+GWBA9nJ/ZaPgaTYLLcWSzH/R0QhK
	lBQHhAJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbwa-00000006nWL-3aBi;
	Fri, 03 Jul 2026 11:20:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbwY-00000006nVz-459b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:20:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rZgi3136093
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 11:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Nbi6KRQjupOc9B3Hw9OyBw
	J8mgQgydOW3Gn8fR9ycYc=; b=KN9xvv4pbKCDOdA5N4lwhvzoE/Q7UihobnSlPm
	98K4FXR8O6ViaHlMmxjk+tYAABcQvX+dI2hRKYAuVRuvTttTIj3k6RBgNovL08/J
	HF2NHi1L1cwvzr0jzbkq49FfjmXQMPRNNSTCTuFL8NqhLTHSk9pZyLLiTptsEonm
	GW1oPCq4+VcUhXln1i3C3EBs9FAwPAvO//LXraZu29cSJlyQyw1VvBcqG7duV8aC
	u8CuHvrIKs2yRlDA1qjBF3FY4TSUzafF3R/dmLD76yn728PM2cxkWh8bwrRQhG+L
	uUWKMZlC3bu5jS3PG1U82Loa0JmUhTP0vCYtFJdyEZVrUHYw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5a197-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 11:20:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8478d2bea7cso1679144b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077625; x=1783682425; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nbi6KRQjupOc9B3Hw9OyBwJ8mgQgydOW3Gn8fR9ycYc=;
        b=Q7W2p3mjcLulZxLjVqgYRF62MOosa+hOoC0/Td1dVw6/a/3CN7DaycVNCayAZ7YM9y
         MDoghQUaN4gijiv+5I6L0oF4IjB2od3skpbMiAf85yGO86EnDxtVoCoYqg2DaZQ+Mmie
         I1lA2YHtW9OR03o/UO1MsBZKGExfNpwIyPyHN+4Fl2x7kKbkHiexRZCGFO2MiorV/3+v
         tt1qIoPd4ReSewnNlugRAg4lWEXiDumTWVsAkijP/VqL2RN9AjPkXYtS8uapFYHTAk6f
         sMnkX17goNAi8nTf2jbFmdwn6mxGQmD4Ba2EA4xuXtIbBOjF4t6Ufay5FfEgA3EgSqov
         Pj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077625; x=1783682425;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nbi6KRQjupOc9B3Hw9OyBwJ8mgQgydOW3Gn8fR9ycYc=;
        b=EnD5Lfal0aZB7OlmcTfFTzJOO4inkXHaqEGL5rxvvuaDB6ZjJyFflvFh4tj/k4d30Q
         W1Vv5qiW++hzV4y7Y+jcGDrZHzS/iaXOvASLXAJ8HtCnuCIrmjpaedq/21YVDZjXE2qg
         HmHpxtgpQIM3mlrOwiXknVVHejco8r+1e+A7iWeCrR1KshB4Im4J5bwCCVE9zMDl81gD
         0CnsgXAjeZOIDzqURCX7AsPhUQ4EWL+KRCynCDHODOGovMMTz3Jdj6o7lnf7Yb51EhrT
         8ZkiAV9Iwtz19e4qY5hNBt+8Qwv4AfyMg5v/QwILZh62Z3IfdehfdeZYguTM1Sy42QeP
         dtgQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxftTHR1NmxwQJ/eXXMK329maWFTEano3lCSNuzag2Vo3bonyNUEwREr4d+yTqHKurjHCez8EKNafLSbZv8uT0@lists.infradead.org
X-Gm-Message-State: AOJu0YwWA+TnEpDBx1oihxmZbsEIA8ER3SDj502LkZE6FDk+kMLUG5l4
	1/RBlgGqnbU65ZuF+pBM0nLbt+O7AoL2WAwhk4hcXiOFTYBAsHt3ZYCYV0kDk3a2S4Bwp62mF/N
	kuDfEaXURK7RoWMyaxNKKzxu4NTMUKhPMBJJtHvI/IEot/4qv8eXsnuq5hJoW83IWfWORczCMF5
	Q5wUFkAw4TtA==
X-Gm-Gg: AfdE7cmQKB/UUVRpKLzOX+TpIG9FDp6Taga88466Eg+2NoxgpqVUWBAgzQpCkA0TanL
	KOLK2lKxd0Jfas3mqla83Ae97zhQfXI+ToElyKpo74vp8tzTgTImXtv3AYFPKrGNWiY90TfTfAB
	unYqrzRqyb4T9gNP5mM6D+s6yk30jI3apSdzCFWw98kJmeHIubPIZWlXRSINaH/c1XueBDBSH6P
	vO1FfNoQwi0EetM5EmC9PvjxWgELXrnMbBOLi5cNilPMtg3/acQ2M/X0gdhl1/DXwQ3r/ka2AlU
	G4z1xqCxD3E2mjJL/ux7fhDJlgM80NeNjxN3s0baw+WLrUGa1w+wfwmKCuHoZSehVufLUq4yQfr
	VP5t2VREoRHJPw8GNKNoChImg4wlDxXmuVW9QzJWk
X-Received: by 2002:a05:6a00:760d:b0:842:dd4:d9e2 with SMTP id d2e1a72fcca58-847e14f59b3mr2793942b3a.0.1783077624654;
        Fri, 03 Jul 2026 04:20:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:760d:b0:842:dd4:d9e2 with SMTP id d2e1a72fcca58-847e14f59b3mr2793906b3a.0.1783077624149;
        Fri, 03 Jul 2026 04:20:24 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9902efsm2728261b3a.45.2026.07.03.04.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:20:23 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 16:50:02 +0530
Subject: [PATCH v2] arm64: Disallow disabling boot CPU based on config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOGaR2oC/3WNwQqDMBBEf0VybsSkGmxP/Y8iEuOmLqhrsyot4
 r83FXrsZeANzJtNMAQEFtdkEwFWZKQxgj4lwnV2fIDENrLQmTaZyc6yRbZND3VDNNduWmryvsc
 RJDS5LwrrLsZrEedTAI+vQ32vInfIM4X38bSqb/uTFv+lq5JK5s6UHpQ1zpc3Yk6fi+0dDUMaQ
 1T7vn8Adw6SFMcAAAA=
X-Change-ID: 20260603-disable_boot_cpu_offline-eb4f55ac96f2
To: Thomas Gleixner <tglx@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783077619; l=2434;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=0u/Hn+/+Ov7gEwvAy1Fe3xpUvD2U1MX/9snOD6f2Czs=;
 b=hbLYt8wNQd74NPxFoeXBJoSB7L3HKgJpB/Ls7t3cgm/7vJoy7ZGbGg42hEtIT52O+ZE3Q8A6B
 hCZVB2RQnT/DdbHMHTz+jp70iryzWvl1fEkWXrMd/jM/UvAtzP0gx6j
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDExMCBTYWx0ZWRfX5VSWZfKtGg+p
 NasoY0nuRmjNPzBJGYTfAiQgUrqmV5JI9F3g/Ef+y7FjStplhCv5lAK3mVFYQyp4azb8eCB4onT
 eBm6bPx63xnABfdJKaHMRA5hEVwZWow=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a479af9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uPx51MvRb-IBqrSjUCkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: v1wHq0Pa-kXMyR6ZtqUeLKgzrHmxECTe
X-Proofpoint-GUID: v1wHq0Pa-kXMyR6ZtqUeLKgzrHmxECTe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDExMCBTYWx0ZWRfX7gptChE3X3zH
 9NwD4CcCyTePQDlNRtd6ulj49VUuOWTBrWKaE72c3pouhGGH02ngwdY0Zxps4U3HrdG8BVOPjQK
 c6zkahvjIDc3v7fPk5jYxlJDbJp0F/AYs5yGrYiiqjWx0KwFEHRoUhK5FSSZMEQLpZ5JUxpRW2B
 lIf/S36nu+ulPiMZ4XgeLSw0sOU24Hy/gGIuCr7vZfuvi40TpoQ45jXkZqRITJmShxmc5+zc/A7
 FAlOYLCwD2POvLUMFOU7/KKrUnpiEJXhYLrwTR3GJbzKedCBpSMOz9rvoLZMdxdMiGCN5J2WAK6
 gi1otcAvT1k5aWedOqs4n1nemReHojtryTQ1T/ku3UbevzAzDx5fNI16aVDQXcb6ssfVYSXKkzW
 bRm0vFNnBlPwcUMGGVk2yhxw8LCr0sUrtEt8UwdOlh1moNPdGCIXqmxZMZ/xM/yYLUomTy9ShTi
 Y+92ecZudGZ5yiiIb1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1011 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_042027_039164_96D54DCC 
X-CRM114-Status: GOOD (  17.15  )
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

The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
the SoC to ACPI S3 similar state where SoC is turned off and DDR is
retained. The hardware design on these SoCs forces a constraint to suspend
and resume the system on boot CPU / CPU0.

If CPU0 is already offline before starting suspend to ram the
freeze_secondary_cpus() picks alternate CPU as primary / last CPU and
proceed further to invoke PSCI SYSTEM_SUSPEND.
This leads to a system crash.

In order to prevent such an issue introduce PM_SLEEP_SMP_CPU_ZERO_STRICT
config and when enabled prohibit the CPU0 from getting disabled.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v2:
- Moved the check to arm64 specific code.
- Link to v1: https://lore.kernel.org/r/20260605-disable_boot_cpu_offline-v1-1-4c68fe1a6cf8@oss.qualcomm.com
---
 arch/arm64/Kconfig       | 9 +++++++++
 arch/arm64/kernel/psci.c | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fe60738e5943ba279e5571862423df4fed3db661..21697a535a25d286a2f8afe4921a41b13cc32c0a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -263,6 +263,15 @@ config ARM64
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
+config PM_SLEEP_SMP_CPU_ZERO_STRICT
+       bool "Disallow boot CPU (CPU0) offline"
+       depends on ARCH_QCOM
+       depends on HOTPLUG_CPU
+       depends on SUSPEND
+       help
+         Disallow boot CPU (CPU0) offline when the suspend_ops->enter()
+         has to be executed by boot CPU.
+
 config RUSTC_SUPPORTS_ARM64
 	def_bool y
 	depends on CPU_LITTLE_ENDIAN
diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
index fabd732d0a2dfee37074ef4ebb6ce5894871c8bd..4ad90ae6f8bacf0cbd3203d66580107d467ea232 100644
--- a/arch/arm64/kernel/psci.c
+++ b/arch/arm64/kernel/psci.c
@@ -49,6 +49,12 @@ static int cpu_psci_cpu_boot(unsigned int cpu)
 #ifdef CONFIG_HOTPLUG_CPU
 static bool cpu_psci_cpu_can_disable(unsigned int cpu)
 {
+#ifdef CONFIG_PM_SLEEP_SMP_CPU_ZERO_STRICT
+	if (cpu == get_boot_cpu_id()) {
+		pr_info("Disabling boot CPU is not supported\n");
+		return false;
+	}
+#endif
 	return !psci_tos_resident_on(cpu);
 }
 

---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260603-disable_boot_cpu_offline-eb4f55ac96f2

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


