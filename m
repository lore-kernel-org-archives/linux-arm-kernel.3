Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEF4C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3VpgfDJQYn3ffptUBCYFWibfHui5iQWzNjqFNfpXPDU=; b=PIu7Qr4+6nXDg29O/6UxnyteNa
	w5WTskv4+wn1w6Hej/cvlsiFoTBttaT4lARFA8YMxSEqxytYHP03Re+utRK2bZLiJay/E+PwitWof
	DhoM9dGc1XcM6OEBRQLN3iPUS46QDZV10CcB3tCURqIjGZOGnD19WLW/wKc1+BQGwwe5PSnJABua3
	d+HGwnvtOuK7fVE9qHWYuNliL9nvnHjV9LUHWHXq2MFTw6FIn1q49y9JAgbaGr0+3FZr4EEggc8m1
	V4p/K3uGnRT9cpbw+2hgLZ22naFiShw4Ker92RUEH1WKYR3iS7GsQnDj6swOZI8J6vt1/B7PVDO9K
	lNkvewhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTXv-0000000Cquw-3p3f;
	Thu, 03 Jul 2025 23:40:51 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSfk-0000000Clvq-37MA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 22:44:54 +0000
Received: by linux.microsoft.com (Postfix, from userid 1032)
	id 401B42115189; Thu,  3 Jul 2025 15:44:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 401B42115189
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1751582692;
	bh=3VpgfDJQYn3ffptUBCYFWibfHui5iQWzNjqFNfpXPDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fk13oTkk6sLk/wXss1sCA9KIc1jX7QUcJ5Kf1vlJ5/S3GMj0FJ73jyjVUk1umEPBK
	 6f/RJ2kF6G3t5sKo7HgO2MbFN06RVUW+N0QG0oPXm6weBw39VP99+2q33kPEuhuGVX
	 UtuwKPrpaceUxwECyhLW/ECvqtOyBbgOTODjkSoE=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mhklinux@outlook.com,
	tglx@linutronix.de,
	bhelgaas@google.com,
	romank@linux.microsoft.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	jinankjain@linux.microsoft.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	x86@kernel.org,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: [PATCH v2 3/6] x86/hyperv: Fix usage of cpu_online_mask to get valid cpu
Date: Thu,  3 Jul 2025 15:44:34 -0700
Message-Id: <1751582677-30930-4-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1751582677-30930-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1751582677-30930-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_154452_803606_1D9B0C53 
X-CRM114-Status: GOOD (  11.10  )
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

Accessing cpu_online_mask here is problematic because the cpus read lock
is not held in this context.

However, cpu_online_mask isn't needed here since the effective affinity
mask is guaranteed to be valid in this callback. So, just use
cpumask_first() to get the cpu instead of ANDing it with cpus_online_mask
unnecessarily.

Fixes: e39397d1fd68 ("x86/hyperv: implement an MSI domain for root partition")
Reported-by: Michael Kelley <mhklinux@outlook.com>
Closes: https://lore.kernel.org/linux-hyperv/SN6PR02MB4157639630F8AD2D8FD8F52FD475A@SN6PR02MB4157.namprd02.prod.outlook.com/
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
---
 arch/x86/hyperv/irqdomain.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/hyperv/irqdomain.c b/arch/x86/hyperv/irqdomain.c
index 31f0d29cbc5e..e28c317ac9e8 100644
--- a/arch/x86/hyperv/irqdomain.c
+++ b/arch/x86/hyperv/irqdomain.c
@@ -192,7 +192,6 @@ static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 	struct pci_dev *dev;
 	struct hv_interrupt_entry out_entry, *stored_entry;
 	struct irq_cfg *cfg = irqd_cfg(data);
-	const cpumask_t *affinity;
 	int cpu;
 	u64 status;
 
@@ -204,8 +203,7 @@ static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 		return;
 	}
 
-	affinity = irq_data_get_effective_affinity_mask(data);
-	cpu = cpumask_first_and(affinity, cpu_online_mask);
+	cpu = cpumask_first(irq_data_get_effective_affinity_mask(data));
 
 	if (data->chip_data) {
 		/*
-- 
2.34.1


