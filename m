Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0521FD8FE7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 17:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9TlxE1gH5r3d7X8NijoCBdiHdCbjv9mY0VQW5vrzyU=; b=tQgYBGXEio6mKbW2CENBRk80D1
	iORMk1IK83Z9HI0BeNG10Wa5oykUCWKhaTEh/3I+XQfQhjIDGYfIvDdUHfE3ggyuihng7iqFar9yY
	GmqCmqzFNomoqo+hFY/gJTWB7q3Izg6BsqavdFKzxPzC08R132UzxM0GjhTakS80mGadompuhPN0M
	fXRpDwEHkUGI5820USPYHgEMkUVj1JmDOz1wGePfVWHLoDKPp5qUGUW8hNOGuAO94cbcKucpZSSr1
	naapxP1p0Bc27OCw4ppTdpm8uwDbuytrvQRQYfgxLv0QRdo8ovhAvmPdHAvykuwnpLfYtbwlpDkOs
	rh13bG1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfTq-00000006sxs-3IKu;
	Thu, 26 Feb 2026 17:48:54 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfTn-00000006swy-0HVE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 17:48:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t21RgdcEHKCKaRbanMRTlgGLVvLGCAZdc8VV++sMcaDUnKPdjH47mUmf7s9kJVKx0TbbUNxC11sBeU1eymvD1PQaENo0x3nDE3A88KiFehFfKgTrvVSbZxIOWcC43kSk2XOE7KoQT7e4Tb5+h2MWfwn/Z/f2GwAB+V5RlYrJKCEfs/L7coEvhO3rZGsrIM1VHLEsUCSUWMjFmQkDnVZ67UqlEYVrrRxY3PkUbn/x4Pxc4szMOjoKStlePOG8+cYOVsq4L40cX+I4JWqebCPbHQ+k8fGZhOMgxNt10CNZABS5YLfFYEdDuh7ZKR9BUjtp7gPq+TulpWZ6+IBw28KW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9TlxE1gH5r3d7X8NijoCBdiHdCbjv9mY0VQW5vrzyU=;
 b=cPY0VeTJKLWxDP5RdAL4OhWdPm9bcijqdxqaKYmw0I56TWwMmnN/dZo4ocP/dRtCddlfnQoYxNQBNdi/h5wRNgnXKT76lPnM5PfLkoPaD+y1IVqJA9wySqcwwK4Cy3IK1J0N4Cj6b8jM3XzQG0pbeN1hNN9SWOsbd/k09s7339B61kp1DDFDl1oAmLJEcDINGLtqv4WR3rOZWlqWbYmVQ3Pvjto1IUN/YkX7ttMoXIFRm+FaZSIUa8I2bFYFGpcTpEguHNvwY6L/JKP32q3oUZ+j7KkQ9/9V4TXhnObwmGy9qR0N2/FZHb8/fOlzRO6pVL4qNBiMbmH6XNmCiNmseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9TlxE1gH5r3d7X8NijoCBdiHdCbjv9mY0VQW5vrzyU=;
 b=UIPHFxNMHcg3rvr4v505onZ63FXQBPFGH9TlzkJIInBAmK3OLhmzSUoqOSLNF2KAH84FLRAkHeiT7trm5GBzwrMRb/7rtcQpFdpPE/GA76/plBDP3QPxHPxxfRLcDYUc/3VIazGU4sPOLZoRepH9hR3xEuXL8Dm+v+ajT6Hm/Gw=
