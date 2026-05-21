Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2E0CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4boqme9iUjUIV4GcvFrCDeA4PvHhjJya/WtmJw6vPuE=; b=IHFyoCpLlywDpOo+PW50ZjReQC
	UCGXDxYqf9yxQoiLsy7u+mhEnFqQpOlosbJdvoXDmm8HpoTVmzzSMK8OGW5PHa8Okp4ycsDB9Qp/1
	pIpgWNg9qg/VavjfOLh/2PwAtO7LFxDndLtwjY9ActZTYl1zHCi/OoKCBJj99B7cOyA1WiA9LKHUv
	WEFfSngTQenxdU3wrDTgRD1WOlBQdQs1oQq2sxNjXnB5spac8RWAYYeyZLJu9U6g7/ZhwRMXCNgVN
	23fRwTmvcV7cxmLWw7mb/fE7b0DJW5a1CDOdSSUvGJv0eyH07ExkxuXa/78BdR+evCnmM4c8XrJq1
	rirFt3sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxrz-00000006xtJ-1Vjq;
	Thu, 21 May 2026 07:31:03 +0000
Received: from mail-northcentralusazon11012063.outbound.protection.outlook.com ([40.107.200.63] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxru-00000006xpa-2eI0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 07:30:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9PyxXTr2jsFiw9XOivdSZLrZQYpqPCSQKZbs+bEzgxTM2TH/eO0TskYjELSKwGrZocKB8Swh7H3gaLxy2TIMFTCObsw0EFGnADAXXG28cV16V+cScOYQcDNHlTezRQyUgduo3fRj1b3N8KJWsZVSsdKnktpECZB5RSdP5Nt/kMevl0N8XanPtsSK4a8Jp0OzkueMiWkm8VbPRBfKHlRkGxi0R0sSjIjDWot0HN6NXS0XyLriLMUtZui5b1D33pA0SClHL7OK0VpcpC6cBzqhM3LmrxJ5CT5R8+ST3lE/m2hVE2d2ku3fxNsqtN5leVYovTRnHhILbb52BLh41PvVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4boqme9iUjUIV4GcvFrCDeA4PvHhjJya/WtmJw6vPuE=;
 b=buTYUfBCiTSsMKchO3D3HurB0Krk8K5tThjkTw7tJEQFb7DTjDxbfpi9JFSPh5924VX04g7SEFRqK5wLXPM2ABYzkZF3CLifEzo+aJGu8xysc3MPew3MnlhSGRQlrrEZNEsbpuYv7vyPhvSfpNcVYtAdzwhZot7dZQiykb7If3YzOQncIQt3lkbE0PNGOI0C3FZLeWip09oqg3LIGrI+uXzo9GrhpSvhE1S69Xn649/TdhQiyRgsCSiZwl6I+rdfIk7F/wsG8Rfgj3HOD1SZ87gCBm+rWc+z3szyzrAp7UprPXafsUhSMZGO7BiqVbOXrs17WmMGaBO/MXi2k+LW2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4boqme9iUjUIV4GcvFrCDeA4PvHhjJya/WtmJw6vPuE=;
 b=TK2CnSFjfFDj2YwkMRpmyzY5u1mwd0e4BaUhRoDAjbnxp9+z0I9psxV4nMt1c8fYR+V9L+wnyJoNYiyP9lGm6XgjGnKeEmHPUgmisFa33XfRGQBRJAdy0n3RFHnMfYUcUbQKA2oXzi2yFRr/kjCOzRQaXl78kwyOU5m+i0M268EbA5IYNPrs8te1fbpVtFil27fkVkY6OrogHoqn49wurF1/m9xeEsnc6NX1+nKTFJyrCX/iGnn2Zklu4rZdE9zmnw/NFXOu0VtLvlNIsNdVT8LCjqaDndOd5cooNQzeaAaenImBSH4msnEaj5QXmuICRwXbg8uc0KoTlWuiFXFPkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9474.namprd12.prod.outlook.com (2603:10b6:8:252::17)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 07:30:54 +0000
Received: from DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7]) by DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7%6]) with mapi id 15.21.0025.016; Thu, 21 May 2026
 07:30:54 +0000
From: Srirangan Madhavan <smadhavan@nvidia.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@arm.com
Cc: conor@kernel.org,
	jic23@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vsethi@nvidia.com,
	jevans@nvidia.com,
	raghupathyk@nvidia.com,
	srikars@nvidia.com,
	nbenech@nvidia.com,
	alwilliamson@nvidia.com,
	Dan Williams <danwilliams@nvidia.com>,
	Srirangan Madhavan <smadhavan@nvidia.com>
