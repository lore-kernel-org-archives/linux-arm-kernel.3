Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A94CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jb79vdBkOaCXJXCWGEig3ehFtAUhwOpt6CJ3ulTSq8E=; b=Y1hCYKBJY+VUBqvxk76ZT1yJYV
	z8wazrCeZMF5fgd3KbvLhWG5yissh5llQsl/U4nayMuQ+hZdoW+TgjDfoOgTM0cs450nD43HH6b7f
	4nbPA04HcBK7fon+G3LjtVWWQopemqICNoWm37vBJ3XIUt8ZUHwxgx86JWGwKkSMUvuR0wmoAR/8k
	Mlr2x/KTjTgTGUlLgckwXxY+4Ge3JyluupAPdrP/qiXZFA29C37rEm51UT8sr4fQ8M1KLACUq6rTQ
	FYgQh+ZTxIzJhHdYdoDvQg2E9JOKyuDqS5ipaYw1cRPLjTjKpiYiESaxZm1TcG6EjR8TZVRZyMtIH
	THF5YgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BeY-00000002Gjx-0Mpw;
	Mon, 29 Sep 2025 11:02:46 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BeV-00000002GiF-1yu4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:02:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doxVAkkm2eaJIRwR4BWognLbrxurgoqIdbz3A1gfWbjZPzJabF7/WRDECRrX2T5sXpsi8C2cWIJecwje1c3H3y/JFEOgIIhSSqnT+sytjdIOWk5WR6VkMxjKF9kNP8XuWQJBDH6/0ur6P/C985aZrXX3eLSiq6J46vNQnl6EOlPN0emjcVheiBe+p9vUHfBZHLl/EBEGrJXJ6XgLRezNXNmO+Un7wogdJ3GtNHXT0SuajUwJe6667xzCaHu0S5QZigGI1PEo/ezG/KGPNlMaL3ylEjXV57MMY//It6FIDv3zWXi/9HtsnRwEwVcB9l7lHFEGz5G2qNJT0zbno3hXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jb79vdBkOaCXJXCWGEig3ehFtAUhwOpt6CJ3ulTSq8E=;
 b=igHMEpIlwmcJPFgNc0IyRxPkSMfQo97BaYsM2FOCznmEa73fV2Xzf4G6V4VygMICV8Fe4Ofdw5sOS5E9o8VpJDinw9PLDMVNFoxchedQysPY0gwUVkqBlTibdpraVFHuoon+LR+VjO25B98TioW2sCrmpul49pdQ3zUbg+s9bA0fBjgEGbPcXrwPDV43XTZhYqP8Esrze7OlMlWPoiMm4FwrDebyqMZsOkekG+H7UJ/4ny2UHBfICF8lxikEZTZTHghqpvqwUcn4zsvAZao7WTbb6FunepFNouuaypqAxZGq3sLn8psA4swEbjN8Z01f3NNIconsOIkUOBD7550wJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jb79vdBkOaCXJXCWGEig3ehFtAUhwOpt6CJ3ulTSq8E=;
 b=YPYgSgFBhLBPKYIrLaR9RQx5hmyjFclEaN95H4P3harwpIaw8MbjbNhcedbHfv57mTHwoSxeFGFrqqi3WnGSIeZbw6VSed1bthZXGiBDgAIz6+nUPyW+Uz4doyufBFqvCkQYOHan2qjLZrckPfiNkW2qh+MH+P8UEjs93LGCkgbCtv1cnXyGdCeb9d00r/Y6SnW1IyGfEAePZK5BLcY8oZAVHLSmQy4B696XLK+xXH5bMo0Av3Twm5hxWJxwwZXLZ/WGJNimzbWUPYYk2hmHgSFncn5QYqq/MM5NqmDAoQmgbCZ/wV017i4aY46+MDSYucLpGaAxbVoiQK88VHGKiA==
