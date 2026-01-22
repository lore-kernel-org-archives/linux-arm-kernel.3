Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA647C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 03:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFbuTrZRj1QT0CUUedrIygg0yJVdBJ3j6hbPxnO3YUM=; b=nTh4VifDq/395NrN6X/3C6GNxY
	HgS+PiK804Bz0LrVLZmTLRvt8AeGsLopehAKI8LgwUu+fiXoowSkeuha2XgxUSQg2bDiPvBLQm2Ex
	8PGN/KTR9ER5i2YG4KefoAF7oZ3+94E5OHr022VTxeiMZ+frWHtPaALa6MQ64IrZxEYTFv8HEP5FX
	lnOyz1eNY0r45gqRXt4uH1RsbkWCccijbja0Z7TEr3ZArDOR3CwT3tnlY4wC8mvenq6S90CNj+LXk
	DEU40n22ktc5Im3TlGLYYxWpNAZtw9h4i4F3HZy5KLpddjYTbAKMsHOVn2DTIj9/yxRwYrPTtHszy
	Lo14aYbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vilIl-00000006Mqc-0KSJ;
	Thu, 22 Jan 2026 03:24:07 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vilIi-00000006MqG-2CO2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 03:24:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+RoroHoZfNVrTZQ0bvms+wsKPH4A3iwbFQe6JHZKCu7ceIBCBNW3Qesh9vKj5FYLSqSY3+SzL2dGLTMSgMY15esIcNew8HS6+akM1CXNTkDT2N7CtApTvdE77O1WwtYp6R8hIhWgOo8EQyoRRRMouq+GCGIN6w3C0HtQO+OZs2C0BODnHvZv42RYPNTCBP1mk2+U+eb5X8pskpe+3Zqz72VSy9z3O3I2gRiKKN8UYzSfB2oc9TYuJwMcshEdgpsOLxtsswma51HGYlHm2VAoF28d58LRMtz+T1rd8Nxv9j1m5ES/pDlWoYSXbDEn5K38KQdAVIhPvs1GG1qfbj/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFbuTrZRj1QT0CUUedrIygg0yJVdBJ3j6hbPxnO3YUM=;
 b=jVg4wwXarsNLgkp4h3S/EIjogf4jn+9gSZLuEWE9mDMUxEnJDCJrSxWZQ8fgqyDZtaISuFFE5ggGEOEv57YaY8pA0Qjm5vpgoGsRSqxR5DpMjKSAYkrAdnKXSYES0TW4Xhqh7WHH4swNSuCsFzA9zkBjorR+v4g21G1YlMNsfGXjZjYVAKgNPkGG3ave9XL+3e/bb+jS+IbdqzhOsKIitu2Bc9TGx29yl12UD//gkrAD3p+zUFXJ1yqVXr8yYNkgPYcNlGtKeeRP+j9+MEdvEZp88ODaULTWq0hvPZIUPjdc/ZV+ZcjcZ4lF0xLlMHcxZXF1aEIotWEc/5Dr9XoSxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFbuTrZRj1QT0CUUedrIygg0yJVdBJ3j6hbPxnO3YUM=;
 b=q6214e2b7gfY9xdxytrXtwrMbYybCofWf3e7VOLB2UHz9jhK2Ge0v77ZZkVj077rTnq+O8VTgBijbZVMUad9rrJk4rq/ReunXGk+CL2i9FtuvI4OfgQngud2jrrrpfHZCgy90qM/MHDdNaLZ0ZA421Bopmw5KbF639+phWhPf2Y=
