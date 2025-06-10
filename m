Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D3CC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 00:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puB6cQFE/rhFTMv5Zzq0obpGjYzCvE7tXTvZDEqP3mA=; b=pL6dmUc4g29OnZxof8r3/SGDGh
	LaM9dTdXiFtAw3gyWl9VNHYncUUnKOsCJvJRfNDE5Ph7G5ypjtq54cBHOL8TfyhJtQiYshd4bNn+o
	phVBJFJVwNN53fl6JzZ86RD/T2vFb3NVjCLxzrESDcM0eru0h+aIMVv/umF+DbpbXpmUIquU6VokV
	1YMT1S7MftrDc5ADU+u/f0F5TGK+G+7GvDqhVjKsw3RgfZ3Ls8T0+g2j4498tEPGfZeMoZMHdEVgg
	NSBjqNSLARpygNFk4LRLcKqLWMaiRlABncueU+ktzvUDxSqkdrHefImrmJYVPANuru6BFL5aD4Z1Q
	L+p+i2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8w6-00000008RI8-3YuH;
	Wed, 11 Jun 2025 00:03:22 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8lG-00000008QEi-2mcW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 23:52:11 +0000
Received: by linux.microsoft.com (Postfix, from userid 1032)
	id 53E3E2078616; Tue, 10 Jun 2025 16:52:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 53E3E2078616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1749599529;
	bh=puB6cQFE/rhFTMv5Zzq0obpGjYzCvE7tXTvZDEqP3mA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P0+Z0f4BKYWK/KShVT6OLBOzCiYr/h6meeLZkwn4DDq55vb5NYJWA3EY+zs+CFuak
	 hYOn+YkHhCvZkEj3mTZK7nHjaLpFt42zgQ0Zkyg2FDSteIySCpVJz1/H2sc3jCGC7v
	 MkT40l/z1WnTDuczGpq4nhCmhCg7gIaudSF+ljqo=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	bhelgaas@google.com,
	jinankjain@linux.microsoft.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	x86@kernel.org,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: [PATCH 1/4] PCI: hv: Do not do vmbus initialization on baremetal
Date: Tue, 10 Jun 2025 16:52:03 -0700
Message-Id: <1749599526-19963-2-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1749599526-19963-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1749599526-19963-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_165210_731969_F13D939E 
X-CRM114-Status: GOOD (  10.58  )
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

From: Mukesh Rathor <mrathor@linux.microsoft.com>

init_hv_pci_drv() is not relevant for root partition on baremetal as there
is no vmbus. On nested (with a Windows L1 root), vmbus is present.

Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
---
 drivers/pci/controller/pci-hyperv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
index b4f29ee75848..4d25754dfe2f 100644
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -4150,6 +4150,9 @@ static int __init init_hv_pci_drv(void)
 	if (!hv_is_hyperv_initialized())
 		return -ENODEV;
 
+	if (hv_root_partition() && !hv_nested)
+		return -ENODEV;
+
 	ret = hv_pci_irqchip_init();
 	if (ret)
 		return ret;
-- 
2.34.1


