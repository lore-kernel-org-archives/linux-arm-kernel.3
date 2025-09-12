Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A493CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twQ/qDEYavg0CzDuS8LI1uuNmhbFxWRYMM68N+ELTS8=; b=chrBoUhc8x6rBXwo1XSBTFa/Es
	JRlYBFPszJnMz2/L9Yj520KHW8Qfn6dItv3toe4sixLXeKbq9tZCMte7QngQB7pAfq/JgS6lREtux
	+Nt0Mu937esSTVq4n11Wp2KUhCgaR0hbLvd0WXyife3ILsr/JqIAoOwBufiPEJCdwYOGLYXUqSVkE
	dTLPtsn6poGnvOX85ocRZlvuKBkw8FTrh0eZKjCjjpgqa81E+DOTBuAPI9gQCkpFxCNso4PqR1nln
	qwlao+tNfWaR6fnRtsMrOYEiRTokwgV4c4fjVw5dJC8FmLUlE399bIzz0Y3ugEpnxV8L+1Hh8CE1k
	4OEAlpmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2qF-00000009E88-2QmK;
	Fri, 12 Sep 2025 12:25:27 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2qA-00000009E3Y-2LgE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:25:26 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CCP85t517320;
	Fri, 12 Sep 2025 07:25:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757679908;
	bh=twQ/qDEYavg0CzDuS8LI1uuNmhbFxWRYMM68N+ELTS8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rDToLn5foQeG4gqx7PEjuuMdZQFOm2U67cDhQHwTDku6j6C46vNwDTA5bxIj1NRtD
	 u8MJAq7ui5ol3bXrz/hpbpGrx1/05NXtC9nnlCn0/ci73xWLmiu4EekbTinQqElHu1
	 cPt68ORYxZlQFaPDpML0OgDIt2pe7B3ucjE4Zr8g=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CCP8sJ1849867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 07:25:08 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 07:25:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 07:25:07 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CCNuLb3589278;
	Fri, 12 Sep 2025 07:25:00 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
        <christian.bruel@foss.st.com>, <qiang.yu@oss.qualcomm.com>,
        <mayank.rana@oss.qualcomm.com>, <thippeswamy.havalige@amd.com>,
        <shradha.t@samsung.com>, <quic_schintav@quicinc.com>,
        <inochiama@gmail.com>, <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>
CC: <jirislaby@kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 09/10] PCI: keystone: Exit ks_pcie_probe() for the default switch-case of "mode"
Date: Fri, 12 Sep 2025 17:46:20 +0530
Message-ID: <20250912122356.3326888-10-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912122356.3326888-1-s-vadapalli@ti.com>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_052522_728917_62CFCF8D 
X-CRM114-Status: GOOD (  15.61  )
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

v1: https://lore.kernel.org/r/20250903124505.365913-11-s-vadapalli@ti.com/
No changes since v1.

 drivers/pci/controller/dwc/pci-keystone.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 2da9feaaf9ee..e85942b4f6be 100644
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


