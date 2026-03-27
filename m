Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B49E10BA42C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 05:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:CC:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPsypzSGUpjiSoTOomA/qwPBkHIT1f87jG5U4kzZYl4=; b=R9xWORmg7/MHHx7woyXV0Ieh5l
	N35frp4NWpU0sFacmoxOeYytcBSoo+Sc7F2+K1ZJnf5tEzpMmO7Mph1BpBC4wvYl3FIcK3dgeFM4x
	jCK3rS9hxWiFv9dkIXdiG8Hld+ycQp5dUsjP+U8AjLrSzp1MmaQBNA+kVyLTNZQxDAyeHMR3/JfJn
	xcxD8QPJJx1nlqbsUioAnyA/oaf6X1N03sY4E4gWhgh96u8ci38yYt7bS2DCXowUGD7W38t2ksHOO
	R1ux6l63x74VwbDrgPG7RguI3svz7R+k0pIg6bxsgNYBT/vVLFV6jfaxQ7cAtSP1vkV41RIq/dVTf
	yt3D4Ykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5zY9-00000006hVS-110S;
	Fri, 27 Mar 2026 05:16:01 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5zY6-00000006hV8-12ZV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 05:15:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIweaGM8iC2q+5n8zqmTLbNl/Jee4YWB0UG9+UMg9tYqO9AHeC6cs7QOUZO2nG3vAv7eI0JCEpkAeGYnp6ZR3Fsgx3/hO26lhC57U8JzYR8xNbXfb6NgtWAtugofWpZN39HRu0rng992sOnwaoMTuU5i60iEwqwS4YI/yLWckSShpzehELSt/mtAfFg0Ucd1/79gHv7jYyKbZR+fg9rV7kh9pOk8nVoraAQ2JuCP61Fl9weMyT8lMpAPuOzExvlYVixqqWDNl9dr8cbJjQAr1gIgenUhaN4Z7t77TLDg1GaOwWTxulDeIG9fnV74G+uIj9Zgq42WsOTry54d7l8AkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPsypzSGUpjiSoTOomA/qwPBkHIT1f87jG5U4kzZYl4=;
 b=BpUL8jUgCtqdfAlqzLzoWQ9+61Mv7TM7KPRMvfvI7RmJely0yxAQF7Ez5BG/MBHx4jc7NZ4qp1z6FAsG9f3smoM2GeFJNggwGYxNNwB5F0vJGbZN/vTIPMwdVlS0cqddLMgmpO+KU6J72/bczMgt+m5B24sEfeITJm4/2MOc7mnXG485Q8vXaL7hvqGVx2nSxM12gvoUtjwGLrd6SE8Up1fMyFKcig7Oohjk/pZHkv9wO5BKliOxP7KSKk8rxFAsmbNuhVFU4OUx89iLyxKr5tW/SKoYxs7F+Vi3w9+FPIl9pxyHpmtwR52Ye1KVEwRC7+5RGPz1pAO6H0K4cPJ/tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPsypzSGUpjiSoTOomA/qwPBkHIT1f87jG5U4kzZYl4=;
 b=d7Cw6NuatIEnTE0UMx8RFs1tsdgd0XrII2OBYfsZc8WQPxUcQYYFqAZQ58E1x82I6/Xif3hQsWaUS2Sf65em1y08gkIDgQpM5OK+0kGW2Mf1PaKNNB8DblzPm5KWpag9Kg2vcFoF6LCq/5iDGM7/nwPYMd7FfMGg7mpfVSBWGxo=
