Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8CBFCB622
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhpopCPKvuwkj6FC9iA/wvM7/RzmN7Zdv6rgKnpBY0M=; b=iZGov+9ttPHiRy+fxmjXHVB2p5
	cBjFdau6GQ9yuZoGVQ2FYocCX54C0DjFp5SE902IIqv/DEG7lCcuA+B2YVu0BhugJrrzRxuueMZ/a
	rM3qX82UnNIx/Psw622vs7jb4qmATnH2hCqj9As9t/HNLmxKKd85BHHGqV73Q0kbsd77EqOAI3ku8
	rvC/+4Wgo/ez6xNEIcG3G5TvO28UQ4jO1DEujLbC4Sk+/uyD/ES+s/t07uiQQb5vTgPKN9EqWGVxW
	M6D5FaBgr6F7NaTwPSggZcxXfVex/vZby787w/OFFuI5bHPBmvXKUeBF78A1iV0cc5AP7jPZRuLyC
	/ExF0nFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXqd-000000048OW-3Keq;
	Fri, 06 Mar 2026 16:16:19 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXqY-000000048Aj-14Xl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 16:16:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8AZZBagiRgEHu0+ZCxMBUWEf9s4MVLc6rAgcE/sbGqN4Z4S6JAoVUsCjYS7b594SYLGHPjGEbPYZ4cjqiuAIkQwaPatYBrcxNi3L7RXJk3TAfsniPI0c6lC2dkjQYdw/DjDL4NqSvEWJNReL80oI1Z0GJwxNSZNPDtElgV0JYNLopmHUo+BLh+nWz1CkZTguk2Qz9HoR8kNV4Z+vVV9EnM3K26KrBvkqnpUUChKtKBror+r+jUDFO3W1+TERMYHyqYfYe92M6qbddWDFbR/6SJxrw88YXMvs4soQqmjqwVdMLFXpXazy4IsTbCmMVUBdFwDwFtGYBPK7eeoL5QUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhpopCPKvuwkj6FC9iA/wvM7/RzmN7Zdv6rgKnpBY0M=;
 b=ShM3bflFnus0j1afK7TMQskZ8GG4Gsw3v17i/vq9QVpaLBpqiHZXPAmqX5ybV4u2HpjxQE5W7kpi8iTrxjjA45jzpHR69k1Pd7P6VjjAiQoM5CExlUCUo/fWgEXErwyksO+lfRXBPfRvRfn21ocqepQvN995PcGn1fcnr2I7MkdydaEJMjFyI6QuozprQExcjm/5I9ohEWAS/qe+C+wKssPCfnRubxQ6La58YDPcI2wCm7Atj95RTcucLrm3vmeM4eEoyghaRcqcsZ5B/pRqzjDCHgCCC8f8vRsQFfoENu7zHsOF9ixLFiFmT1oMsN5gYQXck/TbQlgXQk5VTYRpvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhpopCPKvuwkj6FC9iA/wvM7/RzmN7Zdv6rgKnpBY0M=;
 b=EKciw4ZgXdnEhUFLTx0E4uF0Mn8CcINtBxyEaINyWqCQ7o3pUNo31ag5AXEq9JiSAVbb5RRMBBF+qWn86jrCfe5sDQMrROHBys/6PAIe1KQrsqWz5dh1dWErLw+iIK7UOYXn8vg90o77/3Y68EdWDkEpXeDlBWYooWrJe/SpFmUrMhjG9U/TDKdarqFmVpns51yLwsFska27U2QRmRdqtgkKnLnpWqaBFM3qTzxQnT6oJlx89X9GVtdLhxSFqN/YtbX/C48PYUUibmjJM/IujfSjXbRGBgB3+frvXz36C25wnKC5iDa3eBl2Pigzbv0zypEV45K3IQByktSTPgWKfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB8606.eurprd04.prod.outlook.com (2603:10a6:102:219::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 16:16:07 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 16:16:07 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	s32@nxp.com,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v4 6/8] irqchip: add ARCH_S32 dependency to Kconfig
