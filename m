Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A795E606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=urCEeYX6;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DhGTW+B/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JE6RFDaW5iJIlTyYoNr0dPdQqfpRddHdFnlHhfF7/Q0=; b=urCEeYX6ZuMDqrbQSmIy0NsY1+
	QA8kDPT8QMPYLuVR+UaeNQ6lNOEQMAFz0UjU9hASC4IE+n9nNkQmFdpb0vYAgf9sD0tfENiO+n/xy
	SK9MJm/Vw9e7UjuBrVA6LMl7HvRMm4a8NuYUtDf26kfnrNFueGlAC+gzyklDE/VYvVIbkoupbVyeg
	4O88BJ5gv5zYDaHGXM4eZJhBuHp4dy/S2tcA9u8dn7AD5jHJ2yixqZ1BPMrl7cMBoyF8Jm5lmaxBE
	y11e6efzm/vmUvm5wFa5u2TTz6nzpazRJkU5KX0qvigipiymFZvaiko+kEEOs2Qkxzyrr0a3b9OGC
	mcEUNr8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLvc-00000003gCz-0voO;
	Tue, 03 Nov 2026 21:20:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLva-00000003gCt-3e1L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:20:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DE69608FA;
	Tue,  3 Nov 2026 21:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6921F00919;
	Tue,  3 Nov 2026 21:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793740820;
	bh=JE6RFDaW5iJIlTyYoNr0dPdQqfpRddHdFnlHhfF7/Q0=;
	h=From:Date:Subject:To:Cc;
	b=DhGTW+B/P+yFX4vqQgWvO8IVvSjn6KQ+ZzMdmgBc662BxpH7qQMDimpSgutf0XPPx
	 fKRpVApM438sTSUNZWX5ZLC1P4UbbpDhg/n/bzxl6zVITBTYjXQcmzTe7xEbrrHic2
	 q5pukV5U53rK6C62SDmZhYL5kejLGAjc3Sh9iAe7xkMU9ac6Sew/ylPy+NWyFyS3iz
	 yzagEp9qs4QoJpm93TndQpbx/jO4cmg4ocUuZL6Sx+KP8h/11JIls1h8XnUNokdyz8
	 I6tFsz8ODSgqsy1eLIS1myjynahDXlzBcUK8tHXEZWFPD0GmZhlZr7lqB2yJiVCvoy
	 KCwo/78iaqBKA==
From: Eugen Hristev <ehristev@kernel.org>
Date: Tue, 03 Nov 2026 23:20:12 +0200
Subject: [PATCH v2] PCI: iproc-msi: Removed potentially endless loop
 handling MSI events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-iproc-irq-v2-1-dc7223df35fc@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAtQ6moC/22NQQ6CMBAAv0L2bA2tAakn/2E4lLqFVUNxi42G9
 O8WvHqcZDKzQEAmDHAqFmCMFMiPGdSuADuYsUdB18ygSlXLUtaCJvZWED+FtlVjHR60rBrI/sT
 o6L21Lu2Pw6u7oZ3XwGoMFGbPn20W5er960YppMDOGFeqo1Maz3fkER97zz20KaUvYGwa87UAA
 AA=
X-Change-ID: 20261016-iproc-irq-9c58cfe39158
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5460; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=pAhFkgivPGa8+WZMgqY+OKupz5W/lxtX/1KCdlqX2/E=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLJeBfAd2Lbwau9e9zfcQcfOrZ9psPrNka1nhJw3HU1L+
 rnhQI/Yio5SFgYxLgZZMUWWapN/tcL9O9xPulqqwMxhZQIZwsDFKQAT2X+RkWHyP+bSM1znXrDF
 b/HjqrVlrBZlvW9aO3tp9cTDJ9W+ljAzMjS2rWDepMbxQdbLPCYquSDSw33JlrcBJYXXz7xpnuw
 ixwEA
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The iProc MSI chained handler rereads the event queue tail after each
batch and keeps processing until the queue is empty. A continuously fed
queue can therefore keep the CPU in the handler indefinitely, starving
other interrupts and causing RCU stalls under heavy Ethernet traffic.

To fix this scenario, remove the loop that keeps reading the head and
the tail until there are no more pending events. Read the head and tail
only once and process only the events recorded in that snapshot.
Update the head before returning. Events arriving during processing
remain queued for a subsequent parent interrupt, allowing other handlers
to run without imposing an arbitrary event limit.

Discovered while testing it with an Ethernet NIC, when too many MSI
interrupts come in, CPU might get starved:

