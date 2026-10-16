Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38DBCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ez3WTV3wXyvA2qsEtDAAQhPoUgCZjt1BQZubvtpWNZk=; b=QEfJcRFE7+e0cGz2stErGSDlEi
	dccazhLIKDqXjy8L6XdBbbUezWIRyuRwYrfKW1Ri9JI8wu1WNsIb5UsXpEZP+ZmFxF5ab4hhCT7sH
	iKPAmjYmerHElrzjyu35JX5kCMQhBmo+V61ZS9Np9wJ7JumZchI6fb8WwvZdIEHcJ6m8fw7C9axgG
	lIqh0autDryZeXfIvh4pzc+4G3kaBmT+mWXGefgrgYcksgntIYKo5nUVNF0X/NH9RaON+bePTVSJj
	XHv4nsoC9o92EZdRAW//REY6bPje9Ks+Yh3xP8UYX3icDTgyOpY8sfUBUsRcSXRciZdgmmwq+OKY9
	X/EO2QmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHguD-00000002qxd-3tZW;
	Fri, 16 Oct 2026 12:19:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHguC-00000002qxS-0UQp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 12:19:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 83EEE43C50;
	Fri, 16 Oct 2026 12:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8B31F000C4;
	Fri, 16 Oct 2026 12:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792153163;
	bh=ez3WTV3wXyvA2qsEtDAAQhPoUgCZjt1BQZubvtpWNZk=;
	h=From:Date:Subject:To:Cc;
	b=ekWjNZ3oSUYSugEFRILIitc33dot8jDfMAsAu3L7ZxBrfGUkTXBND8H8f3sHfaeB5
	 YhuhBLru0j1fax7LCg2S+n4m5DoAF1j3s50gEkd9f1SlcKg0tgoUPWj8GO1I2az//v
	 mTngxnRLSentOqEJb/9148sDZz0+e782qQAzbC4TEhtSARDbvIph8DcAXTX+DO+JZS
	 AflpWonu+iXo1y8Qtld7zpLvvJ4o7hhjQgRc1s89xZl7cp01bKpr04RpGpijqwnyt0
	 8VtB7PEh7uLoisupMcQgCbXVQXG5L14/+XiI3O+nhLZz+G4TWzT3LlwYChvJFBOJki
	 qe+0FtkLPrVLw==
From: Eugen Hristev <ehristev@kernel.org>
Date: Fri, 16 Oct 2026 15:18:53 +0300
Subject: [PATCH] PCI: iproc-msi: Bound events handled per IRQ
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-iproc-irq-v1-1-ebaaf027f29e@kernel.org>
X-B4-Tracking: v=1; b=H4sIACwW0moC/yXMTQ5AMBBA4avIrDVpiQZXEQvGYCz8TBFJ4+6K5
 Ze8PA+OhMlBGXkQOtnxMgeYOAIcm3kgxV0wJDqxRhureJUFFcumCsxy7CktTJZD6Fehnq/vVdW
 /3dFOhPs7gPt+ANvf8extAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3668; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=DSH+AvFSx4rSB2I3L8SguVd7gi22r4ADmAr9vYB5kcU=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLIuiTmaH81mvvydS+xJknra+zdi0Ruqila8a7yUvfF2m
 dR+i7DJHaUsDGJcDLJiiizVJv9qhft3uJ90tVSBmcPKBDKEgYtTACZi+o3hf8qOixl2CeGVK1tu
 v10b+czn3r+ne3dVzQ5ccmdmfKGqfSwjw4PkKO2mFPW/bzwzV2Usuil/qUwvm3c790/hgw+q40/
 3swEA
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
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

Limit each iProc MSI parent IRQ to 16 event-queue entries.

A continuously fed queue could otherwise keep the chained handler running
and starve other work. The budget still drains pending events and lets the
next parent interrupt continue processing, improving fairness and bounding
interrupt-handler latency.

Without this starvation avoidance, one CPU can stall indefinitely
in the loop and not serve other interrupts, timers, etc.

While testing it with an Ethernet NIC,  when too many MSI interrupts
come in, CPU might get starved:

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

With this bounded approach, IRQ handler will complete and continue
to serve MSI events on the next handler invocation.

Assisted-by: Github Copilot
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/pci/controller/pcie-iproc-msi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-iproc-msi.c b/drivers/pci/controller/pcie-iproc-msi.c
index 9ba242ab9596..6649807822d2 100644
--- a/drivers/pci/controller/pcie-iproc-msi.c
+++ b/drivers/pci/controller/pcie-iproc-msi.c
@@ -29,6 +29,9 @@
 /* Number of entries in each event queue */
 #define EQ_LEN                         64
 
+/* Bound parent interrupt handler such that a queue cannot starve CPU. */
+#define IPROC_MSI_MAX_EVENTS_PER_IRQ   16
+
 /* Size of each event queue memory region */
 #define EQ_MEM_REGION_SIZE             SZ_4K
 
@@ -326,6 +329,7 @@ static void iproc_msi_handler(struct irq_desc *desc)
 	struct iproc_msi_grp *grp;
 	struct iproc_msi *msi;
 	u32 eq, head, tail, nr_events;
+	unsigned int event_budget = IPROC_MSI_MAX_EVENTS_PER_IRQ;
 	unsigned long hwirq;
 
 	chained_irq_enter(chip, desc);
@@ -360,9 +364,11 @@ static void iproc_msi_handler(struct irq_desc *desc)
 			break;
 
 		/* process all outstanding events */
-		while (nr_events--) {
+		while (nr_events && event_budget) {
 			hwirq = decode_msi_hwirq(msi, eq, head);
 			generic_handle_domain_irq(msi->inner_domain, hwirq);
+			nr_events--;
+			event_budget--;
 
 			head++;
 			head %= EQ_LEN;
@@ -373,6 +379,8 @@ static void iproc_msi_handler(struct irq_desc *desc)
 		 * head pointer.
 		 */
 		iproc_msi_write_reg(msi, IPROC_MSI_EQ_HEAD, eq, head);
+		if (!event_budget)
+			break;
 
 		/*
 		 * Now go read the tail pointer again to see if there are new

---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20261016-iproc-irq-9c58cfe39158

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>


