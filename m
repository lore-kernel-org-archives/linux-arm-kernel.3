Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2962F33806
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 06:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GLOhAUYy7CsuaEdyDpIDoO+TwGibMz8Z4f2XqQR+7i0=; b=N58Hz27H33RTMjQlD3ilM2qlCX
	hVLAcC9CURxCZ3LR9fNfzgmEvYU/lLcndteO3QHrrbG93emqpuf6wG7drKTBBMnqCv9xC8iz4z6Xy
	i9S1QR/JdJlHNKjKk5uB17W1V4a3v1rmhKBCpbVx3P1oxvLSwOGZFGqykXckpj1TdncXvXVYpv8WK
	X7QUW7c6v0lR7rEyMfJORV6Xye0/BDHNEOfbuCpZApMVpBVAFB587h6BdPybHKQY+ntFvzry5LYM4
	5fjb1VEB050lHtNqv/wDkqIy6e8NEnvEsokC5s3OIgOqZQZ6sBpGTiWE//icvacg49UQHVfxWnPnS
	Qfn7yy2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O5b-00000005Vg4-3xMw;
	Tue, 17 Mar 2026 06:39:39 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O5Z-00000005Vfh-1J7v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 06:39:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIfK8aw1BAMrTYd48i6nX/cs7X67mF2xvg/4dUDkiLc5Ppkay1fFn80Zra57DxvWLS31SNIn48pLFBn6ob7+OEAQ5yFzaFKRzKEacxI4+Wiz1YEvwUaWGjvgmFHUGRu9281GfRqhjmNxPNF7y4Mbs6Eq1aqB78dR57DjyWYn2sux/WWPORjHJJZG+sX3H0KVyiIXDdqpamCgeBEbKGMMc9OewiF88Xxq4r/VFdxx4Z6a6uhOujBPyETMuYkYGQhMQd93nFYL94rENW0fd90wpqcUYmbUNe8D/YqeV7FgCVjVbPvnwOhu/gHzKJzh06S5xRPncvaXQZWKFF3yUmXMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLOhAUYy7CsuaEdyDpIDoO+TwGibMz8Z4f2XqQR+7i0=;
 b=BOWP+eXI6Mft5J2H3O44046ki8BdzAN7A/qgU2ZWiyCUNZ6FGjJVsN/0UP0htiuRSJA3SX3S/eQYAjnmUvSWOAVzSt1cIQO+SBlY2j9IsBr1CunT61bI4EgLcVBfcOoggG7jrAo88e5ulXHueE6/GhzDBMzeGSGXPilGDwBzSVKGwcJV152Ubhk5p+elYlIiNdOHZcED9al/uMUCImxoVUZrfkuKFWf8+aDPiSxMhW/A+6qREF5xBcjIl5NE0Yhum0hudoFGbXQeutMpplej/yAoQtF2DfXvNt85JfrSoV8kI0rvQ2HhsZfqKRW/ij3MrOoDFqNPL/SMJLdZ+iIvrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLOhAUYy7CsuaEdyDpIDoO+TwGibMz8Z4f2XqQR+7i0=;
 b=UlqlrI82BsWYJjlVRXNRkl7z13q15/CLTqpeywJxMXcTsCjiRG85fyDP4qqJ89NEky7x+uid4pJtJ+VsB7Z3Uz5aoFsCyqOAy51VthBoSbDf8NjHKo58aTuTOYOkIHz5H692UGMF/gqYxjoHe9rsgo98qBnze4GkDxSU5AQJE8s=
