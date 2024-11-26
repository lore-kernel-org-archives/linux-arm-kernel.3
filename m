Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513C8D3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQYXYpxGwXH28WSftPPcH/f3ITFo8NHJ0iu0TsGaP2M=; b=EahfTRb1EADHS7wBZdRI6oO9NA
	iXBZdLCc8bcidfV3QV4QBZeRLnR7AAeg4kC/AHXe8Lmy/B1Pm1s6N2YDGCsVxEha8BMk2YOVXBXC4
	B+BhNw4OCF8sIxtmmzOiT0nHu8FSVZ+XhTGkaQzB6Sjf23tS/pekQNZUwQI/1Gb3nRAar2mDQazix
	tJMNt564dZrQSHEkl5R2znsTAkKb0DJN8ELbxVYc2k8xi+x1o/VICssXEbTdnkN7WI1RENxnHOB0U
	r24HTEYbUu2NXVr66CQXGSr8QT1rElz4/arq51FgDxzbSAT9gmVkbnUPYRos37G2KTALQQ7sTw/aK
	JwtEjOTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrQs-0000000A1oL-0KA2;
	Tue, 26 Nov 2024 09:00:30 +0000
Received: from mail-mw2nam12on20731.outbound.protection.outlook.com ([2a01:111:f403:200a::731] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrOR-0000000A1E2-2UNx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 08:58:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfnNLWayYTMTBKVT2NlkP36XsiIqnsAZ30BGWIRwAZ7S3VadS+3/TdieEh5x4vCNC5PcMrDjUwUT8wignKVItoP+WvdFyAdtxMPoUPbxOleFv48O/hA/j8yabtQLLkd84zJ5EAax8+06ZMUYpq/7cfwuyYQ+PNJO0e48r1qzMr/s0RngBYSilPOBewNsLbN55p8OJaKGgovyWJfsv55A2mnXaRuAdbReXOLCId7NI5r86GxAIwF4bgiSHKMnFC59yC1LH0WVMuqbNgzomwx6pRNbu/kMR2/SR0NG6eagtMEGnhMuvJYlF6QR3QaOQL6CO3rnCU1ULfFP1MxJK5j1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQYXYpxGwXH28WSftPPcH/f3ITFo8NHJ0iu0TsGaP2M=;
 b=t+JBFskvC/lNhZeir+16Rgzv05oFr4BC5G395lgSDktKDjmlPT2hVH4q0UGSceIebL+ej2cvtSMN2FBIla3eBcMI/P0U7VA1VAajpr1VFeYml09vLOVXkRbHmMvQrLvZfZHYl6DIEgd1eevlciUYQmxoMgWkGXIhctBVgPwWGYws5l7bvWIdQMVuXb2ykBiD4C5oS37LIdKJFvSMJugw7wfpuz0FotAOzDF9Z0Z2b0OLN2jJH/QyD3KXNjAa5C9qexmP0p4tmW8CbE9OkK8WyOodjSMEX9WTp7Yi7msvLcJWg24ELwNAEhGOwpjFElOncPaEFeUdfgiRcnhYDkZzBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQYXYpxGwXH28WSftPPcH/f3ITFo8NHJ0iu0TsGaP2M=;
 b=X3OiqyA04xfk4nJW0Uh/Bf59EJP1p3coOQqYt5O5FQXQj8tAIHt4J6xUUbRRnX1ofQ7bTZKMeDOaG8c1VYMkou9wFPO/4Z7V6BuUS+/8MKS/tLLB/7giVo3qcRmRZrr+utd0Fl1v8/f6CsXWL9RU/CWtIq7P0mFMZCcJdYNYCrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 DS1PR01MB8869.prod.exchangelabs.com (2603:10b6:8:222::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.12; Tue, 26 Nov 2024 08:57:56 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%4]) with mapi id 15.20.8207.010; Tue, 26 Nov 2024
 08:57:56 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: patches@amperecomputing.com,
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
	cl@os.amperecomputing.com,
	Huang Shijie <shijie@os.amperecomputing.com>
