Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1ADCFC29F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 19:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7TytkRyMnUib68wvvGKKkw7MuwUpYLkVw0lJg3UdQhA=; b=JlOdWlatwEce928LI8TxpBhs5H
	bxGrugSTk48Z72Vidx5MJCP02TZEoS21tYKDOjjghYPzpd+0LQUKgqrIcWifvRjKnA7RXlt0WUBXV
	eD8AccIxHOXfMED4W/60lwhxkrSROvJp4l/eaLEH/IHQoCJCJ0qwEP/pqUwCMHsL6Nhb9SMmYSRvs
	mg3QkfvnUzvruRw/e5CoqmxLWd2vIiAfRYP6zvEYshnZe6nT4peNBG7IiSjGZE8uasNJbkomvHsGp
	1ZJd/nL8HB4WB/NSqwR5npGiVqgYhbfTx5fdUvm9YQnpVEnLUwwnVmM1jkHsjemCez2OW/JA1CO05
	0YfUpmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWuS-00000008uLs-2P2c;
	Fri, 21 Nov 2025 19:35:08 +0000
Received: from mail-southcentralusazon11022125.outbound.protection.outlook.com ([40.93.195.125] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWuP-00000008uLC-2qrr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 19:35:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wv6N5CGTZg0dq8u0OCnQwYvKrq5wmiIIQWmRbwpTDX1ulPQB8ljt2eri7S2zLrhuHhnjidTyTNty3SPTocNef+83IU4nyNO11arYJLimU4wNfupiFo+J49OUnnJ2no2JmL0vK+PVGPvZwAQ20XhKNTFLGUgJw/JWpIGHLINKNQPlTZkdoI3+VxkdFZdDrxiJ56y61S2VhiG5TaOiJDs4OXbNmM5j5S05wZidzCgp+vFobqM7wpaDekUzTR8YezNClUaKHGMJv8iPWsoigcpiGuFtCSvfbFeGAxataf6RXVF+v8iAilyv3Rw4n16n54/u9XPYHdB/GmbOM5PCOM1xlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TytkRyMnUib68wvvGKKkw7MuwUpYLkVw0lJg3UdQhA=;
 b=AFgL7jv2eTV+H5JknS+JApWq3vrgpZ2NMXA2A51I35ph4JNR1yW1tB0eufV85EtxPfpjoC31+TMKW535Rob95zBWEPV57ptTVPOhlVtCxNpbocWX7LK+wT2Ukiphdor5prZMI08IfXsy/C6jlOKB105brmBTWeoaYGGuJbM3CeO7H49Bs6yA4ibbVvw6uXhykOgt1zkeORysdf9XCN/Gw4b6EdUuuC45Am1bFwWmOioznUK9ZHwFE8WdEbRbOIirlobCM3Et3ouITEQanVfqs0gMV6sho7WcL4fXpSWmeFmu/G4qKC4189wyU6iiF5iKdhN1hxOcs/jZvQnY/xTmtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TytkRyMnUib68wvvGKKkw7MuwUpYLkVw0lJg3UdQhA=;
 b=gLopx1TK0WjTHKtq+voqJbgGNqNJXN70ux3PG/q8vqo+08MlAfE6tofYAWWsMWytiDw2d6TToNnqSUwT71zSFDQM8Bwkn0X6WSW7e3nPi9hS22VrCzss6Swdx65qDVOkRCrSCFgdHUtAJ26/EHpU9B9esrn6M/joyBEvViNZjlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH7PR01MB7534.prod.exchangelabs.com (2603:10b6:510:1e1::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.14; Fri, 21 Nov 2025 19:34:53 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 19:34:52 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	cl@gentwo.org
Cc: yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [v4 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Date: Fri, 21 Nov 2025 11:34:37 -0800
Message-ID: <20251121193437.2147939-1-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR17CA0020.namprd17.prod.outlook.com
 (2603:10b6:930:8c::13) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH7PR01MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: aa951a91-1626-4e3e-9caa-08de29350ac3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9H3YJtOzt29Eek3y3OQPlF5JQ4ho84d9EbLNgzWgGF7B17aHcm+/tqGjzfEq?=
 =?us-ascii?Q?Sq5tjChCYfp6V3zdhDPuV6bc1MOvs+KPmvzELQsqpAVY7u1s+jV4Ha0ovuwc?=
 =?us-ascii?Q?lciVORUVo5KoktOPRhKee1gy5l3y5Bpr8U4ZStKTRKiYdJvcETFOr1iTfx1l?=
 =?us-ascii?Q?O22Xq9rSZccniPl7mYNSipyTi7PlEaK0Bt3KHQevhsPyDl3ofsdTvhWa3l96?=
 =?us-ascii?Q?sJEkzplY08Gk1ELJ0czqdaScOAnpb2XKPZLRPnXIqwYeY8QnQVPe01az0JYS?=
 =?us-ascii?Q?dabxqF94hG96VI5JPOqdRmcImv6MqK+OgZ9pFgy2+KyRZqQyZJRrNH2RwMgW?=
 =?us-ascii?Q?9hS8ib0v7Essn3Js2oATS0MV0Vda+cXDUm9wSftqX++ToFWl9F5FJWyJf1XK?=
 =?us-ascii?Q?uncFcuZNJO+DnO263UC49ed9Ya3aRVdpsrl+Kk3nAgX6NYJArOtx0WARYTHB?=
 =?us-ascii?Q?C/cjI1qY4+siZmeJAN7RfPecdKXvkVg4zganbEWJDlCMslhLJm1jOd1Xvtvc?=
 =?us-ascii?Q?l/hF3ZUYly+oUw8Vhqv0dNCHB62+/ISvb+iYxyBOB6YhoW0i/E+ZwMNzmGX9?=
 =?us-ascii?Q?SHqvFuDPC/6sQ7lSXrajhpdP340KgHQpBud3Ctse/UTWLLg5hgvXJcrHFfgf?=
 =?us-ascii?Q?A24MHsdGDnKFJTb4B/YarSk8uMA8onwHp5uptBR2a999yqZgFmc6Dd/N9YbM?=
 =?us-ascii?Q?MaMNlUOdaoZN6Oib58cpw601zV/lQDe2bloyrGi4KtzaY6T/w1B4qPxBAiHE?=
 =?us-ascii?Q?YhUWGWVoHs+jN4WM34qkxtkBadJ/Q2tN5AmN0O2bDDkhUepeAZQklMqc93Bw?=
 =?us-ascii?Q?lNSTzuwzR69zHaA5EkF/pPn/QVcBv0Ffrmg/Pk0+k2OeDk3WsVoIJp7sqVvj?=
 =?us-ascii?Q?lt842ffRZnwQNBfTRcKmGtbhsD/pWf37nf0zCU/wMoMZktOhN710En1WidT+?=
 =?us-ascii?Q?deXrzpkQgf22OOm+kKr9UA+Wxc3J5iprApttLlSkv2B+cKxmGWcbEnQCmUUd?=
 =?us-ascii?Q?UMxPdLzn5kgWHxELQanLlfERWf3F0OYhUKf7wKal8QjOeY8zeKbilEDmc1NC?=
 =?us-ascii?Q?4Qj6zSsED0v7/CAivSNon6Fc8pibWwc0b+rRmb4qAQiXBIcoB7sM5oRR+Rts?=
 =?us-ascii?Q?JpERFPeXN5C23REgLT7WkL5ncG5FfwiixU60KtmlKvFLLhyUTkBOWoYz9bHT?=
 =?us-ascii?Q?HZlyr4V+2PI3f7nBvhF0OTAf5A2F9Y1r0ZqWWL5AyaQ9FM52ESwLvKo35Xed?=
 =?us-ascii?Q?fJ3YT2BJcTbhyvb5T+dBWnAzXCdCkXv9I7Cp8HP2JsjYbIWssdFeAcmvmeLs?=
 =?us-ascii?Q?lpBjL4CAmcqJDxr8mQ6F0HgPbH7TE6IBu6b8TJLGbR3na5Rn84LQIRwvl+Em?=
 =?us-ascii?Q?oneX1PBZgGLoA+WKcjD9z7gmX4cdRw8LBgK3SnTeQj7j+G8W1Xowq2zVHBR8?=
 =?us-ascii?Q?aeuBYmweQ9+fLI70lNJh+bMm6RaeG86DIney26d/c9mY6JLuG1iia1oAlN+/?=
 =?us-ascii?Q?5PSJoDNf4eMRm2lMV3By6IBHj6T/zmcxnoD9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WvVcHL6vE30VTGtIzofpWrNh1I4hJrenRsuFejPciGdOx2TuYK02t3FTeo2Y?=
 =?us-ascii?Q?3jx/oJLLcTzVguplinVf33duIYUlNXTpF6BXedSSHQLcsHwAnNmrzmpeYk25?=
 =?us-ascii?Q?N4REXwuiov+pzs3WLCSI0kijRzNreO6ZgiRzqyMCpmI8qMnj08z3S4DEdiSy?=
 =?us-ascii?Q?pZ4rCl0AnyCyXLzSkKHEk9reZKvpz0B61JXK8gw665oDwY8VsoN1E2TPMm60?=
 =?us-ascii?Q?MNmn8RqXUhmB/KqrtnSWROdmV6Kto7gRJOQe1Ox9hUxSK9oI2rs/vr3VlTGa?=
 =?us-ascii?Q?iY5vH+dNGLI5ZlcqhoWVzytka7BUYkptreUaYlOGkismJ/sZgBpY5qY0hksA?=
 =?us-ascii?Q?dS/Yvbz6CeZbSYR6sz6JFVgBQVOi8Hzs2lnM7Cwd0iVRRecCesTldvqHY8Kz?=
 =?us-ascii?Q?69rVkBsKTWbaourpchl6N4SbiljBktzi8Xdxko0kCAjbBLt98lv6rjuBb4tP?=
 =?us-ascii?Q?48OHiHmjJOZ/Bgykka7MnyDpeCwSJ67mn1rLK/RGxKPGtPTp5jGDTiVRRBON?=
 =?us-ascii?Q?3lwR6Kfixn0sfDk7K92gVnsiRBhl7zpEbMfiXhJBsTIarbNxilD5V3xxCzbH?=
 =?us-ascii?Q?0GK554zK7V3+VEYAd+QLgh/ojYZG58SIA/ROalSOflpSkR8hrZ8lUcF8dnqo?=
 =?us-ascii?Q?ZDm4K/LD6ubrcDjXskAnU9XOlrVGf/3TxlzwcFBVu+dTPH8cqCXORAt3BrTj?=
 =?us-ascii?Q?IoCBljbmj9a3CGHBhdEVlcMPFj9uG/0d7PSkpAnfDLrnvCoVHGjL9WdGxXNm?=
 =?us-ascii?Q?YOshNzPijGTlBBXrNkFHLaCBzuYb+80MP6A/7ahHYxgnz0PEI28cBm0VyBr/?=
 =?us-ascii?Q?pq09MxoLNudSwC71GKooqBQcSgvzvk1G50ZUupYUQv7W3h/N7m3OJlY4ngtJ?=
 =?us-ascii?Q?IMRi4BVMcZekDq/qyAq7FZdzfWONmJlc56s7fJns/eLX+ZP5qCFJP8fnhljt?=
 =?us-ascii?Q?kaCpkEqT8JtnKqbv973+SwqId7qSKj7kOnvyyWrda3yU61C727D0H3ZlDMK0?=
 =?us-ascii?Q?EOiisP/xfMsvGpd/Ysjwwjy38ukXN8DZNfUlPQqDUASu2CCVXk3d9JGalcUo?=
 =?us-ascii?Q?jKP7Tw3JIN15xzPbUmgUOLBu9Gi5xQVx2MbQDFOvQgPJB2SDBhvSpX/m35db?=
 =?us-ascii?Q?0nKY3q5OLTLr9I4um7yKjPohDXLQUXDx9Xp0n6R8Z/0al/0IIwpCjlAJlt53?=
 =?us-ascii?Q?VbvIlliWhoHUIvn0SV6zOLDtwCliveJHImqB0O/d0aRx1W7agvL9rak52mso?=
 =?us-ascii?Q?ujXlBwYc2G+Kdq7E+GARe1Eo5S6cfgEaDnxr8fJUH6pmCUxKuhUu8jZIzQ6E?=
 =?us-ascii?Q?7K64yoEpDZNZGgtTMPX+6J0wRYRwWYkvyRvNukf4xRYvBngSTPSsMohBUI0s?=
 =?us-ascii?Q?DxJPftOtYeLw2pY3TTR9aMxypCuFGLOvfc7JTz565E495tSPwVg2jnd32eSA?=
 =?us-ascii?Q?5gk4VYfu0h2TLdAtlskTFI4KRWN4XJkSYK02r1Uq1uGeCRXaTH9OXR3t7FpV?=
 =?us-ascii?Q?TIK1yWf5meWbg36tLwDCNvoAxz4BERp28xrFkKobxfEoD15LTIBvvDmnT8Bn?=
 =?us-ascii?Q?OOt2RHsgJYUBgAHqOpqtPuim85qU1ft7UzEudkK/P2ybZXkt9ygTyYUMHaOh?=
 =?us-ascii?Q?Oie4mXk7EAVTlr7Hhq6vRxE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa951a91-1626-4e3e-9caa-08de29350ac3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 19:34:52.8648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2Skw3iogW0Fl9fe2crUfbiIPku39DN8QMzONrBu83layy0gyGp83fbTlFWWxhD3PcybOwu0RE58o5Hmli+bPq57wrkfY2eluZuxC1unJ+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7534
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_113505_892157_7F367C2E 
X-CRM114-Status: GOOD (  21.60  )
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

Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
rodata=full"), the direct mapping may be split on some machines instead
keeping static since boot. It makes more sense to show the direct mapping
use in /proc/meminfo than before.
This patch will make /proc/meminfo show the direct mapping use like the
below (4K base page size):
DirectMap4K:	   94792 kB
DirectMap64K:	  134208 kB
DirectMap2M:	 1173504 kB
DirectMap32M:	 5636096 kB
DirectMap1G:	529530880 kB

Although just the machines which support BBML2_NOABORT can split the
direct mapping, show it on all machines regardless of BBML2_NOABORT so
that the users have consistent view in order to avoid confusion.

Although ptdump also can tell the direct map use, but it needs to dump
the whole kernel page table. It is costly and overkilling. It is also
in debugfs which may not be enabled by all distros. So showing direct
map use in /proc/meminfo seems more convenient and has less overhead.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
    * Used shorter name for the helpers and variables per Ryan
    * Fixed accounting for memory hotunplug
v3: * Fixed the over-accounting problems per Ryan
    * Introduced helpers for add/sub direct map use and #ifdef them with
      CONFIG_PROC_FS per Ryan
    * v3 is a fix patch on top of v2
v2: * Counted in size instead of the number of entries per Ryan
    * Removed shift array per Ryan
    * Use lower case "k" per Ryan
    * Fixed a couple of build warnings reported by kernel test robot
    * Fixed a couple of poential miscounts

 arch/arm64/mm/mmu.c | 202 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 181 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 2ba01dc8ef82..9ca49ec9c09f 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -29,6 +29,7 @@
 #include <linux/mm_inline.h>
 #include <linux/pagewalk.h>
 #include <linux/stop_machine.h>
+#include <linux/proc_fs.h>
 
 #include <asm/barrier.h>
 #include <asm/cputype.h>
@@ -171,6 +172,85 @@ static void init_clear_pgtable(void *table)
 	dsb(ishst);
 }
 
+enum dm_type {
+	PTE,
+	CONT_PTE,
+	PMD,
+	CONT_PMD,
+	PUD,
+	NR_DM_TYPE,
+};
+
+#ifdef CONFIG_PROC_FS
+static unsigned long dm_meminfo[NR_DM_TYPE];
+
+void arch_report_meminfo(struct seq_file *m)
+{
+	char *size[NR_DM_TYPE];
+
+#if defined(CONFIG_ARM64_4K_PAGES)
+	size[PTE] = "4k";
+	size[CONT_PTE] = "64k";
+	size[PMD] = "2M";
+	size[CONT_PMD] = "32M";
+	size[PUD] = "1G";
+#elif defined(CONFIG_ARM64_16K_PAGES)
+	size[PTE] = "16k";
+	size[CONT_PTE] = "2M";
+	size[PMD] = "32M";
+	size[CONT_PMD] = "1G";
+#elif defined(CONFIG_ARM64_64K_PAGES)
+	size[PTE] = "64k";
+	size[CONT_PTE] = "2M";
+	size[PMD] = "512M";
+	size[CONT_PMD] = "16G";
+#endif
+
+	seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[PTE], dm_meminfo[PTE] >> 10);
+	seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[CONT_PTE],
+			dm_meminfo[CONT_PTE] >> 10);
+	seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[PMD], dm_meminfo[PMD] >> 10);
+	seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[CONT_PMD],
+			dm_meminfo[CONT_PMD] >> 10);
+	if (pud_sect_supported())
+		seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[PUD], dm_meminfo[PUD] >> 10);
+}
+
+static inline bool is_dm_addr(unsigned long addr)
+{
+	return (addr >= PAGE_OFFSET) && (addr < PAGE_END);
+}
+
+static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
+				  enum dm_type type)
+{
+	if (is_dm_addr(addr))
+		dm_meminfo[type] += size;
+}
+
+static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
+				  enum dm_type type)
+{
+	if (is_dm_addr(addr))
+		dm_meminfo[type] -= size;
+}
+#else
+static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
+				  dm_type_t type)
+{
+}
+
+static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
+				  dm_type_t type)
+{
+}
+#endif
+
 static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 		     phys_addr_t phys, pgprot_t prot)
 {
@@ -234,6 +314,11 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 
 		init_pte(ptep, addr, next, phys, __prot);
 
+		if (pgprot_val(__prot) & PTE_CONT)
+			dm_meminfo_add(addr, (next - addr), CONT_PTE);
+		else
+			dm_meminfo_add(addr, (next - addr), PTE);
+
 		ptep += pte_index(next) - pte_index(addr);
 		phys += next - addr;
 	} while (addr = next, addr != end);
