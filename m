Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C64ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 04:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PJbBvDV+noSKFlIser/JH9z0P+Q4gTCv13gY7hx1Mg=; b=e+gjdYKmZXCpNHVysiUMePM9K0
	KYeKv/H7IgHwq4rGCqVGgyR/eT5WV1WpHLCf3MAhOkU0cIHoy9co1iwYbTjeyL9BFeDb8KWO0FahR
	VHf7ECB+Mncmas3ggTgeit/e/Uojs3Jewv/wQAWMWR+Aow77nKpipvCeyr0luFK4ZB6/P8C30HkpK
	evXUF0xEHohusXTiExRmqIPohw/aCzFm6UCRDyOYLPsK9+51DrhqO4vjPYkXyEvcdgiLNqICdg3+q
	OytCQjnbiPctPvSr3wrTeaSsJ7cMCFP/mKaz98ZSoBCDlusZ1a6yG/RUzYz+7HdsMA8jt2a9f4SbL
	PFiFjymQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwCHl-0000000Bu1K-3OOC;
	Wed, 10 Sep 2025 04:18:21 +0000
Received: from mail-dm6nam11on20605.outbound.protection.outlook.com ([2a01:111:f403:2415::605] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwCHi-0000000Bu0g-3UOX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 04:18:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+YAlsEAgWdrzYbevkdqw8sLTQXSEwfZ8lhwIcSnI3HIkj+sGNHgXtSzjFkY8/KZMWyc5/GfCdHfmrP7K39Peq4VYS5A5LaTOqnW9hvE5pCx4D04b8DiNPDSrK2Pigi8nL+3shSBMpN7xTh0a6TTg+8BdvtvV85QXN+YAszRQV968GJ/1NogCrTVk5SQTH20haFOfcj1kShySaLznaTqFWDquiFIXHpI2bYqa+U0z5EH42MJSREX04bfgv1iTzVQyAWOffCYeY8mEiMXFtj9r9cclFVTkCuHj8ESzk0QHHi7e4GLyVdyYWSq144K1mvacDOB+0qR3X77BnDZmbb2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PJbBvDV+noSKFlIser/JH9z0P+Q4gTCv13gY7hx1Mg=;
 b=jdIS+c1n6BHg+BLsT4e6Il6tcCPLPq4q6548nTPTXlXnxKw1TwsJ5LtAckpYOPFVkg5XUejAkjjw0qQcxE4YbPS6wTYkaWgXQMh3Bl3+vnifDwxjTOc1PnUSqjnbnwmIVkVK2McapXi24QnaA7WImHW8/yENBn+J+eqOXQI5CNgSRiUeh/URfoEtyLfXzRSx+JKIIBio7l0BqIC/GMFkG9IVQ6vGGkKpcWmtNWmDbJSL1Wt7Iy2EI00kr25mNbmAouhm1gwVfA/7+6MLI2prn74qFtszKLI4OozayItKYwsu/Ozoz4HiAzYEKe6NafqEksYcagPoz0CIFiPuNFdq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PJbBvDV+noSKFlIser/JH9z0P+Q4gTCv13gY7hx1Mg=;
 b=iaAIFVRxWtwfZXRs9enRM1l9vZ54G9YjAB0hKorwHV4cgZ1IVF6SPdgt8t1duUyQJinmQk8EtTgrGbGTrRhzuqxNbUC7mzWj2MCfXY8U4NOzqkIlYhoJ/pqhHQt+JsJGJ3FW6w9R0hQzLaGnfwLJljgWnmtuNIPojbT8XkbhZS4dnIDn/GGbUll7PGvHiqxhtoyXYdSHaMMcL5aMTuFR14xnQtmv6G2OY7/wHZfFsGWhWVbYpJjfs3ySbITZLY2G8YubhNw4N1lCeOKXwpC8GsbnxmQzDqyvldOwDY1pQ+0kO78eCSr9j1rz2U/0PIF69U0t285Wu6YQ4NoMUuCYpg==
Received: from PH7P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::34)
 by PH0PR12MB5605.namprd12.prod.outlook.com (2603:10b6:510:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 04:18:09 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::e2) by PH7P220CA0002.outlook.office365.com
 (2603:10b6:510:326::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 04:18:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 04:18:08 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 9 Sep
 2025 21:17:40 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 9 Sep
 2025 21:17:39 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 9 Sep 2025 21:17:39 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<donalds@nvidia.com>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <etanous@nvidia.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/2] dt-bindings: arm: aspeed: Add NVIDIA GB200-UT3.0b  board
