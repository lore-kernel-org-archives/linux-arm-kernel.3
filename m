Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94465C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUFTUT3/CBZvRAZsWCjWlgKOPMjfxsDC/fmchbjVn2I=; b=IC7AyXqDsJaryeY30SXib3PBP2
	9tA92wqK5wLKIqAkZby/qcCAKG7N0YEFULcUa9on7KF01ejzQvqwGjTc0WIrBpUd5mb9FUIm6QSD8
	mttL4l7WoAPKXpGIQWQYy8igwkU//HYymsjNX6KST5rdV+mxYL9n8kn/3TAiKYP7DYhmnIa3BFrCW
	yzV7+ZqFXd44A+ERh5n2SnxrK3UaY08vNFZgVzD1qyaLtpVBeAih/HLy5i2XPXTg82mW00OAET8aW
	YQ6RgnMBjf8MsDWMjzSFslRijx2UMnqFk9CQcH/roDEvpkBFRxnDDRduXV5yni+CLXaPIldFxi3eR
	wbxiTW+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd3x-00000007NSe-2AyZ;
	Thu, 27 Feb 2025 12:32:25 +0000
Received: from mail-sg2apc01on20719.outbound.protection.outlook.com ([2a01:111:f403:200f::719] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncew-00000007I4S-0BhL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:06:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbbnLCjtnlLbCR1WnwEv+GQpMbdacRQTRhoew7ohBg84S45hKJzHI/4nJKKTTYKjbcHqqtte5J9VUP8V+Zb5PynbZVBPca3C5zm8JU82RK0k1Sg2VUdjks2xHn6p+ad8vawlFKZBgwUN6PqBP4C1eafwe39sHVCKtdR9w9ZFr/lKtqP6G+HmTSlHSELmFMNy/V477Ts3HbR7OkiO3MmM2Q1gHh7Egdqj/la59U5NWP9uQQGKDgtSe/8qtemSCyCEZZnJfxGxdOiUjivYmDHhWwu9T3NwOqiPQ1MNxgZoi36v9kYOqOTyhqakqy0K1Y6ie0ZbNP2psKuTPPIjxLp9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUFTUT3/CBZvRAZsWCjWlgKOPMjfxsDC/fmchbjVn2I=;
 b=IUiPCI/tpVUuYhvi33f1+CDpVlq2pj70fJR24Miz2EbveUAL9+yf77ej9kv3pyS124C8Q09pkiTmxDJ5rxoNj2UoxFgD85cRInRao9iGIWoBiTSeduAjrIYZlm4+7LrVf89+sqHI6TPhNcbnyUS+VVCLnCrAwmWqx6WiEJCxjWvhOQhAhDLhr68+YrqAnPx/JH7yKkBv/DJtiJJRww7oMsbtvK3xunYyob35u5+UtqYTXgVHzAu1wU3ODHDVlhQB2gsQyrjonDX+MSZoRfKSqlmn3yssUAbw64hMhRb3bFPmvbiqG92YXkciGsGG8xvQ7q9zBwsvhEuB+jbm8EXvdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0017.apcprd02.prod.outlook.com (2603:1096:4:194::17)
 by SEYPR06MB6081.apcprd06.prod.outlook.com (2603:1096:101:d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Thu, 27 Feb
 2025 12:06:21 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:194:cafe::41) by SI2PR02CA0017.outlook.office365.com
 (2603:1096:4:194::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.19 via Frontend Transport; Thu,
 27 Feb 2025 12:06:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 12:06:20 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D3E064160505;
	Thu, 27 Feb 2025 20:06:19 +0800 (CST)
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
	marcin@juszkiewicz.com.pl,
	Fugang Duan <fugang.duan@cixtech.com>,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v3 4/6] arm64: Kconfig: add ARCH_CIX for cix silicons
Date: Thu, 27 Feb 2025 20:06:17 +0800
Message-Id: <20250227120619.1741431-5-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227120619.1741431-1-peter.chen@cixtech.com>
References: <20250227120619.1741431-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|SEYPR06MB6081:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d1e54fa4-2954-454c-3a42-08dd572725df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pIidTwMoLRwvkJoB+VzCggMOWVl/PU6zvw6JH9U1Z4St3Eo349hNtu4AWPfJ?=
 =?us-ascii?Q?0NZrsNBwHLpDy4ja3wlSJJ8P8x4eOjrYOR8aFwHIFjI1Yq2WHp45sBR9rZL8?=
 =?us-ascii?Q?cvRj/d8qfz33DHBPYqxdaVd60tudBiR2XbLSiyX5K4O//U+k/xuku75gIu6j?=
 =?us-ascii?Q?dpBIMGqxPqHuMB3aQTOuc3dH73XwVR06zvANBD6C/FOlvnuyQ/3kncgUd3eG?=
 =?us-ascii?Q?ANrOx21CdB7uIa/8WUZIvje74BIxJz17uGD3ROe1abQ/x9Q7ote8O9EzVhvu?=
 =?us-ascii?Q?Vlf3voQJPtMeE11UB11kM+EmsjsISWBRJzYkJ9S4iWV3m0Juz4YwKYtbwVOB?=
 =?us-ascii?Q?dI60HPlmnmM+DZBEaYhjjiAS0/FNP0TToky0D7VYNEgTRRGxu5qNndGehvfV?=
 =?us-ascii?Q?RLQn6v79d0Ol9PmrS1mtyC/2jcW8tpwQD9mcuusKP+4d0fD8yV/DWvR9kDGI?=
 =?us-ascii?Q?agBfrghCzK6id+1mmBONYaeXI42sdxlD6pJLpWDNwczR+GD2cetWd7DHdvJS?=
 =?us-ascii?Q?3sh54XN9dJxX1nN70EBxR8+zrXdxI3PoEQ+NZtS9jhw2ig18RQipbfc+AuuR?=
 =?us-ascii?Q?1jOml5vHvo8CCmoYRttklPvih/XgEaw/AJoBu9WmHvcMLzEfQEuIqz18UpOu?=
 =?us-ascii?Q?LYeklcstCwpY4z4zpfuxrr2VdvqTz+HmZKl5JWUBOTdSmvb8OfkAU4pfy22I?=
 =?us-ascii?Q?9c3NjGRHbj0TVwTYjXs5J5cgAgp6iHBArGlRnGKzIHg6+yhcJspOi9wNqW9f?=
 =?us-ascii?Q?vsEQmvE6uGZXZPCAhXdjMbBlsLztbjrfBi9i7IPk6ny1lzy/ima7laOqFYmv?=
 =?us-ascii?Q?bE/Z7QZchwSPgzqNk3VlI7JsqiHcjOTlhjqjLMSIySvTH8yFDyhACW+dxJ+K?=
 =?us-ascii?Q?9IPfoiJADCSEyAKHPIQE0hcY1fHzw5LRXjNevYS6spawAZcQWNi90ejiaQgO?=
 =?us-ascii?Q?ZRXozC6Wyi6koqKVUo5ah6GdPbvK3G70yJlBk2oQMuFdGaChWgL/l353WmkM?=
 =?us-ascii?Q?Rr0kbYPBJDGGu4XQN+JCeBfylJp2n0Ck7zdr09KO2YVZxV0c02NgfA5ZoAEH?=
 =?us-ascii?Q?qoEoI/m1b2PbiJCrxoKHjCCjlPcHSfViGhtfPBEohRdVcn/SL5gwC6yF5XYw?=
 =?us-ascii?Q?iGS8cj8WFfbWdpUN2OFp4xAk4VXTFGlK2Yto2He/2cVbuCs8dN0ufrUIEePv?=
 =?us-ascii?Q?gn/vIEPmtE1M2KwIfQDQ4ckylP3XV6Nn8riieCgvd/HAzQJFuR1FwqObrulB?=
 =?us-ascii?Q?EJDb9WrF37m3yunyQt80fyMsNwmE7JE5hVikZCb5gqoao1KxKvhcDBtuNW0g?=
 =?us-ascii?Q?yu/jxfjn6d+XXBj5NCIG0lrFw6ipqk7pPv2MC3Ge3MAC0KeCjTFb4hZPmzss?=
 =?us-ascii?Q?IzzzeFyHvJuLZs9ZlIRpPShgIXgn3byR+BO9bAeciNQRJ7q6V5cFzRpQD/v1?=
 =?us-ascii?Q?21A43hOIjI/XUFJMRFphfJmJlUgOcq9C40y67RFrITf4AbwK2ySmcg=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 12:06:20.5487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e54fa4-2954-454c-3a42-08dd572725df
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_040634_090791_08603455 
X-CRM114-Status: UNSURE (   8.11  )
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

Signed-off-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02f9248f7c84..abe41db9b9b3 100644
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