Received: from SJ0PR03CA0022.namprd03.prod.outlook.com (2603:10b6:a03:33a::27)
 by CO1PR10MB4593.namprd10.prod.outlook.com (2603:10b6:303:91::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 03:23:59 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::58) by SJ0PR03CA0022.outlook.office365.com
 (2603:10b6:a03:33a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Thu,
 22 Jan 2026 03:23:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 03:23:59 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 21:23:59 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 21:23:58 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 21:23:58 -0600
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60M3NtlW3944310;
	Wed, 21 Jan 2026 21:23:56 -0600
Message-ID: <1cc180ce-f808-4018-90c7-8df2c46ca94c@ti.com>
Date: Thu, 22 Jan 2026 08:53:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721s2-common-proc-board: Add QSPI
 flash partition details
To: Anurag Dutta <a-dutta@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <gehariprasath@ti.com>, <u-kumar1@ti.com>
References: <20260121051855.5890-1-a-dutta@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260121051855.5890-1-a-dutta@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|CO1PR10MB4593:EE_
X-MS-Office365-Filtering-Correlation-Id: 979f23f4-e7a2-402d-2990-08de5965af10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVV2MjM0Wktya29PMEhrSnl1THZkNGF1WjBPbVJTd2lyaHM2YVIwaC9KZFJV?=
 =?utf-8?B?MEhMUW15OVVzZzM1bURQcExKRURMU0Q2WVNEek5vcUQvSUdTR3F4SXlTTU9v?=
 =?utf-8?B?THBlM0F1MHZIMWVwMVBSbE5uZEU5VEg1V0dHelN1V2IvUFZzVmhKNm9zZC9D?=
 =?utf-8?B?Y0wwZTcvMWlyclNMaU14ZEhCSDM3NUtTZmdISzNnd2ljTTEzRUp2cmFOendu?=
 =?utf-8?B?bzBTN2F3SEk2SENxcnlEVnFDTStVbFp3NHRKZ2JNMExnOElINHVGK3Y5akEr?=
 =?utf-8?B?ZTkyaXphT3I1KzQ2M28wTmU3SDFHYUV3bE5zT2xCSHpaRFQxV2txS2dYOEZa?=
 =?utf-8?B?eGovOWR2UGtXWmwxcGk2TVBKKzBRZSs3ckFZb3JhS2JOazBuTktzTU1ybllC?=
 =?utf-8?B?TG5xZWs1eExkS3NhR2N6Q1ZZTkZhQWx1VWV6N2MyVmg4bHcyamlPUVBSVzBa?=
 =?utf-8?B?N2dRdmtzZXhmSG9pdXhNMFc3RXhPZU1YQTl5aERmbmZnZVR1NTF4Q1BuRzgw?=
 =?utf-8?B?cGpaemY5dTdYci9KT1V6WEhSWEtLSjYwZUNWeCtoWFVFNmNTVlEzYWcyalVt?=
 =?utf-8?B?clpnZWZWeWZKQ3ZxSks2OWFDRG42U0swbU5JUkxHVkNLNlJWbmNIT3ZvZ2Rp?=
 =?utf-8?B?Z3F1UmN0SVllNzhVdnJ5VHNKdkZwWXBPWjcwMjR4eDY5bEgrcjBScUwvZE8w?=
 =?utf-8?B?dk5NcDRkUzJDMWc2Um83cW9FNmIzeG1EanVaVExwc0NSaThyM2dvdDhSZXRO?=
 =?utf-8?B?WS9WUlBPKzRYOU9NVE4vbWxCTUFQNTFlMFN3OHgrWHVEdkFkZG4rQ3JGYUVM?=
 =?utf-8?B?ZGdUMHJyVHh1clRNWmJPbXBHMFkza0NpSzIzSFR3MnJ4RUNYeit6SEVsdHA2?=
 =?utf-8?B?Y3k2dTl2Rm9IejJrcEVMUjJ3cmI2TFRXaXc2elp4dWVySC9raU4xd3RXVHZp?=
 =?utf-8?B?SEFialUra2JQODFHV0JuaE1XN1VuUmJEM3hYUHZweC9kU29PUStxWVBEMzZ6?=
 =?utf-8?B?M1JQaTJVbi9jWUpjUlJneDV4bXk3UzBKeVZEQ2hGVGVmd1I0RHUwQ3E0UmQ2?=
 =?utf-8?B?MGVJdmU3Y29UYmlKR1RuRUZtUjcyVVZ6R2NMTG41ZVNlZlYyTEJPQXFsUVZn?=
 =?utf-8?B?OHprUW8xdVY3RGE3bUtKVVdsVk5ramFYVGxZTUNHa3lhVE9YWmdkblY2NUlG?=
 =?utf-8?B?ZXNrY1h2K2Zra3VkK1ZRcjZPckh5YjRpTXBLS1YxVm5jaWlMUm85ZHpwSDc0?=
 =?utf-8?B?aUcwMXZmVWs4a1VsOTRQSXd5SURuMXJSS0NqM1FUQW0zK201YmJoSjRiQ3Bj?=
 =?utf-8?B?SndTQ0xvVUc5ek1vZFRJcnh3djRJNWNXeGlYQVpZV2FpVVhpbWR2MGpicERN?=
 =?utf-8?B?NXdDcUVmOHlLSHAydy9jWGJtMStCUmlWQktic2JpaDZYYlA5OER5UExyTGRL?=
 =?utf-8?B?WVNEZzR4YVRpaWJ4aXozbjJwaTcvTjRoUkplUHBpTEJEZ1dpQXZ1ZURHcnRk?=
 =?utf-8?B?ditmcGh6S05uckZYNFZ4aDRmRnp1UFdDL0RpcjdMQzJQSFZQVXlKZGJWRWtM?=
 =?utf-8?B?TmcwUCt5K3Z4b2N6OTFvM3d0TmwvcTk3SVN6UG15T0M2RkhLN3JjQ3N6bkNG?=
 =?utf-8?B?U2s4N2ZXZllFQ3pWb0p4Z2RBQ1htcGpkUlh6VzBUQ3UwSEF6MlJyMmZIQU5p?=
 =?utf-8?B?dGR0VGwrVjZaYktiSHRZdDlsR2tScGdmTXFIZGkrSFJ3S3plZlpHb1J4WWU3?=
 =?utf-8?B?RkFHN0lCUnRHcXZHNDE3NnBmVjl0bWljM0wrbWZGOFdyS2FMcHNLZlUrcHhF?=
 =?utf-8?B?U04wVndOVGFhUngyekFaZC9ZYWhFSDRLbFZmZ05jSitZMHNDa1pqSThybUt5?=
 =?utf-8?B?N29HaVhPUExNUWx0MGRBRy8wMFE4Z2ZleThLWmtVL2JjZkVVQUhTVk5yQ2Zm?=
 =?utf-8?B?MUFvY080UTMzanVRaVJEd0QxMGw5YjJ5dzR0bnZTa1MramxyN0RSdHFQM0RF?=
 =?utf-8?B?c21YZ2FNZ1RBSzU0STJpNkhleWVqNGxvYzRtMHI3cm9JcG5DdGtXK3hmTDN5?=
 =?utf-8?B?T3BjNW1XR29oc09nc0c3MDJvc2FSUHRRVzFSVGlienk4N3ptUmVEczQ0ZzRj?=
 =?utf-8?B?VzdZS3BYa0dLblptc1BidmhDMXNQVUtieG9yeEozYVJ1Myt6OGpNUnVGaDR0?=
 =?utf-8?B?dkE9PQ==?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 03:23:59.5528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 979f23f4-e7a2-402d-2990-08de5965af10
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4593
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_192404_646642_5934B9C7 
X-CRM114-Status: GOOD (  14.43  )
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


On 1/21/2026 10:48 AM, Anurag Dutta wrote:
> J721S2 EVM has MT25QU512AB 64 MiB Quad SPI NOR flash connected
> to OSPI1. Add the partition information as per bootloader.
>
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
> Test logs: https://gist.github.com/anuragdutta731/b65f63f22c69317d714b65a201438cbc


Thanks for logs, but these are for boot-loader and I don't think u-boot 
consumes partition details.

could you share logs for kernel as well.



>
>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 41 +++++++++++++++++++
>   1 file changed, 41 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> index 4fea99519113..7faf9367dbb2 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> @@ -530,6 +530,47 @@ flash@0 {
>   		cdns,tchsh-ns = <60>;
>   		cdns,tslch-ns = <60>;
>   		cdns,read-delay = <2>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				label = "qspi.tiboot3";
> +				reg = <0x0 0x80000>;
> +			};
> +
> +			partition@80000 {
> +				label = "qspi.tispl";
> +				reg = <0x80000 0x200000>;
> +			};
> +
> +			partition@280000 {
> +				label = "qspi.u-boot";
> +				reg = <0x280000 0x400000>;
> +			};
> +
> +			partition@680000 {
> +				label = "qspi.env";
> +				reg = <0x680000 0x40000>;
> +			};
> +
> +			partition@6c0000 {
> +				label = "qspi.env.backup";
> +				reg = <0x6c0000 0x40000>;
> +			};
> +
> +			partition@800000 {
> +				label = "qspi.rootfs";
> +				reg = <0x800000 0x37c0000>;
> +			};
> +
> +			partition@3fc0000 {
> +				label = "qspi.phypattern";
> +				reg = <0x3fc0000 0x40000>;
> +			};
> +		};
>   	};
>   };
>   

