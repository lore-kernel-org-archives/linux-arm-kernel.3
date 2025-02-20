Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58053C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 08:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BlmO8YgtA6yx3nQ46WhpmVQm0CB2i7qjYPkX1q/808=; b=2YRA3Ium0fchm53R+C/4Rolmwt
	Mbj1yhVwdUJKuBJtt+dWPby4LnYOYFlZRA2NDdAnCjj5ubhd50BwTPrNERo5Y0WxPt/9jHVz4hByG
	N5JhklFdAvDGRGvQFsBU+pjXF/uKyWT+eh/IDa49NF5tRFuqjcs+z20iiEa4OgGvfjAAvCCACLdZ9
	L1zdMhyjKK5QeZNrPGteX9nojQxmNGq4l1dTflwx+FhMnWRKHYf038VVbxm7BaedQxmwa8S4k6VEW
	OxVi312hhC/FHaH1oMMpz4mV/2q7vqXJ6S9oA/nCpEtlHM24QNRhT0YzUe5gsJvBfro8QL/ULK2O0
	e6S3EZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl28G-0000000HQ5m-1S1G;
	Thu, 20 Feb 2025 08:42:08 +0000
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl26l-0000000HPXk-08gU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 08:40:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXdm+RHDnlPBmnB8J2bw5kMXqjeOCNhdUpK/kb3XDyyNvzLyt0NnTJ7nqtPhR0zE/Nyf9tI4LapI9gDE+GVV6+Cgaj/cnx/LMVvpyQlOxtAiCaOcRron9RdTP4+Wlf+ygWYuNq7IJBoyGfoSOiIgVrV1anbFP5TSD7lnWEvKhUxkyIzxF9FjQgMsfQLL20s5Jfu7/16JBCwPGrGvSOSdaK6mhgdkdmmR1GMY179+N4O0jk21nVwIv+iDwVQrSZTIUoEsY/0wc9adYme4GGY9CCp/JK9x6hsEzmyiINU6wqlp8K4vblmudoVC4m9/mM0k6owZxOT+0KLjyDgbGWoxsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BlmO8YgtA6yx3nQ46WhpmVQm0CB2i7qjYPkX1q/808=;
 b=S36h4RMWgsGlUXVf4eDNC/1r13w06Bq8XwnXqxHhDf9Dbn3vnCgThiAdTD2YqB4Vlw8DEdbZf7YVXxAlqDECr/AkYW5BCv750WtceDQAgwiBrJIn6MR1wgH2A4DFBqxZoUyvq3hICzgNCIuYa+qD20e0k3Dv18wBe5l3J3pQV8VM1LT+7FXCJsSQXZYYZT9PXL671SPETExdOBDBdAJ+ZYTcqwK9A3VzDeOWaaVQJRB/ZtWtRiOM36AkbRZzaXPK3jl+JHSvXE3oktia8egG1HWUWCbsIGo3MUuabGmGDn061x2nVPoV88FMcqEYFGrfB0c6F3dB5gTCnDK4DAviNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cixtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BlmO8YgtA6yx3nQ46WhpmVQm0CB2i7qjYPkX1q/808=;
 b=RpH1KzDSmKnGanHTlFn0RXmLhZZ3S5tMswoTNJsYsYAT60OwfEyPlZx3+bWxLwUU0gdY5ES+qNUdC0bJQVb5MFjWBV4Lb17W68WPv42heyyPoQtS8bxe20bNm//IcV86NPE5gDP2eioEewgJEyNnjtLKFw22EkSqypO3R0fTCBne8/PpNgw6TjPv65YJi8avdt1M2h9m5eHAaBzJ6L9UIptcNkwEf87vIIU8HQ67kPyyvtMBJoq6pTotvT77lz8TecAuSc+qmKEh+/sSVDAMfmiBQvVnD1kGniXma6KC6rJCyab2R+nOYJZhiKu46Ap0K5ujLyo1R92HRiQwRq+02w==
