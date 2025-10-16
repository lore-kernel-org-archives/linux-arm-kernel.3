Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C0BCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzixAsWVBHBotlHxvcqhoEdO+gcVwq8N4sYgjnTSg4Q=; b=djo4VZUnfvDpPpma8zMTZOUYyY
	ArjMTVH115nKhI5+945sxNox2fZ+e93cdkNblFWfFXQ31FFg7ZdREJtsxYLKB+UCQbJC5I0SzY/4B
	18ohqt5HcEAIcqPPQFj1lJRJ+PWl9dEzLghWFz9n9pH0PXp+6zP0E9jPkALQ49SIXnE2uJRfXbqoY
	TopNSyWFFRurpuIp7JAzMKV/jyf5w55EA3Ni3LN3NPWUsHuVa4ZrU7RjCTnaNnXbT+yBKqN2G56DC
	DDDhl2Yg133jDsqJKtokjQHhJURGJbvo/1YphzktWRoyGD0eOdnT/7Jne/RBTDjjF19W1g3n7FLT3
	IX7lClWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QPH-00000005K47-3Sev;
	Thu, 16 Oct 2025 16:00:48 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QPB-00000005Jmb-1mza
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 16:00:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHBeZFDNht+s2VutaT3w1RcSBUEJs9s2p53QWlbYDsR4+ppE9Y35kyAlGRg9aPIEDIk9KPv/cT/0eKIuY/ss30Ix7QUeeTH/JzE0dhrt19q4x3dn3jptBl3EKNv/B9IliFDWh0trRb6LJi94t4aRH+7GcAQWhfa1QHAOHe52yRw1DBv94S8WlDXWxQ6BB5c5Fap1TtwApwGK94OworbTU0hf3lJ74D1D+DtDBvfIZr2MXM25/meRq4LPx8qH/BCj5o/r8CvtC2MvWdCTF/p9YxSL/zCl/28nsJq+j7veSWERZ7LGEPLPpzMMqu1J4nQDsIv/GgpEXBl1M9ZYDkdvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzixAsWVBHBotlHxvcqhoEdO+gcVwq8N4sYgjnTSg4Q=;
 b=tPmkwpL22KSFiTcRX6tLod+3Q9KMR3/rEDAq1p+mGMtXZk+JItFxYUGYSK+rE7PqjLZq1gYoBKWIVdBzBx50BgtAEU3RYdsPiOPFtHPnGv6jEBr9CFFsseJ0vpdZWRWouPJ2eRdXGho3+80LU0f19M1Ya02qZinvFR1aBQlqyRuyOXlm/Swd5WyDxPtNAb3oES2PQqt2IQGM9yugxP0KL9FHc7FpVEZy33MNHeCLqlbeChqG3jGiiqBlEhKpMUl0z/W4tXQ1oBjhmxv08ydasLCPHQZMNaY8w4asVHE1Sbw3ls94LBbb+lEptzYUvQSI/8kI/BiBVBwNudaHD2eFOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzixAsWVBHBotlHxvcqhoEdO+gcVwq8N4sYgjnTSg4Q=;
 b=I7kwoPqS79/zG3yN8D1JuXxzXIbMq4qBg2W/S9lVSKY/pJw6UcaGpwwPYRZjJ+HR/U3jdYnVbTU0bz9Wjk3eQU8HsbPH5c1LVzms54ivAF+XlSYYxdLyHL1USY7j1lkwFIXNl1IfXlQlb/TRr/tU8EIdKBCMT/NAFHpY6tjWCLStO4sYvg5NzITH4NXDRBf0p4OuymLUvzI7V0n9ar42lJzKP/1f0SWfYioe99pkSYZDsFvPexpOEaNh3wPPPZfmB6lfQxlyQGfJ7mb7GLuzJbxSdQjDigf6p/e67BZhKJIYSWc48TuZDpEgZiEonjVKMcebjTOO4Vrtz+oZ2OWe8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GVXPR04MB10069.eurprd04.prod.outlook.com (2603:10a6:150:121::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 16:00:35 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 16:00:35 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 16 Oct 2025 12:00:09 -0400
Subject: [PATCH v3 05/11] ARM: dts: imx6: remove gpio suffix for regulator
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-imx6_dts_cleanup-v3-5-baf2814f8a15@nxp.com>
References: <20251016-imx6_dts_cleanup-v3-0-baf2814f8a15@nxp.com>
In-Reply-To: <20251016-imx6_dts_cleanup-v3-0-baf2814f8a15@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760630414; l=1691;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=oVUUTzXEys0EGLaNi6pqcX39W4KcvXr7QB6CkAdgx/k=;
 b=DrAtl9xacUwZsaMtGRSB3//b0d373NiLe5/L8LIOrFnisgH6RP0Wa8hsAaLYsekG0RDgXiIy1
 wDl7/JORB1WCcr/tL/l1NqK3i52ZJLx5Ma0uhuIiwIzrkXyoy5ZvIL2
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:180::47) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GVXPR04MB10069:EE_
X-MS-Office365-Filtering-Correlation-Id: 183827bf-e038-45fc-5061-08de0ccd2479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTVaWHhtSkROSE54dkl1SGR3Mk5Tc1luVnVJUHpsRjZoUUhzUTFVNU5VL3lr?=
 =?utf-8?B?a09STDNsdXhhWDA2NmVSdURyZzdHWktzMjBFUjBUTmYwaXp2YXhRMVBZU2Js?=
 =?utf-8?B?dlZRaUIxUENJTC9SMFA2U09BTTl1YW5nZmFraFFZS0tJakFPL0x5amxhb1lG?=
 =?utf-8?B?VWdCelVvOGEvMysvUDZpNUJKRHArc210NnZPMWlGOE5lTUFaejc0QStHeUZ2?=
 =?utf-8?B?ZkRXMmNoRlUzQzUxeTdQYTBLYy9Rd01aMVNEWHdwdmZ2MkVNTXZsZUJ5TDJi?=
 =?utf-8?B?SlExVlQ3RmN6RjRhdGI3T1RsV2ZzaDhSdkp1RE5tVmJkQ2NIZVkrUDNXQjhB?=
 =?utf-8?B?K0lJVHFuOWxFd3h1OU03dGxjLzNBTWV4QXBKeDBXMnh1RUFuYXh5S01ZQ0dT?=
 =?utf-8?B?dm1TdmdwNGFIQTBUTHV6UWtvU2ErUS9CQ3h1S1BVVEhlOHlOS3pFckNhcVZj?=
 =?utf-8?B?VGszZksvbVhJWU1lczcxSzVlUjk4M0c3T1ZGUEZHaWlzdFFIeTZNTDJhUmdW?=
 =?utf-8?B?V04ydGE2ZUxFaVZTVGc3aEcxS1J2SVZmV05la2s5bXArU2E0a1VrQ0NpMlJS?=
 =?utf-8?B?WS9nakx3M0VZaUhWQnBQV2h3aVQyU1l1ektiYzhIT1NPVFRsc1ZWS2s5eFQ3?=
 =?utf-8?B?bythbUVLZlFsMkxhSmdWbHYwQkVMN01oemJqeXZPNFV4TUdJdkJIcDBZeFIx?=
 =?utf-8?B?TEIrZWhIeUxZSmVURHhubmtQWGtvcXUwRXhkRTUrWWpTbEwxcHNzc2JxR210?=
 =?utf-8?B?Uzl3VU96a2E1T1Zsdk9lQkZLOWhlaUxCWDhZQUMzM3U1NVJvYUc2MW5CZ0wy?=
 =?utf-8?B?SnorNkRWTi9jaDhGbEM0Z1VRUEVqbjI1YmJKK25rT2hXYXljbm50OHVzOWZs?=
 =?utf-8?B?MkFxMUtWYmN4OWxVRWNIYTM2VFJ2WkpiY3VHVUxSblNGL3RLR3RYMzdrNnd2?=
 =?utf-8?B?NlNOOUlSd05DRVFJZ2FEL2RuQmtVZzFTeXF1TEpvSnVYNGJNeHo2aHVuN0Zr?=
 =?utf-8?B?UU9DZGhxb0tEUzRnamlGTWNES1gwMFZXMHZZWGszMys4MjVDTVZ1N05LWlBl?=
 =?utf-8?B?N0xuRVhadWtXZkRQUnBSUnJIM25SM3AyOVRvRSs2NjMyZE50QUp4QjVMcTRM?=
 =?utf-8?B?TjNiRXJTT21aWTVmN2ZMQTcxY084YkRyT01tVlJTOENtRVkvMnh5eXN4enhx?=
 =?utf-8?B?ZXFEdmNoZUhoeVJxY2RPRExlL2owalYzbjZONHUvRnE4a3hmdGl5aGtQVFd2?=
 =?utf-8?B?eFphK2pMZW1VS282a2JBdS9YdXV5SWRObEcyRkxaeTdWRTdHaHpJZlM3VWhN?=
 =?utf-8?B?R0dDR1F4dG5mMFJnV2lWVmluVjkrcGRpOU9CUjVKQ1pTTVp3OWhaSE5WbnY2?=
 =?utf-8?B?TUdXZmdmVE0wSmUyUWhaTnY2ZjBVKzZrTEEvcjB5UzRKUnJRZk9nUWVuT3pu?=
 =?utf-8?B?eWlndEpzelFtZlJyVE9pUFJ3R1VZNDRoRUNKS1RRUUl4VFczd0ZyUERmeWZE?=
 =?utf-8?B?VURCQzBxZUxwRlBzRmxqNW0yQ2dtN2dld0YvemJSK0lLVjZMTnczcFNYaTBZ?=
 =?utf-8?B?ZE44UCtMNTNOTG5TWDlpZ1o4TUJ1TEltSnRsSTZPMGxpTHBhZVNGc3JxcmI4?=
 =?utf-8?B?ZEUrUWY1U2lLUkVSUmk5andia3A2RWh4aHFaVDVQdnF5OERxbDhNdVZtdU5V?=
 =?utf-8?B?M1ZCbk1XUEl4RDZ5ZDR1KzdEb1FMWUVubmliTEREbzdBaW0wWkpYQzd1ek1O?=
 =?utf-8?B?VndPeVdGcTFmNDRZRENzc3N6bnhZSFIyMGhTaEhsZDFXZDF1Z1JuN1BzRTVE?=
 =?utf-8?B?d00yckxRdUJwSEpQSnZkU3BvVlgrc1k3Rk1qNGZPcnZqMFRBdzk5aHUvTDdp?=
 =?utf-8?B?NHNoTWJhM3hLN3QyZGlTZ1ZnZnMyd1NMVDJOOVFCREF0YlJ2NTJVVGJ4czdI?=
 =?utf-8?B?Qmk5dURwd2JLVWFkWXVCQTdvdUhJSFkzZDRiVHk3QmtQUUZ1ekY2c1hIc3hu?=
 =?utf-8?B?L0RhbzR5d2N3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnhUT0huTTlPNWI2d0VwMjhvZzIxR2NsZTBLdXhZbXFOTGx3LzlBVUhXQ0lo?=
 =?utf-8?B?NExwN1BRdGI0OUZydFl1Z21yUU81dndwbGthQXJQWjl3cEw2MjNicHVzVjRv?=
 =?utf-8?B?UnZJSjFpdVZFcHZXN2lDaGdpR0NPVjg2TjRLdVRwRmRFRzFpcGV5Qy9xdHVz?=
 =?utf-8?B?WGVOTGFLOWllSkFwWlpDS0ZqN0s1MnlweFkwaG40aFFOa2xCVCtabEhjYUh3?=
 =?utf-8?B?VDNrZEtBWlhNQjhNbDNvQjNXNTY2bE5iOFZyMFY5WGVidUcxam5UMG9yY1ZM?=
 =?utf-8?B?dWw4bENkUFkzc0NST1l1T09BRzFlc3BTWTR5eGpaV3dVa3ZzNVRoNTNKTWdm?=
 =?utf-8?B?VTkyUkpLSTFtR0ZXQnZIemhmYllhbk1ic2lHNW9nQ2N4WWRsY3Y4cDZKRW5r?=
 =?utf-8?B?clkxcU5wMkFPZ3RVdG9ZZGFaY3lBdGVTZ25STEZtQUIvbWFPekIyOWJ1MDhC?=
 =?utf-8?B?U3RRRTlvMHFKY0tNUlFsc3FCRlg2b2lXQjFTRjE0WTFOYStUNERONEJGck5y?=
 =?utf-8?B?UEkwSE5rUWdhd01PaVIxN0h0aTlSWnRidGwrRjRpam1YSk9Da3pZR2RkWVBt?=
 =?utf-8?B?dWd4ZXRmU2VHeXZ1NWhXbW1ReWpsNHQ3MEdLbDEwZnUwMnhlTThVc05sWEFU?=
 =?utf-8?B?SDQxc1pDWHhjUU4yQnNjK08zZm1PRmM4NlU3Y1crWHRsUTNkRnRSMkp3TEZJ?=
 =?utf-8?B?OXJ2UEo3ZlF6aHNyNXlqUktJR3J0RUJ3NlplMVJaeFNaSlNackhNYlAvOWxp?=
 =?utf-8?B?RnRjRDNwVXdibFh4MGN5ZDJjSUM5dWhJekM5TG5wNEFOUy82U21TaHpqSVFB?=
 =?utf-8?B?RURwQ0JyTFZoMjkrZjZHbHpCcys1MHdvMEFIQUVNMEdRUytGNm40MThGSGVF?=
 =?utf-8?B?dHJneExyMVdsSkJ0VURGVzEwM2hGc00rVHlHTy9mU3BESGx6SUE2cHZGenFn?=
 =?utf-8?B?L3huUVYwcGFoR0NIb09yZWlHWU1vYlAyaW83STVMVERhZDQ2L2lyWEtNa3Ey?=
 =?utf-8?B?Tk94UGxkdXd3d2dMd2c4SUY0Rm8xQnVJQzZNMkJaeXkvN25CU3JzZHREWE9Z?=
 =?utf-8?B?VjVNQytwU3p4cUV3NituNml1b1JydHlad1RGZTZtNTBza0cxYmpCRHZoRGov?=
 =?utf-8?B?SDdpTWliWVZLbVFMZldlM0hkcTNkRTdDd1gxK2dwWFp4cFVLdzFZanI2Znoy?=
 =?utf-8?B?aU5OVnlOd3ZERzRqalViYnZ5ODdac3hTQ0swZWxlNkZkYzBQR3g4cFd1OVRZ?=
 =?utf-8?B?Nk8wVmQ5aG4rMDJwaENDNENQY1hSRVpwWnVjcDY5REVISEtIODNvbmJzMUIw?=
 =?utf-8?B?Z0NSNlhMTTRjaXVRc2Y5S3czRk1ZV1ZYVCs2WE02M1VLR1ZJUXAxc0tKQ1Mz?=
 =?utf-8?B?R2RMYzBXeEp4Y3dZVlROVEtRTmwzMnFRNEdDZW5Zb2E4QlBadVVxa0s2dHc5?=
 =?utf-8?B?WjF6cW90ajFRczRPZlZ4UnA1WXZJMklaNS94L09IRjZISUs2alZtVUZGQ2Nm?=
 =?utf-8?B?bmprZGxCRUJZS1VVN3dYKzhzTDRvd0JiMEZxTlpwOTFxMzh2NlRyODZHdDhj?=
 =?utf-8?B?MFpONjRQV0lMQnRjd1FpcmZDZVN2NUk1RHlzbjd1ZTY3YlcrK2ZsR2F4V1lo?=
 =?utf-8?B?dmlMYUszQWJJdlo5cWh5TjhydDgreXhOOVc4N2dPay83Zi94WmF1c2t1Rmp2?=
 =?utf-8?B?N0FiYXB4bE9FRHdaVFdlOHp6K3ZZS2t6T3RKbVhRZHkxMm5RR0RQL0VPSXg0?=
 =?utf-8?B?QkJTOUQrRG54UGZsWVJDMVpzOU9xaGdkTkdnTE51MFIxR1pXUVJ3TWZuQ1hO?=
 =?utf-8?B?MjN3WVB0UGhTeS96NFluZlJqRVBPSmFBcmc5ejlmZGYyRWpiUFE4S3dzdHpz?=
 =?utf-8?B?OFM0TzRDT25zYVlOVCt1eXRVRkx3MzkzOXU5bU1CYTVnUnFqWk1VSldsSDMv?=
 =?utf-8?B?cm1WVG5kWFhGTW5QS0puYTFwZCtUemhqNmR5YjUyeWQ5TzV4WmdLbEVpQ1dr?=
 =?utf-8?B?MHlwL3Y2R08rc00yc04vN2UybkNnSWtQSTNuTUFUVHJQd3d6c0lBTG5IbjVU?=
 =?utf-8?B?bm9LM2RHay96OUxZZXRWOUNLMnJQNGVNNHd4dWUrMSs4WjZKdEMrQlNFTlNM?=
 =?utf-8?Q?aVVhuO/YukjIqj71jT8r0Ba8+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 183827bf-e038-45fc-5061-08de0ccd2479
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 16:00:35.4465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqK4teiVh9q0oJ3xN5m2WV1LFRy2WXPEAyHXoi3YgLAMFjurNqY+SYQk1uY93p6Z+z1LcLn5vEfo/K3Oa5xe5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_090041_479050_A9FE15CF 
X-CRM114-Status: GOOD (  11.62  )
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

