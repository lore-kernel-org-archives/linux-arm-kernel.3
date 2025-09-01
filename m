Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CD4CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6s67FAZDJUizll6nPEf6TZibmkbOoVBvmJUSm6yE6vc=; b=CaYK8VTU19E8JV7oinUltiTYqj
	VRIAOOdvJilYekHSvjRGTtbaQY6n3MxF8f4AbmT6H7pmSfkDKIV8JaQ4tQ0PPvI0dzch/WdB8Evyy
	Eb83YAeuJT/71KVlc0UHnrOyqRYy+PF7QLv6SDfovqt7Sr00VFHQ8PZVmcKNGuiiU7u1/p0gI0L6N
	HJH5GcEgCh+z1h2ucul5RwJB/3DEzT9slAXsxKand8443smn+GJKjATfNkD9y/2QW15Caqjunr3JE
	1VcZM7GZufeWVLW8b4xlG8bZ2TQv8Wo/eGUrELyG/CcKWuE3qts/rGHo5NLAv0BWppALF1oWYrWPn
	SA6bmwvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5od-0000000Css4-0G8d;
	Mon, 01 Sep 2025 14:47:27 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3Ga-0000000CA6W-3SEu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:04:10 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 581C44rR2801951;
	Mon, 1 Sep 2025 07:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756728244;
	bh=6s67FAZDJUizll6nPEf6TZibmkbOoVBvmJUSm6yE6vc=;
	h=From:To:CC:Subject:Date;
	b=yPIzxOa13fWYaShw/EVS1xRj4NZETT0OsRwAi3ieDNmlrKjpdwDnK9KnDNjkqQ+vo
	 eU+c4dAVhOSDKbZl1tV7QqnMHI68U1Ij7Nqlto1tTxFd8H3SMLokyeSDhBdQyCE4cC
	 X4Cp1syqPxnRI5hPkq5Ur31+FnJOSzoOaadQdL44=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 581C44Za1527093
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 1 Sep 2025 07:04:04 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 07:04:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 07:04:03 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 581C3xQj2472040;
	Mon, 1 Sep 2025 07:04:00 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <vigneshr@ti.com>
CC: <stable@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH] PCI: j721e: Fix module autoloading
Date: Mon, 1 Sep 2025 17:33:55 +0530
Message-ID: <20250901120359.3410774-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_050408_915016_D6B4B9DC 
X-CRM114-Status: GOOD (  13.25  )
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

Commit under Fixes added support to build the driver as a loadable
module. However, it did not add MODULE_DEVICE_TABLE() which is required
for autoloading the driver when it is built as a loadable module.

Fix it.

Fixes: a2790bf81f0f ("PCI: j721e: Add support to build as a loadable module")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on commit
b320789d6883 Linux 6.17-rc4
of Mainline Linux.

Patch has been tested on J7200-EVM with the driver configs set to 'm'.
The pci-j721e.c driver is autoloaded as Linux boots and it doesn't need
to be manually probed. Logs:
https://gist.github.com/Siddharth-Vadapalli-at-TI/f64eed4df6fd4f714747b3c7e7876f24

Regards,
Siddharth.

 drivers/pci/controller/cadence/pci-j721e.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 6c93f39d0288..cfca13a4c840 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -440,6 +440,7 @@ static const struct of_device_id of_j721e_pcie_match[] = {
 	},
 	{},
 };
+MODULE_DEVICE_TABLE(of, of_j721e_pcie_match);
 
 static int j721e_pcie_probe(struct platform_device *pdev)
 {
-- 
2.43.0


