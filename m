Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64A2C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 04:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIZNkNW5LZT+ytQyaXjrXgbwgSkBvxBGZ6CJNC3l3Uk=; b=MB1OyzxZjRP0C2zIhYiBoUR+mg
	eM4p9wQ+w71y0wHKBImYYYc+Lv4ROMa2ApYEdUiaP751yjbYtDhJXJZH1mmeFc0B4F1qYvrccLuD+
	dqzn9QhNI3SpiZJjCPej5rvdd9aX5tWM0Zz+iJEqcwuqdjwhzbznn1+lNbepLeRUWfcDYAbG4u4N9
	gQmy9FITzX5KZ+qIscElaZvvH6TZx1cQyTlOOxMhm22BJk4rgUs96S806fWBRVEeCMRlvpEe1ahK+
	EEykpP+Yr/zFi1XDTiM9QdFinIGdsHyQfCdIhcjhmAsaWVhH0UWRru6fk5JN2vv88if7QMo5R8KW9
	zo222hIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wowHx-00000006sWt-2mi0;
	Wed, 29 Jul 2026 04:53:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wowHg-00000006sLl-2cji;
	Wed, 29 Jul 2026 04:52:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5841645152;
	Wed, 29 Jul 2026 04:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F5A2C4AF16;
	Wed, 29 Jul 2026 04:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785300767;
	bh=fySVXE/aTfrJSjJ2cAKr0vSWe2afZA9cj+VbFYbVc4E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dazNOuQVKfjs/bgcEMNpPuj9hfKIn4r/PcFvZGzOYtzBrfv58Fpm9+33CFfhxbJ4A
	 hYvh9OGNu1sALRgh8eEiEWNO09ZRQRZHlpOzCAlOEHgH3eMgpQXMCIAyFj4CUKnrOj
	 Nz3F/taMaPkJ43my8dViJueFFc/qbUGmqwqiSeiwJ3tVOMmqwBKXSErTY39pF7j1+H
	 AVB+U8n7aPdZBl/Z/6464KqD/sDi2HxtVowQXKzl/r1zSpqnp5X34Uy6h8CDI3L75R
	 pX2ghZdTCSYeWuBbl9qAFdnnMa0+oDvWGAmJ35OHbpn18uOSw/M+bmZ+vpzBP7NVi6
	 2Usc9DXyt1P+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09056C53200;
	Wed, 29 Jul 2026 04:52:47 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Wed, 29 Jul 2026 10:22:31 +0530
Subject: [PATCH v9 5/5] misc: pci_endpoint_test: Add AER error handlers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-pci-port-reset-v9-5-53570b92064d@oss.qualcomm.com>
References: <20260729-pci-port-reset-v9-0-53570b92064d@oss.qualcomm.com>
In-Reply-To: <20260729-pci-port-reset-v9-0-53570b92064d@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Jingoo Han <jingoohan1@gmail.com>, Koichiro Den <den@valinux.co.jp>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Niklas Cassel <cassel@kernel.org>, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 mani@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Brian Norris <briannorris@chromium.org>, 
 Wilson Ding <dingwei@marvell.com>, Frank Li <Frank.Li@nxp.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2036;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=+fQoBW7D9QXgCIKA2Pmk7k1028c3wFqBv4GFgS/bGLo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqaYccF5MVV5xC3xxQhY4FDr9QKyU34YNIqpE/h
 JB/JpsxBj+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCammHHAAKCRBVnxHm/pHO
 9SQWB/96YSCRrticMR9WgFmJ/tckKOVulQvEA/lBzlXln5UHHEDzdc135Ou4L1DoqJIGYkvRE5n
 KUjiUzyzjZkZgKq88HbAqNFsyfbABSgM1z6r8w+D5PdsjhqJrdHReJXOxrH4gCbOt5LXa7Ro7LM
 HvA0V3vXtClL6kmXO7st9KbbT0A6J3RCtcApW581RFLMlLSaWrPB6zjmSv95ZQ2GVxSBc+sk/OS
 Vp6FNVbauF+/GvZWH7RBDDiY9R6Y5UlzH1s2WHJQ5Ulz8GJKGiesPN+ZRBYWWmY5RPzSn4nvxWm
 IC+kZ8MI74eB+tan1kEHUWWDkIBW3yhplgSjO6n8r9tIBWUJ
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

This Endpoint test driver doesn't need to do anything fancy in its error
handlers, but just restore the config space that was saved during probe and
report the correct result. This helps in making sure that the AER recovery
succeeds.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/misc/pci_endpoint_test.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index 3635741c3e7a..b7a149715700 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -1325,6 +1325,8 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 	misc_device->parent = &pdev->dev;
 	misc_device->fops = &pci_endpoint_test_fops;
 
+	pci_save_state(pdev);
+
 	ret = misc_register(misc_device);
 	if (ret) {
 		dev_err(dev, "Failed to register device\n");
@@ -1452,12 +1454,33 @@ static const struct pci_device_id pci_endpoint_test_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, pci_endpoint_test_tbl);
 
+static pci_ers_result_t pci_endpoint_test_error_detected(struct pci_dev *pdev,
+					      pci_channel_state_t state)
+{
+	if (state == pci_channel_io_perm_failure)
+		return PCI_ERS_RESULT_DISCONNECT;
+
+	return PCI_ERS_RESULT_NEED_RESET;
+}
+
+static pci_ers_result_t pci_endpoint_test_slot_reset(struct pci_dev *pdev)
+{
+	pci_restore_state(pdev);
+	return PCI_ERS_RESULT_RECOVERED;
+}
+
+static const struct pci_error_handlers pci_endpoint_test_err_handler = {
+	.error_detected = pci_endpoint_test_error_detected,
+	.slot_reset = pci_endpoint_test_slot_reset,
+};
+
 static struct pci_driver pci_endpoint_test_driver = {
 	.name		= DRV_MODULE_NAME,
 	.id_table	= pci_endpoint_test_tbl,
 	.probe		= pci_endpoint_test_probe,
 	.remove		= pci_endpoint_test_remove,
 	.sriov_configure = pci_sriov_configure_simple,
+	.err_handler    = &pci_endpoint_test_err_handler,
 };
 module_pci_driver(pci_endpoint_test_driver);
 

-- 
2.51.0



