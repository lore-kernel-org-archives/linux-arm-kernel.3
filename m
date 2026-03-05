Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDFEF3092B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jfa4glOXR5MegQUsHcvMsWbb8leplcBg0C/xpLlybA=; b=tdu04Pq7G9KFtmVawcD26sPvc/
	cPR2x9A8BlxnKCE9W7WHBIB73IABzxx3Ewscen5dxbI54/ZKM2cv/kBl6dUwZ5spK7aiqOhBIXazh
	826opgUMoVHiOWwViL2F8K4aqevA/JvgXABYPF1swbOwkDphlexnpxtLuU16NyjC1+PpZ18oenvSw
	lUF050KMEsVBrAmtdLenE0p2P3dUMUQlySyCjmYkzTx/dDD1uj4QRj0mdBvHMVvCOTpGLpAwd2w8D
	zX22tzLr1FWWJ0//UmnHGS2ksgXVEGD7p5v5Zw5fEzVCyuj+nWoUeSlZGUik1OBWL54Xs+M3UGiHM
	caxGrDpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mH-00000001XkN-28zy;
	Thu, 05 Mar 2026 10:17:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mC-00000001XhG-36kO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:17:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CA171596;
	Thu,  5 Mar 2026 02:17:44 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB6353F694;
	Thu,  5 Mar 2026 02:17:48 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 05 Mar 2026 10:17:33 +0000
Subject: [PATCH v6 02/19] coresight: Set per-CPU source pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm_coresight_path_power_management_improvement-v6-2-eff765d211a9@arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705864; l=3387;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=TCAnI4NFyFF/pSovFyq7CsL4CHIbR8sS/2m1kDD3gAU=;
 b=FcfVopkiEIwYdaUGN2zPegKXLR41kM3+Ynq1gFgFn6vDnpfdNJLUXskOiLYQDwiDoxT3RwEmK
 zNMA+PNfXHdBwjm7HH3XYW5RdCY+G4dvErlYoXFokNVq0mg85sCjhki
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_021752_900113_018E312D 
X-CRM114-Status: GOOD (  13.08  )
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

Add coresight_{set|clear}_percpu_source() helpers to set and clear the
per-CPU source device.  These helpers are called during device
registration and unregistration.

If the helper is called from a CPU hotplug notifier (see
etm4_probe_cpu()), it sets the pointer directly since it is already
running on the local CPU.

Otherwise, to avoid races with CPU hotplug and CPU idle, it acquires the
CPU lock and issues an SMP call to update the per-CPU pointer on the
target CPU.  If that fails, it sets the pointer as a last resort.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 54 ++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index f191a0fe802ac6ae1342872e01fff463775c8a20..cda1e9b065a056e57030e52e07502554c71014ca 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -34,6 +34,7 @@
  */
 DEFINE_MUTEX(coresight_mutex);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
+static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
 
 /**
  * struct coresight_node - elements of a path, from source to sink
@@ -82,6 +83,56 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
 }
 EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
 
+static void coresight_set_percpu_source_local(void *csdev)
+{
+	this_cpu_write(csdev_source, csdev);
+}
+
+static void _coresight_set_percpu_source(int cpu, struct coresight_device *csdev)
+{
+	/*
+	 * Directly set per CPU pointer if running on the local CPU.  This
+	 * avoids to acquire CPU lock duplicately if it is called from CPU
+	 * hotplug notifier, see etm4_probe_cpu().
+	 */
+	if (get_cpu() == cpu) {
+		this_cpu_write(csdev_source, csdev);
+		put_cpu();
+		return;
+	}
+
+	put_cpu();
+
+	/* Avoid race condition with CPU hotplug */
+	guard(cpus_read_lock)();
+
+	if (!smp_call_function_single(cpu, coresight_set_percpu_source_local,
+				      csdev, 1))
+		return;
+
+	/*
+	 * If SMP call fails (e.g., the CPU is offline), directly update the
+	 * per CPU pointer as last resort.
+	 */
+	per_cpu(csdev_source, cpu) = csdev;
+}
+
+static void coresight_set_percpu_source(struct coresight_device *csdev)
+{
+	if (!coresight_is_percpu_source(csdev))
+		return;
+
+	_coresight_set_percpu_source(csdev->cpu, csdev);
+}
+
+static void coresight_clear_percpu_source(struct coresight_device *csdev)
+{
+	if (!coresight_is_percpu_source(csdev))
+		return;
+
+	_coresight_set_percpu_source(csdev->cpu, NULL);
+}
+
 static struct coresight_device *coresight_get_source(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
@@ -1401,6 +1452,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 
 	mutex_unlock(&coresight_mutex);
 
+	coresight_set_percpu_source(csdev);
+
 	if (cti_assoc_ops && cti_assoc_ops->add)
 		cti_assoc_ops->add(csdev);
 
@@ -1427,6 +1480,7 @@ void coresight_unregister(struct coresight_device *csdev)
 	if (cti_assoc_ops && cti_assoc_ops->remove)
 		cti_assoc_ops->remove(csdev);
 
+	coresight_clear_percpu_source(csdev);
 	mutex_lock(&coresight_mutex);
 	etm_perf_del_symlink_sink(csdev);
 	coresight_remove_conns(csdev);

-- 
2.34.1


