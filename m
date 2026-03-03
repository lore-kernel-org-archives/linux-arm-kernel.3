Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62266EC144C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 14:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcgcYNtZUHv6ZhXVygljiykxr8RMkptj/JJS5iXy4eg=; b=x+OYaVs1Mac4ky3btAQ2PBiSxn
	0S1KAkLTPFjyYlZwQ+R4JQ+LhzTUPEYW2s1TOUjslCuqqMtF6C3eoG3yt8Ijw+bC7Z0G854Qj/qKl
	nDckxc1mRUvFUw0Bi/Ou9gq+k4TKlLdMEubvv3hRFwy5irqMAnX9Qn8Q1yTVeBZDck306II+xtgpF
	QUiFguTsJMqybfDN3aNJ/8XC/m4d8esTXRmMUhshOthhU093Pr8nRqUp50xvdmh0CYv864GlS/az+
	+7UcP7iPAVGOhMAX6tfbYwuyTpuEHdMnb5ayMZiEZMNbzJaqCQjfeQaKTAC+Urr5rLwnEcuFFcldT
	viHFHviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQMn-0000000FHa2-2mQ0;
	Tue, 03 Mar 2026 14:04:53 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQMi-0000000FHZ5-2J7H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 14:04:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgzzCq/VaxYnyNADKbB/kX4J56xrBv2CK9UMngFmJneiD8Wm/CIVT8P6EkoiyytXu29rd3liRnR+wk1r6jLtIWDBPxJ0blRYr+BjC4Aor3rqq4+gaAbwpRa8ykSYUiHxjFCT9jof2qhf0H7WC94fHBCoN5+0yE94qnxEJa+9xR6pRucgl8GciUInfVCkfN9C5OISwWSu1ki+ifPTEs1fNzaiTa+1RrJG2h81jnId2R0MV3CYoCAwwh3YEkeV9n0V/8nTp3MoNab3bzzPma6h7rxZwXhmYcz0gN6aJ7vU0hG69MFvf5Nt2Z8fFGO2UnFy/YkOC5tQVEGVFgdW+izIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcgcYNtZUHv6ZhXVygljiykxr8RMkptj/JJS5iXy4eg=;
 b=yHi3aLre2Ik71OtuT1OIU6w28qfXWe7F7r9hZVMpaUTn07ZmBxyOY82ORjumRgFOQbi/V5I5QEJH1xleUagdBnR7/tquWwL5SU0Mr1mBo2DEztf/t9Fbscwbu9GgfeWmSTgJw9hotcdpFrAA3k9Jjq7DQ7vhHZ5aFVBLKSCTrMAZqpk5KJ39aavGrIj4DqT5gRD4iXN2Lp7gMqLBLK0xw2PLOBlUEzUS8ZMl9tlfukRve6FBFriJyQTe+mD2bJkNhSqAGhJFgJPfWuXWT75PXjKqg82/yezgApaVr+EmYvH1fOgxJX75+8A6IspNhbbdak/DfMQwOw4fAGta16edfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcgcYNtZUHv6ZhXVygljiykxr8RMkptj/JJS5iXy4eg=;
 b=M4Xt5QfMXgLFryBSPpWf4JsplwyH9hiVtTLXC1wCIsb4+hIkJkZZqMMoZlEa2shIMPt41UB0uEONQmrGQJZltgpHgz++nxOtyNngkkJw1nRbO9IW4Rct+H4vGZRUun9pj8Zerq/LuT8+xO13y/L7Scp/q+6mgPEu2/ZfbYw98nI=
