Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD6BF3D5E8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6aSJnd/tkuZyRJVW9PR0kusJ/FqirX5JNT4zr+qdlXo=; b=rtHhUQ4OQiC4a0HGbqBAIe20nt
	VxuCbm0sqezjiriYqT1Ng2KgNQ812VBQXi5aQ1ssqs/vH915J2TNa+p8jAIIr8TrGHdYmfiLe74We
	vcB2kInt4otboK4HeiaTDciAUauv+d1VhJZt5RQzu6IdU+L/Rz738RvT+BGGHWqRXfL1v+SWtWIUv
	b03+/wUV3HeEeMz9S+vvAXv2274hZZyG2D3QwhNrSosyQK6s5bNwB7/TG+8FUUnSxKoWom/H+l/kK
	VTnbLew/hAXzY1/fX07ZpkM+Q8zetu/JNBHHLq5MlD6iH8JB+HE4OWDifd4w3OBWDCLs+jUR3Are2
	n8nu/jqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77u5-0000000AqbV-1psr;
	Mon, 30 Mar 2026 08:23:21 +0000
Received: from mail-japanwestazon11022090.outbound.protection.outlook.com ([40.107.75.90] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77u2-0000000Aqa5-3QbZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:23:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfivDDkOEyuUV8b80VHJLQyAn4gKVP3ShZNWK5+VAk+E+cdB84HhMZRdO78/nZjU27bpctLJdG2HFhPbXTNMui56DKlhMwKD6xCOs+BcD84CyG/f0vv14KotKWF2DVdzZ52dUUgTQubv0BQCCediwhLi4ycAOpJ0Zu6lB6zLzHnIXjJPFOfwcfF1enowfTL/WDpTu7Re7LHArJv16GM5Xpu5u4gB+UaMgWijaf+zut6XxOEOF0vfXpYgwn8wh0VWjUFDSegTaK1Aceco+cFLHLANqnC7YoGbWSb8WwXKJu9eWb4hFHE5XD53H7wnC7DI5aAVFhVe2iw831NbbH/JCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aSJnd/tkuZyRJVW9PR0kusJ/FqirX5JNT4zr+qdlXo=;
 b=ZPOJfVElHyXt+GSG4C1CJHUk0iaYEqI1ELwiLg6kWt8a8rf+58F2IH0D3ivj4l4Hz20UaY6KKUIPcJ2OKHQkEaSWT7ODQp86avqUM2EPdInA/DAoFxD7uW1HbveqZInuIJXlFBCDi/CP0Oxa/zeDlELte7/fSurpDGOinOyepUpPMJa+x1DOeNPMUAR/B+vnrCcQmnvVpLbZCDuGb7/v+WNXuoTuD+wTiFeDyc6IXPGf57L4VKhKNal5B7UBjc2p4beXkd23IDAUhoX/AZlYdG8m72p99ryVHyosZ0FpVSk5YLs/gE6nrDLdhPYTmQJRlhcNy7pkX588UkauLC4ESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9) by
 SEZPR06MB6137.apcprd06.prod.outlook.com (2603:1096:101:ec::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.28; Mon, 30 Mar 2026 08:23:05 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:c6:cafe::bb) by SG2P153CA0040.outlook.office365.com
 (2603:1096:4:c6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.15 via Frontend Transport; Mon,
 30 Mar 2026 08:23:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 08:23:04 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 93D244126F82;
	Mon, 30 Mar 2026 16:23:03 +0800 (CST)
Date: Mon, 30 Mar 2026 16:23:02 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org, arm@kernel.org
Cc: fugang.duan@cixtech.com, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: [GIT PULL] CIX dts changes for v7.1-rc1
Message-ID: <acoy5sx8l17P9jaI@nchen-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|SEZPR06MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: 6430a15d-e702-45e9-0939-08de8e3590e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: zhzdCeBMVAxTxWYzLSdpBThG4yZO+XbcCQZnWbyLzc3/iRgbgCbxA8W+IM9bglYAsUOGFJvP3fOS8XKX0wAc+q6dwQufjAg009Exf+xtTYBge7nHORMtKcfDzjWzZDwrJovGVqhB/hXa6R1zpkkaRWvgGYvuuyaHGppPxvcO83Y+yozkQvWUOlPd5BKF019SbaGHKBxvMr9qlrfTvhM9VYnJ7WQOgjRLftx7XuD3tCDX5oP7OSiJAGfWEPUmtwkSBZe5pnT4ZnKI8X1IqoJbOnqsAvdZAkipyzy8CqsW1lgfCzH3qTmfC0Ioo269bvMib9MmCcBrLtOM2CdX1zOI4R+VJNFgyteXdGk2aNHU0Xgxcj/wG7gpRhfF5Ivzue+Arw5XSp8PXxJsURIRR70bWmQb3VP+jpv71xLC8z4ekCQlZ1ZBSUnRqBhjyooyqHvFFy6ZBZW1awNWCVDQi5mH5nqoq4INUHakqxqPTE/N5sj+JjiHLk7AKIusIKfuHN9Nw5rORRwEBHxOrMUXL5lfo+kxwGkFCBV0dkP/J1Nz9gtOQVGE2rPJkHzzfSs5WFwxl6ZHgo1xWPDaBx1AN9r9WarBb9Eq2IcmzAsn4CvFKP5MXWFxDxgs6RB2q5EiSExLaDPw9ANvGJ42CZe2lPX7tafyhYs8j70zWgi9mbtcv7D3ac0We8FJ+aki1/UauZ7KgcypTN2YfzKRxmgLBVViEzuyV4+QaHrTZWVbr40U0b0qyKleGAwybIohoaq+UZnysrtbI3ebvsPnotiBhS6qKQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Fs/cpRI8ooaEIkC//DoD8CtSoKiJiQegQO8t/4cNe3Zxd1uNbLTOXmIxHds5KikNkLngOylgEfPbJv+5e/+u3A3jz7QDnstrYCwbFVh0+EuQNTVPGDFHAPvBlzj+nD5BxDYqJShoTObja3aT0Gw0S3azRC0B1qCq5q/DxuhI1ABxAf97GQYRO+wG/nDkP0DTI6CFEeXrIwKfxLXieL+7RVNf8YRWNTAcJFts/BVIIH5sAOnQl3NspiA+QFWq3Z8YbehEhT93wUmwTourj5XoXyEVvsH1wZ3GY7tyxNXfsckscHkhsJuO3qtnW3DRZ5RuW7q/cCelBdZipq7YV2y8hNvEra0pQB99nC83qQPBsGT3U14JCU3QweJp2K3FCpCaBC2WwiFPLjahkioNBd+vrVo/Q/6TwlJRmTuCA6l8Z+ujYpcV9VXCICdtGawHkwKk
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 08:23:04.6868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6430a15d-e702-45e9-0939-08de8e3590e9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_012318_854973_B490F8BB 
X-CRM114-Status: UNSURE (   9.24  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/ tags/cix-dt-v7.1-rc1

for you to fetch changes up to 64b00da69ef6e2cb113868c3ecdccd9bbc1fc91d:

  arm64: dts: cix: add FCH(S0)/S5 GPIO controllers for sky1 (2026-03-24 15:37:13 +0800)

----------------------------------------------------------------
- Add power domain and reset for SoC
- Add GPIO for both SoC and Radxa Orion O6 board

----------------------------------------------------------------
Gary Yang (2):
      arm64: dts: cix: add support for cix sky1 resets
      arm64: dts: cix: Add scmi powerdomain nodes for sky1

Zichar Zhang (1):
      arm64: dts: cix: add FCH(S0)/S5 GPIO controllers for sky1

 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  28 ++++++
 arch/arm64/boot/dts/cix/sky1-power.h      |  33 +++++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 152 ++++++++++++++++++++++++++++++
 3 files changed, 213 insertions(+)
 create mode 100644 arch/arm64/boot/dts/cix/sky1-power.h

-- 

Best regards,
Peter

