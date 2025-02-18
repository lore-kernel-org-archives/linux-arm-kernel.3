Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7983EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 14:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5D06ExxO5eYidVqviqeWkEfs7SfB2yLy/VcGeYimqH4=; b=1LWmjXvZPZgr4foXkWEnUGDr1g
	vlrkBXRGvfj3k6JOe4LiJB8nwB2LmtEPgF+9Zu+7tL5LtHnwSPsxxC9iZTWvH8MsvD9TdOK6Z19aB
	20SkLPj61mhi6KBVuTUX8M50DGTOmrfuzNSSlP9Z5N/0IchAI7RSmA9qpqPNk4UywPIHfvaoO1vxC
	RHGs3uMEzOUurqbWbJQAiZitt+Ka19jCPuTKuXFSpXIVuJl6J7u/raJNopdUjI84vSEigaCvRNC11
	C6Ivdp/wnDSXmvhAqkuDZCx6Ope/M5xlrGnWOmcMRC9WYYg2sp+b+cF7AqfvJi7ZTykTuRweHM4cJ
	uYhVKrqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOvk-00000008dCK-3WMP;
	Tue, 18 Feb 2025 14:50:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOia-00000008Zjr-0COK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 14:37:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BC311A40F24;
	Tue, 18 Feb 2025 14:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E999C4CEE2;
	Tue, 18 Feb 2025 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739889418;
	bh=JomdOoiQ17paEXI4f+PdfOHyWq+hd8mMOpVRmJpqAqk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=sV/8NlDsG7hDLXzrOchAa5HKlL/GKdnU0iXRBEPJx8HHjUTaYZ8JLaKeJErQhYOIM
	 aEC/K9YsvKPpdJ8iRdfF9JB6N1nvt2X1/nL1NGhf0scDmwE9gzLpndVSzMzltxYg2u
	 hZunI9y3hzXLIydeUEB+qLcmY73ZNIB+z1FuMWjgiCPd7OTk+rL7PkFQrtXGbUCGZ8
	 xXBc73fXVz4ESqEwjrA3y8b+CHDs2TY02RAMewvI4J0oMtMRSI6ptRAj0/dQVDggRI
	 81+poiRg1OQ8bM1QrjAeR7fR01yHoAXEJqFHUhH7oTccuBsEdgHaRPX6yFTOwDMs06
	 1HkDEyghT1OHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186FDC02198;
	Tue, 18 Feb 2025 14:36:58 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Subject: [PATCH 0/4] PCI: dwc: Add PTM sysfs support
Date: Tue, 18 Feb 2025 20:06:39 +0530
Message-Id: <20250218-pcie-qcom-ptm-v1-0-16d7e480d73e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPeatGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0ML3YLkzFTdwuT8XN2CklzdpDQzS1OjNNNkk1RTJaCegqLUtMwKsHn
 RsbW1ADxCJLNfAAAA
To: Shuai Xue <xueshuai@linux.alibaba.com>, 
 Jing Zhang <renyu.zj@linux.alibaba.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>
Cc: Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3647;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=JomdOoiQ17paEXI4f+PdfOHyWq+hd8mMOpVRmJpqAqk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBntJsCRFv6m9eazV1uDz0AhPMpFELd3Ewc3zgXo
 +fhwihHEpuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ7SbAgAKCRBVnxHm/pHO
 9bJICACZnuPkpD/+2MJa10YW7L52k2KZ9u9IjOvhXxIj2mVM8PULlDt3iUY4gLBw7c+1SWVf0r/
 x22opFo0IspCHMj11sYpyfq5huuUizvadSYKa5mS9wr4EWwHP9m32Q0yRVvc1R0u+Z9Iks9mDTy
 5lCWYYs5SRez6erms0QnXTbV6lYimtHrkqy7B3qcUURXDOsBsDGzAVJRnKG/S2vXp28U06zMHlI
 4BK4kWsWvl1i8ai4bkGEYOKvaicCm2aXZ1yuwb+7TYyDZNZd2WII4jFA4D/F2zlwpg8p0pYJaXZ
 N1Yu5D/wUOytbANzHVEmTmCyFWJMVtLaLjz7MmEVEh3Nkc36
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_063700_224376_1BFBECF7 
X-CRM114-Status: GOOD (  18.34  )
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
Reply-To: manivannan.sadhasivam@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

