Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF5BEF36E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 06:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehrqXuK5tN40WmZ5DK/GRkVtx+o6Hr9R9ue8zywwjJs=; b=jGhRZdGJ+Dh5gsE8CQ93gkwd6+
	Gm4rUTVgsCabkAjnpdtwOaQYP1yE0z/lm0q/+7cVXrcA4pLD8uuPxYPm7GrGbRmAmCh5+ig32uXMk
	e6yTg6+iq6qXME30NNjMLFk33GWygm5KUOsRDApAFQzGbM8xaqHtMbMCR1U78+BoWBnw1v9zZoakm
	eDSM9Ol9HpdUGgShQipjAuHw7wBmAa45I6Iw3bX0aWVrmWfOjxXYe0vYNYBf6TjeTHecjvtpjQEBj
	nGWljma6xhWRp1lyG3H7i2cG8BCVIerbICAKSK8E6lu4IY7cT+K0nkXIE3/vDEHRVuYnc/XBIU2KN
	H9r9DOog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUJ1-00000006kPf-37Nh;
	Mon, 09 Mar 2026 06:41:31 +0000
Received: from mail-southcentralusazon11013071.outbound.protection.outlook.com ([40.93.196.71] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUIy-00000006kOY-1YEh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 06:41:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wr9m1ozWGsnr2pHEeRPtUuZFcIHtpB25Tuh8LDC8wkSsn9/K4N3YmXQDRBfqNmGy9VnrSEquvp0JmqfeygJ53pyRG5lpwQtWweqBmqJWoasmSzpSsd4EAdFQQ2HG98Wl3WEx4aBVNFkNCPUE1iyRHEbUmmMp20ZFsgSn8Z/zS4jqyCuVM1x1APDNCSL3F+BBCAsf5Fl2PTlCHt4VzDxw+GeJjzSBH6k/9vOH4dNVw8KM0+BLMxfDknUJNCBIlev73+OjJYLNP7ECuPMgdDIR2PqPodYf1sdmDsLyQhPTwTw9HGzlaMEylx2hnk9WptFhWM3dOXI67Ju3/Wy2Otxaag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehrqXuK5tN40WmZ5DK/GRkVtx+o6Hr9R9ue8zywwjJs=;
 b=HpwPrvNbbbKLpz5l2ofg1IfsljnmXFDjA/1v9k7OnKGxNlPk/1Fa3KEPF8e9UiYWOii4oadlRWnzypUwVA3x4WLMv7SYdYmPH6bM/jA26oQxcYPTUKkFlbFslMiG/aWV0lBVIuViRHgr+hQQDt4ySOiTx5oVhz+OrRJgioHgIf/p0I2Yw5EKo5Sa0u0fNGSq3lBiS5adqSBszpdb/EyGfmwqKehdTzzX0xe8bMaXH5Z33imsIMzshmifXyyeLEt29k2ztffhqwmTzpQNnZwi/TDluaLYjsBepSyIEAo6BCcg5m1gjSereCxsWUIx0gTAUSuIIGfQflRm7EviyIhQhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehrqXuK5tN40WmZ5DK/GRkVtx+o6Hr9R9ue8zywwjJs=;
 b=qKu1zzOOKCHBTIX7zj3AOIiwUYVeJJfmomE74R7OWuJeVg9h+/IkgdXtb9h33hiZMvOGuUOpCgh1egNwZ/VZxlIhCysHPqKPKGowSlC3CC0Xw2lCigKwW2509FPrCMQURnaHU/bpy/e7x+Zgo6lMLF20eRQaIu6eYpXIlprXdM0=
Received: from CH0PR03CA0005.namprd03.prod.outlook.com (2603:10b6:610:b0::10)
 by MW6PR10MB7657.namprd10.prod.outlook.com (2603:10b6:303:247::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Mon, 9 Mar
 2026 06:41:23 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::db) by CH0PR03CA0005.outlook.office365.com
 (2603:10b6:610:b0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend
 Transport; Mon, 9 Mar 2026 06:41:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 06:41:21 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 01:41:10 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 01:41:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 01:41:09 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6296f50s087544;
	Mon, 9 Mar 2026 01:41:06 -0500
Message-ID: <e5795a82-031a-4cc9-8af6-704b6b13e16c@ti.com>
Date: Mon, 9 Mar 2026 12:11:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62l: Add RNG node
To: Shiva Tripathi <s-tripathi1@ti.com>, <nm@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kamlesh@ti.com>, <t-pratham@ti.com>, <afd@ti.com>, <vishalm@ti.com>,
	<k-malarvizhi@ti.com>
References: <20260210130058.3458936-1-s-tripathi1@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260210130058.3458936-1-s-tripathi1@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|MW6PR10MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 56fcf8bd-8681-4a9a-7081-08de7da6e0af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016;
X-Microsoft-Antispam-Message-Info: sy2m1Nop+RZkiOPlcb8jiGqgigRfgcIJNuwD7ntYxN9lztBrtyTDgKK+1wqh3tDA0ZXq6+J/qQ7g1XB1/jDMl/IwdPwDSpPJht2d2n/bJNhxiETAgYM6JATlpH0Eng910WsUY5J3e2f0krpHOdq0UT+P0u0/UYbgqDaxy3g1gT7z8SsWeo3qPQvPiHY/WvAE0t0g3zinMjewbCKGOYQPKtLrjedkyWN/HpwM6pjDirdcTWVcHYCGWDUGt3/FOvMCi5wrx33FtSsnQfW51lgvDBudSL7W/jqhlNqkm21rg51G6mH7qzMemOuEj2rR2NHbSAD8tks+VPRcl8fdJAfYYL7XA91fJyE2k+vczJzv3unWHKbqpYTQdzvikpnx0Ul0YWabEU208LInL6kf0cniTbpoR/v2XTSNQKm/kyaBXInqF8asGcSrNXsijE7WspLhCZM3+LAhCF4K2HDF+XlugZRxwkVFN+JRcjWvS42ONhcN/wB6dYUzyMFAGMlQoIRKCkprumxFTH8/NpXctZI0H/63aQqQsn0h24HVmiv/HvazIOe/nAHyEuzwLObqPlrPEY3wEFnLlPUL7vNjlZs41fdp9LDM+3RaoZBZH25HLgljHWsB+nYNKoiPrCRPMkBcYiTlaERCMtjBtBKv/N9W8XbWqCwaCZJjxoSyK25ISroIM2Sm4NlWwir7WtrzcuaxJmgA6atZ7VitT1s2mCUzK3PPOx6+SsGfXF1rnxHT9Ck=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: deqlbSF9AbfCTqnha7g4XqPymh+2A/YRzwJJxxqXmC09OXKGVuS3SSUzQxS0+0nSUMph6DfWMY+SCNab+tIfIVE9pANu+Nu6A6kY6xvh2feA//9kPlEM+vri9Ch2KHNmBE8v2QYBY/uC23FoSd3Xaftm1OE18S5t7XlAIeJH0KrNjtYlkuvxDYv7l0g5geTzwx+s71Uv7CPXVs9POSTpKw7Euiuuq4Ko3HBb2UxOuJF5eH29/J8bdOxtSSY9S38O9O5peUF6JAjDCL5R8fthI4AP53beTbHtbiB5WWeyHEOEERF+m5gkt2o6f0HPqYpmAbnRMhfC4QACVajv9Zno5SES1kcrPMsr4DeGM87r8+ug72SnzKH7/IvmWEWosnkZy+s3DaI6JHsh8Puhsk9HkWvlSImn29XhJc07LKCeSFFbFC2ZwdIMg/DB1KxoJhHS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 06:41:21.9889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fcf8bd-8681-4a9a-7081-08de7da6e0af
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7657
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_234128_622778_96CC3D48 
X-CRM114-Status: GOOD (  14.42  )
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



On 10/02/26 18:30, Shiva Tripathi wrote:
> Add EIP76 Random Number Generator (RNG) node for AM62L SoC. Unlike
> other k3 platforms, AM62L RNG is integrated outside crypto subsystem
> at address 0x3b100000, requiring an additional entry in cbass_main
> memory map.
> 
> Mark the RNG node with status "reserved" as it is intended for use by
> OP-TEE for secure random number generation. If required, this hardware
> can also be used through Linux kernel by enabling this node.
> 
> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 7 +++++++
>  arch/arm64/boot/dts/ti/k3-am62l.dtsi      | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> index 883beb76ba9c..1b5f90b1ee61 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> @@ -577,4 +577,11 @@ scmi_shmem: sram@0 {
>  			bootph-all;
>  		};
>  	};
> +
> +	rng: rng@3b100000 {
> +		compatible = "inside-secure,safexcel-eip76";
> +		reg = <0x00 0x3b100000 0x00 0x7d>;
> +		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +		status = "reserved"; /* Reserved for OP-TEE */
> +	};

See Documentation/devicetree/bindings/dts-coding-style.rst . Place the
node at right location based on the address.


>  };
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l.dtsi b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
> index 23acdbb301fe..b7d4da303456 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
> @@ -79,6 +79,7 @@ cbass_main: bus@f0000 {
>  			 <0x00 0x31000000 0x00 0x31000000 0x00 0x00050000>, /* USB0 DWC3 Core Window */
>  			 <0x00 0x31100000 0x00 0x31100000 0x00 0x00050000>, /* USB1 DWC3 Core Window */
>  			 <0x00 0x3b000000 0x00 0x3b000000 0x00 0x00000400>, /* GPMC0 */
> +			 <0x00 0x3b100000 0x00 0x3b100000 0x00 0x0000007d>, /* RNG */
>  			 <0x00 0x45810000 0x00 0x45810000 0x00 0x03170000>, /* DMSS */
>  			 <0x00 0x50000000 0x00 0x50000000 0x00 0x08000000>, /* GPMC DATA */
>  			 <0x00 0x60000000 0x00 0x60000000 0x00 0x08000000>, /* FSS DAT1 */

-- 
Regards
Vignesh
https://ti.com/opensource


