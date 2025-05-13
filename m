Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57120C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 02:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrrlBKeOi+KDfQQXyjr5Yzguwm4KMkMUiC1P6pGVHDw=; b=vW13dJpf4rdmML7DTefABcbR37
	KRFANl41e5nhU2qWC1iNwc1/hC1tF6Oxp/my9QN1xhVhf+S2843LqmYjZBjg0pdmK7Zjf/Zo2iGAW
	aC+8iQdn3QnZVFZuIlKQVLBklLLlLZhtA1GVdJC+Itrza6bBmYVghn2+1MsKy/TVfUaNeLVs5rFOi
	WZQYBMEXxNxjpIxVh/Mm/2yn4nZmVBoZ4TRUp5o13Lt7EM59PbcNEllHWxAyBUeTQl9U/KCfUtuYh
	JH5RW6GrCBiyG/vQG/QJhXmYHw7OlhRiFToFgws+f1qE9EGEoI5H35Oy8I0wykZbtjiBvB13deCle
	i7Zg1UUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEfA9-0000000B8AO-0jun;
	Tue, 13 May 2025 02:14:33 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEezd-0000000B6cD-02q4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 02:03:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ir1I1/ktOTN/BqIRdC9TNerUMTNl+Fa+W9g/Y6rcJNBDyeCLjlJb2ba6Neio5ciYadOfSEQ4HOWP/1y9FXqE6xljO8ly/Amels79lEUugkjwBCvs36Brw4DYMtMSZhF9+sLSs7ijQEJYEbl9CQrdquKN74koqMeXtK6vBrjP6TlovSkpI4HaMS1Sdk6WzxIdbYxdF30NCF0YOWUsH+Q9HTZx5k4Z82Ey7fMc/Wc2263XZEcN00uhGSanksqNhBRepOA86YdxEZjqW9neRLXk+BxCQZB1EfsONMW8/GcI65rBEZL8RNIntUfZrL2OUYuErUNiFS5nbtAP45govsXUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrrlBKeOi+KDfQQXyjr5Yzguwm4KMkMUiC1P6pGVHDw=;
 b=dBlBZ/KPhKJHp93e9BY/QcrXLtvnbD0e4PdnicwfJHzVB39maPSNWqY0W/90hrnZ0B8THrzOZwgeUTwzmRtPP7cp85n5GKBWufmGq/Ir/J6LCLTTH9tI+aiATErokQELYrrTKRqd7jMT8Hl+q97fCZwUQAHKaTxGLEo0Xl1sTvr19EmLZG8tPTsEaqhMKVn1I82P0Fz8+UGzASS3Ld6W8Rilr8ehj49+g3VctSH7cr2L+hhEBd41glFFH06COwYMaRkoca8LCQxqCDYFRM8n/LxOXxvCaEMTrAR49LZGp8mWfHMwvUYBOtK/xQdu5OohRbie61ToPnLipI3pSX8z+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2b4::10)
 by SEYPR06MB6431.apcprd06.prod.outlook.com (2603:1096:101:16f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 02:03:29 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:400:2b4:cafe::e3) by TYCP286CA0092.outlook.office365.com
 (2603:1096:400:2b4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Tue,
 13 May 2025 02:03:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 02:03:28 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5C0084160504;
	Tue, 13 May 2025 10:03:27 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Fugang Duan <fugang.duan@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v8 3/9] arm64: Kconfig: add ARCH_CIX for cix silicons
