Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4BAEB1048
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 10:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoTT90q9wcR7jWtc52LXPjNTt4k/OTLh0LDj06sPSFg=; b=utKDQl+2+JiNf+rBqvr6x0YLgE
	3oszTIXKUccFJW5Ki7pczms5XtNr3wNrVBsIJ5bMuAh2Tk114KhdyVPQLFXBapv6Zj9s4RB3FXEcJ
	iyAtLj4JHnr5Z5tKly1W8CN0ogkPayJbUBCzNUOxnYUn6sQs9DGZHvltp3IUmYzOqch6xxOfcx2Gz
	mmVpQijA+kontJvJFcdjS0tNJXcCeVVvnyzP4AYqdiJawkIB+YijKw8VR+psviCqoYaVvLb2wKlil
	qCKtEorri5yA0fFsKWUOfxn1/0aU0NSKMmODBU7pwCPER/pH/PE+T/RcVHuX9eq7CVL9KM0j6ag4d
	WUwoThaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuOl-00000009CuH-3tbm;
	Tue, 10 Mar 2026 10:33:11 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuOj-00000009CtW-0mUL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 10:33:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSDZmznF3wYbm/CxwJ5DnFYGzlyOoKoCNLq09Y0VekfbJ6XEufxUSXLkVEDSTnvcwXjIvcF33xCXbiex3ljCvMKiLh78R8AR5XRi4uwFtXMMLEJBk7El+O91nZxkWyqW/7vnHXyk6nCe/toRLhF+J784aBqYY6YjiahJuY6tXmpedEQtXizSwS1ANiTKHiBwRh4KIRaM+UBbn5XscIy/i0MOQyrHZLQnzFLkqL+CWaLeGDmDYZYirdTKO35a3QDnyancXzbNYZTvVptkVTXRrzAsYOa5rwSZxmojYpfwrKEo6/yKRKjAsqgI+My+tNHUNNYEkEw0Yyd6bN8z9xnqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoTT90q9wcR7jWtc52LXPjNTt4k/OTLh0LDj06sPSFg=;
 b=BKhc4HY/AT8nBr7dolX7bbQzrljOFifQDxIbAUnhrOmWRx68nGgyUUo29tDWRsK+g2kJAFkuzTAopiGewia1sQ+QSp6nRq+S3+KbffEaahnKnZvUDxrmXpR6Efhtv7zPutyhvTeI6JuRczKyarNZZBmkOEr77RFw3wguYsjYAvAhytc14Lso5rATjbDNpcblBl6cc5QvOqvr89Qib1rhMGAkQdIkruh13cepFGE5D6K3dEW36mZ7BIVeGS58endHolxEQwtXWQxLCzA8KgpwPKlG71yfLPmWPoKpyDkUzsnNdu+4OwDzox7FetCAr51/v2KzX++QyjOnKKlJGIqliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoTT90q9wcR7jWtc52LXPjNTt4k/OTLh0LDj06sPSFg=;
 b=lzLukqo7DtrCsZF3DuNe9WPN/Yfsu0Ke9MSpCBwaWWq3Ad7G8bZsIxYcRDLM86bc6r6vjU1zGxFbVRTpoT2KldEynDbO0WVvS7amkFigh5zjpjH61GU+avAY5putdLpbZsacTufz5nVjD57JuJTDbMbqqWU/25PbteoNj+enszM=
