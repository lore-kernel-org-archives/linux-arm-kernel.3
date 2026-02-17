Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8989CE909A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+A++JfBe8vXG4S/9R2JRv4Dun9P+yhFOqjiFmM7cf2o=; b=ssb953l+G3xzXuz2SokoZIbvy0
	NSU0501Oi9naVCgqjemE6tuu7JU7szktCFW7+3KQohIhasE+74K7tC2mXLFAnZJ+DZWKVKz98Tf/3
	VKJ8eipwHPdTwnpvXiUtjmV1LE1yJC946thS5CNuvDMtJ+WSrXWgYDU7MWLwL3ibJQErMfszHd/nq
	wlW1BLgQGc6a4feTT641aeJy3Kx1QqtO++6dTEvudDjnTZqvxW2+hUkgENsuGXgRkRiBkE3o6Qmc6
	nJiTK5Po32Lia50uLCFHW9HaRJ6/xzv9UrXLqKNzhZNXVeXuWUCQFkTK0dwOa+RL7ExHeUTRL3kv3
	2sLRy7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLY8-00000008MuC-00FN;
	Tue, 17 Feb 2026 13:55:36 +0000
Received: from mail-eastusazon11011071.outbound.protection.outlook.com ([52.101.52.71] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLY5-00000008Msi-0abR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:55:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doRUhzlg0LUg1jLkA7Ga9eo4MEMohkOMuD+sH8T4/U7dtFDqVxM6sMHb0CqSs+uZFFKd7DJ6L3pSNXGVTlsKr8MnDAG0b19JpnsyGqZTP9UaZ4FPrNxrUpkVnG5iePYB8kwW9ytZ+ODFii/h0eUDGrTv8WT4kGXDjtO5tmyU95wP+VsfrUo9RlifCld/Kahf1HHZ7qzZ4LHqYcDiw6t31Bg2niJibDkpj/nS9i2EYFX/TUTKSA6YKEXdb7/PMTkETS08zn/4RUUHD8EX2Ibqdoxpr+axg4qJvmd8BZOQZIRhluen67FS/qxRdBtJSLKxFf2GNkbIQqxAttdafxxrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+A++JfBe8vXG4S/9R2JRv4Dun9P+yhFOqjiFmM7cf2o=;
 b=HesK7zvxhw16PeMmShKuHNk/ZqDFED1BZjTHxVWMlseIG0CVlw/UQfIzLqqLJT8LtORSBotqd0StA6Lavj+7Pw6I88k6fx6Yh4IOb0/Dh+YyeuGkB9gFWGivioRfZ95siVJq1YgQk3cF/kEGNWJqs0B3cT8Ev7xSuMxRIVIbZ/rENHpol5UvyMT4RHZFYsnWmJaTCBQNYhjK81ylMCpcj60I4QBt+dtHncSEufEAJsbKvJUZRKAud2HVvniBVp5cFfpvBE30qmQuh7VcKu+XQTXDxr5ljHVTwwEumIDc+t3OrxWK17y2H1ukwKPC742vrl3blpg9xAm9XfswgUPzXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+A++JfBe8vXG4S/9R2JRv4Dun9P+yhFOqjiFmM7cf2o=;
 b=KHHV64IqX9PHLGn27NEi+6hgtirRM2tFpLeH6J1uIUQnQnOnv75/EvjKMHUTu11zBt6hAFkLmLBDtPsAtWET41Jjpqgbh0mUgvue5iGTrTr8Cfm+OheHELgAztqhpPt3Z1ruX2f0dVDEczGRxuhV1LeTGkgORPxzOB7W22SCpBKDAHZm996CyoTBf6uDrsQRGXFSU1E+tDYrL4UGksH4HuaXNkbOO9BW/f+G4UzHKY7WEnxFBdLVxFimBMrw7fkT8hHNvwRDVL1zKXJ2vUyvGfi6KOj8tXIhOSkAUY/8kLCBeDaSp7v3MoMyCjxxtRLXyRB/uz9qejeYKBS/k8YTfQ==
Received: from BN9P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::35)
 by DM4PR22MB3421.namprd22.prod.outlook.com (2603:10b6:8:44::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 13:55:27 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::75) by BN9P221CA0018.outlook.office365.com
 (2603:10b6:408:10a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 13:55:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:55:26 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 90085E8F41;
	Tue, 17 Feb 2026 15:55:23 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/5] ARM: dts: imx: {bx50v3,b850v3}: Update device trees
