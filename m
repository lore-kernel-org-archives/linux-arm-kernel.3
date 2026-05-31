Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACC1CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 09:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mn8whYcVW3vMygz/cDRoeASkzCat1BmVxcdY1jmBjwk=; b=QkLW3+BDAYmp/EukBkqOR4CS7Q
	yhZ3PplHt4dgH96do/7LxhV2wfBt/pm55iTx9IcBC/7J3sP4d87QR0iWT6YS8D84ni4r5uapj4LFg
	aIdesnWjzfjBPvUB1+xo8G5c+NLNu6vhQNcvRgwI298IvGtHXKennzF7R4mK2RYkReWBvZ6rHpnph
	dDOkai7SX4SBidNOTQEhQjY/rMf+//0D3r1lAJmv3RbjVkZdiweqDDdO6cGlFc6YxPIXEajqVVYJf
	NNBMKH/HYRVaAbanAvpOV2ksWsPzYxJSdgvZ+G8r656F/QzyBal0OYqVye8FD2Qq1xOqxttY2h8y1
	d7vlRjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcgW-00000009SNH-0o8I;
	Sun, 31 May 2026 09:42:20 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcgT-00000009SMd-29VR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 09:42:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kkc47EjB6pV1NPASzBUpLL7s4Rd9XlgYTy4n3YuItRfBlSmgPfntYfNaKtyElBHDYOMlQBC6DRmAvVnplZbUx4+KYghoAu1OqYHKLYQkbqpe7mqkwH2BuHgRRyGuKukG8hIiDFtkppZwYXGkBeqseX/O/qzijSHmCYir9Q3iqv0kX+ilR9TA/iD9kB2TMS2/hOg1lgi/yeIg49mlZeVN18uLecd8ZPx7W4/6c7pSC7yg54UExp+efKLOci6XUHiVT2GPAsXwBGHjyaOJ77c/YwC/IF2wqcgKrtkLm3rDa2hGK8OhQsJoLgbJBIz7GGO1gUjwDH+3Evn4Yjqpf8kk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mn8whYcVW3vMygz/cDRoeASkzCat1BmVxcdY1jmBjwk=;
 b=M9J6M8x0Ij70yjqHHCDfLqoG9E9f6jSv7o5fxjKBeZkkXLSL67+8hAftFJk5gc0p9FEbG1i5gY4hykOUy62UKpF5uiPbC6bQmXIX3fGwnY6sMoHiQuS+vrv4LcfaiSjw/jK9KwFSFyemwcpC3vHSV69O0qRAVqvewHkGw+DAhZ4q/cbpaRqUNcw59p671g1KIacnd68ko3so1FSC/JUuAlGdM1VREMg9JQs4r+fVfTLQCpH4b86ovafcyTzWkkZYWWgwlHd5NYt+rIxj4kKckIxLMse4YB00b+Czc7jgOQnWogOES+rfZim0k3gIFFwvOsbgKnN7fuDvmtADTxFsfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mn8whYcVW3vMygz/cDRoeASkzCat1BmVxcdY1jmBjwk=;
 b=eWkAOyPqsfiLleG7QJI0tcxQb9NAuNVCXSjOPGYYm9Q+fu0bau7v0fnJl1ldXn6vX9at3xxHhwIovgtzLly9//qmQp1f5T1yvVXCOFPL99hREG/F+17AhaYBx+8iHWqdabs88tPQBGFUOFfQ/LudYyOwa9MFhB2G4L4WaC3ouR8=
