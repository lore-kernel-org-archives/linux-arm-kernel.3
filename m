Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69024E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9r5sdicYBremrqt3TUgIhLfWDMdGL13cgjPNhln4NI=; b=jWqtN/72xG92hZVAjsPckjrtx1
	b6NL+gEW2VlNBpZ8PnZB1N6SIMaymEx9lABU+nioFa+AM1gB2d1knLbK9obo1qXU+sWA4Q1Ocbq7T
	MaxujITE7zoPwJmtKatOg4c4XoPlEeT0zuc2y7LYu2JU4MK5jauDwhtYuf/ZKZ1q9LVczkWmAOHGp
	DlMa+e1n0JrEZzFeaOYbW1y6R91v46dNpOUQMRlBY4zhiPISzQQD0gbIv0z6xDzLrNnaxCECPoq29
	nu7SSz/j8HCeWH1zIX7tRVaW8iPHPbXvGomSZAK6xICtPqsnmfXixZY+1lcsu6jrcwSaK9G9WnbBZ
	TsauuEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRxQ-0000000CZl6-2eIx;
	Tue, 17 Dec 2024 07:25:28 +0000
Received: from mail-dm3nam02on2070c.outbound.protection.outlook.com ([2a01:111:f403:2405::70c] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRqv-0000000CYQH-3aWQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 07:18:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVeIsDJVN2sH8OVtPIit9gtBLPhrcehboTuvW3Wmi9SpDD+vFSMBOEqzML3mG/riMlnuYxec1nGpPHZEkkKrD3XuYiyDtI1EAIJt/e5EoCp42s8DYA0pdUJrgJxQjOVffokuigOjvgRhtmykq2s84P4gSDcHNKsVeqUplU6pTNMrtXGKqoGaOX8cf+qkIPhw9OhUVEMEEwD7ABqA0n6Psa1DqfwnRWmPF85fkgrW/bA7JDrPQ4UqXzKmlgDezLZxpVRCHOBuQoT51DNzaeIhQgMzxVuF3IccT42q60QQbZAxTT6oP1/mtjRtUw+k1ZrnIKpm0EhtkNHIujmw8V9GOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9r5sdicYBremrqt3TUgIhLfWDMdGL13cgjPNhln4NI=;
 b=oq93UeWA3rIjLWKg6gQVgjLwG8lRwPt/Dee3osnJvs49mcd68EpxsbY1Y4k/xcxSSDRiy13yNzbpBK9Nr88FCnAe7eh8k3iqOr210gTjnyQH/mW1Q1q0mAmOTwx17xlWEnQf0KfGPixs7BRVckXEwhPfNdeFUeL47DK5B/xDi7HZyytKAQ6t4X1azrkKcKts+1lcKMRU9jIbyWaBcUwX8u0Uemf0R0kiw0jMEP1SthVpC2Z2nK4svFowfCCunKKODQ6GNsJSQy662m6EdaHtK5Z2Z39t+GckWURUI77vzbFawyfjTnF977lgU0DkDK56b1Zhld+/5usTdfxZwr+8Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9r5sdicYBremrqt3TUgIhLfWDMdGL13cgjPNhln4NI=;
 b=On+tTvRUy+2O1V8FQV+HCezCGb+i3fYN9+tuuT/nJh7dKGZDR0osp+dP0RN9NJZE6BJKp2UMvvDlLhzSI+Bzb7KXhgOGS01ox24dW/JG3EanBYUPQ9Rvu/cX7oMcqCEjK32wzaij4IkZhsMCmpsq+Hc7Ll/Hh1dzYtiKErQYH/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 SJ2PR01MB8433.prod.exchangelabs.com (2603:10b6:a03:55c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.11; Tue, 17 Dec 2024 07:18:39 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 07:18:38 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	anshuman.khandual@arm.com,
	corbet@lwn.net
Cc: patches@amperecomputing.com,
	cl@linux.com,
	akpm@linux-foundation.org,
	thuth@redhat.com,
	rostedt@goodmis.org,
	xiongwei.song@windriver.com,
	ardb@kernel.org,
	inux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Huang Shijie <shijie@os.amperecomputing.com>
Subject: [PATCH v4 1/2 fix-v2 ] arm64: refactor the rodata=xxx
Date: Tue, 17 Dec 2024 15:17:15 +0800
Message-Id: <20241217071715.24797-1-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241212082426.4110-2-shijie@os.amperecomputing.com>
References: <20241212082426.4110-2-shijie@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::21) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|SJ2PR01MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 60669f91-4ac8-45b0-cfe1-08dd1e6b04f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vwemrCQ2bsDPPsL93t+iodsjCmNvftPGUd7AHbSdR3LChsNyRGwGS7jLpGXQ?=
 =?us-ascii?Q?PVj8y49KueEqrm4E+4FWODBiAPQF4KeludT9OnjQC1p1GuOF1TWqhr5VUqGx?=
 =?us-ascii?Q?8KVDnDizRYJjGCpF5C6mAj6GAHPpZLCtpvf9yXwG4vKTlYhRSlb1VN/prVYm?=
 =?us-ascii?Q?L44AVDAPkvvn1p3pKcQ8C5NA+trZPLk7W2nY8nD28UtQ3Gr7Vs76U2c/m3FB?=
 =?us-ascii?Q?peazvTn1jVf5nNZl92FJylPTALM/PXbDB2hKJqr/Pu19FYDq6ZPo8X4T+2wx?=
 =?us-ascii?Q?np2xsmunTj61f5pIds5plL8IRLKu+k7FveA/OgrAwoa2JtoatPMMDG1eM9+E?=
 =?us-ascii?Q?lDuwHKyUaCq+XC4ySOfXpEMmRXX3lHWzvTYaT0Ekqf8gFjbDFzD8NWQd13LW?=
 =?us-ascii?Q?S1w4YJ5dXT21TgjFGJiQFQF11hQy5tnWfI5oWvqTdf5dw9cgDPybxevtCsnn?=
 =?us-ascii?Q?IQ/SXdukjxWeCljLxJ/3IgDOOfAHgDxluCY2eo3cyVEpN8uUm0dQIrH+cbHI?=
 =?us-ascii?Q?Vfj7QW4W9LT+4HGDqAeU9M/ZAeSrepHo74+gi3G171N5H2wxqjVGw3B8hbtg?=
 =?us-ascii?Q?n9ks0sn6GBfonBHGG84jWIa66jLsQ9mz8lJfYDzg6sFKUyc/Ca0ka50iUtdb?=
 =?us-ascii?Q?/uXRy67/hD2Mn8N+1R3q7STpOZgr3/QQO64J9yP3JD1oi6taAhJm50KtPXBG?=
 =?us-ascii?Q?AfWAaWvI2i9e26BClmecygRQuzSPmSVsO8ViDOCIAw8TlpjeuRDkfCaYwnCx?=
 =?us-ascii?Q?KXMxJ0yhd7LQrn1HYUBnFyybfMxbIMNWoud2fLBoQ9r4Wqdu+SOEKJHgMi9i?=
 =?us-ascii?Q?2cvLi2XnNnwl/bi7SAENpQCwdVeSyJCHYqcpFL48m7rDrqvXHeqEzLiGtK28?=
 =?us-ascii?Q?D0JvJG4mPa0A6mCk/ehxIS+KeHjWnbaMBVVLI5F5aoAgqGTAfDjhdHkZ3smy?=
 =?us-ascii?Q?EeImjwSqyi/s48B5Y6zg8v4/cKoCWxA42RnUaFF1ytiuF5ce70KNwhEpegKz?=
 =?us-ascii?Q?vw/6SbDVqk+3LmKe18+R95L3I3wnNqCG2cTkdPz6UnhVNdz9o43dZY/7AvJx?=
 =?us-ascii?Q?DfGXOb8umduNR7NFUD4WHV1iwxi75gOn/Forx0L2+05pcEXK+HP9wT/UxZfY?=
 =?us-ascii?Q?tNml0OIYC8n2dqAWd70wgJK0Q9xD+GM1wiujrDZFLevMOJPnRDi6YSABrdRU?=
 =?us-ascii?Q?YsIeK1KrcY7RfugtylLRZ/zqou+pvpe3jhYL4EW3ZEJdDTadKSgLWmaRGF0+?=
 =?us-ascii?Q?M60O0WRX/RHScJjL6noKkBqDOD83/tAR3Ak/68cjScjzD7D8l/PaB2GUOHzI?=
 =?us-ascii?Q?7uSwdAguSIO3L1XMdrH5BgcbjaD8xk8aoS7XT6JyQyGTsOQNQJ6xQYBn9lG4?=
 =?us-ascii?Q?KW4lZ4kehWCDl+3gdDZYbho+ZaDKDmqAitfgIeL5xet7drgtA1oO2dhlAYcI?=
 =?us-ascii?Q?qU2bHI3fkvEbWw4f1Ruz0blqA9AR7X6m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pStcTHGdOM1yZB/hcTlunTOuYze/iNx07bye6uVKKZ1FjtWmk6A8RvAUqd4j?=
 =?us-ascii?Q?3axZJquHqc0j7xdjTLlwCNlkeqMbtgXVBT5c0EfQrVrltNRn6XS3+umjQD01?=
 =?us-ascii?Q?UJ4BsnKAeATBFsiWFPDwBpE3ev+WJgLRiaMy/iZ5gqsaiiywGdMYVs38PGaV?=
 =?us-ascii?Q?JrV41mElQ+gTTYBiky85DwoKK/S5D8Alg5C/PBtcGx7Aa5QCVkV8x9LfR4x9?=
 =?us-ascii?Q?diFpRAqvl+x9IZZh63Lc5U9VSv5iEJ6cZctILrWGW/SNAQQCjTUaUawJTH1s?=
 =?us-ascii?Q?Xsf2SZfJbIROFQQA4WKnY5gTbG0bQCxopVat9YhZwVS1ph7eetonvTQ6K0so?=
 =?us-ascii?Q?bbd/qfR2uTMul9w8XephZoWcnYout0cOtlNefkPoh0CZCD/mR3bUDkurXZC0?=
 =?us-ascii?Q?0nMGbzHWxOzh103Al4A6gpEvhIgAtNj3gFQA20I7sqGRY32DkmA6J2Nk5dT5?=
 =?us-ascii?Q?mm1E4yGlCJ81J5ATysiMc4A3QJnAzqdVIGZFTACnJhaw18Q2Ht2Pd2GGNz4w?=
 =?us-ascii?Q?yYKtcNUIAEi8lNc+GGOg2tefpFaXdgM1TCDYWj0qX94JnTncq+nf5Tgh6VBP?=
 =?us-ascii?Q?sa4LodPwvNsyV4aeWG2m1rxmT8xtfUtyTXK17kniL5Ds8h3EZG9hcJQtpllH?=
 =?us-ascii?Q?D44nx4WbjupcmLpqUiMi4l6y68Js7JGV/gUTD4nyyChQF/pyU1Uk17Vfs2f4?=
 =?us-ascii?Q?pK+ByvB8zzrmTN/L47m1BDCCrfnkGWAS295BKDOmebANQM337PFEgqopK3Y9?=
 =?us-ascii?Q?oLFfwD9KPKKnsSYfkNeatMS+Zvb6bxqA+Hf+bAXr7hmcJRRlSJK70tT9L4RX?=
 =?us-ascii?Q?5fk09gjFpzlGyVG0jSix+If/0vxvqx+A0+Xxsx1wOdjHZg9ZCJT0KFSXFsAj?=
 =?us-ascii?Q?+fArhZlQCyqbqhFI7l+3BJHVIAQO6gnqq6wc0mEG1rcv2pc4ipN83rJExWrV?=
 =?us-ascii?Q?YuQld2XcR5/CSB5alagAc9YKFFtlFI8dZjat9fiB3taH9r2BY9QvFJ2mwN09?=
 =?us-ascii?Q?Qf6+nJB8O0w2oj2TQbBZLASjmpBx/wSQMA7qEVbPHeI5f4jFD+cbt0ueQavN?=
 =?us-ascii?Q?nQulKTe4oOB6d7HFcGYkkzbOV4bgnnY8veayHFX06SgcQaOQwyoCOH5FeWvU?=
 =?us-ascii?Q?vVQ7YDqs/9Nzh5RTusQHJHaJr7dSwG5MlAQMbkoppH03nN2j9NW1eG1DSvhq?=
 =?us-ascii?Q?yXYw0k6goTuyk0EWjFpm96DI2BfKy+GVbbl3Cky4KVKuvSwBwosKNHXsEOgt?=
 =?us-ascii?Q?MiCoVB6XUIVM6RnjbxWilLuKXYuRvYOebGNIfDA8Yx501BO6u1QgQuDGw7JU?=
 =?us-ascii?Q?H6+q7Nn+mvvPHVf4reX7q5L/5aXeEb2duM+YpPabSpgV6rg/MSdGETthZe/c?=
 =?us-ascii?Q?+wTn7nEdJqyOD1F9Bjmf/0J2mvZh4LFTtZFiqzCv1Fu2KKOKSjM8YoM7t/BD?=
 =?us-ascii?Q?xt7FMJJkM3ZaFX7+bd4TWWhoadqfZxL1V7jlMQ7fpbk/hMD0qkvqHt587o95?=
 =?us-ascii?Q?9ShWM2vOjJb2dCi8mXKHanNlSvTO7cjJea2PKif57ZagBT9OECPoT+W/B6O2?=
 =?us-ascii?Q?LUkvXzIfoN9kwStnBgCDSK+v/BKIwtCdgyFfCM19dc4seyyRPvjLYFOfvobX?=
 =?us-ascii?Q?C10dYPa9PyAK4R59ReDCHVw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60669f91-4ac8-45b0-cfe1-08dd1e6b04f8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 07:18:38.8971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+/gBe6Cc+IzpKWurDlRFZHC41pQ+Rhjl5a+z+RZwFHfr0tlUQZW1WaTDTdCi++zdMoQXfbRuWxTlGyevBQ2NmzGMgact3XRGcNsHlK2SUISU5c9x06DOxOiq/VZ07lN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8433
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_231846_259963_C427BBBF 
X-CRM114-Status: GOOD (  15.07  )
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

As per admin guide documentation, "rodata=on" should be the default on
platforms. Documentation/admin-guide/kernel-parameters.txt describes
these options as

   rodata=         [KNL,EARLY]
           on      Mark read-only kernel memory as read-only (default).
           off     Leave read-only kernel memory writable for debugging.
           full    Mark read-only kernel memory and aliases as read-only
                   [arm64]

But on arm64 platform, "rodata=full" is the default instead. This patch
implements the following changes.

 - Make "rodata=on" behaviour same as the original "rodata=full"
 - Make "rodata=noalias" (new) behaviour same as the original "rodata=on"
 - Drop the original "rodata=full"
 - Add comment for arch_parse_debug_rodata()
 - Update kernel-parameters.txt as required

After this patch, the "rodata=on" will be the default on arm64 platform
as well.

Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
---
Add more comment for "rodata=noalias" in arch_parse_debug_rodata() from Ard.
---
 .../admin-guide/kernel-parameters.txt         |  2 +-
 arch/arm64/include/asm/setup.h                | 28 +++++++++++++++++--
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 97c497bdafac..639669324350 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6105,7 +6105,7 @@
 	rodata=		[KNL,EARLY]
 		on	Mark read-only kernel memory as read-only (default).
 		off	Leave read-only kernel memory writable for debugging.
-		full	Mark read-only kernel memory and aliases as read-only
+		noalias	Use more block mappings,may have better performance.
 		        [arm64]
 
 	rockchip.usb_uart
diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
index ba269a7a3201..6b994d0881d1 100644
--- a/arch/arm64/include/asm/setup.h
+++ b/arch/arm64/include/asm/setup.h
@@ -13,6 +13,30 @@
 extern phys_addr_t __fdt_pointer __initdata;
 extern u64 __cacheline_aligned boot_args[4];
 
+/*
+ * rodata=on (default)
+ *
+ *    This applies read-only attributes to VM areas and to the linear
+ *    alias of the backing pages as well. This prevents code or read-
+ *    only data from being modified (inadvertently or intentionally),
+ *    via another mapping for the same memory page.
+ *
+ *    But this might cause linear map region to be mapped down to base
+ *    pages, which may adversely affect performance in some cases.
+ *
+ * rodata=off
+ *
+ *    This provides more block mappings and contiguous hints for linear
+ *    map region which would minimize TLB footprint. This also leaves
+ *    read-only kernel memory writable for debugging.
+ *
+ * rodata=noalias
+ *
+ *    This provides more block mappings and contiguous hints for linear
+ *    map region which would minimize TLB footprint. This leaves the linear
+ *    alias of read-only mappings in the vmalloc space writeable, making
+ *    them susceptible to inadvertent modification by software.
+ */
 static inline bool arch_parse_debug_rodata(char *arg)
 {
 	extern bool rodata_enabled;
@@ -21,7 +45,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
 	if (!arg)
 		return false;
 
-	if (!strcmp(arg, "full")) {
+	if (!strcmp(arg, "on")) {
 		rodata_enabled = rodata_full = true;
 		return true;
 	}
@@ -31,7 +55,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
 		return true;
 	}
 
-	if (!strcmp(arg, "on")) {
+	if (!strcmp(arg, "noalias")) {
 		rodata_enabled = true;
 		rodata_full = false;
 		return true;
-- 
2.40.1


