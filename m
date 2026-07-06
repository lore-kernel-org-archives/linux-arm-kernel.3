Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF74C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdKDrOITyXZatHuIc86ZO3dbgvUa7luxp9gwswHt6rA=; b=PKp9lI+KRdBuiPp5A19BIy3roB
	KFG3/49781IeB2xsymRAYJLoVBhUqULaXeKzd2nuGVci47JFA0b/uytCVEpfA4gslUWhLRxIiah3+
	yghDovkuHMi3ATPMGYpE343W2m2VkluQaj8fyFmhPDYeztj1Boro663g/KEOYNaGGINyN6AD5xII2
	ekIgY4bjNpRdoaW9w/3rQfKR3Tocj113618q48SmWUAUkApFJ1nT0hYhYgN1dMXXvB7PWkw6gZBeL
	TMjWlFqg1RUQj/EfGn5tqUGFhDUgXv46y0J1bCkogtYKjiIu5mXjLtm1/YkOVTccj5KruI2wnvths
	wOQAo+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggN7-0000000CALx-016X;
	Mon, 06 Jul 2026 10:16:17 +0000
Received: from mail-southcentralusazon11011038.outbound.protection.outlook.com ([40.93.194.38] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggN2-0000000CAKG-1YD5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:16:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALmsYSx7UdNn5MUcMZ2ovkQaMDEFPT28CUSzd1Wf7mvw5aYhOWrlXxmniN44mjn4PpYyymEV9rZNnHa6mIdsNE5ZIbCcRRGruN0togwIWwDwHEllcY+fsRIcCsP5oSfx9a9PxbNdOOaIJjoFsGi5jIPsAlfWCfJcJtC9dJxG0vYsjl+xpIIRQspYmFhXty/Hl9rAAZnbJranLRcOPAgVZabKVNhElncr3zb4YgIe+p9N84kudLf/FjsFgyZeRDf9slyVQnWdTQmKpuEWa2LjWs0z/E2RTT3Ym6N5ecRkKh2bJXjpiVNCRmppyHZMA3ZCD7SCRO9jykvjCcU8ztrn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdKDrOITyXZatHuIc86ZO3dbgvUa7luxp9gwswHt6rA=;
 b=k47827J2JjV09Ix/Nt4l5Mgz74qsnGdGuKnr/OMWXIEVOLwNfm42G1+V2uMSEnmiqrRXaZYzLUQ9CPnPzo5zgEpbxyg0L8yolt4UcKl2OlH7HMsVLjgCt4qB9YT2VU1s4P3WfCuQNmKqVjhrIQRApLZu3bzTf87fTBFJXtylL5pot1hH1NiY24F3tpRSn0f6v4+zFZGyZbfjtyHnlM1f3DKrrsWDyUdHBXN4eaBCeJ8i5CU9WQpuOE40AJSlvkC/CNJlbVe0lLIwVktLAxwHM5ayG6yRqXfstMaiHjfRhH+yWiO61F+CxqrtAnCGlnoob3HknrlZi4yEhqgjFINHgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdKDrOITyXZatHuIc86ZO3dbgvUa7luxp9gwswHt6rA=;
 b=dL3ObMzp/jJSeM5Gm/6FMmadHux5HZuC2rPZNLpODSJhykji+DqJkglIW9EbbQeXopTMnATav9zaWLt4E5d0fPXRVH2SRgoyTOxzpVEdS1mqf1cfWW+ppHf/Dq34CRWk5vNuGYreKbIrNcAS0fbY2YDO8aDTLBYZNiZwERt1jhMUixte/V5d/kwZIe7twyNnjamXZRgiMhr7dakGtHxe89HCgah1WbqjL1gc7CtEMLbWT3Rn+F/zKjTnSGmHnyWy9iibkBJNKhz+d/D0L4QEWvjddBDnjM5nej1uawLl/hLAqiAaM4fm6m9oCfVwn4KIOWrwwPsPBHTaWPk00OLbgA==
Received: from BN9PR03CA0738.namprd03.prod.outlook.com (2603:10b6:408:110::23)
 by PH8PR12MB7207.namprd12.prod.outlook.com (2603:10b6:510:225::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 10:16:04 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:110:cafe::64) by BN9PR03CA0738.outlook.office365.com
 (2603:10b6:408:110::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 6
 Jul 2026 10:16:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 10:16:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Jul
 2026 03:15:47 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Jul
 2026 03:15:44 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <andrew@codeconstruct.com.au>, <joel@jms.id.au>, <robh@kernel.org>,
	<krzysztof.kozlowski@oss.qualcomm.com>, <conor+dt@kernel.org>,
	<andrew@lunn.ch>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add NVIDIA VR-NVL BMC
Date: Mon, 6 Jul 2026 19:14:04 +0900
Message-ID: <20260706101526.2556226-2-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706101526.2556226-1-jackyhuang@nvidia.com>
References: <20260706101526.2556226-1-jackyhuang@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|PH8PR12MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: f67c13d3-f642-4bb9-26ce-08dedb4795b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|23010399003|36860700016|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0cT+lW8HTAohBILFEEIA/f/+vi0dAV9GWCRnozG41yx/IjOKKlSrx29DzV4rqfE8Ztwea4hS0fODw2NAg7TblqnjZr8LxEfQHPEw8/mUjnsixsQkSZ8WKZb6hk/1wVeTMmGI/3gYt292N6f67lJ/sDvsBEXR7To8D+hjBJad/IYp9o1z+E9e0ef1iKeNC6FQWzWJNOqWmEfN71t9b0/MVQOnwG6yR3mcEm/tirsU31nqsjqJzuJDfzMSedBjPo29zakKDgnAV1Lq5HNlinh6aUGV3iBxeF+ihuSfK2hLGOi16k9jm0muBJ9oF/ezO1qSwYQy37cuqe6N0JcD/ommpVj619wg2FdeTE8q0QP5H3l+PWPmuX+e8wOv8uMXG0fymHR63uPnWPUemrhV/iZ6utJayK7X3wZRmpxyRPqG5Yo4JN/v7FVHyphEXoy9ztQz+ud3O3S7hRFSyolU0DsCXpMBDO4UX7kh+8FYH7sqFyzW1J5oRIhfqhZxOl/DrgmPJocIDxQ71npjsdQHEby33zTfoF/XedsSiSWgpCl0lef4N8+IYMmaQ8fRE184rKVsZFzq8z3mpuO22TnPmQFWcn0vsvXwTrUSWrP22NjdjfVyESkAB6ROSxY+YFMUt9Dwglp8rggFsYzKv0smt7KUHdExtVF2MzVixU+gz/zj+3ex+ImaJk08ZRbKuYH5/xH34g6E5ftz3OxzqfnYDojEfA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(23010399003)(36860700016)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pQxZycrc/c7xniShgTCrYx6FYKw99isWresWyKxt9APbo1jgdzbbwJoLvc+TC7GbhO3UN28YhGjnUoObjxI0AFssRSU20lwXFt5MXfx4+mLBQh9172wdKTl1JWEE1g71axrwQxE+LU2417pS9mg4/kuUW2c9GVSj37+XakwGJuW8RA1PHpdJU3gg4wdNYYlP9vPMiGV+uD6J9f5s1CgIqhOIXm+xGQsz/tUlNj7z8tjmFS0Kg9HpV1K18vgn2SmI+HNnWzZptRNuxDdtMkDF2vCn/6pGtlR/bhIERJadyETpIXG3vTawtY9rXwq0NmvhNg3IZaF4jJaup/WKQh75sglkW381WxF9Vdj/xML7P1mSrcab0pyt7N9CA+RHwvJ6M5EEjWFxNXOqsxH3TYCXFU0WkvfZ75kd9V4O+x7GBThmTNPc7CsUMi2oHjt4vyXN
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 10:16:03.2230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f67c13d3-f642-4bb9-26ce-08dedb4795b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031612_471544_113D46DF 
X-CRM114-Status: UNSURE (   8.24  )
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

Add NVIDIA's VR-NVL BMC board compatible.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index dd7996960de3..ce893553cfc3 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -114,6 +114,7 @@ properties:
               - jabil,rbp-bmc
               - nvidia,gb200nvl-bmc
               - nvidia,msx4-bmc
+              - nvidia,vr-nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
               - ufispace,ncplite-bmc
-- 
2.43.0