Subject: [RFC PATCH 1/2] arm64: smccc: add cache clean/invalidate IDs and return codes
Date: Thu, 21 May 2026 07:30:46 +0000
Message-ID: <20260521073047.320614-2-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521073047.320614-1-smadhavan@nvidia.com>
References: <20260521073047.320614-1-smadhavan@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::39) To DS7PR12MB9474.namprd12.prod.outlook.com
 (2603:10b6:8:252::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9474:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e503be-d9fc-489e-8186-08deb70ae437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: wkUdioVSoZ6SxiTRUTiH9APUOMlivVDhgjCotoHtxnKS08BCIAaoia1T14wClGlL2VUROn5c8Ax3QOMxyyTo7B2BXXE5fx/NJbzFiFRK0uR08B9PETiIfL1GWfFhOW4PbDSotaevGs/kOi0Ozp/MVw65qFPINl941dBRDQHzScvNP0R5SZVfTSB+HSIST0Oxo5prNiq4JjmVGQooRZLe1QlH0sv1L52LnCjTlMLfX9bwJ75Kj8yUciECMABnp1lMq0BWvI6WX2yWw3mAl0d3df0VXyyFaXuGrV6VOzwUQMaconS7GkiEzBc48p7ASmzXB3iBPRHq+6jUuDOtCJUXB4ZbYxi+nQH0fsk04Z0gW6cWmx6C9WVfjxT8fcPvwmvNdMSZL8Duvouyi31NjpgycbCfY4rf4LcTzO4CyJvoFmWjpUHUDQjIDlVfOpzd7q3Z3lmsl/7JUgJChoTsSuWEsMqyZy9Pkq5EaQ4LnjbMRzTj2vs9VZ9nCxQxGIsdC/xk22jebSuIlGhzsKm8u8HrB7MwNWR+QxT2xHS1t239ptb0sgqRVKF9blh1PweTin9MxWK0Li8FtSSkR+RNffMbze30MBC5IK96DGo6cj7SWJWyqVElKAEj68dNd/NRWd96kQTMvg/HozCRH3vne0Nfmh79rTNqs5fu9rQ1Z1ImC1gWpdmf+UW5eAojFYWbK8/x
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9474.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QJ3w7AikCdVpw1fD/YlZqbzYZ7QMcr4lHK7G4WB3uCUAg+F/bxABmYsYAhpi?=
 =?us-ascii?Q?dbUI4eTOInMQBhzCzCnDVBrxSxBv1h71Nb5GPt3SceYMrzPDP7VXUzlvPScS?=
 =?us-ascii?Q?MH9Ian95rI///40fROTMcdlgQv+myZJ0HqAbzv+xYgTYnuZFqJg/hBnJlVie?=
 =?us-ascii?Q?DS8WbE8xXmsgOocAJXtJewv3nwuP4C0qaiYvEu0irEBR2wkKFkatBm5T/ibm?=
 =?us-ascii?Q?aTv6YA893a4j6DV3uzRtYq8jEi+PYw5cIQ2WzrWLwwtVYKJQsKC5/wyCf7ou?=
 =?us-ascii?Q?F2iDFhbVXeNMcimz3LZ+jrOP8F7G+Hh+zqEE6u9Gks4LFb/esz+LvajTZQn0?=
 =?us-ascii?Q?jsENlzmeyJCVsmYL/IehUszkAAvBKFgkvcsriEJhrSv2Mbq347598/MT/VvI?=
 =?us-ascii?Q?MbH5hZyECLgvkNOsIilAsOEXEmjFf9S/9PzWcPYXDV/s2cljkHwV60YRnVKQ?=
 =?us-ascii?Q?275afGBRdNyj5afn95Cw804W4hSNbO7Pf7RqaH3KYEBRnxqrm1816bar+Wl3?=
 =?us-ascii?Q?+5F3hmJNAgaEM5smCJEs3CNBG4i70teHXxZsXzRhrqOzZo+N1/jgm27FtPKf?=
 =?us-ascii?Q?HAW8FD/7xZ5fgLnaJC03ONDtovlilhCDmS76GCgaL3/jI3Ztrzu1VN9mIBn2?=
 =?us-ascii?Q?MF4yJht64CpdO12vg4y9peNJp6fZfGV2JnnIJGBcdYdAtStA8qBXHfKJQQZr?=
 =?us-ascii?Q?8PzfUodLtRuVefdK6WVYnr2jQ1V7Ygo/JcJ/iMwdgP562viEp7DdMftSwmeK?=
 =?us-ascii?Q?FzeMX/0aqXgbJGZaFFTvf8GyGzmPRvQ7KvbjuJXTNWvJ4fs7jxS8tznsczm0?=
 =?us-ascii?Q?uhQS3vtCvoL3OYT6IeyVSvrbV0WsXP3vlZaylxBzWNxJzYOr/jqfH1Q6+/MC?=
 =?us-ascii?Q?4fETL3JIhyWykXjkOg0RSHOCMSG1NIV+6KoLcB/+VHeJv7FrtDWeHlRHpN5d?=
 =?us-ascii?Q?PGcXge39d2xARIffSeGAwPrkBqqfvizvVxxcHFyzRD2q/sWVKfYhqKlPgKpY?=
 =?us-ascii?Q?U2mlkQh5bEKLGr7B2LB3tCNjxF2mKhGc2oafHbbsAzd+aFIWDHoZ9SzMo8+l?=
 =?us-ascii?Q?439iOJdjYasNWpan8tWms8xG1rz+85uYR325w9hnUR6L88c2s9G+QW6ZlhX/?=
 =?us-ascii?Q?esMwvtPW1MtkTmcgkV0hAWHv78QUzW96hNzjy1UKB/2L2Jdv7jlOmCb+ceQh?=
 =?us-ascii?Q?TcAyWrdNxGXZVdkl1hT5HdX4CP6p/xjqv6XAJskSD7tEpJiqjtCJJ7TOkt11?=
 =?us-ascii?Q?gR4qPQWrdw2+487alvwBIh1/fNmVh1LRIlFoEVE1oBkgSqHes/+RN5WqkCz6?=
 =?us-ascii?Q?CdYJDR5AYed+EDNoJa1BogM7833xNxu3AsH2t9pzWcTe5tpDaxvVTGRp7m9q?=
 =?us-ascii?Q?ktDbI9rn1gKxezDQ+MhSsc1OdNvZSj37q/NlcUgcVx/+7WkIXIdD2Y5hLABB?=
 =?us-ascii?Q?rOfFzq8BMT6Gg/jfe6izY8Vn4AQdZK+NFps6j8TGF9iHIuRtdKff9imB6cMr?=
 =?us-ascii?Q?Q4n9ZN1OVf2yiu0ublpRW7KxOdmSlzikI3uKtnhJJYPfz6dASDhqebWqFNpj?=
 =?us-ascii?Q?wxXAt2pOzzknv6VwiVJ1qhZNGlaItzYbCTAqI6pQwDRKj6GAd7UxEpTzoSl4?=
 =?us-ascii?Q?pFvU3N1GstMQcHcHYzU5ogq45bjbpaG1lJ8DC1WC8Pnc/OqsJDoZZPyx13rc?=
 =?us-ascii?Q?GmcUw84MHAcFeF6O09Kh1F0o5slhIuVO6gBVL750RCxpiC2WZ/JtgEtAV5u9?=
 =?us-ascii?Q?7OAbRDFjcQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e503be-d9fc-489e-8186-08deb70ae437
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 07:30:54.0705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mrsb6t9Rqmb6SqSw1mZgAaStyWkbkWN5OWBlkGwx9q12laX3yOBpioXnzkfeLGq4C0ibe3bUJ7mqG7qzt78rhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_003058_670401_971DBE6B 
X-CRM114-Status: UNSURE (   9.75  )
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

Define SMCCC Arch function IDs for CLEAN_INV_MEMREGION and its ATTRIBUTES
call, and add RATE_LIMITED/BUSY return codes from DEN0028 for callers that
need transient error handling.

Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
---
 include/linux/arm-smccc.h       | 17 +++++++++++++++--
 tools/include/linux/arm-smccc.h | 17 +++++++++++++++--
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 50b47eba7d01..cca9adbcc433 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -105,6 +105,18 @@
 			   ARM_SMCCC_SMC_32,				\
 			   0, 0x3fff)
 
