Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25428E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 05:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRHhT8hWESy6pQarMOcmjVGiA0htP/Pw6bI07K0UWTU=; b=fKoSuQbqvN79WmyOaCTkdMsa9M
	hUusxS890fp5wTrX09IFSiZCYgyN3w4awzuj462gOmoi770yhvD+eDIFsxpT14nSexEgm+wSsHVMd
	PXjBjFbi1E3XJXtMJ+h49jkBbMcLX4TkHVKOpbJ0JNHMwkjWrGeT5QuriENFpHd1+eBYH1DjqOD/L
	MOydQpxXAVv6KcyYdfHv6Sd6Y0TY/lf88H89F5gYF32F6hJsKqk2txR6NOW1khK8+JLDdosVagqA+
	Ma00F13VjmIQK1pv++lz28+a+lXr9SmMPReS3dmBRRhxmSEDHPGjRydzwftTixpN9OK8XDxBHAgFX
	a6mXRj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyJ1-00000002mTT-04QN;
	Fri, 13 Dec 2024 05:33:39 +0000
Received: from mail-co1nam11on20723.outbound.protection.outlook.com ([2a01:111:f403:2416::723] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyHW-00000002mID-0RIl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 05:32:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOkx6JLuSQ72ETOimRPA+IfXw1DUbDGDu1yVECFQOPmTL/VZAL0GDo/XNSCCWvvc5gbQcm5N5ABu6N+hEMDEZrLWqNF0cIz+LR8HdkezOzgPWTurGT35RFgGZuHKZC6dOSUZS0xWowbBtZHNLG89lUYJYSCqs6ZmKQA+Ipkuy12MKN28e2OMjdxI1H1qg3DSg6N1luW+8VgdBR2ME2F63Hc97JlmvqfoRCbDHhrlJeUAGQm+S4ZPEAQVTz3nmR55GZri/4iCWKcajN6LDw0QbcdONndkym8zYfxn7kl9Glk+YyYwcTf2RpEX2v5Z8M/x93p+rkCt02o2pZ0fhK7Vbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRHhT8hWESy6pQarMOcmjVGiA0htP/Pw6bI07K0UWTU=;
 b=UPShFByfDhoqKyKqo6/d4szctLfmYIS+IsPCcgqhGN6ORy+msg3GYbxF1i952LbeQirRZpyLifZ6hzPJt2BXp+0i9u3weKvAFWWt9khfOoqXyRm8kEMpRBKTxZgv/Wf2tKXT6z6woDrsY13a0BL4+J0+H76EDRsr7H7HUMOGISHfuzKEQZvOXyyddauQYPUJmmcVI3grLqLgjevYGek+xWZ4nvogygRGoYN0tyNooCHeAvrHxPCFGubfexMIAdy6isor96wIsg7Jnyy/cZB+m+Out+tjZwgXgYRf7naA2ciM2yPXNtVy8XIk3bz9RSA3XQf8ucIm8ZIKoaJcMBJC5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRHhT8hWESy6pQarMOcmjVGiA0htP/Pw6bI07K0UWTU=;
 b=uY9cPSp0U8nZcp2FiDo12R3kuz6x40yjgbKLj2wCqNXXNcohW5ngvmcULgNFvuSRAh+hzvSMKQ1xJGjQlfv7XeHTikxfmqZICVBXKK+C7+odJEdjPBoJhSokJ1YDUu/ialPb5bxEvOth/Yy7sE7knYHhT39sh3LJRFQb+bkNEDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 BY1PR01MB8851.prod.exchangelabs.com (2603:10b6:a03:5b0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.16; Fri, 13 Dec 2024 05:31:56 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%3]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 05:31:56 +0000
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
Subject: [PATCH v4 1/2 fix] arm64: refactor the rodata=xxx
Date: Fri, 13 Dec 2024 13:30:49 +0800
Message-Id: <20241213053049.7592-1-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241212082426.4110-2-shijie@os.amperecomputing.com>
References: <20241212082426.4110-2-shijie@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::20) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|BY1PR01MB8851:EE_
X-MS-Office365-Filtering-Correlation-Id: f7552657-f823-4a3c-1516-08dd1b377532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kq/7xJF6ashhEFKQaBtz+bAT5R4r1FU8subU/A/KOITHrfp+q83jY0GYco2n?=
 =?us-ascii?Q?AiV7PoUAc49ZWbYguJG6cqCNlNBKsW9N8ZTEbOFL0XD/HO8R83mwKOEsF/cX?=
 =?us-ascii?Q?zyHj1McDYmp3dwXE91n4cJjSaEAU38pOadu9w+2jBikqRslpl9HgKxbBj8cj?=
 =?us-ascii?Q?O9Q7JEN72NoM4y0bsu3tiQbxXRl3v1skl+jcCf6Q6gBHNdThx7S0qEhUGnK3?=
 =?us-ascii?Q?s0LpovW2s5WD8loDr52IC7+iP3/f+32dE53b8+cuW6suiD3jSSki78TGgvhn?=
 =?us-ascii?Q?mcXOqWEAG1WSwuO/kdzLgH/AfddR2TVPCqskHIzzIUKP3ROF2AIgQ45xBiVe?=
 =?us-ascii?Q?lwduEI4zkA4ud2QdBu4aYU4Oh4/IBo4wWUq3KU5hh4dY06fvWZ4cBd6zUhc7?=
 =?us-ascii?Q?dRw0JUfSRIfl3Swjc9pdCD2PUYwcKB58CJCcCFbixKjySaag3TGu7qWmhi2q?=
 =?us-ascii?Q?6bcv5T7HMIZZ7f/BU4JXLsAizPMkyPz/I58AzODQe64UThosl6+xJL4BC1k0?=
 =?us-ascii?Q?o8PFF5S3GJH5qcaPVxvooTkckUJErOvriswUg6x2UNn3KA2q6+TpMjDLaDRJ?=
 =?us-ascii?Q?Wj0UIrjB0OoiosP3/5Zxirc5ilIODs0POcNmw8CjJoftncEMiZOK2x7Mb4Sr?=
 =?us-ascii?Q?HjT4bBkx5ae9rHe9sbt9Qv0sCTwRy6UDH7PHZUMURJxvjeqO1RPGMC6Z+yN/?=
 =?us-ascii?Q?VeVYA2tkt6rZ4pqK1Crgkoct7C5825cvEEYqzaj88DzsUwJz2QCm85M763nq?=
 =?us-ascii?Q?antCq4NfiZ03z0BKqrXO2dEmKKXSSo8vkquPa2b2BrBXqFo2QXsgABceCpbg?=
 =?us-ascii?Q?UsDtWdtkWnvv5W82TeGIvjyrkGNWT7m4XIHSzHw+8bkkS7n70vEGTCD+qGGX?=
 =?us-ascii?Q?DfVUNqshTQVDpEKWBVX7rTZdND6g5Y0AD2kVlGOXP6NmZ9AO0NxZUhUnxVzi?=
 =?us-ascii?Q?UOxZMf6edjXNqgktBhueuNk3R7jb+oPWmcj3z3lZG4wxqQWVxHK7MLm9gHqx?=
 =?us-ascii?Q?aX/VuoVUzrFKvP4aLWYfYEIqmAKJSE2dWrqwS4KCE8HJoz2TTBxlBEVi+AZu?=
 =?us-ascii?Q?siCZ7glB8ZDDa3YB76foD8jhrET4lH/TbXVPLwFdrWgTNIMg+QQ3i1kxIEML?=
 =?us-ascii?Q?cSpH78+kMk9GLqLyypJPGwRLEvC15oWCwwqktdJXS3q2sNWXkWV5AGgArIJS?=
 =?us-ascii?Q?NddGOBUZvnKs0iwuHb7qLre0AkmJ6q8xvls25yrjG1+NcjStO29sg152hkyF?=
 =?us-ascii?Q?OTCTACGhgNaCndpRp0x8jJCDnR2nOnMk6tuSCN8/Aesz40r4KE9Ki1xlS6dB?=
 =?us-ascii?Q?gB04dt7CjZJxzWxgh2wRrTCJjdP81Bfq1uJFWll3ajqPkZUVA0WgJLo+IhK0?=
 =?us-ascii?Q?AZ4aibP9e+fAzDXWMQJSctymJ7GTAOFs8MJte16dk8mDFp3CEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d1a2jqTKeq3rvIWMAeG86Df33vWraIivAaVCZojeJXBTPgNQdGtisOXO7yHh?=
 =?us-ascii?Q?hmhNUj5ddUrgDxZhi99QVlk19RpXkPpCSP6T2nxMzopxaOUOmx3NxIOhVABy?=
 =?us-ascii?Q?gChmwDUC4aK+WQBH0d8f50LI/dDSKpUO6O+dRlXogY15/nBG4jbqYa3nIyA8?=
 =?us-ascii?Q?T3szEdcXZuBY3bZ3MwMJon/p5xqDTntLReNYCRzPVjlgyruouMnQEmLKaed6?=
 =?us-ascii?Q?8DU3S/aYTu4F/okGRQw9oGeVsZ6xsCG+FNmnRAsylnfOz6l61LMAlfpNbcTe?=
 =?us-ascii?Q?RJTXFajy2VbRjlmrZDi4nNWDgYVVcCyjxS+pQ0c7qvKsU6Glqvtd/lwElIgP?=
 =?us-ascii?Q?BXttQ52ACIYf01AZrzbjBjfp//fbNkVUv/c4Gn8sTeRlkIYJMKFsiUwlDotg?=
 =?us-ascii?Q?Nu2jO4TyMhn3uOW7aJSWVK3/fDolGJVT0d82u3ewqkeLC03eZGdTao6APpH7?=
 =?us-ascii?Q?2plFQ3xfz99ff20Peb8iO5XZk3QtAwX/MwNZsWtzPWp+86S7iGOtMCCv3cfT?=
 =?us-ascii?Q?wAKtdulWfUgxR3DFnQhUiibUmnObGw5AeJlJrTlopS7q1wHTJlz/BxBgwDqy?=
 =?us-ascii?Q?GHAHIaKUwV+cQCklXbcpHzSZK6e1VWXtnuGMedfmNsywsZ4XV50AFgFNKGO3?=
 =?us-ascii?Q?J3PohDxIbMm8+LBZ6B0kw/osUAul3lmEv33vBbMd6YMoTHOx7L3ID2g43HgH?=
 =?us-ascii?Q?guqH2YPpMK7wBOMzlStAnpcVs+wGcGgXVHueqLf/wg9B+/UzrsNLMkaJ43bI?=
 =?us-ascii?Q?zC8IiPoxes1MUkabMiMkCcUJn+9fI35AjmTCLYPAqWN4U4jWEM9YplZ2xDhX?=
 =?us-ascii?Q?Yt7EPNgUvi2zJfHB7Hj2A2rXNJhuBzgExNls7TRodhxBv6/PyIAQMeKlJ3Dy?=
 =?us-ascii?Q?3s+gWyMgSeypCJeIzB3xRV0c3LhxrZJc3DF+gA1nRluW7lwginZ1E79Bzrct?=
 =?us-ascii?Q?t6wRVa11XnBko54nqhbqIMwb9dZNL4ggAQR8o/oHsY0gFga1SRJPGVW+ZGyK?=
 =?us-ascii?Q?92kkPUSJ35WJOcGc3F2/8+A7SNGXKBsoON/Qt8Lqdpe+qZ7CJV8bL9Sx4l+R?=
 =?us-ascii?Q?aDMV6kVOoVn6Arp0w0DYe2wgcjH/SJs9FAbZkBdERDImOx61xYSTxy/fI8nQ?=
 =?us-ascii?Q?lmLcsqk6L5XAm5JIZQNhgmvw3zNXCrp6/H2GLjdsYZoMjDkE4XyPiPH8HhAr?=
 =?us-ascii?Q?f2NBSQVT2E4M8l5eu191TPDEzRuTq73Gqe/sliOP6VLG90AcmOiAVUQQYsxy?=
 =?us-ascii?Q?tROIpizGEM1uCFS6zkK7QsfXwetK9l73kNy3Mmk31I3pU0qVSINVocL5BK4O?=
 =?us-ascii?Q?U3baG7HWFvvBh6O3dV61kElhH2IoR+FHT7jlFxdNS2ugfLppv1nlKQYBHAyc?=
 =?us-ascii?Q?kepCi8t9OFmL4SN38Z8xvtrHRSYeiClIuOsHT3QfwiLgI5AGbkdaqX90b7Le?=
 =?us-ascii?Q?hsaGza7ORGKvTh6t2FrvCX8b0GTsSXVwtOGNDif/toKYfokdCfVJ9qBVsDIj?=
 =?us-ascii?Q?hrpg5Fv1lhixBHTQF4AodTocOeUXSkdVwKTAZKEGEBiTJMyjcZE9eQizUzqm?=
 =?us-ascii?Q?KS3aCIuzDQvfnhXDpsVCJTLRksubBJFfObYYXFdHn87SkTm18/dEkIPwGsxR?=
 =?us-ascii?Q?uBEGBF5XAESRjV/Xju5db5g=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7552657-f823-4a3c-1516-08dd1b377532
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 05:31:56.2620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmy2aB5Od5Qvwp+QdcGAj+Iut6UFZ6GR9X6uNi9pCC1F6gbssZ6e0dH0ls/d/BslcfYtpe+yXbDdpKFS/+V7bG9Hg25lE9kyG+V1YSJs0jMKSWfw4358ZgGKgLBbPFOR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR01MB8851
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_213206_591609_E86E567C 
X-CRM114-Status: GOOD (  14.38  )
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
Add more descriptions for "noalias":
  It is not a security feature yet.
