Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4C6606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 06:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SArMxiDe;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=C5cyDqhH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4dMx8oyOcsvpKZmeDA9XB9ac9xFIUPa8LzVWlB1uze0=; b=SArMxiDer29IDe
	K3TO3Kjlop5rLAzkONl2fZ1LX2hn+icfqc+q9cFDnA+Yr2FkVo/lDBVekz7zWNKdO24iJ/0n3To/D
	DVHhSQ8LDJ9Z6FdvsZ9Z2lQKO2TwUqJtBcG8BN427IUQ39FEx1blBFTVG9wSibVseyLxJrSoDw6si
	N9hw8UyrNbP3dmOfk6lZLH2EKlSPrugvqRTY4VPGQIwW3N0fcTsP333epKs+gC0+WCYLUWVVEmvjK
	Yhg7xTw7FGLptvbhSd/up8zSAQtcw/J52kp4XZcfskiOKx9gHdMS/xm3VIyxQC9v8Jmar+ODNwhta
	HVKRZfaaLenDCiMm2mIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO87O-00000001Fub-0pL4;
	Tue, 03 Nov 2026 06:35:38 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO87I-00000001Fu6-2w1u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 06:35:36 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2C2A520B7166;
	Mon,  2 Nov 2026 22:35:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2C2A520B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793687716;
	bh=4dMx8oyOcsvpKZmeDA9XB9ac9xFIUPa8LzVWlB1uze0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C5cyDqhHIsCzTiuaHaq1svaWIigxtCUNFwtyf3xrRWLVfHaPzEuC+kkRVWp4/b4hX
	 U9tpDMG1ocmExkay0nGn+XuYmo9Lf74YcXSQdJ5SADB409yr9l9X/VGQnUm8ecn/rI
	 fm0s96BJYEu85+5MNVjg6ExXjFQkkrOXzGZIgOoE=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: ptsm@linux.microsoft.com,
	tgopinath@linux.microsoft.com,
	ssengar@linux.microsoft.com,
	srivatsa@csail.mit.edu,
	michal.simek@amd.com,
	rajan.vaja@xilinx.com,
	tejas.patel@xilinx.com,
	abhyuday.godhasara@xilinx.com,
	gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: xilinx: Fix event manager CPU hotplug state cleanup
Date: Mon,  2 Nov 2026 22:35:15 -0800
Message-ID: <20261103063515.679043-1-ptsm@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261103062051.676519-1-ptsm@linux.microsoft.com>
References: <20261103062051.676519-1-ptsm@linux.microsoft.com>
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
X-CRM114-CacheID: sfid-20261102_223532_770773_A8041AB8 
X-CRM114-Status: GOOD (  12.23  )
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

On driver removal, the event manager removes the CPUHP_AP_ONLINE_DYN
CPU hotplug state instead of the its actual state. This can leave the
event manager callbacks dangling. Use the actual CPU hotplug state
during driver removal.

Hotplug registration failures are also ignored, allowing probe to
succeed without the callbacks needed to enable event interrupts on
CPUs brought online later.

Fixes: c7fdb2404f66 ("drivers: soc: xilinx: add xilinx event management driver")
Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/soc/xilinx/xlnx_event_manager.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_event_manager.c b/drivers/soc/xilinx/xlnx_event_manager.c
index f733dc42b3b1..2d8bfeab4190 100644
--- a/drivers/soc/xilinx/xlnx_event_manager.c
+++ b/drivers/soc/xilinx/xlnx_event_manager.c
@@ -24,6 +24,7 @@ static DEFINE_PER_CPU_READ_MOSTLY(int, dummy_cpu_number);
 
 static int virq_sgi;
 static int event_manager_availability = -EACCES;
+static enum cpuhp_state hp_state;
 
 /* SGI number used for Event management driver */
 #define XLNX_EVENT_SGI_NUM	(15)
@@ -625,8 +626,6 @@ static int xlnx_event_init_sgi(struct platform_device *pdev)
 
 static void xlnx_event_cleanup_sgi(struct platform_device *pdev)
 {
-	cpuhp_remove_state(CPUHP_AP_ONLINE_DYN);
-
 	on_each_cpu(xlnx_disable_percpu_irq, NULL, 1);
 
 	irq_clear_status_flags(virq_sgi, IRQ_PER_CPU);
@@ -660,8 +659,13 @@ static int xlnx_event_manager_probe(struct platform_device *pdev)
 	}
 
 	/* Setup function for the CPU hot-plug cases */
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/event:starting",
-			  xlnx_event_cpuhp_start, xlnx_event_cpuhp_down);
+	hp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+			"soc/event:starting", xlnx_event_cpuhp_start,
+			xlnx_event_cpuhp_down);
+	if (hp_state < 0) {
+		xlnx_event_cleanup_sgi(pdev);
+		return hp_state;
+	}
 
 	ret = zynqmp_pm_register_sgi(sgi_num, 0);
 	if (ret) {
@@ -670,6 +674,7 @@ static int xlnx_event_manager_probe(struct platform_device *pdev)
 		else
 			dev_err(&pdev->dev, "SGI %d registration failed, err %d\n", sgi_num, ret);
 
+		cpuhp_remove_state(hp_state);
 		xlnx_event_cleanup_sgi(pdev);
 		return ret;
 	}
@@ -704,6 +709,7 @@ static void xlnx_event_manager_remove(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "SGI unregistration over TF-A failed with %d\n", ret);
 
+	cpuhp_remove_state(hp_state);
 	xlnx_event_cleanup_sgi(pdev);
 
 	event_manager_availability = -EACCES;
-- 
2.49.0


