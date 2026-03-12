Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97180105A594
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ch+LX2tUTknZdFrPmisSIN0NXzjm8rAPfdOeyI/RheY=; b=2k5wgm9bI+VD+WTOPV/PwyY8HQ
	UIyIm5Dxgj1ubva7TNdY4YbyhFiCzHorFokkv0JLEEDWCCWqxsDHD8j8mTqRTANDvDxXe5WzMqhTv
	6gYZSRsRpk99sZadKd5Rh8A5YtTzNdLSF8TkBdhsP+qIHXNUCU2OZbrlBny7Vo0OmL5sxikXRuU/3
	l5CvJUSPk+tmHvsGfgDu8CMPpFHGZL+PrSRHeWXHcB6p9RzkExBo/mCEvpNiyl2wHiuFPoyzyYxJP
	7A+HX3gBxMSK/mBWfACIKcUJnGTwsmrQERGS+JhE9lWDfl+/2L60OAgD37QzhWtBJ39OAkhvYC4Ws
	kccfhlQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fCu-0000000E2r5-3TiP;
	Thu, 12 Mar 2026 12:32:04 +0000
Received: from mail-francecentralazon11013063.outbound.protection.outlook.com ([40.107.162.63] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fCp-0000000E2qM-19Yv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 12:32:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7i2O6dnODKDiea2GC/WLvF4gyFRvEud4zivkH4gZu3G1DAhCV5QIlPc1T9X+VKGvlslLTpsFjJjuKiHmf2Kca4fAsXY4Q+WSQleAP5yV08L+xQDtfAoob70dFgo39UPtGI0V4HvGbzrMn2yQLqDOPZc1rZnrlfUcJU/HhsVlqwjJGpD3SlDqUdloUiW40ru6EE6WvvBEDeAHdgospIER3BTrqROTmNgas1Nyoqw2BsTL74VAhiG81LEdlysJphqFtBaDbvFRSUxJMPkIp4O1C3GO9xELl2+CUvet9JoPN+6OttG3Dr3ZR8+cKBIfZMWQvwereda+6B+QcJUk7hUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ch+LX2tUTknZdFrPmisSIN0NXzjm8rAPfdOeyI/RheY=;
 b=LgQ4Ep9D1ThZ02CJw5GAd1G5VVJW4JcccVu//AF+hfiBwMsoue4vD4gNBCcevDPewKOK+AC82RVfbk+AXoQ8Uxz1LctD/CX4cOyZ2daIYQMsVP/xfGG+rOXIVrrjHBw3iheqlFvtG+UBwCoXaKTomq6ofMtHavG7R+Djw+JwRKBLpWxxCBKJegLAhaM/ujyqN8wJZg4VpponBnPi5Yh4QIQYpkTVpq0J3Rj7wJp8FFv6a+o6vhT00oiHOaE2yxR2/RnKJ1y95Of7mW29F3U3+FcEZeaek13VwuyrxbouxQ+DzfE3QCIXnnZl+u4yIfkZc70wlG1rLtfWfBjmnVmNHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ch+LX2tUTknZdFrPmisSIN0NXzjm8rAPfdOeyI/RheY=;
 b=fH7ReqYvaTiC1Ay3vo2eDE4meaW2jgRIzvlV8FFPszYozcSeX1IvFSy5WjDsPsaPiVGhVFNaSkspF6jxjcZVcj/uof2EEf3VGbRUk8di0RlrYU+67UEeYZsI8ChONgvDuuZlkW+DzVHjjbdtnFctdtf/Dl/CmrJ2crZ0CqK6oGsjmkNB80H4x3cDrTT5IagLgwSrKxbLiE1jNTKlOWtzIP9CwEkFkOz67H6j3fiaiWhKGuw8K35gR/A1FYqEBkkp1Th4u1MWR5rRHOCxFWQZw2U6f+rr4fx3VVEC/bJEZ7oQPi6sOwoh4WFftgijvmxjwFd+SQFFQY/Qtf0NefsAqw==
Received: from DUZPR01CA0283.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::17) by PAVPR10MB7466.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:2f5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 12:31:51 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::53) by DUZPR01CA0283.outlook.office365.com
 (2603:10a6:10:4b7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 12:31:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Thu, 12 Mar 2026 12:31:50 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Mar
 2026 13:34:19 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Mar
 2026 13:31:48 +0100
Message-ID: <6259ef49-4f16-4e0e-8559-58dc9b156bce@foss.st.com>
Date: Thu, 12 Mar 2026 13:31:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ARM: dts: stm32: fix misalignments in nodes of
 STM32MP1x
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260304-mp1x_alignment_issues-v1-0-19a8013782a5@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260304-mp1x_alignment_issues-v1-0-19a8013782a5@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|PAVPR10MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e952bc-899d-44ff-6654-08de80335605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xQeCGx20opln65vj7nVvZ4XP6e5HZ/a0Fu9MKI/GIXrCRtuy1qcDAFEwDp51qsEQaE4Kj0kutmyP7I9vCIEA2LChBEY7pvjtoK4XA/yyyG9UXfqeG9pVqU9S5Yi9485Ew6hqCo09KUAwb+6UdrP+0rvxof6Z6Ypel+6nZqWYQ2U7Ultorj9VfoFIAy28CVrjzMia8rql2UpSNdosVLfXnn7f/IM5GeImH/MpqNV1MAYfPXyKsbrT+kS0EsrXroHGp77OB6RUkh+vcR6BGBM27Oet84GHov7CVxvu2BqoqK5YGOTyXHjcVXGRUhWyayEGC49rkAE83IwB4DwgXZ3ZDzJCKATwHjZrLvcZ2iPKSbh0CuLtgd2lBIKFoGt5JagdIQUyBBPNPBwkV7f4c72Xv4QBxDJnitm7L4fu0fxpdh4gQg2Vqk/BEGHayfnWG62vasA+c05IiT8W2HDwP3wWZDSoGvoeHf5ybPLrDxmzVC7W42JEcjzE9ChsvgAcPAoV0rA7i3EX/dE9NvWFtsj57SgH0BPdS7pfdSwndKKCIGxuCKhExFxZCdpCs5NuMY8bMyCXFrbZywhthJXG7X6YU/+mOlQ0UvzowE8mLlSDO5rF+YTN+8TBsZbDyO2t/5AtWu5Ihi5HIW898S9yK0vKjmhSnuDvCJzQjpJewJD/azN4Qa1iohT30S8xHiU5gXQFdlzFHEJe52NiIfOYbsl//mWa/MDRhu96eodc/9maNBz0iKyAs7rhqsMaBUIaT8Ox8hUcud3Q7QTXvvH26ma5Vw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FxdAjMQdr9zPf7nOpIvQAQDAWQKozubDRn8HzWFaUhbHUOq0wO2Uk4xLvFud73pjpRjzGt4IV5YSue3yaxNUbTXKx6aVGJxfpVbKGSZ6xTVjFM34PYO5iIoBd4OReRRnwipbFw73f9i7W/j3n3mM2IPlpvZXP5F0NnXt2o6LXLl6afJ/f3cRsFM+1nUmwgMLEzUXd4cutPvC39ANLxNyaaySdS6aA/aCQ5jxc5DBVDZD3b/dmtMTaCGqdJLwVx8+n3HpK+E+IW1mxJQzz6EU2xOQjEmrs31SXel+1dFQSGO5NqExhkSy+b568MUT1xZ4PweLM1RdNN8RbwnqvH+Oec1PVBiI5XpdHzWaQlDpTfPm844bTsL1wRhu9KmKVlXZFloAJuNWW76nGmmlwcDj+2ZVw9W4ht46KmKEvNijeQ2Bc7kXpHsqNP/kR48ZepDU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:31:50.6909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e952bc-899d-44ff-6654-08de80335605
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_053200_975922_DA6EB474 
X-CRM114-Status: UNSURE (   8.59  )
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

Hi

On 3/4/26 09:06, Amelie Delaunay wrote:
> Since the ETZPC system bus was introduced on STM32MP13 and STM32MP15,
> misalignments have appeared in some nodes moved under the etzpc
> parent node in stm32mp151.dtsi and stm32mp131.dtsi.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
> Amelie Delaunay (2):
>        ARM: dts: stm32: fix misalignments in nodes of stm32mp151
>        ARM: dts: stm32: fix misalignments in nodes of stm32mp131
> 
>   arch/arm/boot/dts/st/stm32mp131.dtsi | 14 +++++++-------
>   arch/arm/boot/dts/st/stm32mp151.dtsi | 14 +++++++-------
>   2 files changed, 14 insertions(+), 14 deletions(-)
> ---
> base-commit: 291f393298f72091490dfa70ab4a0ebdbb4c7d7e
> change-id: 20260303-mp1x_alignment_issues-62a3fdc37d03
> 
> Best regards,

Applied on stm32-next

Regards
Alex

