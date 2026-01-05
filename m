Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B99C79F95
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6osNmVbSnZ3NQApZvWiwfyOnjou2PjgU5Vs20IO0gE=; b=Er5wht329Mx0aa79r9k13rB7a5
	xwuJdNFRC3ilNTbzE3cIWXmqHbDREE4IzrLBnp+3jK0hHL4LEQbqatWaiPRiMROJ1adK9uOF4+qOe
	rH6CtK9xebxKSIyVpLPhW1d0oclw5GyquyhrVxUuTP50YscqZsLgqVap59Z3cKj0A825Rx0RsWgvI
	aNzmvetH1nhNPLmnQ07FnWzkc7wiSGbVOPctGUfWt09RnwRV0XMS99YsOaHDUBVh+qC+QMS1FVZDL
	WtyjxPqJ0bbq2O+9bSUb9SQ1oPvJrbn/RCjPGFax8A/akdAYRuGUux1qfhIZ4npd0U9qlUtC4PwIZ
	30fTbSkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcl3V-0000000BVAy-1qe5;
	Mon, 05 Jan 2026 13:55:33 +0000
Received: from mail-westus2azon11012055.outbound.protection.outlook.com ([52.101.48.55] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcl3S-0000000BVAd-0tlG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:55:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aB0vDuuoHLFnxMMy03Lja3XqtxTQzw/AujwZjWrmIe9xDoE1PLs3dDmQI+WGi0Gy+QbdGOy5YM2zQ/alNDmeP+nJPpWsYjvN3zke+nln55UOi6IAGvBg/MQ/gK0ZYCY6Bca5aQryp89NndfK6VSpzNXKZJM6BiQKtYxPNMi9QRn97oFI+f8OSAXIWYvkBUtY46Fs4oKFckOTjxp52UmtCRTafLyFfAGPXSeBKqhh1CbDEmDcklnlA43dBTg3TeGfLTcarPcSOpi05QsKUJEmUrsXPlTPX1BfO/3NSxy0KJ4RY3asvVdAgutKygLh4VX9esKesM+WKc/vdXnKBMziuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6osNmVbSnZ3NQApZvWiwfyOnjou2PjgU5Vs20IO0gE=;
 b=vXqCD2Zy6QxMUUjXNy0vhRQQkpHqXzGN40KBngDLayhpGrhNvR/wkbdcAisOsQ83GWIcDeXO6pF2DF4sIgGKe1V8rRvgaLGm6jlvz5i6IPYr8lYOQ/F+fF1GHBI5dhKqyK+vmepDwnMhVV0wbLVZrazM9Mz083XyY+FJATdnHrux0s6YQKmHs5uAf3UMPBj9Rd4sJdKCVdR0ky3vryBzd6Tr47MCR/2aO1IaVylAbjV76sDblp1fk20Qz6zRTySc213bghdIqHb18H3oykElUC3EROobF5Tka3h0/zhrfuSky8obU5CCfxqYnQpnAYXuMd5BTjTIi/6lMpQ6cM5u8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6osNmVbSnZ3NQApZvWiwfyOnjou2PjgU5Vs20IO0gE=;
 b=hOJ/hdmBqlARVzd4NF7zSVtXtrHtW6rWgRxneNh/7sA5eT/zr5/mUY3rZ32QKV4B8P077TysmSZX9MzqCx1/NHSl+emC0JQTWIxtpXlPMWsxrpZXIn4LhXz+B7CH+uPmD8xjvy5ei1DBHZjE6SyKKD3Alf9BnY3/BrAW8fDcoCA=
Received: from BN0PR04CA0136.namprd04.prod.outlook.com (2603:10b6:408:ed::21)
 by IA1PR10MB6897.namprd10.prod.outlook.com (2603:10b6:208:423::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 13:55:24 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::b7) by BN0PR04CA0136.outlook.office365.com
 (2603:10b6:408:ed::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 13:55:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 13:55:24 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 07:55:20 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 07:55:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 07:55:20 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605DtK6Z1361760;
	Mon, 5 Jan 2026 07:55:20 -0600
Date: Mon, 5 Jan 2026 07:55:20 -0600
From: Nishanth Menon <nm@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, "Bryan
 Brattlof" <bb@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<msp@baylibre.com>, <khilman@baylibre.com>, <a-kaur@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: boot: dts: ti: k3-am62l3-evm: enable WKUP
 UART wakeup from LPM
Message-ID: <20260105135520.rqnysf77ou2kggfh@shakiness>
References: <20251230-wkup-uart-wakeup-v1-0-cd6e15f8d956@ti.com>
 <20251230-wkup-uart-wakeup-v1-3-cd6e15f8d956@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251230-wkup-uart-wakeup-v1-3-cd6e15f8d956@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|IA1PR10MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: c584e19d-d2ab-4f47-5610-08de4c621337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9EJ1sbbfUCxI4NK3a+M1I4IrNoxg1bL812LtnZe9V+PyF9aWoatbTAFMUaYk?=
 =?us-ascii?Q?B+6fIca5eXvbJmU8lktSpARQSiOUKLzIKi9Uszak56KGNM0yG4PJuQbGKQln?=
 =?us-ascii?Q?1qgeHzseVHA55cil9Bq/RyG893cbQNjjZMSWQg/2VVcpwEg8JMCbbQQbN5B4?=
 =?us-ascii?Q?sl7GCgjPVbG4cEzYMemSIpBOQbYwbOnH8GR1Wu8vFOmOaCk5Of3xwoCXySdy?=
 =?us-ascii?Q?bNOvz3jJ6X6/RUGbSS5CFrN5otfop793w5O7tJcnDGVBSL4mUlS6/PCWq13H?=
 =?us-ascii?Q?lYpnBKpgwBOoMWuRvSzt0/UFHyZuKTdY3C8Gi2XLkY5VLbSJ7zgPodTypQrT?=
 =?us-ascii?Q?pZdLNWMjlmagSC55sQjb4ndqWMho8+ZxZ0sEngSqD0Ay35HOUzG/M0doBvNa?=
 =?us-ascii?Q?gKOuDFd+SPHhFeBXXPbaQPvQiOa8xurPMGMH+4loSoWFY6Au7S9tdNuT4FUA?=
 =?us-ascii?Q?aeLcOIcjK86QW9BVZqTcA3gcMKToJgtDehnJubDzljXdkU0Ht+1m8OE6tDsU?=
 =?us-ascii?Q?rk/elA4+viKTl6xMEMRUSGe1juLfdX0kiuUkpOHfJETDq5LWmVx7tCk/dK7A?=
 =?us-ascii?Q?7AfWrDkBzHMdDIYbeyr5sPupJ2fMAxuKMNrKmM7jrVXXOzkdLLlr2HkxTF0p?=
 =?us-ascii?Q?Ix20WLwhFXENz9qJukdLNt2T5MDjrUwevoYm1oH3vwFddoxdDKrlu9yj4R/p?=
 =?us-ascii?Q?hQOFtZY1SGJlScXmBpQCMl2gFpAhdCAOSwZ04qAD4e8gUSvwdSkwYgDuF+qi?=
 =?us-ascii?Q?vQN5ugu3sj3XTVneB9J1bsJJbaC57InXjLbN/hZN3WSyHKXR1SuGu7tXJVUO?=
 =?us-ascii?Q?ZMy07r83TDPZ30VBWmCFSl2TSI0xFUeMQrZ80P3/NkG8Y0VS2tevVCASGXrm?=
 =?us-ascii?Q?FakWywsOT7eNZ2LlWBINkA3ut2oZOcOKQboGHabaQlkRwzSOPHZDMOQORNI7?=
 =?us-ascii?Q?UtCGzqmvJRgoIIHuR4pygdUznNuIiWwyZH5gbunQYw8upQwwnXQfrwHJBYLY?=
 =?us-ascii?Q?MI0vbl4VKK2PLu8TYBeHhRB/7/IHWUHihakaDLNjp6WGBaveHtJ4FQk79MU4?=
 =?us-ascii?Q?+fxOLBrJPs1YiDzaGLMTJRnistTEVD93cdqqqfti2F6lL0uv69mdsxKdnno4?=
 =?us-ascii?Q?UNp/hCJIY3nFPd2Q6mw1ToAVczs5VJW2t41J/MEkYQysY42NePDI1y4hhp/A?=
 =?us-ascii?Q?gxm0UFPJPqpnakx1GCUOJE14+bQynBcsbFU998fgjusaC2sLoADT3uSIfMhI?=
 =?us-ascii?Q?WAHqrtnS/XhOZM4a0/6QGmU5jBXLxt/VLJKOWKHYZitoHMqQANLyJog65Pwu?=
 =?us-ascii?Q?HJETddAAPTgiVCFzrWxMD7gAwEDp7RVD0IRvYyRsreloYl/tfU53dGQ31V58?=
 =?us-ascii?Q?ukd/Eej5aXjibNyRuIcqeLfa577LOYvs1PromB+wIoKi5P0CRWX9KK9rD+MP?=
 =?us-ascii?Q?qOZ+WAkE3Yg+R3wKwgCwe0Ecu4L9aqnBZeQJLFx1HofNXacaWjxObrg/v9vq?=
 =?us-ascii?Q?KDa9Pp28q9euSq+yJ/5uzH2e4mzF9o8oYWoZkQ0RHYtIrmid8W+rtxI8xv+F?=
 =?us-ascii?Q?km16mYWs4mkDdXbbq3Q=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 13:55:24.4866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c584e19d-d2ab-4f47-5610-08de4c621337
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6897
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_055530_254888_66B5E13B 
X-CRM114-Status: GOOD (  14.89  )
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

On 20:51-20251230, Kendall Willis wrote:
> Change the status of the wkup_uart0_interconnect node to enabled. The
> target-module node sets the UART SYSC and SYSS registers to allow wakeup
> from WKUP UART in DeepSleep low power mode.
> 
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> index cae04cce337366b50928d39b0c888550b14e43d3..02b1a1c76b2ee05d49cd69d199a6aacdb1973fa0 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> @@ -359,3 +359,7 @@ &usb1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&usb1_default_pins>;
>  };
> +
> +&wkup_uart0_interconnect {
> +	status = "okay";
> +};

don't we need to set status okay and provide pinmux for wkup_uart?

> 
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

