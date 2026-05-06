Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC72FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2uaXvFyOPrHGhDiEghKRxA4ukwMLrgGBi7EXrbkhqk=; b=U8Nm62opDCk3pHTl6k3ft93kO7
	5Fidzc9oZe03gvFP4m/fr0o6BsGhKMb82u/jfY2RWlN1AK5zB/mlAZ+vSCCVYQSEOPcIwOrxtHC3z
	yKGVD6XliSXKANMLoDacfQxlHKFOzEgtl6PEHRmwBe0r8Wig6gizwd8LFJZ1ZRuSVEaAFkatzSdNI
	6s340Ln5XzMImuQtcby3ueHtj2rl5qmjltoP8AHKlZ8d712kWwZa4T3R6RWlT/iensFmzs3VHusVl
	/VxYireTAHUbA29bKravx+nGO97LT3RfuX7YWvwNki2g+a2tP/HQ1I+7Rg+HOeX+Z5zapUD7baeuI
	ZjXM00fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKctm-000000010Fb-2TID;
	Wed, 06 May 2026 14:06:50 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKctk-000000010Eu-24q6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:06:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMQ674YKP1+gWj4pD3kw5WJ4QzBEVT1/vAolGLzDC/QYJq1E2rj6Ls2puve2+crmIBAeHc7U2KdT34C/lTaU+MeTDMQjTrie93g8z5/WworQzoac1X9MoylYdU6LBX4K9jxr6oxCohFCIdY/dP1+luAFq0E3wlT3fgxVDSGfKBQdUt3FJLYvDCs+eb7xyiajLwkv/lz7IwJtpnmQeQ+mDC5XF+AByXSv04NAT0i+SBPdYnhZ4NC4KwiF463I/lEp+1g6Xau/ylu+Sq/WxWGBbKNxpR0b0qiJ4dkD5ZS/uR5FAldsNKzC6ExojtetaJbE/sPnu+32aw2BzbQnYKgApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2uaXvFyOPrHGhDiEghKRxA4ukwMLrgGBi7EXrbkhqk=;
 b=SQF3HfVLVK9eS9CXUYd2q1dv2lsmTzrcIDt2aF29qA8K7Z44xTP6JvY2orQSx8mpBN7Q1fmHAzmW7ldB0kZ20IM16pMFBdhmzzPjRryMPv1isnFmUQiHqPwuSB4q9h2t5XZ5pCzy0Hdqh9ze+3lxDRB26TqLtuKejA3pvX6crYtva9+doPqloszI8ak1Tg+OtZ99FQf7ZM8SZf+uxLz3Vr6+MgpnvGSw6Ek6+dwuellVb9j6UmyE8c/JjirE7CrgzOln5SCgrE+CVscAYaMmYXVjeTvoit+61vMPi+bVlzsndwP9pt4+JEKnIZCl0JVAzW8D+SoltsYc/0sF4dW19w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2uaXvFyOPrHGhDiEghKRxA4ukwMLrgGBi7EXrbkhqk=;
 b=myW27Ymt81nkYdfAhmxW9f/bTNzAwMePdBn35cEG4t/LEwm15FlO7EwE3i8UO4QnVkyNMsarX9F1zBstLpcdszX9OewDfyODLS7ji85KtNl4rRliBkm/hUHeTEA43IwJYIh32Vk/lP4co7tatgDxd2qdtfzPwGAFRH+VPXmzR4w=