Received: from BN9PR03CA0434.namprd03.prod.outlook.com (2603:10b6:408:113::19)
 by CY5PR10MB6189.namprd10.prod.outlook.com (2603:10b6:930:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 17:48:45 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:113:cafe::23) by BN9PR03CA0434.outlook.office365.com
 (2603:10b6:408:113::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 17:48:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 17:48:44 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 11:48:43 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 11:48:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 11:48:43 -0600
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61QHmdJv2289228;
	Thu, 26 Feb 2026 11:48:41 -0600
Message-ID: <46eed0e2-e5cc-4bc9-924a-83646cbd0351@ti.com>
Date: Thu, 26 Feb 2026 23:18:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j721s2-common-proc-board: Add QSPI
 flash partition details
To: Anurag Dutta <a-dutta@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>
CC: <gehariprasath@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<u-kumar1@ti.com>
References: <20260226091730.2735587-1-a-dutta@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260226091730.2735587-1-a-dutta@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|CY5PR10MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: e55b4521-3c9c-46cf-f3f5-08de755f4914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: qtAiSWvZKApS7ZRXzWCX09mabKVyvfwgKv/2FCMRGdmiba6rJGzbWPOMu0Jh+Z7CskKevAAlKJKJQgJ2lYzNish9NuovPOZQhzovwdLxzwXskJJs4PT+XPHE4Be+Mt2VnoZWpVZ7EBNs5nNeY/Qs1BfuWTHhIavZWd098yVAIeN1nm9IeuRksm8fBNarZF8T/7t+XdFtKwOg/HZKEe+jRFPsq0KNHUdEJPmj3VOLQTf3e++fVSFUjNXetkFsbLNTCh4EKvfLmojY7TRRGjeFsjeWCHUuL/Xlu9yPua4f7gpFEc7LtAHHX13h9xujgYHXreVWGFJp9nq330svetgk80TNnhJfLvbRJ2AAGCw2u4kwiPRx3worsQ3Po93knUy3z1Nz0U9/+U2cNAIfRK6QtJ9kDxj6zJihFu2zE2ibJeSPhvgtO9GNwrpKd1PO2T/Y7TVxxjWnjHHVb24GjhJ9ZbWlWe4IWCILAuqd8Y8JuW3wVH/1biX1Xaq4Ioc7BefHvhYs3jbgH0DTino2PPpCyYCEfc1uv2aXRO0cb6JlooMJqQNKeWtlfl1U8pNWKbj1iOQvdGw4rbgDYM1VAqH2tXJyk+kzOsyNXXqQ1dLPFsxyDblYmhtQ9yyjZcHZtxC8EtDX4RM28qWvGBOPxNQ17u7GYdR3GZWth/LSF9d4FG7I8FldvbCgsWK6QjeULeLUD2svx6JTNVwcF0WREPQAqPNM1uzbwRt9hsyrfBXXuwgTEvpqLCUDwj/Te9NvZ1oVtoeN44DWRohjUzmVQfamaCdt6Rc5pNWAli5UpCVGYl0=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: i8VEo6X3ZtOVgNQ/EHQnp/gnE2MeM6WcXvZCiGwClv1QneeJUGTiNJ7nwh2oynV+gJpxzgJWkRZfTeQfDpdel5oDua/rq9b5n6ouSGvhj4aROdL6nTuqlbGlidkw/ytbo/qBLWGWXYc/jBytOZHOs4OTt0Aud58ey1Mt4d7Nl5BhhcqqlDHXo7rC5VdA3T0Wzk5xiPO7+sIO/xiNru4935xRnKvMktx4UQzrg7kKDISrN9TfsuIpsh3aHyTdXUpSugvWA0zajymY0hnd3OcRMWnBfdMuHNsTL34Gk/yVVJlBusxN2wzsjgfGhB4E4xzG46RC4skj14iVKIBFScvHGmgq5pnlb85kMA3a/ohmEJPcgs0hueRdtHvA4t7f6aruYsOKv2FSM385zgokQOW6H7o1Ur3/x+jcdXBP8cutu93MJ0YJmL/rybWjNiG44yAc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 17:48:44.0508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e55b4521-3c9c-46cf-f3f5-08de755f4914
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_094851_333434_93A5DDCB 
X-CRM114-Status: GOOD (  12.01  )
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

Thanks for updating bootph

On 2/26/2026 2:47 PM, Anurag Dutta wrote:
> J721S2 EVM has MT25QU512AB 64 MiB Quad SPI NOR flash connected
> to OSPI1. Add the partition information as per bootloader.
> 
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
> 
> changelog : v2:
> 1.  Added bootph-all to qspi.phypattern
> 
> Link to v1 : https://lore.kernel.org/all/20260121051855.5890-1-a-dutta@ti.com/
> 
>  .../dts/ti/k3-j721s2-common-proc-board.dts    | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> index 4fea99519113..1b48294e47ac 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> @@ -530,6 +530,48 @@ flash@0 {
>  		cdns,tchsh-ns = <60>;
>  		cdns,tslch-ns = <60>;
>  		cdns,read-delay = <2>;
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
> +				bootph-all;
> +				label = "qspi.phypattern";
> +				reg = <0x3fc0000 0x40000>;

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


> +			};
> +		};
>  	};
>  };
>  