Connecting to host 192.168.30.1, port 5201
[  5] local 192.168.30.2 port 52586 connected to 192.168.30.1 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   240 MBytes  2.01 Gbits/sec    2    334 KBytes
[  5]   1.00-2.00   sec  63.2 MBytes   531 Mbits/sec    1   1.41 KBytes
[  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
[  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
[  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
[  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
[  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
[  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
[  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
[  177.568497] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  177.568913] rcu:     0-...!: (1 GPs behind) idle=28ac/1/0x4000000000000002 softirq=28922/28930 fqs=1
[  177.569457] rcu:     (detected by 1, t=5256 jiffies, g=21629, q=819 ncpus=4)
[  177.569870] Sending NMI from CPU 1 to CPUs 0:

With this one loop approach, IRQ handler will complete and continue
to serve MSI events on the next handler invocation.

Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
Changes in v2:
- Changed as per suggestion from Mani: removed the budget and completely
removed the do/while(true) loop
- Link to v1: https://patch.msgid.link/20261016-iproc-irq-v1-1-ebaaf027f29e@kernel.org

To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: Ray Jui <rjui@broadcom.com>
To: Scott Branden <sbranden@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-pci@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/pci/controller/pcie-iproc-msi.c | 61 ++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 32 deletions(-)

diff --git a/drivers/pci/controller/pcie-iproc-msi.c b/drivers/pci/controller/pcie-iproc-msi.c
index 9ba242ab9596..86753ae75ed3 100644
--- a/drivers/pci/controller/pcie-iproc-msi.c
+++ b/drivers/pci/controller/pcie-iproc-msi.c
@@ -344,42 +344,39 @@ static void iproc_msi_handler(struct irq_desc *desc)
 	 * data is guaranteed to be in the event queue memory before the tail
 	 * pointer is updated by the iProc MSI core.
 	 */
-	head = iproc_msi_read_reg(msi, IPROC_MSI_EQ_HEAD,
-				  eq) & IPROC_MSI_EQ_MASK;
-	do {
-		tail = iproc_msi_read_reg(msi, IPROC_MSI_EQ_TAIL,
-					  eq) & IPROC_MSI_EQ_MASK;
+	head = iproc_msi_read_reg(msi, IPROC_MSI_EQ_HEAD, eq) &
+				  IPROC_MSI_EQ_MASK;
+	tail = iproc_msi_read_reg(msi, IPROC_MSI_EQ_TAIL, eq) &
+				  IPROC_MSI_EQ_MASK;
 
-		/*
-		 * Figure out total number of events (MSI data) to be
-		 * processed.
-		 */
-		nr_events = (tail < head) ?
-			(EQ_LEN - (head - tail)) : (tail - head);
-		if (!nr_events)
-			break;
-
-		/* process all outstanding events */
-		while (nr_events--) {
-			hwirq = decode_msi_hwirq(msi, eq, head);
-			generic_handle_domain_irq(msi->inner_domain, hwirq);
-
-			head++;
-			head %= EQ_LEN;
-		}
+	/*
+	 * Figure out total number of events (MSI data) to be
+	 * processed.
+	 */
+	nr_events = (tail < head) ? (EQ_LEN - (head - tail)) : (tail - head);
+	if (!nr_events)
+		goto iproc_msi_handler_out;
 
-		/*
-		 * Now all outstanding events have been processed.  Update the
-		 * head pointer.
-		 */
-		iproc_msi_write_reg(msi, IPROC_MSI_EQ_HEAD, eq, head);
+	/* process all outstanding events */
+	while (nr_events--) {
+		hwirq = decode_msi_hwirq(msi, eq, head);
+		generic_handle_domain_irq(msi->inner_domain, hwirq);
 
-		/*
-		 * Now go read the tail pointer again to see if there are new
-		 * outstanding events that came in during the above window.
-		 */
-	} while (true);
+		head++;
+		head %= EQ_LEN;
+	}
 
+	/*
+	 * Now all outstanding events have been processed.  Update the
+	 * head pointer.
+	 */
+	iproc_msi_write_reg(msi, IPROC_MSI_EQ_HEAD, eq, head);
+
+	/*
+	 * The tail pointer will be reread on the next interrupt to process
+	 * any new events that arrived while handling this batch.
+	 */
+iproc_msi_handler_out:
 	chained_irq_exit(chip, desc);
 }
 

---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20261016-iproc-irq-9c58cfe39158

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>


