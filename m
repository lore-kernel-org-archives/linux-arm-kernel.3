Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEE2D33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OGZekl39DzQk3gPXzj5m3/fX/JZ09Ijuh97AGPbBD8=; b=jTrqB3HerdByne0Un+n3fCjq9V
	y4vVWgbyRHkq12Q3gsCYpuFeFUupd9X0wM+IF3L+yEK/yrAVSV+t3ns2VVgxpq7KOeZjOVG7e3WQ7
	SR377TDRZgfPtz33X+YRcv8vqq+VNcKj7uCGnQpC5x6wWvrYfZVf/fyUiIe2Sx4oXyRn9Z5rm9fJA
	t/BgRtxvuTy0ncy7yOMOGbtkqmdRhAYX+DxwXy410j/Jr8xttsmUTggcoMtvkKmKnDne6zodena05
	mDnqfjc0dkVqGO/KT0nb0oTBww6uQhGkZDlL+7x2n5tKyMcSjBNjOill4NJ5HQEthwPs2nSA70ywh
	z1asN7Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5REN-0000000BDno-499J;
	Mon, 28 Oct 2024 15:00:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QeK-0000000B6Xg-2WDv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:23:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 158305C56FA;
	Mon, 28 Oct 2024 14:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E12C4CEE7;
	Mon, 28 Oct 2024 14:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730125396;
	bh=yl7Mfs856g30vpNRTxQo0XG82uyk/8hEkmCtSRgI5BE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mffzb+IZ/0b3uzci/Q0aZsGlREKdAflGhK9yFluzbPp8ILpQeFqZJV4CKWQQGMrgR
	 NyxCydIX83gVfMkZMPYQWFWG2I8ndKIvBI7qiSNo9VgdKlTMA6rtAV6SoX0Uy1OVWj
	 VuKuaH6lnzLvE6T5rC29dD0NgdxQ6alkw++42ZfhGUJn6JdKgNd1ElrcxGpTj8trd0
	 FkgNAM1zS0vjT3bF9g9RW0AsMWWvKka85fcAK2KFGRgKXtNQVabkyuYNaBEv8Pos5m
	 dx6HuPQnKUUap8JUH07gFuhmBGtiOrvlCDdkZIlGDWWahkxj/BQsprRgdwsrrVGZS7
	 jHZtTG1POO0Fg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 28 Oct 2024 15:22:59 +0100
Subject: [PATCH 3/3] firmware/psci: Allow specifying an S2RAM state through
 CPU_SUSPEND
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-topic-cpu_suspend_s2ram-v1-3-9fdd9a04b75c@oss.qualcomm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
In-Reply-To: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730125380; l=3714;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Bf2hbCxvBem19Ny5a2acnQioUv9USzkxEe/DauTX7oc=;
 b=FlN28QeiFZU8O2MvaHh0SMZln2dKNtdGQHi7Hs7jxj9PC3ah05CBwHvJH95lZGaASdtMNjQLk
 1fNmg0+xUfyDeRqvE0W40TGGMjzDjMITQEIDQ9a0cduZox0+iTIK7WH
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_072316_766668_5BA507A6 
X-CRM114-Status: GOOD (  16.32  )
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Certain firmware implementations (such as the ones found on Qualcomm
SoCs between roughly 2015 and 2023) expose an S3-like S2RAM state
through the CPU_SUSPEND call.

This works exactly like SYSTEM_SUSPEND. The PSCI spec describes that
call as optional (and only introduced in PSCIv1.0), so not all
platforms expose it.

Marking a DT-described "domain-idle-state" as such isn't currently
well accounted for in the PSCI idle topology infrastructure: the
cpuidle and genpd framework are deeply intertwined, and trying to
separate them would cause more havoc than good.

Instead, allow the specifying of a single CPU_SUSPEND sleep param
under the /psci node that shall be treated exactly like SYSTEM_SUSPEND
from Linux's POV. As a bonus, this way we also don't have to fight
with the genpd idle governor to avoid taking the S3-like state into
consideration.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/firmware/psci/psci.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 0e622aa5ad58bbe69dfc3a71bced597618e73f15..20ae6a6d59a9f276db75260b6ca1a5827e443782 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -78,6 +78,7 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void)
 
 static u32 psci_cpu_suspend_feature;
 static bool psci_system_reset2_supported;
+static u32 psci_s2ram_suspend_param;
 
 static inline bool psci_has_ext_power_state(void)
 {
@@ -519,10 +520,10 @@ static int psci_system_suspend_begin(suspend_state_t state)
 	return 0;
 }
 
-static const struct platform_suspend_ops psci_suspend_ops = {
-	.valid          = suspend_valid_only_mem,
-	.enter          = psci_system_suspend_enter,
-	.begin          = psci_system_suspend_begin,
+static const struct platform_suspend_ops psci_system_suspend_ops = {
+	.valid = suspend_valid_only_mem,
+	.enter = psci_system_suspend_enter,
+	.begin = psci_system_suspend_begin,
 };
 
 static void __init psci_init_system_reset2(void)
@@ -545,7 +546,7 @@ static void __init psci_init_system_suspend(void)
 	ret = psci_features(PSCI_FN_NATIVE(1_0, SYSTEM_SUSPEND));
 
 	if (ret != PSCI_RET_NOT_SUPPORTED)
-		suspend_set_ops(&psci_suspend_ops);
+		suspend_set_ops(&psci_system_suspend_ops);
 }
 
 static void __init psci_init_cpu_suspend(void)
@@ -673,6 +674,17 @@ static int __init psci_probe(void)
 
 typedef int (*psci_initcall_t)(const struct device_node *);
 
+static int psci_cpu_suspend_s2ram_enter(suspend_state_t state)
+{
+	return psci_cpu_suspend_enter(psci_s2ram_suspend_param);
+}
+
+static const struct platform_suspend_ops psci_cpu_suspend_s2ram_ops = {
+	.valid = suspend_valid_only_mem,
+	.enter = psci_cpu_suspend_s2ram_enter,
+	.begin = psci_system_suspend_begin,
+};
+
 /*
  * PSCI init function for PSCI versions >=0.2
  *
@@ -686,6 +698,20 @@ static int __init psci_0_2_init(const struct device_node *np)
 	if (err)
 		return err;
 
+	/*
+	 * Some firmwares expose S2RAM entry through a custom suspend param.
+	 *
+	 * If found, register a suspend handler instead of registering the
+	 * idle state with cpuidle.
+	 */
+	err = of_property_read_u32(np, "arm,psci-s2ram-param", &psci_s2ram_suspend_param);
+	if (!err) {
+		suspend_set_ops(&psci_cpu_suspend_s2ram_ops);
+	} else if (err != -EINVAL) {
+		pr_err("Couldn't read the S2RAM PSCI suspend param: %d\n",
+		       psci_s2ram_suspend_param);
+	}
+
 	/*
 	 * Starting with v0.2, the PSCI specification introduced a call
 	 * (PSCI_VERSION) that allows probing the firmware version, so

-- 
2.47.0


