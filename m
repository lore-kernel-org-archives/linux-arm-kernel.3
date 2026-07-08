Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24759C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 20:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iiZ3vw76mr9Qzkg9blLcm0xTQdtj3cqoTspaTV3kSiw=; b=Mq+Et4FVL+XNDPl4T4DPvoQuIZ
	L32AokLc0bHbF3BhwV1uC+WM9ccf0IcIx5qbuVdsi3iKIcZrj2XDenQa0gr+Q+LoRqzZnjtMQvnLh
	g/RtlalqWJFa6/CEt/Hoo8SK+N2/xqCA62JLpPX6w30+9u5ogGj22A4Hcu8lPC+x/rhtVszX7mH9B
	Ib0Mbbp+2p0zd88bN69OR8lGMC3LXEIBP7TBmCzn+pRseJkQnlV4/N3K65pd/YTb+y/atWUaUCwi4
	iiAMH/91I88Lj1VQti9ZdWg3sUBiLO1ECnB9YrvQ46pITG+EEtW+XeBU2ANCW4NlHhnVvGTA+etrZ
	Hkxpqqwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYS2-00000000JIW-3Hr2;
	Wed, 08 Jul 2026 20:00:58 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYS0-00000000JHp-29J2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 20:00:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYkD2DCj87HAw9/oXiWkMVQaxb3Njh6xdni0+IlaY93/XOG7ZKewXn0dJOMvONnlrdybyhkFA+HO6puAbzkUZSL73pXtZ7mlH65usxamdTipcsjNa+9y/e7sENzHv76Zm4rFajq1DwvexZHlz6gaeSmBJyvxP/2Eg+uy6EIQ03PX+l4khCOIj1YAem4zJ3Z/NSmdDeGNeefWEgnr6sFPYeQF4jQmLDHinWY9R6g+wAhfAqOrherNlV2gwm70RExf0855YfZhV28JDqqcKRE6EPSbbYJ9Y+jcnc+roDaPGEWOFPhgCAc80jGHF0Ty30hgQ46F8nWZuIbtLYbG+pfcew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiZ3vw76mr9Qzkg9blLcm0xTQdtj3cqoTspaTV3kSiw=;
 b=fy4nkW8P7p3t+52pRM5xRKDMudCN1RvYVRPeOQiuzNN0QuUbKY6t7jmTa2zvx8X1ciWi5LhYvdcIxRkK9AT0+wvqujDtjZoimAp7VGhpk6ACiQ8qPBuQqS2WKwmcrUUgCoVePS0NQvyTRp4ijOffOWcGkHIgdqEc4FxV5pYqCQuGmidDA6ks1hmBiP3TMOXD73CUpZ9k+nVp2+BQNoPkJr5mM7mVDb0pqQKSZx9tYrJw5r9wq8TzGtLQ1XiJjihkuIfq3n9T5PcQlj//38rmhzJIduy8NNE0ho3azYZr+kRbpCwH6OEuMVz4xbx72n4CoeDkNIcE2SmAp2A2r/qCjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiZ3vw76mr9Qzkg9blLcm0xTQdtj3cqoTspaTV3kSiw=;
 b=JkuEiFBcbhlUi9236NcYWQzp0q7jGuWrad1v/346PTgN60GhS1oS7DjMrbVjBOuLg8ZVclhQY3EwPkP0WV3pnYDT9y0htTWZLLHEjTJGpF5ERqGCaR4fLeCrtONb8cpDcKPtituSSbbBVK2Uc74heSdTpD7s4cjaTLoUlnylBNT1daAo0aSqExKDjuDV3xfpmdqHiUfxveMx4YASQDpbz/e7Dbj3Hj8sSdieN9J1MlqmDSNm3Oa48CAksSbd4A9RNq1fPdLCAJGaA/2zUDYixUvyMu1BNgoq6Qakl5V9rxyw0+sQ95PgtxZPpSNHFf6IsN58sOJLYSgHzv5tMi0a1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9966.eurprd04.prod.outlook.com (2603:10a6:10:4d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 20:00:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:00:50 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH 0/2] ARM: dts: imx: clean up fsl,emi-bus related CHECK_DTBS
 warnings
Date: Wed, 08 Jul 2026 16:00:43 -0400
Message-Id: <20260708-imx53-eim-v1-0-913b4559e5b5@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGusTmoC/yXM0QpAMBSA4VfRubY6aJu8ilwwB0cZbWgl7264/
 Orvv8CTY/JQJRc4OtnzaiOyNAEztXYkwX005Jgr1FgKXoIsBPEikJQuWyn7QhuI/eZo4PC96ua
 3P7qZzP4O4L4f5rVgPG0AAAA=
