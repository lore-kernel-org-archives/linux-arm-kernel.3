Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87E5CD8C8D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EQHNuXFbDFkzHOA5dwySgO4GQ/sTkkYsujIwbrJMSM=; b=ju/GT80hS4epEHVyYhyzhMBM76
	ce2u6HkhvvcqW/Bbzqf5abhekxOvqNbmPdjCgf8DPsyM2izcAWLirNq2PQ/QtdTXcJOmPZM5f09gL
	BG3HyvIc2nXXJcKDLDNOJ2Xdouy2tr0jTeMpy/FZDNAYdG0D4czyzI9W0NIf2vaatkCq+18fLK+Ew
	iuL/Shydu+9FbuRuu6v59woU17XAOYlzdqzaLy6NmaeS2XbCXZcVksshdeWfoeGamidR0nILu/Huw
	nh9FB3c9VrZPi1KoycjFHxDLDjdMNMlhoSTFxskr/1xl89Gvbivk8Ux+BfuNAXUYmukClkCyA9gLY
	fEVB9FlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ27-0000000Afhd-3RaQ;
	Thu, 13 Nov 2025 15:14:47 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ1f-0000000AfH1-2zl2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 15:14:21 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADF4N3m4135664;
	Thu, 13 Nov 2025 16:14:07 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010015.outbound.protection.outlook.com [52.101.69.15])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4acq20p6d6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Nov 2025 16:14:07 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GG/wjnfcBJlWC9wUC9UwhqpcIDoR93DwBDS1GXXn/2l5gujM2Y0QmES3o+jVZILj78WmPyEZzwuSYKRq3yvDGMYpP8mkGmUaiAuOyPJr+MwQrCkB7t8GrlS8KEM9aZbv1XX9puqo9fIBPJG6qVyWcmoc0mlq1MwxFNL1ad//EcNa1vP5qUl0CdZWULWfAHsDDAJka3TxE98EbbtPOV+ppkPZVMQwFk55B9kY4PvXqDWRwWue9bE96ZcUKDCTnbl5oWe+B3LXuTR/TJz6rsHw3SsYncH8HNG9Pf6bYVf4LcjJPbfJKAPgxCpeeEl2zp7LeNQBmt8Vpd0Rocv3xZCraQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EQHNuXFbDFkzHOA5dwySgO4GQ/sTkkYsujIwbrJMSM=;
 b=UmppcX0jANw6i8upXVw7WckvGsn+CHKnfFDk1Pb1SPX/3jweFuLZ4e3hqQkT3BAHcaWcNHg9adGi8wDpjHWPotSWz8h8gS4tOTKv9WJJgYj5w+m4PwHoAPGnaTThPkyRpa3ecA4+hdE0LUUX7EZEJC1rA9KwW9Po4RIioxY/fG6yPEqnNDRnhinNk4wjqIkj3dXjtNKSovbOyr25zDOwQoBmrQjPFuKZ+UIQzxHJgsTPduSS6ChPfEk/MNLcjBG1UiMEy+cll0RlMvT2N1U8GaqO9cS+wQGmDhvihFuRy/EfZ/X45ojZlHRR38f4RnX8FKTJOmWAGOQnj+nDyE6wWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EQHNuXFbDFkzHOA5dwySgO4GQ/sTkkYsujIwbrJMSM=;
 b=ESg4uRMJ6DlOJfPook9N0EDTuamROVhAKFMNoZZ6mKH6+qV5KAhqVLWwtXDzNsqSC2R9t0kIlme+4iJLk+Bl4WhgCxD7FecoYLXDokYrjEG0gfRIvC8GFJe3xqrMzwBrNF1tNL7/Q08FcGz/NeOB1Q75Qy2TawnLUu/0pW9a6/yDH44QZW2lRxgguh3Buh48fZ7JwdISmEVfPSTZmjaJIywIHskz//JeKlZ73Eb75QlBnHFjSnYu5929Q6ExX88i1uVXS29AVpLgeA6NGaFpTuSRf7FlgCiKVKtfxAoZvuto6kPnvwmbxjQlfn9lT34zGXrK97XzN8/FUu5kPDQKPA==