@@ -262,6 +347,17 @@ static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		    (flags & NO_BLOCK_MAPPINGS) == 0) {
 			pmd_set_huge(pmdp, phys, prot);
 
+			/*
+			 * It is possible to have mappings allow cont mapping
+			 * but disallow block mapping. For example,
+			 * map_entry_trampoline().
+			 * So we have to increase CONT_PMD and PMD size here
+			 * to avoid double counting.
+			 */
+			if (pgprot_val(prot) & PTE_CONT)
+				dm_meminfo_add(addr, (next - addr), CONT_PMD);
+			else
+				dm_meminfo_add(addr, (next - addr), PMD);
 			/*
 			 * After the PMD entry has been populated once, we
 			 * only allow updates to the permission attributes.
@@ -368,6 +464,7 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 		    (flags & NO_BLOCK_MAPPINGS) == 0) {
 			pud_set_huge(pudp, phys, prot);
 
+			dm_meminfo_add(addr, (next - addr), PUD);
 			/*
 			 * After the PUD entry has been populated once, we
 			 * only allow updates to the permission attributes.
@@ -528,16 +625,21 @@ pgd_pgtable_alloc_special_mm(enum pgtable_type pgtable_type)
 	return pa;
 }
 
-static void split_contpte(pte_t *ptep)
+static void split_contpte(unsigned long addr, pte_t *ptep)
 {
 	int i;
 
+	dm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
+
 	ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
 	for (i = 0; i < CONT_PTES; i++, ptep++)
 		__set_pte(ptep, pte_mknoncont(__ptep_get(ptep)));
+
+	dm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
 }
 
-static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
+static int split_pmd(unsigned long addr, pmd_t *pmdp, pmd_t pmd, gfp_t gfp,
+		     bool to_cont)
 {
 	pmdval_t tableprot = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
 	unsigned long pfn = pmd_pfn(pmd);
@@ -559,8 +661,13 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
 	if (to_cont)
 		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
+	dm_meminfo_sub(addr, PMD_SIZE, PMD);
 	for (i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
 		__set_pte(ptep, pfn_pte(pfn, prot));
+	if (to_cont)
+		dm_meminfo_add(addr, PMD_SIZE, CONT_PTE);
+	else
+		dm_meminfo_add(addr, PMD_SIZE, PTE);
 
 	/*
 	 * Ensure the pte entries are visible to the table walker by the time
@@ -572,16 +679,21 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
 	return 0;
 }
 
-static void split_contpmd(pmd_t *pmdp)
+static void split_contpmd(unsigned long addr, pmd_t *pmdp)
 {
 	int i;
 
+	dm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
+
 	pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
 	for (i = 0; i < CONT_PMDS; i++, pmdp++)
 		set_pmd(pmdp, pmd_mknoncont(pmdp_get(pmdp)));
+
+	dm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
 }
 
-static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
+static int split_pud(unsigned long addr, pud_t *pudp, pud_t pud, gfp_t gfp,
+		     bool to_cont)
 {
 	pudval_t tableprot = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
 	unsigned int step = PMD_SIZE >> PAGE_SHIFT;
@@ -604,8 +716,13 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
 	if (to_cont)
 		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
+	dm_meminfo_sub(addr, PUD_SIZE, PUD);
 	for (i = 0; i < PTRS_PER_PMD; i++, pmdp++, pfn += step)
 		set_pmd(pmdp, pfn_pmd(pfn, prot));
+	if (to_cont)
+		dm_meminfo_add(addr, PUD_SIZE, CONT_PMD);
+	else
+		dm_meminfo_add(addr, PUD_SIZE, PMD);
 
 	/*
 	 * Ensure the pmd entries are visible to the table walker by the time
@@ -660,7 +777,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 	if (!pud_present(pud))
 		goto out;
 	if (pud_leaf(pud)) {
-		ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL, true);
+		ret = split_pud(addr, pudp, pud, GFP_PGTABLE_KERNEL, true);
 		if (ret)
 			goto out;
 	}
@@ -678,14 +795,14 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 		goto out;
 	if (pmd_leaf(pmd)) {
 		if (pmd_cont(pmd))
-			split_contpmd(pmdp);
+			split_contpmd(addr, pmdp);
 		/*
 		 * PMD: If addr is PMD aligned then addr already describes a
 		 * leaf boundary. Otherwise, split to contpte.
 		 */
 		if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
 			goto out;
-		ret = split_pmd(pmdp, pmd, GFP_PGTABLE_KERNEL, true);
+		ret = split_pmd(addr, pmdp, pmd, GFP_PGTABLE_KERNEL, true);
 		if (ret)
 			goto out;
 	}
