Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AA0C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Bo1M70aVU9uB6+S9+3myvlKh6FXn1oNOX2U/DuumPU=; b=f6aRQjmAZswQrYx8KjW/qSNtJW
	dwtq0pyQxbbOmm0lcKjR83hQef9UOUJME/jHIF1mkr081szJjF4L/8dktRpG9qzY2Tk4UuFrgKz9T
	9Pq+QWen403Ml+6GAKWBjQsEOWitTybJ/qFJ61UxSwirQ2wxMSJhWJPrN1yEMDzmDZ/go3yJaJhPM
	zbCJGuYXEGGSFcgCoyaAZbZm0VaopFBonq0hzjwigahd23BAKOSzx3eF918LtlI+mhMGksphSuyg2
	cJ9msvQc98BiFEUW3YLloWTNmBiEd1rwwWckHULWIPI3KKLGWl7ZAjZ1lGbVlCou1xdBN8tLhto8B
	MnX7tL6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhl9i-00000005FhB-2jUr;
	Fri, 01 Aug 2025 08:30:22 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkpA-00000005DLQ-35Ot
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 08:09:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkwmpNmE8XVfUKfybHyfX6onetbYD76FneRlPLvHD9dtv8+D0OZLgIJN1df5wKe8UGdz7wCSQ1BTNrtg8HS+FWsOwZdFA+/i79kc5KsU/xUhg/ljxa4MvX5YDGbYOgqOzkMaUr5GZnPD284O1lo1l9awQpVpdx7sgDvKxYtD8CP8FNAAPq1Z8eUsuJO0eL7Pl5SmiYcSDpHrjaafVKbtGAbDt0Dc0XczMY3O2Rw+TJGif5jRr03fMQ3J0Yzx+NLdjDfQAfM+xPc0YU0/YKH2AWN/tQTablZEroTpWkFXVlizX+nqfRp4JVsPi73FlyzJ+ZJpPpCfBFiy+iuS0TvIGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Bo1M70aVU9uB6+S9+3myvlKh6FXn1oNOX2U/DuumPU=;
 b=Bh3znIl5aimyPQK8QwVWbzeOGMKZZTnIGQOR+X50jqvcOZb18A3rVY9gi6ChitajWg7qvvOuC5EopPsGcIFEmZZw5LW5WWh1FVBm05hYSLyt278WMF445z8+tTGjlFTUxzOILoxAv87POg/bf4wiISpDq9WbGAWQszjoBW/TB/qP9KZT0s4RGpk93udNsLiV5DFZnoLYtJkxI7NE7zqzRyRrwwLTDemLt2YL9LOZt5TA1bdxzaOoYUQNuDR2J56TtN1ic8s11FTDH8+SmwuBO38CpWb9Q5zB0xZAPcFifF1w8cU3eCGAXGqqPAoM6Z1PctgZnxFFG4c8mf/k5CfjkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Bo1M70aVU9uB6+S9+3myvlKh6FXn1oNOX2U/DuumPU=;
 b=aOcQj0RT6sN/nMQruVV3Z6ETZ1kYil9RLu+0D0LG6rUAk4ZkTvER1/46cwBmVwkqNNs4C0dRfop1I6gNaqgHgSWjWaGDX3N/zsDlvhRBk1KdkL4jsK+MABRuT1wsgzwu0pzLPue6cUL1WoBSC1ZYTaCV7rFWXVp9s2xxy8cGFCeKiHQSQZZhLGk9nij1xNsYOrR4dFaGUzj9PbJ6SdbVB+jKRPzD2gSQHoLwXy1F69kOj8jKp8/fRitjg8lN1Iq5rj7w06LguZcszFSeYkCtRlWiTHiIiuy2BGeillK8hzw/y5CcbXzHUb5BkCEFY9maoY+rd58UmuE5duQk+WYiJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PR3PR04MB7484.eurprd04.prod.outlook.com (2603:10a6:102:8d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 08:09:06 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%5]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 08:09:06 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: krzk@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	festevam@gmail.com
