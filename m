Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEB0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 17:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HSPnFyNF0e12CZ8RP3toYIZDO1PR9IFpUTBypYhYBs=; b=C/5trZytTR3S/tQgpIRBJTzoCT
	2C2zO64rYos1HQ/+nsZurWve2JoFTLSpPzkxK9eMWOx91SbmplQWTwWigYuqL5CuJRysTvtqk7J9W
	baW8hRoMU/TckEu2v/pW+T9ZA8Qb70WZHzXEi544X991YLzD4xAW2Phf7BPaoRr5ZkSQWjbl9pw4F
	+qWf/m8WTCEAxXl1PL2nlHvo8JtG2MkUN2DYC+F9nhm0rMu2DYh4d8T1B/DG5keXHDhYHYewoKR1+
	T7iYB05RvID0JkBzifPvY/9p0SL02b0IEJaa19OD49EAHGdvj/LVJpK0kIRDD1ggIJSh0kPcV47l/
	Qq5lFFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udu32-00000000HcQ-0hFt;
	Mon, 21 Jul 2025 17:11:32 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrle-0000000HZzF-3Nr7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:45:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wucNP63WTjfYFMyb6B2/bZh3Aain5kbxTcqVVRtmP0w+sHKN1xhVqx4HcXJC7omw99XBqi8BZnL7AQqd1r6BzoZWxm/rGsZWBgOz+68wRrCuYI0GR0BzzpYJUl+Y3AA2R6lhV1TDbtxFFwQFvDQH4oM05BJr69ZJ347l3xF9O1OOrsI3isxxvFpcVg6ouVf1nnkds3GOcnWv3rlD2vR5pU6e8/7NPpap4zLjwedpoWWuoY3o/1clpEFWkhAjS8ymIXKa/Oh7iodEorM7Ng7oDMTDCXcocC56FY8t0kmQWgR1KFi8+ShrTfZhpYfGokzbzAs54CSuzJgsgXIOrgMVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HSPnFyNF0e12CZ8RP3toYIZDO1PR9IFpUTBypYhYBs=;
 b=jrwbaaqhd+1YSeFdvygJ+4G70AdNhQnVaMjQ70AMtGZgtcw1kT6jvktfy8JwnelX7H3NKjF3rIXV5qA4cyGsiyR0ZyG0o3XQLrIf114auzd/RPa9cPO2569n0fvnQKyfYffwk+V3b0O73SVX1+YYYWDXag9dYQHTLn8uHqEpCFjQ/quWK4cOuwwnE0NIeg3xbKm9O4NbZg8FU/m9SXf4LcFDPTQdZi8HLYKMBhh2WUoTqmaejdC12Se7rqKUGQuFeAB7KUKmd7zCCJ8rl+rpl+iMEEfzMfMWbVB+i1u5HHsrSDOptbiER3IKve/4qizPT3EfF9tsLRdBWMbv23Zvrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) by JH0PR06MB6704.apcprd06.prod.outlook.com
 (2603:1096:990:37::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Mon, 21 Jul
 2025 14:45:07 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:4:193:cafe::2e) by SI2PR01CA0042.outlook.office365.com
 (2603:1096:4:193::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 14:44:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Mon, 21 Jul 2025 14:45:06 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 91126416050D;
	Mon, 21 Jul 2025 22:45:00 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@lists.linux.dev,
	robh@kernel.org,
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
Subject: [PATCH v11 3/9] arm64: Kconfig: add ARCH_CIX for cix silicons
Date: Mon, 21 Jul 2025 22:44:54 +0800
Message-Id: <20250721144500.302202-4-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721144500.302202-1-peter.chen@cixtech.com>
References: <20250721144500.302202-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|JH0PR06MB6704:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1c0f9c63-8896-4824-f93a-08ddc8652f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cKBKS6JK8psW/W5zBDxyHGY0eDT+DwkB4GnUH4AtTDUctffb+QVtex2H2/QF?=
 =?us-ascii?Q?MuuLZbN4zwoOq3hyloTztc0eTanrAFhF8qzLZ35TIc83aCzKQ+F4z5NH7fn1?=
 =?us-ascii?Q?qayXO2j6Ug48sy+jOa48z/IF7u7EF7BTPqS8UCNx08hfTc9gujgjfwqh7R0I?=
 =?us-ascii?Q?pAdrZcWSlkRuiIiFPrZyMdgHFF6yJlACYmmdI8RR5HFW8/m5vVcwvkri+cbD?=
 =?us-ascii?Q?JyeDg/auewTGo/1AQkdg0HodaK54v5WQY64bzRyfaCXbxuypgLfmT/De+Y4B?=
 =?us-ascii?Q?7+w1QXIa3W2My2no9RlWTYb+ykYIF8PoCiR+fUsZRly2GiSK6UrI6XO5Zhxz?=
 =?us-ascii?Q?aG5Z21huR5SObxMRHD1TqPBFjuF2zD1kLGbWaHWK4b1HX+wLgHOAUzLAzQvm?=
 =?us-ascii?Q?ZGm8FDWoNGZF02OyKanyBhTVMBw0CZmQzDRCN0JGrcPE4qHWcQ2HEVrlAyDG?=
 =?us-ascii?Q?h/8FnJmpGpZTW9cRg88TQ7YsAylhe+NYuvQstvwU1UReW5jSXSCW+WzSU8Hd?=
 =?us-ascii?Q?bax8KRErZjKLqbMN2rM1y8tUHZTNGonWcVpDroI1374uCN2cAYnEoeI0DIE0?=
 =?us-ascii?Q?TJIB7fcElo1TD3xdHrvKNNgWU3vZ9/CL1mvBEU1vHgcHNNDa5MTRPDodIlGK?=
 =?us-ascii?Q?rrtGDmVp7t+efn1ScZgHu++kyQ2+kzHg1RGueeXFy4vnSgCGA0WyzMuFQQxd?=
 =?us-ascii?Q?gne84mfzGouA7tmb8Iz2jh+XFA8+gnlXU0Bj5tVwp60GClCYrdKVtcpTzUj1?=
 =?us-ascii?Q?N0pn+oCqo1QV7c5o1uQW/g+GfI6bTtkP40aS4Zp1BiPyUD3yVSBdcXdg4MEU?=
 =?us-ascii?Q?u4Ak2X5dHt0YS0DmEz9aZqMTRDRKgrAb3Q1IL5Ww8q9YCQpm7tZSGRxPTbD5?=
 =?us-ascii?Q?W5JwIQCqjjJtjdbyBamTxGvm9JhlPOWGxVkrEfJbAjvzjKNA+OOJeMpNUVW7?=
 =?us-ascii?Q?+v95tx+TTleUhyhQPxMwC7/Q4TpxWI0jCfESpnMD53e+zT9JNmksDSDhq69P?=
 =?us-ascii?Q?bG4pfs4VMTrUM1urX3f56GrsruNw/J6gbEYgHOoYZhOAufLHTmZH4AfFiE16?=
 =?us-ascii?Q?fYJM/t6n9mRVNW0N005QKS1bLVPtVl7sTgTYJlJl4XsF36G2jqXhTVcIf7kN?=
 =?us-ascii?Q?WIBke8fncUA82hRtbIBj3wkmYDQzcBtwOyIYQii2vNHYZOFkV+EXmpFhSOtF?=
 =?us-ascii?Q?HrG0FsvhtdBX3Azc3PgFBQ/YYtskzRy1kNFrvlFIibLJp1YECP7gU+flJeti?=
 =?us-ascii?Q?P4oMKAjAxCAgtwyGaqUJZj62oYBI7WPvNrWvhaViX9Ub2uoqFUutNMyMHvTq?=
 =?us-ascii?Q?lU1Wek0vcDK6Yy4NjVGS1X2KnVKhaYterH2d3mk0LB/DOd0PlurUUFEv60s6?=
 =?us-ascii?Q?AIKVa+n8/cn6hJv3M58wuvjDftutkfOWC1/Qjaa02Q20lFyCW5TsriG8M5X/?=
 =?us-ascii?Q?Mh8WmnJVDAf6GZ8f6js/RaoH2IIUJ2pdfEuNsyD8qMZMjj9fxfxLwtLvD2Te?=
 =?us-ascii?Q?JhkN2e9ItLzgSGSAgJrhFGt1ulf7gAg6m+y0?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 14:45:06.3895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0f9c63-8896-4824-f93a-08ddc8652f32
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6704
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_074526_845705_9044A474 
X-CRM114-Status: UNSURE (   8.76  )
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
index a541bb029aa4..5eda66aea359 100644
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