---
 .../admin-guide/kernel-parameters.txt         |  3 ++-
 arch/arm64/include/asm/setup.h                | 27 +++++++++++++++++--
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a22b7e621007..f5db01eecbd3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5901,7 +5901,8 @@
 	rodata=		[KNL,EARLY]
 		on	Mark read-only kernel memory as read-only (default).
 		off	Leave read-only kernel memory writable for debugging.
-		full	Mark read-only kernel memory and aliases as read-only
+		noalias	Use more block mappings,may have better performance.
+			But this is not a security feature.
 		        [arm64]
 
 	rockchip.usb_uart
diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
index ba269a7a3201..0ef57d19fc2a 100644
--- a/arch/arm64/include/asm/setup.h
+++ b/arch/arm64/include/asm/setup.h
@@ -13,6 +13,29 @@
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
+ *    map region which would minimize TLB footprint. This is not a
+ *    security feature yet.
+ */
 static inline bool arch_parse_debug_rodata(char *arg)
 {
 	extern bool rodata_enabled;
@@ -21,7 +44,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
 	if (!arg)
 		return false;
 
-	if (!strcmp(arg, "full")) {
+	if (!strcmp(arg, "on")) {
 		rodata_enabled = rodata_full = true;
 		return true;
 	}
@@ -31,7 +54,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
 		return true;
 	}
 
-	if (!strcmp(arg, "on")) {
+	if (!strcmp(arg, "noalias")) {
 		rodata_enabled = true;
 		rodata_full = false;
 		return true;
-- 
2.40.1


