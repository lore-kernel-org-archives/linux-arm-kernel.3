Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5266D78771
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 13:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YCzuf0WpryQ79fMV/HKtcqAu6KpDi/hiMhF8CQnXfcY=; b=N3GwtPA6qlEGfubhhXgoRAdsen
	hxQTsxiY9TsKEGNvWR5Y7tmHuxUt1z04p+btQZgT2LEDRP8DTCw/NYbYvH0nyH4+dK9F2xaXJQoKJ
	ngyHel4BJjqmPuNTxi/E34btiy77gARqtkzpzQcsrZlcSK0U7EVtsSwE4RAMO/gka9AE2cos1yJXP
	P9LDK9ANscJLdUgjgMqElO0ONbqimyV6FouccVIB93ofhT4HRh9WlSjDjoh66ZMr5wcGIOqZwJ+VQ
	7k2HnwP02/tJLUS5LR7d6jlK/T+qxBihQ++y+nLdh3xHYVMVHxHGB/XHsWWsaam3RF6PDUFQuVzx0
	EQTvOEBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWaeO-0000000AM7k-1IMS;
	Fri, 19 Dec 2025 13:36:08 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWaeJ-0000000AM6h-1mrn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 13:36:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Np9odcM3skzv+IcqZHHQm6WtqiLHYo80ueeK8PaxT3EtWkZWkcYOBAcLFW2MpRQlUecOvKz8LVO7wV3s7PDGK81UOeHkqYxgSYU6/LqwP8R3K8bTRW/1OVbAhy2BOJnXe4e5T0lrXUMXU8v3HAbGhvMY+RlLvu2THrwirOxVjcCtL0O4NlZeDjIjxcvfblu/thrIg1MGHYaSiym8njKlXNqfZ5TkYQpPr9a6c/CDWr488U2XMAdHfxtoMJL/+8NxR1APi65Dr7nf6U81U1Ygey9Jllgv9A5ZARb/1PbwXZSfr9o3b7bsvxhRhwmIaipcGn0p45IHPvDyzZT3A+s7Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCzuf0WpryQ79fMV/HKtcqAu6KpDi/hiMhF8CQnXfcY=;
 b=k2DAL9S5a8FfilBGAFlX23F7Bsssskn845yWFSBn7jD/ymnqperfFz444UgrHrbFcJPpBumoYCWivyC75KImPgCJsuPk4SmtWsownnPJpS+co77jSibf3stJOemam25iEvyzDmbWoJnSeKL4kEBeDC6c6CeKqUWhg6yr8dyxe00r+h9aYierS+C0pKSWSMKccRqTFw52KO0I/Dino9lVwRrO49fclspfoI1YZwC/GgnIcczR7gA4nmgP9JTG2X/xSAcFGzKF9E5KgoOX//6sr78Aufep0wShybxfd7vj2KjmTKeamWwz3GgaCOKGHdoYPNO/YHVjQfwSICzxGUBHkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26) by
 PUZPR06MB5902.apcprd06.prod.outlook.com (2603:1096:301:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 13:35:56 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::ee) by SG2PR04CA0164.outlook.office365.com
 (2603:1096:4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 13:35:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 13:35:54 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E306C4126FFD;
	Fri, 19 Dec 2025 21:35:53 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v2 0/2] Add OrangePi 6 Plus board
