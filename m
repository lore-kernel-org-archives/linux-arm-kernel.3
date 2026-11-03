Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E526606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 06:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zy+TI+dj;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=DklaSXtw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/wXeMJQP9j32DFN1qUwOOrQZZAiVvhUjuCGos3DlqT8=; b=zy+TI+djjuT+QuvagJB15zV56r
	FTsV2MgfVrHX8rQvicP3Ys2cRrnGjaD6DbfkvYZGK+NR4Lylsw9ER8LR/9Lkv4afNz4LKM7IIvMsQ
	dLIohS9GyWeuKG010cSlS6T0rPczKBKNDEQp0snZS4NqezVQjFbLhbIUqiM1QL9aaFer3IVm5minb
	usarbymemLVSMZ/IAUe/VnQ8/0gLpTUDtu9He+/kYDHEXHleT2B1qEdsSRJYQ5TTd/tMr21b/2BZt
	aHOrRTRc6YtJg3sHhj0ViEQ9JMiqsbjjEppUUjqF8OIYV42SjMclt9GTYYL8oCc5Kf2CX7G3ocBSC
	A/ZE2wAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7tR-00000001DPT-0FsQ;
	Tue, 03 Nov 2026 06:21:13 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7tL-00000001DMJ-2rGK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 06:21:12 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id C2AC020B7166;
	Mon,  2 Nov 2026 22:20:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C2AC020B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793686851;
	bh=/wXeMJQP9j32DFN1qUwOOrQZZAiVvhUjuCGos3DlqT8=;
	h=From:To:Subject:Date:From;
	b=DklaSXtw7SHAIALYclRuAVd5YoKcE9QbQAqIZlYNsCoeeclQbjdu0n6nqa79rHr+o
	 +yOHeOv3PIbQOZRyB6UxjRh8UOE04l8Qm1jwe2R1jv/Hdd47YvlUPbFgaedM4jsMjP
	 Uzh52V0b/2FUrLCLmCsqT6pIOwRVezeCpj0+5bjw=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: ptsm@linux.microsoft.com,
	jassisinghbrar@gmail.com,
	michal.simek@amd.com,
	tanmay.shah@amd.com,
	saeed.nowshadi@amd.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ssengar@linux.microsoft.com,
	tgopinath@linux.microsoft.com,
	srivatsa@csail.mit.edu
Subject: [PATCH 1/2] mailbox: zynqmp-ipi: Fix CPU hotplug state cleanup
Date: Mon,  2 Nov 2026 22:20:51 -0800
Message-ID: <20261103062051.676519-1-ptsm@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_222110_037168_B5B54688 
X-CRM114-Status: GOOD (  11.47  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>

On driver removal, the CPUHP_AP_ONLINE_DYN CPU hotplug state is removed
instead of the its actual state. This can leave the mailbox driver
callbacks dangling. Use the actual CPU hotplug state during driver
removal.

Hotplug registration failures are also ignored, allowing probe to
succeed without the callbacks needed to enable interrupts on CPUs
brought online later.

Fixes: 6ffb1635341be ("mailbox: zynqmp: handle SGI for shared IPI")
Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 42d2583e44ca..b0643ee75db0 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -136,6 +136,7 @@ struct zynqmp_ipi_pdata {
 	unsigned int method;
 	u32 local_id;
 	int virq_sgi;
+	enum cpuhp_state hp_state;
 	int num_mboxes;
 	struct zynqmp_ipi_mbox ipi_mboxes[] __counted_by(num_mboxes);
 };
@@ -863,15 +864,22 @@ static int xlnx_mbox_init_sgi(struct platform_device *pdev,
 	irq_set_status_flags(pdata->virq_sgi, IRQ_PER_CPU);
 
 	/* Setup function for the CPU hot-plug cases */
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mailbox/sgi:starting",
-			  xlnx_mbox_cpuhp_start, xlnx_mbox_cpuhp_down);
+	pdata->hp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+			  "mailbox/sgi:starting", xlnx_mbox_cpuhp_start,
+			  xlnx_mbox_cpuhp_down);
+	if (pdata->hp_state < 0) {
+		irq_clear_status_flags(pdata->virq_sgi, IRQ_PER_CPU);
+		free_percpu_irq(pdata->virq_sgi, &per_cpu_pdata);
+		irq_dispose_mapping(pdata->virq_sgi);
+		return pdata->hp_state;
+	}
 
 	return ret;
 }
 
 static void xlnx_mbox_cleanup_sgi(struct zynqmp_ipi_pdata *pdata)
 {
-	cpuhp_remove_state(CPUHP_AP_ONLINE_DYN);
+	cpuhp_remove_state(pdata->hp_state);
 
 	on_each_cpu(xlnx_disable_percpu_irq, NULL, 1);
 
-- 
2.49.0


