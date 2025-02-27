Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A898DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGiA0nF03m+7W9cKWzEde0qOi9yDrNOC9kXM4vt9O+g=; b=xFKAJI+91QuHcJDWmkncaStgzJ
	mm4uahkJ9NwB6r3EOEaW7ktUpMOIE8W7UKikcDQTBp3acAgtZkHrfHPEADKKNQ/6hTW3UGmRUYfKY
	njoIQi+mfcv6sEsim8m9IxdYQQObC4BVhd2lQrNk7FpN7t+ArZ1bj4za72aVN+7Nncm/DbPEGPAYL
	zf7ejjXBXPCxKrfFlFnoFivjf7pKzKt/QbGKI5TGwZPK8vXbZ98pG+Z+4ADZer/s0+gxP7q0DgGVA
	/c5pbIOWfEKAASRIVZpjceCcpTB/YhJL5e8cVqF3z5tsGPIv2yFSyzxxNo4Q/TYd9Y+wrqjeA1syI
	slCpWgxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd0w-00000007N5n-0sTr;
	Thu, 27 Feb 2025 12:29:18 +0000
Received: from mail-tyzapc01on20714.outbound.protection.outlook.com ([2a01:111:f403:2011::714] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncev-00000007I4T-2UGi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:06:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmArAxoDyQUj1CFEP4O61ofK2bbgISFlgJVTDEES63AVK5BdF4fUVHAbbu8dVsOFOoE38+4YCiVYrJaJUcbwmGpC/BE3vTTtaMfTHA0TVkIWQEiZcRBL+628RiI3fbY3FLYbmDY/HKKkrAITlqYs2a20A7JoR9tg1fx2FYqCBlxGaIlaesSSdL8MmoSae3GkIe0OrTTgiy356DW1s3EoDgGMflS/y9ozwHWSgqFNJ1FkpQ63PSRxVTGSY7xTRGMMsYUAUwToIdZSmCQf9chTYY0YXQwm6ZsiZMghuLW+K8QvsCqpLDqbeKuEo7Ir5bJ0OJL7bf017ECrTKb//neoUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGiA0nF03m+7W9cKWzEde0qOi9yDrNOC9kXM4vt9O+g=;
 b=IBXsmoleuSHxounjmUYNkDWP92fNPl2rBIaXTIKLvQDIRubgQkmoZlWA//yUZNCksEeW9p9vxCPVV6yWxrri3QhCv5XtUZQMh03as0O+ILSDPvhtpBeKSNnKxhR/0LUbQNkftwAaqNX9O1WrhB7WJ/jyuSbWIlaL7tJDr2V+U6oXl6gvRyZh/0El9MRJLWORcELpkxmPLXjks1HvBoj4o0OmR9fC28JUR4KkX7g1mWnRgQUaOXTqUTCZGQlc00zxAKZ1qUReM4192i9OLu05nIJU4uibHlTf/eeM2aykQeKQMXGEI00xfqucnQ+ZIieZqmF/IMPK+Soruu5sVb1Fzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0004.apcprd02.prod.outlook.com (2603:1096:4:194::14)
 by TYSPR06MB6471.apcprd06.prod.outlook.com (2603:1096:400:480::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Thu, 27 Feb
 2025 12:06:23 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:194:cafe::24) by SI2PR02CA0004.outlook.office365.com
 (2603:1096:4:194::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.19 via Frontend Transport; Thu,
 27 Feb 2025 12:06:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 12:06:22 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E4598416050A;
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
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v3 5/6] arm64: defconfig: Enable CIX SoC
Date: Thu, 27 Feb 2025 20:06:18 +0800
Message-Id: <20250227120619.1741431-6-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227120619.1741431-1-peter.chen@cixtech.com>
References: <20250227120619.1741431-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TYSPR06MB6471:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bd342c76-6b16-43f2-ddef-08dd57272725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yIv/rmGtMEN+qldWtx6TYZKv0tC4JRxx33LYyekWAUUrayKjaqXRnT/2zN0v?=
 =?us-ascii?Q?K7eL8YRRtFNFFea5Wik1YemtQg+x6jGiSWfRkA8AaILv1DuYbZzUN3ibMUFY?=
 =?us-ascii?Q?ZYN3KjGUJLnOzXMCcXptDZ8h2VcrRiciLrzgvru36QXgRyAEwnobmWDTir/J?=
 =?us-ascii?Q?VEvKHWHdl5yMMiDhxX4oSP5P6gk8+rMCw83hPMAIynv/3FMufJKW1c5MIHdo?=
 =?us-ascii?Q?zDEkRac/j9+eXEew0RHKqD81vvN3m836rCDh0PNwuJ8az1Vg5nueiZOqOxLz?=
 =?us-ascii?Q?Y5OE+ccoJEeuDlawFdlZ7nDwHsMz6heA+81ipPu61aot9/ikPG5ZUAoEDFUK?=
 =?us-ascii?Q?/FTGGqWO4fYbfgHYqOMjc7vz8czcFtBUusMK4zv8WvAvy9lJtDpNK/tUBimB?=
 =?us-ascii?Q?9+d++CG2haaJc+nK1CS4Ql2K0Ydrc5YlPbZ+yqVqDs4rRXnB718TaQRGL1Aq?=
 =?us-ascii?Q?4T+mQ2lXVspLiJxnif2JUN0MR4+6g6hDdDq11pnEvrLnMNEQ30WDoJVGm9xA?=
 =?us-ascii?Q?S/n46lomiuxm5t9ud0691uFFhvOSc6SaksdVg8dIhMa3BoCNcME0i+W7byel?=
 =?us-ascii?Q?/KCCdUT+QzhcBU/iMr53fR0uZKGmjZeNDb33WUfpR8St285HbUymDt+Zl8Hy?=
 =?us-ascii?Q?XC0yB1uT3JN/gm1v1iGKxEpfv5R3/fYdXuWSyD7sXNwVBH8qVWbVqd+zEK73?=
 =?us-ascii?Q?QpRJV0/exmYDzy9oKIKU1QkopGStKH0jAzEMVUoJdY36ZUi5oFmialG6PbMP?=
 =?us-ascii?Q?paIkC1vYiO+7dW9xv5OcEZw1wuRA6VpPWvfTawq5vPt3D9KL085a7JCfhxNy?=
 =?us-ascii?Q?qyHGsMpUs0ZKgxg3GTH7klNCPQm0SDIjML847RT4ai99D9Cwl0Dtm3uFqqnt?=
 =?us-ascii?Q?dZOGdUFkaaOJ6JqJAkADivDfmTCcFtRfCiLkTwu9JmZaojSs8oyPs7V/6A1r?=
 =?us-ascii?Q?rRYsNMHLWFvXc62svwUzmohTGQv2a4tNkh+F6yT4h3EWLddLTsnZksSqa1FN?=
 =?us-ascii?Q?mvSuGp8pSs4kn7DNzVpSu8WrlBAEahx6Q9MKwzQhznOAQztBrOiPPR08xnNs?=
 =?us-ascii?Q?j0lodbRSHDdn2JTuWmBRZ3s5f28wTr/p5bvSuHXJCrMtRdvJP80ssYSF7nJ+?=
 =?us-ascii?Q?Gk4wXI1BFV9rnYkA0qen+U7bEZU538xfCWNtlhkF+9sQ4XoJ+GZB3gU1DAdX?=
 =?us-ascii?Q?bvjWVUc0IGEzop4algktMzr6Sda9F5l48l19XGLRzI21FpEJzu9Hmnktg6/W?=
 =?us-ascii?Q?s1klrBJ1c2s5Nr5v78IqyfI+k9WiCpKBTi40PnSq5018+4sMbQl8i5BleF67?=
 =?us-ascii?Q?Gq1wIogB4fX4uOxCFjttgeqkf+2b5pEcwGJjGB5z9RJkbN+VCNXhoAfA9IwL?=
 =?us-ascii?Q?0MtriXBLmYrJQQvL++h7wEqKy9GmXjUOp3qQug+qfuRdZaF6IdPRIrcsVZJu?=
 =?us-ascii?Q?Ax4iHzECRh8lg8tcxVmKbRLcix/hgzG5zv/zpVj6w1PTFlPVRiEXtyc7MzwD?=
 =?us-ascii?Q?PoEwNVAqsVjbtJ4=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 12:06:22.6737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd342c76-6b16-43f2-ddef-08dd57272725
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6471
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_040633_630156_908BE6B8 
X-CRM114-Status: UNSURE (   7.45  )
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

Enable CIX SoC support at ARM64 defconfig

Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..1dd46d200401 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -45,6 +45,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_BLAIZE=y
+CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
-- 
2.25.1


