Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3D3EDA698
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 16:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSJ/LqL9F7vLzB7f0vJCbvix4YPeTSl77YE7feAOTFE=; b=oRU6ZRK21PbFun+gmGrKjOGVj5
	bOZz2sl/mbA+Et3hiEdry7sHGwx548a9qS9Q7W9snVjjz6DFuf58cEd38ie9TqxTzs5D8fNOKerHt
	EFeVNJqf+AeJ9PHQG27gEJHACP8gpJ5EMVioGILNebfz90TkqQlPW2YBOj+K7MUnZzVP/cQowI6/8
	ze2YcNi1gtEBprkKAGovduVgNP4NRyF+zK01KA/R2xFDAN4+NXnv+QUh9MjNKIArtYoKqIh0keDqC
	Q0qS1DI2pxN2DgOfmaaafBeiSXQz2RmlqSI+9aFZ+P5WgKIgiEykML4AiWE3ov4wz4gq+x9Yrkz1D
	zKrl2cJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSjm-0000000FaXr-1lz7;
	Tue, 03 Mar 2026 16:36:46 +0000
Received: from mail-northcentralusazon11013048.outbound.protection.outlook.com ([40.107.201.48] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSjj-0000000FaX8-1N8c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 16:36:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTBVt7uX4+8FTmApvZZ81uss4jYI4fWrqmjDziBsdszcs9qo68QxkIgPKxjXI04CxfQGcqWeoc5eLurJbr2qaFS15Kddil5WRmpjgIP4jvHEvBBQae5CLmfIj6SOsuALw3idEwgId7vjpkDbTrluaFP07Cy59vuEIN0SASRN0CL/nBxG/EpBu7BNIUEJ981bufkS/G9vnGt75MLRLSlLko5lCA/8yuLkYPAfOKDAmyy9RrxzkH9ugDHqHMmIgBJqFFeIGLD2Hgm9hDj3zEf7cDHqOL4wYpWMKz+Hr7U5WDSY2gTniQQAcTc7F7DSw6SeUmykMz+HkP2GlnIhUGa5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSJ/LqL9F7vLzB7f0vJCbvix4YPeTSl77YE7feAOTFE=;
 b=E9bfXUvcymp1tWWHzjtTlBRAlgWn2O8xM2Gpk6hloJ9YpMWZAqmeeF+/KUseP+WbDKU0acykiAHOMDbzs54R3RuEadMrprwCGafoZ5YfsXy5BtmIh7vrF3kxk2zTZeOQ/w1hiSXyFKK2qjIttoBDJ4DROWUArq2cj52OmaFPfbzhiLxo9gavgjNUwB3A8s/9pUxgTYjCUnHR3SslSiCpUQa+7a5ShPYI6z4CMRUJLh1rhwSH76lElXefcJQDP/gb2jsBnMw1LM5or1xpzCOyATO706hnTeTCBaxgzQ9aJypU/QA5dAtq2rqhQgWrpO+mtRwQ6VRyjsVKLmU+R9kfuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSJ/LqL9F7vLzB7f0vJCbvix4YPeTSl77YE7feAOTFE=;
 b=ShGOIDRvN3HE6RVWnLIhXgPNiO5fqQf7zOCrC7eRIWfICpUA7hw28v78pK2mvC2sf1eOh6RxTnGVBGliMveUjMt95dR25gloO+auAdsgvPHQ9Nv05ErAMaALY80Yx5IoLtzuNruH0Kabq7LSY4KNR+XzQzutpUXuglhHSk1AcYE=
Received: from CH5PR05CA0024.namprd05.prod.outlook.com (2603:10b6:610:1f0::29)
 by BY5PR10MB4371.namprd10.prod.outlook.com (2603:10b6:a03:210::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 16:36:39 +0000
Received: from DS2PEPF000061C4.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::f) by CH5PR05CA0024.outlook.office365.com
 (2603:10b6:610:1f0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 16:36:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF000061C4.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 16:36:36 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 10:36:35 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 10:36:34 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 10:36:34 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623GaYaC2453259;
	Tue, 3 Mar 2026 10:36:34 -0600
Message-ID: <0633e48a-27a3-456a-8b9b-32e88d417560@ti.com>
Date: Tue, 3 Mar 2026 10:36:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Fix pinmux for pin M19 used
 by sdhci1
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>
References: <20260212130843.1054100-1-s-vadapalli@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260212130843.1054100-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C4:EE_|BY5PR10MB4371:EE_
X-MS-Office365-Filtering-Correlation-Id: 904ea5ae-6dfe-467e-4e1e-08de794309e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: US6jwP98kDl570g+5KBRUiQPNGas3UnPdYroqChYaAKiEshYLHzKAODM3ydp5M33pAkDE7MOdM8JNaMG8eku9LPr0hyS51BSQLkoJOFdbmVhCrm8WR0lbR2zi8R+x6rMzT5uajt2/HxxaJCqG4Ia/0ABh7i/NEko9HcGdjP7xFYGgcBqk7B4t1JaHt7rQh+/GPGLe6owSNZ3y44r4gM7/ZsoCjMg2EPHmL6IXqS8UKiJPdVluJz6pZRo3VPedLdt+Lyw7GLY72w+wk9G12h+YFSe4NMkrMIAAQTn8asWeim1+G2351XwwtS4pVtfV9ll26kuyaKNunJzgfBwRgeyA8Xb73/MKpYdu+KMFsgAwzRnI+UNu5zC4ur9fZReXBqbF+piZyHe9TcWtrePg2FNGkuRTPxKoVFy474i//+R0NqijLs50xJkjdQaqpaGW6HiAimBVXLUH+gEzg0GxrfNSrW3h9IJVPP9DEwLsCGZMHfzmFuQfy0cNuGKd4uR/mNo7dTYEOm/xlJEDlctDsajM4c66tTb75PqMhMLfE3o293KTuHJwkCbnLwJohHVIW7b6I5nCkfPBzhJDva4cajF4P82OUs8P5GKFAv7G9uckdlk30WKduO6Kf0U7o4JPQvLRSuLC+RjmHhQxwT18vQFgQ/aGV3S8zG/wzWA+cEM0txSh7H4gmfuawAqXk5O6zhbvpuU5MWx6Knw/YTn85XQvukKYQAaQ6z0mW8E0tSkR4VgADy302ruSxXxHxVjjA7DEh8BNUgdRo/IdGEmcgP8O3MNXoQw1GanN7Kg1+gJqoH/kXObnQAnhvdRkXFMjJPfcDoJUGRbzaDDkQuhhOQwEA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ka526NF0zwRpJbOC1qf1C0EQoay8lfI33Sh81m8q7pUIqN5PqWOBtIUp0Mi+wWWwxF6Eh9fqw/ZROpN9n85BKbBCbYDnwcbo9Es+6aMdiizKfE39niNdd4u/uT6r9GXEnUmmHaBfdIduMaQ1cZVtOXCRiy7kF6yFlGHYno38WBAvA7F+ALOqcATNXI+9BtqAnM7c92RvReGVF2Z2AJsMP27IhmmMp3g8awt8VoHzWrMSmZ1mUALFq+2DdjShGXIrpqKvCX0OPnY99Awqx5MYc8S5Ivmcscu95BrkueftQz3ccVtEv7gQ5XQ9fenGVQanPHVrC7bAhVR5TYZRvYx6EJr+fTPSHTMG+bEx6fV68TBObKG3Fm8Bc4y382bqFCUt8Xj/rjYUfsXR0Sks0VJqAEazLUmgTXeZSFojYdm+CkmBKW3nrcOAKrhUhDk3Hvo1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 16:36:36.8282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 904ea5ae-6dfe-467e-4e1e-08de794309e6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4371
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_083643_586049_BD8E3035 
X-CRM114-Status: GOOD (  21.12  )
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

Hi Siddharth,

On 2/12/26 7:06 AM, Siddharth Vadapalli wrote:
> According to the datasheet for the AM62Ax SoC [0], pin M19 has the address
> 0x000F40A8. Therefore, the offset to be passed to the AM62AX_IOPAD macro is
> 0xa8 and not 0x07c. With the existing incorrect offset, the following error
> is seen when Linux boots:
> 	fa00000.mmc: deferred probe pending: platform: supplier regulator-5 not ready
> with the SD Card being unusable and the boot process halting due to the root
> filesystem in the SD Card being inaccessible.
> 
> Hence, fix it.
> 
> [0]: https://www.ti.com/lit/ds/symlink/am62a7.pdf
> 
> Fixes: 8f023012eb4a ("arm64: dts: ti: k3-am62a: Enable UHS mode support for SD cards")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> Hello,
> 
> This patch is based on commit
> 37a93dd5c49b Merge tag 'net-next-7.0' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> of Mainline Linux.
> 
> Regards,
> Siddharth.
> 
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index e99bdbc2e0cb..9cfe7e7b317b 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -398,7 +398,7 @@ AM62AX_IOPAD(0x01d4, PIN_INPUT, 7) /* (C15) UART0_RTSn.GPIO1_23 */
>   
>   	vddshv_sdio_pins_default: vddshv-sdio-default-pins {
>   		pinctrl-single,pins = <
> -			AM62AX_IOPAD(0x07c, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO0_31 */
> +			AM62AX_IOPAD(0x0a8, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO0_31 */

What! I don't think this is right.

Looking at device tree, regulator-5 is using main_gpio0 31 to control SD
ENA with PMIC. Which is GPMC0_CLK (N22 pad) and VSEL_SD_SOC. Which is
0x000F407C address in the device datasheet. So as far as I can see, the
original address is correct and just the (M19) name is wrong. Did you
test this patch to see if that fixed the failure?

~ Judith