Received: from PSBPR02CA0005.apcprd02.prod.outlook.com (2603:1096:301::15) by
 TYSPR06MB6433.apcprd06.prod.outlook.com (2603:1096:400:47a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.12; Thu, 20 Feb 2025 08:40:22 +0000
Received: from HK2PEPF00006FAF.apcprd02.prod.outlook.com
 (2603:1096:301:0:cafe::f4) by PSBPR02CA0005.outlook.office365.com
 (2603:1096:301::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.16 via Frontend Transport; Thu,
 20 Feb 2025 08:40:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK2PEPF00006FAF.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 08:40:21 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AA29041C0A06;
	Thu, 20 Feb 2025 16:40:20 +0800 (CST)
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
	Peter Chen <peter.chen@cixtech.com>,
	"Fugang . duan" <fugang.duan@cixtech.com>
Subject: [PATCH 5/6] arm64: defconfig: Enable CIX SoC
Date: Thu, 20 Feb 2025 16:40:19 +0800
Message-Id: <20250220084020.628704-6-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250220084020.628704-1-peter.chen@cixtech.com>
References: <20250220084020.628704-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAF:EE_|TYSPR06MB6433:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 64fe4563-f3da-47dd-5f1d-08dd518a3682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UGxgUDo/K0W+I6+Tpy50gIO2CnICiVJigIsDRDeFD+G1on6OBnwT2VikeCIX?=
 =?us-ascii?Q?avt5u6Sj4Bjn4lyzhzkf+kT1FJ0w5i7L7Ojn+JaRkpOTYGsCZUuDi3LnatQH?=
 =?us-ascii?Q?qWb0t5GeiQWaOuioL3jMxw/ryt2UMzF3IxQgfpeetccoYX/9ED2tSfiXWDrs?=
 =?us-ascii?Q?pxBkyTEAk/0rexWlr2klNwlE+oU+p9wuEwYoAEMFI1rlit1eYj9Jm9sxsxDo?=
 =?us-ascii?Q?Rq0D7RUcmWg/7D1s4Wh6pGMnMUUxIQPq7KSQyvHW9puLFaAsfghlFemQZSat?=
 =?us-ascii?Q?/QNezAP+f4k9iakRKY/1EsyE2FIqgpbo/N1fwMdubPlmCyhL1xsGjLogKjSF?=
 =?us-ascii?Q?7DQmGzo3OE3XmYrkt3SUZbsLhbEzQQGKy39iMRcA7e6YpxCtJSFPTunkdZeD?=
 =?us-ascii?Q?tLzatLq1cNOXuq1Bu6yaq96U04L/fRZo17WLJfHPpnB7y+pGiy/gomP2QqUC?=
 =?us-ascii?Q?20Faod4+tElfiZh5FRHA8vfggKUTzORCHkMMJgHh6Y1R2DnM0v8sI30acM70?=
 =?us-ascii?Q?9w6FIJBUw30Xl4djqUNMhLNNzFle2uCqxF9g/1+GUTDE79kPyaUrh6njCnh4?=
 =?us-ascii?Q?XWBCVuZ4542DXX2+FwjqJhJijZe2lcIEl6EQ7fxh2lK4zz7MDGehv79X7o54?=
 =?us-ascii?Q?Xhyv61Pi2qnjiYiN/qcK+Y/fcZygaZ2gbOFZtqpM3YS9c7LBBNswepOzf4Zw?=
 =?us-ascii?Q?L0GSOgOtZmL6wcuoLpejRJvkvDfK4LV4Ybl4EQ9R5Eytlm+i4nX9S0gj7ce1?=
 =?us-ascii?Q?e2/91lgwgchsulCRfSpYN1mySlE2PETJIvclZ4TrOOn5EcJVHMU0cVGhiRih?=
 =?us-ascii?Q?USyIpCOglejtbdrIRZMcizbCYsEtR0/yX7Z42yvf0Yb8mMvUZAhutYjSIgtC?=
 =?us-ascii?Q?JggzgFL+so7K4mM7/IP3QAVt1hCBgEBE17L1iCDs5/YdvP4EYxVjTlxipQaB?=
 =?us-ascii?Q?d5JCfqkiE/PccIfbMrSxWuiMFNP0c8dZZxf7HmnLIVgP9DyfER5lC9GhmsMG?=
 =?us-ascii?Q?TpqtdQgcaJR8k6R5ltLFn+cBpsYZbF6yhhLnQTiJ0a4NkI1+z8d3gssi//3Z?=
 =?us-ascii?Q?5FPZFxhk4xzh8ALvI8KdyC0bOOAz8iS+poFBhnDKIejaOADo44rpzhN0JI0e?=
 =?us-ascii?Q?+oS23y4uQPfpuGvVnUOB6rv2eSEagCDyoQw6LXQ6SOeDmIrGgUv3X2xITlUd?=
 =?us-ascii?Q?ZEPAjM3RKwdIbEqSGCpPyTvfqGiqqftryCChknPnpDulEkDgfNfsen3o5tvK?=
 =?us-ascii?Q?hlnt0BpXxtlvwr92Ds9Pt3FDf7mydUIjpX+WhdrwyctmkaNltGemjhwSrFZJ?=
 =?us-ascii?Q?mJ64Op+e5lp2mtNIQvRGQuf67bLvjDjjeKHDuab/Cui4HsbSNekuqTGeWfvm?=
 =?us-ascii?Q?0RaX51nNPiYGk+gRn5YT9emzpwjpfnV/Pj7C+P6QJSG77LaweSGoH1wvHEsD?=
 =?us-ascii?Q?+ssGJpOdbQex8eJzomNMuFRv5sRVmAEXr7mt6VVGuzzXFZflAkQvCg/Gv9rF?=
 =?us-ascii?Q?/Uh/zw5BkXlT9Io=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 08:40:21.5985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fe4563-f3da-47dd-5f1d-08dd518a3682
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2PEPF00006FAF.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6433
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_004035_097401_073DBA6C 
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

Enable CIX SoC support at ARM64 defconfig

Acked-by: Fugang.duan <fugang.duan@cixtech.com>
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