Date: Fri,  6 Mar 2026 17:15:53 +0100
Message-ID: <20260306161555.9000-7-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306161555.9000-1-ciprianmarian.costea@oss.nxp.com>
References: <20260306161555.9000-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0168.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::35) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 81209f80-4ec7-4bb7-4ee0-08de7b9bac4e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info: AZBq3XT0G0JN5DdyzmfEnERplk7HSYJWACXdC+0kZjL2lW0ogEYVxs2Tpm1c2chyff33ZMp2s7dZ/A6JzWUxPvIzLAejf8Idv0rdzC4a49gvsDHHjMmpdVCeJtpkMcZFWY2CU/efOJCuTwEEoq+96Ekfds024WgryEb+0HwY3y/bmPz1Rw0rDmgGvdtyGwmgmDg2zB97FkiYzC2VBtHbj42ippkWRz+CdZ49tkjx24nDthbARPDPez3nD9YBdKI0ldz23bzKeQyjW4sXVL796/ao2IO+RodAZxgY2DyjDUBi+oOMEhPLLQwUvOuSdRf7tGuFZ+LLMS5MaCXUODENVNtZNW6zN9h6RkkUQ7lvb9ZSYflJxVzmikNBVZHMzN+BTHYEIEQQnh4ZzeHPSuXTpCq+zA5hW8tZZR31pVMQZm0I4Cu11K9SIfG4OuecOcgkkDUTM59GICEuMv5gVyYgES5sDFFT6F0n8R6zGrirVIcRWOQ1f5qa7abd4/8/GzaS8+uZf+DNeMWl+aHpMasagH1w/lTenJL4GWlyAiH4drLkgqflSZgTAWb2DeC4LD6mkdceauhRRIU/pWPJXHC6JlyYPOjkuFS28hqWdzCULmi3+hT4InAR5J8Ip3iT308/jKDi1uNCk0D+DltvnfpX/2irevzgMxjv5kwkH8QagAYYcP6+ONqwu+RHRTUbaSW/YNoDBOpHZurdDDlBVQ3F3I3gzO8ftv4rkR5El47h6LoU8SDrKs/FgdBWN3IwPqVUdQHP+MDnL+OrYKBpCwcC5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXhkT3NqaFF3bDdGUWs0eTJrMlE4a1VCVGViMDhhcTF4TEhHd0dsT3Z6OG95?=
 =?utf-8?B?L29vQXIwL1JWaGRVNEZNcFZUdFpXSU0xa3hBdEV3bHhMMmNHazE3eXFldmpM?=
 =?utf-8?B?ZlZqci9ZY2dFanBwQ28rT1p6MmpSUmwySmFYZHlWSFlrd0FUQTBMcFYzbHFK?=
 =?utf-8?B?OUQ2Y01Ydkl1VHo1cTNyZW5LTW9qSkdIVFhNenFlT01zS1lyYzJyUEVQM1Rz?=
 =?utf-8?B?K2ZtV2tBRVdzejRTU0hPb1NvaUNlNXRtZEV3VUMwWmZTb1U2bEd5QVN2NXA3?=
 =?utf-8?B?L1NZelhwYVQzQ2MyZldGNE9UTVZMLzVpdXVoNThYay92SG9QeDQ1N1FUOG5L?=
 =?utf-8?B?akZSRU5ja2VZTUl2NzljT2o2VWtzZ1NRY2FRQ2Mwd2g4bDVjQWU0VzdFSS9I?=
 =?utf-8?B?SDJQb1NrSStPR2ZXKzV4L1RvOHJJS2drdUVkNkpDNVlBNmtQY1FGUjBLV1A2?=
 =?utf-8?B?aDEwMmp1aWRtM1RvNGdFRHVTSWFvcE1qbng1N0VhY2luMXp3V0QrVTRxOHZP?=
 =?utf-8?B?Q0lnSzhHb3E2YVR3WkE3cXNIeStsZ2w4WHVlYVAvSUZFZkxzdW9JZldXb2Vv?=
 =?utf-8?B?L1N5eHV5ODBrcENhTkZ3aHZ5N3ZyTDdrTW5kQ1hzQ1doL2RMN01ZUjZKRjYv?=
 =?utf-8?B?RXFDMzJXbGlFQ0VYcDRCSjR1Q3hqbFRTdm16SW1qcFVMUWdBZEIvdEIwQVpO?=
 =?utf-8?B?NFQvMWZITVlkZEordFBXWjZIb3lmMGR3cGFFWGEwVGFKR0lZck5oUGpGcjkz?=
 =?utf-8?B?VG1CZ1h5SG1FM3VDcndGU245ekdrR2t1T1p4RDRVZmt2dEJNVkgzRTM4dlMz?=
 =?utf-8?B?OUs2L1J1dzFGRWFPZWFhb2phOENQdXdwRlV6UE5rVVRUZVdrK2IrYlR3MjY1?=
 =?utf-8?B?SDQxMFNhRVZZL0VGNSszNEN5NThrUnZKcjJzdFB6OFB6azdzeWNFWEs4cndl?=
 =?utf-8?B?L2RSZjEyeHdXTS9ac09JYkF1SEhsbXlzdjk3L3Z3cnFtV1pxalprMnZXTHVQ?=
 =?utf-8?B?OU1SeFhmYXZKeENNZXF2b1laek1LbkJkb2tGZHBML29IVWNwQWZtMENXeDVs?=
 =?utf-8?B?allSQk1mVElhSFNZMmVURzJ3eFdwUkFob1BTQU1aaVVWYUJwMkdTWS91ZzRx?=
 =?utf-8?B?TzhJWkNZZzhuNUt4SzBJazBMZDBDUnBPVGZJT21NbmIvSnRra1RXT25lbjRE?=
 =?utf-8?B?YmQ3UGlybkg5elAzdVhpRkM1aDRqcVQ4ODlsNThsOTZycDQrbE9kd2IzWnhB?=
 =?utf-8?B?Y2FRcUdaL1dyVmEzV3l0Rm0wVUdiSW9wcGZsMGpvaTZuNVRua3o5QmsvY0Q3?=
 =?utf-8?B?ZEttM3BSMERvblQ4TEEzVFUzR2FhVVRUYTF5Rk93LytPSms0MzVhbXd3TVBj?=
 =?utf-8?B?SVpXdHVaRUZNTzQvVEx0OTJZVUp5blVDM3J3UXIvcms4cGYvUFdLUk5ldFhk?=
 =?utf-8?B?b0RzbjQxMTY3MjRlSFNIZUFDV05zTll4QmRxQ0hrVGJyU2Zrb21Nb1BMeE15?=
 =?utf-8?B?TXppb2pNekpycjR4VVhZYUtBTGt5UVNEdlJxTTJ0ZXhYdThHYVRDTmR1QzZn?=
 =?utf-8?B?UzZvS25KQVdjZkJnQjVtZU5OaVQ4WHdXSDY5MjhUUnlOZi9HYmZkL3p0SkRB?=
 =?utf-8?B?d0tjc2loY25HTmc4UktnUUIyV2t1cGNYUEs0YzNwc0dHOVZGajdKQUFpVnFt?=
 =?utf-8?B?RGlCMGFqcjlDcVFxWHM4ZExxc05WMU0vSHdINlhjTldLNUtmK2hySU1aWHpI?=
 =?utf-8?B?MzA3N3RVVHkzRkRGMm44WDFxZlJ4Zk5VMnNuRG4vZEhpYVlwVXFBekRXYWtY?=
 =?utf-8?B?TFg2aHg4ZG9GVURhbHdZVEhITzdSQXpTSXZjZzBSOEd0ekNUbllVSWNGUlRz?=
 =?utf-8?B?NVFyV2VPU0FEYlI5bkFIcGYwVS8xUFQ1RW15bmJMRDRpbFpYczJWV2tLYnlG?=
 =?utf-8?B?L281WW4wMGgrc0h2NWVEN3ZQbkpWV0ZCMERvOTljM29JT2Z4elRCajk2Nk1T?=
 =?utf-8?B?MGZucktzOTVLb09yVnpKK1RUamMzTitNaEJheGsvcTdvbXZlYS9EOWhKQjll?=
 =?utf-8?B?cGFVeE03VEwyYWkvN3pzb2ZOTTVTQ0M0VXZHT3NtOXo0Mlo3S2szcHBuK0M2?=
 =?utf-8?B?SzVDNHp0c0ZTdzBmKzZFOVpyWWZSQmRvUXRoMHRienlrQSs5Z1dwUHFDb0RY?=
 =?utf-8?B?b3JaVWxXenI2c2t5ZkxadlNZdk1tOHNuVEJvbHQvODdJVkdXYjZXTUxiRTQx?=
 =?utf-8?B?cUc5cHJ4cExDdmRFU2RaWmV2Tm40TkdFYWZUUm1ySHhVQ21JSkl6WVo4MllY?=
 =?utf-8?B?VnBvS0ZuWkFxRzlFaDdOcDVDT0NMaXM3bUxYSlFhTStrMkh4b1VEZDNPRHpG?=
 =?utf-8?Q?cucKi9jv1CqfulKk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81209f80-4ec7-4bb7-4ee0-08de7b9bac4e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:16:07.7358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JG928vy0XaCfrGXBQhiSHaBOwjRKzAJglmlgdEkcfxPijI8LBkYYpvYq1/HRNw4relNYH8+by+4YnafqXgEnMBfWRiCEUzFtDXZcvWe28SE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8606
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_081614_294727_E34FE52D 
X-CRM114-Status: GOOD (  11.89  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

IMX_IRQSTEER is also used on ARCH_S32, but only requires ARCH_MXC. This
can result in unmet dependencies when compiling strictly for ARCH_S32.
Resolve this by adding ARCH_S32 in the driver's dependencies as an
alternative.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/irqchip/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index f07b00d7fef9..ad32a084afba 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -541,11 +541,11 @@ config CSKY_APB_INTC
 
 config IMX_IRQSTEER
 	bool "i.MX IRQSTEER support"
-	depends on ARCH_MXC || COMPILE_TEST
-	default ARCH_MXC
+	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
+	default y if ARCH_MXC || ARCH_S32
 	select IRQ_DOMAIN
 	help
-	  Support for the i.MX IRQSTEER interrupt multiplexer/remapper.
+	  Support for the i.MX and S32 IRQSTEER interrupt multiplexer/remapper.
 
 config IMX_INTMUX
 	bool "i.MX INTMUX support" if COMPILE_TEST
-- 
2.43.0


