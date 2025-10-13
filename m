Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0146ACCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=03eLz1BO3ywqvR4VvhSI4Ov3l5NVQWBbzVASFhLKhgU=; b=Dv1YCaX7aMq0Z0gp2uXCvHzNcm
	R7HAfzsPJ2G75jIwvfFEKbCNxqJImSoibHiReg6ZqBd87O2DUBfWAHIsvGQPL+bqfhgM2qvPEt/2j
	G48nTN6Awz6X+kXNrBQ7IFRdgJYbmjUe+utKXzASohQv2hDOiT1bHBOF2ZlakfpRMk0SNhvZGoVqb
	WJju8Ow4DjNPbnIHumuvskJmWwaNwuqXA2aB8k+JWqMzpwEINQBJsNTF9NUhXQjut/KtWV8Uk/35K
	pMaCZsmxFOnQUKJQUd/Nv8GZaCcfyphK4zqj52+aptxaQUqrqTlkoDnteOw0Jt7OwV6BOSI2k249l
	NOrnHfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EP8-0000000Cfvj-2JkE;
	Mon, 13 Oct 2025 08:59:42 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EP5-0000000CfuW-3AIL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 08:59:41 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59D8xVmL1225224;
	Mon, 13 Oct 2025 03:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760345971;
	bh=03eLz1BO3ywqvR4VvhSI4Ov3l5NVQWBbzVASFhLKhgU=;
	h=From:To:CC:Subject:Date;
	b=PBlOQTQIGCtbTnoUi7ay58pugJ67F5ZxNZdaE+TaWraiKo1Wjh1yIOkebBQqO5l6N
	 lBQ+ZrS4JjV/0F4+bxYseMqAZeZnepIpZW53jtzAYC/vloOdkbVJljD3Gi9Cvy6P64
	 WZ/ua5uSWE8DXDA2Kz0w9sr8uVlUQDIvvyZvfTfE=
Received: from DFLE207.ent.ti.com (dfle207.ent.ti.com [10.64.6.65])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59D8xV1X3693355
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Oct 2025 03:59:31 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 03:59:31 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 03:59:31 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59D8xVoX1669656;
	Mon, 13 Oct 2025 03:59:31 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 59D8xTUB024754;
	Mon, 13 Oct 2025 03:59:30 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <horms@kernel.org>, <m-malladi@ti.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net] net: ti: icssg-prueth: Fix fdb hash size configuration
Date: Mon, 13 Oct 2025 14:29:25 +0530
Message-ID: <20251013085925.1391999-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_015939_970619_58ECB3A0 
X-CRM114-Status: GOOD (  11.29  )
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

The ICSSG driver does the initial FDB configuration which
includes setting the control registers. Other run time
management like learning is managed by the PRU's. The default
FDB hash size used by the firmware is 512 slots which is not
aligned with the driver's configuration. Update the driver
FDB config to fix it.

Fixes: abd5576b9c57f ("net: ti: icssg-prueth: Add support for ICSSG switch firmware")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---

Please refer trm [1] 6.4.14.12.17 section
on how the FDB config register gets configured.

[1]: https://www.ti.com/lit/pdf/spruim2

 drivers/net/ethernet/ti/icssg/icssg_config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_config.c b/drivers/net/ethernet/ti/icssg/icssg_config.c
index da53eb04b0a4..3f8237c17d09 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_config.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_config.c
@@ -66,6 +66,9 @@
 #define FDB_GEN_CFG1		0x60
 #define SMEM_VLAN_OFFSET	8
 #define SMEM_VLAN_OFFSET_MASK	GENMASK(25, 8)
+#define FDB_HASH_SIZE_MASK	GENMASK(6, 3)
+#define FDB_HASH_SIZE_SHIFT	3
+#define FDB_HASH_SIZE		3
 
 #define FDB_GEN_CFG2		0x64
 #define FDB_VLAN_EN		BIT(6)
@@ -463,6 +466,8 @@ void icssg_init_emac_mode(struct prueth *prueth)
 	/* Set VLAN TABLE address base */
 	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, SMEM_VLAN_OFFSET_MASK,
 			   addr <<  SMEM_VLAN_OFFSET);
+	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, FDB_HASH_SIZE_MASK,
+			   FDB_HASH_SIZE << FDB_HASH_SIZE_SHIFT);
 	/* Set enable VLAN aware mode, and FDBs for all PRUs */
 	regmap_write(prueth->miig_rt, FDB_GEN_CFG2, (FDB_PRU0_EN | FDB_PRU1_EN | FDB_HOST_EN));
 	prueth->vlan_tbl = (struct prueth_vlan_tbl __force *)(prueth->shram.va +
@@ -484,6 +489,8 @@ void icssg_init_fw_offload_mode(struct prueth *prueth)
 	/* Set VLAN TABLE address base */
 	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, SMEM_VLAN_OFFSET_MASK,
 			   addr <<  SMEM_VLAN_OFFSET);
+	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, FDB_HASH_SIZE_MASK,
+			   FDB_HASH_SIZE << FDB_HASH_SIZE_SHIFT);
 	/* Set enable VLAN aware mode, and FDBs for all PRUs */
 	regmap_write(prueth->miig_rt, FDB_GEN_CFG2, FDB_EN_ALL);
 	prueth->vlan_tbl = (struct prueth_vlan_tbl __force *)(prueth->shram.va +

base-commit: 68a052239fc4b351e961f698b824f7654a346091
-- 
2.43.0


