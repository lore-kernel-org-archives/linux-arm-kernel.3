Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC8C10706D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hdj6pYVf3MlWx1KQWQJp+wwAam89Yib/Ytw0wY8whes=; b=AwzKl6IycsAekS4zfBdGju9AsV
	Y5mH/DN0rkaNdhgnrr4e62nhK4n08XdqiBQrUkfyl5t7qNiXpW650HQsVQlOW5E4CFcQLd6w7GmGt
	YENbqvTxHnNbdASbEgnDhDVcDpBbdcGgruBxWZWTGbta0GhJrfqAMUP2tOe3vqTzXyKaDvCcoTM4b
	mb4vLSlaSGEffx+7EQv++u8MLhuNASPcbDG9eb6tOCkoqX9xQzGaoUDrj60ylchTnTDjz6Nji5SYR
	NJmqt8W9fgo7lZxfo1U9GHEMCttmM+UzkiCsoe6nGHht9GfMbzy1gZT0rwfl9XUU16884fkjYGqGg
	rXKMOnFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1OLy-00000001qk3-0e5J;
	Sat, 14 Mar 2026 12:44:26 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1OLv-00000001qjZ-26jE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 12:44:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVDAG4akccElaEZjDrRSu+0UwScFdoKQDEgSieTqJVSW1xUrg/iXs8Im9eTXecA7//QGtewnmkY7wO+RdOaz9i6Jqn6/iIkonx3VOC4YiF0uMzVjRZeb3wgzN7SMzO1Y0iQSsGafSydIaGuJsB1xlSftHb8kHsugH5z3aGkAoAewjYek5eDHMkbtGT78UaAYiO5j5P3WXn4IO7BnkM9fT9piOV+wIvDzi/vErsu/67M+pFcCor7QMaTf8gTDhKwMDgW5El8SqqBAjzPe/1eVvVG7qsr4bjCK93RO8b8d22hd0NXP6B0B/kEmASB2JXKf5FES2E/m+sivD9RPBv1TyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hdj6pYVf3MlWx1KQWQJp+wwAam89Yib/Ytw0wY8whes=;
 b=ADKtdRWyJJzdfGfYnoIoN0N/EHewPX5jZ5mJn+wMkPaF1dJ9697Ke51mIonvheQjcoXb/wDEkpuDD8aGlxkhYGPpw81uG4liXD3y0nQRW0MFLUMEHoI/nW5Syn/ddNFD7zNOI7+VIK1nSONB1tvRTGk3qBPd3+5Fkn8hzsg5egK9pCQ82AXAjImYqdlI7Yb1CdHtMIYS57H/aTPl/CiMO7vddJjfg/uxFlBvLuxszisJHjqnu2MaYfe5HUgO3i9BeEvIIcCIjB53YylB+OKbF0DXmedjGswjvjtXgDthWEvowOtgCJEOjWI30meXyMi1UIc6lSBkBias/uRppj5I7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.phytec.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hdj6pYVf3MlWx1KQWQJp+wwAam89Yib/Ytw0wY8whes=;
 b=ETk9SdjvsH4N9nsCS9gsJFDWuzFwppgsm0f1rrycKHciUEztvzvkSbSb9RKGEmjKF6DLq5yV6M4QdYujJi1E7xYii+oJtBaQE27uTKmnucwatPkFdLCqFxVro22l8DR+R4YNZAxp4xSpdJYEDV7ys1r2xqLRugLemKtwf3XecM0=