Received: from SJ0PR03CA0375.namprd03.prod.outlook.com (2603:10b6:a03:3a1::20)
 by MW4PR10MB6299.namprd10.prod.outlook.com (2603:10b6:303:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 14:04:40 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::4b) by SJ0PR03CA0375.outlook.office365.com
 (2603:10b6:a03:3a1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Tue,
 3 Mar 2026 14:04:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 14:04:39 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:04:22 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:04:20 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 08:04:20 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623E4JPq2230814;
	Tue, 3 Mar 2026 08:04:19 -0600
Message-ID: <7d8582bc-e88d-40a7-be39-57045fa4c010@ti.com>
Date: Tue, 3 Mar 2026 08:04:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-j721s2-main: Add mmio-sram node to
 main_navss
To: Brandon Brnich <b-brnich@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260302181800.445653-1-b-brnich@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260302181800.445653-1-b-brnich@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|MW4PR10MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d86b30-48b8-45a5-8a8c-08de792dcf6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|34020700016|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info: aXnx2Nd0intPTEXQIHCt3KsI5xBTeCYUHAh7Xlw8b5pMSR395qTxh4HQEpxymwAOpXPC/kaKmNBc8MiAZtj9G0jVOb0PHYb5Ry5d/ebZ9A6KbdQf6w/IS1iXiy6kKPpsgPDqs93do9dQrQL9hWT+XKtw5ArsErE4aVJa8FgEf7Z+jwR8iNnvU2XnhG35eZsXJiZVzUCoL9z9eikbJ/uTyTPvbuUlAWdflns/XRffrvKd1AWKvUBYKNW1C+An1fpsBtHDaPdDGNMqVUGUEieAhWDpR8ng8VvfUXkMldT4CCdey7GEhDKVelLg5KyXjWgnf7EWFvfP0NF4h8tUrDStuhm62ffNVKjz0I2KacGjYi1gr1Efm6NqCrEJr0gnO6hPD8uWPGSHrhT8iThPElUf2SwFdAJS28eXJ7qE7eSvqOVBXwzxI2TigFlf7kSY2Xr7TMiTCf/On76nqrVV0K5DGRcaS7XktZJuAa/VkP2L5bQ75CQ3TJA00AcLTmhtsi7tPv8+pGz6YEe0sYiRXC4oqL4VCQiY50sxGDyLyYBKbbQ6cyRXgT8+TbQEk5d8nqu9a36XnbcUj+Gr3GFZjyPfn4QBYr1HkywSrlvT73w9jab8PEU/qcP6MdLOQYMdrkYBGQ/p6cvZHDluGA26zMrD4yXbfq3vJivtG0G41rG2G9BpqczD9aiV1eV8fvZIUqk5LTqzEo8j5xFC1TE4VC9onmx2B12PT6zAKYIvgEbgEJob+cvu8KkaSzd8nkRFgc1KPuCDEFkYSU7woriGzVUhw3XlgO0b4DNLeEslf4BN7lazUOLFSZOOy+IUh82gfK9eVGlY0GsAZW1AoGOlnbRrJO69os66LKtJyw9v225BGeQ=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(34020700016)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Hy/jYxVnBtmoBJoJrsjIWLKaSJhlYy5W4VEIjY1Yj5L8MuJ+j7WiLxGI63QrnXwF0/aHxqX4lafcI9sRPuyAmBLqBZwS80Ux9v1gvZdM4cMgzZ7PwcMY0fHsN6Oz0vCTcsigMXnb/BVFiNUsJWqHaWiRrk2/be72EO1MWJQs0skG6UHHvKvbU8rgg5HiWBD4xUPg26mYlj5AS0+BpaAKWulhzp1QoIaWiAdt0UvITPRl0Rdfe3Q2DTBv/uDf0SYnhkgehipEiikfnMgP/IUhkV6rg6jzGxdTsADP4tEyxgTvKVKy+F14z7D8auglL4WDJ+g0CNuaNL/z7vx5Hfr3ENB3sW8/Q7uF2L980UVdl7+UV59d3hhdqR66d9nnhAxHzc/1MjXsV8KiG/ZIi1i9Jddc/SdEeMpp+LsJ30Gmnsnty5JmIF923U6iC4DLeFra
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:04:39.2369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d86b30-48b8-45a5-8a8c-08de792dcf6d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6299
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_060448_777702_FC71E6C4 
X-CRM114-Status: GOOD (  11.96  )
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

On 3/2/26 12:17 PM, Brandon Brnich wrote:
> The NavigatorSS (NAVSS) address space contains a 64 KiB on-chip SRAM
> region at its base address. Add an mmio-sram node to expose this region
> to consumers via the generic SRAM allocator API.
> 
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---

Reviewed-by: Andrew Davis <afd@ti.com>

>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> index 80c51b11ac9f..7b1ba34ab719 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> @@ -785,6 +785,14 @@ main_navss: bus@30000000 {
>   		dma-coherent;
>   		dma-ranges;
>   
> +		main_navss_sram: navss-sram@30000000 {
> +			compatible = "mmio-sram";
> +			reg = <0x00 0x30000000 0x00 0x10000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x00 0x30000000 0x10000>;
> +		};
> +
>   		main_navss_intr: interrupt-controller@310e0000 {
>   			compatible = "ti,sci-intr";
>   			reg = <0x00 0x310e0000 0x00 0x4000>;