Received: from DS0PR17CA0019.namprd17.prod.outlook.com (2603:10b6:8:191::8) by
 PH7PR10MB6081.namprd10.prod.outlook.com (2603:10b6:510:1fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Wed, 6 May
 2026 14:06:42 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:8:191:cafe::a3) by DS0PR17CA0019.outlook.office365.com
 (2603:10b6:8:191::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Wed,
 6 May 2026 14:06:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Wed, 6 May 2026 14:06:41 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:06:41 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:06:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 6 May 2026 09:06:41 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646E6fD21514332;
	Wed, 6 May 2026 09:06:41 -0500
Date: Wed, 6 May 2026 09:06:41 -0500
From: Nishanth Menon <nm@ti.com>
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
CC: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>, <richard.genoud@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>, Abhash Kumar <a-kumar2@ti.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, Kendall Willis
	<k-willis@ti.com>
Subject: Re: [PATCH v7 1/4] firmware: ti_sci: add BOARDCFG_MANAGED mode
 support
Message-ID: <20260506140641.4vukihz33vzzeanq@eternal>
References: <20260506-ti-sci-jacinto-s2r-restore-irq-v7-0-037098a35215@bootlin.com>
 <20260506-ti-sci-jacinto-s2r-restore-irq-v7-1-037098a35215@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260506-ti-sci-jacinto-s2r-restore-irq-v7-1-037098a35215@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|PH7PR10MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3d99a6-caa4-4106-8207-08deab78b2e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: cG16kSWGDuCoxVLQSnaT8YGWvKcYh0blqjjv6MfaDVVMc7yELannWKSqLysAlSAlWJujdxYEwxlpySs2UbcAs8S71yVdlVxefLQZyyfNwZtPug5zrfYIQ+B3psssYEYBwpK79BUkjAyAH3ETTm7Jjg3wvuRilTTMxv2YuGDjCWgh/usfy1CW21low4/eg0ae9uWAmiO7XdTkBKCAvfNMg80GcD6QUuwYCscjbVvgD2SXxecbQU+Wed7gf5waQbUW8Bu4qmZUSsXNIi+USQDjcVfgcp8kOtO8FaFuWj3tpFDnv8GfKngh5oyDtSoIYYCHHFDZS4IOEoRp0G7XzQwCUk7T5MIn7/q5XzsR7Ji7x0ZYCLhfgmhU6+e8WBDCxvD7pGmPtV+hnnd2y+vdO5HCm2gLZD66Kvb3Tol5oRPbUy+eFgQisD4sQTkovu3r8OjwiKKan6hzee7xXJ+Wl5UJlgWQDutKfbDvTd4YVFav/r+nz8l2rw2XnjnUeuFrTkwu8sPFtSIDEk50tURVG0T3hlOdjkrx9xN0dKeEGa/aW9k5zyMc+s6KEwNPwQBYZZCgzMIy+0+19v1vZsEBb17AgrqrUVts5mYVBlVn1Ck7Bw80A39UHmzK/WgFbIk/uLEbMt+C6aEkt52F4BqJZAu2cDqJcwbLEo7tIpML4j6dM6P45gmWYiImyTIsKADoaMB/VRJ3LwVKyZn4ruzBv21zsmDH7XgaBOddmkTFVzgSsfA=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HGyiabP9bPE4e/ZjJ6yPB1YDajYzodv/aXxcYAVyREydl1eF31Yk5n1bh4I342TvbT/f7heyYb989JlwwgHee+cfi+XNEkk6qc3XQ+2K6B+ha8rZVG0J+asEIL15XuYT1V2QEir6UcYA5J68nx/G+LABWCHhAkKF12q1v8laVr1ukxqz84VluI8iRggeG/20wMNsHBVo09BHbW8L7JGk38LSEq62UnlDj6zpbXTw9frfQrgyCkfenkRHpD2Uo7u4I9rF20xWTKW8PlGHY7AF6pJGIzr3mqa9YKoOx6Fc3mtnYwggBeoM8w7fGaNyO/9tdD5vfqDQRq0uePkTFkrKFLbo6pQSbsDEvpLfAk0fD5dHBCvLrrjOWiSnbSS0lx9vsIxRbWy5aK9ycZJ5Dzg6mWTUadqufF/bDLiXqSEfByRGCjTggWzjrVVgfflcK+7T
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:06:41.7907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3d99a6-caa4-4106-8207-08deab78b2e7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_070648_540028_B5363A9B 
X-CRM114-Status: GOOD (  14.20  )
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

On 10:35-20260506, Thomas Richard (TI) wrote:
> In BOARDCFG_MANAGED mode, the low power mode configuration is done
> statically for the DM via the boardcfg. Constraints are not supported, and
> prepare_sleep() is not needed.
> 

minor nit:
[..]
> diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
> index 4616127e33ff..d90de59e29eb 100644
> --- a/drivers/firmware/ti_sci.h
> +++ b/drivers/firmware/ti_sci.h
> @@ -150,6 +150,7 @@ struct ti_sci_msg_req_reboot {
>   *		MSG_FLAG_CAPS_LPM_DM_MANAGED: LPM can be managed by DM
>   *		MSG_FLAG_CAPS_LPM_ABORT: Abort entry to LPM
>   *		MSG_FLAG_CAPS_IO_ISOLATION: IO Isolation support
> + *		MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED: LPM config done statically for the DM via boardcfg

will be good to keep this under 100 chars

>   *
>   * Response to a generic message with message type TI_SCI_MSG_QUERY_FW_CAPS
>   * providing currently available SOC/firmware capabilities. SoC that don't
> @@ -162,6 +163,7 @@ struct ti_sci_msg_resp_query_fw_caps {
>  #define MSG_FLAG_CAPS_LPM_DM_MANAGED	TI_SCI_MSG_FLAG(5)
>  #define MSG_FLAG_CAPS_LPM_ABORT		TI_SCI_MSG_FLAG(9)
>  #define MSG_FLAG_CAPS_IO_ISOLATION	TI_SCI_MSG_FLAG(7)
> +#define MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED	TI_SCI_MSG_FLAG(12)
>  #define MSG_MASK_CAPS_LPM		GENMASK_ULL(4, 1)
>  	u64 fw_caps;
>  } __packed;
> 
> -- 
> 2.53.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

