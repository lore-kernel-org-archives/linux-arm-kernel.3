Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4CCC4450F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpaTpdar5NmCn6KDifPZIoCGv+BUoPNwYtyDeM8tyOQ=; b=VsESX7PJnSz8mQUVOKiWhTaZ3V
	xyYWMrWnifCzdQ5+6vgL7MjHN0UCmlTUEps3gOCVkt8gPmpJL+3gcFDv6dcSy8ZAb0W9qIApvD36u
	kTiMpHhG+tgRZxS3Fd5eSy2HFnCHsVGo+GqXPBodrHsWXSC+LzB4M9Ko4XMOQ/YSIK0SvV+lLqj/B
	JOaPMZR7CTFt/e6eUghjwF+7xoIf+jStWn9nIhgk3Ox26bEcON989VSALTZM0cd6RXTdDP7Mafj0z
	2/IXjXQ6ufsq1d8G5A+yu2yYiNrvJzhuq0fK1CjLq8u+Tb8CT5fgzA+IIXY+LR/J5uskPnwzqJG9P
	JXJE2Nfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zr-0000000Fcjc-2sWb;
	Wed, 15 Jul 2026 18:06:15 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zf-0000000FcOH-2AgO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:06:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1hJbx0H5xPh0gswX9vlaB2Uuo2ZVVsMJkmjW8vH6wNswhhXeCCEaV8OC6AeRClW4C1QNkf25xzvbiab8OLkcZK0/oGz/LbOqIr2QUElbdEB3ALLwvi4pP2ni6QAuhQCNHTDULRbjKAmH0bwLM3oqrIZIgPTDcn5P+WZ6tfSZXivz7LBxeOboSFudHL9VxDAo0drxlq+e79TqQfCkKENncwA/3ufJ38ofqc5j2moYPYq5yyFDm4hGOAokkr8vumew57uEjs8Ag6lc/BBlVl2YXFiG4VnUmzT853rFWsgfmEtEjddBzhIoSeSou4vqLENb/n3rqHDPPjXdk58wSW1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpaTpdar5NmCn6KDifPZIoCGv+BUoPNwYtyDeM8tyOQ=;
 b=YxEjHtD/ORa0pk8+g8lRPqbuAo6e+oWCb6o86L8SzzH9UMeW3Y2Z5Cxh/Q4bQmSNREYuYxPCkuDBYvqWZJ7NMmDnze3ucgWZDfliWFkay3ndaaZOr7jEKQ79aICZxSmGBGwWTEkcrYN9Ph9D3L05lANzW83nxJiTdhoEoVMZH4hRNerGcWi6UzshWeKV4Vf+Ql2rh7CLbOxC6TeQ7O/9c8sHGZ8Un6PBbkGarVT079lLsO6iNAtMoGObfbOYOwWamU1gx+oSqQZduBbXv+3UREyFF+nOpuDvCzVWmZQ1xrlTSrZtR8nQh0u6fC44TT04FyCiIEIXRR17yRZIakC26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpaTpdar5NmCn6KDifPZIoCGv+BUoPNwYtyDeM8tyOQ=;
 b=dvGpYiPVywlL2zHHNhQB++U7y5TE4Efge/wqlQ0NQH2y88JhbTwCojiXrL2Iy+iqDAhXELMBStqc6azIO3QE2uYQaQNeub8yOQoEtBGBlPNKGjGKKzkMoH0mmI4PMVs1fqJsj8BimyO1bt1N8oQ5o4igwqBNFNiWONuowODVuig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV2PR01MB7767.prod.exchangelabs.com (2603:10b6:408:170::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.10; Wed, 15 Jul 2026 18:05:51 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 18:05:51 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: cl@gentwo.org,
	dennis@kernel.org,
	tj@kernel.org,
	urezki@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	david@kernel.org,
	akpm@linux-foundation.org,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com
Cc: yang@os.amperecomputing.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/16] arm64: kconfig: select HAVE_LOCAL_PER_CPU_MAP
Date: Wed, 15 Jul 2026 11:04:17 -0700
Message-ID: <20260715180455.515692-16-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260715180455.515692-1-yang@os.amperecomputing.com>
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:930:89::18) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|LV2PR01MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6172e5-7a90-445c-9f29-08dee29bb4bb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|56012099006|10067099003|22082099003|55112099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: Re9mHU3BS+kL/MeXeXlTBcQPME3ja3FPtdC8Uocrxx4D8wKbRL8wigsyY8OK2+dNjHbO9CsDeWRZSI/rfb0x0qOyyYf4u2aB3jPDXytY0aoSNaFGM9ixevnCuROGpgjsIlQtJSpVlHqPc8/6edMuodfjBwPzdeZQ32xnXJl31GagNI/mPz5dO8qobS6M3dAWODWmaQUBk+havdLF7gvca0VrEvCj/2tU+ul+eDm0XHLG2w2ui1eR42/pXEzmQpSH18voxUTNBWrT6LEpk8a/wf/MDg2hzxmsmX/w8TcrJiDI58fuyD8RwwglK3+Bl5EQkkf8BNXaRYtxqswDcbRvCeht9hgnhRPCtrlIV6d4fNGBDxfcRSavYoNu79a/XCzhH1t9wHHXkxKPP5gsEChc08fNNTOUPKhwXohwZdB6kyJjwmTR20toWKWLfGkG3LrLUvfTVIrVKe5ECDaEkSHacgtwq8ptL+nQaqTRbS/0GkZepjJsuXESmCl7ygA0sAoFPRFe0nfYmvmPJCL8omnyg3PNhryfcoYweAlyb9ji1z4znn5kgtBdcI+GCzbfl5iomgD3t+Rpx0D5B8q/mARkn4yo4QJ8uMne89a59J3HE+/pdFSZzTk1x9Ly7OFkQNM3F9I6757fcghBVu8z5UAcfbfBbjVzph0UXaUNYYF18E8ps0Bm4a5qFaQLuXaSYx2UMJoKMBHDo3iYFQMm7p+D9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(56012099006)(10067099003)(22082099003)(55112099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8x+/HOtolt31i2OGfFuBtzNf+vV290Ccf22gpVKWTW6KEGyNZhN47rduwu1n?=
 =?us-ascii?Q?5ha5W0aNsmlcCj3HTTluMdjuoBaV+eQ7MQuk1bTw5wVxaeMQAzq3fSgJ6w7n?=
 =?us-ascii?Q?VYf0sPMkefePaDr5R+giEM3j+TYa2n3mIPoCD2VCVgDMWdcRzQE4U41i1i2R?=
 =?us-ascii?Q?bkZym31EC2Jd/Y4Nh9+OFbVZfbSS+SW1S/zDybelpIEtsHCxT9SD6Vc9Ifjt?=
 =?us-ascii?Q?E8xrQaI6tnMZr4kVeHSz1tE5Q+juS1WuR2J+ZIWFXa1Gz/DNUQhVtMdeZYp+?=
 =?us-ascii?Q?oXQyQ47+s2eUBsMiGkasS3RnBkvpICsjlaxK4f11MFQ/8yrI/ypJm/zjCrJi?=
 =?us-ascii?Q?r93LSuNrM6xA1HScWADV6naIDd9kLvaV7XHDwi6Qi9KqKwuoK3BtTKHgKf0u?=
 =?us-ascii?Q?UB1LMgh5QPEykIaVvPMvGHofkFRn1siwTYFgG2Pzs1WJjusAwrSsnbTi9dUl?=
 =?us-ascii?Q?QXVq+dzpA5Wupr+MFRk78x/qtr0i8OsYhmxSWJtRYiAK9XtMKRTXsY0fOYfY?=
 =?us-ascii?Q?TxKJvd+GLok6BGr5ll3uB25UhXvDL23jr95j6jtrjtoXk/qlHx0niqRdqgto?=
 =?us-ascii?Q?M4a8mPRJfuhpArJ4uQQ4SLnVEgmJyh+qnpuihweq6Mv89NlUObVXd+MXM9R3?=
 =?us-ascii?Q?8LvRxllIWaSgjWmoZYppA7NwlV9pC5qXBIqRpT8B6WL2W3qAjMAdRV/S+koU?=
 =?us-ascii?Q?1DD426sm23ibxVVTDuV0yta9QhHRLWOghUNejfZCticukaSHGbZsQCd33h5y?=
 =?us-ascii?Q?9GA4dhX5t6hAU4HfdG1iNoSGtOFsRRknz//Fjf6+lQtIX4IBfZFbBTac9/64?=
 =?us-ascii?Q?tvNAFE4fnQeMG/KMNTvSt9BJekqbouGyj62vYiydE/w9qKnwjOkZ8EdTYIuj?=
 =?us-ascii?Q?uQPY/vOabOX2/OYJftDV9KtdSKAk48Jts6RhrACA79sEJyKVUlkh9BlpVvar?=
 =?us-ascii?Q?X5FxDWQYd033h965X7r3YbEdC8NBe3RAvjObtsEWjZQ+v9BtduD8BNeN8l3Y?=
 =?us-ascii?Q?wC4fz6AIlK7A//kSS/ejNf2Lq5G4OKbnqB1VUHquLIXDtDEKOY6itYsOcAqZ?=
 =?us-ascii?Q?QvwychLGkBhY512fEhXTmhQ8vh9KsIdvq0LEqRUPgClb3m4hsTd1z5HQ+uty?=
 =?us-ascii?Q?VYmcvg2veGk+0FwsyfXqT9Tvv1fi8nS/CgGz3UQ3m0gZFNUWCP+GLcPBYr8Y?=
 =?us-ascii?Q?/dCDzs8psCixqgtTN0kcBWgLReFNMdnltgkmDf9mbEpfAqIcw0k2ADJ0guOj?=
 =?us-ascii?Q?E7n+qVTm15UOn5U6e6djzddroUKh2+cjgXAbMJc9RTjwQ9NCc+MytGfTxTjE?=
 =?us-ascii?Q?SQSBop+srj3LJ5ikR/4r7/Hd7jmmMpHbr9oaL+AZPRql7wWpWS6lJperrlCV?=
 =?us-ascii?Q?CIbzkPf29Yd5LVKTwtVFX0qYF1axPKzvIRLLQP0Bw/BQmhMoONxZd9SuwC3j?=
 =?us-ascii?Q?mkbD9J177+fd6ArC/RAE6hyIujYoicO9KiZKnMANvCHENgkNPnJwqikTXsHa?=
 =?us-ascii?Q?6WUHu2FK4GAG/Fyq7tXL3O/ms2bYo+j627wlxGGEBAyTHy9F8iFmRY4gnBm3?=
 =?us-ascii?Q?mV1dLZv6GMVyUNSOsTSGxKK25QP7oubuhsZF6b5prRdxcqj+Yey8EgAb3yBG?=
 =?us-ascii?Q?ZEI4lPu+JNXnNHMmzfGNmPZtC4NQDK2REHbIXvRd+kMMEEM+4/a1WSEgtcrM?=
 =?us-ascii?Q?f0G4zM/GWfqHZpPMIOE0yYc9we5RCpIM2Jq25U+KtVdz1E3eLbKFgqIfe/BX?=
 =?us-ascii?Q?BKgVr8OxX9Ko3/Ofz0XPhlMgDPjTj3Y=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6172e5-7a90-445c-9f29-08dee29bb4bb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 18:05:51.5077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: InASsdjKg1A3e4RsMCaX8w1kZT7het6FeFfB/SHJceVsoNpREyLMiGnZD5MpLskX/fiCLY8N+iA4fwKnaBu4ghSVfWWG3BtNvYTjvbO861k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7767
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_110603_563999_2DB73D17 
X-CRM114-Status: UNSURE (   8.63  )
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

ARM64 supports local percpu map, so select HAVE_LOCAL_PER_CPU_MAP. But
it depends on VA bits and page size for now.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index df55e6bdf81f..95ffd151187f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -415,6 +415,11 @@ config KASAN_SHADOW_OFFSET
 config UNWIND_TABLES
 	bool
 
+config HAVE_LOCAL_PER_CPU_MAP
+	def_bool y
+	depends on (ARM64_VA_BITS_48 && (ARM64_4K_PAGES || ARM64_64K_PAGES)) || \
+		   (ARM64_VA_BITS_47 && ARM64_16K_PAGES)
+
 source "arch/arm64/Kconfig.platforms"
 
 menu "Kernel Features"
-- 
2.47.0