Date: Tue, 17 Feb 2026 15:55:15 +0200
Message-ID: <20260217135521.65742-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|DM4PR22MB3421:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8fd9c501-423c-4468-a2ad-08de6e2c3492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/b0dIoJjqw9sD0UsfuODwBTlFyouepdC0Z8+NbMwKRGfScA1yyNwSd7qrb40?=
 =?us-ascii?Q?fOLBuIZymVmr1XwO6vcQcSLI5yj1JnAw3qSRgJdVDISfqk6DFfb5W2jcr+0D?=
 =?us-ascii?Q?f2PNQri9MBs0Ofvqxe3YUAAxZbiLiXNPCKm0F7VZDq5H4mpFJ3zxfXdG2vTX?=
 =?us-ascii?Q?YOHec0HJZrW35aWDXJ+38/QdpakbY1njSoZ9h8GKm4Hpnp2zaAUrozpUyEEg?=
 =?us-ascii?Q?lwvZe9npLVsj2kPOqipUHfNsSDwC6c6aSmFwNLxhYCe6C1L+Oydz12XbxzVo?=
 =?us-ascii?Q?6eC63Sx0QGPKFkQ9wzY+y1KvQAIQav/2d4wNjbxoiwWyK0+yLkC54OkSahtV?=
 =?us-ascii?Q?5w6m8E/61DYsoWT9laSRQPWecl/rwhtCOQaafwVDfqRkQ8AiFASR0c8a5coJ?=
 =?us-ascii?Q?av5xgkuDylsI1gbPnFkBrhtPsMHkf1+dZh+kSJ351NZpuvgOYKZOT46qIIkq?=
 =?us-ascii?Q?9uQJk15xiJf8/BIqV26GjnENVwy8Y//gzsusoJrDcH0RLJwssfmJnV4cBs8i?=
 =?us-ascii?Q?d1T6UjqqGn2MuLRpp40ElpypS3SrbJ6ItRVL6F8KFwOo6G8CDHnAnCzTM/4f?=
 =?us-ascii?Q?SCro57kzlVvV/XgjM4gcyod87JMLWHEjj7AAFJipr1idXmvIQ+NOtinMkVQ0?=
 =?us-ascii?Q?9xpA8kXhjg0ziaikqPaDFZEb7eQFPmab2Cyv4Ya88RSYKj2D2+3wRX4Nm1Q2?=
 =?us-ascii?Q?/Q3d8urLjPEdlGGbrFqXsXx62fYSGfmlkH3PfaBV3+RzaADH+lEVgPfDrhSB?=
 =?us-ascii?Q?gCWbvQ06XCuYWukCyZNgYlYbcG+o8tHc2MfhS6FFWycDYBPabbarmjrck9EK?=
 =?us-ascii?Q?DXEINCHnHlH2W63OdQtVtNIJ/S1ExM6I/uGvfe63XsRVl/8vIxq49d1vDzyh?=
 =?us-ascii?Q?YvQpVFAtbRgsYhOmenTk1s9zkFlBKii5Fs0EUryyuBMhiwwXqoylz9bCLXaK?=
 =?us-ascii?Q?8dPpq03Hk+pE2XYNVYwm/lkgWWic2BtCan3FzkcoWEnNtrKrLhVqZcv3aYav?=
 =?us-ascii?Q?lhYjWiBc8kBdkQR1UcxqjJI0WBsAhxmTj2N9NnFtyFen4zVOsKkbnKt3LHGG?=
 =?us-ascii?Q?sDiHJPWkU7uCmEyOhaC9hsX6Msc0JkQpKnPRVvfUbtNFFPxi+vLkH4UXWqVD?=
 =?us-ascii?Q?XUc+zXEEQp4VJCOHHWZTRtp5KvVB4phBl0oeyrjxzCZfxg06V0+vhREXFHV/?=
 =?us-ascii?Q?LlFs/NBJn1Rwr2ph98ntKArtyHdBY0Nswx8s2zcRY+lnd9uxOwlIbTg4w9T7?=
 =?us-ascii?Q?MdjDtivD4lKtNZOSVxy6m8nvf9Yfn0+H0Gz5GrOW4y+JxaT2kkGT4vLAMfbX?=
 =?us-ascii?Q?Mbu8V0kIH04jo0xUoRPuI8AnaseTYG/mWh7zcvedH4qVGMB5tPm2iw3+CLQt?=
 =?us-ascii?Q?iuno3y9GwUibSXnVfjbQ/FCS+XhCS/pyWSTcvEf7ECFo+yY4ueocO2MMoYBt?=
 =?us-ascii?Q?OLOz1kbiBv0nTVhioJnBz6+pjfRC3vMPy98eqdaZZbZ8D7WYblgsd3yS6seS?=
 =?us-ascii?Q?XWVA7/IVftMdvgfjVKPwxwI7tb0AP1sD6LPKHBj7zoGC5bpl//6XFny+3J4N?=
 =?us-ascii?Q?S0/nreaeXs0o8BpECuWYJdqqKaKWV8E1WqDJhmiw04OvlvG3Oj+9y38JHQHI?=
 =?us-ascii?Q?J/34gXiAIUx3RfXWo2m1PE/R0XUMnQj3znXirMjmgMcTIrqFY/oin3C5PFwZ?=
 =?us-ascii?Q?OHWv8w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hng7cVBFpr32KUmbKyc27MOrK7xHtXA/x5kss/70X204xqIdQh+267aTS/un9CHUC3swwnZy0kUdi+VVrDFv2VgCypJGg9pFxM9XRkxkRmldydUKnjBZEJSRUz0/b2jLO5bIo3XTbeWdcFRsCKaQ+W56OfXTD6bEHDa8dNk7LLiaZMwGqIm68mzhZGeYs7A0gOjCofCkXoMljGKh+nO5tv8reDRtrM/SCvXvmfpmS3Y8qvwFls4zqK0VMHMXqDIuBH1toMWOAAs2aE0J2e2Orqk7yt4AA7Jt/g83fcWZrtE6cRJVzlC7mNnEsA//UGuNpz1YdwRZUDn9Zexr/SAl0nELFkTbbqbwVtMwrBNWwCClFIuWmIMH0o1OW34YlgtmUC7wNKuhf7hhxTEDlMis3Fb9Qpu6c4QmcqVJnK730yEz1l/ONoRBXLIsztA0ASp2
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:55:26.9576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd9c501-423c-4468-a2ad-08de6e2c3492
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR22MB3421
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_055533_202103_F4D99BBE 
X-CRM114-Status: UNSURE (   6.66  )
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

Configure PHY speed and mode.
Configure b850v3 gpio4 line name.
Disable b850v3 usdhc4 interface.

Changes since v1:
- Clarify the exact warning message in patch 2
- Add patch 3 to order reference modififcations correctly
- Correct the ordering of reference modification in patch 4

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
Ian Ray (5):
  ARM: dts: imx: bx50v3: Configure switch PHY max-speed
  ARM: dts: imx: bx50v3: Configure phy-mode
  ARM: dts: imx: b850v3: Use alphabetical sorting
  ARM: dts: imx: b850v3: Define GPIO line names
  ARM: dts: imx: b850v3: Disable usdhc4

 arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts  | 53 ++++++++++++++-------
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi |  4 ++
 4 files changed, 41 insertions(+), 18 deletions(-)

-- 
2.49.0