Date: Tue, 13 May 2025 10:03:21 +0800
Message-Id: <20250513020327.414017-4-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513020327.414017-1-peter.chen@cixtech.com>
References: <20250513020327.414017-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|SEYPR06MB6431:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a7520e36-6ab0-4813-7114-08dd91c25aac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HqINyhEa8Cy9zYwLGGUlOGKqAtMzQvUto1fKw6SgP2PHGsuDzg/sv6NKo1hQ?=
 =?us-ascii?Q?eqUBoPEQiCCoUJpS3rP35ofxGsiT6Wy2Y86dgtEF1Kduub+N5GXcsVQULbUo?=
 =?us-ascii?Q?Ydjw6v8Zjry4PdlxXk//ChHzRrEQrasn5gyr1P/P+i3MERpuIm2ypbrTMx1c?=
 =?us-ascii?Q?B2OpcpD33gyrvCrvI0taZ2tWFQwoeKoMHClnYCEuJJ/T5X5fnN8QEUxBkWHX?=
 =?us-ascii?Q?+mA8/SpGY70YOY2GAouFKgB+jJkalGuD7/lNldNW34hVIPcMXxJZTnI4oSva?=
 =?us-ascii?Q?tZFxXXetHvJ0I4JVK/eEvzeY3t1GUz+NtgLTHREz6vLzF90DviRONt0uPrgk?=
 =?us-ascii?Q?TsFViNtcZvknIuoF19HfQalP6KW3jZ4nDsrfM3Dqxd3acHQd0JQ6aYy1L4Sp?=
 =?us-ascii?Q?/+fQidowIzB6J6DiM/Ss1oqBCnp2eIdkxIiSkeuAlZak/CGjQdaeCynjpdtS?=
 =?us-ascii?Q?7wSNX1nYeqBqTrIWxWNWqPFmdsTwA2bWnmWvdjlhL7M9GmjEon455WhMpEFn?=
 =?us-ascii?Q?7UAEVOUd+0EKSphjHpoBPjSc7Ky+Pr8nM30iY0FIDkS2LQMWWgsHtc2abUfM?=
 =?us-ascii?Q?WG9uWr5ErUGSX9GjdE1tn1VJ7EprFr6hukvRIr4JBTsLFZuNMZoGFSA5CddU?=
 =?us-ascii?Q?Lh1fuyAHDD34eMMB55z9lHfYXZNJL/PegYBjMu/gB8Uvp95UtPMv6YCMa8fv?=
 =?us-ascii?Q?Z9LqgTyGAQQ4WX/lvci+6X0PSwr92XdmntZcWSH38DrMEHv94BT00iiD8pQi?=
 =?us-ascii?Q?dfbWpJOVTTuglIRF6N+49+5sM30alY9SFnyhxo4uXqONsGC7/SeXZdl3qBYb?=
 =?us-ascii?Q?O4Yo+xo48tTNvxKTLpQKiqtkK0AqoxuaXbM9Wv8Sp277bJimhtvXjb3BL9Pq?=
 =?us-ascii?Q?m76mbJ2g91sIX5Fe7LuaxsN4KY8QtRL/EErm1mbsaBLcQBggaKrHAUNKnsaC?=
 =?us-ascii?Q?kN3H5vhM4YwCEtCiAdJjWnFgsWgiwIW1zjN4koLQJ9rpSdd04my9tZpg0YKA?=
 =?us-ascii?Q?Fdtdi/UeBUkTIaNY8yacHy4v3UDOiVmuKeTP8Uc7eUTK3JdPg1ubn2PI513J?=
 =?us-ascii?Q?XEgbtYI1c+TgQgK3Ek/o9Z1qH+wmYnnPVV/qu1hvoByKmSj+XizF7NgfESnE?=
 =?us-ascii?Q?JBzfomqK7QsQDSGNMia6ciVRY49IanhAARp2UdNwqh10T0Jf42UDLNXfTaWp?=
 =?us-ascii?Q?pXAlVttbMcdHp4PARK788k8f+YQ+0rFC/hO/EW3iyxg+Z5BxhmOjDGE5cMqX?=
 =?us-ascii?Q?MeSMujuxzONLrIxfGuszQ0ggnR8Yp0m/OE9krHDULybDso953McvpgaF0Pbh?=
 =?us-ascii?Q?9qmY9Mh8kwNu35ZvorxBfgtwPzTQ10EKnGuYaEGPe1QGz5WNc+ojsLK3JpRm?=
 =?us-ascii?Q?5z0a3GA97UzSxurSHSmTiw2Cr8joMc0+3Ef3FTFZCLZRZ7T+uckwMj1nvP1W?=
 =?us-ascii?Q?VmCen3iencUC2nUCaDB+8aGRjDSgpMEh2khyJ6cXLFcXrWKNPUPCK4mOeYyy?=
 =?us-ascii?Q?suSJtwuuHy3jV6tIgHfTfDzd2xSBHONRPUpM?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 02:03:28.4990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7520e36-6ab0-4813-7114-08dd91c25aac
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6431
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_190341_053763_DD0A004E 
X-CRM114-Status: UNSURE (   8.82  )
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

From: Fugang Duan <fugang.duan@cixtech.com>

Add ARCH_CIX for CIX SoC series support.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..3db7acf04122 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -106,6 +106,12 @@ config ARCH_BLAIZE
 	help
 	  This enables support for the Blaize SoC family
 
+config ARCH_CIX
+	bool "Cixtech SoC family"
+	help
+	  This enables support for the Cixtech SoC family,
+	  like P1(sky1).
+
 config ARCH_EXYNOS
 	bool "Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
-- 
2.25.1


