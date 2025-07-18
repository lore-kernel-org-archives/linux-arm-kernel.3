Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E90EC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 23:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gwj61VdGZbmkj1z8gtIXqp+9+EvND36erwsUAlu04no=; b=cTaTwc4DsLeGJlaLqCyAYrsQTk
	/vUAVVDjq2Y8mml017oLa/oho3XX4dCRv3Zb1UiKirV89VjMVZzyCJDps6zBP0Z8oA+a0faqSbUUM
	F4GlnEhpEcx+n7N2iJrIj+Lo52BYYchbSVqpIb+14qc3d53KzEE5Y8ZFrTIdMKQ7aMQaLq2T8ltn5
	dg22fe4Pu7YVsHK2N/wp+Z/7vn2IsPG123GxyhN6J1wc3Xr1rTzYGjhHNSjnSke2I7IyFtSz1DQoW
	ciKcS+X+biziuiPRB0+33aphbngl3Ly/kmUXj4uPzEL0vXG8wE8KL8NVpjUyWiruk5K0/4K4Z9PZm
	NyY2HT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucuJx-0000000Dazc-3SGE;
	Fri, 18 Jul 2025 23:16:53 +0000
Received: from mail-dm3nam02on20603.outbound.protection.outlook.com ([2a01:111:f403:2405::603] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucuFN-0000000Daif-0x8v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 23:12:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsZdfJ0C0LVNGIjzgmCwUpio372aet2Pxg8Rl0qx3Ts0uHUGvWif5zSs65KBs9ZvAPiv6DDUCR67aSZy10AFh1cU+5EH6o+emU6m7n7FmultfsgnGmkB8vZWKIcUYmqJ3HX0rdms+B6/tMvSIRrzWftbSmoDbmtIBG/ES7HnUh0m05pnW3MyhLmen36N3yqsgTKrz96aMJUk/nhclGrmFlQeYE4+QuzINv4OPK4l9z1fOYPnRZ0HnfsoaMi0w8nwNdLHrhQa8P8whLF4EB3d+wl0BEDySEVc2QsdYxqFozaPYwA5apFmeNsmyvw/fJc4YngLcaHuPS4H6xB6Biv6Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gwj61VdGZbmkj1z8gtIXqp+9+EvND36erwsUAlu04no=;
 b=TVlksoZ3i+krvJZrCGebZzsafLweWFohsQFbM7bAr6O7+RYJaUm+a6cu2nTEkrOF3Dy9vCfzQ14uK03w2XQkfVOv6dNpBY32rCjkkzczrbZ6rVHDMWKw+SZAYGmTlZE/HWWy/oEdb5dqXNkIO2yob01TNaF8VGE1j49czo+1jKoq+YMUXlnTfO27dHrdrAifc8dJmeKlH/5S2EAWWXj5W79ADA1k9pFbbacAvk/2vtEB98rTcgos3701R4zmTZyHu5bxWRQe6KY4GvwrCy/3XnZzS/3dlHBa1OIuQdtQMSz0QhnBu41ZC61BG+0DfWLtG0O0/V47nq6hKukmbO6Mew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gwj61VdGZbmkj1z8gtIXqp+9+EvND36erwsUAlu04no=;
 b=tBFYSJgaExL6kF/hiG9T/2VcvzmR9R4r70tcZBJBKbSQgfniFv9ecJj5V1O8fdkQJqZeMafSuYD83CNZfiVxQeH0LrYLvf+cVvMZBOAMpIXLYdL4MARrKG4KEyIcUFstabfGzOtpVrxwRRU+qBN1mp0p59vRGvOdwQYPrCZJPjg12QkYURBbwBlyh0M4eFMOb08VIEMadUSj9+cU+4XqW919btTKaetwumTwcZeE8foLnWAHRKU+M0DsPf5pPzuw3GEzTJmufatOBB9Xs0yQp/llZiw0im7GjaBCUNx9Va3Ze/+i3KnP2DQTFLGcFa5AFLtg0xB2xKm30QuVm/R/MA==
Received: from BY5PR16CA0016.namprd16.prod.outlook.com (2603:10b6:a03:1a0::29)
 by SJ2PR12MB8034.namprd12.prod.outlook.com (2603:10b6:a03:4cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 18 Jul
 2025 23:12:03 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::e1) by BY5PR16CA0016.outlook.office365.com
 (2603:10b6:a03:1a0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Fri,
 18 Jul 2025 23:12:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 23:12:03 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 18 Jul
 2025 16:11:37 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 18 Jul
 2025 16:11:37 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 18 Jul 2025 16:11:36 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Donald
 Shannon" <donalds@nvidia.com>
Subject: [PATCH v5 1/2] Documentation: devicetree: Add binding for NVIDIA  GB200-UT3.0b platform
Date: Fri, 18 Jul 2025 16:11:17 -0700
Message-ID: <20250718231118.3330855-2-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718231118.3330855-1-donalds@nvidia.com>
References: <20250718231118.3330855-1-donalds@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|SJ2PR12MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c103e7-89a2-4b99-309b-08ddc65081f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PJ5V3H32jzkBBuVM48EcDlEdqMylrcGOiArmUOWQoydgBoR08UFcffwIK6Nd?=
 =?us-ascii?Q?7txZGMVxOj2gro6xaENfQsc3dLu05Db4/pmxNQbjTSF5K/xh+KscGI7RLWQw?=
 =?us-ascii?Q?lZiGev9NYFZ9OKlrWFJpfcV2zUtjLKjW1HUzxvDfWC+bFQPOXDS/c5Os9XgO?=
 =?us-ascii?Q?5RJzRHVbChxTf6hlYPKX3wq2V6aIj8MDeHVGFkV3XTpsgqs0C2IVSvZAoiSn?=
 =?us-ascii?Q?hOGdQK8cP1YFJWAsboCK7nSVZltXMbkCAYJaA2GtYRORtc7hdOJTqXVKJ74d?=
 =?us-ascii?Q?YP4irEJ1f1wzX4KC2xe3Xy77kdckW7YwwUad2YArf+hzgEPCQq6HTO2Zqji2?=
 =?us-ascii?Q?cE2ASXjr/5U0+iWc0s1tkEoERU47NgJqgboYXfq9ES0mki/9GpgfPEaMznH5?=
 =?us-ascii?Q?mQu2uYid0OwXmbKghCr3AhnvC3bm3FwjQGzIFhqb429yvhR72ho5cuF9uP7m?=
 =?us-ascii?Q?tTS2Tiv2gPytEVcMNFG4FTuXEsbw4xZPkhqYNDK0MczNBPPOM6NCOSI62rQT?=
 =?us-ascii?Q?bqowbFznqEUPwlqEZm5gycJmj971q7c5rWor1AVcNfrOO9LqY4eeBiEfgTLd?=
 =?us-ascii?Q?xUZZRLJ/UoR9tYEIcei4ALw0U22864BZuSt5QilSGmY/U7jrSamtVwPYCGOg?=
 =?us-ascii?Q?Lh2xzBlEJYsYk6iB8svk9IEPIX3vy4Rg26JMOr2kK6T26T/gTb/qAKgXf3ch?=
 =?us-ascii?Q?L89Uv7irE3LXWLZvcHzhiWL8RHhIJi32NlLvWM/hswDfg28gTXHrSaOt+zL5?=
 =?us-ascii?Q?fKWzZJ7FQikuqWI84dRegftz8hFMT0huTC513GySii8YnVjBZEKmKt8CkeI7?=
 =?us-ascii?Q?r/FISc3uQhmVjfX1Kz6PpdZQPfkEuz8dKbsoTAF6bvwqWKLURKEcNzAKCreM?=
 =?us-ascii?Q?e6w1MV3gF6/2YuLlh0NtwmuGvLDjJdTk6WH8ckTqJ26czh7D5FDqpdJziyJC?=
 =?us-ascii?Q?bj3MBc7OKUbTCrn71r4UJmZNJ/6HiEfIeuEkBW7Y0kU8zW0kUL6yHb+V11WS?=
 =?us-ascii?Q?c5kDS8+rCjqlVlJAOE6jBHb3oVp16WS6XIYk6R3O6+7S/UDHGa9JxuWHyaZc?=
 =?us-ascii?Q?VyVbkWrhW79VhZvBmg2QXPuE6n/XOzJjEHHXu8Bli7fD3m96dlYrkp1C3Wnq?=
 =?us-ascii?Q?FoWYnOeCYoIkTZlHtyiSQAre826lpDZ5Fd3aJUMk7x1w9mna6AGE+0AkQijT?=
 =?us-ascii?Q?6dGNhvWfFf/llG2r2T57neBaMd/NeUajfiTdvVq26QI2KoElG9RHJYinfQEL?=
 =?us-ascii?Q?ddFgMzIQH4+YL+m61gwElKbi+3SjWeiM4qm23SZAktiQw5tExJF8Tb8gi+Xz?=
 =?us-ascii?Q?gfnnhBTRmLOYg/EiAJqJ2bYIZyhgh59OYEk6KeVl1IvY8JA4ifVFDx4fbM26?=
 =?us-ascii?Q?K6CLhSP8sI0xxRbrb1kg5A6uwrEHAqK7t7ceO6HDDNWLzfwaIvPeP4aHBZDF?=
 =?us-ascii?Q?MH2DhstbbK3OlPH6sJwrDCNE68Q9WH36F4l0OgkmxK1AmP+/+Qs4cqcHKj2t?=
 =?us-ascii?Q?U8oNGSl6YIDhM1lQhaVMbWMdXEROmw9wWM+E?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 23:12:03.4913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c103e7-89a2-4b99-309b-08ddc65081f4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_161209_265994_BB906170 
X-CRM114-Status: UNSURE (   7.44  )
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

This is an Aspeed AST2600 based unit testing platform for GB200.
UT3.0b is different than nvidia-gb200nvl-bmc due to networking topology
differences, additional gpio expanders, and voltage regulator gating
some devices.

Reference to Ast2600 SOC [1].
Reference to Blackwell GB200NVL Platform [2].

Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
Signed-off-by: Donald Shannon <donalds@nvidia.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 456dbf7b5ec8..624581db2330 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -99,6 +99,7 @@ properties:
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
+              - nvidia,gb200-ut30b
               - nvidia,gb200nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
-- 
2.43.0