Date: Tue, 9 Sep 2025 21:17:35 -0700
Message-ID: <20250910041736.245451-2-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910041736.245451-1-donalds@nvidia.com>
References: <20250910041736.245451-1-donalds@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|PH0PR12MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: aef6040b-446b-4bff-9533-08ddf0210c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r1T4HyoryYM/AZiGq6P5kAL9fDt2BXvgI36+uPMxpcRxOLRQ+MQ/H+TjjDuk?=
 =?us-ascii?Q?LNTcbPHu6WtQ5eWSGoS1mOpqqPNqig26xrn4AZsXxIJtwkgqU5aGYM8eVHOm?=
 =?us-ascii?Q?DW1Rv3XQE0x03ry4a2UWmPEHFd77Xst+sC1KopCQCP7GhzzGI04NQ4qmgAAL?=
 =?us-ascii?Q?ApZN3poXJDyRBW2s4WLPzUMoZeGQH/uUHgXGAr4wnLdT+fZHU4Em506Y2doP?=
 =?us-ascii?Q?zqGZ4L0xWb5xB0bsDEnRIwhCNfoJ0b4zj2l6H2TSgpIkmN+9j16lmQVEj7db?=
 =?us-ascii?Q?wcNeWBd+odPL20NaCPWgU+NnIWn+nYdR4Lkr+s/xPtB1W7DWBJ4Zr8ShvUeH?=
 =?us-ascii?Q?FP/P6JlwBrS08N4xiPkoWHSXmD0GXVquKN5j0xAh28NjPeDe2SEKO42xWMNk?=
 =?us-ascii?Q?uOxTqS9SDkmV5vQ96kA58PKHeHw0VgiFJmq6qL9wUck/6ctbkDXzptPf6Gqh?=
 =?us-ascii?Q?fHOrBzH2zRJSwhnZPaUXXYQqsHggEdYOku2ZFnzCk8GwD55J6nFKahocTqlI?=
 =?us-ascii?Q?4TrcpnkGPrxPzt5zyixoKoVMjH6TClq7uPTTS7oP6T6uxB4v5+sjFuN1Kw9S?=
 =?us-ascii?Q?HoAvVaJjrCnoVA04+LL69zi1tJ3u74EOkcjkWRllctxjefzJonfdXjQ5KPEx?=
 =?us-ascii?Q?rE4Kab+zA7yVkodh/eKNf/xXGLzktaUC7fuIolUo1wHYkolwvm8qUrOTIHaW?=
 =?us-ascii?Q?U14O74Ppr/+e54epMfrykugNnKHwnh2NYCPeYSwZNECXc76LPOt6aYqvlDbZ?=
 =?us-ascii?Q?NkhrtEBIN7H0e8A+QVEOuCF5SegGYQxyfZ7NU+AJAyRjIU+w8bUgN8y+kb1i?=
 =?us-ascii?Q?wBBjQ2ChLS8u6YoCBH6EOr2hd58qc3+i9VvOMlVwRFeziKQ/AbpSgejKFQvC?=
 =?us-ascii?Q?VoydLo5yOHI+8n7Ogl7BxB9bAeS/9u9t+h3dDJmRpJoGsxsdfnERO8tXur7v?=
 =?us-ascii?Q?S/32RzgndYZa+RAEGWz/HpNDxZd+N1pl99WychAvcMprScpjibEUVqYyH4uY?=
 =?us-ascii?Q?DvuTQXzB74dWcRAdxRO1njyKTsWcxfd6/x+hcD2VNkGt0IDgOgoHZQzDVPds?=
 =?us-ascii?Q?4qYuEa6lJ7FmuPQJDPqii0cmoxSQVv+aSGqbXLi9tnN6dbnxhCpGO53uJdPa?=
 =?us-ascii?Q?SrGrZVwpA3iipIHg/UzWZfS0bdElzxqBV5dlCbqSdYlpKcLJU2/lDFH1M7ff?=
 =?us-ascii?Q?8gbyjYsF0TNyL3IKLZp6ThUpR0F3CoYgN2upDktKFkJnMZe68Evu+nEjPHiI?=
 =?us-ascii?Q?IoyDYybiriAaOxw7RHr7X35VY5RqebxNe5JhDNtWWwO3Ix1HjZmY7zbXSfMX?=
 =?us-ascii?Q?pYH2j3NHhwEF/ipVsvk005EK/UPuaYVAOvOl8J5lPj/0zUlyuZhgwaKSbbbZ?=
 =?us-ascii?Q?ecXZG/6+nhC7pKpfOZtqEMlqdu4QxJ/dgKSl1Q4pshDA9kvZThhn2FCa/kLp?=
 =?us-ascii?Q?9NZx2RRnhFQRqh+L+QlVLH4BJik+U0h+bxDogEUPSdlNoejD+/Bg7rL92oPI?=
 =?us-ascii?Q?+W1/DHsewilNDnQeCzKsLup7GXiMu2H1SXSi?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 04:18:08.7997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aef6040b-446b-4bff-9533-08ddf0210c80
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5605
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_211818_872405_1B812D60 
X-CRM114-Status: UNSURE (   8.06  )
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

This is an Aspeed AST2600 based unit testing platform for GB200.
UT3.0b is different than nvidia-gb200nvl-bmc due to networking topology
differences, additional gpio expanders, and voltage regulator gating
some devices.

Reference to Ast2600 SOC [1].
Reference to Blackwell GB200NVL Platform [2].

Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
Signed-off-by: Donald Shannon <donalds@nvidia.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 456dbf7b5ec8..624581db2330 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -99,6 +99,7 @@ properties:
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
+              - nvidia,gb200-ut30b
               - nvidia,gb200nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
-- 
2.43.0


