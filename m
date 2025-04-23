Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3010C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyBMnwf02SEV6P+ssxRTchf9EVUaRdkKZfLz3mLcvb4=; b=P6ypYCEbNoTvO6fxpnD3KjImWH
	aytf29tFjy6qWN3mOc5f6LTzOyMLvdm5OkQVQ6emhtKn3AmvJwIaQH8cgrAD8AfKxDgapEuTJyoqL
	C0IVMRpWhgAR3uc4prJavVV03cLXFOwKgzIcJdsgP5fiWbC2RuYSIFmG1nxQ9Bh/p3KbFAaJ139GY
	hGXTlNyhtwgXoHoVF1OWa1tYtPH6wnsaZd9Q22unUWTggoCf3mM3rSvFl5KB6z+yA9fh7Z5+lM5XM
	B67TXGCY/qIgd2+aSBidSmEdEGigGx6eBCTgd9Fd1unRtwqL4NoQaj0LiTfpNQBmoyEF7LW8UnmcQ
	trNo4nwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7acB-0000000AkVR-0R2Z;
	Wed, 23 Apr 2025 13:58:15 +0000
Received: from mail-vi1eur03on20700.outbound.protection.outlook.com ([2a01:111:f403:260c::700] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aHY-0000000Ad0o-3DBR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 13:36:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZsM3XveQSf2eKDBXKXeCZ7BbVXark18p61Jzrz5MQiBL1MW3W42HvVAJaS1ZNS7cgsv7I9uKa3gq4euodcCkfnMSCMMCUpruaRgLBNTvwAqldN7yXrxarHGiKWfh0LnTrCNo/GAQRBW8WGRFL4tx1ppDul7dU5JY+CKB94ElDVpxAINT0Vkk9FKGTOHUk6enwAQ2IfLg4paB6qoWwKOG6EsgPSRHRLnP2S9k4K+uyWEpLKWJPEleh9lWuBgi9cR+aLLBlQ49IUktaknAJCx4NLIb0U6fYnv3lGoQOM4ubMwFjpEOD+2rsCO+cBWB/9bgOAMfpIWHjXh06n6AnkgfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyBMnwf02SEV6P+ssxRTchf9EVUaRdkKZfLz3mLcvb4=;
 b=VUSlJ/9jn/wLwtuGQtA7X+4dVyYq4LzUA3T5w6T3Mn8czdoJAbWQ+x/v/3Xtkjd2PAqjRUbINCw5FZMLDJ/FlSPQSiFql23HI34FlB1XW6Z9BCEHS3Ki5cXVZ9ccKXwxgqbinPMdcY2+MSs2og7WSyud2rKPdqG3f70n1bgRiep5ZRiq2ze1be3jxacjdusC0yUL5xmPAGTiFgjbaJ/AWjNeyu9Ca9kBK+edvYN3iawspVMixFvkMIQpUlecb8iiHFR0++Sm/pDEebd7ws6c550p4YBO0LzF4JgwzLKyy7/Fq9B2fbjQvFXzfl07k7mpojldA4G6HQJlWXmdFkCTyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyBMnwf02SEV6P+ssxRTchf9EVUaRdkKZfLz3mLcvb4=;
 b=lVShO6CTEU7SDdsjt2JvEsOBUy3sWp3310C5Zrswa3KY+M6/D1dy/QtdiSzevQLdsPiEu02SaD4XYq5Ya5pej76tutG/u1JLE8YLqxkL/9SeQKPJR6VELXaNAuQ5UPL5JUdtlByndS9eZpkYEqcsamkZZXz8Va/34fksftzbPzVUCqj7Dc7UowqQQweQdYCKoxA8zNUXVHOJJGbKxbN+CsxRncj5Q5NR3iA5+zAbc2thtST0AuYe3gNdOK9qw7alnOO6IWiLGOxQsoMsi0dsqgirz3KuEU8IAr/yNQ+WrG53VXJw6kt7487BPD02SkB+xb17Sqcv4yTwB4BiArUx7w==
Received: from DU2PR04CA0154.eurprd04.prod.outlook.com (2603:10a6:10:2b0::9)
 by AM9P195MB1110.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1cf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Wed, 23 Apr
 2025 13:36:50 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::5a) by DU2PR04CA0154.outlook.office365.com
 (2603:10a6:10:2b0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 23 Apr 2025 13:36:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 13:36:50 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 23 Apr
 2025 15:36:48 +0200
Received: from lws-haller.phytec.de (172.25.32.139) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 23 Apr
 2025 15:36:48 +0200
From: Dominik Haller <d.haller@phytec.de>
To: <robh@kernel.org>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>, <m-chawdhry@ti.com>,
	<w.egorov@phytec.de>, <u-kumar1@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>
Subject: [PATCH v4 3/3] arm64: defconfig: Enable TMP102 as module
Date: Wed, 23 Apr 2025 15:36:35 +0200
Message-ID: <20250423133635.29897-3-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423133635.29897-1-d.haller@phytec.de>
References: <20250423133635.29897-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.32.139]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|AM9P195MB1110:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c3bb4b-0025-468b-5fe8-08dd826be6e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hDVfNEnXl/XjFq2xK99Dfj9LdN3UYdLr9ZnMcmWCZKtqn777kh1tJykv7QyL?=
 =?us-ascii?Q?xaOvwYl9FHRkA+9V4WaxzkflS1MJMzGIP9yRDa6PBnmnSGGgw2ZGx9/uSFPw?=
 =?us-ascii?Q?m6WgzdyFnsH+/In4IHFhwPG9WAYd1z5gDwZ8n1NxfX33eUEydk8mmDSOk1YV?=
 =?us-ascii?Q?ic7mPDd1nJzS1KgOl5AecDgyFrIQBFLY2isjMEAtJAs/xzbciz1Do+Jp4Oqw?=
 =?us-ascii?Q?EeWH4uTmXXtlEyG/PmnZw716XcjYvdwyEAgB8d32Un0Ou+pcfJ4zzFrgYi16?=
 =?us-ascii?Q?eIv0K4g3zQPWSYX4rMJkuJo2SNdibAvqMoQ6/69c7V0XCr7bQEP2MrvFirSF?=
 =?us-ascii?Q?oT2Ik/shil4Fb267HjI/3HEFiKqJVuUaKTJ2DLJewSVOleqfxVlPcXUZ47nH?=
 =?us-ascii?Q?BEVw3X8aVEUS/wZvTBu7H511sNXl3QgSZZlMHRVG5LZ5mamwh7s2fT8ZcbSh?=
 =?us-ascii?Q?+MEMD0im12a/HI/yQS3no8RvHxPweeMdH8QjoeEvBVb84OLSq8U8m0qvCafB?=
 =?us-ascii?Q?BGzejpVIRrHwWbsElEXB4eS35qXuEm+0suowKyNTQHtQ+dBSNtKhA1D4rCGM?=
 =?us-ascii?Q?3gl8Uv2gTYPMJAXkmJ3zeQzPrGiZ/chA8KEDj6fL1nAJaHTksF0yjyvfxbjP?=
 =?us-ascii?Q?puP1Jre0kWU2BamEocFG/iG4/MZ1czZ9gSpdxYv8oBcidSeUu7fY1YoUzMNd?=
 =?us-ascii?Q?L0GosRs0tngDh1cFf4xkEIqgI+5O9k7GYVdRikxLiMnUKZNHu/QUposWixIi?=
 =?us-ascii?Q?YyOv8Oj2A9bneN+F8czXGnv/zGmrWaLxZZwMeHXB9znTKrNtlsGmcTM6qTmt?=
 =?us-ascii?Q?IsAOhfgTELV9YN3Hw+hhj5e4p18ci3DaWNaN0H7Qny7jv6i8EQTQIy/Y/OR5?=
 =?us-ascii?Q?CewtrZTVb2rVqsa2ULC2AbYi2IkVHUV9G3xL7ElrCcpLbkbDWXO99cYcPYzO?=
 =?us-ascii?Q?9nYRf6cKJvnh5DUdm7BxQlWl0TFIQNYMT1bcJUOcls1BCgG+d7dGL5b2ie7R?=
 =?us-ascii?Q?K4aDm4nMqjL1zW9EE0Gd0wCf1Xi34Mlgmh4rAaAToOtdDjbzkafa2C9yEgZb?=
 =?us-ascii?Q?Ijd5U7I5cDLIwWcp6bgFb+MkXXU9z5rsOldnyop8ZIjHmpMUevLV1Yl6PoUE?=
 =?us-ascii?Q?YvOtyWGyu6Pz8h7L637fUIcrc7BjjTruwBBs57cltuo1WFP3Y6fS8ZG9gW4q?=
 =?us-ascii?Q?M7msdf+JqmfHXwOEIYBGB8q2/o/lYPGK3rUAbMZth9hXrQNypKAw/Nc6SZnE?=
 =?us-ascii?Q?ot+fSRm9b9oqE3G6BAUdJFD70UhjfEaqa0544TD+Mg2NyvzLcjemKKAcI5vc?=
 =?us-ascii?Q?y+zgxhk0Ek3+d6V7ow5UGW3AjHpLVWln9ldbiNL0R/OEO1w2T6NcxFnWy8c2?=
 =?us-ascii?Q?E1ftEozrOoqSQvXfQ9ua7pijuOtfNu7215U/i32CfRJyVRPoSLO0LitqT+vi?=
 =?us-ascii?Q?lroNvACgegZerBRW97Tp0ZqbferVh4A5PTI7TbDEQQSJC2xKdD85s5/BMBD3?=
 =?us-ascii?Q?xOvSQq4w7Ed0Al4C4upsSsk9e9VB9gg0padG?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:36:50.2625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c3bb4b-0025-468b-5fe8-08dd826be6e3
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_063656_807946_A558BEAD 
X-CRM114-Status: UNSURE (   8.89  )
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

Enable the driver for the TI TMP102 temperature sensors used on the Phytec
phyCORE-AM68x/TDA4x and the phyGATE-Tauri-L-iMX8MM.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---

Notes:
    Changes in v4:
    - no changes
    
    Changes in v3:
    - no changes
    
    Changes in v2:
    - new patch in series

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..54e6705f9752 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -702,6 +702,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_SENSORS_TMP102=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
-- 
2.43.0


