Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83942C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1U5vY+9Tbvon7+bjCazrPJZmUHW5C0e1GwOQvzCKrOE=; b=mbP4If45ff0N5Jf05CcjS+SR/L
	q3fyyYb/6xYsCDG6VE7AVBtEPoPbf+1UKK+2m1Jbaw6xT+W+BgLqyYOHgKIe5eItWkhrrgq77zYyd
	liKvCNgq7Ja90rgLUgHGjzEk04EKIPGn3/GILCgTXDskG6onVO82tSAzPf7t67szlefJpctdafW2Q
	r2N2kIkhXfmybZm6meYFuQRUrXYBc8sOroPzRIWeJvVoL+Ymbn8BDVZ5g+0go757P1sjSTDiiXi62
	P8vwGuCdETL/XUzv3rzES2bRALr/K/FAe6/YZTF1oLaLqtPr8LAjL/0UFpf3Oh1n0wjW+XS9EMQwS
	InudliDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6Sc-000000011CT-1heQ;
	Thu, 20 Feb 2025 13:19:26 +0000
Received: from mail-sg2apc01on20703.outbound.protection.outlook.com ([2a01:111:f403:200f::703] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6EG-00000000wxi-0NPT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 13:04:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bExzj5mylULSkGxTrGg9Sc2f8E48Rw4/qJ6RJuXqG1IPl+HmkZyT7jItfNei5bbMY982u/llKNbNtsV+VTiBazfYHyHF7aNBWy8LayxXLslRXVTrHiC8mBO9lv0GXxFqAbzXOSw5BO2NYDKG12QerSf3CTxgRt827eKASJt3LrtwxkShPkdBeOqSfnfd7J+rdxR/hFRxpizHe4dF1bsB7RCFbmTbINN5q7Z/EyDlS0smqi0DkMfnxy0HodqOM3VXsBfRIqTG469qbDejqMImytWWDRflOQ7oJy8r7Ef9mIrM2C6EN67kwIEmDupi18tiAbude3Lhv/PDpX8ffdtHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1U5vY+9Tbvon7+bjCazrPJZmUHW5C0e1GwOQvzCKrOE=;
 b=UcicdJ3XighkdnqiQLy/v+LFfRKLlz0Hsm9EMwhS83pb8+ELxQd2IAep/LHWS+vLVCz8GqfcTXFmTvk/vANsLldb89BMxmN1ECnOepchVqdfLI9kxsihFE2oR2K5BBEnZhMOKVDY/UtXFhyDpHKn0xgbDeG8bC5XCFyC1yBVBD64QJ5mjgPArsVFnEaHHdukT8xjudRBJvJ9Do+FdvZU23XE4RfXcv1J+9ClGj5Og7YSkeIiw02PblF3N90COvM6XVyjDhISYP3hOzOisVhHMWEipYEmxaITUqmhMSZdMGsJ3QvdqzSxcFARzlDHYjJC/RI1ABNCDvSiDUjTXP4jvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cixtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1U5vY+9Tbvon7+bjCazrPJZmUHW5C0e1GwOQvzCKrOE=;
 b=vDqX1vsaDaLm0VwUZDCaW3kNpZjU432k+hQfn5Ub1mb5wfYSsKtxZ8oZh5/mPqtrEV9v97uy9JHMZSPJ6LQwAuQFPx6LN3sPeXmN7GvJmPKdbMHdjxiPCTOZEg8I1LeG+RIK6S6teRBOFlkhPvzb/NuonxpWyYbIaYpt1qZcK5Tcl6XMXmWmAbiZ9zufSgZwPXFW9iXykzRM2QjrT88VVkOkayF3cek1yUEERPNHICuvgnnc3cKHb4aAwlRiLwdkyOmxgbk7xlDspmplTctM5AxFMkRxmb5p7XgKy1b/WEKaP0vTB4WxyQybno69StNJ7iu41US1Q6vUaqw8knZ/sw==
Received: from SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) by KL1PR06MB6257.apcprd06.prod.outlook.com
 (2603:1096:820:d1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.12; Thu, 20 Feb
 2025 13:04:29 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::4) by SI2PR01CA0045.outlook.office365.com
 (2603:1096:4:193::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.15 via Frontend Transport; Thu,
 20 Feb 2025 13:04:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 13:04:28 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CAB16512A743;
	Thu, 20 Feb 2025 21:04:27 +0800 (CST)
Date: Thu, 20 Feb 2025 21:04:26 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH 2/6] dt-bindings: vendor-prefixes: Add CIX Technology
 Group Co., Ltd.
