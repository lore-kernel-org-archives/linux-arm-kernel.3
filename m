Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90290E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 03:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUmcvK9L4U2rvaDvmfPJpH0OTH8JqXN5kshonLki2gY=; b=VvPv+ycOejDXFwT3Dbr0ipDrJt
	4E6UBASvhnTWY507skX0IQfvfJF1mjAdIf2OL5LxEvGq8nkOoY/ow8ItJooy5hHOAbWWHpOu5oJqf
	LDx4e/POAqILgassi9YledyC3cGmE4E6Ewr11WBbDJf8YwCHBs6mUrkfl+1+PdLpi7txjTbi1SHHw
	PhiTYq8VzBE+1rVOQfjszit54UTVAWT2YQeokjgptckIe1EpZ/j1AzkwgkUbsll97x1CnfKj+0+cV
	a+g7lPM26Qa7kfKu7NIwMGz/aice+GVckKaUr3BlV8O2pQvcvKldZ6IyfJymGC1BSte7wJ7CcniRo
	EYYtA5xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOyf-00000000QVS-2pie;
	Fri, 06 Dec 2024 03:26:01 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOxe-00000000QMo-1xeX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 03:24:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBmP/TQqCGL2hXC6lzMvzp9GbUwAuJsmHAjWyPT2lv8MVntwpzhGg9vrvAIbYQLpXbvQ8XhDFdgP4NFom1wzkUX4fWCJ6gddM7IfBqILDheA9HSnTWOdu+JEtBj7bO9Ri6/AoHKgAqwbpCvfbW6Kq64vbFgh3RdhY0pt9t6ykI8zcfPJmVB5edtLH9cAH/MZ84ROylF0NIDTh5d8wncUCEheRWMm4lUAE2Q5ohdwEdullTS8pdIysJ2RjVu9jeIe+XKlfAuDmQSkRADmcEacYEt9AdF8kRN+I4QD8jBSMAhNHbDunesRuJ1OjEf75rfgdesMbtmV+aneet/dTVE+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUmcvK9L4U2rvaDvmfPJpH0OTH8JqXN5kshonLki2gY=;
 b=mHs5jxmHVCqtrU42GckHH94Cv9GDb1wtC5qWQuWvkzxbfTFLuQow09wGjJSuS8vih1kaOjiR1hXNjE8KtcVvcjmGhyOa+RidAYaN5Ir0UqOGAKwJt8YjvrxgIWFgZyN/xcwjIQWiwdoFdQMs9Cp+xRchSy3UL5lLqRqRgMesLN0ddmOv9m5KJ3DyfyXlzvmM8JPYpckCBBYf+uIzG0jgwl53XCgxKdj+SZl3hjOPMkR3fOvHXUZiA6gL2I14dx+y2XKUL2z30adsTR1Wx8k79hITOxMy6xli2IMQ4f3Ybz+1BzAPPGfOrjyb4r7BfmD06RJv7wd5x8ah+U4eduRqKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUmcvK9L4U2rvaDvmfPJpH0OTH8JqXN5kshonLki2gY=;
 b=gYkDwIvxscmyhcO8GfMWkgZYLoN+u6jRsfFJBuBoslYuxSlrNU8mZdSIB38bslx/HZQ7NOiu4OGGsdUGfXYD+8ZcQX/CgFIsMNOtrho6fAhaeCVRKqm12dCwDsWD8ZNcQ7ZIWcD5p8870+MCOh6IPDBSVvYRZMhKHocxBhjl15U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 CH3PR01MB8340.prod.exchangelabs.com (2603:10b6:610:177::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.10; Fri, 6 Dec 2024 03:24:48 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%3]) with mapi id 15.20.8251.008; Fri, 6 Dec 2024
 03:24:47 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: patches@amperecomputing.com,
	cl@linux.com,
	paulmck@kernel.org,
	akpm@linux-foundation.org,
	thuth@redhat.com,
	rostedt@goodmis.org,
	xiongwei.song@windriver.com,
	ardb@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	mark.rutland@arm.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Huang Shijie <shijie@os.amperecomputing.com>
