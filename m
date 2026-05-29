Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5A6CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zqn0VJnup1amED1+jIaovwqBpHKsTnCzDBWIf1qhL8=; b=leF/2jA7J4CKQhPmQdsDmoenfj
	X/QOgKgqidehIW5+qMjeBtlYEZQSOOpPnKNril4lOh6/JiUBBEajUi+cgtXJkt1fE3vnPL4uxa0D6
	iS/wuRzA+dWHOGJotezYnK6UMVjyqEDP1HtnLbabr9APMng7ZD54XJQ5nfoesb+LxErCuIyCWw2IS
	THizXAZVCamgOZK7zSEdkKY5mXO1O0trILh/8jqNnpwkmh03kWJBGLsxvIG1N6iPx1x/5yKnS2/33
	BPU2Z+S0hakYJ0Dluxqj5613wAd+G0JdcPUPpjtYhBSScY47WGvrtK3FkekwNaNdACpF2vXcvPMjz
	bYaPxNDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyP1-00000007XYV-3lAO;
	Fri, 29 May 2026 14:41:35 +0000
Received: from mail-westusazon11010000.outbound.protection.outlook.com ([52.101.85.0] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyOy-00000007XXQ-1me0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:41:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXbEmaFXSer/xgL6rOqTzf5A4jv1o6xPv5oHxCMZ4pEbuj8wOTGhspkCoEHG8bG0dFy6xkP+sVhZalRSC385jhHwR0aEnMHwUCckKYHZ/terRQT/SIe7Hn6LBo9jqGbaBBNIUtLtsW4bAArYTRNl9ij6Y0DlUEVmkvL40hs6iTJ6Hl/at2+Em7ro8mlciZfoRE+s82fHkBexikZbVuBho1SrfYmd694FAPdCVL1VHndj8FW2VLUhjFIcbl4DInXAnWhYvPVeRqYx3OQIP55U6/T7+vCTJt138GFAOZq7hux6FGOFl1J1lYwx9aEmH968cMo4LjgAT5+h9qSIOGzQFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zqn0VJnup1amED1+jIaovwqBpHKsTnCzDBWIf1qhL8=;
 b=C0IlbIXX6O8GKD3f/J6Rp18WYprZ/muj5VZHY8Lx0/VnF+AvjAfhuAyYxhDzykgpKzkx80F7ErcafoTtTxP6jy40zCOHugBU/+QUT9p9gJwE/Any63Do8+zjVH2uM+xa+wucbng7WUc6YDnSJJZlc8Zb+Rh8t/oLW6TvU1h976DnyO/CJW4ZNg3zcmIxFz9ZhYN3ne/d+f2o84OhZeN3kVgAu23ZqVL5AopI2Fqk5ar0LgYQ39odw9KyhbejYM/9SBS7Wlc+eK7N/qkM9NZ6sMj8atyy72GzLXYzvFwOOOGffyU4UBjMeUzt2GrEsiOowkCVQ1qLCI99Jfd8lzzQdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zqn0VJnup1amED1+jIaovwqBpHKsTnCzDBWIf1qhL8=;
 b=gVyPYfU/fV9rystSQ7bMqQmUJd1yEpm1D02BKcmESUkCtOPii3XQjkZKZyVqVq7b9i8US+LlL3tL14y0c5VRkzKkhQQIUkBGQLFogzdVsWSCkRp5uKQfTpuf9pc4q/IqB66DuaT2VtT/gIWYH5jV3UGeDs4Mj1L/23jy+twuigY=
Received: from MN2PR06CA0030.namprd06.prod.outlook.com (2603:10b6:208:23d::35)
 by IA0PR10MB7229.namprd10.prod.outlook.com (2603:10b6:208:400::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 29 May
 2026 14:41:26 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::40) by MN2PR06CA0030.outlook.office365.com
 (2603:10b6:208:23d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 14:41:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 14:41:26 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 09:41:25 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 09:41:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 29 May 2026 09:41:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64TEfPH0160677;
	Fri, 29 May 2026 09:41:25 -0500
Date: Fri, 29 May 2026 09:41:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Nelson <robertcnelson@gmail.com>,
	Andrew Davis <afd@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] arm64: dts: ti: k3-am67a-beagley-ai: Add I2C2
 pinctrl
Message-ID: <20260529144125.vs4bds6nwimqdnbg@quack>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
 <20260515-beagley-cameras-v2-1-f6acb66c9995@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260515-beagley-cameras-v2-1-f6acb66c9995@ideasonboard.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|IA0PR10MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 53da760f-afa5-49f4-fb4f-08debd905cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|7416014|82310400026|376014|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: eRFRYcvd7b2flm/v364ZuhLm/+zUqZM+AJvI5Kcdku4WHl6Tr+kAc0VXqPimmI8mTzFSEuohmcmkIkDPHN9J3POZf6KTG1JMc7Mhu5/6ekslGc3G3sIapvgc9pzVV6uN1z3Xc/vvtC6wBMdse3Z9N+FqZg8qKtZMybcjd0yOYKO6zwOTtkDHvKfC4oMdaKNGBOe/li6gxHl5ieNrQ5IAafk483WpyRtB/tZw3k7slKx1Rjrm4q9tUhMEGch/dYwi8oXdYd7edxUVzuhXHgNGKqobdhPNS4hVRtQzNMPOVI54kaAoMcP5ROD6r/5hu4aZ5yGqNjm7zBs7uiSD2iPlP732LkiNFCuzX7QcV7xljqmrumK6uHrnwveOsiqh0m8TE9KJquxZkQZsYiE4tsM7ZLCtJXQ/ka8jumr60h+4RJ3g2ujpJmLVsw4B7+TUgPSzBRR7iLuA1LiiOT0SruIKChZITrk3qO0/a5kq6AFbfcydrs4PsI0sDIaBG+WgJTRPX/QEsw93og86bRfcOY3i91Z2/mBQXDZ8TYwwQg4B1JpjJ6QVoImDoYOVvCUbnknvEIhPDl4pG6VnwKk8cR7/7fytK+jSsZFGSl6X1W2P5IP9ciCH4q0M4c9Z4XOI7c/rmNEFjrN0+syBYdqMDRNYA0N+81oRLKBPq2x70w/jXq3qPBlUaFf0NRDATHSr3rsXMEZ3t0q5A0GGsOxxHQXu4VIiQnyG0EI0AcJj1tLs41c=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(82310400026)(376014)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: q4zE8lXVRgK7tHUfeV+x7gNJ1ORRxAxjgRYPJAlfxn6v+DBv/iulzZXeL+7y6eREPJiwcksJ3AKjxHuX0/BeQjo9tmexPwoydUQq5gJgcAIsWauAld0YSXIbygi0JifPmiAj0HbbTb1Bcc9Ny1bMmtFiUKfX19y5X3WdEZZgIN3ifU9KSWHxNMBAXPVCviOl1v01Gy2lY+vLkIaF7VtgQi7tqvCxTlonZEn+bdYEbAc0+gOb0GRU2WFzzQJ+7b4ymgHA3bhZvstt3JQSD2VW7+lQueuDz31WteXjZn1mM7EPNsig84mmA02WoUpEbag4cZf2Up6INKsIXhlcFAzEbY6T4YeL3tzR0gxj9tWoUKW5aFRbJ4m7HN1FybHI0HKob+ZLUpm+7xqUfdHg8dzOjc0FExZBSK/YCjqoJuRX6qc5hphEEHtjZMqyGELwTLpj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:41:26.4104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53da760f-afa5-49f4-fb4f-08debd905cef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074132_467189_3C1C8D56 
X-CRM114-Status: GOOD (  17.24  )
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

On 06:46-20260515, Jai Luthra wrote:
> I2C2 is used by camera sensor devices connected on the 22-pin CSI0
> connector. Add the pin definition here so I2C2 may be enabled by the
> camera sensor overlays.
> 

Why not add the i2c node here with the pinmux, but disable the node with a
comment that this should be enabled for camera sensors? A bit confused
seeing a orphan pinmux node. but i dont see any other function for the
i2c2 other than support the camera sensors :)


> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> index 5255e04b9ac7..06aac02a7668 100644
> --- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> @@ -157,6 +157,13 @@ J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (B22) I2C0_SDA */
>  		bootph-all;
>  	};
>  
> +	main_i2c2_pins_default: main-i2c2-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (P22) GPMC0_CSn2.I2C2_SCL */
> +			J722S_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (P23) GPMC0_CSn3.I2C2_SDA */
> +		>;
> +	};
> +
>  	main_uart0_pins_default: main-uart0-default-pins {
>  		pinctrl-single,pins = <
>  			J722S_IOPAD(0x01c8, PIN_INPUT, 0)	/* (A22) UART0_RXD */
> 
> -- 
> 2.54.0
> 
> 


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

