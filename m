Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4DEC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 14:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OMuKeAOMNy4Q2Uv0MN7VEZ0PYf+VndGh+tHrHky25XM=; b=hYCG0srBxEFI+MFcbYuKUsc42+
	cbVvDn4dy86vc/u6ufeJJ+gNgurMqtc+xSU+DepphlKRdz7o2dJbbhUHQvS8+MHUsUVH+r/keoJWN
	7FQvxA4NF/8xW7UqYo0F07Iwf4M4g7nBsGhPb5RB1kI6XUMuEt/shQXZ8mX6NxIZU8FzWy+xeOH2F
	zpytNbz/gDsSV+PjJaHrNsI9MyQd6oGkDirGgXoM5BXeX4UmB3dqmlfdGCCpjq8ZgZ1hoNHrODvQi
	UfGMzBsiUG49oK6E9H1f0247k+aG49s3PX7foxYqaZEQPW3WSB6sjWS2hJ4djihq2bVTdKJrmElIV
	siqCbk5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqzV-000000028Ik-0zC1;
	Fri, 02 May 2025 14:03:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqxE-000000027ub-0ebY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 14:01:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3FC61688;
	Fri,  2 May 2025 07:01:17 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 70D723F673;
	Fri,  2 May 2025 07:01:24 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] cpuidle: psci: Avoid initializing faux device if no DT idle states are present
Date: Fri,  2 May 2025 15:01:19 +0100
Message-Id: <20250502140119.2578909-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_070128_284685_8FAFBE37 
X-CRM114-Status: GOOD (  14.50  )
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

Commit af5376a77e87 ("cpuidle: psci: Transition to the faux device interface")
transitioned the PSCI cpuidle driver from using a platform device to the
faux device framework. However, unlike platform devices, the faux device
infrastructure logs an error when the probe function fails, even if the
failure is intentional or expected.

To prevent unnecessary error logs, we can skip creating the faux device
entirely if there are no PSCI idle states defined in the device tree.
Introduce a check for DT idle states during initialization and avoid
setting up the device if none are found.

This ensures cleaner logs and avoids misleading probe failure messages
when PSCI idle support is intentionally not described in DT.

Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Fixes: af5376a77e87 ("cpuidle: psci: Transition to the faux device interface")
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/r/cf4e70e4-9fe5-4697-8744-8c12c41b5ff9@nvidia.com
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/cpuidle/cpuidle-psci.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index ee35ac816321..40f378c1dc9f 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -438,10 +438,29 @@ static struct faux_device_ops psci_cpuidle_ops = {
 	.probe = psci_cpuidle_probe,
 };
 
+static bool __init dt_idle_state_present(void)
+{
+	struct device_node *cpu_node __free(device_node);
+	struct device_node *state_node __free(device_node);
+
+	cpu_node = of_cpu_device_node_get(cpumask_first(cpu_possible_mask));
+	if (!cpu_node)
+		return false;
+
+	state_node = of_get_cpu_state_node(cpu_node, 0);
+	if (!state_node)
+		return false;
+
+	return !!of_match_node(psci_idle_state_match, state_node);
+}
+
 static int __init psci_idle_init(void)
 {
 	struct faux_device *fdev;
 
+	if (!dt_idle_state_present())
+		return 0;
+
 	fdev = faux_device_create("psci-cpuidle", NULL, &psci_cpuidle_ops);
 	if (!fdev) {
 		pr_err("Failed to create psci-cpuidle device\n");
-- 
2.34.1


