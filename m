Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8BDCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 15:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSgvnTvhiPvpnGrJs7A+0odLklISOXka10lYXHEdnGk=; b=sSiwvww0kPOL4gLo4z3y4qscGW
	2SmkAbKh8pBiV5eZzw/sVabc1HZyk2W+zBPMNIkDZmUmeeoUY3ldJxjaq3eqhfjq5rYw3GfNeLYY0
	7T9cQQ66Aj6vqQFYoRQsPKVpNUeFe5chyEhBJ3Ln2DTkyEl50ZncrxYv1zpXpYHQJ1Lzwq64LTXFI
	Mx82UcFxB/rUYaSBaaztP695mYpfk/vvfrOuMpYYZufY+we8pW+7pr8tXq6SapgyF7BtMHqpIlOqH
	oyfAGgHFG9S2VrQd2C1PbB4wa0+aYvYvy8TkFHFw6YWdVmFo+68MBRk+ZStwMoAC9N8IpWnvll/h0
	riLNST1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpIn-00000006t7C-1ri5;
	Wed, 03 Sep 2025 15:21:37 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmsh-00000006RXQ-16QT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:46:32 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583CkKfT2831378;
	Wed, 3 Sep 2025 07:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756903580;
	bh=SSgvnTvhiPvpnGrJs7A+0odLklISOXka10lYXHEdnGk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GMExD6NbY/oe5Loa5ZYnMAS8SnUhVlYBUqG6U+61HDqlqD/6ta6eORPqzqQ71I6zX
	 B+GnHvuo6LKbpV1ukLpKCmt3yqTrloqYxmDzHwjAREfmIUP+3kYBd/i7Yubb0SwL3r
	 FNvyGnMcxmkYgiX20q6vTykzlNERyvK34x1q89U4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583CkKxl3523158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 07:46:20 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 07:46:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 07:46:19 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 583Cj5wb1576150;
	Wed, 3 Sep 2025 07:46:13 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <fan.ni@samsung.com>, <quic_wenbyao@quicinc.com>,
        <namcao@linutronix.de>, <mayank.rana@oss.qualcomm.com>,
        <thippeswamy.havalige@amd.com>, <quic_schintav@quicinc.com>,
        <shradha.t@samsung.com>, <inochiama@gmail.com>, <cassel@kernel.org>,
        <kishon@kernel.org>, <18255117159@163.com>, <rongqianfeng@vivo.com>,
        <jirislaby@kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 10/11] PCI: keystone: Exit ks_pcie_probe() for the default switch-case of "mode"
Date: Wed, 3 Sep 2025 18:14:51 +0530
Message-ID: <20250903124505.365913-11-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903124505.365913-1-s-vadapalli@ti.com>
References: <20250903124505.365913-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_054631_393618_3482400F 
X-CRM114-Status: GOOD (  17.74  )
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

In ks_pcie_probe(), the switch-case for the "mode" is used to configure
the PCIe Controller for either Root-Complex or Endpoint mode of operation.
Prior to the switch-case statement for "mode" an invalid mode will result
in probe failure only if "dw_pcie_ver_is_ge(pci, 480A)" is true, which
is the case for the AM654 platform. On the other hand, when that is not
the case, "ks_pcie_set_mode()" will be invoked, which does not validate
the mode. As a result, it is possible for the switch-case statement for
"mode" to receive an invalid mode. Currently, an error message is displayed
in the "default" case where "mode" is neither "DW_PCIE_RC_TYPE" nor
"DW_PCIE_EP_TYPE", but the probe succeeds. However, since the configuration
required for Root-Complex and Endpoint mode have not been performed, the
Controller is not operational.

Fix this by exiting "ks_pcie_probe()" with the return value of "-EINVAL"
in addition to displaying the existing error message.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

NOTE: A "Fixes" tag is ommitted on purpose since the fix is not crucial:
1. It doesn't fix a crash or any fatal error
2. It doesn't enable controller functionality by fixing the issue

Therefore, the patch may not be worth backporting.

Regards,
Siddharth.

 drivers/pci/controller/dwc/pci-keystone.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 02f9a6d0e4a8..4ed6eab0a2f0 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -1414,6 +1414,8 @@ static int ks_pcie_probe(struct platform_device *pdev)
 		break;
 	default:
 		dev_err(dev, "INVALID device type %d\n", mode);
+		ret = -EINVAL;
+		goto err_get_sync;
 	}
 
 	ks_pcie_enable_error_irq(ks_pcie);
-- 
2.43.0


