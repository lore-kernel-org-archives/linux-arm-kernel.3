Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92442EB362A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 18:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cchEx70PJASekUb1Aftf/hHxbxvF6mzuOy+o2CONmW0=; b=IKLi6mqUpca4V+o7fXMqTINDq4
	06FRO54ULDe64wCyavepTtMkMzDY0re5RVouXCYUUJsdTshS6RxvF934TWkh55hzLc6CfPviayQGi
	0GVugY8iARKEQMiY+ifnBOXcR7z7Akz4oXgnGGhHoHCddjeTneXQ1B7z/H+9LwmMeTulGP3mNUx+p
	fHqzSXCrXkibPn2k18DkfvXLHw2aOwAevRHJvAwyJe+565ZAr+uX7CCo/RcAAhXadFPjOFRQ9AIK3
	9rfFRhLxr3l+2VUu7sBCIgJA9iQANK2fUKFsDxPmdEq0BQ/dCAireHhqY+78f8SZGWH2yCThQ5YXW
	6ACHAraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7qg-0000000Dfhu-3jNQ;
	Mon, 02 Mar 2026 18:18:30 +0000
Received: from mail-southcentralusazon11013057.outbound.protection.outlook.com ([40.93.196.57] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7qe-0000000Dfh8-35jV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 18:18:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRBL6VCfYolCLyJxonekaVO6Omi2SMvjA0RlFtwFkBjpUTFcDpqydnhD/awJRTpFYMB1JDvuD5SZ3HfIkOeuSRHhX4bcv2j0AoCop1DTuef+lgsKESDLIAAV6uqoFYn11+FtaLsYrlBk2uoQFdPU4iDA71/7z0aUNiX4aVfbPOhriJgJtf7UF8EMV40iMaaeDzWkfZbL0JgIieC7Tku1Gvg2BX1I4ZUUiibhy1BY/vzWR+j8mntignqwzGwKlmhgZ7GbYdDYCzcDOTRlgiBeG4utC9frqrXL5Uw3LqQ1FDNg1MOUO0nHR0SPmict2dnRMj7pAyZ7h8WxbUpbOoE4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cchEx70PJASekUb1Aftf/hHxbxvF6mzuOy+o2CONmW0=;
 b=wlABzCH4163Wgty/JPXH8GsUn5Ujcs5ZWFDj50/01lFoQmHNG6ifoMsmvjX1YFpQBkGzM8SSjPkvDmgJyTzhL4HQ8M/RRTx9mcVCjw5HC6VrSMHVNWvbqzm0c0THRDJ9uLIj4FhBAg1RuGg03ZJhRgVXU5YTbc5R9VjKWO9hEFYf3O+zeHKn9m1YYnXwV6OX7/L52YVtsY5LPdOTnn+zSEsVccU+6UJ0rJ3YWzGFU77fOh19Y6h27/fd4RbSCGOT6LbsB8ecuqjiN93Prn1SCvumplVfYD9t6zI53tM3M/VIgog39SGmXKsppOTRhq6wAEIiiXe4aQevDunlJh/Yww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cchEx70PJASekUb1Aftf/hHxbxvF6mzuOy+o2CONmW0=;
 b=DozGnQ2Rng+swJDxFTrmRuHXhxv0d6RwbuD4dFFt2RK9LPC9OOIXkkZJNdaPAPiCwgnpmo6MrJjMsef+ttabILF6i3JJH+nhv2MgkNQD9eVKqQPXWp75c/u9HkkwOr/4osTSUT4csis+h2XZnu482rqAZa7dU5fMtO1kvr9R1fQ=
Received: from BY5PR13CA0012.namprd13.prod.outlook.com (2603:10b6:a03:180::25)
 by CY8PR10MB6731.namprd10.prod.outlook.com (2603:10b6:930:96::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 18:18:24 +0000
Received: from CO1PEPF00012E84.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::26) by BY5PR13CA0012.outlook.office365.com
 (2603:10b6:a03:180::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 18:18:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E84.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 18:18:22 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 12:18:16 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 12:18:16 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 12:18:16 -0600
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.81.69])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622IIA711232767;
	Mon, 2 Mar 2026 12:18:16 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <b-brnich@ti.com>
