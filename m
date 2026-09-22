Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FFDC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 01:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=reCe8tkPjWBCUBO2JZeQ/bCdYwRlHVLorXz3IFsXRm0=; b=jmD+tAxE/jFsQgFSE2D6q0xLQJ
	3WmLduQC/XEIGP6y3FRB/yMbOvpTUEoKEYUe3/xhClEZD19yrFaXfUGCiM9/3IQTwJKqBHCx8UKJT
	tJ9WFVfS/4lFGt7Erl2lsy6fuK9TkPoyPXPCP+KB8C7TLmzwfn/55MOe0QIYWTjDFl7gOZID99elB
	TnOW6KCj9Rxso6aJsEaBJL6O+7dHbnxu7U9Uzi3Y4GHIPHDwB7f3fD6TFMEP5QyO5wjQSR9OEzsgy
	Qrbp2gwL4wtjUZ/NYAZgf1VE8eUwnDFaCkEdH6iGB+1LgmUcb97AmSasjTGFs6H4shcBTP4ui+hjC
	ONyvat3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8pA2-00000003sMa-1ecL;
	Tue, 22 Sep 2026 01:19:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8p9z-00000003sM8-3Swq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 01:19:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 776DA60210;
	Tue, 22 Sep 2026 01:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21749C2BCF6;
	Tue, 22 Sep 2026 01:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790039942;
	bh=2p+Gq7ah2QKJmZfE/XuzuuJW3qj0Kbm2NKfdOURDWwY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=mSpNDMsAwoeLy4iZblAVKUcS+prFNqiuW3LJPLM9YGlUzhoLPuikjAUvr0W+ATmyO
	 cNDdW0B8x/msLWgGjrj17JeMJfhGB5NvuIrchCzteBVxVwZJizWCG7jLrsuyExIL5G
	 3Tzz7zBI4z8HZ6opdzCoXZF3c4UzRegBtBh5BbQFc4DEYWqlUDy74T+jkqfiMz1sp6
	 0jbH6xBNNG+2T0GK6gziYj7Z3Q79mDa92aHrITGeGsZ57kPTDyykSk1VsUDphlBWr7
	 NW8QXkHVW9NoltZLZgPLR833Iw0xijaMtgFRqQge9crJrqEKkfNBQ0NN8kkVRbq4Up
	 zkQHkLrCZ9zbQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7CEC982FB;
	Tue, 22 Sep 2026 01:19:02 +0000 (UTC)
From: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>
Date: Mon, 21 Sep 2026 21:19:01 -0400
Subject: [PATCH] cpufreq: scmi: publish perf_ops with release semantics
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-mb-scmi-cpufreq-v1-1-934da6400a26@vt.edu>
X-B4-Tracking: v=1; b=H4sIAITXsWoC/yXMwQ6CMBAE0F8he3ZNqSjqrxgP7bqVmlBhV4gJ4
 d9t8fgmM7OAskRWuFYLCM9R4ztl1LsKqHPpyRgf2WCNPZmLrbH3qNRHpGEKwiOS84H9sTkb20J
 eDcIhfrfH2/1vnfyL6VNuSsM7ZfTiEnUl2ji3+wMKNbCuP0ocyMyTAAAA
X-Change-ID: 20260921-mb-scmi-cpufreq-cabfeb548027
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jaidev Shastri <jaidevshastri@vt.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790039941; l=3406;
 i=jaidevshastri@vt.edu; s=20260921; h=from:subject:message-id;
 bh=kGiX3bmrLMhZziNSbG0jyDiENr+zWQckZ25mLKshmo0=;
 b=nym2ybqGNPJA//+pWRCqx70dzBAwF7qdlvhnG6trOfnI+wgWRXp5XleSQEOp4Fyg3M06r8Flg
 GNU600DOkyEDXCpirkcdR4Q0AsdbZ4/frGUT1IqYypo92FpuzU1iT7U
X-Developer-Key: i=jaidevshastri@vt.edu; a=ed25519;
 pk=J7+xYJRlTPds+pv5hbqFFRqGCpDeJDzmZT1ggRwj7/0=
X-Endpoint-Received: by B4 Relay for jaidevshastri@vt.edu/20260921 with
 auth_id=1044
X-Original-From: Jaidev Shastri <jaidevshastri@vt.edu>
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
Reply-To: jaidevshastri@vt.edu
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jaidev Shastri <jaidevshastri@vt.edu>

scmi_cpufreq_probe() stores the SCMI performance protocol ops pointer to
the file-scope perf_ops with a plain store and then registers the
cpufreq driver. The callbacks read perf_ops with plain loads, starting
with scmi_cpufreq_init() on whichever CPU brings up a policy.

Keep the pointer in a local, publish it with smp_store_release() and
read it with smp_load_acquire() in scmi_cpufreq_init(), the first
callback invoked for a policy.

Found with MBCheck, a static herd7-based memory consistency checker.

Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
---
 drivers/cpufreq/scmi-cpufreq.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 4edb4f7a8..c394f63cc 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -197,6 +197,8 @@ static int scmi_limit_notify_cb(struct notifier_block *nb, unsigned long event,
 
 static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 {
+	/* Pairs with the smp_store_release() in scmi_cpufreq_probe(). */
+	const struct scmi_perf_proto_ops *ops = smp_load_acquire(&perf_ops);
 	int ret, nr_opp, domain;
 	unsigned int latency;
 	struct device *cpu_dev;
@@ -252,7 +254,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 	  */
 	nr_opp = dev_pm_opp_get_opp_count(cpu_dev);
 	if (nr_opp <= 0) {
-		ret = perf_ops->device_opps_add(ph, cpu_dev, domain);
+		ret = ops->device_opps_add(ph, cpu_dev, domain);
 		if (ret) {
 			dev_warn(cpu_dev, "failed to add opps to the device\n");
 			goto out_free_cpumask;
@@ -293,14 +295,14 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 	/* SCMI allows DVFS request for any domain from any CPU */
 	policy->dvfs_possible_from_any_cpu = true;
 
-	latency = perf_ops->transition_latency_get(ph, domain);
+	latency = ops->transition_latency_get(ph, domain);
 	if (!latency)
 		latency = CPUFREQ_DEFAULT_TRANSITION_LATENCY_NS;
 
 	policy->cpuinfo.transition_latency = latency;
 
 	policy->fast_switch_possible =
-		perf_ops->fast_switch_possible(ph, domain);
+		ops->fast_switch_possible(ph, domain);
 
 	policy->transition_delay_us =
 		scmi_get_rate_limit(domain, policy->fast_switch_possible);
@@ -443,6 +445,7 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
 	int ret;
 	struct device *dev = &sdev->dev;
 	const struct scmi_handle *handle;
+	const struct scmi_perf_proto_ops *ops;
 
 	handle = sdev->handle;
 
@@ -451,9 +454,15 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
 
 	scmi_cpufreq_driver.driver_data = sdev;
 
-	perf_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);
-	if (IS_ERR(perf_ops))
-		return PTR_ERR(perf_ops);
+	ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);
+	if (IS_ERR(ops))
+		return PTR_ERR(ops);
+	/*
+	 * The cpufreq callbacks read perf_ops after cpufreq_register_driver()
+	 * below. Publish it with release semantics so that ph and the ops are
+	 * visible together.
+	 */
+	smp_store_release(&perf_ops, ops);
 
 #ifdef CONFIG_COMMON_CLK
 	/* dummy clock provider as needed by OPP if clocks property is used */

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-mb-scmi-cpufreq-cabfeb548027

Best regards,
--  
Jaidev Shastri <jaidevshastri@vt.edu>