Subject: [PATCH v2 4/4 fix] arm64: add a new document for the fine-tuning tips
Date: Fri,  6 Dec 2024 11:23:43 +0800
Message-Id: <20241206032343.6357-1-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241126085647.4993-5-shijie@os.amperecomputing.com>
References: <20241126085647.4993-5-shijie@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::36) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|CH3PR01MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: 95cf8766-c6db-480e-3c47-08dd15a5891b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6iAgD0qn9MyGjX9Lr+y64NnQdphgkeag1Zf0JgYlmJgmIEaFz7i4XasqSW7i?=
 =?us-ascii?Q?sRRdVHhgJL2Ks7U85CfI1q+b8fl2NUmgOyE1q6Nc0LtTj0IPpr2/y1SVgwl0?=
 =?us-ascii?Q?seD4TI30t43f5R75cweJovLTZ2H7rKk3bxUH9e+r0kXch9Q/BRS3Jcwt5dDU?=
 =?us-ascii?Q?yrLD27E5Xx88rsmo954VRzThW4HrgYhhADvl337ASDTZCQW7hiCjjlhMSxT+?=
 =?us-ascii?Q?+ItakaTzLQAiWCNBBTe7Cz0eU5oT+AgQ4A4nYCJErPf8k+gNVyaDj0zxj0HP?=
 =?us-ascii?Q?i7hqRS60jssp7mQaZoGFtY1+Y1uyjfvOY2T9ySobLTGnFYXI6A5BHUzTsx6X?=
 =?us-ascii?Q?+0saqa6ghY9DF0sTmvjW8yzjLClXOFyaWdMtRqMdeEu0rNIXJkQtoLugB+Em?=
 =?us-ascii?Q?CnGpsZD/fVDle6ejB/fizkhRNgyVJZ/PWs9ih2hrevsQG/WK1H3wz0THiCc8?=
 =?us-ascii?Q?KJCuAVm+3IghBuunePXpEBUXujZm5PAv5t8il1mYbBm1iLtctrB44qH2rxTw?=
 =?us-ascii?Q?PbG1N1Mk9hDRK5LYhbMrgjnkho9mi+WXciM4QkDXU3rs2z7XGKwWhra7JQU9?=
 =?us-ascii?Q?SXILvbyL9k3HzTuawiD3d/rpxKqdIdWyx2ZvI5uKM6lThRNNQTcD/iDOag9g?=
 =?us-ascii?Q?f9Jf/BZm7jThbTXlXYR/Zr5rDJcjR01bfLmJZjsKKQ8GYGlybVfOhzfh2dd/?=
 =?us-ascii?Q?G8xJANBjdUCDQqmOLdIRSerTLN65MUd4b7RhOraDvp9CRUGI2ZdkN7wl8lM2?=
 =?us-ascii?Q?Bx3NYqmHM04B8Zsa+M5VHMd5IXSZ+zRyDEH+NBBpOrLRzwmw3vtQcY3B5hmW?=
 =?us-ascii?Q?N0Rrly+ON/9DJqpbIufGKCVNQzz8Wvi8hIT/3CJAo/3E4pGEVWyH8VdkP+Xl?=
 =?us-ascii?Q?G3uLYVhx8UG+ZbJ3abcvfkJZD2l0x+jDL/vGqhqZ32/si2NKiF4DYdABv2+7?=
 =?us-ascii?Q?ozWUCNc1mO7ZRQNpGHNU2i4N27kUP3J9/bCeI32YrTSICA0+lWZCsiD2NOm0?=
 =?us-ascii?Q?UOE90Vu/i8U28cJQv0SxK0UDEYjtr2VZTwJQZ57mKXCA8LJLTpAHnxWbRnOq?=
 =?us-ascii?Q?5quN0INVMRX0t8d76Dy8Cvp/i0IKaXSZSuBpstCd77vQvrT9xZqTEnvE56dk?=
 =?us-ascii?Q?09xckP7HVARKnJBApJ7IL9XcpjgdR0qh9/7RlYNKehDaO4EVbXvFJBqvaYLy?=
 =?us-ascii?Q?vy8u8BCmU0SvmKuV6xY/VfdHnZL5i1+hdCIw7sc7K9TTS1KhTn48VJcHMRvh?=
 =?us-ascii?Q?tPXPibnG/sxgh03bvqMjbF50mW6u5J4LPI1qZLgi/tpLY6y7YYyfnENPTMPK?=
 =?us-ascii?Q?R8of4Xxb3oX1s/K/3Lqft1F5IidJ5BRc0juG9TJOlTscUmJRU3+MxkgF3sst?=
 =?us-ascii?Q?dHzt3a4Uvq+Fa7mHX2uS4/fPEK55x3uv0g02mI36xxKLqsEzGw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4NZrxc5D1FNfp/29yvhIZxzCxiUSVJhf9oAdV2W5PJEYT5oHQfk4MO2WzWgk?=
 =?us-ascii?Q?sdkZ5B+dnCOlX0xJP79Uek1ziy8inyplzu4q26PH73qeu8BI6uFeFEMAOqAE?=
 =?us-ascii?Q?kEGnobxwvXKXXYpFTUAdB68V7V42NiIqhoZWr4xBuJKJJ9NBUZXEQ36pu7aj?=
 =?us-ascii?Q?pMnuQNKQ2Wiv7bu3/yK7vRSvL2Vo73d8Ix9WUduOZ6incWJamMw+gR1fFykd?=
 =?us-ascii?Q?j49oat5FteasalmrWVD6UhUjFgvJoGH8RQyHDLaIGSj+NnnP6/IRTY1lVSb2?=
 =?us-ascii?Q?TmXMEIVbe219k9uT1ganaLBKJyOkj58PUd/4yXh/C6gOCDI8TLb/rYBMlgXD?=
 =?us-ascii?Q?QBZM9whlEQ1fE8XTk39Vqv3zFLtBQd9TeztSMnszvwtFBBc4I/uAuJUQ4Xe7?=
 =?us-ascii?Q?8TXjBTUN0D//lkM5oyiag7xBeZoRriQMKYZD3GePC42anTZnqr05NkM2JvHn?=
 =?us-ascii?Q?o+iUZ5bOen6gp2J9bs9b+fUJvji6Nm/P5PkNfypFmbhMM0pDExBDRmkbbh18?=
 =?us-ascii?Q?7/KQ5u5k2EyP9DitrIkcUxDRd3lkSaJ53hHGC/f2W9feeV/LdSSusz3/8E9e?=
 =?us-ascii?Q?CZAjpl03w7i/eFuh2HadOfOVs/+iKhtIL8wly7zcu+EBDWp2TDEocGTg+WUt?=
 =?us-ascii?Q?Ew6GBDUB3Lh5C5xnC3/A7gUvy7CxMaThXEQv66gZ5oDiStylUJg9JaR4wkNC?=
 =?us-ascii?Q?wGy3v20s3N8YgxQHefu9s+kDso6/IrT+9OKdOwEicFpEkZC5if4IgRN1ayUm?=
 =?us-ascii?Q?QazBvW/efQ/M//SsSpvJKBPqsE1A9WKNTQd2eS5wRM+JmwaHZvPWgoe7gX6d?=
 =?us-ascii?Q?mw/CBAuT4e5QmmjdV5uyx+PURTV1Z2w//7NwdLPZ3dYy9QfsjE1giZ/jRxUI?=
 =?us-ascii?Q?yi/LCswXrr1wpGM8CV/XKW5jApq/P7u6kRxWBxvB5ye6lADU3SVFpkI8R6Pn?=
 =?us-ascii?Q?A9uaZJn1RlxEIq5uFBCwa9lvLc94n4HBe0Ml3a+ysn6IE2CeYW7zdB48Ke8J?=
 =?us-ascii?Q?PXLNrSIC65KTbwFOc/e0tdU3i8rFGH8gwG/Wy8n1/LzmrQ9u4yIjst0BIbhr?=
 =?us-ascii?Q?hHO2hhHL0JMS97rSAZadZOSfd7YoZo3EkpK9aLJ965s/vt0tE6CPQse8c65m?=
 =?us-ascii?Q?s/eUh1fgZFUDDFJjs4iqb0gJvh9972EKYFi2MzRunolr11wBQYFB5ihTRlPV?=
 =?us-ascii?Q?Md7HmZC1xfy8iL4CjLzRc6c5rZXnwh3tCODjWk+ncWKBzNwySmXzV7wnCq2m?=
 =?us-ascii?Q?LoJZmDbrs/ty828v9QpHJsmBqit3e5k5pvSNTrV2SFUSFP4pV/8Vf8jluBgO?=
 =?us-ascii?Q?ZtrtObyYWLMiG2FIR2B+7h0Py9gv7wFOoEwDS518vHMbOid8dETKINDyU664?=
 =?us-ascii?Q?fIKol653aqEjLsINgWgmwE3fw1wwRG1c3iZeIFTP4z/eNlLMGL/ZpWYXRSzj?=
 =?us-ascii?Q?2U0xWWtNHsZDsg1foJmr0FZrvFpOHM5bQI6XsBch2gxcAHC7mQ1FKi6xm2UX?=
 =?us-ascii?Q?iUzKa6uLvaMtpdSa3WpdUBiSM+Q/OsaqTtdEuPcBv6kgSZjCAX5CAGbnL610?=
 =?us-ascii?Q?tRqUjd38Xxtz57KqJ9E2JrY+F48mnCP9bYhvPkLuCf6zgvRRrY2o3MhrkEZh?=
 =?us-ascii?Q?GCJUzsbxzmg6QVW6zX4HNGc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95cf8766-c6db-480e-3c47-08dd15a5891b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 03:24:47.6599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GNS07eY+7VE4AuKU3zeY9hoRu5aNtQ/n97yhOoEy7eCiTOa6nkVnJXikBDQf56kqU8K0lzR6FFErdrdpU8uTp1ipnhn5nkw+vtSU5jDe7nGer2YB4S2tIWiV4ikPshD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR01MB8340
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_192458_545214_0CA59717 
X-CRM114-Status: GOOD (  13.10  )
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