Received: from BL1PR13CA0442.namprd13.prod.outlook.com (2603:10b6:208:2c3::27)
 by DS0PR10MB6894.namprd10.prod.outlook.com (2603:10b6:8:134::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Sat, 14 Mar
 2026 12:44:18 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:2c3:cafe::6a) by BL1PR13CA0442.outlook.office365.com
 (2603:10b6:208:2c3::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17 via Frontend Transport; Sat,
 14 Mar 2026 12:44:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Sat, 14 Mar 2026 12:44:16 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Mar
 2026 07:44:16 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Mar
 2026 07:44:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 14 Mar 2026 07:44:16 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62ECiCTg1752456;
	Sat, 14 Mar 2026 07:44:13 -0500
Message-ID: <07e2df6f-beca-454c-a080-b18b37b5daeb@ti.com>
Date: Sat, 14 Mar 2026 18:14:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: ti: k3-am68-phyboard-izar: Add
 LVDS-Display
To: Dominik Haller <d.haller@phytec.de>, Nishanth Menon <nm@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>
References: <20260311234844.56443-1-d.haller@phytec.de>
 <20260311234844.56443-4-d.haller@phytec.de>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260311234844.56443-4-d.haller@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|DS0PR10MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: af35a290-3f12-4f73-a419-08de81c767aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: XjJvKJ629IR14Wc397AGiHl+FLqs3Ldz3xthxM5qAXvVvT4WuPm+IiwWeESrgyekAPqVKlTw44Vp+dSD6WU0oJWr7wnoqwlGNIWL5jEUw4jqP2vd8IuW4peQmBDC0j0d4OzVVGDiTM+TbbA4ZzditEQPHqyUg5BTkfO8DGZt3u3JGknSbS6fGhgjwrsMP2tuUH+6TDmB1dd2MBlMha9nxpgCglpxw2ynVnWF5KKw5QfoDAMZpoTW1bcq5LXyTY6fswjwaGDBkOer+nHE/mS+QCzimkpp50R1ytNCdWi1RTsQyDotcvC95ZfwwSXACIefzo5oJ/G0ag0YeTTxKyIQWYCmiu5TbHqnxewSq6hQvJBoOL7nM5MtbBajr2VYa1hYTVxvmilO2YtIlN2vPLaVgVEz68ngB8pLP51DjvIXEeE8zx4X5XhXZeM3CW/U3AvDarbPA2ptfYNP8wYE4sVn6WKtsb2advQ/mA5zm/t+WElTd4z12Wyo6nnHTIFZkcL5FjuFZjTfNNXsJzm+iAy83tjD1KXOnr8Wyg65WD+2OQhGfROaNiNjaevzxuH/eN0cKKXXhE24P+K5ZGBPwCayjDZbi/yIaGtwt8sm/WuSIO7tY3+JHOwSo/ohxTYIS3eeJxSwyu7r4SZzc3plgCn8Su3syhDAgX+UGVqcTehRsVEV55RutH8mT4mJUjG1YceM8qXFwTU4I03CUqpNhTNSGneTw675SIqSZZfl533BVEOgMk6cN1w5m2FAKKmkk/+FTR6iFCUhU96cGaZ4td6nuw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MD16w/M855WNCBWgCRrniw64VxHRT/xuzarEOaHvQt1Esw/AkmC9kvuH1QbJKBxe2oq5tHEybx5onztveauTaHKjcl8Dr31kPvabx4ZlHK/9tVI4dFuW4u9UWCvmFGxH0DKOCzm7L/Ithv6ZxLDdrzabYdclNj5BjT6dwtiBu9bhN/Vp+Mz49EdyWhne/MMBzP6leWHQq3f3JMXvExYCXDHujGpbchvDKsWY+fBxssTSXEUSohiaOSKiE+mNUIPorSButzWWlWk6ExYhRc+teIPTwk59aaA9/ObsT/FkJWZojn+UQnyJ4hPHOChFVIWp9CfyVnxEiuXq2H909XEk1ZEFZf6rhw/RoUXadSjCw3+gipkyq6j//7/WMVoAtl6hi6Su9HS9HI6ep4DWfmDVA8XsVOmFH4TF3IQi1/00EuLD3eJzl1jT6iPe9PWy85iP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:44:16.9649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af35a290-3f12-4f73-a419-08de81c767aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_054423_552165_E3B88A70 
X-CRM114-Status: UNSURE (   4.69  )
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



On 12/03/26 05:18, Dominik Haller wrote:

[...]

> +&dsi0_ports {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	port@0 {
> +		reg = <0>;
> +		dsi0_out: endpoint {
> +			remote-endpoint = <&panel_bridge_in>;
> +		};
> +	};
> +
> +	port@1 {
> +		reg = <1>;
> +		dsi0_in: endpoint {
> +			remote-endpoint = <&dpi2_out>;
> +		};
> +	};
> +};


> +
> +&main_ehrpwm0 {
> +        status = "okay";

Use tabs please

> +};
> +

[...]

> +&sn65dsi83 {
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			panel_bridge_in: endpoint {
> +				remote-endpoint = <&dsi0_out>;
> +				data-lanes = <1 2 3 4>;
> +			};
> +		};
> +
> +		port@2 {
> +			reg = <2>;
> +			panel_bridge_out: endpoint {
> +				remote-endpoint = <&panel_in>;
> +			};
> +		};
> +	};
> +};

-- 
Regards
Vignesh
https://ti.com/opensource


