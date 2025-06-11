Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90572C71131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVeXPFuPVbQsXF19uNENjG1a5bYP5vKL7OyCc5YR918=; b=G/El9Q7bIVRHtD1FPtW4mw5dWe
	fp7EatOO212+j4BWzCWZV3CLJYko1DEYGaDDCp17FruFpvFxJ3I0NwDv2pQLKaHdktwYLrk+zMNn8
	lAbQn5AxO6CXElLF6/rafaqsWZZ1ikWMHuRG0QegvWcZ0pXJZOzMlkKPYFiQyAZ9mrQnnp9P+e4D3
	PmUAwOJRMwKKFAKbvKieC/mdU888x6DWlGR47f1+CCJ1E/KMx2zOnAEhNSZ7Xpq/dApRLeamR4atD
	XZKZef19ryeLO512yccRFtepXYFYy5/W/LuOSgN9upgoLhq2PRo5itiSwTpPgyRRsBOHeBLDAcO0G
	BJKMffqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMky-0000000A9gw-1T5z;
	Wed, 11 Jun 2025 14:48:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHqz-00000009UGa-3EuM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 09:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PVeXPFuPVbQsXF19uNENjG1a5bYP5vKL7OyCc5YR918=; b=NVOuZASsmqa6FpOTt57Jjj0oI0
	8SCilsSl9W5twaXynk5rV8BzBOZ53PaN2LCnl1MuqOGW67VUc/g1MdHpjaMHvLr4PthOSp2vdOavC
	pLGcJJMz6RVOTuScJbzJ7fGuLA2PEH48SM6BmikiJyJUp3HAsdNGQBi24QMs8xUpFCqUM/hOtTOyN
	e7sk3jeQUQ9Uz2gfCYcnEZYAyRGHJcQTQmaWe1sjL6nQ1rX1Ra+Tfj80o5EZ/jN71+j5OFNOMKsj3
	s/ysHulw1bJWxXm7s9IR+iGxwnJzn3KLR9tSI9nFP4zCTC6x6QIsPu/v9+PL5yaZH6Eofx6y7pV1/
	dfrFZJ9g==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHqx-00000002Egq-2i07
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 09:34:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so51572935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749634476; x=1750239276; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVeXPFuPVbQsXF19uNENjG1a5bYP5vKL7OyCc5YR918=;
        b=vThYb+4XMipk98IaclKpBqYpAfzuhpa94RczlVJdruuZXsnOPDhWuDQHwJR1PUr/oM
         XaH4LlUILu0IA09zqwituHlDaDLoukFRRhftropcJ2Ups6tC7Eoz/3bL9WCQmJApdSXP
         W6OZq4ijmBz1WM6ufLGMck9q1OWlVbz4SKfRoDeJ8fSQH+c+jHJkTxk/wTQi8Mj6iLFR
         syaf5KeBNikw81dLF3bgn1c5cWumi90tM814/T/nVnk55SThGeHRFZG6eDRBg1vl59C4
         fk6bpcxV0s0jCPDJJeln63e9nZZhWZnZx1PGO4KI6m2J328t/58mpAcYgR5DzeEdmrH0
         pKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749634476; x=1750239276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVeXPFuPVbQsXF19uNENjG1a5bYP5vKL7OyCc5YR918=;
        b=G3Wpy/2T3aF/iTq0DKhQ1XLFr5XUo30R/eQUKMKWWZzwzihPJSQwgBdvs0DAJaI6yf
         X16Klw+vQ/xGYeGHa+8xgeMGJ9YWsjxFvDJt1OZSXGx+2awQdeyK6fd0QBZEpdccN1ql
         hv/mDBP9R6GhUzg/mXnzX3EwArb8LJ9uspTzqnnaN6+BBJspMedaj0aKzTxuV3BWwsHn
         VRybFOc9REuHSdPjT5lO6KC0GJqudmrhaDUdOKAJ0mRfo7VIYPmP8bJn5zLvsk49Sei/
         Jqb/+gxwqa0V47ePsSU/rTVNO4R+2QL7Z1eREUkOXe/0+KaM2y3TeNjgyFEt8HLcMArO
         js6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWqvkWu3JtSJPVRKSy/GXbN556O9LZ7OMgQ1i2J0xkDvCedVswfqwHuiw/6+7uaeT/TNu4cZw3u72PFuSjwVoe@lists.infradead.org