Subject: [PATCH v2 4/4] arm64: dts: imx93: update the tmu compatible string
Date: Fri,  1 Aug 2025 16:11:19 +0800
Message-Id: <20250801081119.1999298-4-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801081119.1999298-1-ping.bai@nxp.com>
References: <20250801081119.1999298-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|PR3PR04MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ba0373-2e6c-4e3b-9540-08ddd0d2af50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vXzipq4tiN7RJisUn7QJQkI+ev0GhusiDQKidPbCbPbEHxoNF+7Nw7Jy6ST1?=
 =?us-ascii?Q?+e58smWFS+rInbinMRMtdnpvvQEs6Hk6D2pdm7Yx7/cSKb9+WGG40X6y1ZDe?=
 =?us-ascii?Q?2p+JnJIO0b5lQiSIfQsGac1LjrhyJ79tId1FWk+MSDAuq9HvLD4JWQ2D3OtL?=
 =?us-ascii?Q?g+XQZWunTVo9pS1gYjzHldXxXPxGuu+nhMqg+ER3p330w3U1jhc058Oq1ykH?=
 =?us-ascii?Q?QTo2/4vm/NwPpcL3WTe+3GC07SBAGEap74WKKc9Z05a65CWG9Ii9/Kko7iSM?=
 =?us-ascii?Q?yaaLqnHQ6CpAf6VgcPEBR+EzpqVhOIIlEaWa7dedmbChvvrnd/sHojWZn+Jc?=
 =?us-ascii?Q?KXYyBodPcfnBA+eM6WiCem5/+7u3ev4pHP454xYNZN29CPROHUjbyLoEBEB+?=
 =?us-ascii?Q?v2wzOGtR2g6CnFhtj6HHqAisL7+uKcMTJziMvAZYsPk3WU6Yx4MeTRwV4Bt2?=
 =?us-ascii?Q?Zaenv1XucQJur6HkGmJQ9Av4AsteHZgMlKjTMUp9ZJbCVBKOo00EQ1XDawes?=
 =?us-ascii?Q?Oho7c2O2SK0yPFugErZ9P26A/cbvtymRIx9gVTlA7zoOiQXO3k49BiDSdv/o?=
 =?us-ascii?Q?e4nK/RBAxB3nxvJve0iLHwWIMCmUGOz84x6U/nh+K2kuH4YySspa0gi2QtxC?=
 =?us-ascii?Q?xr1Y5ctVGlZ242W8v2G9ULd8LGDa791fjF8wKYcXu5M5ctvkI7yQX+++zVkV?=
 =?us-ascii?Q?eG80xcdIu8h/QCv1mMVifQYjqOnJb1Axpc4ZqktM8NjvjEKRYBGIU41xAJ04?=
 =?us-ascii?Q?RbdTTSJfIiAhKRmv+a1uP19ap8fer8esGnzYSQgARn+NlZ9R8P6qfiuzIvG3?=
 =?us-ascii?Q?EpqYtDIXlqxkMVGUVg1DBEcCKXN9Drv5iZ0Bl3teXEo17PW9CSYYhDMu5vA0?=
 =?us-ascii?Q?C6SU+c1m2xP4lRU79saDD32LcbcU4KvlQmptKZYv42eOiEiEj5zmF+ftJ6JI?=
 =?us-ascii?Q?ZZpdLFT6sF29Wy6LjPkR/oJCz9DJeqOJcVt0lDdhPsyQ7+ZjdCghDOynPfvA?=
 =?us-ascii?Q?N+1BjVaJMyM1qE+qbXJdbS3dLksAv/Vm7g7sGaYpakLDIf3UnYU0Ky5rpCyG?=
 =?us-ascii?Q?3+FhnJkEQiZl6ItrlseeYx5DYS7dPNKKriy75uqldlIN8mgHE4WnC8m3Q4zv?=
 =?us-ascii?Q?a5L8Ipg+voNmaPwAHgYyYBUWnsL+45o2HRaeAiw7bfXZXazpjKD40L47gzzk?=
 =?us-ascii?Q?FVvrG3+yOS91d5eLc8hUkl22cDxDjU3Vm0HMBZpn/BWrQFc7ZRfJP0B7E6IF?=
 =?us-ascii?Q?5Wn0n3dEOn1D2im1f1//FeTEqsPLNvPWpDkWEc7DTi49RbnocSKAuDovK3vP?=
 =?us-ascii?Q?vFB8oDyRxnJGxWW9zz9Ci24lkRIm/JgyPmO3+K25mxCgIkrDpJZ6S5u20/p8?=
 =?us-ascii?Q?h+rUX5sFiIsBRqEsyfoY+JgRXAiB7ULwmKvRHC+pbxluP40VoRtTJPskSZz+?=
 =?us-ascii?Q?yiAUfTRe57mNYuS3haWy3xXsiL+XEnyKy1vmg9bche7/9znwlwZoDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oDkFFbhUVQpM5WJE/DYNJ5EH7JBDc9BhtxOdnB3GXLdd40DuCjkKPUMP0ePl?=
 =?us-ascii?Q?FcgQNIWProp+wqAobTVLtzHHE0GGH3sY/auFhPmgko8k9yALYD7xQSLErwhb?=
 =?us-ascii?Q?M9DwfWxl+xYVIyP3e9vz8cP8pRqs3SudQFEe9AzqyZK/EstPL4n6gorTvAGw?=
 =?us-ascii?Q?2CN6vXuO5N5tHIY6ik3xVWp65sqIx+YsQ0b0C38VOppHoyugDpkMkFDRzVEF?=
 =?us-ascii?Q?oRLc2vU1mJNXUD0DQmQCQTpskb0OD0Jw6V3fVvGeEzbkOfLdQqr8j5B+8b97?=
 =?us-ascii?Q?TWPOpVra4ro9JIxtUQ68y7N+1XYWB57cy01ml3MNoXy/3+8wUJQ9fm1C+t86?=
 =?us-ascii?Q?rffCC49WoSJEjY88646QcMqX2r0JAWs4N75qTUBPexIYg8JdfJAdC1E8NM6P?=
 =?us-ascii?Q?x1k+f9cRCnoIswML+WqGZEnZHKqqvdK+9/aha3rpbslt0p0ACQmca15kXWIs?=
 =?us-ascii?Q?X3jXw/3TWtU3H6hv3a7CrfilnGsS5aV8NXINoOmxMYaZSl5RV31AV92TeEmr?=
 =?us-ascii?Q?3tnYOutwc/u6kjZw+bS0iPBJ3uBzmsv+RSugzX7t7i4abhz8P+CTSBMq/xV4?=
 =?us-ascii?Q?Pj/PGH3yktDULfzNdwh8L/TT8fxKVTEell0t2V0XhvmrEi0jeww6k8udxPOL?=
 =?us-ascii?Q?9CfN+LnLtRcHtyNNFHSP35/s1cgUzkztOfmwdAos05o7K+QGYIsrJzrmdIfM?=
 =?us-ascii?Q?pag0fVDSv7p6KELd/ffeq6w26P+nYzf6clKjJ4echTOh4U8P2DKdtaiZk8sT?=
 =?us-ascii?Q?3l3gz1qUt6orv8TT/G6fHHhMr70zS1d3tjzAbW94ksWAIvrGH49Eq/3rGb0P?=
 =?us-ascii?Q?6Q0TBdu3CdhUAE3o3B75W8G68RNkplg7G4F8YdFz5Z+ANGhEKTEi2sWYlWoI?=
 =?us-ascii?Q?h71bTbbQQ2kzi8JBWt/6w2VV9NR7SRcMsoKL1FGk7hHrfOg8SXCfqTveizMD?=
 =?us-ascii?Q?XiutDgwQ9G9+BmHaOwf1/npw9+AKkiklrd3TbLlMRasNTtymXBdQcbgG9ko/?=
 =?us-ascii?Q?s0iK9ZZsiJRUSvZq89zRr8FNkTVsBDVMcEaHUTynJ26uVWxqTGHPiJZA3Bb4?=
 =?us-ascii?Q?pDpZGJeV2QIcxglWZgg40QFVRjCWczBKjxia2dTwpr2RYqCuTt2HXmN+btPP?=
 =?us-ascii?Q?gB8OYsBOkRSuLiRXiKsSSCe2h0dEzvjPg5RCaqs7Vx0wCxW91wEa7Pnc0d+J?=
 =?us-ascii?Q?rXKFsh5XXD2ASTCFgOFvIKf6P0Y/YOD88qDI3XBD4EjoaCSQzjYnGD1wyCr6?=
 =?us-ascii?Q?WP2KE+mCLlsyQ6Sd5hvnWoFzn+Rg6cajn8hkDUeFIBFf5utoF8iNDxKeg2JS?=
 =?us-ascii?Q?HuVRUSoMvXzRwmxXl4okdgGbAwLacKe+TLPHEE8TfCiQJdbdYc6rII7RAuHG?=
 =?us-ascii?Q?VY/PsYaMU/dpwwwHCXVkqjgQE2UkstAYF49lMVe1nmdj3RBhtTcCGbibODhN?=
 =?us-ascii?Q?Rh4nINIFbv/iXArehwbmKChVAnvkuq4XzbHysU+AwgieBjamZ64JE6DR9HbK?=
 =?us-ascii?Q?KQtPw54EoPpKfIAiHHgXW+2NJZv4TAYsbo45v0v6oJXhUYU/caMdQWhgweVJ?=
 =?us-ascii?Q?s7e/21ZCcKrynyZ1c8gH+LdSq4hmF5n8ZzrPDqeR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ba0373-2e6c-4e3b-9540-08ddd0d2af50
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 08:09:06.2939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EN888rmOP12laGs6lLsH+jmfTbPZwVxgKp0iKVRUlVt5g/fXcvJ/3S3Go2Ebd52BstKcr1nTqOJUpyyxirTxqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7484
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_010908_774683_A502C0BA 
X-CRM114-Status: GOOD (  11.18  )
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

Update the tmu compatible string.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 8a7f1cd76c76..2f1db9cbfa4e 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -544,7 +544,7 @@ clock-controller@44480000 {
 			};
 
 			tmu: tmu@44482000 {
-				compatible = "fsl,qoriq-tmu";
+				compatible = "fsl,imx93-tmu", "fsl,qoriq-tmu";
 				reg = <0x44482000 0x1000>;
 				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX93_CLK_TMC_GATE>;
-- 
2.34.1


