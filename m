Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47465CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jBeIvH+ev2/VOGZSLs2/Nm3nn0glIp/8aMcm/j7TMs=; b=ewIqvYM4sek/RktqTwKKSbwFZZ
	jQZDivnAirnv/qEHoMwTU/vLHIZPsGAkxxWVESuf+PW6NpPMESCpqoVB0Lzy3Cffcs6HBeA0ZTVVg
	lPnkqJCIiPHoav47Cu5zVWB/PmPjRDVZVWn9cbS/sqsflZSVqh3dR0OnK9jZR6sgROUlVJstYmp+V
	/LzIPtROWeftVf0qsfESndqBV1IW9K0vGgAp9NoCvUGi/Z64ajDe34G/9/lnN5N3EHwT1vCcnPa9y
	EsVWMLP/9eSRiRWaX1zoQWAnBwpUUCaxmofJwpJfsZVeM4P60bD/ZEq8U1V5WnsuE4mqQ2pN47ZH+
	xkdV+R1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzRc-0000000G4lg-2tUJ;
	Mon, 18 May 2026 14:59:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzRR-0000000G4dD-3gzM;
	Mon, 18 May 2026 14:59:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18A34445DC;
	Mon, 18 May 2026 14:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6071C2BCFA;
	Mon, 18 May 2026 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779116377;
	bh=2BlXOqN2MZMWBnpX9YhHPFj1hDHvw8PDo9sAAleLcKQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rSFNQyejJN1StW2jxZXu4JYK0fBi4R7e50XyaCZdoKCJrc88c/HBcQUE+XFczKXln
	 7GCFjGgUbJfUnABpYaJYIZldk/dzVUkNZXjp7pgUqmHm2NJizrZEgAs93NuyHoRs5u
	 ORUL/OQt4EG9yUeTchQzypVNqwGZpaMXK1d2UG+SZ9bZ4RqNAYTpLVANp5VHBsjgEt
	 0XC1RmRbEzLdSO7N7nGg60yPvelPhzBNyjEMQfEcxkMaR09wvdKZBE3/OSxndVe4KC
	 NOmISQynSe7AzFcBX3BHpjXWTeEVzED1TZHtas+ifUE/JUkVSJNMYv5Bs7cFVDkYFD
	 +AvF2Yeuctw0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA44ECD4F49;
	Mon, 18 May 2026 14:59:36 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 18 May 2026 20:29:17 +0530
Subject: [PATCH v8 5/5] misc: pci_endpoint_test: Add AER error handlers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-pci-port-reset-v8-5-eb5a7d331dfc@oss.qualcomm.com>
References: <20260518-pci-port-reset-v8-0-eb5a7d331dfc@oss.qualcomm.com>
In-Reply-To: <20260518-pci-port-reset-v8-0-eb5a7d331dfc@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Niklas Cassel <cassel@kernel.org>, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 mani@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Brian Norris <briannorris@chromium.org>, 
 Wilson Ding <dingwei@marvell.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=JH7YrfnPbbQwcHA61MAIZvihPkNzj1YvLFKf+5eniiA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqCylVusbtosdeWvULWFlkHh78IbQMGqm1IAOx+
 tGRKk7zI06JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagspVQAKCRBVnxHm/pHO
 9WBGB/9M4YSDd/u8GygRb+Q9NR+sR+xkzlGX6Arf72nQo8iLfuIZSfmmo3tNIE252mRjE4SBjep
 u9Mu4Rk2sVPFLvxd+u5GSzGgsDTa8tcVuYDAtw+xFjz5MRwDWTgKgxr38lidrHbLRqiqtzL5uz4
 KychY6gPdaMcbHKno6gaMz9PA9pV3VzJGng6rKL8yL8uODtIyLvIlMslDX2Hq190bXbkex0fwWC
 cjULNwNhFecOlIu5lUUhaomXfvTFH0/sue5mbjRY9aOppS+5rzT7TOHdXs3ETXD0xXVSgMt/306
 Ux/uIMKhNVNouKfGHOjox249GhFX61Hck5JeWw2KFHfEmY46
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_075937_993072_1D506C41 
X-CRM114-Status: GOOD (  12.81  )
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
index dbd017cabbb9..3e89bd48c196 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -1327,6 +1327,8 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 		goto err_kfree_name;
 	}
 
+	pci_save_state(pdev);
+
 	return 0;
 
 err_kfree_name:
@@ -1448,12 +1450,33 @@ static const struct pci_device_id pci_endpoint_test_tbl[] = {
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
2.48.1



