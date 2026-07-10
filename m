Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F4FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDmGPjrXGkz+KZjv2SJWhtAlymfWVB4F9hxa1pGKoiA=; b=YCdrRirhcSHSh7YCwYljYQZQA4
	3Y7y99zFuzRKxrZ380oFhPA+SCn3/HIQuKbrFecZHwbRyq6gav//Faw7wzdhCCi/WrDUxVHbZPdgc
	oBjK9VMngSNkTJFO7CPY57AOtKJ+/NzyMMf8RJ3ggZQei0b1scczCSLXeUbdWhLR/hUlUJ2/c6XFA
	ZbjeuyxJJchDsZjbTaeXfyO1msz8srPbXaOTDsTCnCV9VD0KKgIzPB/hqv5jULJmkw7s3FEg4UZry
	fXAudMIX67CAFeS28yN/0m7+gcXXoccDdrn6m1Ha8BckmuQqyJAf3gSobUGifKG4Oa5o31Fbk7VNk
	tHZ36TWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi47Y-00000004Dft-3OPX;
	Fri, 10 Jul 2026 05:49:56 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi47W-00000004Df5-440y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:49:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qjv4hfhY3z6t1heK3hbSq+28QANuPWelEH3ood9cV7f51yidW3ZI/2duhUtXenn+qBYgeVS2ik5ptyQEDippsnXljg3x+yibD5TrASAvODjR2rzfnWBqIAaMy0lti+lBctQdwvmhp9iezUTnPx3LfESPc4EBanmAOhIibmO+exervWRRh2XAbhfYHuUSr1q+JNYouAzuzY8ZN6O+TKFxneUlpFpCRa7+MEj4Mff7HgOY2fyV1ZKMc2PlH5KQYaYkyHrWDBlm87K+VgsPBl4jDZQhOqOQaihJ7yj+6Ba2mm07C2ARRBee0xE8yBYWWqvmQhhiAh2OGKJgG9Va54IAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDmGPjrXGkz+KZjv2SJWhtAlymfWVB4F9hxa1pGKoiA=;
 b=whIHezl+D6s4RJz7G5EIexHJ/qu5XBttLACG+9y6GKBH7x8J8Ois7xiIojMSzUoNW3VcbbzPSP9rfP9xejYM2BUw3oZtYM8kFkOx5JM5eNqB38i9YfVxTgBw22wUZDmJLsRjIJMHTy5FhRc3raXN7DdNEyvnUbBDCHaov++IH2Wc1frPL1xgmpTKWdRXYvN/uzsJ5HWvCK1N+eKaihItaco5dhrDvPOyaW9ptvEntOMq+TgD1ecXkmCBv+fVrOGCQJYU9ys4RCvsMyb4aGMnvyc7oa2XydtS+8MJWTXKjurQogD38j2/joXCgwtLQfxuDw23c43mmSsZBXMQIvkgNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDmGPjrXGkz+KZjv2SJWhtAlymfWVB4F9hxa1pGKoiA=;
 b=acLjbSpqIQJxQUUETdFWVMUKIvSrp0xDu1/LAL7/OY2Q9Q5WJaArehTbxfLSstVSWve8HazMb6EYC+gItR6KUiRsYxl/47yxwAIMG/MdIx7WupySYN7tw52rO6l8TmGxbW6oW0mptGn0fbF51tgp681fEd1qrO4vq7sl5oPacITENz1ktdm4mKOdI9bmyFR4bFw7Lc2iNbsW8XG04U29d5x26QS0tj5IPkrzoA9VqTaWKZz1fJ6PUa0FwbYaoAObapLioRhVbE7cXI+OkFp0p6nD2uZK8J6MVB7HwwJjWWTDPXB96oz5B5LwsGvrYJWR4ggH/mL2FxMqjBFcCz3Vgg==
