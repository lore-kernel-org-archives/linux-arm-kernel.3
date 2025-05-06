Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C34DC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 10:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrrlBKeOi+KDfQQXyjr5Yzguwm4KMkMUiC1P6pGVHDw=; b=Ic01vVtjFv1AAXgNLWhtLYh1Pj
	GTwBNA7wmLW1SsVW5mtfBTPH5m66IJKnSfvVU92fyIGGgz2W/jd3tZbRhXVZZJdcEDp3I0EqIg1tL
	wDKTQ7MADZHFeY5Ui+w8f4YyZY+Ybi4Q+pGciSb0XTQE5Slrx1UesdJwvSkHVY8PI/7I8OLlEp48j
	+2qziWKIe4a2I0UKyDKZVHDYFzXUNiG2BgBwnx0eGEYMizrZcIm5VwwBIQQAlT3ozSfa7QJjvuE8Y
	uOt11Uf12JF05v6YYeD6aVOSztnA5kfqKkJeLKr5XgeXp+6qy6Cm9MIfbMgHKtDyCQj+EeDtAoJsl
	k+RNxXzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFGj-0000000BWiz-0pS2;
	Tue, 06 May 2025 10:11:21 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEHU-0000000BHQG-2z5i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:08:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbpsO8dwez1yw5Y3tMFmKQAgEG/moIpxW1sAtHj8dcMRffznLLp989XAmZTrUC+5hhMxJkS+ZGeax7hq6NAUXSn362lysUE5ZmoElUB2UoJWLjzN9FStNu4O8Iuna2h/8JLxsS/wiVS7lJury/DS7a7U+XEgZ03nM1acb7dDUklK6SGsKIMfDm4EXtB4ItAzrCqHtDZLoUXlM7uiNN/s6Qse46XCc3W2CaQypRGSDbIBRb3wnAMTz8qkQDTqcXuL6DtMP/9/NokCBDqGVOYhUO55oHwmFSE8bjmoN2Yt6rli/ku8Ee/I8mijKNWqPY6I8oMAhssdgLY7r0hADwF2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrrlBKeOi+KDfQQXyjr5Yzguwm4KMkMUiC1P6pGVHDw=;
 b=RvoeaWrbfA9rB3O1YrFwojUjQac2xht4wCar9NMExaYAo3EmW71vWhsrGcLxP8/RCP76jNbLd6gn5ja0S+qT2Cu4aIYxw28JtyQeN/kd1xqtCRILF/yEtiXIO8B+2mVUNeWbjoS5fTHhfkaUO4zF/N2enswUbFZ9rpDKhaauqtBV1UsJQxDJj9xw+uQZ9a+mJ0+Co7A7ig7gd+sE3f6uE+djnn02Qoqq4bqbADXZphFeivwlsqmZzPdoq0f3A2gaYYMDeumMReOJtbkoEzl5a7AldOv2ISeSaV82W5r1ZFWNKcwGNb690ccClBT0t2vg71gY7irbCsDaGSStJ9ii/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::34) by TYSPR06MB6434.apcprd06.prod.outlook.com
 (2603:1096:400:47f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 6 May
 2025 09:07:54 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:300:58:cafe::92) by PS2PR01CA0046.outlook.office365.com
 (2603:1096:300:58::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.43 via Frontend Transport; Tue,
 6 May 2025 09:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 09:07:53 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5D8C44160CA4;
	Tue,  6 May 2025 17:07:52 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	kajetan.puchalski@arm.com,
	sudeep.holla@arm.com,
	eballetb@redhat.com,
	Fugang Duan <fugang.duan@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v7 3/9] arm64: Kconfig: add ARCH_CIX for cix silicons