X-Change-ID: 20260708-imx53-eim-0e678a55d37c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783540845; l=663;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=vHiILUHjNDGnPf7fW3Rzr9w3w5FaUiNcHYvlrqCij6o=;
 b=J3ecolbvfey8yNpe9ZXdyMZT0i1Plco0rDK59FfIDjl6Uvq70F/j88H7rdNtQQaTIrlXuGv6p
 W23PDaa7aLCDnsc+Q1V2mwRnKZgn++CtNLyb6dxBS33a1GV8IujleOv
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P221CA0037.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9966:EE_
X-MS-Office365-Filtering-Correlation-Id: aa124674-ec4f-474b-1a8f-08dedd2b9b76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|19092799006|376014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: L19ZOQAwuvpT0gDOelYJNBjeO1E5IRVuwhZzmvFbSFsYgnKGHMCH5Tq7N+WbPj1lt04U5vanIY7ZM3N26Zqm5HzbeFY58qv7TzVIPOLXx970lBVroSgchuCu/qcKMCmrL+0FKRMc4a+u/lSMGucT9GM5+8taxaCswtIB3sSGXmNWLcdfW45ubLjtM0SjIo81s4fmvdMvGqX0gdU069HqwG2yN9FpEK0EMAdecL95tJwtFsXh9X2PI2aJHdOxbg7nLk5RfTC7zJOWBl5A5ZjFkZGoT9gI8oMA4KhacXhmQnHgTWcZCIWRaoeoaXPYCaaEiPX1/tGCZnp+eiwY42TpD+f8CiZIHGbSZ9ZFtLeGQPqjyChhfws7pQ2FUzaYaswp3Nt2UYYQ1/NVluIEmgfe8QpPvcyWOBtVL8Y+ZayY4pOGPd9dbvNuG+gMGTh4ItnGw6vUuXO+tVJHK42NcYA/BvUiReEEotBHHhTpz2Z5x0F+qB+k79ThHPFAWd9naKy2jXpEQBhRM32rH2uDRnhFqEquwu2OjLCXi874epjJDtBjxq4h5FohJ9pbcZrtSZX237V4qzhwxPRf3RtgGna4SJ15osfo1Z1X2ZqASQaRcl0mIaMjA+6EFOM+MlLtxM2JIW87Qs5Jro/S/BkBPZ1/LlxNHCU55U984yJbzTwsYUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(19092799006)(376014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RERqQXc4eEtCZWxvMVJUQVpWQXJrcmVkZFdyOXRzTWR0bTVLOUxiRXMybk9B?=
 =?utf-8?B?ZFd2RUZIVUNaaTJmU0lucG9wTEcwV0g1WXdlczE0QTUxd28zcm9QWXJua1lN?=
 =?utf-8?B?QW52Q1I2amxTSWlGbm9RZnN1NXkvYWdyc21IU2xZNy9zbklFZytLQWlJZnpz?=
 =?utf-8?B?M21tY0x6dDNMbURXSjRzV0MraDNZYkZ2ZjNrZ2U4enFKUU80MWhTek8zd0Vl?=
 =?utf-8?B?di9QRW5rTWdCcDRSNUx4ZHA4NE9tMFRJR3czL090dEM5LzJlQi83VHczOXlu?=
 =?utf-8?B?WERPZzdXRWp4VlcwbGZ1Sm9lYkRjczN2SG8rS1R5Nlp5N0d1QzVKVGtmMi9m?=
 =?utf-8?B?SlI1bTVxTVJOeFZwVHJlODhhdjVWWmY0dkUyekFVWG9tcXlaMjRyb3JSelNT?=
 =?utf-8?B?ZFBVczBkUlYxV0xxQTVrN1hJUW9sYUhiNXJWQmpSQkxTbnZ1ek5sT29sTUdR?=
 =?utf-8?B?OGxVYjdGVnZHaGpvWFNXcW03YlVrMU85aHZrWmIwZXJIT1djNHJSMEh4a2JD?=
 =?utf-8?B?NVI2bGZvdk5wdTR3UENzNnU4TFFkRFliRmVDUHdWUFlKNjlUbHNjaGVxRzVh?=
 =?utf-8?B?amZrVnFIWTJPaXlOWjdTV2EycTZXWElpWkwzeklYMzI2ajhRN3lESzhKdEUr?=
 =?utf-8?B?elRpNVd0dGVDeDNPTUhDTG5EV0xPdnlpMDZsYnV0STdHKzEybHFrMkYrRDRa?=
 =?utf-8?B?UFhSQVc4RUo2WFNiR3AweVVFNHBJUTVYRWN1bmpHT0xJYnExQmRBekRxMHJj?=
 =?utf-8?B?bnFublFRY3FFaWJ3YTlpcGtmb0lSdzNUNFRWVGFEcUl0ajFIUGlsdHpvR0Rl?=
 =?utf-8?B?T2JNVHhLdXQ3ZzlOeWIvQXRzaHV0YVd4S3RkdGdUbkFCR0pNRUx0S0pEY0Ir?=
 =?utf-8?B?NXgvdXNIdEM2UDhzUWhpNStKM3JXd0dnVVJFaVRka3Q4aUR2RWlQdUVtRjc5?=
 =?utf-8?B?RmIyMjA0VlY2eDdkaFlJWWlCNkFrMWwycCtqQ0J1MUxzdlZ0dkszTjYrUFFj?=
 =?utf-8?B?NnQ4Q2w5Vk5pZFBKbkJYUjRYRWkrRDgyK0toYjBKeXd6VEZPR0NIMG9HaXlG?=
 =?utf-8?B?ZTNNQW9HekYwV0hkMjdxSit4b0xiSVZqNXFmL3FtMXNtNVpBYkdXV0EyZXBP?=
 =?utf-8?B?TWtuQzdOTE5PdThJVE96YW5ZbHRVdXJUc1Z3SzJBaGNSMWh4VWRNdVRGNmIz?=
 =?utf-8?B?Zm5MZktwVlo3bVRoVDFlbmF4c3JBVjZkOCtjRkJ2cGNlLzY0WkEvQUJ1TitI?=
 =?utf-8?B?dENzeHYrd21pRFhzVVRxZmZndUdydHNENld0NnNNWEY3bG5jOGx1bnB6SURZ?=
 =?utf-8?B?Q3Y0S3lZWUVsWXpjNEMvODl6ZHc4cTZpTEwwQzZPaEpzdFpLak96bFFhdkgr?=
 =?utf-8?B?dDJxRFNOb056L1B3ZmtzZHZOWWJkQTlUT0IzRXBsOVZCcUtmUTlvbnJQWWlL?=
 =?utf-8?B?aVlLOEwvNjhZQjZsZFVtazVaeVRKWjQ0Q3RCdzVrOXFKRHUxaTdMWWptaUNP?=
 =?utf-8?B?QnNOU3A2SU1Wa2NRYVRPUS8xMjY0aUhaQ0ZHZjFNNGJaK0llUFd0MElPUEFV?=
 =?utf-8?B?Y2pKa3ptSi9LaURqZ2F1M2hNT2xnY1BaVkRLSjJjRGZLcHB0NVRlUkprcTlQ?=
 =?utf-8?B?MmFwMGZPay9JV3JnM0Y4K29PNlRyaGpnR2ZveWJJMzczSTZzdml4ZmEyUUVY?=
 =?utf-8?B?cE1PeFhsQWxyYzNZNWZFZHdjeFVQcDBNK2F6NDV3Yjk4V0o0YnhmRDVDZXVU?=
 =?utf-8?B?RWcwZXNLcTJsS0J2NmJUemU5Y2tCNk41cjBOWDAzdFFhL3U5VVhHRzYwdlRt?=
 =?utf-8?B?aFJOYmhXVUpmYlI5Y0RPMm5zTEl0LzN0NCtPdEVTcnduaW5EbGUvMTNndWc3?=
 =?utf-8?B?dXVqMXlJNmhPSXc1SVdTdHBtdUNOdDNMdzJSK2lidXk1ODhxdTFZalJpY2N4?=
 =?utf-8?B?b2tLV1ZMMWFlWHJjY1RiTzZlVVNzMndFS1hTbmZ2Mlg4UTlyWjZ3ZkxZWXZz?=
 =?utf-8?B?Wjk2NVpiRlNMRVZ0UnRuMHVmMTl6V25VYnZtdFg4bVg3bVFQcXY3ZCt5Ty9t?=
 =?utf-8?B?OGtxKy9PTGZ6aHpOVFdCSldFUTFJQUExVEE1YlZmL01NNWNiS3lOR2I4aWVC?=
 =?utf-8?B?MHV0VzZ6U2tWdWNDRHk2c01iVjBadGNrb3Fwa3VUM1V1RGJOR2pOTWxmcXk1?=
 =?utf-8?B?Y3VHdkN4RXd4ODJnSDdSVFppSVJBTmt0ZGdCaHdJUC9yY2h6RTZtL0RtbjlM?=
 =?utf-8?B?Z295V1FubEZ3SnVIWVlaV3dqdG9tdUUwOHpMcmx2RTBzeklINys4US82UXdn?=
 =?utf-8?B?cWFWYlI0ajFtcGJFNkYzUkR4bUd1RURoV0ZYTGlMcGpmRDhHVURGeUNNbng1?=
 =?utf-8?Q?aUAsHjCWonKkNLKjmvBEtHRuCx37BAlwUh1Xz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa124674-ec4f-474b-1a8f-08dedd2b9b76
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:00:50.2706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yi/8r2HA4r/bbSbNUtD50wV3J9+VlOs+iZfF4CS3GAn23sZrmNhisRXIxmWpinI8Sw7gwwxEK4nIeiRpaLW8b+SJoaMv+EnSOcUWjSVMuIvyHEonhv4f196nHUofgHbh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_130056_556780_EEA95642 
X-CRM114-Status: UNSURE (   8.68  )
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

i.MX2 use fsl,emi-bus. i.MX5 use fsl,eim-bus. Since it is very very old
chips. Just leave compatible string as it and allow two kinds name.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (2):
      dt-bindings: soc: imx: Add fsl,eim-bus
      ARM: dts: imx53-ard: change node name eim-cs1 to eim-cs1-bus

 Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml | 4 +++-
 arch/arm/boot/dts/nxp/imx/imx53-ard.dts                 | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)
---
base-commit: 00160c4761ba4e846e6abc8fb9dfd90a88dc94e6
change-id: 20260708-imx53-eim-0e678a55d37c

Best regards,
--  
Frank Li <Frank.Li@nxp.com>


