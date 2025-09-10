Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0741DCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 04:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O6K3juZTa10YnrRoBofSUkzUOEtECkrUho93DdIAnMc=; b=Wgs3CbkSbM8hv3Jrfqa80nAqog
	uqOQeY1jZ3igq5RK2jy0wkrDp56JktokJKRF2GvFQmlKd21erfIRhTF5asJtMToNybarSQk4ZuUwD
	6wonlnttFBPac+6WF2mnfioxf+d9MNHBEbD+lRedCsXzgAYwmk7umAGqqUi0KNkM+UG+se40qqSp7
	D0qIn1cK1O77D9yHNr3wSypo8JVl6s7tafR+U3pXy5KFJIKiq5LnzE6zMkRbvhboi7wrz5Bf9lbVQ
	TZT6WDkwbrSoBzbpIyf+WNLqTLn3JFdr/LlECUFJ1Tmfmm6to4IGYJMIzFhHbO7UE96TJfTlQZr9A
	3SjPSpuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwC6G-0000000BsgZ-2jo4;
	Wed, 10 Sep 2025 04:06:28 +0000
Received: from mail-mw2nam10on2061f.outbound.protection.outlook.com ([2a01:111:f403:2412::61f] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwC6D-0000000Bsex-1ekp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 04:06:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbOxQd2UsvtvzFXMUQKZBOs7OAGYWbq48rTgyTNQYf81Z+0XL03cNqFq1sm83djiX9AR9WXS2SXned1EY93yX6T91hlkKNbLJ3wPFbp2U+/FkhZ3FN2xoJvMvneEyPOGe+ubtdPhhSFJS2BGK0VD9fk1IAF+UCIsBTuVSwvwbXYOYj8yukWbNofBzmgB1T7kFnATupc9U3lodB9746izDCxzP7puD6Yne6pe7dZYt6cp4EAqrvUmB7tXO7UBGw8Ku7Q8UosKpyShJI1Yx8pDzPydZje+DIoITvgp+txNakSiCV7/rSxeGJZFdIrVYeP7tg5aCjkoCXbKUodEdN8ljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6K3juZTa10YnrRoBofSUkzUOEtECkrUho93DdIAnMc=;
 b=cL0z/CxzaBjTYwRzeDEf9KlHxYqNZrjl+NR5O6ekv06WCAhJdApXltnYbz56hnXUAQKPWYwMSc+pL4ZT29KTv7J47xt2GZ/bdFRWOtgkHLOMwu40SyNes/vpi4/Tq72W5KFUGMLlyupZLwE0B7hSsf3IJpZ0++Lgln3iUQrv9M41o+eIB1vaoSWEvQX/MdpkuIMz42gmviHJP/S60qpOck9iJAA1mHJdno8O5/Vdsl1Gv052hqLvrGbBIvD0XsaMxx88ZPeB8qAShbQto8oBgf1Kte4FrTMmTYljCDfOEgFrTlCvd4YgFTigeCZ/OLL+rPqhDIilPsZX5Sxj57QOxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6K3juZTa10YnrRoBofSUkzUOEtECkrUho93DdIAnMc=;
 b=TpF9CjvpdF1WqtkApMu2NSW6CGU+YO7T4Azg97RMp5Hj0vAG2WemXsOiQl8CbeaQ/LAgcfNABLLzIMk6lNw5mlEZJgoIYR00rtrLn0fcbbGSNpDZH5XRfiqVLuEerspsEi3Y7OaXMMIRyq2nudcai9FGf67HK07jFQbycT93u6UYZTzx4IM35mGxueQLUuKY+Au63qRQkBRaZIbLSQxLO7XPpkMmnnVZgjMsbhXaDsncitJuGcb7e9+MP4i0sSQQZn/Ksx2ZppBYGVuPqUz1fWkurkd2txISNRy9QSnpTZqeBqKr+YDcAQv/dSP/h/z5sSG25ZWm3XhjOV/9EfqGgQ==
Received: from BN9PR03CA0659.namprd03.prod.outlook.com (2603:10b6:408:13b::34)
 by DM6PR12MB4314.namprd12.prod.outlook.com (2603:10b6:5:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 04:06:14 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:408:13b:cafe::11) by BN9PR03CA0659.outlook.office365.com
 (2603:10b6:408:13b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.23 via Frontend Transport; Wed,
 10 Sep 2025 04:06:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 04:06:13 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 9 Sep
 2025 21:06:03 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 9 Sep 2025 21:06:02 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 9 Sep 2025 21:06:02 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<donalds@nvidia.com>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <etanous@nvidia.com>
Subject: [PATCH v3 0/2] Add NVIDIA VR144NVL board
Date: Tue, 9 Sep 2025 21:05:59 -0700
Message-ID: <20250910040601.240162-1-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|DM6PR12MB4314:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b248b2-aa36-41c5-3b28-08ddf01f6240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tr7CM5Mkedmmapkd5lnSDcFgsIBnKm9S20lXGkEKH4U400k0ZlcCs8midgTk?=
 =?us-ascii?Q?m21DfAXg73E9NqpyuRRVg23LVClmge4Y6tuMSw6a+4a5ehgTK0sV4UtGCzbk?=
 =?us-ascii?Q?nGIwl7aSnXLZy83vvc+EeepROGPR2/2aclOIoG5QIZZs74qAf5s0jGtkSser?=
 =?us-ascii?Q?II6YAVq7A/GDWyQi0lGb01HHTUS5GZ86kEszDG/Jf+RC/THkQTNiVwSRUTKs?=
 =?us-ascii?Q?vEqW881wxdwQRMRMPKfcqNFB9RGGGOoA122qjBFzND3U4i4t1XibF+AvYHXI?=
 =?us-ascii?Q?mhsK3/GQcE2GMZhx7wPp+gNQaenMLujgHnIQO1nmgQ9UfFQVwTC+lcmEcnm5?=
 =?us-ascii?Q?fhK9kjyjRk60URvNZbicwg43h2WbmxQSXCFtqvkClALVOKm3xRCQ/JCbqeyh?=
 =?us-ascii?Q?VdTZ4Z6qPeuO1NdBU7DIwAbi8WBB7gPRaf98uNj/H+1Xc4EjSzz7fFLdgAQB?=
 =?us-ascii?Q?MMieWMjvvyH4U5FujmDyu7GrtVs6u6UGfn5EjCOEFfgEdG7Be+39nT0WZQud?=
 =?us-ascii?Q?LgKEwZUaVew1n1Z8CFu4ic1LYKpuqtQVF31z0Zeiim/gxsz7tjVEF6znk2+E?=
 =?us-ascii?Q?2fJA/ivlKwlwqEmCaNeWZarzyUe2msttHLnkSEwGIczmV5Jf4dVB901ilkkx?=
 =?us-ascii?Q?B47YvymEwLNgbFfqlRbOE4PnLTaBG1vbUUpBRoPNBqtZ4117GNe5koZsqorZ?=
 =?us-ascii?Q?jhL3JetR3a/mdEa+aPAxH49eRUGHv9eDgXxUeceBcTd2D9LdnI72N6SRj9HR?=
 =?us-ascii?Q?AHqk0tHbmKG8fsX/WpJKICc0NQR5QbtOJ4JTqLhhkCBWEP7DcQG7e8FNvCR3?=
 =?us-ascii?Q?rBaBNZdbhWrZBTDW9GJIww7EH0EoS4XcEyjfwGzm9j3plpAYdnWEG78tARKH?=
 =?us-ascii?Q?r+j4tQ5AvNWbPakmfgg2MhkLVC/HUzasHPfsdfXWKKwYqtTWgbrZ3SaTKe9c?=
 =?us-ascii?Q?5heyW20+TMygQc+nHGfQIl66Fmn3vITWFl2HjkVwt63L0AovW/kW1MA2404J?=
 =?us-ascii?Q?581WE4ylkL29uXcXIBkwldcv+vn6cFJlgZZ7uygrLrl3VGyUYBFMsWsRWXnM?=
 =?us-ascii?Q?V+eWaae4wdvFtEZe2nX1IolF2JAGeAwLAi9KmfPmnkP/Wpr7pByD2Vj4qQl1?=
 =?us-ascii?Q?/hckpXLL0AD6nctPzgk23Fx3PFY6iCOPvYHnwmS8a13d5Vw4n2YWAjwJUTDr?=
 =?us-ascii?Q?zVC9ZHHHDRqZllkCBF+Y8ITQGasxUUWRvalpcilP0TqNWrelBkWuvLZyA0CD?=
 =?us-ascii?Q?fsJSQrQAG872F/KcCYJaBqSpwfBdMlLUE+70dobHjQvBzN8wv3ZIp4ps/BvE?=
 =?us-ascii?Q?c8zTxY3PT2z5TB+JxFY13MgE0ClgrzzlWgmGKrK2R/gTljv92QOp6bnjgkDR?=
 =?us-ascii?Q?Pj8ZvOtzghJPyH09jXvjPUwlAgFwKDAm4HLfXa6kBrBsELWEX5TjNBXH7Duk?=
 =?us-ascii?Q?e9sgS08Sp8Jk3Ec4PJZQ7F+AWJM+rW1x/g9w63r0jgWrL6fmirINW0sqxG7g?=
 =?us-ascii?Q?5S/ek2Ogx7FhYEVoltkrXC8iIAB0ZBVyKLsS?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 04:06:13.7784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b248b2-aa36-41c5-3b28-08ddf01f6240
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4314
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_210625_430276_E3E4B8F1 
X-CRM114-Status: UNSURE (   8.51  )
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

Patch 1 adds the device tree binding for the NVIDIA VR144NVL board.
Patch 2 adds the device tree for the NVIDIA VR144NVL board.

This is an Aspeed AST2600 based BMC board for the NVIDIA VR144NVL
platform BMC.

Reference to Ast2600 SOC [1].
Reference to DC-SCM Spec [2].

Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://www.opencompute.org/w/index.php?title=Server/MHS/DC-SCM-Specs-and-Designs [2]

Signed-off-by: Donald Shannon <donalds@nvidia.com>

Donald Shannon (2):
  dt-bindings: arm: aspeed: Add NVIDIA VR144NVL board
  ARM: dts: aspeed: Add NVIDIA VR144NVL board

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts | 778 ++++++++++++++++++
 3 files changed, 780 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr144nvl.dts

-- 
2.43.0