Put some fine-tuning tips in this file:
	1.) rodata=noalias
	2.) slab_strict_numa
	3.) CONFIG_SCHED_CLUSTER

We can add more tips in future.

Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
---
Add the comment from Christoph.
---
 Documentation/arch/arm64/fine-tuning-tips.rst | 25 +++++++++++++++++++
 Documentation/arch/arm64/index.rst            |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 Documentation/arch/arm64/fine-tuning-tips.rst

diff --git a/Documentation/arch/arm64/fine-tuning-tips.rst b/Documentation/arch/arm64/fine-tuning-tips.rst
new file mode 100644
index 000000000000..df67a5ac87b9
--- /dev/null
+++ b/Documentation/arch/arm64/fine-tuning-tips.rst
@@ -0,0 +1,25 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================
+fine-tuning tips
+================
+
+This file contains some fine-tuning tips for arm64 machines.
+These tips do not gurantee that you can get better performance,
+but you can try them with your workload.
+
+rodata=noalias
+----------------
+It can provide us more block mappings and contiguous hits
+to map the linear region which minimizes the TLB footprint.
+
+slab_strict_numa
+----------------
+In NUMA, it will provide the local memory allocation by SLUB.
+Slab objects will be placed individually according to memory policies.
+Increases object locality which is useful for NUMA systems using SLC caches.
+
+CONFIG_SCHED_CLUSTER
+----------------
+Some arm64 machines have cpu core clusters, enable it may
+helps you get better performance.
diff --git a/Documentation/arch/arm64/index.rst b/Documentation/arch/arm64/index.rst
index 6a012c98bdcd..36d1ef09bd71 100644
--- a/Documentation/arch/arm64/index.rst
+++ b/Documentation/arch/arm64/index.rst
@@ -16,6 +16,7 @@ ARM64 Architecture
     cpu-feature-registers
     cpu-hotplug
     elf_hwcaps
+    fine-tuning-tips
     gcs
     hugetlbpage
     kdump
-- 
2.40.1


