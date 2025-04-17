Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC5AC369C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 06:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5Lfjb371j0FjblFdrtnEyDw/a2+VJF+7tPIr+gl1no=; b=ZJHIyE6P4Uo4t2w2zyw/v+VHud
	JW8K+GsQ8QHubO662wa+680pUJbs6Jrxyxp22Dxps1VioaJbBCQ1rCMxeu1ZrBZh0oVNryFhwDO/B
	fbDpQjkJ3qROI7971AfRjTceisraiYe3gQcJC0wNzWrMhyrRap+NsF/5iqO2Ysf3MEu7PAQfjIuFX
	WaIgIuubpGV93PQpSFLKaCCBs5mrlb4GwgMlcEaj3NWr8oEOBCoD032XgJBOSwcnv9qSmOrPlBh3t
	f0lXc0NU4/xL7dvwDe79q0fQvb0sUPQfteKMfKvTfJ8aln9ttPs5G7ZPIBq4M1pH0Pe70739ync/w
	Jg4LNCgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Izc-0000000Bwdw-2oK4;
	Thu, 17 Apr 2025 06:45:00 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ItD-0000000BvaX-04Dn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 06:38:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2ZQle2JO7dKod1oKtyc/nPa3cV5EwHIJvtycTyuTBnAriI1PdZRsRgXZ6fLb6z1a00hT6NIyd6+BRzZBAamyPAulYvznMzvU8BKGWe/6Qkj0UR1UFSTq3AGyeztpukqnXMlTgMH1UCsPx4WSxuIzSedwj1Fi2V5HRsQno5fj3vpj4gn6dHAOvLyagomomxjyL44bLNGjkSqRXJrMbOY4LBefFmtjQ4y9sHLFKyTub0WO237QA66s70rdvt6hEgmEDxt6oKjRVzZ4kYv0dmFOcldQbuQXDNWwnKy1A2R0DrLU1/rqOgO6p49cjCEeDvlPHwGvoGTeR/vucSD/p+RUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5Lfjb371j0FjblFdrtnEyDw/a2+VJF+7tPIr+gl1no=;
 b=DuJOJFSarmfeRMoWzh7zBQl2Tyj6T1poqUn2+ra9UnN1nrYUL4ojZNLt6kNg88Jr5lqVH9+MpD5Gs+fmgSux6anMtFxOS9wXloQjaKr4gXQwmg/9UMUAjxaFp5VIDOrZGm9PB4LCbRxvDPUi9Qzx10+GlEk5KXi3Ssxno3hgLXt9OMYU3IR6A3eo73KhwzghIWWWFVwcXoN1kB5qymn/DfVEvakaLZMAGqY3zRhJRNjFR5ByssDRJyC8bdKKbd7fo759Is9YxO+uPH7u1LRK5F6r5ORhVz0VTdF/0XJ1H08cSNGn4pLs2h3Tq/fdcexadu7vythxddbNe44Kim6y/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS3P286CA0035.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1f5::8)
 by KL1PR06MB6591.apcprd06.prod.outlook.com (2603:1096:820:f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Thu, 17 Apr
 2025 06:38:18 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:604:1f5:cafe::1f) by OS3P286CA0035.outlook.office365.com
 (2603:1096:604:1f5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.36 via Frontend Transport; Thu,
 17 Apr 2025 06:38:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 06:38:17 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BCEE640A5BFB;
	Thu, 17 Apr 2025 14:38:16 +0800 (CST)
Date: Thu, 17 Apr 2025 14:38:15 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, jassisinghbrar@gmail.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	maz@kernel.org, kajetan.puchalski@arm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v6 09/10] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <aACh17QpmWQljCZl@nchen-desktop>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-10-peter.chen@cixtech.com>
 <cef48ecc-94b6-40a0-9f9c-a616814878fb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cef48ecc-94b6-40a0-9f9c-a616814878fb@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|KL1PR06MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e810cb7-4601-444e-1233-08dd7d7a7032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SOTacmrnFKxcwPoaE3JugXtXJCgodgynrq9OP5ZBdwhXMoLrMEVIWzd5cm6L?=
 =?us-ascii?Q?Zj0ITkh8Hd9PCkYr2jEtqBywV3oAw70mbVxUtoAjTus0bkh/KaBnTf0s+xzE?=
 =?us-ascii?Q?HV8VvhhA7R2HiPzVeHeimTogUPU0y1GV2YBl1SM3AA9W93sjdajtHwa2BgcB?=
 =?us-ascii?Q?9u/7fX9KKmDXxVm8D/A9poMW4DzH+BTDfgVv/q5UWSgtRlgoNQnRhZ3yrr91?=
 =?us-ascii?Q?OTbN8IwvjKkEwZD8PP1SxJB1h8XryUammbOR4D75Woaz2HHAXSNXf3bET7mW?=
 =?us-ascii?Q?MIld7bOITF0eVbJSzJ66w/X5oEiRuX8IZIVXUh5vFGPhONzOd7wys8qrXOzI?=
 =?us-ascii?Q?xoYm3TIyB7T8YN6inJy6TZi4QRfaymL+usTdl0xhiuhRs3XhTUpHkOk0LMxZ?=
 =?us-ascii?Q?Z7dzL2/itzNDiwj5X+SssnMjaWipLcwqpmywulJ49AIUfX9PClykw9N7KELG?=
 =?us-ascii?Q?k4zbMxUm2a1w/ykJxMDvmPLumuZ8SZmvTsqgcbHjtP2sjyj12O8L62PnIsfv?=
 =?us-ascii?Q?kCiTKmgNoSksbOt2ahqyH/TUveCoTk8Pds0fAWvGFNPUJf0oeBN0S3oO5NXI?=
 =?us-ascii?Q?CCXNb4Eu3u9Mv0vfNaJiNYkBok1kcEt7yMBmJnIstxDNX9sdDBL0sQmAerZ6?=
 =?us-ascii?Q?9gVxbYwfFj+7UuHWQ+NH3svnSrtyZOF+ddLYXYa5RyIxIzooy52iT9cVamQF?=
 =?us-ascii?Q?jbHKVIwzJtp63/2sZuW2H8dqQTeCUjOZOHmhOWhcfS3Q8MtIdWVHxISThYNA?=
 =?us-ascii?Q?+Jqqr2K+hURvRExr2rle31R0ZZHX37mfkKS/onBCtf1rVBNfBCZslbT1GSaR?=
 =?us-ascii?Q?OxtFqMYQvYhhP8raJRXVyXosp9i1nIYOXDB5L0ubshI+20Pr2RQ/IEFetzzo?=
 =?us-ascii?Q?RVmEGzENUVDlifgtrIAJvTKUIkgisyn5S7+J0dX19mqcTB4xS+vKmnrN7+gZ?=
 =?us-ascii?Q?A1ocanh216ru2FMFZbBBMAjT4XQ+cu1YBsy6wtcqLvybyDvCHYLxXn6UQnYQ?=
 =?us-ascii?Q?hbk6bHf3xomonxPAwraGNyXwvnhSYbxuoU9PyP7MtsfG1VJBH/vyJbsQMtHE?=
 =?us-ascii?Q?V2t9hnZtz6v9OuXrQa2ZJMr/FsCxaif1ZofXQeGQ1eFxlH97tn4YdAQ4b1kJ?=
 =?us-ascii?Q?joNwJyRRRxvJtgITrzk5Gs0crwsycg75s6guPbPr0LIPZiENj0AMP4GciLVo?=
 =?us-ascii?Q?6lppzMChn4W3HLSEZxAveS8ElsarjpD8YcX0MpbM+oIIhry5Pl1z8lQC5pnV?=
 =?us-ascii?Q?Zq1X/5OSQ67l93HtgdfUTxw73h6pzMdaG5uKTo9FqOl+lJXZofdQGhTkd2kr?=
 =?us-ascii?Q?g6Gbohm2r4MPwlxEHSYR4hl/3+ZrXpG1FzGlADKfGSs+y5MOaeY5pmcNDU/c?=
 =?us-ascii?Q?v6Im1USPElSImXaqKkHWXMjlJUaM8/NmfLDVUKK8ZfUMMmfDHcLx+PFXtA9Z?=
 =?us-ascii?Q?JNoz6OenVZG0216WVg+szKZWjd5jD4mfU/FkATpsELuUPXhrwd2rIg=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 06:38:17.5945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e810cb7-4601-444e-1233-08dd7d7a7032
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6591
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_233823_054876_B582A825 
X-CRM114-Status: GOOD (  12.07  )
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

On 25-04-17 08:19:59, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 15/04/2025 09:27, Peter Chen wrote:
> > CIX SKY1 SoC is high performance Armv9 SoC designed by Cixtech,
> > and Orion O6 is the motherboard launched by Radxa. See below for
> > detail:
> > https://docs.radxa.com/en/orion/o6/getting-started/introduction
> >
> > In this commit, it adds sky1 base, mailbox, clock (scmi firmware baseed)
> > and uart, and the kernel could boot up to console.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> You added several new device nodes, so obviously this is not true anymore.
> 
> This is explained in submitting patches - you must drop the review when
> making substantial changes. Adding several nodes is a substantial change.
> 
> > Acked-by: Fugang Duan <fugang.duan@cixtech.com>
> 
> And this as well

Okay, I will delete both tags for the next submission.

-- 

Best regards,
Peter