Received: from MW4PR03CA0199.namprd03.prod.outlook.com (2603:10b6:303:b8::24)
 by IA0PR12MB7721.namprd12.prod.outlook.com (2603:10b6:208:433::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 11:02:24 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:b8:cafe::6a) by MW4PR03CA0199.outlook.office365.com
 (2603:10b6:303:b8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Mon,
 29 Sep 2025 11:02:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.1 via Frontend Transport; Mon, 29 Sep 2025 11:02:23 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 29 Sep
 2025 04:02:09 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Sep 2025 04:02:09 -0700
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 29 Sep 2025 04:02:05 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, Marc Zyngier <maz@kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>
CC: Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sound@vger.kernel.org>,
	sheetal <sheetal@nvidia.com>
Subject: [PATCH V2 3/4] dt-bindings: interrupt-controller: arm,gic: Add tegra264-agic
Date: Mon, 29 Sep 2025 16:29:29 +0530
Message-ID: <20250929105930.1767294-4-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929105930.1767294-1-sheetal@nvidia.com>
References: <20250929105930.1767294-1-sheetal@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|IA0PR12MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: c694b446-e0ba-4c28-a75f-08ddff47ab30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r9N9SRJK1aG1ftg06F2FEPkQCqJCnB+YPESQGdQX38Hsb9BgPpqT5po/6Aq8?=
 =?us-ascii?Q?YY4j9YGiWM3zHrxEBgT44htMuCZv92D8drSmkZ5zSEsgGQrQt3UIiiJvGud3?=
 =?us-ascii?Q?ziqpEU3y/L+K1nQw3KMcjqbAs6njqWkSIcl1k7Xiae6rKo3OJpI55JSKUdiq?=
 =?us-ascii?Q?pWaqfwMQGWXjnjxfA6UaJEm0AbuABvvHj3rvC1wKDMudL7/rJVl+opOZth5a?=
 =?us-ascii?Q?0pc0ZSFV2IGxXJUFKdYjuEShVblZ4eeM+0tiuJvRZyc3MI3iaXRYpUkgqR6G?=
 =?us-ascii?Q?GZr74tVUJxllILKfgtKKRMfKa/wxLtcJbBw4txuTlGZmnsPvzkptWwV1ugzT?=
 =?us-ascii?Q?wIde6+SwI+3lngAIKuG+6jfST4J0AsI/m9kgAlGYPgyydbppdGJ+cQyN6222?=
 =?us-ascii?Q?8c4boH1hWGps9CynDjsVMrOzT9skMPXCpQsKtUxSn4JHlCgbkMAW8xhzMAbJ?=
 =?us-ascii?Q?A/RybXVjFmSs0AEcXB2VJlSzBnnn5Fqw+40EColVxQgTjWVGOFTSl39DiWEz?=
 =?us-ascii?Q?+NYsEHZzjpr9DgoPDC3Chlg8iCwGd0v7Z9m6wesrCUdEpkyg5PtH5BjXVDMS?=
 =?us-ascii?Q?ML2vIoYqA8OxeADBhc4QxOil9VCCDId7ttA2JodMeLO5pzkNlQy8cjqmkSex?=
 =?us-ascii?Q?uMAMy+WuuGylTmqO/0MZgUy+Yj7cmY8mOntTKsT4Pw1KwXLuc/9uqzqbNRf4?=
 =?us-ascii?Q?dw46Ka71VXR4FglBVyU5sOXkqRsD7zg5bx2TmsIU+pFLU2alT4A4CrgIUP7g?=
 =?us-ascii?Q?drC0SL2L7sO6e1EnJtK3aBBFFkzv4oDgrYmNs0ajyYEutXDHN5Uz6NSJsMtm?=
 =?us-ascii?Q?5TkUTcb0AgmlrsZ19Me9MwVDMTJhRMtK8o7CDpXFBeD++ybgoMwD7HqzUvPN?=
 =?us-ascii?Q?tQvAMrbxVUPLTC7SbEngCK6kB8sRJZ4L6/H7LymHMxo+rwrf2IH2MBGruG2P?=
 =?us-ascii?Q?qcX5i/mdgarnihu3BzQ0ALLJk5gAQNBjNwvEqKiyO8L8GPm/1Msp3P1H2LgU?=
 =?us-ascii?Q?+RO8iJqXlCPLeZUhSmhi1X5I4YzDSMyRgUaaiXjSQ+rkM0BklurQyQ912ewV?=
 =?us-ascii?Q?1VoT2uI2QRkXoDLMn2fHZzup+PD+1A0ZFc5TEzfiX482bwG0fapMkFKBBSFI?=
 =?us-ascii?Q?XwZfu70FaNoq9nZRouA7kP6I4ZVbKznDtOf+yJbfDiOOa+85pf7Hzfx7Pdm9?=
 =?us-ascii?Q?oEuZ6OmwuLhh0KI6/hiTODe5NBxXWZhNaemFR95PPTXQYq1Mp/+nW7SBCTZn?=
 =?us-ascii?Q?2JAo5Uj5Bn3/fd/67ITCiB/1eHBoA4XscIeTBwdKuvqrJS2NywDg/v29JoVk?=
 =?us-ascii?Q?Um0mP1lhd9FsbSNuDk6X4WrwtG/rXIL2/ajW3YBXBu4I0odz70vNnnzBP2RV?=
 =?us-ascii?Q?qivhotbWQs0ClR1FP8VJ7cx0WbVhg1zm/uBssUfnKIMrCPvYjP7V4sktJxqV?=
 =?us-ascii?Q?U4CL+Nadh49+tXNnQ+Ri+pIwEWXUou/EtxstTyJRpBfkvwcope1uWwagP69V?=
 =?us-ascii?Q?esgjEeD9Rg4ozbH84xjavQYAmzoZ3QY9xNKtJOSPffSH/i/92CyKNs5MPV+1?=
 =?us-ascii?Q?u1sTSY3Y1QQpcR550Cc=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 11:02:23.5323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c694b446-e0ba-4c28-a75f-08ddff47ab30
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_040243_516130_DDF9BD6E 
X-CRM114-Status: UNSURE (   7.49  )
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

From: sheetal <sheetal@nvidia.com>

Add nvidia,tegra264-agic to the arm,gic binding for tegra264 audio
interrupt controller support.

Signed-off-by: sheetal <sheetal@nvidia.com>
---
 .../devicetree/bindings/interrupt-controller/arm,gic.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
index 7173c4b5a228..ee4c77dac201 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
@@ -59,6 +59,7 @@ properties:
                   - nvidia,tegra186-agic
                   - nvidia,tegra194-agic
                   - nvidia,tegra234-agic
+                  - nvidia,tegra264-agic
               - const: nvidia,tegra210-agic
 
   interrupt-controller: true
-- 
2.34.1