Received: from SJ0PR13CA0173.namprd13.prod.outlook.com (2603:10b6:a03:2c7::28)
 by DM4PR10MB7527.namprd10.prod.outlook.com (2603:10b6:8:182::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 09:42:11 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::a7) by SJ0PR13CA0173.outlook.office365.com
 (2603:10b6:a03:2c7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Sun, 31
 May 2026 09:42:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Sun, 31 May 2026 09:42:09 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 31 May
 2026 04:42:09 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 31 May
 2026 04:42:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Sun, 31 May 2026 04:42:09 -0500
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64V9g4RS3529053;
	Sun, 31 May 2026 04:42:05 -0500
Message-ID: <7d29b011-92c2-4a80-80a5-6e49950cd84a@ti.com>
Date: Sun, 31 May 2026 15:12:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: ti: k3-am67a-beagley-ai: Add DSI0/CSI1
 mux
To: Jai Luthra <jai.luthra@ideasonboard.com>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>,
	Devarsh Thakkar <devarsht@ti.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
 <20260515-beagley-cameras-v2-2-f6acb66c9995@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <20260515-beagley-cameras-v2-2-f6acb66c9995@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|DM4PR10MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: db91e812-0f8b-4d81-510a-08debef8e2e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|7416014|376014|22082099003|3023799007|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: YNQ/NngnFzYkdFUE5eWY3zD55W9tu79AGPoV2AhlfTzMli19gaocrm7I0MQW5pbq6XmQsbeRGIQ3ZGWtq/rJGjcY1VQD1qFBqJRSlhy6k9xyibfZMg91UsAHZVmX2YoMUIB6SuVeZZB7ssBmnqMuvmcdkG89pMzyFY1faTtVx8zQ40foO6+5MM5+vc58Oj8Xy9SAYTSbKC2oz5lmFsqQ8BKcGW0+4qQKGNLjDgfPRdU5kzycsrwDx0XVvzSCZtPiHxzSsNzmpQOuS+XWBYYZqqH7pJRIRuQml1qBxntyP8etuWrKStgrfkOb/CKZFzlDN16vFs+OfxbGFCVjYFNVNT0pSOfjX0NN7Zz1m2fW292lPeOf9nolavA1xo/Un0he/Ps6GBvfrsrUhNapBvhk0fVyy0wpccUwd5itaHRoJzxXkfy8aZB/mKMACVoa5BG4FFBCnQFWIoXJiYR5mQzRxB44ensa9p7/NzURGxyADHy/oIOP/PHB6E5y7YLYYrYgdYNjH5tQTf6TPcYNZp5ceFPASAWk8iBxT2XvRqzy5HPozsxyZweV0ZakZKQW2XXmVlJeHcdJymcfwmx3sS8I9H2q0tDXKc0rUMI/7P7LRzgZH8Iu6u2+FE1HIvljvJ9f8Fm6/W4LMIOBIOhzLZuo9TmTmGYG7d6/aYV8OIsMAj26wh3qwEwhmMI3tkUEuS7PaumXixJ2SMjWFa3gq+SdgiMdcuSDgtEVVZ8XvN5s85U=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(7416014)(376014)(22082099003)(3023799007)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CLxqlJMkU9+Navk6dRKhFDabc8KU+9YwuZZbAdzcu/t1g8IpebmoSNGNNStGKI2F1BCe1ivxIZkoWKAcDky4nzPYD1ivf/ItiyFKhfFURn9G1ZgQzKT3QYbjRmZ36jNRF1YgBjVjFjG15xYmqvedGOQpww+zKnQkhSAfASdKb80X/abl6rlR4FkiSYcauKrv6T4t5Vjfm3zxNNwC1zy60ur18+5iahwrDhcVePrRTFrsrwGBOZ0gmkdEtBt5KbCYqJ1X9ArmEYmUbvN71s2PZc5fSM3DC08Kg8pxB3nWLyikei+4awz0C9t29aBApCM+VefeCfee5JPz7Kc03TcZn/fDzRfhNvI91iQK5ppCcCpOg/KzAd9iJ7unI6xnif2vaUYfgI5qHCCzILf+K6tnvNT5sN5ywtpo3RC3ywObDzbNClQO7osC9gdrYjEi6Fag
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 09:42:09.9864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db91e812-0f8b-4d81-510a-08debef8e2e7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7527
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_024217_666899_33007A15 
X-CRM114-Status: GOOD (  14.87  )
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


On 15/05/26 06:46, Jai Luthra wrote:
> The DSI0 connector is shared withe CSI1 and selectable via the TMUX646
> switch present on the board. Model it using a gpio-mux so that camera
> sensor or DSI panel overlays can override it.
>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>


Hi Jai,

Thank you for the patch


Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>


Rishikesh

> ---
>   arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> index 06aac02a7668..041aee2cd5b1 100644
> --- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> @@ -146,6 +146,19 @@ led-1 {
>   			default-state = "on";
>   		};
>   	};
> +
> +	dsi_csi_mux: mux-controller {
> +		compatible = "gpio-mux";
> +		#mux-state-cells = <1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dsi_csi_mux_pins_default>;
> +
> +		mux-gpios = <&main_gpio0 2 GPIO_ACTIVE_HIGH>,
> +			    <&main_gpio0 1 GPIO_ACTIVE_HIGH>;
> +
> +		/* state = SEL + 2*OE : 0 = DSI0, 1 = CSI1, 2,3 = off */
> +		idle-state = <2>;
> +	};
>   };
>   
>   &main_pmx0 {
> @@ -199,6 +212,13 @@ J722S_IOPAD(0x015c, PIN_INPUT, 0) /* (AD25) MDIO0_MDIO */
>   		>;
>   	};
>   
> +	dsi_csi_mux_pins_default: dsi-csi-mux-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x0004, PIN_OUTPUT, 7) /* (L23) OSPI0_LBCLKO.GPIO0_1 */
> +			J722S_IOPAD(0x0008, PIN_OUTPUT, 7) /* (L22) OSPI0_DQS.GPIO0_2 */
> +		>;
> +	};
> +
>   	rgmii1_pins_default: rgmii1-default-pins {
>   		pinctrl-single,pins = <
>   			J722S_IOPAD(0x014c, PIN_INPUT, 0) /* (AC25) RGMII1_RD0 */
>

