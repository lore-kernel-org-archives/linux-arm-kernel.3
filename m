Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAE5D232FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LhoFIfH1gbUMmpo6grf1CV7i3k84OZ+MDi6LIKparJU=; b=FAXyUsPvf340Sr
	QFtp3vxPRWQ+S9hcMcKmwHkGm/kE5EMruqvrSaBz7kurP++5YGQKJ+ybkyYi+y9j0zv94zKQIofKJ
	MVGmtlbIvhGB/UkKHCA9GYs7uNAlmwJqTBpnXG22oplo0XHAT7O6BdTrdTfPheFMo56XqxgGMOCt9
	whFznnwZ1vsAhJjNLHBX40wkFGUTt8tSOBf8KjkeMQwwbUx0QdgzjWkIMlIWtbyM2zCgPxAyuFxxc
	l9fQIk3mRy5P46ddMSYDlcpZjyu6eO+CxhaLs3GV2frsrN9ir2b69SR0xpvjO/jY5eV0T479KOyXC
	cuqGDvfGUvnNMhqZR6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8hr-00000001zrr-01E6;
	Fri, 09 Jan 2026 09:22:55 +0000
Received: from mail-westeuropeazon11011044.outbound.protection.outlook.com ([52.101.70.44] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8ho-00000001zr8-24pn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:22:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWY5gbV/Q0u/dM1TBLEvftyN6aNXnO8eWP1+yPMOAzMg4gfW51WTroa7qV45FXjhdcGtJlEG9AK32pVqvvU9+aAm35nMj7N9OxSZV6QWddDzdUSqAu6RVAKa7bUPlFEFIVJEev7kQTnQRIqMvcz27vM4Q1g1lYXtL97RyqJjaoDJouLUqhixnecUYUV2wMLxTmhH53dMKCpw6DivFqzxAozNrPq6puPQOCJBwKXCSo9qBPe7D+mXx4n+MyrCPTCs4CAlaKdtIuXCZqAQ5YPs4WJSqNOXLMHiXvmk6lXPIX2nB8LfMOcqDK+ynzqngT3oOXpVD9UQPINP1vFquH5rYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhoFIfH1gbUMmpo6grf1CV7i3k84OZ+MDi6LIKparJU=;
 b=mE28FWjDwM9rEvDXU7lLNl8YziLfd47SlssnwrBQ92W6ZwOWCoTovRqVJYMQvm397TfBhOWPeH3i/kumj6kcISWv0f78KV1U5m18fRZizSjfnWe+JLl0S/n8rKY++q8G9OeDhusnMgW51nf7gAjyxHvwb+kyTI+HZZsuNOKIx9JdgxoxEBpV6FlV/Lwg86STymRtDmWGg0JZPBowLSMu+VPpmyK2fkqCYJiAEGL/U53N6SNsNhqRW8QROgTo989CyPKvgnYoZbpIYW2YdtNEyB8FSCjOtFLOhSov0q0znLVoWEnebOzAeKCTojgFmcm4j7c7A00kBSnCsQr5HKVEOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhoFIfH1gbUMmpo6grf1CV7i3k84OZ+MDi6LIKparJU=;
 b=YC62M1vKuqB2BIAnXNkxH7zFp2acvXVXrn4oMeCB7juw7jze0Gn8gJ5mrdfkfuRYwcreSwke/wkweXyWQpL2OYvSC2yqgoW704rLkgQIMkeeWBnabKzPedJsw8K9y4qNIEtvzaEGW++1ClKefspk69MjCS9xGyKCwo0J39QbU6Te4/OnycAG9y//azD7wgxC59JNRpzwEnwX0m99QfB0ojECShSE7qJK+KgLHRi54vxtfB+sUYcZR6psTrnIeDtO7izh3frqCOJFgoLaik84k6qA7eldPMCbmbm3sovoHFihW/mj/JCR7/95vPNU0ZGb2ksekSAy8m5t7hGW5PLXHQ==
Received: from DB3PR06CA0030.eurprd06.prod.outlook.com (2603:10a6:8:1::43) by
 VI0PR10MB9154.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:232::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 09:22:47 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::97) by DB3PR06CA0030.outlook.office365.com
 (2603:10a6:8:1::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 09:22:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 09:22:46 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 10:24:03 +0100
Received: from localhost (10.252.25.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 10:22:46 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v4 0/6] Add boot phase tags for STMicroelectronics boards
Date: Fri, 9 Jan 2026 10:22:44 +0100
Message-ID: <20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOTIYGkC/43NQQrCMBCF4atI1kZmkthGV95DpDTpRLPQlCQti
 vTuRkFQhOLyfzDf3Fmi6Cmx7eLOIo0++XApoZYLZk/t5Ujcd6WZALFGRMGHPuVI7bkZTAi56WP
 oKeZCcCGUBgNGGbSs3PeRnL++7P2h9MmnHOLt9WrE5/qPOiIHDgY3KGWNQHLnQkqrlFc2nNnTH
 cWnpeYsUSxZa+VcVemW4NeSb6sCBD1nyWJZNJtOOWFJd9/WNE0P9TjNilwBAAA=
X-Change-ID: 20251112-upstream_uboot_properties-22480b0b4b1c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.25.201]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|VI0PR10MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: a93a305f-b51d-4474-3f50-08de4f60a70b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXk0dkx2QTVUcW9YZVRjazFHaVU5WWxDSUM0bkw0WmZEVTFNb0tBaDdlNHpv?=
 =?utf-8?B?QWNxbDArWmp4ZE91NXlYTENpM21CdG1nekpmdTJYQ2FSbmNFT3Z3d01YSzF4?=
 =?utf-8?B?TExQYkw0MnY0QytPSnVqR1kzNG51S0VrQnVhbXhsUjBVU1Jycjh2ZWxOYStK?=
 =?utf-8?B?SXREcFJueGE2eG55ZzU3NlBqejk4UTFQdC81RkdrNVRMc01BR25RR1A5NDk5?=
 =?utf-8?B?MFVMVlJDaUhKS2QyOGhWU3laS3B0UFhBbDBGQUY1WnZxa1hTSlZLcnd0VnpO?=
 =?utf-8?B?anF0VEdZVEk0V2hDM1ExdndxaG42RTE2TmFaNU1UK3RHZ2xxVXVUK0VweHVs?=
 =?utf-8?B?empjb3M1bGZ4N2xPclJJbWoyN2VXZkNMWGdsQ0tva3AxOTBmZWV5QXkyYXdL?=
 =?utf-8?B?eGN5dUhiSFJSM0U4bjVmamxQMXhUTzlBYTJ2VDVKdnZDbjhONm5tSXN5cXdR?=
 =?utf-8?B?Q3pzbkx1b3VIWVBwZDRSSWM3M2owWmFSdkxHUjBYUlFRbDBqNHliOWZET3Mx?=
 =?utf-8?B?SlJKV1JBQUc0RWVqRVRYQU1EZVpoSXdqVkJ2b05rcXVGekZIbWtGVEQ2Ky90?=
 =?utf-8?B?eStPcnppMVBzbXZxbDJGbzJha0hVVVZhUUFEYU1VSHFPNXlTQjNiN2dtU0FI?=
 =?utf-8?B?RUY5STZQZnVoUkpFS2hsNGRXTlNkTkZLUDNwU2JuS2lqRkpCR21naVlmMUpv?=
 =?utf-8?B?a3RZbzhvYWJpeXNzRWRRNkEzalcvVDAvUDVtVy9FUnJPTVVlUzRpWmI3eHE4?=
 =?utf-8?B?akpYNFZuakRjRFZXZnAyd2xMWW4zclFzYTJLc290REpIdDFSZ21ZdUNOM09r?=
 =?utf-8?B?WTZlZmtBb01ab1V0ZjkwREV5bXcwVDZ6TU5rK1VTS2VwZFhqbVcwUEx2eVYz?=
 =?utf-8?B?NmNwa3VIZjkvUEVIMnVSM0ZIaEtxd1Z5c1NCM2h3MUlrRTJUWDJQMktDeEJq?=
 =?utf-8?B?Ym5WMkh3dmNvaVlIZ3IvcDVRYUpGZmtMSE00ODlWTVc2blpJMnFRUExaT25v?=
 =?utf-8?B?T3JwZk1RL2prMjltNEJReEFZc0hWaGRCRXVDMTZNR2pnMGJNaTljRGZsLy9X?=
 =?utf-8?B?S2JpVUxyUk9ENC9McHdndE8zQURzakN4a1hrbVQrVjB2MTB3OExkOUFiL3Bj?=
 =?utf-8?B?YzBUU1JrdjNlV3Z4Qkxza2FlcFJGT1M1TFg5WHJocWd3eFpodGhGb09HZzN5?=
 =?utf-8?B?Yy9YWUhSVU00OTBxbUVXTlJta25GbVVvVFNITmJ4aU55YWhMNStRUzNhZEsx?=
 =?utf-8?B?MkVFNGg5c0F6N044ZXVPUmxTOUI4TWtiSWcwNlNoa1JaQ0UyTzF3TXhIOWs5?=
 =?utf-8?B?UElkRXgyajE4Q053ajhKdHdpb0pIcnVpb0NJeEhEbTlhNWNFUVpGSGpUSGlP?=
 =?utf-8?B?WXh2eGNrcUJjU05IOURyUHpZRG9CQ0puR3drKzg3MmVLQXZVUjZFR1N2OFgv?=
 =?utf-8?B?WW1HdGxFandDU0FmV21ycFQycDc0NkJKR2lTc29ZR09IdktsbnhsalJJZVk3?=
 =?utf-8?B?cG1DL3JBMUFsM1pMVXNldTlKekxaUm5NaGkrTWR5Ni82bVBicVI1cU8xTUlk?=
 =?utf-8?B?dHBIUWtNeTBwOWUvRUY0ZW9xbVc3cm1yZnNKYjd4KzZ1RWs3Wlg2U3Y3dm1q?=
 =?utf-8?B?NEhOcGNGMXo4ZFI0MmcxMXMyZG1PNmJVa3JkaTExL0IrV1JIM1pnWWdVUWll?=
 =?utf-8?B?ZnFZRWt4NExvdWNQSGd3SWNHMGpZdWJPU0tQbStPQTJlQ1BOVmZWSEl0L0J5?=
 =?utf-8?B?cUtFU3Q1VzExZVdpQ21Ec2JuOTBMcUs3SDJvU1d1VmVqVHMyc0xhRkFsaWFN?=
 =?utf-8?B?ZHZqZ0ZLOGxNYTBHVUN3bzNOQUEzd2gxNDR5VlZyOW11WUZldVdEK01PRnFT?=
 =?utf-8?B?Q1NiWUdiQ3ZxbkRqb0FQNEp4dVY2L1E3K2RoTzlBejhZbnRwYlY1SU1BaVRs?=
 =?utf-8?B?Q3hDNUZwVkJEbWI2dmRtWk5jdmlSdE9EQ1ZsZTk5VVVGM3ExV3pXc3hFak5o?=
 =?utf-8?B?VzZETkFlNVlva2JhWkJ2UzJHU01nQ3lITi9vcktvdlBxRzQ3NE5OUm9IUVNn?=
 =?utf-8?B?VkdjcVdSYWd0OXlaeFh0bDRzQkdyVm9yUHN1dUFvR2kyNlIxKzVBQ3F1dnEy?=
 =?utf-8?Q?mZ2euYFYRMHKPR9RbCsQIs0zV?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: kKX+N3aAA2+VeLmdaNZ2U70v3pKjwPsEK3i5Y+KX49e7gwosA8OeFnmFWW4JU0ZTIYWhCNLsBjZNUkZwS1Jhl7+RbPAs5Wu0t4oHrdPziM1njFf+Dg2F3hMNlI5QoOUnwK2lywTthjN+QWDYPGSsOFp0SjZYiWVa9DEQR/upC2tfrOv25uMfs4Qus0uJix09ysqyHWX18fm+cGYFH2fGuvJ7Olmgs1Gm7hPayurF282YAk6fMRK62b0+w4OOwLAI1j2/Akfvp7jWX+x4aj6AMJGaagfvOLDhi6YzY3YLzHM5GNAFCgcV/jBTmvc6dHhuSX1zHma74/V3Aoj5sNsvoWsJEJDzmq1lrmDGaUh793q0rnG2vEyXYlf7FcKGTJfeKYWN3l9AFynczGrxlowC1lKDAHKHiYHoz3SMXKe97+t/Nqx5LpoWDbM3lTaZLby9UXXADOd7hTFb8RucQYuDlqQYjT0HaFT03TffuY0GbsldA3rRzAvF4fnzskC49nl1Hzl9gSnxKuoPk8JccChv+REhtRq5R6+SxenS6XGI8ceOpEFCZnRpKRMpYvbBYLZzpSF+L8lukSii3d6DpqwV9KBwS07zgEhWSgz0zjHhF3id10tKxdnwbAmTPSz1K0SohyHBr6QcAh22LVsxZvATHRDrnIokWE0C8JjUGfpPWXDMf4KrQ1pXa0LeDB0U2Wco
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:22:46.9984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a93a305f-b51d-4474-3f50-08de4f60a70b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_012252_540855_66F2EFD1 
X-CRM114-Status: GOOD (  11.10  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.
    
To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v4:
- Remove useless nodes in stm32mp15-scmi.dtsi
- Link to v3: https://lore.kernel.org/r/20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com

Changes in v3:
- Remove duplicate bootph-all property in ltdc node
- Link to v2: https://lore.kernel.org/r/20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com

Changes in v2:
- Fix 'pinmux' is a required property for arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb
- Add bootph-all property for lvds and ltdc nodes for stm32mp2

---
Patrice Chotard (6):
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics f4 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics f7 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics h7 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp13 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp15 boards
      arm64: dts: st: Add boot phase tags for STMicroelectronics mp2 boards

 arch/arm/boot/dts/st/stm32429i-eval.dts       | 11 +++++
 arch/arm/boot/dts/st/stm32746g-eval.dts       | 10 +++++
 arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi     | 12 ++++++
 arch/arm/boot/dts/st/stm32f429-disco.dts      | 11 +++++
 arch/arm/boot/dts/st/stm32f429.dtsi           |  9 ++++
 arch/arm/boot/dts/st/stm32f469-disco.dts      | 12 ++++++
 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi     | 11 +++++
 arch/arm/boot/dts/st/stm32f746-disco.dts      | 12 ++++++
 arch/arm/boot/dts/st/stm32f746.dtsi           |  5 +++
 arch/arm/boot/dts/st/stm32f769-disco.dts      | 12 ++++++
 arch/arm/boot/dts/st/stm32h743.dtsi           | 19 +++++++++
 arch/arm/boot/dts/st/stm32mp131.dtsi          | 21 ++++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts       | 11 +++++
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi      |  2 +
 arch/arm/boot/dts/st/stm32mp151.dtsi          | 29 +++++++++++++
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 14 +++++++
 arch/arm/boot/dts/st/stm32mp157a-dk1.dts      | 43 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts      | 43 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 14 +++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts      | 60 +++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 25 +++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts      | 36 ++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp211.dtsi        |  7 ++++
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts     |  1 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi        | 22 ++++++++++
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts     | 11 +++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 25 +++++++++++
 arch/arm64/boot/dts/st/stm32mp255.dtsi        |  3 +-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 11 +++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 11 +++++
 30 files changed, 512 insertions(+), 1 deletion(-)
---
base-commit: 53c18dc078bb6d9e9dfe2cc0671ab78588c44723
change-id: 20251112-upstream_uboot_properties-22480b0b4b1c

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


