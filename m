Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9E1106FD84
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 06:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WMgt84JaD8lCeZfUIw5wvJWdAdrP1X3wMZKIsNqUIZM=; b=wGi70VblNzfnnHeZbymOvsL43i
	x6TYWYIo5wnYHKEYwWeO7Wcf/cai5+ZLWp1hzwapIkt/dIVTFkG8B9WUe6sJLb/uLqUjN3sxyIBKK
	u7Db+9TMvt3n/UoYweZaZU9qE4BZpdefh9ZYiZ7rx3/1LeoIFP2VBx2uYicngFRgS1iEVe9c4PWyw
	eYdb58UbH2S9vobGwcIKGkiRD3Zq6JYOhS8BNxNE4k0CJkUM4jx8ViCVA7FPZkQmfzy8OoTl1Mx5/
	TnxbersIr1LfPHLnQqhi2fWgWmwDfYFIq+pRiBZXTlIL6eMEYH5zTBomRVJ2WprBYdrHWx34AGlnc
	YTQPvuIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vcI-0000000Gipi-2FyN;
	Fri, 13 Mar 2026 06:03:22 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vcD-0000000GinB-2u46
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 06:03:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avuTTlcLxqpkuLQjwYAwaZZ0XQGNazbesEZFl24XqHlm8EtLWhexVvKDN2m0A5woWgNWmt/rAaNLj8tFrs6xVCaNZrnrgMZqs4T2sbogw+wqtVqDzZ3yc0rOjlDm73h7rGhhzzp47TjPmzsN2g7DHyGnlLTXX+MNS1dFry/jD0xFhno9aMW2HcSYm6rarPml4xvEslMI+NQVrSsqkPVCOl1/y8Fq7r97SlWVmkMX9sdI36JDMX+Fo4SgvvnoPmg/Nq3rg2He4GF461EiZ/C352vpNfAQRBN/r4OhH0e817ZYcLCftxIpYz1g496rKiyG3CfIUe0K5L2GIxWN1rN4IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMgt84JaD8lCeZfUIw5wvJWdAdrP1X3wMZKIsNqUIZM=;
 b=t30q0YLJL/ElBJym/UAyoHAPKNi6TC/Z8DixlxmepNWvdGUbfrSxMGX9Nzy+jJaZM2DUhwQJ2ROxvggTdWVCKNvU0zraiajtri7Udu45NatGTJEnRHCamI5d6+e23VMvRM7Gz35sd9dCJmCKSlmPpptfcWJKRrWqvivfCQhL6usf3TAxSV1e48kUS4XHwPbESMg/frWyq5NeCDP6fVrj+V9d7TqkYybRXjqbf4vAWl2l5s+9FuNEoFjJ1j9zOkmmOJ6AmCSeDxE7hKvKKocuuZDqcoxOIX8YNMBbisQoic/Vo+uS8aka49v9XQbF9XwJ+F0vH6/lVuAhEK4DpOLnvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SL2PR03CA0015.apcprd03.prod.outlook.com (2603:1096:100:55::27)
 by TY0PR06MB5283.apcprd06.prod.outlook.com (2603:1096:400:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 06:03:10 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:100:55:cafe::6) by SL2PR03CA0015.outlook.office365.com
 (2603:1096:100:55::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 06:03:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 06:03:09 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AA6784126F89;
	Fri, 13 Mar 2026 14:03:08 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.chen@cixtech.com
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v3 0/2] Add scmi powerdomain for sky1
Date: Fri, 13 Mar 2026 14:03:06 +0800
Message-ID: <20260313060308.1300518-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|TY0PR06MB5283:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 175c86c6-0e7e-4de5-5582-08de80c63403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|82310400026|36860700016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: YZoJOfwyr4CW75gn7V3DswT7j3lK0M3Nh468EXUUyaxjaa0VZ4xabEu2WigRcTzBTkwnBzQXsT81AHHyTQbQfWAIc4H+z0fvOhs/MTOHYk3x2OBlCzyC2UaDdEbZ2esrvQioSyqNXNz63wLyNw10UN1fDtB08Gh9RKmDsAGsBrsB8qEUUACz1xWvDl1blIQ/N6JzyocHMtuJdAzfk01IO5Yb/R2Aprb4TqpJ1GGmScyG35AbeCr3JmJDc0IiQF1YvmfRnkIqAe55ZTQy6USoMl2brwE4QuIqjJv2+cBTX5cKT8XQDhRDIQA1LQy1FK7bJqtFsBNX0Qi5ClCcYFmM/8YAsP/oMaaksQiICd+3MNwhxNVElpeQmxDS1jrWQVpub0zkIS/C8qExQXdpnkp/sDP3fK2/+xpx9owmZl+rOMFBjZp+wbQbi858xcXcp2PA1I/SgAzdV8czLs+rVKrQrAFNJ8TaN5/Y7rQNI0nQ3kJit5fZzXx29AGFTDY2GO/WCrOpjk0a3XWHSpFjTN8BXfQOz3Cg3hCGUKvTDQQ0d4L/PYLZhT5sO0v0h597bLkOF2l68wmrVt2M6lsuGaQNkOvEPJMvsNnJkXRbRXP1/LaqwdrtZRejdXVFFpziJ5dB8Y/qKhKdEFKKPmMe2yanLSgJ+o46p+TzSKrZpBCVljOAgP3F5NpbWwuAv4/k+xEIOy/j1ku3WoFLuefyG9tHBcz+hvhMpq5wErE4P/c9G4wac3VlVeLBV7OvMbHfZpWua4m4S3cdyzWHzxbacK529Q==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(82310400026)(36860700016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oDFoHJETqctqsiyf3Ht/I4EbCF0SLZAOQJlx2+9p/3ihPDnr52IX+T4bnZYuUaQb86sEepsDKzy8tFFrHz9hPQH4iNoPr1aMr0B50Got1rviOspHFnkOklxpx+zKRorwwFVcA3QPZpdWdAIEw6eKpuydtyiBlP2DROCR86Llj9m4Q0MTlFTQ5svYdAgQj2QCpzWWeKkodphwaAa4P4H4KfkbitY3SiC3qYfIPuj2EtPpODFnzNygdd/o/jbooBeB4Q3tur1Zx7mICNABG74BWdm2dd7OufR3O+s8dBGzqUNiBeRcu1MDuu/9SCVWBPR35rXa1BDxtEiQGXr0LJV83tdX4r92yUyT7NZiomQEr27/GOKmb9O4HzQ4jyQSn9HapnjWdVeTGUiKLnqBCpP7sSbSwSX49/Gi4LpsM106uKmvKv9Hp8QXRVkS3lAo5ggy
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 06:03:09.5293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 175c86c6-0e7e-4de5-5582-08de80c63403
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5283
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_230317_752542_F5E9CCC2 
X-CRM114-Status: UNSURE (   7.14  )
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

v3 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-pcie-host.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- refine dt-bindings

v2 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-pcie-host.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- update dt-bindings

Gary Yang (2):
  dt-bindings: PCI: cix,sky1-pcie-host: Add power-domains
  arm64: dts: cix: Add scmi powerdomain nodes for sky1

 .../bindings/pci/cix,sky1-pcie-host.yaml      |  6 ++++
 arch/arm64/boot/dts/cix/sky1-power.h          | 34 +++++++++++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi             | 21 ++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 arch/arm64/boot/dts/cix/sky1-power.h

-- 
2.49.0


