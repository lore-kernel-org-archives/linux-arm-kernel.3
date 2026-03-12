Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBA4106ACCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKAEulDdVQpUy/F6OpD/8nSvWxKf3rH6D2RiMfRuwp8=; b=Vf9SmCRUlvEdrCrHuGxnRkclx0
	tPqU5xV3CKAut/v6NLdHWgi6wdG0Dc/DP4JDGpIQ0rdIb6eBeODOcGQLwlTfRrz3t6v7FDiw+GXzu
	4SyKryZBMDiQvQUhujH5MS1H+yA/e8+mDoMBYRyTvLRJGPen18JUCLe6nRjMo1AJTBagRyE/hzc98
	YXR3KSC6cIKDlbhAj1dFVKh2sIrKylJZVbFLUBhpz+ICZ/rOUJKYt4nB4pAPdo1xNvwn//LATwFVH
	9Qif3n50ubkANnGYdbmNsbgnITTkt6GMFps4Y9AwSd0cUMytuOe7w36pUd76P1SarD7n9JOiA2cK4
	qGcx39XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j38-0000000EaFs-2EVf;
	Thu, 12 Mar 2026 16:38:14 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j36-0000000EaCC-1F8R;
	Thu, 12 Mar 2026 16:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=EK
	AEulDdVQpUy/F6OpD/8nSvWxKf3rH6D2RiMfRuwp8=; b=mM77P+dWkFeNfJifuo
	hzNgYr2j2etbXn1mIt//3mZFUnDmV36czGxa8guAgfzEEaaikrU6M8afVB+7xLFC
	1A9UQQsbZQ0W99NKeGbqhaEKMWyOGe3sXMu36sf79x6LFxIe0nKFrGULWQl714LD
	2G2U43Eun5aGjegfT6ztU/KeI=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnN1Gl67JpMC_OAQ--.12929S3;
	Fri, 13 Mar 2026 00:36:59 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	jingoohan1@gmail.com,
	mani@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	helgaas@kernel.org,
	florian.fainelli@broadcom.com,
	jim2101024@gmail.com
Cc: robh@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v8 1/5] PCI: Add pcie_get_link_speed() helper for safe array access
Date: Fri, 13 Mar 2026 00:36:48 +0800
Message-Id: <20260312163652.113228-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312163652.113228-1-18255117159@163.com>
References: <20260312163652.113228-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnN1Gl67JpMC_OAQ--.12929S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF48JF4fKFW8CrWUXr13urg_yoW8ZF43pF
	W2kw1Fyr10qF13Xr43Zas8uFy5X3ZxGFW7GrW7GasF9F43Jr9xXr4a9rWfJr9akrsrZry2
	qF13tF4UC3W2yF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEF1vxUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:1caf:6d92:f4ee:5e02]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAssz2my66tRVQAA3z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_093812_817531_F9654F67 
X-CRM114-Status: GOOD (  11.30  )
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

The pcie_link_speed[] array is indexed by PCIe generation numbers
(1 = 2.5 GT/s, 2 = 5 GT/s, ...).  Several drivers use it directly,
which can lead to out-of-bounds accesses if an invalid generation
number is used.

Introduce a helper function pcie_get_link_speed() that returns the
corresponding enum pci_bus_speed value for a given generation number,
or PCI_SPEED_UNKNOWN if the generation is out of range.  This will
allow us to safely handle invalid values after the range check is
removed from of_pci_get_max_link_speed().

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/pci.h   |  2 ++
 drivers/pci/probe.c | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 13d998fbacce..6bf3e59f42e5 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -108,6 +108,8 @@ struct pcie_tlp_log;
 				 PCI_EXP_DEVCTL_FERE | PCI_EXP_DEVCTL_URRE)
 
 extern const unsigned char pcie_link_speed[];
+unsigned char pcie_get_link_speed(int speed);
+
 extern bool pci_early_dump;
 
 extern struct mutex pci_rescan_remove_lock;
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index bccc7a4bdd79..a95afbcee421 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -783,6 +783,22 @@ const unsigned char pcie_link_speed[] = {
 };
 EXPORT_SYMBOL_GPL(pcie_link_speed);
 
+/**
+ * pcie_link_speed_value - Get speed value from PCIe generation number
+ * @speed: PCIe speed (1-based: 1 = 2.5GT, 2 = 5GT, ...)
+ *
+ * Returns the speed value (e.g., PCIE_SPEED_2_5GT) if @speed is valid,
+ * otherwise returns PCI_SPEED_UNKNOWN.
+ */
+unsigned char pcie_get_link_speed(int speed)
+{
+	if (speed <= 0 || speed >= ARRAY_SIZE(pcie_link_speed))
+		return PCI_SPEED_UNKNOWN;
+
+	return pcie_link_speed[speed];
+}
+EXPORT_SYMBOL_GPL(pcie_get_link_speed);
+
 const char *pci_speed_string(enum pci_bus_speed speed)
 {
 	/* Indexed by the pci_bus_speed enum */
-- 
2.34.1