Date: Tue,  6 May 2025 17:07:46 +0800
Message-Id: <20250506090752.3695666-4-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506090752.3695666-1-peter.chen@cixtech.com>
References: <20250506090752.3695666-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|TYSPR06MB6434:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4a1a12c6-3774-4f06-d28a-08dd8c7d7c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7QCnG61OaicgHk7sRhH3gsTNhvJ4UB/EbrzsyMdHZYtEGiNt98cChPWBs5RF?=
 =?us-ascii?Q?TEgg1/83ODufTTVLmdLzRqXZ5VfUX40Qy1O+8yPihnoV+c5TeGYEflCw/XN8?=
 =?us-ascii?Q?i3p489jBGyXDIs1HMD8ENM4eaYPGr2ql7DHUe2nLH9BEcBUc7iYLrm/ht/25?=
 =?us-ascii?Q?KjOUMUJtBOCl89wfm4AF41mNaLhwPBpMZap2ao9q1P72vcyiROzEPpiejfrM?=
 =?us-ascii?Q?h7LIFt1Zo8lRT9MNka7hfMZRDAlRVELthYNm1RQaedoF7EH4hM5vO9zsuBX5?=
 =?us-ascii?Q?0gfrQn3iOqdtNklBWsV4p9UqjmCBbyX/d6Mz1FBr/0wYboZMu5g5P3/eqDZ0?=
 =?us-ascii?Q?8yqMjbIY2Nc+fMWdv9Wz7mkXPnbU8fGvIctKvSmlmmXv3wbNx5rB1KwsFfcr?=
 =?us-ascii?Q?EmalES3Oc0bSd0f9x1Y+lOmzaN/zpxwB+Bek/j17i4Q8E6g3JCk36G2L9Te9?=
 =?us-ascii?Q?NP9u9MpK4KjLVWqsEXMKlDGC3eEDEO9dKgmi07qvKvt0YdvuVjMJji+Oz8+c?=
 =?us-ascii?Q?zlMltKr/yqgna1vSpy5azKSu2bAc5AKhMuu4DIwVz+ASp+AfRAL85EgeeKaR?=
 =?us-ascii?Q?lT3ANuTUbRy7sTaWqjtKH8cJXRLPdJbJjG/me8P7Ik9g/aXduxo8Q58BRGas?=
 =?us-ascii?Q?LJBl3XCZGq//TmjMz6JVIaDNpOzOLYsAWjETQLxYhR7EU07QA6n3FxJeqfDl?=
 =?us-ascii?Q?ImmsT2OLaIJoHmtNUtT14caGVhfQDbXXMLsoiSu+QNdHuV6EbH+UG6vpl13H?=
 =?us-ascii?Q?EZ4mxXPVrRyUjRWrrfH2SsKusZDSi8J77qfD8FMGcAUkqeqY5wdpRqVu20qq?=
 =?us-ascii?Q?KAPCXIUst90G3cH/qAAHDs86+B68D1cvQEMhO/i/qh3URsN2tLeTV0/om+rb?=
 =?us-ascii?Q?B0Cl0ZMISpZ5cMNCI6o5IicS9UF5f1s8GY2i8LWj/Z+jFAPzQMyUOCHhTh1j?=
 =?us-ascii?Q?bFGFLgtskkm1SPfht6Vo/25I/1C3nQw3vTNoeM8YzJ3PlM5t3VaPQz1zJc5a?=
 =?us-ascii?Q?UwnXxHwZWZMTpwud2/izbBvZ9DjA5mkNUOsqN7sTy0Y+K2/ZMIZRdxm3kglP?=
 =?us-ascii?Q?BTu6upIli4NkAWhPUiIaDb8wztCl9gAykfTk5UcTng7cirmul+c1yOBrDABm?=
 =?us-ascii?Q?VviCASsoyWwJZqsX5yKD7Iw+pPEvlwlRQhlXGefpLZh9tUxiZxDfo8Pb+cL3?=
 =?us-ascii?Q?s26EBDP6uPLXjnixQh8vd0p26WDwRKv1a/xV/8GqFlucPgVCulDmW0I27sh5?=
 =?us-ascii?Q?IJfvOoMPuxKpQylftsjP8xR3qBR4tWL1ldn0IJNuhO1Pgu4l2g442za0J8+Z?=
 =?us-ascii?Q?bxFFmK/3MQxie3gfrBWwTSFS67jDD86M/0wiwFGNxinVE4qRbVWS2+2Y0j/z?=
 =?us-ascii?Q?cAhz6QjWanArlhUgi3xuBV3ULWuwusgrn2EiN7PGc8Hzgj8CNn6av6PY9fQs?=
 =?us-ascii?Q?W5RO4FxYZV91ASwYI9OL1HBT2CwERj5zanpLU1/p59RGYVbOjPzxQENJ9YJZ?=
 =?us-ascii?Q?NM9+Cp0ioJ7o+NEyz7xZiSgeLyxH3bx4FZsu?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:07:53.3474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1a12c6-3774-4f06-d28a-08dd8c7d7c04
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6434
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020804_749155_354B250D 
X-CRM114-Status: UNSURE (   8.16  )
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