X-Gm-Message-State: AOJu0YyncpWSN6+3DiBI6kPLDSZa2IemZuJiV2ap/UFTaz51jxJrzZxw
	XHkUkxwTndxXAFMxi/oNUE9SRQ0V7iC8MxhrPiKpMxNBv9EQP3DWnIAEiS07lj/UD3Y=
X-Gm-Gg: ASbGncuQFdfWl+3IwHaQdaNZTkHGV5dE/kczrjKvMNJviUHTFAUw3q45mbVnHWs1dg5
	1n5Q0k2wnKox4pGrI/qAKroPchXpBhtSXqZKc7EmQzVXQQTz+jYBttb8eEgBivUK5QJi112HmHh
	jxzvBoudLfMvPDvnJXiNc9bl4CY0obvDag0KieamVL7aq/l6eBcHhLW/JKeQ+imeDq+6qXSyFaR
	uXI/fLC+kWBYqeBLan7gpwtmOBUja36dB/rHFIUUrvEydej28YUPsO0vO99owA9XLoRVyDVFWRJ
	3LY16FHiszpGM/E2fPwiHRfC3OpzWfSKjYZHXT1q2HJjVUJhVYoJCZ0oWzQsuPWqxrRvAFr5JgF
	roozJkF6nDXW56kk=
X-Google-Smtp-Source: AGHT+IFezP6rZ6NJam3qkYM1ont9V/Ju3WNFxU4NhSoAWiBk+tW7MeR71vKuui0yalRYjWiHv6SH+w==
X-Received: by 2002:a05:600c:8719:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-453248f9836mr22050755e9.18.1749634476351;
        Wed, 11 Jun 2025 02:34:36 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453251a2303sm15467005e9.31.2025.06.11.02.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:34:35 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Jun 2025 10:34:26 +0100
Subject: [PATCH v2 2/2] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gs101-cpuidle-v2-2-4fa811ec404d@linaro.org>
References: <20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org>
In-Reply-To: <20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7073;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=qTs3IRLu5xA+mhLIgJ44rsQgmMvxnUCHZ/EW6gO8Vwk=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoSU2lxp0CXerInpZzjgxAxPDiAXS+cx5GGZ3wL
 66Mv1PObHKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaElNpQAKCRDO6LjWAjRy
 ugz7D/9ycWCS+1kysD81RwKEkYsnWRulQwV4baIqdf8qXrUZQnpecMUToyOmrIR/oJVJ0yzWByh
 gAmVsSxSHNJrzgTq+f9ebDMNTPtCx9xQMoBc+RVSUcNIhhMl3gohnBz1+1jpIERNxn/yreNT5Us
 frHSHyEUzMJl+njMaelO9Vlz6/Pcl3JTWOC651/TU22n5lHFkf3ljfx4oPnv6u6uKhobVHBdBmZ
 ITISASnTUdBdbAEQ+ZQOUBj0Nhdc595E/McvaeMoqWa4OkYxRT3ngMpiBJFkQUoH/e/XNln/ncB
 2l+yKdB2B3ss20rnc62oXlstrqkSM6aCJ/bzuyJeRoLfMHdH0jRPTk9h6xrpgZYgtdGQD1J0Vhv
 C1+CJxE5PY1tS0VwZCRjG92jYLcfAgdPwUeajIxA1w7oyOv72MaMGh5+8ye8mizG2RzGVsO6Ed0
 o3eS8zWc6GNsSMoedxDBHU4TtIsZ5AC40onJL2nPnKk3Ro8pQCxGRhWehSqUjkhh5e0Be+lRRxh
 aArz7RINoGwZu/y+MYbq0xlNY7dfXKBXja9N/ge15MBWkTsnSMqzzFQqX033Sgizr4i5hhP/63l
 bV1gZHhoVXUSKfKvwPG/mjBRR3KvmMfQCUkkFTUiiRg8rlx/kuPjuHuAD3omWXAa0AwsSEuGFTT
 IhL6HciJ6J7uRRA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_103439_818081_78C34A10 