Message-ID: <Z7coWuT2vTbCpECf@nchen-desktop>
References: <20250220084020.628704-1-peter.chen@cixtech.com>
 <20250220084020.628704-3-peter.chen@cixtech.com>
 <2955e9ad-f97a-44b0-be9c-d6bac90a8f9d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2955e9ad-f97a-44b0-be9c-d6bac90a8f9d@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|KL1PR06MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: c4e86911-2131-4297-862b-08dd51af1bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bClRmsfVsINuCph/roynLSAQNyQum2z2Z3wX0CZrE7vsJ20zCS/6PJhstK/y?=
 =?us-ascii?Q?8jqZqlnqA6b/pEa+ixB0i50WUvELMIoPlJv5N5qPhL1S2GELYoHLW2O3lD9q?=
 =?us-ascii?Q?KMKz6CJ0IGhb9VJugxjGC6KULWXGfiuRzqov5n5ipB0Vdd29GcbCcOskLxAc?=
 =?us-ascii?Q?mXeyQdyZpMBk58hGcs0Dp9ptEUOO/KKKRZ2IOzT1jmHySpH75w0gdEMXEU0R?=
 =?us-ascii?Q?uBKskkGMCug9D3JYTRwFboZIHrRPgtCWFCzF0vAt1DH/vEbzlFycWdHXs6LP?=
 =?us-ascii?Q?rvgpJqSLxyNAx/AiUG/g8O7gYRftYetvaummG5MS59cTeqHd+gM8IXLhR8c7?=
 =?us-ascii?Q?4dHKsaaZZte9edKnj+6q2OkReQYKZVWDTuYA2Gha/FFDBQx3ra+7sQ+eFqx1?=
 =?us-ascii?Q?PInNtgM3ws/yrfyLJMX47A1v7L2wpt4CBN8E8ZMJ+w2xqYoNsgPdvmDDrvhm?=
 =?us-ascii?Q?ISN2PDXF84tvRdgCd77WtDFasW7crvfWUO6PqVV1a5kdx+xLcOcAaO2El35B?=
 =?us-ascii?Q?a3Iq7W69EsASbfKMA1q6IuUSsG7iaEO4QBdqEDTv1J6O5QkdterfR/NVtOP6?=
 =?us-ascii?Q?rIOQqmhYf1PxSgGs6k9+g+C3QHSAVOFkOXMBzZX5g5uUvKwgWl+Cy7DR6LrZ?=
 =?us-ascii?Q?5NWkhXK71gBszNq8bMjLmnYEIrOzC73euYDo3D4BNQ4Dhr0SyXdR4hO8BMSi?=
 =?us-ascii?Q?qhyUEKkM4MvYHeUQR3PVLB6KlKiQyjiyPIba0/9zfkWJiPNEgDiLS58e3mL/?=
 =?us-ascii?Q?l6quaDa1Gy5TPY1rPYwuQX6OdS7l8EXSk9r0H+yAJZdnQuFo9VoqnLx4y3im?=
 =?us-ascii?Q?lRsuxrSi9N1OCAHHgBGDww67l+ER7YaQtKSV/vvTHuR/jN1PYkkeW0MkObg/?=
 =?us-ascii?Q?aDSVDvo+VtChYo7QxxtUcH8hTXNz8kQYoZNXvyjKKjNYxU14UxDg2++RIYXV?=
 =?us-ascii?Q?EFWEDBJ8O+jLoYvE85nLsNTkPsN+BoG3IU1zHpoOvgNwjUbgAub6PsgM8pbM?=
 =?us-ascii?Q?fWxvGoAv6NHwjady2cBBrYsKsRKqFK+xYHOOEm+AjzIC87mch6q5KK5SBHDG?=
 =?us-ascii?Q?g1F76MZkXt7houy1O6RoflbkBKmDN8Sklkm1coUNdeHAh5upylKsUdTnTJzY?=
 =?us-ascii?Q?vhM6zF2S/vtnge+m2IiVQNAv9KraJVLAcsppjc79/q1kok557pC7lokulcWd?=
 =?us-ascii?Q?VmqPVjOjlPV4/svx9mlD3US/lwGDu73bn2r9O82He1q6Vho7QhrA02rGND/j?=
 =?us-ascii?Q?cwTFww/YNyQCn1hJXTkiYMXAoxIzZZJoU9fudVu9zbdBH/DvceRz6VqqwOP6?=
 =?us-ascii?Q?B5co7EKaJXYJfrz+z9ceuIztvP1hcFFcU+6ySzddQd9J4U8/SbEXEC9MRUqV?=
 =?us-ascii?Q?xBynmWPPo+SX7wZd3M1DcGF9MXj9zm0RcNDPudMhuShEd7KjrcNLxwsZkMvj?=
 =?us-ascii?Q?ixwIUDHVx2M=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 13:04:28.4896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e86911-2131-4297-862b-08dd51af1bf4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_050436_129710_7CD907D9 
X-CRM114-Status: UNSURE (   9.20  )
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

On 25-02-20 13:18:07, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 20/02/2025 09:40, Peter Chen wrote:
> > CIX Technology Group Co., Ltd. is a high performance Arm SoC design
> > company. Link: https://www.cixtech.com/.
> >
> > Acked-by: Fugang Duan <fugang.duan@cixtech.com>
> > Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> 
> Please re-order the patches, because your previous patch uses
> undocumented prefix.

Will do, thanks.

Regards,
Peter