Remove gpio suffix for regulator to fix below CHECK_DTBS warnings:
 (fsl,imx6sx-sdb): regulator-pcie-gpio: {'compatible': ['regulator-fixed'], 'phandle': 69} is not of type 'array'
        from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts b/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
index 299106fbe51c4ac1e9e0a70a4ec12e16b8110497..789a9aac005ebbe20e600dbe7bc7262ccbf74c64 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
@@ -73,7 +73,7 @@ awnh387_pwrseq: pwrseq {
 		reset-gpios = <&gpio6 16 GPIO_ACTIVE_HIGH>;
 	};
 
-	reg_pcie_power_on_gpio: regulator-pcie-power-on-gpio {
+	reg_pcie_power_on_gpio: regulator-pcie-power-on {
 		compatible = "regulator-fixed";
 		regulator-name = "regulator-pcie-power-on-gpio";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
index c7aeb99d8f002011a677ee50c7c849b9aab91374..3e238d8118faedd39a923aa90d859301516cd00f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -119,7 +119,7 @@ reg_enet_3v3: regulator-enet-3v3 {
 		regulator-always-on;
 	};
 
-	reg_pcie_gpio: regulator-pcie-gpio {
+	reg_pcie_gpio: regulator-pcie {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pcie_reg>;

-- 
2.34.1