Received: from BLAPR03CA0041.namprd03.prod.outlook.com (2603:10b6:208:32d::16)
 by SN7PR10MB6643.namprd10.prod.outlook.com (2603:10b6:806:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 06:39:32 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::f) by BLAPR03CA0041.outlook.office365.com
 (2603:10b6:208:32d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Tue,
 17 Mar 2026 06:39:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 06:39:31 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 01:39:08 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 01:39:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 01:39:07 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.69.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62H6d3h42199468;
	Tue, 17 Mar 2026 01:39:03 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <krzysztof.kozlowski@oss.qualcomm.com>, <geert+renesas@glider.be>,
	<bjorn.andersson@oss.qualcomm.com>, <arnd@arndb.de>, <nm@ti.com>,
	<ebiggers@kernel.org>, <michal.simek@amd.com>, <luca.weiss@fairphone.com>,
	<sven@kernel.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<kuninori.morimoto.gx@renesas.com>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <s-vadapalli@ti.com>, <danishanwar@ti.com>
Subject: [PATCH v2] arm64: defconfig: Enable J721E and Keystone PCIe drivers for TI SoCs
Date: Tue, 17 Mar 2026 12:09:02 +0530
Message-ID: <20260317063902.262392-1-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|SN7PR10MB6643:EE_
X-MS-Office365-Filtering-Correlation-Id: 9917720d-e115-4404-dddb-08de83eff1fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info: auwvmdv7sxS3H7ctUKrrzORvG8FL5cY3d6e+9KldsZXb/3fE19qup1i/jtORU7hGTcL0b2SBsaSIj+0UefxMcJWmcLd/6rq7b9Hhz8pjncOplGDF2z7QyvrhMjizdeRGbwnAzolCGE85y1UhBOvjML+rVvgdGIkfDWLsErtJ1usc8puIlzkpJMnJKWvDd4KUYgL6GxY9gxYDTumaY7Ce1oxuQQKlQKrximKkm/glgsEVuskK9XDzmZ2X7phy0EmxQV5wC5jR+3YOvhRqtAnFijpaaSJDCa4KJsuwWe2++zijQS+w8Zb7Jav89SGj7xRkSMTfBO6oJleiKcwCpYGDy8y5CO/ky7QAItTci5dmDYfimmZ2rY0nS6woX/+rGSZwx2Mt4pEZmHJcokosQh1hoNX8no9WwUGVq7qY8jxuzZhvLxgKofB0MPqRmzOXxy3Ld1fe99PW9cYIHabCg8tinhe4il+s+aU63wYvUsOhjOC+XGrbSxIl8GQfQmAfm6LBpMed0/MGHv7wnwEQfjjmPQt2DhI8pj/krm234TU6BV0j0xgX+GfchNOIw4birW7/QYWpae2C53xQepVbobVQWAInKtlbh5ET9Z++CIKcGsqm4to7PQ5MJUkkvHOKKLJHMSW1YQ6EWvw/efsfFyc1nQnCYvNJe37d5r0Hya3b0P5uqP3db/xETzdt/zIlPWY2+lp9m6DTcfOt6dT2dIeh3vGM4meh3r3xMj9UcEAxHjeynWcbAB8egXvBNOxJsW7MGcerdpT5inrDSLk3I4Mu9pKIOXFt9IoE6DpjGYt1ogw3r96Q88vzx4mUZ6Hy+5sK6ph7lKOs9/nR18uhylmbqQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XqlyIhPviCJKzyur2y6X0th3Wdt+wqSVmc+sNmdBZccHEODkKIzUWquxpR/nVptlzqUO57D1jIZSLjCfw5b07sQvUTSWK8ovA8AnZmFxLJC3K8PeBNe/cfjHZS5ixAFw73GqwROvQazSqYM+kuaKcLtVJmz06gAOLzKosi5PWmb5IFmKXoX5+D292M9uIH9V9NYpbrkZOiYZHQRCnoRHpWepvrNsAL8TzcmC2foTH9EwoJhANyhjMn9fF2kGDHNw8/Jo9eID9JVf4+8s0g98A3KMVXHped0z6d4WOPkpP2kySs0Ba47+ufJub91RwBeyak8gAm4e1FFb6R93UKNxvmcAJrvQOu1vBdDC1FAVOw1zwbIfYJtpHl8k0j0AMcAw8nRVg4bpL8I5Q/laC7YB0yZpumVcedmAvfg9BcGL0jxjs2cVeFrGwW7DWyR5ccdS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 06:39:31.2254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9917720d-e115-4404-dddb-08de83eff1fc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6643
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_233937_349128_D1EB4E9F 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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

Enable the J721E PCIe endpoint driver used by TI's J721E, J7200, J721S2,
J722S, J742S2, J784S4, AM64, AM68, and AM69 SoCs.

Enable the Keystone PCIe driver for host and endpoint mode used by TI's
AM65 SoC.

Signed-off-by: Aksh Garg <a-garg7@ti.com>
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Changes from v1 to v2:
- Squashed the individial patches [1] and [2].

[1] - https://lore.kernel.org/all/20260223104609.876613-1-a-garg7@ti.com/
[2] - https://lore.kernel.org/all/20260223104650.876632-1-a-garg7@ti.com/

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..81bc9882afee 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -229,6 +229,8 @@ CONFIG_PCIE_BRCMSTB=m
 CONFIG_PCI_HOST_THUNDER_PEM=y
 CONFIG_PCI_HOST_THUNDER_ECAM=y
 CONFIG_PCI_HOST_GENERIC=y
+CONFIG_PCI_KEYSTONE_HOST=m
+CONFIG_PCI_KEYSTONE_EP=m
 CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
@@ -241,6 +243,7 @@ CONFIG_PCIE_XILINX_DMA_PL=y
 CONFIG_PCIE_XILINX_NWL=y
 CONFIG_PCIE_XILINX_CPM=y
 CONFIG_PCI_J721E_HOST=m
+CONFIG_PCI_J721E_EP=m
 CONFIG_PCI_IMX6_HOST=y
 CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_HISI=y
-- 
2.34.1


