Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90C1CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 07:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LC2nDHKB6IalilFbVlVhaEQyAgioaKUdgu1i2CyQeCg=; b=cNBtZ+sOZCIbq0+FXWLfLtzme1
	L0weliowBlBVNPPEj55cFl9xKhz4t9834ZNcpS3bl5B4faQRYGLC6h5QVzFE1NtHYsD9D0NAXKx6l
	hWbnjK/coBFHk1rJ+aEf/nVQ9G4QIRRRQu4iih/LhClk3Y5g4StgUUYjMM1CHyMIAzxAzv2Th4ssc
	urC1T0fNV+d/F43PTcksJKfp5qZmJPIe5SQrIG2OriEpUlMNpf8bl7mA0UQrBvSoLpTIPPwgHi0Z8
	lIFg8cm9oRUALJjBbbnkFU6Pu0PC3NhiAdLAnEI+ZOYRMR08h4acQ3xA1EX/6ACKGLrdGtnUgk/Qq
	OWlOUX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjah-00000005X6B-2zwK;
	Fri, 31 Oct 2025 07:30:31 +0000
Received: from mail-japaneastazon11022101.outbound.protection.outlook.com ([52.101.126.101] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjaW-00000005X33-4AVW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 07:30:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4hPKHM4ecfgwa1yRjEj3aseTpxBF5FM4zUEO+ByNze6WY6qb+LjTnhTn+FBAVdY5wB7LH4u8temllsB834ycF6EzvEmS20aehzrETx/1kf6nPSZRYHkb6LXumxH2JTMKxZbojLLoqoeUsQHKzmdrHLO7pArxUF0rCVK8cFyFaSUnurQ+lPzANfU5kjQR8vprehHcVFkCNi2jzRdbG/Psletb7VSQG3GqEC4jOfcQ7vp300STSb+HPEHlSt3qJlEMRnz/RJ5HjfzWQE0RIVOiIYbAjnNTFCFdTN40q/YsKZU6o4PiJm5Q9F4ti3BavMiZbN6nEY8rgYl40o7OBjNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LC2nDHKB6IalilFbVlVhaEQyAgioaKUdgu1i2CyQeCg=;
 b=YoLge9P3N8isCAXmD8QBkb44NANl7GOJwlTtoUSuYHCYgJzkkp/dfoJ4n20cYrR/uhdXR69GmSTNsthLHni4fhicut1LGNrPd1P/YsjiEAL0tiRrt2Ulk5tK/lt+ztNNcVxpZ07pdjDOVwW7GFRTg/nAZOgIpGPUYe2qb25Ml+4SU7PEO0xjA3V/u/6XYMznUsvh0EdM3esiMaesd7EbZRI5VHDp48U8eQ4/TP5sz/OUoyxQurx0mfntcGtu0UFqj3cSagw9GUOFIayhiuiyANwG7sloEpyrN+NJmSI+FiXIOkiPoxx/TSL6cHYL/uSoAXkGzbOzXG3h3Efh19v2eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=amd.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0059.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2b5::16)
 by TY1PPFDCB6144B3.apcprd06.prod.outlook.com (2603:1096:408::92a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Fri, 31 Oct
 2025 07:30:06 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:400:2b5:cafe::e2) by TYCP286CA0059.outlook.office365.com
 (2603:1096:400:2b5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 07:30:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 07:30:05 +0000
Received: from guoo-System-Product-Name.. (unknown [172.20.64.188])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id DAFFE41C014A;
	Fri, 31 Oct 2025 15:30:03 +0800 (CST)
From: Jun Guo <jun.guo@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux-spi@vger.kernel.org,
	michal.simek@amd.com,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jun Guo <jun.guo@cixtech.com>
Subject: [PATCH v3 1/3] dt-bindings: spi: spi-cadence: update DT binding docs to support cix sky1 SoC
Date: Fri, 31 Oct 2025 15:30:01 +0800
Message-Id: <20251031073003.3289573-2-jun.guo@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031073003.3289573-1-jun.guo@cixtech.com>
References: <20251031073003.3289573-1-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|TY1PPFDCB6144B3:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 74bb56f0-d7f5-4fcd-647e-08de184f4fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hugsqabUrP5Sz1UR7LBPnddsmlyQL29QKVBWaC5+Ylm5aoZDPL8bP4nbdsO2?=
 =?us-ascii?Q?c65tfZHE5eM4E8yLWDlLpwYwZ9ahRYd7TkeagKFV9YC04DAKVyVUYLpYo2Cm?=
 =?us-ascii?Q?VlYNbUEcMNpgClD77tev5Zzao71Fb9Z6wNycH4dmp0ZTZY1miKubgV6u3/BU?=
 =?us-ascii?Q?BUistx30Nh3E1pa4yYWznEDnJeErfWoJcaSgiFWvU6/h+BSVtTcSG3GrWJtF?=
 =?us-ascii?Q?Z5djcP3fEDWwIlPsybnxoQSV0/JiHzsq/NLABYE8401DwQgobxwF3DSWLHn1?=
 =?us-ascii?Q?EJ3omOImLxDh4N+zB+5viDE8fcvl4yYup624f3XWk5wTvrvS2F75gRPHtjnx?=
 =?us-ascii?Q?abYDhTVcDi1oNS7g6dQO5NXN5EUYYsCcnol/YJKkxrc+arpfHnmD8aIJWUFN?=
 =?us-ascii?Q?9Rxfv5TTf3qLP28/Z30nqKguZRYZrL2sSndSixhVOnKbok4YhN/nJRVwysPk?=
 =?us-ascii?Q?EHtu4mSFDpTVBIHEDe+j+LYF23lTaOdXoIkA+NXoxjPVa5kdg2g0wIz02zIQ?=
 =?us-ascii?Q?rZgwzMP4V7p2uznRpL0sbwb5IEYma8cjumKiS4i1bcPZXVY9ilAUaKPxDlqh?=
 =?us-ascii?Q?fgd2SNf3zDujpPdpRWm/rBGC9wz2EV/LADb7U6LEPiuHNPPCxwTpzE7RBS8U?=
 =?us-ascii?Q?xkSOadVJ0Zr377iOwR0ksfU7WjRyjN1pKyvIKyTB8ME0Je5bKqh3kzYadZvA?=
 =?us-ascii?Q?PZtTPbcZ8A9JhuzsTcMYEcSC+0sn7B77z9IfMjGKnTg128P387Q5BibDoODt?=
 =?us-ascii?Q?E4pPpqRWF/6TOSTrjjZw981G6HPCcbt6sMO+ifpa7IFX42JsHub5RrAdCymX?=
 =?us-ascii?Q?lReMauhnAzRSnlx5Jlv3aTD56Mq0+ZjHPXxTJtkYkyUURVvfkcNon4nDOw48?=
 =?us-ascii?Q?M1QR8xFNSitqTcS9/V6j2JHrffP1+GZkPjP2+DthZjPAsJiPStznvdcvOaMR?=
 =?us-ascii?Q?2AgdawPaMeROS2DAQXqNVY5tP3eMr+ch53E/ZZ+JOnf3rnz3F4z3YfYdW145?=
 =?us-ascii?Q?GGr0xPq45R90F3IlBeGS8dZKP1Pbj1nGRFetR6cPowal0sY/2VDpHu0aD8/I?=
 =?us-ascii?Q?QUuT6Nt4cDQ9Tze2djL9DQA4B8YMoum5RQtOf4Szyg4vJs8eWsjwwzVcVvzM?=
 =?us-ascii?Q?xakk8AaYi/LHsIFGkw0NFs9AawoS1tKYXOLunjD91ZZR9OQo9Vt8C8G6JTeX?=
 =?us-ascii?Q?z+dTBfYmh0l/LQs74gzFhDmUl4dj8Ym+71c3XvNftgWeADTm9CnBlBuDRRdB?=
 =?us-ascii?Q?gaAlbXgFIRUz/5fe/A9yrSz4g/nhJijz8L77ril8q9CrpLyajuKWlzJi4G4u?=
 =?us-ascii?Q?tviEfeWxvu3jHZwMNT/0kDurk95nQ5PibOUHppb/e2cgx96ZLkArBj/StMIX?=
 =?us-ascii?Q?+hYGqa/6smvm6QMcKVID46hcPnomrYw1Q402B9P8yw/argv2gHDpPFK7e29N?=
 =?us-ascii?Q?Gm2zMkvBnqlQpzmeQeBUrSgOX8300tubFhmzWCSjOlXINNAbCOCeqsyICEUy?=
 =?us-ascii?Q?WwrBeFoKP9RuXj+rG+CT8JmN/heVe52Jw6fESnShI8LHuYbhqabpTPtJPeKV?=
 =?us-ascii?Q?pHwzrAMwLlJMPhpPzuE=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 07:30:05.0090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bb56f0-d7f5-4fcd-647e-08de184f4fbb
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFDCB6144B3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_003021_366068_95342F78 
X-CRM114-Status: UNSURE (   8.08  )
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

- Add new compatible strings to the DT binding documents to support
 cix sky1 SoC.

Signed-off-by: Jun Guo <jun.guo@cixtech.com>
---
 Documentation/devicetree/bindings/spi/spi-cadence.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-cadence.yaml b/Documentation/devicetree/bindings/spi/spi-cadence.yaml
index 27414b78d61d..347bed0c4956 100644
--- a/Documentation/devicetree/bindings/spi/spi-cadence.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-cadence.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - xlnx,zynqmp-spi-r1p6
               - xlnx,versal-net-spi-r1p6
+              - cix,sky1-spi-r1p6
           - const: cdns,spi-r1p6
 
   reg:
-- 
2.34.1