Received: from BN0PR04CA0077.namprd04.prod.outlook.com (2603:10b6:408:ea::22)
 by BY5PR10MB4257.namprd10.prod.outlook.com (2603:10b6:a03:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 10:33:05 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:ea:cafe::1d) by BN0PR04CA0077.outlook.office365.com
 (2603:10b6:408:ea::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 10:32:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 10:33:03 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 05:33:03 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 05:33:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 05:33:03 -0500
Received: from [10.24.50.162] (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62AAWwR52902597;
	Tue, 10 Mar 2026 05:32:59 -0500
Message-ID: <0b3ee45b-a83e-40bf-a463-bd7b36906245@ti.com>
Date: Tue, 10 Mar 2026 16:02:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: ti: k3-j721s2-main: Add DSI1
To: Dominik Haller <d.haller@phytec.de>, <adrien.grassein@gmail.com>,
	<jernej.skrabec@gmail.com>, <onas@kwiboo.se>,
	<Laurent.pinchart@ideasonboard.com>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <robh@kernel.org>, Nishanth Menon <nm@ti.com>,
	"Vignesh Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>,
	<linux-kernel@vger.kernel.org>
References: <20260130205820.83189-1-d.haller@phytec.de>
 <20260130205820.83189-5-d.haller@phytec.de>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20260130205820.83189-5-d.haller@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|BY5PR10MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: a67b70d3-3502-4503-777b-08de7e90694f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: LgduKC3ohNGmyXvt0iitGgPmlbUeKi8lKZvKs5/rE4mzjc+RyokdzAyeQJBzfHjb4NxumOHv8sTlldM5MD5DQ8vySS2MDBIKlJiR6SLH58ewODwcDeRwN/8SFbAFtk7f8syQEWXWkstlr4WwxxyOWPVmby2eYNbEP+s2W9duG+tIGgwgyEzFxcmno4T62ntktiiWHmLsYrZ5XfRH0l8YfmVaXHQ1bksWW15yg+hgNfvv/tv689a8PjuLgUgRaH0cnY01hm+v4IG4poXCPzdjLG7phoED3owfLn0yMXbGkaLTPVjeLl2/4zqhoPWp+eakjkOveMYa95MDr/d2t+wGe8m1QDVLK1h8f7sR00KYYNOLdJgyH+Ld2OXnCsrsAlea+bu+3UlNS6Gy8JO/MdPjbomjGAE0SRp3UTKQ5kLdr2uiqmwpSwU52R/ddWPb6Yhg4sE5/2TxwAzktyhoUqhDysKxq8XcGU4uEgvfFIqV9H5D9DHqsorpdtY8V4c43PHEGYLo/oOxXrG6lSVVxPELSnmG6xR0AXF39YPPQMb6fsGBySgooKITcQgzIQurZPs/yhBPRDm2eWdoTCh3c7tUko00mTLCR9XZ0xNEq7VZPXHbqIx4BsR5HqzKplq7sYt9ooxtmyxiequZ6bZSnEkdcx7WV8sdgLXisaJ/MMXQbvqLy89ryUm4LyHs5P+9Xeti13cbVwk4j9FQGFcxYxUiuqCwRFrlch07s2m9BU2V44I8P+4+D8cjdI/UHMWmRg2rQ4+UZtl+C/3S0svCYePME1FOimSWg6ocCLt9W1CorJ7vc9ZunWBTCJi+FH46fh/0
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 17OWIspPzF6gwX8hSv3WRdLqConkas7uU9itavs3djen4WEAtxA5pwbfdvY/DA/MMheZ8UyFXcMQRxYfmIHr84XkpIvqXwLF1rFGSvxizEHjQ5USDhrr8+DfpW/r1F2IiYMXuQvvGrIIqiiCLTtslPG5HLctSPSXX1DyWkAnHSJebPHjQVw9n9wbBDjCfShZvmmUH8GkLwI1YckSSAdrn6L0HdcNas8PtLEAyFOeYJMEquXbCx/huLnW/iBkIWXiLf0tfWdJEdQkcfQFNELAlP1OHfrtjYUdMDR1QMj3TUNBZubikoE5AzMdRkrHy4BFMEJzLY6MYMbnTCuX9fKOiDcBjY7tSf+nYeOpVqbTE3nfzBJC3+8L90gO5AJlJRslP5OoRNNxMpyTENFaeGVkVI3X9Q4/Vt6YvDGKWdfU9e0aleldNGTvmnMEMmsd6TL9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 10:33:03.9283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a67b70d3-3502-4503-777b-08de7e90694f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_033309_522973_73131141 
X-CRM114-Status: GOOD (  11.16  )
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


On 31/01/26 02:28, Dominik Haller wrote:
> Add the second DSI instance and its corresponding phy to the main domain
> include file.
>
> Signed-off-by: Dominik Haller <d.haller@phytec.de>


Reviewed-by: Beleswar Padhi <b-padhi@ti.com>

Thanks,
Beleswar

> ---
>  arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> index 80c51b11ac9f..80a32c451d1b 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> @@ -1815,6 +1815,19 @@ dphy_tx0: phy@4480000 {
>  		status = "disabled";
>  	};
>  
> +	dphy_tx1: phy@4481000 {
> +		compatible = "ti,j721e-dphy";
> +		reg = <0x00 0x04481000 0x00 0x00001000>;
> +		clocks = <&k3_clks 364 8>, <&k3_clks 364 14>;
> +		clock-names = "psm", "pll_ref";
> +		#phy-cells = <0>;
> +		power-domains = <&k3_pds 364 TI_SCI_PD_EXCLUSIVE>;
> +		assigned-clocks = <&k3_clks 364 14>;
> +		assigned-clock-parents = <&k3_clks 364 15>;
> +		assigned-clock-rates = <19200000>;
> +		status = "disabled";
> +	};
> +
>  	dsi0: dsi@4800000 {
>  		compatible = "ti,j721e-dsi";
>  		reg = <0x00 0x04800000 0x00 0x00100000>,
> @@ -1841,6 +1854,32 @@ port@1 {
>  		};
>  	};
>  
> +	dsi1: dsi@4900000 {
> +		compatible = "ti,j721e-dsi";
> +		reg = <0x00 0x04900000 0x00 0x00100000>,
> +		      <0x00 0x04720000 0x00 0x00000100>;
> +		clocks = <&k3_clks 155 4>, <&k3_clks 155 1>;
> +		clock-names = "dsi_p_clk", "dsi_sys_clk";
> +		power-domains = <&k3_pds 155 TI_SCI_PD_EXCLUSIVE>;
> +		interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> +		phys = <&dphy_tx1>;
> +		phy-names = "dphy";
> +		status = "disabled";
> +
> +		dsi1_ports: ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +			};
> +		};
> +	};
> +
>  	dss: dss@4a00000 {
>  		compatible = "ti,j721e-dss";
>  		reg = <0x00 0x04a00000 0x00 0x10000>, /* common_m */