+#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION				\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_ARCH,			\
+			   0x5)
+
+#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_ARCH,			\
+			   0x6)
+
 #define ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID				\
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
 			   ARM_SMCCC_SMC_32,				\
@@ -294,13 +306,14 @@
 			   0x53)
 
 /*
- * Return codes defined in ARM DEN 0070A
- * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C
+ * Return codes defined by Arm SMCCC (DEN0028).
  */
 #define SMCCC_RET_SUCCESS			0
 #define SMCCC_RET_NOT_SUPPORTED			-1
 #define SMCCC_RET_NOT_REQUIRED			-2
 #define SMCCC_RET_INVALID_PARAMETER		-3
+#define SMCCC_RET_RATE_LIMITED			-4
+#define SMCCC_RET_BUSY				-5
 
 #ifndef __ASSEMBLY__
 
diff --git a/tools/include/linux/arm-smccc.h b/tools/include/linux/arm-smccc.h
index 63ce9bebccd3..65fd4630e739 100644
--- a/tools/include/linux/arm-smccc.h
+++ b/tools/include/linux/arm-smccc.h
@@ -96,6 +96,18 @@
 			   ARM_SMCCC_SMC_32,				\
 			   0, 0x3fff)
 
+#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION				\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_ARCH,			\
+			   0x5)
+
+#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_ARCH,			\
+			   0x6)
+
 #define ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID				\
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
 			   ARM_SMCCC_SMC_32,				\
@@ -182,12 +194,13 @@
 			   0x53)
 
 /*
- * Return codes defined in ARM DEN 0070A
- * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C
+ * Return codes defined by Arm SMCCC (DEN0028).
  */
 #define SMCCC_RET_SUCCESS			0
 #define SMCCC_RET_NOT_SUPPORTED			-1
 #define SMCCC_RET_NOT_REQUIRED			-2
 #define SMCCC_RET_INVALID_PARAMETER		-3
+#define SMCCC_RET_RATE_LIMITED			-4
+#define SMCCC_RET_BUSY				-5
 
 #endif /*__LINUX_ARM_SMCCC_H*/
-- 
2.43.0