X-CRM114-Status: GOOD (  25.58  )
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

Register cpu pm notifiers for gs101 which call the
gs101_cpu_pmu_online/offline callbacks which in turn
program the ACPM hint. This is required to actually
enter the idle state.

A couple of corner cases are handled, namely when the
system is rebooting or suspending we ignore the request.
Additionally the request is ignored if the CPU is in
CPU hot plug.

Note: this patch has a runtime dependency on adding
'local-timer-stop' dt property to the CPU nodes. This
informs the time framework to switch to a broadcast timer
as the local timer will be shutdown. Without that DT
property specified the system hangs in early boot with
this patch applied.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2
 * Add ifdef CONFIG_PM_SLEEP to avoid
   Fix warning: unused variable 'cpupm_pm_ops' [-Wunused-const-variable] (0-day)
---
 drivers/soc/samsung/exynos-pmu.c | 137 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 133 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index a77288f49d249f890060c595556708334383c910..7f72ecd60994f18bb639dd8e09e1c6ff6158066b 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -8,6 +8,7 @@
 #include <linux/array_size.h>
 #include <linux/arm-smccc.h>
 #include <linux/cpuhotplug.h>
+#include <linux/cpu_pm.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/mfd/core.h>
@@ -15,6 +16,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 
 #include <linux/soc/samsung/exynos-regs-pmu.h>
@@ -35,6 +37,10 @@ struct exynos_pmu_context {
 	const struct exynos_pmu_data *pmu_data;
 	struct regmap *pmureg;
 	struct regmap *pmuintrgen;
+	spinlock_t cpupm_lock;	/* serialization lock */
+	bool __percpu *hotplug_ing;
+	atomic_t sys_suspended;
+	atomic_t sys_rebooting;
 };
 
 void __iomem *pmu_base_addr;
@@ -336,7 +342,7 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 #define CPU_INFORM_CLEAR	0
 #define CPU_INFORM_C2		1
 
-static int gs101_cpuhp_pmu_online(unsigned int cpu)
+static int gs101_cpu_pmu_online(unsigned int cpu)
 {
 	unsigned int cpuhint = smp_processor_id();
 	u32 reg, mask;
@@ -358,10 +364,26 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
 	return 0;
 }
 
-static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+static int gs101_cpuhp_pmu_online(unsigned int cpu)
+{
+	gs101_cpu_pmu_online(cpu);
+
+	/*
+	 * Mark this CPU as having finished the hotplug.
+	 * This means this CPU can now enter C2 idle state.
+	 */
+	*per_cpu_ptr(pmu_context->hotplug_ing, cpu) = false;
+
+	return 0;
+}
+
+static int gs101_cpu_pmu_offline(unsigned int cpu)
 {
 	u32 reg, mask;
-	unsigned int cpuhint = smp_processor_id();
+	unsigned int cpuhint;
+
+	spin_lock(&pmu_context->cpupm_lock);
+	cpuhint	= smp_processor_id();
 
 	/* set cpu inform hint */
 	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
@@ -379,16 +401,89 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
 	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
 	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
 		     reg & mask);
+
+	spin_unlock(&pmu_context->cpupm_lock);
 	return 0;
 }
 