This series adds sysfs support for PCIe PTM in Synopsys Designware IPs.

First patch moves the common DWC struct definitions (dwc_pcie_vsec_id) to
include/pci/pcie-dwc.h from dwc-pcie-pmu driver. This allows reusing the same
definitions in pcie-designware-sysfs driver introduced in this series and also
in the debugfs series by Shradha [1].

Second patch adds support for searching the Vendor Specific Extended Capability
(VSEC) in the pcie-designware driver. This patch was originally based on
Shradha's patch [2], but modified to accept 'struct dwc_pcie_vsec_id' to avoid
iterating through the vsec_ids in the driver.

Third patch adds the actual sysfs support for PTM in a new file
pcie-designware-sysfs.c built along with pcie-designware.c.

Finally, fourth patch masks the PTM_UPDATING interrupt in the pcie-qcom-ep
driver to avoid processing the interrupt for each PTM context update.

Testing
=======

This series is tested on Qcom SA8775p Ride Mx platform where one SA8775p acts as
RC and another as EP with following instructions:

RC
--

$ echo 1 > /sys/devices/platform/1c10000.pcie/dwc/ptm/ptm_context_valid

EP
--

$ echo auto > /sys/devices/platform/1c10000.pcie-ep/dwc/ptm/ptm_context_update

$ cat /sys/devices/platform/1c10000.pcie-ep/dwc/ptm/ptm_local_clock
159612570424

$ cat /sys/devices/platform/1c10000.pcie-ep/dwc/ptm/ptm_master_clock
159609466232

$ cat /sys/devices/platform/1c10000.pcie-ep/dwc/ptm/ptm_t1
159609466112

$ cat /sys/devices/platform/1c10000.pcie-ep/dwc/ptm/ptm_t4
159609466518

NOTE: To make use of the PTM feature, the host PCIe client driver has to call
'pci_enable_ptm()' API during probe. This series was tested with enabling PTM in
the MHI host driver with a local change (which will be upstreamed later).
Technically, PTM could also be enabled in the pci_endpoint_test driver, but I
didn't add the change as I'm not sure we'd want to add random PCIe features in
the test driver without corresponding code in pci-epf-test driver.

Merging Strategy
================

I'd like to have an ACK from the perf maintainers to take the whole series
through PCI tree.

[1] https://lore.kernel.org/linux-pci/20250214105007.97582-1-shradha.t@samsung.com
[2] https://lore.kernel.org/linux-pci/20250214105007.97582-2-shradha.t@samsung.com

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (4):
      perf/dwc_pcie: Move common DWC struct definitions to 'pcie-dwc.h'
      PCI: dwc: Add helper to find the Vendor Specific Extended Capability (VSEC)
      PCI: dwc: Add sysfs support for PTM
      PCI: qcom-ep: Mask PTM_UPDATING interrupt

 Documentation/ABI/testing/sysfs-platform-dwc-pcie  |  70 ++++++
 MAINTAINERS                                        |   2 +
 drivers/pci/controller/dwc/Makefile                |   2 +-
 drivers/pci/controller/dwc/pcie-designware-ep.c    |   3 +
 drivers/pci/controller/dwc/pcie-designware-host.c  |   4 +
 drivers/pci/controller/dwc/pcie-designware-sysfs.c | 278 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.c       |  46 ++++
 drivers/pci/controller/dwc/pcie-designware.h       |  22 ++
 drivers/pci/controller/dwc/pcie-qcom-ep.c          |   8 +
 drivers/perf/dwc_pcie_pmu.c                        |  23 +-
 include/linux/pcie-dwc.h                           |  42 ++++
 11 files changed, 478 insertions(+), 22 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250218-pcie-qcom-ptm-bf6952f5c4e5

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>



