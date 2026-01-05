Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BA8C79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+F00psFLrpHKEwOeoLMUnXEqQzGx68LP+XtTjxm1hw=; b=Sf2zKBzDUiTiEnuQejAULCjFnT
	yZ7NVeWIWaI3ngmzUBGaGRZs3wnNwXnWACTKjGcpOVLwZn3zOi2EErwlzt2F144pfUcnwdu+iAH95
	IlvSheKQzk3kt+uZRR3O2M5dktYIG2G1hccIGaVFsnL8Snrxd1qeTfpi3vnE4gyCFyx7rWKiSrLw7
	5yYR4ABe4s2JqHLlh1aN7bAwYYq0LPEX9IEpvUpc2zHav6MG6mEXUqoxZM5vaJXsew7rO7Bfk0Vgi
	XJaaWYtxIngbM1YqAn9D6bQs6QAtxTpRb3ZMwMuyAfUCEa/F0R2co4J5FlyYOyQurLxIp0rjvNYmY
	jEXfsJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckYB-0000000BR6h-3bH7;
	Mon, 05 Jan 2026 13:23:11 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckY7-0000000BR5f-0yw6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:23:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPXD+Pta9eIsOtGhAfJRnNPvfVQ0GF2z98fFgvrAGGcgW0vpkSsbg3f2yFgw3NDuCYXDZSXH55AJ8ACLTiOM1F1Q98eT9ztpKakrH9EHJ402NelQW6WVGdxlvy8ubZb3oAbJdXFqBZ3xlGIqRSy10NgbmGWTtNejhAtx3r6fd2JChglTMQsxqZjmsmpCcDho3m1pc+0mUGuVxdsjuP5Go1RtBlVWV74xVpmRXYM2Qj/AJjbUONVEzOskJKQoU5soSRSqMXTmHRoKaZ1ywokeVl+S7rgdBrKWpydq3QSVUhQRdozvjItDUPDoWKErGYEKwSK0XvFWtl0uhWnxPSCE2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+F00psFLrpHKEwOeoLMUnXEqQzGx68LP+XtTjxm1hw=;
 b=ecIiYgmWeLcFHYlbg54clnRO44OYNHyirU2YcU8n3dCKIbDMNXj7LeyEXx3f15jbWmNWdmXlCJAS3v32wuW3DhtChh2X56LN0uxi3QgRxGdhgwFdrhsmG+Qhqjg6/PeITg+DYjQL8cJhyQvmSHRG1itTkkjqy/huoX+XKXGL8rNT1pPwa2Z6hRKp3Oc5VLnV/G0wja0YoGXWNlX4OaPEuT1fbrA7jaudjrG6UwD3Psx/lZAl/yl0tteIe7mmDYLAaEdt3un++lij2suI3fUU8ZyZr8HJNLAlAAC8uLVJYwS0qCk/K5hWTZZBBGQBtSGOs5A4n8fptbJiYu3cLkQZqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+F00psFLrpHKEwOeoLMUnXEqQzGx68LP+XtTjxm1hw=;
 b=HXMKY3xvX5TCN7hS+q5qi0M7kKTyba5ZoBFH+dYKoy9Q4OKUI3n9kofVDAWoNROf5Fh0mzG0O1GQu9OHD5a1ygFSRvHLbYnu9CFGuME6o9OnNbvoPWUOtJOQaAgmzF4alsoBNiiLTWR3pmaRPbZzycsAbsycRqm5U6MCHXWKMUI=