Subject: [PATCH 4/4] arm64: dts: ti: k3-am62p-j722s-common-main: Assign SRAM to VPU node
Date: Mon, 2 Mar 2026 12:18:00 -0600
Message-ID: <20260302181800.445653-4-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302181800.445653-1-b-brnich@ti.com>
References: <20260302181800.445653-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E84:EE_|CY8PR10MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f0d5bf2-f839-4825-2e7a-08de788816db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|34020700016|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: AaRLSX48E9QmnPgC7wF8zbUrCp3YnuefiVbtDcLtFlONBZpwmKRjDk2cFjcwRzIXLC1asQhZtzV3K+slx90vYwtQSCOpa/RLdKeaTpyAIXdYNzwFSxx6Tcj9eMlu/XHXjfwfcEK8CQ5K3uWhOniSl1UulwEi2xskLoMWRpEI5geDC/21nv78f+bnt1lwy3gYLh9s90PPHyVUkczAqvCrepZsTkTyIVkokT9nQFfAymbz/VLV7kczaie1l1p9fyeiWHHuosm+nGmis+rZGNiqmIVD+uECVsoTtQcjdBq5W2jhk6ueY3C9sH7Pn4soqPSV5YZYkOmYALWYKNJjHtk5VIsvfZ15SbSPq2wm6Bhmy7nCxjy0d/OAkD0/LSB3PDYIjrqrORgKP10XdcDEWE1Rbip1EdZm3dHFP6dn0u/gQ1H54M/QOM00kgKCRqikdvuCbRFP08JqAjyqFaUr8BBBia+WzZjMKvx22YwOe78Z12guWp+X982uk/OMqXBFWtcmzhXIcl8jJ9La0Ti87OrVUlgfvrqI7ZWSl49anQvUsSuoyLyLvRA3YwpN/YXbBatBELG21mbmzTR5pUE2xL6F8xcs9dPrRcD1Ir2aMoDswcLNDP1lsDldbnjkviNvd/cwJZedH2hVzWiwiGD9YHZaAgN6WZS6/iKtCfEBLUuDa+2u8CCQCwNF9BdRrKpJnFdXPOVeQVfDadNe1CSzkk9UnhCycqT+IXc+ZiwwPGoRw2MrVQhQjYsvSChBK0MRfUbmPrg0MNs65KQp/uJ6vVdcIetrFMRAQ2OM14sMTOgwBFU19V0S8eacpT4QX/+NadaI3ReCzAa6JYauON3/44eJFg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OIkUodTIcfSnxgtUJ8isZqbouWXyDi7vyFUqk5R7rf4FBQVfweunzQRy5eazlAtMb8HFyfisvE+K/IoLq1buUXCLM8x2gX4++CJrXcdYO+d2EHYI38RXBQdOAHrk+JTbg4b25lPL2djM3po1okPKUsuX54/DSPh/m1YOb/7vPZ9/oKafIzImnKK+wTH+nB7bkncacAXjDrCb57OaYX9I+nbFOzi0mJFCmI55Q8qy7G/zlt3xc/HFi0/xctUdXtEYVnTA8GjAcceopZChy2NjzfI1gog37sn1lDdOa3Q3M+H8tXAmgaS2mN0fkeiKFpqart8RSln/7CNL/GmsiXNQJnjqvHyvdQ4PYZ1u69zAcraaJL9e0GrxI6XVaDcqPNfkuy6kIFW443WQUWZuWbpSZQcYa1usy3SUgmJKBV/XUi5L0N14Tu9Kg4dlQlT2CyqG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 18:18:22.6288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0d5bf2-f839-4825-2e7a-08de788816db
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E84.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6731
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_101828_778461_FC268E36 
X-CRM114-Status: UNSURE (   7.89  )
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

The Wave5 VPU supports connecting to on-chip SRAM through its secondary
AXI interface. This allows temporal buffers to be stored on a per-stream
basis, reducing DDR memory traffic.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 0e1af2a69ca2..33deb4a37a65 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1116,6 +1116,7 @@ vpu: video-codec@30210000 {
 		interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 204 2>;
 		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
+		sram = <&oc_sram>;
 	};
 
 	hsm: remoteproc@43c00000 {
-- 
2.43.0