Date: Fri, 19 Dec 2025 21:35:51 +0800
Message-ID: <20251219133553.1440970-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|PUZPR06MB5902:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a189d615-5a76-4236-c3d4-08de3f038931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MueSCaBTfxPFHkteUvg8wVg7tK27Ff0YVK2maVRIAGMDwIGBCvm+RsGAyxNF?=
 =?us-ascii?Q?xrDkpe4bcAdGZVTIlFGpLqyJe6ZuL5uWdpRlG3/zM5evW8SvuhmKL54AUGvr?=
 =?us-ascii?Q?mVMLVimR1LHLn2lRV+c0qm/dCK+syxJob2NQgwqrInRDTAsGjfIqVN/psGqB?=
 =?us-ascii?Q?r5OZ/lrJBE0pNBJrs+L9uqLRf2R6RVBzKvsoolZ2KfXejBJ4bwAKyVSs2Grb?=
 =?us-ascii?Q?x2MeKb6h4OFbGShBx21RNkBx3b7RMU5Bmg+IuPVSYdC1it0Vh+HADXrsDKeX?=
 =?us-ascii?Q?tcA79DT921XTR8butOKaviIKknJYdoZ7IhJ29Ct75xFRiVmUAN7RhntYvmAo?=
 =?us-ascii?Q?qBygIbtS9dSO+QN61n5OKSRb5B/dmLwDGljSgtcmQnauljmVxveDypOxv7Il?=
 =?us-ascii?Q?v2SlWypaRuZueaWetkC1pWEFsEKJ2JdIDf1ZUDuBrpK08uOUC2s7ZPdQ+c7B?=
 =?us-ascii?Q?BjKXIz13yS8s2St7QX/6lp79SicLH1el5EJHi6wnH6R03pHY6gDuebWbUI/g?=
 =?us-ascii?Q?jWRzTjlKWW//5ddubQ42F/ptfIifgXKDQ3GTyTfgYUsld9P1w4XnDCuF4wEm?=
 =?us-ascii?Q?8xuy/ww9qvYWsDCd53vEoZgp+k3NeWFQLwskU/NNBs3+deMrEY9usINtDTj6?=
 =?us-ascii?Q?OOjQrG5r0VhsdBgOVzSSSC64pe6h5+dJhrRIO4Fzshxwxz6+Wfdp0lA3LRZt?=
 =?us-ascii?Q?MV05/J58/YxSrqP7QPbeg647sM7NFg+TiocedAlmnvYQaZUB4Z30rQt5dLZU?=
 =?us-ascii?Q?TtGUIznpUgw9KsXJjMHl37Rsrnjkk6OZhY3ON3tv/sYSgcgvX3yH1M4o0KRW?=
 =?us-ascii?Q?dDugy5JYbdctMauYUWHO8cuMSxoRVDHFK5TfS/1h1/HCxgD5WvhGkEy9XdeV?=
 =?us-ascii?Q?lJbeijzrBl1Xt94jZLO0aF+GASF1+lbsfFH6WPebuZhvavJmWnIMMdqII4oz?=
 =?us-ascii?Q?mO6uGmcabk4GgrCPDD0aSE/SPhDdTvXboSufipBsbSdxfsYn7E7+YyLhvXmW?=
 =?us-ascii?Q?MXe6kcYIZRG9v40URQa55W6UPwq4wwkNTYKr0MMSEYqacz1Q0JSkXZCY0Wn+?=
 =?us-ascii?Q?yd86T5ejS1J5rfT6e7RIhSXBZd23mUM1ip3591LJnPt8KAGiVX4PgB/Wzrl5?=
 =?us-ascii?Q?0s3SNNLvc8T0O1GUEn2XYjne0WgDSqZzSUg6lgdkTn5mtX/yg8vevUcEBTY9?=
 =?us-ascii?Q?77H9mHrgdbKU/bwMUdhYaWQ26SZWHKY6SnEAAJR3CpI8i7ywvhxTxtrQ+SoR?=
 =?us-ascii?Q?QpANc01bxttaMtLtXc682qG1PtouHH8HbvvZFwiZ3WPDmseYAcGzWwZirrGj?=
 =?us-ascii?Q?gzqWSeergDVV54kes3wt6kk6uSL8N9CePrAJsfYSLl2XhzYyTWL6HooBBIsz?=
 =?us-ascii?Q?6eMc+nBJV59M6Q+rgDi1o1RyF46G9iOle2YrXeSvY9jd+H0svSFIemTYmPfl?=
 =?us-ascii?Q?gSaXK1m9UyMvN1Ap7ii3AH7jfqiP/2ontBluendPabThfEg5FOGgYoIYLLWw?=
 =?us-ascii?Q?gDHZs/jzNZAo0HCI6qr2ovLkLI40h21c0tvXS+x2VXGqgyVNYrVirBMDrOCU?=
 =?us-ascii?Q?f2H3f4EhNd+5D7CnOmY=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 13:35:54.8514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a189d615-5a76-4236-c3d4-08de3f038931
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5902
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_053603_466919_76EC5552 
X-CRM114-Status: UNSURE (   9.22  )
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

Patch 1: add compatible strings for OrangePi 6 Plus board
Patch 2: add dts file for OrangePi 6 Plus board

OrangePi 6 Plus board is powered by Cix Sky1. You could find brief
introduction for SoC and related boards at:
http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-6-Plus.html

Currently, to run upstream kernel at OrangePi 6 Plus board, you need to
use BIOS released by OrangePi, and add "clk_ignore_unused=1" at bootargs.
http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi-6-Plus.html

Gary Yang (2):
  dt-bindings: arm: cix: add OrangePi 6 Plus board
  arm64: dts: cix: Add OrangePi 6 Plus board support

 .../devicetree/bindings/arm/cix.yaml          |  4 +-
 arch/arm64/boot/dts/cix/Makefile              |  1 +
 arch/arm64/boot/dts/cix/sky1-xcp.dts          | 83 +++++++++++++++++++
 3 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/cix/sky1-xcp.dts

-- 
2.49.0