@@ -702,7 +819,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 	if (!pte_present(pte))
 		goto out;
 	if (pte_cont(pte))
-		split_contpte(ptep);
+		split_contpte(addr, ptep);
 
 out:
 	return ret;
@@ -789,7 +906,7 @@ static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
 	int ret = 0;
 
 	if (pud_leaf(pud))
-		ret = split_pud(pudp, pud, gfp, false);
+		ret = split_pud(addr, pudp, pud, gfp, false);
 
 	return ret;
 }
@@ -803,8 +920,8 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
 
 	if (pmd_leaf(pmd)) {
 		if (pmd_cont(pmd))
-			split_contpmd(pmdp);
-		ret = split_pmd(pmdp, pmd, gfp, false);
+			split_contpmd(addr, pmdp);
+		ret = split_pmd(addr, pmdp, pmd, gfp, false);
 
 		/*
 		 * We have split the pmd directly to ptes so there is no need to
@@ -822,7 +939,7 @@ static int split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
 	pte_t pte = __ptep_get(ptep);
 
 	if (pte_cont(pte))
-		split_contpte(ptep);
+		split_contpte(addr, ptep);
 
 	return 0;
 }
@@ -1394,37 +1511,57 @@ static bool pgtable_range_aligned(unsigned long start, unsigned long end,
 	return true;
 }
 
-static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
+static void unmap_hotplug_pte_range(pte_t *ptep, unsigned long addr,
 				    unsigned long end, bool free_mapped,
 				    struct vmem_altmap *altmap)
 {
-	pte_t *ptep, pte;
+	pte_t pte;
 
 	do {
-		ptep = pte_offset_kernel(pmdp, addr);
 		pte = __ptep_get(ptep);
 		if (pte_none(pte))
 			continue;
 
 		WARN_ON(!pte_present(pte));
 		__pte_clear(&init_mm, addr, ptep);
+		dm_meminfo_sub(addr, PAGE_SIZE, PTE);
 		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 		if (free_mapped)
 			free_hotplug_page_range(pte_page(pte),
 						PAGE_SIZE, altmap);
-	} while (addr += PAGE_SIZE, addr < end);
+	} while (ptep++, addr += PAGE_SIZE, addr < end);
+}
+
+static void unmap_hotplug_cont_pte_range(pmd_t *pmdp, unsigned long addr,
+					 unsigned long end, bool free_mapped,
+					 struct vmem_altmap *altmap)
+{
+	unsigned long next;
+	pte_t *ptep, pte;
+
+	do {
+		next = pte_cont_addr_end(addr, end);
+		ptep = pte_offset_kernel(pmdp, addr);
+		pte = __ptep_get(ptep);
+
+		if (pte_present(pte) && pte_cont(pte)) {
+			dm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
+			dm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
+		}
+
+		unmap_hotplug_pte_range(ptep, addr, next, free_mapped, altmap);
+	} while (addr = next, addr < end);
 }
 
-static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
+static void unmap_hotplug_pmd_range(pmd_t *pmdp, unsigned long addr,
 				    unsigned long end, bool free_mapped,
 				    struct vmem_altmap *altmap)
 {
 	unsigned long next;
-	pmd_t *pmdp, pmd;
+	pmd_t pmd;
 
 	do {
 		next = pmd_addr_end(addr, end);
-		pmdp = pmd_offset(pudp, addr);
 		pmd = READ_ONCE(*pmdp);
 		if (pmd_none(pmd))
 			continue;
@@ -1432,6 +1569,7 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 		WARN_ON(!pmd_present(pmd));
 		if (pmd_sect(pmd)) {
 			pmd_clear(pmdp);
+			dm_meminfo_sub(addr, PMD_SIZE, PMD);
 
 			/*
 			 * One TLBI should be sufficient here as the PMD_SIZE
@@ -1444,7 +1582,28 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 			continue;
 		}
 		WARN_ON(!pmd_table(pmd));
-		unmap_hotplug_pte_range(pmdp, addr, next, free_mapped, altmap);
+		unmap_hotplug_cont_pte_range(pmdp, addr, next, free_mapped, altmap);
+	} while (pmdp++, addr = next, addr < end);
+}
+
+static void unmap_hotplug_cont_pmd_range(pud_t *pudp, unsigned long addr,
+					 unsigned long end, bool free_mapped,
+					 struct vmem_altmap *altmap)
+{
+	unsigned long next;
+	pmd_t *pmdp, pmd;
+
+	do {
+		next = pmd_cont_addr_end(addr, end);
+		pmdp = pmd_offset(pudp, addr);
+		pmd = READ_ONCE(*pmdp);
+
+		if (pmd_leaf(pmd) && pmd_cont(pmd)) {
+			dm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
+			dm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
+		}
+
+		unmap_hotplug_pmd_range(pmdp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
 }
 
@@ -1465,6 +1624,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 		WARN_ON(!pud_present(pud));
 		if (pud_sect(pud)) {
 			pud_clear(pudp);
+			dm_meminfo_sub(addr, PUD_SIZE, PUD);
 
 			/*
 			 * One TLBI should be sufficient here as the PUD_SIZE
@@ -1477,7 +1637,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 			continue;
 		}
 		WARN_ON(!pud_table(pud));
-		unmap_hotplug_pmd_range(pudp, addr, next, free_mapped, altmap);
+		unmap_hotplug_cont_pmd_range(pudp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
 }
 
-- 
2.47.0