Received: from CH2PR07CA0039.namprd07.prod.outlook.com (2603:10b6:610:5b::13)
 by MW4PR10MB6323.namprd10.prod.outlook.com (2603:10b6:303:1e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 05:15:53 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::43) by CH2PR07CA0039.outlook.office365.com
 (2603:10b6:610:5b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.34 via Frontend Transport; Fri,
 27 Mar 2026 05:15:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 05:15:53 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Mar
 2026 00:15:52 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Mar
 2026 00:15:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 27 Mar 2026 00:15:52 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62R5FmRT3397462;
	Fri, 27 Mar 2026 00:15:49 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e: Fix QSGMII overlay by adding
 SERDES PHY
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Chintan Vankar <c-vankar@ti.com>
CC: Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
	"Conor Dooley" <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>, <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20260326072237.1324027-1-c-vankar@ti.com>
References: <20260326072237.1324027-1-c-vankar@ti.com>
Date: Fri, 27 Mar 2026 10:45:45 +0530
Message-ID: <177458854556.556797.6464018851921649068.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=761; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=uQdUCGlEVXirhUVnxTdaHUNLJCQvmAeMeZ+hpViJeuQ=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhsxjQi1S/HVLtRM6Pl3JfaqScVgzY0v0S74dMgFXaifeK
 HvDXRTaUcrCIMbBICumyBLAtmuWVYrF44iKxK0wc1iZQIYwcHEKwEQsihn+8K+/2XFfYekeh7bs
 ZSKHv4bt0xTZt2nxgoD2GQWzt3rcu8nwvyqoXXylS9wsPq2LU+LNorueMl35FiO0+siD/tMrK8r
 02AA=
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|MW4PR10MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: e2babbba-7b20-43d5-8e45-08de8bbfeb22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: fbYD0MJgPlc8Um7+kcHIJyrZStJzMZeuYDIF3bPTm3DB21X+sl+34ApE8bzaMHy5tihtCmS5zo664j/ricpEZgWwk54CTUcc2t48EFzIUx+kIbVaRY8BaAh4edR3eGh3KhmeT5Vkznd2W7uPKOcy00tCGm9sl/fUF5B1rvKnyKU9hB4I1MzurPQNqWMVMfcuR0zwmNBPHeohcUyRxOW95VJi19Rf1eMFyz3pKvmAPZr91CVJDNx5IREWP1/ZwHq6Usa+IIuAjWdESRjOp0gHX8xtBsAdsR/HfGoewD3QK7viswmWxJYtiIu66NjPAHnKtFjw/8HerP3i7PxaMbq/ol8W6/yj98Yg23mZg0AG4qrOSNkDpz0e7wODnE+QlDLe2BLWKxsHbqKuzGmAgsxKUyHNdmwHpphPKQiPyoOAdZ7oOz4Tkkm/AmkeG0DtBlRB4HotyX5BqfEtmWL0gScLOjXKsQepOXSiMuF8ND75Nx31STCCLJ1VlEoF98r052puAQjR15JvgGITJck/vGScvFR7IhEsK+062C11zx8loYNTD7p6cNkzhJjcizw4kyFQcQFXSC+CRl0wrKbC1VL+gGtT87S3Ru3nRw5K67b3TqWmGngKQYDE2eWzLXY2eT37Ew8l4a16yMUzEMLNjFDqDs57dGpmEKBqFVE5y8/jmYMOVdsCxK0zvPq94DY+E4qfbtcBVkWxpdZrc3ZnqNSDoyLQADttXa9T2tic1iuOf3N1X95aKA9X7yc3Sek5hOVcXxPWt8UieYNBlpPZ6Rr53w==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8V2BgQ64hRrpkp3ivumrafxg5q7iy0XtsbAzOytkVqH5tyNekWx+fAKUDX79TPTV96vLPm3J8Brc7hDVi4O+eJllHc1p12Vp9BGsEdmODdxf8gT9sE4+0xtZ6loJArti6MQZHrS5K3ZYWRIUedw1kEERfv4oDQs4XDsbenVQu1twoZp1j9U8amoxm3hUlhpkweWPyQvBNA7i7AlbjpEl0dEJDsqvOH6baDCzwxz9l5B+zLUonWa7uLwIqAJ12QLwVrcf3PA1C1X8g8nNmsjP3r4h20SHTsIwAoZbF3M7RedPIDU3shwZDxckF+8vD1cjeTpHtRuBGsTLNPCXvhtMgMYBh/U/CNW/5CCwjQ1Ju2GtvOLFziN8xRSX/drhkkXNXR0ArMsCyoZAh4QiCxtRUe6A7DvNYIvug7TLfs68wc2zBhuUIG2rGOlaIL8YVv3t
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 05:15:53.2173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2babbba-7b20-43d5-8e45-08de8bbfeb22
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6323
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_221558_315631_D4E97B53 
X-CRM114-Status: UNSURE (   8.50  )
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

On Thu, 26 Mar 2026 12:52:37 +0530, Chintan Vankar <c-vankar@ti.com> wrote:
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-evm-quad-port-eth-exp.dtso b/arch/arm64/boot/dts/ti/k3-j721e-evm-quad-port-eth-exp.dtso
> index 8376fa4b6ee1..d403a3db0265 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-evm-quad-port-eth-exp.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-evm-quad-port-eth-exp.dtso
> @@ -42,7 +42,8 @@ &cpsw0_port2 {
>  	phy-handle = <&cpsw9g_phy1>;
>  	phy-mode = "qsgmii";
>  	mac-address = [00 00 00 00 00 00];
> -	phys = <&cpsw0_phy_gmii_sel 2>;
> +	phys = <&cpsw0_phy_gmii_sel 2>, <&serdes0_qsgmii_link>;
> +	phy-names = "mac", "serdes";

Dont you need this for all the other ports as well, just like in J784s4
overlay?

-- 
Vignesh