Received: from AM8P190CA0004.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::9)
 by DB3PR10MB6762.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:43b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.15; Thu, 13 Nov
 2025 15:14:04 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::9f) by AM8P190CA0004.outlook.office365.com
 (2603:10a6:20b:219::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Thu,
 13 Nov 2025 15:13:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 15:14:04 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 16:14:15 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 16:14:03 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 13 Nov 2025 16:14:03 +0100
Subject: [PATCH v2 12/16] ARM: dts: stm32: Add red LED for stm32mp157c-ed1
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251113-upstream_update_led_nodes-v2-12-45090db9e2e5@foss.st.com>
References: <20251113-upstream_update_led_nodes-v2-0-45090db9e2e5@foss.st.com>
In-Reply-To: <20251113-upstream_update_led_nodes-v2-0-45090db9e2e5@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B3:EE_|DB3PR10MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: fb12c611-fceb-4ff9-3029-08de22c748ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXI3cGo4Z1l1YkhuZHJ3OWpPZCs2ZXQ2bExOY1dqbnd4NHd1UnlVK1dxZ2x3?=
 =?utf-8?B?T1hHR1M5VkF2QVVWV2RqS1JkQmZrdmhVTkxvTjkrOWI0bENHWXc2RXJZam4r?=
 =?utf-8?B?cC9sR2w2R0pNZVpuaWsxLzBNcnlmVjdXUlNHWnZqSmVOZ0JESWNjWTJmdzUy?=
 =?utf-8?B?aTNwS0h2Sm1qZEFQOUdaZVcwdXMyajFmOWlDay96MVJFNEVoQ3FHYTFlY1lm?=
 =?utf-8?B?dWJUQjlkVGw4VzhmTXNRVlBxbWpEdm5mRHpMcEV1RE5FTVQ3SjY1aStTaVp4?=
 =?utf-8?B?RjQ5YUU5NEEwWTVtNFpwbjU1OGc0T000ckJKaTA2aElaM3BWTHY2YnpLUXZO?=
 =?utf-8?B?c3o3NWZ5UElpWTY4b0pVMExLa1FYdW5VMks0T0xMamhQYlpjVkZHakkzVkJW?=
 =?utf-8?B?MXh4Ym9PVVpkOFBvZWZyV2tvRVhKZmVLdCtNaWNHVTU2bjNQRG1iTEhBWkNC?=
 =?utf-8?B?RTd6NWJOWHVPVEtsTXBhRXNqYUpIbjhjTnBaODRjRkVBR01UaWlGeTFtbzd3?=
 =?utf-8?B?aFBFYmhBdFFRcUJ6QmdOZkxUeHVBWVM2VXdUZ2dkZEdBT203NTBXMXFCeisv?=
 =?utf-8?B?TkhlVVE4SmdIb2c1UVlnNDRSSFlFN0l0TTdTSmRxcVdRU25hemROdjdUdzdp?=
 =?utf-8?B?VWRnSFBpTFo4TkZ6UWFZeDZrOGhlWXJPQUFUYUNuRGk0eHIwdTlDejBzaTNp?=
 =?utf-8?B?ZkdDSjRYcW1leERWMnhPbFpVa25yWG83ZWpKNm13YXp2aFp2d3NkTyswdm9R?=
 =?utf-8?B?a2FZSEc0YTFaZndmQ1NESHFkRnlvR0wrdmVadmJlSjl0WEtMeUcvMnVoZGxY?=
 =?utf-8?B?dm1iclFHNE5WTnZJZUhIa2NuOVZtL0srWWJ3anB3VG9Rc3RjY0tYRXhLRG9j?=
 =?utf-8?B?cVp2SWJ1cFhjeEc3ZHRyRytkYXQ3R0xMclNGL0c4eTVXRWhwSGd6bEZtdExR?=
 =?utf-8?B?cUl2NHBWbzQzdWx5ckZnZFRRendYaUFBZ2UvTmI5TlIyeldQSG9XRWFTT0lN?=
 =?utf-8?B?VzlGL3lJUEZFTFRVWjY4UWJacC9OZ2VadGJCM3pIY3V3SWJlM0UyRVNsTng3?=
 =?utf-8?B?UDJYRkpZSmkyTFFtcm56VkJoVTR4ZVRrOXhHUzNkekJtaUhYeCtGRjVtbEZa?=
 =?utf-8?B?UXQvdDZxYjRWTHlkaThoWHFUWENRdm1mdzR0blJuTjBYcHQyVFB0cTBpSzRM?=
 =?utf-8?B?VnhkSE9BVFFGTXZKSGFiTVZ0aWhMcDdpNW8wT1l0SGNieDhVR2V1QXFudTlL?=
 =?utf-8?B?T1FzUHdiMENUSldzNTlQR1c1K211MStaN3YycnFkaDZUUDNHb3NCSHJNVlBG?=
 =?utf-8?B?SXdFdUxrMWg1Z1h0QkZwbndCUkVMa1oreUY1bkh3c3dQaEw5bk1OdTdqOE1i?=
 =?utf-8?B?LzFWYlNwb2pRUDBiQjRHWXJ2QUdiMzhCOXNNY1FySVlkVmVKOGlxN0ZDZ2g0?=
 =?utf-8?B?U2h0QnA2QUlwMzhPd3NzMjM4bE85eU1KRlNFWHhibmxkY1dEUXVNS2orU2hQ?=
 =?utf-8?B?cW04UzN3Y1Nhc2kzSjFsZ1dHUHp1LzBUdVo1Rm1JL1lhRStadUVOeERoRm9r?=
 =?utf-8?B?WHlpbU1xZXFBL0hoUmxaU25VTXYzN2lYODZ2Q3Z4YmRqcThidlFxN0VmQ0RK?=
 =?utf-8?B?UmpMRGVQQ2podjJDY0w4TG02RjU2Mko4MWxPRHQwWTJhbnQrZkdtZlk2VUx0?=
 =?utf-8?B?MVMvNG5Kc0kwTTlLOXZFZEhNOXFRTU1hakhjYmVENnAzSXlUUzcyTEhqL1dr?=
 =?utf-8?B?NEJiVTNWdTM0VHBOb3gxdHBKSkdtcjJEbjZUTExRVkxEV1BDU1BLVW16ZE1C?=
 =?utf-8?B?a1lkdjZCcnJobDFBR2w1bGRYQit5MWR1ZHA2MDA4MWpxVXhIaU5uK2dJRkJt?=
 =?utf-8?B?bFhIK1I3N05IcHgzbFZJM1lvdFI1cFp5UXRUQ2lQMGJCeUMweFMyb3REbTc4?=
 =?utf-8?B?OFl3ZGQ3K1h3QW1FOTM2alBGbDFUQ1d0VVRIOEF0TmhKRENNWFN1N2FJa2lF?=
 =?utf-8?B?Mk1HK3lOQTZTVUwyUUh2SXVYS0Y5Wmc3dXVjVG1SdEd6TGxGdlRqSFFoNGhE?=
 =?utf-8?B?cjZVU1dwdXFNUzJrRkh2SmdvOVlheW5jMThQRTJrd1RhOXRQL2JvaGJoTkVn?=
 =?utf-8?Q?FmmA=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 15:14:04.5480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb12c611-fceb-4ff9-3029-08de22c748ad
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6762
X-Proofpoint-GUID: 4eCvnZ25sMccDXMP91SOcd9qNs8qCy_3
X-Authority-Analysis: v=2.4 cv=LaQxKzfi c=1 sm=1 tr=0 ts=6915f5bf cx=c_pps
 a=4bRfXiRxk+dAoOwDcXsd8w==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=zIsizn63LtRJFoyuEFEA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 4eCvnZ25sMccDXMP91SOcd9qNs8qCy_3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDExNyBTYWx0ZWRfX3edrDyDbIO4q
 +f45EDT9Cw4ABBu+73wlOQgZ2JEiuQ2xlsbwilW6zIBt+GgwmAut+83BkaUuq9ZJ80ckYaJ2b0x
 DhHXu7rFFCk6IV9o5nnx0PekvT0xuD0rwNGgk0KTTQ1QJ6M7s0GdydwecbfxFd9XS28VXrH6XrO
 3RKXbmKgxtujgOFQ16ejpB8I8J1tSkoAEBErlHcju3HhusV4gB2sHPpUe8+IMOR5yW/vA/MQGvV
 dQyCIN46VEXOPL0phg4EeGaOfMOrbTp3AVdq0lZn/DQ/hl0Edkzz9xtHYZo6MuYAn+/DA+quyUI
 4ZIlq05aQ8XwNXT/wKgoQ6rBbSo6jXj1wAMR6qAKHvDeayHSoZ4mjRQ9riacoBcoV26GnIL43H2
 xsocXi6PMpn/ulir8el45Vd8dVyjwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_071420_064227_61EDDBC2 
X-CRM114-Status: UNSURE (   9.52  )
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

Add led-red node for stm32mp157c-ed1.
This LED is used as status LED in U-Boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index f6c478dbd041..6a1c4e5d31a4 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -81,6 +81,12 @@ led-blue {
 			function = LED_FUNCTION_HEARTBEAT;
 			color = <LED_COLOR_ID_BLUE>;
 		};
+
+		led-red {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
+		};
 	};
 
 	sd_switch: regulator-sd_switch {

-- 
2.43.0


