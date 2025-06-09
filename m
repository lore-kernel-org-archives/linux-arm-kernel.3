Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180A7C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 03:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HSPnFyNF0e12CZ8RP3toYIZDO1PR9IFpUTBypYhYBs=; b=vxINo8LtoV8WwI27dooDwpMALF
	r/l9gkLUXbHDwsyLij7r8QBKRx/1x0NJ2/ZTMH4XXyNsvLcc9vYriwWiXc1vJnjkmiqzAY706Nw/p
	XLUzh5dT0tHBt6KVhUIMTBHiyjFAQ2eiXfp72LMMKJaKEdkOEwOvhi1jLp1ppzzeMXGAl34rn4LCH
	w4XLMC0t6R68DjlngIlSUifpWg2k5cKXGnDjWLEGy6vyrO/Yv9gyN/PgemnxUJukIniTlcG65KJ6/
	5kvYi+4N75b6Q0K8Fc3Jlvb3VyYtBGH6LLbjOgtHpK2Arst103xXZZL5fhDiDQp+mYI0ZYTJ3Gxyn
	bP9OIJcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOT4e-00000003KtA-3YAc;
	Mon, 09 Jun 2025 03:21:24 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOT04-00000003KCr-0ufx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 03:16:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIoQ9/kbcukcvZpMC9I8wAZfbI4aL3bk9jfV34E1bhCLxPvcRcfXnh3ED6B6qFfge94HaOPJ7DRzlx3dyAJeEdKjjEPRLyaIu96zU19RcN/sfBY1Dmj3WyhyIFuIdKKHYNxx4QpClYlxn+TALRUw83oe0S87sxNCC+p7c1+C229wY+A8UhK0NSJ8mQL4q+RNM0+i/5GS43icNS5gd7JWKFXy5TcO4o1sIwTos5hiJKmNpkQhNFvxRAH0z5M2pqAcwUTfwPBtXEQBC2jJIXbnPaoz9tVvcm+CIDx42R9ULjvG/wcsfM1/WY06KJENrfOcYC0/T174hbE1H4i9KD3PuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HSPnFyNF0e12CZ8RP3toYIZDO1PR9IFpUTBypYhYBs=;
 b=KGPactS3TsdgtFoghfB2O9lh8MSd6d8B5ojX46VZ5iS6cLpYGGy8iPRr3ctu/H8Np3B3OCMtfZ7t/iQpxa/I9WA3KxcaS/vF1QNp4m6eQGs6zycVmBYys2eGDY5aKCpKjgdydfRqC88D/IOUDN/lQSUALW1ALLBOk7rKRRxDVoiQuYEclwiG19MFfp95/ZUe0P4BtS8K0IvgUgw+28rU4mqBom2BrwIKooQ7EalPpSXRBTiC8NFTGZT7tIaS00xOjkYTa8n5FvjOeUnlEGiT/hKXRK8+X6tcig5iL8jKxfPSZSsNCEEoh6jL298lLY3C4FtGViWljpBni9P4vvkR5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR04CA0190.apcprd04.prod.outlook.com (2603:1096:4:14::28) by
 KL1PR06MB6162.apcprd06.prod.outlook.com (2603:1096:820:d3::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.29; Mon, 9 Jun 2025 03:16:29 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:14:cafe::8a) by SG2PR04CA0190.outlook.office365.com
 (2603:1096:4:14::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 03:16:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 03:16:28 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 9EB894160CA6;
	Mon,  9 Jun 2025 11:16:27 +0800 (CST)
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
Subject: [PATCH v9 3/9] arm64: Kconfig: add ARCH_CIX for cix silicons
Date: Mon,  9 Jun 2025 11:16:21 +0800
Message-Id: <20250609031627.1605851-4-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250609031627.1605851-1-peter.chen@cixtech.com>
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|KL1PR06MB6162:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f9c90984-1116-4b00-201c-08dda704064d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fRGcFwMVspz69qNKvTZ+afUWGnnmEUtPW3J1M7vxdi14WhEmkmW5UjL+2GLL?=
 =?us-ascii?Q?y/bU6KpjWvYwLZc1ucg5kvzdpfR6Y1RFz88DjFFc4MbbetOPCITnn8SuFcDG?=
 =?us-ascii?Q?cxx6Y+k55Zu6sGWh3zgGhY4fIbMCi+YcalqD//zaUcSLfTwsVwP+ds5Q1JR3?=
 =?us-ascii?Q?VUU3Ol4pMFkCKdwGK/7j8S0iqAVsivQRRNSoI9e/uRD7LvfDjpeUzuqXI8D8?=
 =?us-ascii?Q?jQULD2knsswtdzama2ewxRJHDQYBvKE5nnefW5qR2psDkgvWoVD/MgwCdRuk?=
 =?us-ascii?Q?knEMTF+xPlRmfVNpQGO6TQLF1KGwUPHzJ66Ia2X5tc/Q+7acqE2jary1g1Gz?=
 =?us-ascii?Q?k372yXZPg+a+kWezufZ10b6FbTtf+loEz3e8uMiP8Jq9mmFZNHOY8w7QdAP7?=
 =?us-ascii?Q?86+E9QlbzvPgpJMRuJxzR9AfNIFBJjI9s8sS6ZPJrVSQpOe5vHqAZ7skC5en?=
 =?us-ascii?Q?n1yGgWfr8DunholAYTzZ9qKYcWNu3ibRPmLTJVjXkVfO2SkS04H9Cf0mjVlJ?=
 =?us-ascii?Q?DDMYP0D4LSvB9e0ZswVb2fsMqSOlzcuaY6iH4g6E3FfolbEmilWF2Shkiu4B?=
 =?us-ascii?Q?Emx7r6cd60HY+HIz0chjPVTqMsyB5/tGOyjjJg9/Qe2bm5AuclYUZGZ6rTxg?=
 =?us-ascii?Q?0oBF3yrwX95hAR9vdGo2zHisW0cXnnPvsPJd8QmUdFrh7zm02NOUeMlIXfTZ?=
 =?us-ascii?Q?0nVBhX6c8vYqOftFtMxuoQmCAao7D8vReb9V1IIRi61njv6l0xGFho5f7btD?=
 =?us-ascii?Q?6jqGvps94irT6Iwq2gFJxD0ZH3Af4ETqBl/p+ZU5GDr43N7t23dcjEGk9P77?=
 =?us-ascii?Q?Iv6PfdhkVR8TjzmsMoD0slqo64o3qxLENgltxfJAqQnne8G38SxYIcHJvUW/?=
 =?us-ascii?Q?JSHYD6KWdtUxybPbwLEKph2/3Ao5pXVTHL1EJ08wHTH2Spp0vZDj+db0NcZ8?=
 =?us-ascii?Q?99CB1Ibj+uizQkvK8xeyoJhtDo1mC0tYvMszUOZxUd4lLhUx3YZ5DYGd2fER?=
 =?us-ascii?Q?4n77Pr4q72OV1W4s08/ArAhNJ0HjKVSGSq3STT4OplyWmCOscrvRj6sDibLX?=
 =?us-ascii?Q?934zuhtgjJGdU0SJQGk9MHy5+nrW+RLGw2BEfB8gNlYUZ/R/79TjyyX6zMMv?=
 =?us-ascii?Q?VgdxBXoSSCYL75g5TmR3EJ3EjuhlpfhU7ZiDAwpDkh95cqdZcWQDiBK3KEI8?=
 =?us-ascii?Q?3UsgLFqytz8E1KsxOhZ7UiWrCDVWeFQI7cu0tjfIp5WJLXSi0YzCa18MU/7R?=
 =?us-ascii?Q?tMzTECB2flCwr3YepF0UYFWR5J+AixvXebO0J9swRtJ5AKLRmK8dsmqTVAgd?=
 =?us-ascii?Q?BSlhKFBsmZC49Yp8lu+0pFuge0GiA4x8J7WEmcdQ985CPWhZABExyqM0M17a?=
 =?us-ascii?Q?HkoacGenKVN2W4W0rRqN23vqtBHkkvwgMh0Kdq+7YXrKSi4b40C2UqMrERCg?=
 =?us-ascii?Q?WB5YnZfQb1XRItME21SKNHZEXojTXqGJWG8OFEGzwO9Pwbu2A36JND0t08tx?=
 =?us-ascii?Q?DMIqibuvgE8ybC0OQ2r2FAhtp85ZX2OXD8ho?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 03:16:28.2169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c90984-1116-4b00-201c-08dda704064d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_201640_260782_0233CA7D 
X-CRM114-Status: UNSURE (   8.23  )
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


