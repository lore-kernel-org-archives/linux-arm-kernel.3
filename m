Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F859C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 09:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=337MxJhh1Pcrn/ZXvwAfQ7EunPGON6ti5HWUkE8xEx4=; b=ymPiU+NKlq0qUBirLGqcDJpemQ
	8THs66otC4vDrmSiP3RtrXt/pbibm2hotxlAcUpMY3taeyzNuTAkae0M/NmNNcpOD9Qwj5kWfAXm5
	T6SxUODXe7LSzTXzAbsbXgDPTTfUPkFC3HkF++T1HylHuZKftgYjAgzieRFYd0tXYB5mAyC2+Oms/
	hw2ip160keuU4CjKJsGhlPMaFpUSl7SL+hnH48rrcJ+qlNbUX0vZleT4c+qxYSjCPhQpyvc2YwfRL
	zz8Pbf38XVo7EliwUFvtrBy3dGGfK+RH8GSCaKcGL1eUJSSWJblsAqVCxw5k7oPPLmBwSX+VgLX8Y
	fR3G8VgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2cK-0000000HYFw-32Dp;
	Thu, 20 Feb 2025 09:13:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2Zt-0000000HXda-0XzJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 09:10:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B04A81BB0;
	Thu, 20 Feb 2025 01:10:55 -0800 (PST)
Received: from e125905.cambridge.arm.com (e125905.cambridge.arm.com [10.1.194.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 675C43F6A8;
	Thu, 20 Feb 2025 01:10:35 -0800 (PST)
From: Beata Michalska <beata.michalska@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sudeep.holla@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	sfr@canb.auug.org.au
Cc: ionela.voinescu@arm.com,
	yury.norov@gmail.com,
	linux-next@vger.kernel.org,
	sumitg@nvidia.com,
	yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com,
	zhanjie9@hisilicon.com,
	ptsm@linux.microsoft.com
Subject: [PATCH v2] arm64: Utilize for_each_cpu_wrap for reference lookup
Date: Thu, 20 Feb 2025 09:10:15 +0000
Message-Id: <20250220091015.2319901-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_011041_219380_23998901 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

While searching for a reference CPU within a given policy,
arch_freq_get_on_cpu relies on cpumask_next_wrap to iterate over
all available CPUs and to ensure each is verified only once.
Recent changes to cpumask_next_wrap will handle the latter no more,
so switching to for_each_cpu_wrap, which  preserves expected behavior
while ensuring compatibility with the updates.
Not to mention that when iterating over each CPU, using a dedicated
iterator is preferable to an open-coded loop.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 v2:
 Updated commit message

 arch/arm64/kernel/topology.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index a09b0551ec59..9e3583720668 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -254,7 +254,7 @@ int arch_freq_get_on_cpu(int cpu)
 		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
 		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
 			struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
-			int ref_cpu = cpu;
+			int ref_cpu;
 
 			if (!policy)
 				return -EINVAL;
@@ -265,11 +265,15 @@ int arch_freq_get_on_cpu(int cpu)
 				return -EOPNOTSUPP;
 			}
 
-			do {
-				ref_cpu = cpumask_next_wrap(ref_cpu, policy->cpus,
-							    start_cpu, true);
-
-			} while (ref_cpu < nr_cpu_ids && idle_cpu(ref_cpu));
+			for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
+				if (ref_cpu == start_cpu) {
+					/* Prevent verifying same CPU twice */
+					ref_cpu = nr_cpu_ids;
+					break;
+				}
+				if (!idle_cpu(ref_cpu))
+					break;
+			}
 
 			cpufreq_cpu_put(policy);
 
-- 
2.25.1