Subject: [PATCH v2 1/4] arm64: make rodata=on behaviour be the original rodata=full
Date: Tue, 26 Nov 2024 16:56:44 +0800
Message-Id: <20241126085647.4993-2-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241126085647.4993-1-shijie@os.amperecomputing.com>
References: <20241126085647.4993-1-shijie@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|DS1PR01MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f530de2-2152-44cb-0541-08dd0df86b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HUhUpnZ9KjceK9On/wr6sAjPQ4oYy+sMaKj0GbrZF3HRxBy+zAv2yQZrTQE+?=
 =?us-ascii?Q?NgUNpO9HLRBILQuaTb+sgWROMiavfZfI9lGhaOhZSpIQkY5ziT/5sKT0L1bg?=
 =?us-ascii?Q?jxVGUNSrvyCdFtAQgXkgG+F2omuS+sqIKLHKmTfMd+lM8tYwHmAcOmGqF2Nx?=
 =?us-ascii?Q?YvFeoDCs/u2WTNg0SWQUr0mC0Sx1cDq6CeUOF9yOUuapQtSiHBmDzy+Yt6SM?=
 =?us-ascii?Q?zAfF/CJuro4omUJFqH8hhLDEHgkZjRQq4R2AfRAZKdPibHVJXgCd05G6RKJR?=
 =?us-ascii?Q?KBQ4xl9nS1429PwvwfxAyPatTXSB6KhkKcykNtR6usWeo/SresqV51gQFURx?=
 =?us-ascii?Q?w1Kxmum+yb3VBvDT+puiRK2RsOgw+g6pB2VRZBzoF/153MOUTKUQJm6T70h5?=
 =?us-ascii?Q?cHdP6r2x4v0xbngtsS/o3h9nQnnbifOr3tJeH7r2WnZsiSa9ss0IWOgWRS9P?=
 =?us-ascii?Q?wZlpCOdzE8Hkwovmp4+TKw0uNTB7P8LT+wF9eoSPhq6pt7KS098h1YN9+JOl?=
 =?us-ascii?Q?JDfNYYb24UEVY4SctPI66b/RhIhBfzx1krg/fCYIwMKUBLQ6hxL1FPwQzZQN?=
 =?us-ascii?Q?YGUNV1ven8+KBUDVwlCxnwE4jAVZT4GapZzHqAx1nRaNTTdd9DMKTMiY1faR?=
 =?us-ascii?Q?KCIND6aAldi4VXDabFAW5zDrom7fPq0l/9Jl6G7WpnUt3gEAenWR7WckMEjw?=
 =?us-ascii?Q?ygx+YIF/smaaieZl44N2QhF7OQ0sLlq2yhQHQ/I6zF1OvBtkYExs9IErlZ85?=
 =?us-ascii?Q?LzTg22GbM6yeMZKBqNPzL66sQtXTFRcoFNov8EBeN8IphVkg6JfL2XCU7XBQ?=
 =?us-ascii?Q?QQwD50HDjXvoWN56pWlOO+GV84LQPBR7d8hWEgn2ebb7u8w013U8wDquNFWV?=
 =?us-ascii?Q?Xsj60RX1385Bmc7hiXE7L4f9dJ1EZKrNPTRMZoQmhQALvkYNUpYB3XOgMQa7?=
 =?us-ascii?Q?Q2yt0SUyp12H02EqcI3p9Igi2ji+k0blwLosnSoSn8gmPMB2iaaefN/FMkpY?=
 =?us-ascii?Q?J7ROLWGa2ebSwHYqdE1ZVmIDRWo7yt4dZhqX8OlCkXdyB+tOenIDdWNjf/Bb?=
 =?us-ascii?Q?GIncBIt6Dht6rY53siZ7jDzHygDcK9Hm9Qsi/NNHreVkJDUhCA2Utixjx+tz?=
 =?us-ascii?Q?VBcLzRF8/7uzdHh3snjeNPQqLrpiBvKfTvBSvEXXgNknNzQ8z1Q11lapcEHk?=
 =?us-ascii?Q?D1b6miVUWnT70EKt+wWXlkLKQv88NaJleUsk+GFnITvzEtsuiYc+ozbadQ8G?=
 =?us-ascii?Q?p7czIjhY1rpAsFAU8qDkAwP0sRj1Cokr0sKD4Dwb6h2FWMFJ1yWnLmTUO1Z8?=
 =?us-ascii?Q?CXuzv8hWsgGza1dziNnN/N5zuj7rpRptgDLirkTa8Z+z+E75HLwy+YZfsMkA?=
 =?us-ascii?Q?USiuit4Rs/nZPBUydxUq3XpQpCcGjAoB9cumU3ACD+wWJORR/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/2IypKrH6kwfn/JhiP6RX7rwEMLiW6sNH8AyKIqxTTPohbLNnoR5ErYp2LWc?=
 =?us-ascii?Q?bolLF8DCX/Dls4o9AfnKLYacRIE+sqa3gyJv1SKTlnohZ/Kh44K20/DG+PYy?=
 =?us-ascii?Q?abSsYOhmdrj9FN2X8y7ssFiCBFrmpY7H+A3A2RMfsK8kUFhVvaCFsXV/6L80?=
 =?us-ascii?Q?Dc+9RoWdSdtwywvaYNKnHvmJJyJBDS+LCfkv1v6iksZ8/yL/WzYn6Wj02x6i?=
 =?us-ascii?Q?gQgIxk3xk7k406yfEcukdVTKUKRmHIhU9zVpcFd6iwU/1hiVmwUHDvM7fkJm?=
 =?us-ascii?Q?ql9CSqbn6Hxs+q8gGGHdPzXf8m0+uZ9t9wufTf443BiwM63FS3QlEWdyhDOh?=
 =?us-ascii?Q?Gl/L+3rSKCSLdGNYXDP86Zd6dm3c49qahDsUE6W7cQBFXKNhKdBY29zDNlUg?=
 =?us-ascii?Q?4ZT7LLuzZn1mgFeh3u9TDNxwIx+MfVDYG5e9K4o29IEH3VWDSt5TIqyyOIAZ?=
 =?us-ascii?Q?/7W55GiJXdMEM35d71Fs0cR4LeLAQJuKjm3KVKcgK1c3PZWMHVqZ10adrU1D?=
 =?us-ascii?Q?49S3gdumyihcTU7GNZ96At92QlAyoBD2llcK0Owe5QcumquGAJS8lscl8UcB?=
 =?us-ascii?Q?85AnQLI87LAwAmsWWOaxTWWe5pDOUEsyIs97DII0J99i6bz8HVnua7730YRI?=
 =?us-ascii?Q?vQanMRsWLRANmRlR2rw3cpJ0AMuAmI2k/xTO+Vd7vTFKEdKSZr5Z31bVr9IH?=
 =?us-ascii?Q?Q/izfIa0QOR7hGvJpLfPI9BDd9P8j4u1DGDTEPv0ImArO4IMUsoFr2ZRJHMG?=
 =?us-ascii?Q?J2KABm9IPJC/kTkEfKyw82UPgQ1wyNzBWHbm3fTdu+4p7ooxz867w09W4p0e?=
 =?us-ascii?Q?fO4suHc3RMfha39sztSijBlQJhyyEVvQ0kmd0IWxCKl7EwYyC3rbfSJcmtlf?=
 =?us-ascii?Q?ORR5LeJXsWMSCyl3vaI83HAwDsOVWbx7rEuhfWjrK3utt6jgef/RDzNZIcCm?=
 =?us-ascii?Q?ihxxuHsjqzYkUm9IzNwKczveOOETnaGge3J2f/HKMQSC0jtBX2TxKhXT+A74?=
 =?us-ascii?Q?plQCNw/oh0/eUMxxwaCN6BThM3+if50urekS/UUKP4e4BxCFYvfL0yzSS6D/?=
 =?us-ascii?Q?8356J/ZLK9k/z9+xbLK4H7rNdaqVYoQ1na2EBLVCPyz1S+CHdVQbItUq2ORP?=
 =?us-ascii?Q?km7LjnQhfRsX8zBcPKKzOlJzQ985UXKHqN1m5ZQXFfNjPXSt+eeGyNcPrBbj?=
 =?us-ascii?Q?j/AaX+gy27mimcLuzJKygQ98f29lpWjhOeZaHmhaiJaI9JSe6zA9MbDtFcoe?=
 =?us-ascii?Q?YKJwULWV8XXujbG2NrYeTZcPSzON10Mf7FYZtGKqPRwxGK+1QB6vjqdn4jz4?=
 =?us-ascii?Q?o6+DXtgrvcSHk73f+BVvE9npT4xn++Ej2KF1P/yBIuwNwKa60gcyKD8nSijb?=
 =?us-ascii?Q?0odPYDIZdoFEmRp7lmnMZ9Dbmir2CntoElIF97ox3fNAIpCTnprVozkJjwmn?=
 =?us-ascii?Q?JF83Zh3OWa687RKMlwD5cBXBsbPqKncOYMo9VVUkWfopjEQ3r2n2efn5UvxH?=
 =?us-ascii?Q?C9yk6NnQGP8+H4UcU6Ka90DYIK9Yo2g6Xda/BXhssrdmK8VVglpfVzCAdu+n?=
 =?us-ascii?Q?0OISg3sY0i8f+YRtFmmcPxmK8gNTJMTmq6iQAMlu0ydxN+A5PO8RY7g+kgNB?=
 =?us-ascii?Q?Qidbt4wtZi572p1kIZ/zQYc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f530de2-2152-44cb-0541-08dd0df86b4e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 08:57:56.4053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/WF5DA/ez2H/lUFhBsEqgaVa8QcLyG7xoS2dYXeeuJTRTx5idS0FlLPS0YSzqaCCPtozX+fmrwOcmZkIi87dacYyigg/fNQRLtsHBLW+P3493pNWHP5RkBVGhtOi+PO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR01MB8869
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_005759_631875_7DFD57C0 
X-CRM114-Status: GOOD (  11.24  )
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

Make rodata=on behaviour be the original rodata=full.
After this patch, the rodata=on will be the default,
and the arm64 kernel behaviour will follow the
Documentation/admin-guide/kernel-parameters.txt:
	rodata=		[KNL,EARLY]
		on	Mark read-only kernel memory as read-only (default).

Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
---
 arch/arm64/include/asm/setup.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
index ba269a7a3201..5ded3bd11476 100644
--- a/arch/arm64/include/asm/setup.h
+++ b/arch/arm64/include/asm/setup.h
@@ -21,7 +21,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
 	if (!arg)
 		return false;
 
-	if (!strcmp(arg, "full")) {
+	if (!strcmp(arg, "on")) {
 		rodata_enabled = rodata_full = true;
 		return true;
 	}
@@ -31,7 +31,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
 		return true;
 	}
 
-	if (!strcmp(arg, "on")) {
+	if (!strcmp(arg, "full")) {
 		rodata_enabled = true;
 		rodata_full = false;
 		return true;
-- 
2.40.1