Received: from BY3PR05CA0049.namprd05.prod.outlook.com (2603:10b6:a03:39b::24)
 by CH0PR10MB4939.namprd10.prod.outlook.com (2603:10b6:610:c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 13:23:01 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:a03:39b:cafe::5c) by BY3PR05CA0049.outlook.office365.com
 (2603:10b6:a03:39b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via Frontend Transport; Mon, 5
 Jan 2026 13:22:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 13:22:59 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 07:22:58 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 07:22:58 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 07:22:58 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605DMvrl1208312;
	Mon, 5 Jan 2026 07:22:57 -0600
Date: Mon, 5 Jan 2026 18:52:56 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Bryan
 Brattlof" <bb@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<msp@baylibre.com>, <khilman@baylibre.com>, <a-kaur@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am62l: include WKUP_UART0 in
 wakeup peripheral window
Message-ID: <20260105132256.yon7nxe7whnl6k25@lcpd911>
References: <20251230-wkup-uart-wakeup-v1-0-cd6e15f8d956@ti.com>
 <20251230-wkup-uart-wakeup-v1-1-cd6e15f8d956@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251230-wkup-uart-wakeup-v1-1-cd6e15f8d956@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|CH0PR10MB4939:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a186d91-dad7-4eb5-dac8-08de4c5d8bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g51mjJZiZnf0PETBFPNlvqW+TtiJmCx+Nl83Ojl0XO7VqYevcp+iHIB84M0n?=
 =?us-ascii?Q?/Giecn7hfuDOG2Jm4TIvvkp9UOQFfCZQW5ltjo2B9qSCy42QBk4wkbHum4gZ?=
 =?us-ascii?Q?EAPegjjySbZ/b3iL/Trwfw+7c/adTis9gHDi7iKYB8wjlEegK1cgWHvbDgUD?=
 =?us-ascii?Q?IzuvzAX6vOxMDdQAbAik1uiNGSuzGhwbkChbxyxrnAvEgCoGs/JWfJd501os?=
 =?us-ascii?Q?CR6r4norM1StjOWzQnDVVzO9cyUoBRZVyffSO9UESVnb4VXhT14cdqfC1E56?=
 =?us-ascii?Q?BOadOg61l/yOrgFay6+WK8O8AR1l+1UhrOfWe7l6vN9CN26Ggrqp8tKibpbF?=
 =?us-ascii?Q?ivaB77iSHEqTBH6WjpTnSrtTagsM8osyj29md0Oba+Y+izLa+0pcmUxCX1fO?=
 =?us-ascii?Q?IXKdbNoSDDf4oR16X0u+trcUwv5qRzm11o54OYAS3GKxXPM1VCVyX06LcFMQ?=
 =?us-ascii?Q?CcooNoKogJsXlJKxYYDPDW7/SlzbjV7PLNfxShugVCrJnwmbXkC4z2SWgK+C?=
 =?us-ascii?Q?jMA8atE9E+NIV4tmDeJnph+gYIGddKanY9fRotx93YOO7a7ameu45JFa4m22?=
 =?us-ascii?Q?UP54lKMs2byj9TMA4NSmuXOq7SgNMAJeEvcRKUECbe4srye+hYUyyBge1mKj?=
 =?us-ascii?Q?wiVrZ2xbaEgUJOwNlKt4Ycl/8E2sfJvCkSM0T2Nwhwtw1+IvXaTxaqjurXfe?=
 =?us-ascii?Q?O6v5S9w0uTMKqgOoFDay3Kd+ta4STcvXL7k5e3z1n65wGyIg1hn3X/YkRt5j?=
 =?us-ascii?Q?ClDI7/R9wICTjafDegJSGYJrXUGvMWNJGCDMOsy5hDLfvQ/w6db4LN0Qphh6?=
 =?us-ascii?Q?N8V2P+N2Y2vqOCbUfPcRZd7Ylu/328wIcnTxZdDhwB+yR+DkkoZxZ/lXB2hr?=
 =?us-ascii?Q?jkgEbxcnckscr12wxgBFBkb2INvHYkeyOocTKXRacxcyaTTM9xwH3roZwYtL?=
 =?us-ascii?Q?1aajHZWS/33QWCokb/ORNTfzDpnsFfpuh2IsaNsYhK3VJXgFHNBWz25p7mx7?=
 =?us-ascii?Q?XdsWbXNrv8OQ0+4RLIBTCvFywog2VRnoA+4+xkm0Uyj8o/3StQw7q87fmWk7?=
 =?us-ascii?Q?IbsUQjN+Gj6pq1t1CoQW9hFis3l607NchIqUs5KNcI7DSCHa8nc/Dvh7KOqg?=
 =?us-ascii?Q?j92LjLDitqsj4GF9oaHTVSzcUEndvpSUooYYuGy1zFeul5+PIYpbBBJ5VNK7?=
 =?us-ascii?Q?HZqa8C1NU2rSO2bnRAinPJ9XeSZun2oumnaDEib5ztQ6XgZE7CVAkye9sekV?=
 =?us-ascii?Q?HM15Y1aWAQeWtKE5EPhSqh8dlZ6YQWdeLhUByxAfXFqLpdVTiZvlvNqc+bK+?=
 =?us-ascii?Q?UZ20nuaKXJuOPlUpa4DPtNSVDu/xgFKXcuP2otBs1SqKmR7H8cImd890VZTB?=
 =?us-ascii?Q?B6SblJ6nwQQ+LAPFuLWwW6bSgxXvtSHhPeix3k3v/A8dm4SxIp/Pz1ccaswU?=
 =?us-ascii?Q?Vdqghrje4Z81YLJ+2SozkSelPW6QSY1FfbjNMEMDMGmDQRBDjOCxLjKnJkvi?=
 =?us-ascii?Q?Piw8+BNWnlzpQr43T3A31WmBEwawvSJfSl8XcDyQ+PsPqvhgbxQA80Qod6Uu?=
 =?us-ascii?Q?a5oHJs0klasEI7sMcOY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 13:22:59.3485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a186d91-dad7-4eb5-dac8-08de4c5d8bd4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4939
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_052307_280987_1132DED7 
X-CRM114-Status: GOOD (  13.38  )
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

On Dec 30, 2025 at 20:51:40 -0600, Kendall Willis wrote:
> WKUP_UART0 is apart of the wakeup peripherals and has a range from

Nit: a _space_ part

> 0x002B300000 to 0x002B3001FF. Expand the wakeup peripheral window to
> include WKUP_UART0.
> 
> Fixes: 5f016758b0ab ("arm64: dts: ti: k3-am62l: add initial infrastructure")
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62l.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l.dtsi b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
> index 23acdbb301fe38e6045c0ef3ae340196009ed217..e01e342c26daaa06a72036cc3a9a7b13a60e6738 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
> @@ -92,7 +92,7 @@ cbass_main: bus@f0000 {
>  			 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00001400>, /* VTM */
>  			 <0x00 0x04080000 0x00 0x04080000 0x00 0x00008000>, /* PDCFG */
>  			 <0x00 0x04201000 0x00 0x04201000 0x00 0x00000100>, /* GPIO */
> -			 <0x00 0x2b100000 0x00 0x2b100000 0x00 0x00100100>, /* Wakeup Peripheral Window */
> +			 <0x00 0x2b100000 0x00 0x2b100000 0x00 0x00200200>, /* Wakeup Peripheral Window */
>  			 <0x00 0x40800000 0x00 0x40800000 0x00 0x00014000>, /* DMA */
>  			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00080000>; /* CTRL MMRs */
>  		#address-cells = <2>;
> @@ -104,7 +104,7 @@ cbass_wakeup: bus@a80000 {
 
Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

