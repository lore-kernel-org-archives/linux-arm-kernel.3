Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FDDD2502E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 01:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+m4t+f9+I1SFzFbBRF+enypifBc9hZPBoYq6Bz/VuBc=; b=FgBH/s3TpsX+OrY6SGKhHl+AB/
	QOuyuSo+qftrhPmLJ4NTPfNQorr9hEH4FzrjKh3id84+KKmDTneEOmYQQgQL18HWyW5nVBS+In3dD
	arc9HzOEHd1VrLTVLkv0VjcVYx0wbJjQDsgeapIcCqH/b/7nrBNr4O31SJiNPWluwxMvQDDCEaZqB
	KzkPuMueyrkUFxbEedodO6ckM5BNfhCYvw1gKtaWVieTt1lYyDH9oyVv4OAaMNMqW2YcJYMZZZ2Vt
	KT+cHB+s1IIEt73bdMstJ3Bzgj5lSLBlxJEa5/aZ+zpotna5O8W8iXyB8eFr1bptx6bHl0mWIqKrP
	PuSsQqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf6XG-00000004cMm-1dlC;
	Mon, 12 Jan 2026 01:16:00 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf6XA-00000004cMP-2gWN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 01:15:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sck7uvE1OEWdGzrF8FY5Bhvr7+7CPRx817GkHY6gGBtdbMOFk3+vLNOXLMttbLAR+iY9TJ1B9kxMGBOHdCW2NP7RGvc4VaYQjZDzIu6fLO8SNmFknZKBioed+DxVtkqY9Eb5aPxnvP6Q73VQy8B1X8+s67ChbOrT89YsH3JwodTrE9UMp9c1vmgiifw4BcOzwwphiTyl26IKJf9//K25TLD4f8F+uKl768q2yoO/o8XBZRqDLpEndD+dcLQRa6+O1GWZes6jlBo3U5BA6TyN0eiRveFij2C8jg75cYG4ublpcDNeE2uai9knx0qt4e5jiKWf2F+FrCXF+OMoZCAFRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m4t+f9+I1SFzFbBRF+enypifBc9hZPBoYq6Bz/VuBc=;
 b=KFxLuK6RYfER4VDQZZRtOj1NgWDrZLLAA5VG4NKt5vikOvXcWC9lUwf3zL28v0R2PtHWG3lhbKUI5tgRXF6nFWIEVB951j3Q5QMReIpI99Xh+Sbv946qPnUcRuywq6rrJALctRwkzODmmHJIHHcOhpHLPVe3oRna15p9d7CjafCwEz/eZN24MxBdkLPTGcHw5C62eK+PL0kLEHaC/Z9G+XSLKNDVOITdr0D6Z838ViOp5tfXOAb/DCE/00dOOu0TmkrLz452no++jhRcUzcvzzs8cHyagizleasxIwJhBrxdFnFUcZO/t4r/IWR/iSRuosQTFCdd7v8Z66fXiBT2NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0010.apcprd02.prod.outlook.com (2603:1096:4:194::15)
 by SI2PR06MB5017.apcprd06.prod.outlook.com (2603:1096:4:1a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 01:15:30 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:194:cafe::de) by SI2PR02CA0010.outlook.office365.com
 (2603:1096:4:194::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 01:15:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 01:15:30 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 960AA40A5A1E;
	Mon, 12 Jan 2026 09:15:29 +0800 (CST)
Date: Mon, 12 Jan 2026 09:15:24 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Gary Yang <gary.yang@cixtech.com>
Cc: <fugang.duan@cixtech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <cix-kernel-upstream@cixtech.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: cix: add OrangePi 6 Plus board
Message-ID: <aWRLLIPNHE23ihfS@nchen-desktop>
References: <20260110093406.2700505-1-gary.yang@cixtech.com>
 <20260110093406.2700505-2-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260110093406.2700505-2-gary.yang@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|SI2PR06MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: 129fd106-a773-45df-f9a6-08de517813de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ctBvSo5zVmGai7ae/6EO/UHtoebcIq188Bm3SBi2ZTu2z70SQt66xEy5S118?=
 =?us-ascii?Q?ES/g+FkbGsSJp95jM+C6nol0T9wpxmaL/F14GmkPuIoxjmTKXe47KqeO/Hpp?=
 =?us-ascii?Q?t2+LwsCLd/JUCStuQgmsrNZKRCJ+OdLUxzVQ/tQp1G9WyI+TdqbCG/5EYYjT?=
 =?us-ascii?Q?sOpUbvg7PNa6sBJlVgCdlOXaERFZaUg6pbwub6SMksSqD1ZV4fya90pO6ivF?=
 =?us-ascii?Q?yRTSwcwl8KB3YDe61/z9ENtOxxCgeUaSxI0VA9qD150EnjV/9bDjd3gRC9Ru?=
 =?us-ascii?Q?YXj42YkDkv8N4IPLJUxH5osujzjjogTPbOyzEZVKOjmqtIu3kUGBOLppr7g8?=
 =?us-ascii?Q?flwTePw6U/kglmUAG9a+GSTGD5dLYM4p0tpxJAWDlDJy3FL3kZHgN0mTyL0I?=
 =?us-ascii?Q?GfySv962LZYdieoanlUTOMQzcBOTqq1mzKHwSa0EO7jrYUfo8uwFifrNMKOT?=
 =?us-ascii?Q?SgQ/r0DUj24VzjtrftdWqFVc0fOl42LbUl/2QOc3ll3q+QdB+jRj4acwlzBu?=
 =?us-ascii?Q?4o1felhnHkhVJzkFCpV6b5OgmNc5tfjB0MWMFkr6ixv5T/hk9ry7a/MbCnn7?=
 =?us-ascii?Q?WU4rWusKVpLJQtV5c4C5RT5NrFMY7GcYmC7AmDpoJNHwRw85PETtcCgmui7s?=
 =?us-ascii?Q?NE/1sEzY7BiJwuLX8Ca9AUZavWpJgKUY6Leza6lZzcb0Ck1b6TmdjeJQnW7B?=
 =?us-ascii?Q?GTobHZnU4BiLq3bH+VHtGgfE7ID3groj9NuzL8mn72CIgV7FjvPnuHgFg3tD?=
 =?us-ascii?Q?jW3fjvQ2Byek708aVwDV9wjw5lHejTnYb4RDx0a4DPZWqFjjWG36y3Gy6sBS?=
 =?us-ascii?Q?QXi//6+KyT69lRKpmOf2mqlnVeF8BnZpTPLcZi8NinVaswRRLG+CjI+1tG4u?=
 =?us-ascii?Q?5kcRKvW33aSiMkOiijKi/LgchffsWjnw5kjUfuF4q2ayld2ubtAiECnVkJzE?=
 =?us-ascii?Q?qS99jcfBaDFQXXmzp9dYuCaW96YQZgYSkgB0S27jHfkycR4wg8RFUJ+JtXW1?=
 =?us-ascii?Q?fu20WOc40UVuaGKrGN1FFph9Hgc7gN+wldqngIUcVOBLY0/kR1dkn2J63SHC?=
 =?us-ascii?Q?yJrVm64LiRtpz5c5JpDGS8aNV5pA1A37SGxGU70KfCGzJxrmSlek+R1DpH3v?=
 =?us-ascii?Q?bxEFTNs7izSCooJaVHKVi9jTRXv+b2IyTMxprX9UuFD1Wr+LoumZkyqYWD7n?=
 =?us-ascii?Q?mtFy1+DEVrYbPSlx7RQZ65J51KU9dhPJ4NU21aim0bTHhMUThO3vDgweb9FR?=
 =?us-ascii?Q?Rs0Cs8DabS7u0onORTwauHnCP8YRYIVT1omYGv8U5inc2Wq0Jb0zqZjXCqFk?=
 =?us-ascii?Q?Lze37SkuWxXf7zLzEAW/w/x3lrtOvxV4ock28ELSNw9Lq6gnioFVtQcZp5fW?=
 =?us-ascii?Q?J84kIRva0QP+sX1SAAK5Kwwt1cIDI7qKGn0XR7MW2h/famHegqVYjDl9A3pl?=
 =?us-ascii?Q?FLEHjikcQHQ7ez9uprpYuKamQH3JEUzjpnjwypzlZZgPuOMqLd9J0M6dgNNp?=
 =?us-ascii?Q?pYpQyF7+KufGn8boSoIT//g6E8umIQiJ3sQ8KkUBGSe5nC/N242gVRtHDm69?=
 =?us-ascii?Q?G/fKkUdWfYG4Vg/GWe4=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 01:15:30.2617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 129fd106-a773-45df-f9a6-08de517813de
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_171552_704010_F9C3BDDF 
X-CRM114-Status: GOOD (  13.87  )
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

On 26-01-10 17:34:05, Gary Yang wrote:
> OrangePi 6 Plus adopts CIX CD8180/CD8160 SoC, built-in 12-core 64-bit
> processor + NPU processor,integrated graphics processor, equipped with
> 16GB/32GB/64GB LPDDR5, and provides two M.2 KEY-M interfaces 2280 for NVMe
> SSD,as well as SPI FLASH and TF slots to meet the needs of fast read/write
> and high-capacity storage
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  Documentation/devicetree/bindings/arm/cix.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cix.yaml b/Documentation/devicetree/bindings/arm/cix.yaml
> index 114dab4bc4d2..21e66df7f696 100644
> --- a/Documentation/devicetree/bindings/arm/cix.yaml
> +++ b/Documentation/devicetree/bindings/arm/cix.yaml
> @@ -16,9 +16,11 @@ properties:
>    compatible:
>      oneOf:
>  
> -      - description: Radxa Orion O6
> +      - description: Sky1 based boards
>          items:
> -          - const: radxa,orion-o6
> +          - enum:
> +              - radxa,orion-o6 # Radxa Orion O6 board
> +              - xunlong,orangepi-6-plus # Xunlong orangepi 6 plus board
>            - const: cix,sky1
>  
>  additionalProperties: true
> -- 
> 2.49.0
> 

Applied, Thanks.

-- 

Best regards,
Peter