+static int gs101_cpuhp_pmu_offline(unsigned int cpu)
+{
+	/*
+	 * Mark this CPU as entering hotplug. So as not to confuse
+	 * ACPM the CPU entering hotplug should not enter C2 idle state.
+	 */
+	*per_cpu_ptr(pmu_context->hotplug_ing, cpu) = true;
+
+	gs101_cpu_pmu_offline(cpu);
+
+	return 0;
+}
+
+static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
+					unsigned long action, void *v)
+{
+	int cpu = smp_processor_id();
+
+	switch (action) {
+	case CPU_PM_ENTER:
+		/*
+		 * Ignore CPU_PM_ENTER event in reboot or
+		 * suspend sequence.
+		 */
+
+		if (atomic_read(&pmu_context->sys_suspended) ||
+		    atomic_read(&pmu_context->sys_rebooting))
+			return NOTIFY_OK;
+
+		if (*per_cpu_ptr(pmu_context->hotplug_ing, cpu))
+			return NOTIFY_BAD;
+
+		gs101_cpu_pmu_offline(cpu);
+
+		break;
+	case CPU_PM_EXIT:
+
+		if (atomic_read(&pmu_context->sys_rebooting))
+			return NOTIFY_OK;
+
+		gs101_cpu_pmu_online(cpu);
+
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block gs101_cpu_pm_notifier = {
+	.notifier_call = gs101_cpu_pm_notify_callback,
+	.priority = INT_MAX	/* we want to be called first */
+};
+
+static int exynos_cpupm_reboot_notifier(struct notifier_block *nb,
+					unsigned long event, void *v)
+{
+	switch (event) {
+	case SYS_POWER_OFF:
+	case SYS_RESTART:
+		atomic_set(&pmu_context->sys_rebooting, 1);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block exynos_cpupm_reboot_nb = {
+	.priority = INT_MAX,
+	.notifier_call = exynos_cpupm_reboot_notifier,
+};
+
 static int exynos_pmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct regmap_config pmu_regmcfg;
 	struct regmap *regmap;
 	struct resource *res;
-	int ret;
+	int ret, cpu;
 
 	pmu_base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pmu_base_addr))
@@ -444,6 +539,12 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 			 */
 			dev_warn(&pdev->dev, "pmu-intr-gen syscon unavailable\n");
 		} else {
+			pmu_context->hotplug_ing = alloc_percpu(bool);
+
+			/* set PMU to power on */
+			for_each_online_cpu(cpu)
+				gs101_cpuhp_pmu_online(cpu);
+
 			cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,
 					  "soc/exynos-pmu:prepare",
 					  gs101_cpuhp_pmu_online, NULL);
@@ -451,6 +552,12 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 			cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 					  "soc/exynos-pmu:online",
 					  NULL, gs101_cpuhp_pmu_offline);
+
+			cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
+			spin_lock_init(&pmu_context->cpupm_lock);
+			atomic_set(&pmu_context->sys_rebooting, 0);
+			atomic_set(&pmu_context->sys_suspended, 0);
+			register_reboot_notifier(&exynos_cpupm_reboot_nb);
 		}
 	}
 
@@ -471,10 +578,32 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int exynos_cpupm_suspend_noirq(struct device *dev)
+{
+	atomic_set(&pmu_context->sys_suspended, 1);
+	return 0;
+}
+
+static int exynos_cpupm_resume_noirq(struct device *dev)
+{
+	atomic_set(&pmu_context->sys_suspended, 0);
+	return 0;
+}
+
+static const struct dev_pm_ops cpupm_pm_ops = {
+	.suspend_noirq = exynos_cpupm_suspend_noirq,
+	.resume_noirq = exynos_cpupm_resume_noirq,
+};
+#endif
+
 static struct platform_driver exynos_pmu_driver = {
 	.driver  = {
 		.name   = "exynos-pmu",
 		.of_match_table = exynos_pmu_of_device_ids,
+#ifdef CONFIG_PM_SLEEP
+		.pm = &cpupm_pm_ops,
+#endif
 	},
 	.probe = exynos_pmu_probe,
 };

-- 
2.50.0.rc1.591.g9c95f17f64-goog


