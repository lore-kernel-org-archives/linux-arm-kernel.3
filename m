Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD37F483C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:CC:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvMxHqPhU5RSFsDfndGe/zlDizAu4+AyuXm80cceX0U=; b=VVzIGQIeP1+YtLzhYj86pbeIDD
	eK5O83i2kZTsZyJKCdrsElnCq2SD0XakruKyV5OSlxR8fhNDP9Kmsw8wI+MC7eYmcsJP+sIUy94L6
	qz3nPhP0h+qcgTnsXM+zZJqGJHkpeOpy57bGNroSp6BCcMXv2AJhrbVKFOEf3vzZAOkrNQSwEYEio
	4/EfzaDKeRVruHaXnWqlGifKJF62WH7w8gJJs90Q/v29e0oxoHiH5lcUJCb4PICLPb12isyKgbDZH
	ethEUuLYJ8YYCGIEJTt7b4nH7WnS25wh69nZK/ps5apNFKOGw8E6R4X0pGSkt7ETuCSLuTMcimxoi
	Pf1oBGPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iFn-0000000H9RJ-3CN8;
	Mon, 23 Mar 2026 16:35:47 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iFk-0000000H9Qx-2elB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:35:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhj6PIf9XijcW+hreufTL3qcBNTAu392E1O1MhOz8PGUhLkcj4vzGAizZJy8RpqEeQ9ELXDhVzD4A2ixnULmwqXNnnCxdNmYVD2zgdHn20U2lDZBYujuNKkVyvPrRDaV+VCHiEt4j8zGrK2R1fyotwxitFJ+kbOHTJQDabNYbfXVgYxw0uewNLGjy//Gsuod7RzQGBUEwhOUEZx9+IcSnOHnxiORZ2ERRVXLGXSLU8T+xl+3IUAAdflvH14r5JitGrASOhhRg6b43WBIG3NAst6xSg9Tmqh0XSjR0G5hW8Ovh2dyUbYMbK2IrbDrIh2UwInc1m1EdM7R+clRgL663A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvMxHqPhU5RSFsDfndGe/zlDizAu4+AyuXm80cceX0U=;
 b=WXcPIr0FGG2Sf0Oe+Di++MjSfdVVYQJOxkO6NyCLye2C3IkZ8F3VuSkPGk7dj/VT5HV5v9NXNt179JC7r510Nroovh7HeilW67qF2lR33efgHvmpDGlUAts2jK98AtWal6Rv8z2+3NVSstb4DNchYcNujnI2IAiIkBoOJGLVdw8MejxlP4f1r6pYnH7BlEHFLcDc8raqtl+9Fduny9zJ2/UjGkQLaxBYBCypcs7HyUJGVPIf9ndEvjR0sBHkmCQjIuKmXX7O9KJLayuCrFCZPaRI7eADQjQ+VxFGkbFL36erf+shQQdUS4lmR8arCH26pHodIBGqv4ekagEu9KZ7YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvMxHqPhU5RSFsDfndGe/zlDizAu4+AyuXm80cceX0U=;
 b=YVU/h0iqgcif+pNUHvkNsJjEtE8pdTfhTdf8n4oioILsOYGeDWsTtLhl6H91l4hUbayL/M4WA7v6GElfncZDlqaiD/BX28TSCybR72CPhRDtNGAntwVra969vHrzLGo+0H49/LQQjr3EkXKff7Q+sA/qu9evs7F8lRz4Rv97Ui8=
