Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607DBD7236B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X11aDf6KhJy4X17wue7HKtKGIYM8acS9medwdl080c8=; b=gUB4jFuk2DnqWOUUJSNgC+Hyhv
	EmZ/Pq3O86ye0K5NlPP6Z6GwMiDtQZ+2kAOm+dzdex0XVfTneb4M3w6/1dmk4OpkRMpkXowaNdHEo
	ZVfWeL5KKNDlxMeRyEKnMmnkbfsHSiFyNHszpHGnnv1GKZztbQflid1KudfFuaCUG+XT+k58GVAOZ
	ZzgZyBia3X4zYYD1WuLrKP/xoEOcefVaIFbd/uAPlBYrkacGvGD7jexmErCrmEY9Gc3pihrMW3L35
	sRu7jLwWZ/Q+BwfgfgHNqgr3OwS7M1n+0Tuz+uI24eem6kCoERs0jZIz+tc7DQc08U+H+uCt+G5Zr
	0UhAISKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEBl-00000008h8a-3wXe;
	Fri, 23 Jan 2026 10:14:49 +0000
Received: from mail-norwayeastazon11013017.outbound.protection.outlook.com ([40.107.159.17] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEBT-00000008gyR-3b58
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 10:14:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YC1NvcwS51nYtEtFDkQa2DUr01cfoFvt73dBklgPVrIaNZzl/D8kcUrUVRy46yNDQ6Pp9I9bQNXewBXR6jPO8dHz48AdYu+ptY1eKylcrb/QfSCkUnis+2CG7uw2+xGQW54OLbG4l7z4lcc7+lwCddTWBHVCYnU+E/T9s6nVSBWJJQ+DJ8nt6pJ0FI/FaeLcIIm4qOzW2C/OpN5zy5Y7yFnVXP/oNVak/yGY1C+GQ5ILqMFvyePUebawNvP0s5KO8f5PMQY+bw/xtlaRuJttKVo3SBbt88UrX3YXTN01GhXrmRMDojhs3+GaIBWUDcjtjrYQHoSY9m95zqdPgoezSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X11aDf6KhJy4X17wue7HKtKGIYM8acS9medwdl080c8=;
 b=Ke/g4EgoH5W57Ab2wX+v603UIBR6faVezxIkRRcnvFfYzVioC6E8wZ79D4XfemlZ715h4aBRZPM9KFGUEPd2vC34bF0DWToydJeff4LraVA6OQtvfooyFgMeUTkAsW69Bw7SnQ6tCk/5tWVYjQiFVBqxa9gjNFgzY6gRKW24+q9VZBe3ykPvYF3h6BlOLkoYrvNAlfEJrRBGIX6umv164su3UQ8yDULRF8h7GqwG490uShpxpCIpIBjrNoRNevq79ZpET+gKMcjmq6515zQ3cYEq1BOLdW5rl0ALYMD3aLEMsVAiql6dGkgPCHtQywR9WZN5Ge8Oc+sT80917gRQYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=dh-electronics.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X11aDf6KhJy4X17wue7HKtKGIYM8acS9medwdl080c8=;
 b=NNsww5Y34lP5UfRZ2r3z6GjS4q2WFDu9BV++ZStnD7Y5Nd/t349NldhIAlGmiqHfjDrWwFKgzzAcE4ZM0lBbHC1k69ZzIUxXtdW1MlUmeqY+IEDAGB1ReSCA6Kcv1LhKPFreQsFJhtbCK03STmXZk38qqTCb82flkr6PTJJgDpXjRO4bsVQVDwXr+sukRus7vQJkvvDhFgTq1KQ4skOuAbBjN8gX5dWVkmsF9ArG0M7zp9FZe1PH8fMz7IRN0tA/j/X9RyRhSQ5CXRyv0aJ0vd1SSBVaIY5dAOFWrFRhH5c0jQ8EsI3RSahdq4hYoZ3LKtFOH3RIGoWLh3LNxZi9uw==
Received: from DUZP191CA0058.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::18)
 by VI0PR10MB8354.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:14:25 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::1a) by DUZP191CA0058.outlook.office365.com
 (2603:10a6:10:4fa::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 10:14:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:14:25 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:15:40 +0100
Received: from localhost (10.252.18.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:14:08 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 23 Jan 2026 11:14:08 +0100
Subject: [PATCH v5 6/6] arm64: dts: st: Add boot phase tags for
 STMicroelectronics mp2 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-upstream_uboot_properties-v5-6-5167929d5af5@foss.st.com>
References: <20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com>
In-Reply-To: <20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.18.201]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|VI0PR10MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e35597a-a91f-44d9-9755-08de5a682f76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b01MM1U2RU1xWlRTMkxhc05tWmJ6VUVEZWg5Qkx6VUxBMWFVMWs5cTE1a0hJ?=
 =?utf-8?B?TklRZ3dqR0NINGJOQng5Vkx5cElySlRzWk0rRU1sdjlQYVdxRlpXeXBueHRU?=
 =?utf-8?B?bXprVzdLQ3FoWXJQRVNLTHo5eVpQRUpUaHpmMTZ3SG81TjdNaEpod3NUeUky?=
 =?utf-8?B?a2N3VVJ4NGVKaVBJODlMSlFoU3Z1Ky9VLzBHWjhTblptNEhmYlJ0NnlXcW1a?=
 =?utf-8?B?M2VOMWwwTTJZOVJzZE1uNzRMeDZIK1I2czM3R3VrMWxhbExKNGtUMWlDNjlM?=
 =?utf-8?B?QUp5Um9hVVpvcDFmNERoOXV3S3hBTkxKZ3FERmJyVEt1ckwyVzBtOGdPYWVu?=
 =?utf-8?B?U25XNWd1V3dQbHBQMmJIaVJDRVlKY0xuV0RTWUZDVDlFeGFYMU1lbkJFbWVL?=
 =?utf-8?B?R09COW5aNDlZWXpqeEk5U3Y2UVdTYWY0WDYyV1ViWHhrNWNDM2RXZkhkQmhB?=
 =?utf-8?B?QTJnejg0V1VLL2tIWXV4OEVXL0RLNDVGTVIwdGNrdWtpWHRlVEREekhzc0pS?=
 =?utf-8?B?YXZtaG9iSzhNUmZVb2ltQkRBeEZJdHZOOVh0N29GMjhZKzB3ZmI5NnFkbEs4?=
 =?utf-8?B?V2o1SkdDb1pCMElaVFVyeEIrVFVHTzZTZUxMR2lLeVV0di9sNWdCOS9pWTVx?=
 =?utf-8?B?UXNjTVZXaURSWXE4VVZwR1lnN1NsLzkzd3pqWmFyRUpzQ1hkRzNKc1p1dm4x?=
 =?utf-8?B?NkxMNk9Rd1BvVGVibGpJSlVJYXV3SGZiaEpGd0tRY29Xa3ZTNmUxK2tleGZZ?=
 =?utf-8?B?V0FBR2doUFQyMUVCb1BiVklHa1RSdm83NWhFZy9va1B3czhnMWFuNG95eU5j?=
 =?utf-8?B?OWU3Mm9qTjhZV212N0pEWFRwWmdVY3AyK2JkeUFpbzVSMmxLOFROTmNuYW8v?=
 =?utf-8?B?U005dGNlWllrUndhRjREbDdFRGtaQTdiMHg3cHZVT2M0ZkpUZldxQWtpUktw?=
 =?utf-8?B?dFFpaElGQjlQdk5DbkNjK2czSWlNZW9QZlVFWkcrRDhkWlFPOXc1THhXVjY5?=
 =?utf-8?B?UnpuSnRrM0VYc0RrbnZ6MndqUncrR2hraGRLZWNaWVREc0FjeVVNMXN6UlNz?=
 =?utf-8?B?MFFYOUphZEZwSEFCdTA1N1NpWW4xWVVyZDVKS051Z2x5WGY3NFVpeml4dmd4?=
 =?utf-8?B?NTlRRUVqS1V2UnovYU5VaGNLVDhWdnFOZk5sOWFJVjgzOFVOL0JpL2thUkNj?=
 =?utf-8?B?U0J0eVVnYm1wSmNTUmpkZ3UwVUxkMFM3Y3pLaXZ6Z3JWaGpTKzhXdENucXBn?=
 =?utf-8?B?aW9RV3V6dSs4azlYcEZnSytuamNPczRPVlJKbkRyNW9mS1BOSGQwQkJsZS9q?=
 =?utf-8?B?Y2hYdGhwRE1IRGM0czNCcWhUNTFOeGVoWVY4SnlDMkUvdEdDQTRZMnRDZWV4?=
 =?utf-8?B?M3RLemF2akgvaWg4N0pQQjhnOVJsb2N6amNuZGNaOEh4blNNT3hZL0FFZE5z?=
 =?utf-8?B?V0xKQ2NFZmFkYnRWT3FCaXVLNlFDSW9zVDZuY2I1S2Iwd3RMYjV1UTJvZFov?=
 =?utf-8?B?citUNHZiYVZZY3FmZTM1U2ZyNnZZTkUzTlAxWlQrc0FXN0FQdnVEUVREeGhC?=
 =?utf-8?B?QWtvVzJOa2drTDNnc2tpcFBFY0RYbVphVFlOdm9VTVpjU0EzUTFLclBLWXo5?=
 =?utf-8?B?QjJid3JQVFVyNVlnQlhkaEpYZ2VUMUdJWW9NazhjUnZ1L1NHTWRtdTZMTTUr?=
 =?utf-8?B?dkxrWHFSd0V6MEdTWWk1OVBrN3V2b2htSVBqRHN2bGFIRkhiMWdhejdqS2lB?=
 =?utf-8?B?QzEyK1VMYW85NEluY2VkWXUwK2lIeTRxNHdyRFY5KzlpSHlJNzhJY2k4bitp?=
 =?utf-8?B?b2ppaWE0RUtpaFhUWVFCQWJVYlZQOVRLMlYzbktTOHZrU2t2Wlk1ZFRMQkJC?=
 =?utf-8?B?M21zY2prUzloRnFwMWNCY0trSGpPMW8rbWd5SXNwczVveGlhNzJ3RDR0SnBF?=
 =?utf-8?B?ZHdzSnU3ek5sZ1BIcytxNGtRejFjZlBoYnV0cUE2cTZ1WVh4OE9ORXlzdEg3?=
 =?utf-8?B?L3g0V1orTXdZNW9WaVFjTG5senFjS3JtSXFRWDRCZjY5VG5NTE5rTFQxSWRN?=
 =?utf-8?B?NUgyRGtnNmoySkg5T0hodW5ldVd5eXpQMlBrQWRFS2tXUkRaK2xKcFZpdnBZ?=
 =?utf-8?B?QTNIYTlhWkR1YnNKKzV4WEpsd0lLTW5sZFMvbFZ6T1hXaStCVGpjaVZpVlhK?=
 =?utf-8?B?MjArc1BpcmppVWNGT3FUYmh6Ymd3ZGhUZm94ZTRzOUxYTktNNmgrdGpFbEt2?=
 =?utf-8?B?YTFFck8xbmxPRU5VUGtHekYxTXBnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6lpkoSBO5oYFK4tE0vIkZTwbAZql8Y/2+4YvAEq/tHXUHsJZX7+45/b6nPf6IgvK91O1Z6QrTC2bfzBCpyWeOQDsksj60+Kh9oawBXaLLjVReT1+q14ie0XfAQGdJhz2QP+dU2PjEx81h6iKRHp1oOqZFzA4V82nfT8LJlPsN5jl0zZ4+KPMhJNacvw5m1vLYUNgcVtRbX2ciQTlPROhQZnxKN7os+NroQG1qC3vnOPpKSaqK5yFNGkTwKVw/83IaKYig6XrI5GWrw8N06wC7N3o49QHkmiMYYkoMdEnwiLL1/jpS089clknYKKha5KzxJNa5hhUzwUKbnDp6+7CBhL40mQ8S2/f/h94mO+UIFpAtp+caN1UfSVnuXhrmlaaDzOfuRFb/k3CJLxu8dGLrZWfeFMOUgSNkxs1Q0FE1g073s37SefUhKB6U8p+f5Vw/j3axvVf3C+b8nFPkHUcQMdklPCV8mrUZ8IuBjkqXjgaEGuxMFpjgxWVcl1EqroG2QquNYbCCdU8ZCPdFtInR7mIA9U4eltSITywSW0zUDqCbslWvYDKXSzIGGqlE/zPN4tXTYE66nrzbzHmmX95OfmNSmcYBFst9pVLFoXnPjbwLQirpblPnsOWfPcKVu621/VYC0hzrZSNl1lKI+qW0hM1E4Wr+wRp75ep4gcZbOOWzvKweeOt7384jcVFPCX6jjSvFhwX56icu8zGKZ5CEg==
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:14:25.1467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e35597a-a91f-44d9-9755-08de5a682f76
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_021433_179321_87024E1A 
X-CRM114-Status: GOOD (  10.74  )
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
 arch/arm64/boot/dts/st/stm32mp211.dtsi     |   4 +-
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts  |  25 +++++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi     |   4 +-
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts  |  95 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi     |   4 +-
 arch/arm64/boot/dts/st/stm32mp255.dtsi     |   2 +-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 103 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 105 +++++++++++++++++++++++++++++
 8 files changed, 335 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index bf888d60cd4f..9e9f7f6a580f 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -47,7 +47,7 @@ ck_flexgen_51: clock-200000000 {
 	};
 
 	firmware {
-		optee {
+		optee: optee {
 			compatible = "linaro,optee-tz";
 			method = "smc";
 		};
@@ -70,7 +70,7 @@ scmi_reset: protocol@16 {
 		};
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 	};
diff --git a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
index 7bdaeaa5ab0f..2a003a7c3796 100644
--- a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
@@ -44,6 +44,31 @@ &arm_wdt {
 	status = "okay";
 };
 
+&optee {
+	bootph-all;
+};
+
+&psci {
+	bootph-all;
+};
+
+&rifsc {
+	bootph-all;
+};
+
+&scmi {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
+&scmi_reset {
+	bootph-all;
+};
+
 &usart2 {
+	bootph-all;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 88e214d395ab..a2f93f6ccb84 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -59,7 +59,7 @@ optee: optee {
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 		};
 
-		scmi {
+		scmi: scmi {
 			compatible = "linaro,scmi-optee";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -111,7 +111,7 @@ scmi_vdda18adc: regulator@7 {
 		};
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index c3e688068223..a055d8a2ee99 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -78,6 +78,10 @@ &arm_wdt {
 	status = "okay";
 };
 
+&bsec {
+	bootph-all;
+};
+
 &ethernet1 {
 	pinctrl-0 = <&eth1_rgmii_pins_b>;
 	pinctrl-1 = <&eth1_rgmii_sleep_pins_b>;
@@ -100,6 +104,78 @@ phy1_eth1: ethernet-phy@1 {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
+&optee {
+	bootph-all;
+};
+
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
+&rifsc {
+	bootph-all;
+};
+
+&scmi {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;
@@ -111,6 +187,10 @@ scmi_vdd_sdcard: regulator@23 {
 	};
 };
 
+&scmi_reset {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -125,12 +205,27 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &usart2 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index a8e6e0f77b83..4eaf1de3d87f 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -68,7 +68,7 @@ optee: optee {
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 		};
 
-		scmi {
+		scmi: scmi {
 			compatible = "linaro,scmi-optee";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -139,7 +139,7 @@ v2m0: v2m@48090000 {
 		};
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
index 7a598f53a2a0..3ba4e6166586 100644
--- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
@@ -40,4 +40,4 @@ venc: venc@480e0000 {
 		clocks = <&rcc CK_BUS_VENC>;
 		access-controllers = <&rifsc 90>;
 	};
-};
\ No newline at end of file
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index e718d888ce21..080358b134ce 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -78,6 +78,10 @@ &arm_wdt {
 	status = "okay";
 };
 
+&bsec {
+	bootph-all;
+};
+
 &ethernet1 {
 	pinctrl-0 = <&eth1_rgmii_pins_b>;
 	pinctrl-1 = <&eth1_rgmii_sleep_pins_b>;
@@ -100,6 +104,86 @@ phy1_eth1: ethernet-phy@1 {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
+&optee {
+	bootph-all;
+};
+
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
+&rifsc {
+	bootph-all;
+};
+
+&scmi {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;
@@ -111,6 +195,10 @@ scmi_vdd_sdcard: regulator@23 {
 	};
 };
 
+&scmi_reset {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -125,12 +213,27 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &usart2 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 6e165073f732..61464076b8d5 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -130,6 +130,10 @@ &arm_wdt {
 	status = "okay";
 };
 
+&bsec {
+	bootph-all;
+};
+
 &combophy {
 	clocks = <&rcc CK_BUS_USB3PCIEPHY>, <&rcc CK_KER_USB3PCIEPHY>, <&pad_clk>;
 	clock-names = "apb", "ker", "pad";
@@ -216,6 +220,54 @@ phy0_eth2: ethernet-phy@1 {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
 &i2c2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c2_pins_a>;
@@ -300,6 +352,7 @@ timer {
 };
 
 &ltdc {
+	bootph-all;
 	status = "okay";
 	port {
 		ltdc_ep0_out: endpoint {
@@ -309,6 +362,7 @@ ltdc_ep0_out: endpoint {
 };
 
 &lvds {
+	bootph-all;
 	status = "okay";
 	ports {
 		#address-cells = <1>;
@@ -330,6 +384,10 @@ lvds_out0: endpoint {
 	};
 };
 
+&optee {
+	bootph-all;
+};
+
 &pcie_ep {
 	pinctrl-names = "default", "init";
 	pinctrl-0 = <&pcie_pins_a>;
@@ -351,10 +409,38 @@ pcie@0,0 {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rtc {
 	status = "okay";
 };
 
+&rifsc {
+	bootph-all;
+};
+
+&scmi {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;
@@ -386,6 +472,10 @@ scmi_vdd_sdcard: regulator@23 {
 	};
 };
 
+&scmi_reset {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -400,6 +490,10 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &spi3 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi3_pins_a>;
@@ -477,11 +571,22 @@ &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usart6 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart6_pins_a>;

-- 
2.43.0