Received: from DS1PR03CA0014.namprd03.prod.outlook.com (2603:10b6:8:450::11)
 by SA0PR12MB7464.namprd12.prod.outlook.com (2603:10b6:806:24b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 10 Jul
 2026 05:49:47 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:8:450:cafe::4e) by DS1PR03CA0014.outlook.office365.com
 (2603:10b6:8:450::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 05:49:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.0 via Frontend Transport; Fri, 10 Jul 2026 05:49:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 22:49:35 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 22:49:33 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <andrew@codeconstruct.com.au>, <joel@jms.id.au>, <robh@kernel.org>,
	<krzysztof.kozlowski@oss.qualcomm.com>, <conor+dt@kernel.org>,
	<andrew@lunn.ch>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Jacky Huang <jackyhuang@nvidia.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: Add NVIDIA VR-NVL BMC
Date: Fri, 10 Jul 2026 14:46:55 +0900
Message-ID: <20260710054849.3178747-2-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710054849.3178747-1-jackyhuang@nvidia.com>
References: <20260710054849.3178747-1-jackyhuang@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|SA0PR12MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: 56ac5cad-44d8-4f9c-2889-08dede470cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|1800799024|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: BY5emiJ5ZLefIRpFxGQpbm+SCyfY2eQRT6n4etUREnKi4CE480KrNMPB6D3Gz2dtMLsfg9axW8wLLsBnRO3cB+09/mQjVyKk3OHM67Tcp4417O6oVRyQrRwxIxCaB3MhWjEp1q0vJ76ak9IY/y/bQh6tT+X9Ain7im6vYM5T3F4ooeYPqV5+lM0qiAguHYoTF6okt9aVphd+f1HH9mSSPph7tyQTCbmiUhgttl5sltBw4IyjZaJthbnWc7lHYs3a+VYV7s0xBIYCKqZmWrNr8etXFYn1Aw0ojTiOg64/M8B6Fn2/cbP46JJBA7/rdEEgoeNNgWbsAG5CbZD+aB6R2zSak1NH+2ljqIbXPC9+mhARW5RkjsacZoBFq3h/GpPjDQcs5s+PrJnzMhHTVsU4ak8PXnIiQApciVurSUbQSC1s2yRtItAF8z2TqqCuX4FmAgIwvrAOHFfb928938EhHFW+fMevQ+1tGbcc46avuXltQj1cyaznSW9onUm2c4ZMfNrKvOJQWc8toeoemxL4ZZf8vQHLy8Uxcm6C1DQagKLnLCr7RNxrxdXNpu+0NN12Axk/0v+DzDgG8z0G+ZgA3vnBYgBcbzi/+cLMW8HCRm/R0lMZX9tvHJlqWGDdFOlZgQ2T1qzZ+ztwn1RO1kqlLfL0xmkOQ+c5bYIRJhv31+huoEqLZphUZKTK06E+WdGD1lEJOHRtADH2Ot2F/b/dPg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(1800799024)(376014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iCEOyKbaKa81XxkaF0bVynwbllMNCqdb71nx6haQjHhoAMaWgMny86YLFVPetEGru6EdYsgOADclSv6NqCAva7M/lOFxIhmssbPbqCKDtCM/MRFYwiRA8gsNmsmW2AxQ7zmgL0oC5e1WQ1v6o0rn/HNV5aoW1TmZFk43zwRYjSH8l3TgwgcqkilVc4GfFhAqHXORDea1MKkuxgM9A+hW7lvcO+bzRUPFmmWmI4X5ImA6El866wjOyyIViSC0oRMj47+JcYK9fRHHSQYQsmBjZXuAQuKlDgErUgoJQQYRYDME64sot8ylxMc5Xg76ntmIlBGMKXCTQ98WAhk/IuFaOSfIG8DvPoWYrglx/BIoitKdS5Ukr7A31sHilE1aABuCKuBO3K97HTbvccnEEEvtLZD9Pji5r96xIk1R/2ZsQE65+jpWc+ExAF49uowLInGG
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 05:49:47.0050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ac5cad-44d8-4f9c-2889-08dede470cc1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_224955_006692_3D1064AA 
X-CRM114-Status: UNSURE (   8.87  )
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
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


