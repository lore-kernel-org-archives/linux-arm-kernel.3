Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AFCCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:References:In-Reply-To:To:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uQVHq320MSBsZEP4viXGZ7v8jhITALmx2sq87v6FjM=; b=0TdciCGFj5E2zDKgtp14Xb9D8S
	Mg/7r3B5F79PBnPCJXM8g71LD8Ig/xTj4gG/AP2G8hyCedyOEUh31MrVq5Y5wetjdFBeho0dHF6EE
	6nmficlyCIzbq8FhYTqGED5M/9LTevVEX5UfPKDD735xJjHVkea/mqAAgAZB+PMDKxpNxu0vmzTnG
	QIqnx82kNezusSNvbHCZs+tCd/M3BYmIe1yrXfPFzGIdXYExHfHoAqgBuwOx7gjrV6oLZKYIUQLvG
	r+7CbhhTntpgP3SAsYqT1JK0I1NK4yRJXIuUp8ime+fWYTHja2LXsI+kZM9Q/33cCHPeXeuHxc9+b
	1+Sr+PIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz86e-0000000GPiM-3szf;
	Thu, 18 Sep 2025 06:27:00 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz86d-0000000GPhE-0LjY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:27:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuiXiXI8Hp2SQp23M65mW6IZxzAEHH/evSpEQ0k93uP6tRphJC0csQIQcg78CQSPZKwC0H5b0iUmTNnRWSawM8iLpZDnMd2ozkbbunV8menNZbDQ0QeDVs3+i7kFnw78AGjfYZkIe7AyNpZZXRLdCokTiTdgnAhF18kOGk6IENbAZJJLRUIHuqtnmNpaeBWboBTTDv+dLPRGFlBbL/w2BfA3BYL2SUL/vkdFOHj9QKKIr/ol4S7eyLbtLah4kb85A3dNpZ0QNcS9Y10WZeqeQ9hyHcs+X6O+YgxQ7y/AOe9BNZnovTV5iA+8mVOYYA1A87QIjW7fdZ4kwfvsIWH3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uQVHq320MSBsZEP4viXGZ7v8jhITALmx2sq87v6FjM=;
 b=zMoDy5W+kYQEamzRPGosHFHwhAHrgSHKQYY2fCl3FZBxlSHVEAPTiUvbOw7eldPbobOfwo71gsyiUr72tdAQOAc8QR/HHivqEyyaFM74wdQQP+J1tb6C7+RjJ/pXWRweP1OUK8rOgyCRCEDLDPxSV8dD5M2deq8wy2nz7XdWH8GzNy/9lBfKee/Wc8/YS6XYyNUSuXTn78vB3b7gWGXUSB6yQyf3B4eY1xfeT26HDrYyYFfriWnOxyE3vguyMk43GTcNbDIRGD+t/vKRb2PyEh9btliDcF6iTWktnQBM7Jti7ITYkviuw9+8GKCEPOSXrCcezEKcwjbrj9qooelljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uQVHq320MSBsZEP4viXGZ7v8jhITALmx2sq87v6FjM=;
 b=Wt3CcvZVofoVkfsf5G8tLGzkWnPQ59lOhyNq8B/Ysik3SVkTemtTuqUpEYfPgEjidakNg6sjnh/rNvPoErmYJD2aQ6AsQgWb2EOgKYauiyOt/pK6Qwmu8NJVV54JS7Icg58QD58JbE8UV6AU8NE/+svQzm9sEr2ovigkrPK2AVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16214.jpnprd01.prod.outlook.com
 (2603:1096:604:3ea::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 06:26:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 06:26:55 +0000
Message-ID: <87h5x0numo.wl-kuninori.morimoto.gx@renesas.com>
To: "Liang,  Kan" <kan.liang@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Leo Yan <leo.yan@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
In-Reply-To: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 4/7] arm64: cputype: Add Cortex-A720AE definitions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Sep 2025 06:26:55 +0000
X-ClientProxiedBy: TY4P301CA0018.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16214:EE_
X-MS-Office365-Filtering-Correlation-Id: 71523e8a-fc5a-4e71-3506-08ddf67c5d3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qs8iLb3UJdHFrHTMnT3lXMVt7dSd7uztJn75Sy+SQ7S/cgDU/582w4KKnaR7?=
 =?us-ascii?Q?CfsN8bgcGAwCxuCGpDJbS90g3q4L/evEzfMwihlt7438G/yophOMk6MWWs5D?=
 =?us-ascii?Q?HiD0RLANjcfmGqJnRoJQr60ra04skniEQGbgomMSgoxEPHytxQc0pmIgKho0?=
 =?us-ascii?Q?He8Byvh6gvc/pSHHUR+tpvFlw6vHZt/sa8tTj12Gh6c2CZctIzi53C8dUPTh?=
 =?us-ascii?Q?9ZUB+F1TbznPZ6YJvPLOdbmQmguR9pC+IQh+t3CzDHzdI8WCvjsC/nyPwBmo?=
 =?us-ascii?Q?IIiskcFTMn7CyFcEtIlJrE/0u5ByCQwZSGFdloYDEweSiSoJrqldTol6a8qR?=
 =?us-ascii?Q?Ro+xbhjLt+s3bI3fJc6VNXVwTWqjjwYM07ci/KAmgqLgESibpU4Gev3ahWxa?=
 =?us-ascii?Q?5PigbrHpchcALWTDtmnK6LP9wp1q9uyGMxbu9fvnmSmoePMqLt27OhP24rrt?=
 =?us-ascii?Q?tEI0XMFqu5gDgqxE1QzCcmN/Cx6hrD6pZGWciq/ubFYyXza1dN6PtM8ynYml?=
 =?us-ascii?Q?8fi+zPP97k1eY4qYW2sz1lmrwQPYtoICc4eY6WQg0YN/6EzZEgEj1Xzk5aL7?=
 =?us-ascii?Q?mMtr0ZkXVImNPBqgGaWB+1u7vq3sny0zrl3juFVk9uc75TaJGqfFU/tAZWDf?=
 =?us-ascii?Q?EUiVRCRrnpo5itx1aGHVyNVAxOmkR7kMwoeDEfYWJDjoD0X4SR0G55TPL1gZ?=
 =?us-ascii?Q?l+dagY2kcwCu9DdU880pjKsO5WrRwalqukExgl9Y7CisZ3neHiI80Q/40or9?=
 =?us-ascii?Q?6L0ufjonCgq/kA3gvQshOe7kdEPgV28AFfENRGO6YFDiUmeRZCqJRUZZVWYv?=
 =?us-ascii?Q?s0gk6U3Wp7HzImhUM6jGd11P/RGtkEBHDN4uyrZYbL/kx7a6Fh0IMcVTJrDs?=
 =?us-ascii?Q?yzhOlOaSlPHxs4UbjuROnrpKbEA8MMSxLtZ9CdjaVMG2dA2Qg0xYf/rATuXf?=
 =?us-ascii?Q?fSKE1e6u37ctTUTqzyMa+Yb+wP+Bt+QMYnJN9+5fU5cLq2nrF2b86DZsLlH8?=
 =?us-ascii?Q?lDleOqNsOij8bHO+wsd6OntHi57+XJpymjkPtct6918pJiJS+hRiGaOGeHbu?=
 =?us-ascii?Q?0CFtqie3mnJstU95o1HezSdGAxhVoPBWxYqXJk2YTCM16nW2si8eCaEzuAkv?=
 =?us-ascii?Q?8y+F4rlvaA124/F9Exk4YN1Um5Uov1PGG4EHO2HvL/DlUQBDiE6/bnotTWFU?=
 =?us-ascii?Q?+JqNZ+iA4MavKlV76l1tiWltjWkd7kZovEGxGgj4t4Wf08ocYCa/49sJyLki?=
 =?us-ascii?Q?WPkXXG3o2Z8vE1Hj5Ps9jiEkDK5CES944QwKUs1ItN06SMJWazzlOBIx5ybi?=
 =?us-ascii?Q?kvFfsfzwRHne/fEiighBHgvVfNA/uWWGOg4FOixsff7z9UfrgLWXZDBV2oVm?=
 =?us-ascii?Q?ZUZlwTPxxzbOJS6PJZtMS/O/SQsRvGKnBlQy2DN0md/gUn9xPRRBDZHhbQUo?=
 =?us-ascii?Q?NufwmGCggkc0MzwISoru4Q9sqJRXZLWjxeK+zU0AJ7+37opoezovzhbLXluq?=
 =?us-ascii?Q?7mXOTl8BPmtyd+0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5eI7EbFn15/Wz8Cd7gCSgwe8v+J0GMzDilD+MRWBJZxVFdXQOhVR/NpKtNZa?=
 =?us-ascii?Q?mr+fRNKDm5iYXhJnocz5oAEMRSDceq4bFh1fSbKJzqe5yzy9XWLK934PpeQ3?=
 =?us-ascii?Q?uGgSmLZ7O5/ISMJwE52O+S8y7QGAV8CM1QFTcX7uCQt2jPF3pnlXfrk5yDfK?=
 =?us-ascii?Q?2d2oJHui7hwIhD/TVGH32a2JhZNn5hmaH9hXUuA1m/wRRyuN/00rNpWhA8SP?=
 =?us-ascii?Q?EBLF/OOn/luOGxShgt8Rdg+xTtYtbLaGFdZJA4I4VPhVF/m0UfCCuybaSILI?=
 =?us-ascii?Q?b06wpApNhpZBBkfcD+kzantGgG1kym1V3oS32yYlgcRP8VMDMcL1Nv9XZiEr?=
 =?us-ascii?Q?lcFia6QJpAp7LSlDQtk757EcQreb65jNl2Syb8AplKArqVkxzx6/fflEdXZN?=
 =?us-ascii?Q?sXjot+n4a6hUi/HDUORUHKw3fJ08D5wsbFC92hlF+kl/gzWGLG5UJ4Pzq8Dg?=
 =?us-ascii?Q?0500iH7K0deTJBRoef9cJT6nBj1DmS3Z4fPoeVLAAAGruyYOOSCDTOJrMjuy?=
 =?us-ascii?Q?a14MELtSqFDZtFQC2zWxKZVXHIwSbs7QHugDRb5XdJzhwNuDzzAeZ9jRaz79?=
 =?us-ascii?Q?rED+UfzmgFB+zJlADqr3xMN5OQB5/wAu2BCXW+3EpQ5uip38EN2f9S5AMWxR?=
 =?us-ascii?Q?iMKFTg52qoB8A0nunANp0X72tU37gss9JdAzUreJJD+31+39MofhiJlU2Ie6?=
 =?us-ascii?Q?iEUU9lmB2J95ppvyxS1ny0sD65SsiGtr5olXLxoTzOCnMBbWeUY0A5CW5n6V?=
 =?us-ascii?Q?tKgtoJNcpvcZwJb8jtjD8bYLL+3EFdTxSSbElBpXyTq1UHNtklPn03R11t+Q?=
 =?us-ascii?Q?eI4Uf+7nrwSLIqnJUxBdZu4kXeuQVkaKYVtCaLUNs/BUq2QPIok9qlFRXVpR?=
 =?us-ascii?Q?O0IVoiMKdYACwU8PxBB2UMvCJ2546lXphuRuI8PvM1fIxHbB5WwU+4C/R5z0?=
 =?us-ascii?Q?rpdd3LDxY18qcX4OxQ10C6QB/8fJ+aWplhDQwmKiP1192o5PazmXD4Cmby9L?=
 =?us-ascii?Q?wZaHavpA1gmEIZv8hC9PMi7pD9hieOHkzlqiyvbMccqeWALd94LH1DUSCuVc?=
 =?us-ascii?Q?33mIwFIO8ZwUKd3Srh8IO1Cv/5ZimSYiZjLiSVGfV9MxOZPr74jeVAXtXdl2?=
 =?us-ascii?Q?ze5RNripeghFLo7J+2kPhKjACJsZNeTXITdH2l2SQANOAZt5CNhc79fv/OvK?=
 =?us-ascii?Q?sGQqA/7xVZvM6TQeRjQSKoliuEXqD/DlaYEEUMx0knPYACxC2Q9zGUJesXHF?=
 =?us-ascii?Q?fRU7jQXDLBAxB8qkwYdL5lbFtfhqI34CFHFxxWcSfyxRV9V+VBB4y0/RrNLS?=
 =?us-ascii?Q?0ZHeGXn9Y7GFj6L4jzW3bwkSLAQWhdlYx6Xm/K0d3xy2DboAEbJV2rbNclA5?=
 =?us-ascii?Q?nBEMk0iAkj0eGhnPBSqcU2FdhSmWNRZy1ACN+n0YrODXA+Cl7NMmTUvqgYH1?=
 =?us-ascii?Q?0aGV1WytmccLFVdNM1XFAAsTClAGYQXtK71LCRxIKxNAWYgs4HhPwNDUiKGz?=
 =?us-ascii?Q?rla4A2QMyeRFeorfOqDo9KKb6GEq85B/EZ4isTnw6peTmixr3V4M59a2f30+?=
 =?us-ascii?Q?0pCxMB5fWl0n7pB86J293vsXi7ttZ7e9qDWWdId7HPlw2i8t52MAz5erqktu?=
 =?us-ascii?Q?Rvw9uxWLWqe+LfpB1hn3AcY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71523e8a-fc5a-4e71-3506-08ddf67c5d3d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 06:26:55.8578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKPyqe0UxBhRG62quKjWWBks7GYT3TvqdE301kqHPc5iAmlfvrSxKOmQQJA2U//rGO3oMd50O72AOwnfVyjt4VY2Ss2aTpUyIpBDq3BHKYyUHgmXVwZw55jkR4yamS3B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_232659_125301_B01B6929 
X-CRM114-Status: GOOD (  10.85  )
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

Add cputype definitions for Cortex-A720AE. These will be used for errata
detection in subsequent patches.

These values can be found in the Cortex-A720AE TRM:

https://developer.arm.com/documentation/102828/0001/

... in Table A-187

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 661735616787e..b10eba7f52476 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -96,6 +96,7 @@
 #define ARM_CPU_PART_NEOVERSE_V3	0xD84
 #define ARM_CPU_PART_CORTEX_X925	0xD85
 #define ARM_CPU_PART_CORTEX_A725	0xD87
+#define ARM_CPU_PART_CORTEX_A720AE	0xD89
 #define ARM_CPU_PART_NEOVERSE_N3	0xD8E
 
 #define APM_CPU_PART_XGENE		0x000
@@ -185,6 +186,7 @@
 #define MIDR_NEOVERSE_V3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V3)
 #define MIDR_CORTEX_X925 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X925)
 #define MIDR_CORTEX_A725 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A725)
+#define MIDR_CORTEX_A720AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720AE)
 #define MIDR_NEOVERSE_N3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N3)
 #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
 #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
-- 
2.43.0


