Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231EED10C15
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 10:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IQKDNN0t8q4zvKMd9PTXKvruPz6Ex6yg+Xo+HJDuU3w=; b=de6haTSvCJ1TwgW0lMeVJdNnUv
	k3mNNY+KeEiuKgxTtfm0o6KxPqhPh3cnDkMmuzBBPC38c9aVxVR7abU/zawI3brD1kLF5d7z026d7
	WbEsxtltwwerzBdkIiW5ojmKLDDK63+Kml44u8sahcGFB/jC5U6QDxgasoyvXT1kJv55AWAwrlw1K
	tbbuGjrehkNXzyyZPth5ryZI34+JvjaANrebzujfUxB+lU1nUcYZxw1Clu52921435ABuYUUlkYat
	1LU8TA2wIPcR2xz4AyF926Q8NtMh3HZ0i+K5+NqXzs4xErrXqE0iqjnrOtRdWu62iGBPVheQEAoME
	47pc316Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t50RM-0000000816m-0oMO;
	Sun, 27 Oct 2024 10:24:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t50Pk-000000080qI-2kGU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 10:22:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDE045C3F06;
	Sun, 27 Oct 2024 10:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46316C4CEC3;
	Sun, 27 Oct 2024 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730024545;
	bh=0k3MEtE9BF8rhv6xudb8XxGPOormm9MhLswXlpEWSUo=;
	h=From:To:Cc:Subject:Date:From;
	b=MZWwo/UsB+fGmGC8cUmGUFUAuYqzccLyCvXjDbUNtRQSVCiP5ot0TpxiU9pKo9III
	 bCeJutiffoylbY/x5N1tVK18HjblSsE18Fa+4aomsBf+sMK0aMBDEV4SyTSgGFrSeb
	 zwN5L4o1UADnSYHKHjRO6xWUOgPoEtRqK0TbHpayYoXngzeAFlue62PDJTXFDqgjiY
	 WbRMslifzOKyjgxtIOyRpWIttZmVJXfL9jD78TxCiPHnZHWU51hGDFgs5g1zk+0awc
	 H++UBvYzKPGWibPylvLFCChOxLOGEUH1kdodS5uwQSGmr6QpVPZuARaKQKtKtdgoHe
	 4NRS0AzPqJ2IQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t50Pf-007I7d-3j;
	Sun, 27 Oct 2024 10:22:23 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] irqchip/gic-v4: Correctly deal with set_affinity on lazily-mapped VPEs
Date: Sun, 27 Oct 2024 10:22:20 +0000
Message-Id: <20241027102220.1858558-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_032228_760896_BC5A9287 
X-CRM114-Status: GOOD (  14.21  )
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

Zenghui points out that a recent change to the way set_affinity is
handled for VPEs has the potential to return an error if the VPE
hasn't been mapped yet (because the guest hasn't emited a MAPTI
command yet), affecting GICv4.0 implementations that rely on the
ITSList feature.

Fix this by making the set_affinity succeed in this case, and
return early, without trying to touch the HW.

Fixes: 1442ee0011983 ("irqchip/gic-v4: Don't allow a VMOVP on a dying VPE")
Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/aab45cd3-e5ca-58cf-e081-e32a17f5b4e7@huawei.com
---
 drivers/irqchip/irq-gic-v3-its.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index ab597e74ba08e..52f625e07658c 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3810,8 +3810,18 @@ static int its_vpe_set_affinity(struct irq_data *d,
 	 * Check if we're racing against a VPE being destroyed, for
 	 * which we don't want to allow a VMOVP.
 	 */
-	if (!atomic_read(&vpe->vmapp_count))
-		return -EINVAL;
+	if (!atomic_read(&vpe->vmapp_count)) {
+		if (gic_requires_eager_mapping())
+			return -EINVAL;
+
+		/*
+		 * If we lazily map the VPEs, this isn't an error and
+		 * we can exit cleanly.
+		 */
+		cpu = cpumask_first(mask_val);
+		irq_data_update_effective_affinity(d, cpumask_of(cpu));
+		return IRQ_SET_MASK_OK_DONE;
+	}
 
 	/*
 	 * Changing affinity is mega expensive, so let's be as lazy as
-- 
2.39.2