Received: from BL1PR13CA0411.namprd13.prod.outlook.com (2603:10b6:208:2c2::26)
 by IA1PR10MB6806.namprd10.prod.outlook.com (2603:10b6:208:42a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 16:35:36 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::30) by BL1PR13CA0411.outlook.office365.com
 (2603:10b6:208:2c2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 16:35:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 16:35:36 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 11:35:34 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 11:35:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 11:35:34 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62NGZPvp1091537;
	Mon, 23 Mar 2026 11:35:31 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add audio overlay for
 k3-j721s2-evm
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>
In-Reply-To: <20260205130707.2033197-2-m-shah@ti.com>
References: <20260205130707.2033197-1-m-shah@ti.com>
 <20260205130707.2033197-2-m-shah@ti.com>
Date: Mon, 23 Mar 2026 22:05:23 +0530
Message-ID: <177428372304.4040484.14705758506177355468.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=ZaB2o7AlMYMgUUXhM8pGo7abby9ygoF/qLkx194uYUU=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhsyD2WcFbt/8MfusX035d9UUtonqBqxH7nsxtTD2+Dv+L
 rzJJFvVUcrCIMbBICumyBLAtmuWVYrF44iKxK0wc1iZQIYwcHEKwETWPGJkuBYUaVI5w8zjylpx
 9/NrDd7cXrC53+Bb7/OUA+edd24+lMnwv3KzwLaorKRvaYv58za/PWYQdaDQc9lZVeVZFaLn+jY
 eZgAA
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|IA1PR10MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e2d4ce4-8eae-447a-67bb-08de88fa35f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: RsvGzwTwVLWexjiH75lgAtt/KLzvjKW0pIIXSmEw930EIs5GRKaRUMWaH6kXH0wyXW7t6dohKu5+gP5ZwN65q6FoG5mnkv5+o1NAb0J2a+dAXX4ikTSrWzdK+F9/ktJGXTGp06vy277k4ybnPTfpAVR6eKYrI1xOartqLUj/ox2we+tQjAZa3gfNAueJl7lN/FiN+50zm2XjlAmyrBDDbeooopfXYOuwjECIskdq6sfMhPKgARKYVA4LywGIZspEdC9+hpW+NJpCBqb9GQt28rIk85m/Ds+oVif1+A2Q+l2xuf335ZGfqLwzx/r50Z/45DAOgVIvJ6GG0MFj6miwSTZ0HAtwzbObo1h7fBDmea2bY54mTDtrF1EZ3I3DebdNz0d/H5RNfov6T/LwsnftOgGeVTs1H2prUtGWA4KgcW+cWHBE9NZiiaNI/t4xggH7DJgND0P7pyO2uCU/sgqFndfT5sRYcZ0pJS0JoODkozOeMTPXPI0IPH2zT5HBVScI7XpPFm5P9Bq6AqM5NLiyveC0R/9n7D0CE/A0uR3PwpZue8HqILhxnFfffHHwCdRtoZ1QAaiuuVXuzcYkVWKPAj5q/lcBuPpCXvaocgWUekl3ITd03inARhjgmDt4qjRYXJIf5yz2zJOAeMQ4QuC6EeG2b3PXkcyliWtrhRLSnQpaHqCdQ1RORCh4AhC18wxFCkm+uJH8ecnWnT/u0JCI/YpavKkcz45HD8HOmrEtZMeXOWyHxopMQL4W1Dg/GJ5t9bO3McP9ruyD2GgTDDpbdg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IaSeA/laiEFuwDIBIaq+PL9rElywN31EVV2RbHIdviYCKvf7U3FkfLWpf+CJuINQlm6i+4NAfZzhhocdjU3+cOr7KXt48T2JkqyuIDkJ6o3WJB9x5y0FjHJHOqTB+1380C1dYYhCWdtvsZXajJfsz8ey19E9FrHt9UDTYxKG4lK38x3oeGdUhCFZMY9FQJGjNuwzvSjPxS7hvUw2iS3ikbD+s5dJ4TtXjpp1myVyE50u6n7DGiRvG5pT5aee3ZhYBT8fZNAZ6JuhLRuNsfX/G+srVUqw1YzXP6LwKS3Ev+7spf6IbFdsPdgDbP0YxPig4wdUlptL+/SmR3BLzw76P+vmYyKGDsWCh30XXd3PR8bqjvCagj/+m3KUpdFGl51y4WeNjY1HlQ4hmP5yFMByt7CXFvA1J6zI46eqgncPrZRVKTMWpqiIhRbVjCLzjxjy
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 16:35:36.0974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2d4ce4-8eae-447a-67bb-08de88fa35f5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6806
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_093544_678175_60E7D708 
X-CRM114-Status: GOOD (  11.75  )
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

On Thu, 05 Feb 2026 18:37:07 +0530, Moteen Shah <m-shah@ti.com> wrote:
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index ba01a929e06f..aadf783fe252 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -140,6 +140,7 @@ k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-boa
>  dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
> +dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-audio.dtbo
>  

New entries should follow alphabetical ordering

> @@ -268,6 +269,8 @@ k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
>  	k3-j721s2-evm-pcie1-ep.dtbo
>  k3-j721s2-evm-usb0-type-a-dtbs := k3-j721s2-common-proc-board.dtb \
>  	k3-j721s2-evm-usb0-type-a.dtbo
> +k3-j721s2-evm-audio-dtbs := k3-j721s2-common-proc-board.dtb \
> +	k3-j721s2-evm-audio.dtbo

Same as above

> @@ -330,6 +333,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>  	k3-j721e-sk-csi2-dual-imx219.dtb \
>  	k3-j721s2-evm-pcie1-ep.dtb \
>  	k3-j721s2-evm-usb0-type-a.dtb \
> +	k3-j721s2-evm-audio.dtb \

Same here

>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
> new file mode 100644
> index 000000000000..e00d9b6cef5b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
> @@ -0,0 +1,161 @@
> [ ... skip 12 lines ... ]
> +#include "k3-pinctrl.h"
> +
> +&{/} {
> +	codec_audio: sound {
> +		compatible = "ti,j7200-cpb-audio";
> +		model = "j721e-cpb";

Model needs to be updated to j721s2 like done for j784s4?

> [ ... skip 103 lines ... ]
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-line-names = "CODEC_RSTZ", "CODEC_SPARE1",
> +				  "UB926_RESETN", "UB926_LOCK",
> +				  "UBS926_PWR_SW_CNTRL", "UB926_TUNER_RESET",

^^^ UB926 ?

-- 
Vignesh


