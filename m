Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA65CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkQcOMEDC1tWRRcrllxPjtcAEnU9zAIbW4qjW3jMj2w=; b=ZIj5HthOberzuEpWBIMVTABHRe
	7gzc3eiOX9fph+m2ZrLWf2nVgw/kaBXoV4XKgzA97NxynTMEIMz7r55pzkQojRvp6/MzdJgFC8DRD
	zb7tZmMaOMZa5hej3hyLKYk/3N+aQnoTOkXoYSgFPo2makJbUhZlsZQG2CaKw8TpWi9cnMnaGzsfb
	MA3SQ/jZ622di3Cpu0xLoO2zbM5J+lNW/IM8SWJZKO4/6Mxdpbcr/kvFoRm2cPcxhj8yMqpaACn9w
	8MKj/qDY8aHcda43z0D6VHnMK3+qqEqF4+Inia8dmfasonYhrkEXbFpEG4DMvCDr2XvI3IeflgjWY
	JRmkAndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8Pr-00000003wVj-2xpR;
	Wed, 29 Apr 2026 17:09:39 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8PT-00000003w7G-3AM1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:09:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bImd/rVcRcAgFLZgMsg9kPBe7NjkMUzo1oSZzu977Q73F7+0ywTSMg2GTNbCsSOmV2xFE5kcfDQP2+46TIvaL5yXcAbgjpWxgFCiaOxEuXLaeUu9NC+4xDHtO7198FpmK0O2o2QAYbGmJVS8YqFtt+wJMHwWkE8XFVFg2Q/Ux3O45eY2nwiCIP3P44t4CU4NDz8Kuz8oZ/NPnM/wRijA7f12BIjILGcPtQElt8NmUFpEVEjVhXijtb//0rQHjpOWiU5wV+92K2i7BYDWaS78aUtGi3bk2HuxuuKhB1iBbKbAuqajRgEpRk+0Gx/N6X2lG4GT81ZcnFfBHlnSoI9hZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkQcOMEDC1tWRRcrllxPjtcAEnU9zAIbW4qjW3jMj2w=;
 b=NtktbMlA+omdjri8cjeS01Q+98gqiGe/iyz1ZMFSJ9MhPr/o4TDcwdGOO5j6CZ24F8DnAz3V12rNXz8JIW4hEq3G4YDBD3G3L2LmX7NKIYqJZczOZ+69BCvKYT36ZpEaiPEYrCn3ZmRFzp6CtjublDIiWQCQeOEkzgxmS/5E7agEufLm+rwtZmyqjyAPRWvmfEfsbeuUrdJ0l2+6Y9BxSG+5AgGbZH92pgUEpq8f8P8N3+9qSAzOXSFPECSjAlfL+mipyyxoCpyDFwhz4MfY9tBBD865Y5Xxcm9wFdTUslAnfB1nxyc3hLjAFPBcxzAnfQ599PaeYFobdwK34ratLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkQcOMEDC1tWRRcrllxPjtcAEnU9zAIbW4qjW3jMj2w=;
 b=DXtDRAkZ03AJAtKq02rqNYHPLs3ntUHPBGD9KG+Xg8ExnK318GCG1Wj6iTtjMqYsnthD2wZ8Ganke/pjCxM1sNf1RgUNMOi1liB+dumXKZt6+lfrD7KB4KylLgAiIvOXq36aY2CU1ZEpb7O930R78cb3y39Kb87tw+GSj5AkhiQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SA1PR01MB6671.prod.exchangelabs.com (2603:10b6:806:18b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.26; Wed, 29 Apr 2026 17:09:11 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 17:09:11 +0000
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
Subject: [PATCH 10/11] arm64: kconfig: select HAVE_LOCAL_PER_CPU_MAP
Date: Wed, 29 Apr 2026 10:04:38 -0700
Message-ID: <20260429170758.3018959-11-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260429170758.3018959-1-yang@os.amperecomputing.com>
References: <20260429170758.3018959-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:806:130::13) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SA1PR01MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 317282ca-f16c-4cae-5de0-08dea612081c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|18002099003|56012099003|22082099003|55112099003|921020;
X-Microsoft-Antispam-Message-Info: ib+fAfd/I1USgNgG18zCR6NRp6+NaG4VRO63z5XRZFyJLSZ0A9xLZ73PimPH3XTHqwXZ80D9+ocjQkjYZPbTlduCM2xosfhp2zcwL+B4wUAPfJFhMHTAT50ISXPDQbhtBIQy03Z5WzDJGJhs/xzvknlPCh1A5yG6Ufm848oi26wHP3urNuUjNRQn17fGQX/mU7T7yWgDDHABaRlAehgRTEAT85GhBhRmsjXptekObZjHkUwMQqOjUS+kq3Mm7If1qKZZvF7ImT/7DIrS1TfhHMTGMOjeFXJu6BrqZ17Z0qEiaf3v29CFlWeLKdyPuwVQyivqGaFrnm+ZUd7U6oNeNyAPy00Ms9jR9Jbmzzju6I+UQFPB4VqI0XdnoP8xaVJ0wYvw0juApa4cbbBblVyXlrRQeq05cestfYAcU65fsCi6F1BisUtBwcTLXunj8m2+RzNF6QDtVMRKbAqdpMOcysztBMU04A29zZJqMoyrB3KnBoLmxQz8SVOSydz7t5OD3fTTjGKpLVnQHTzXDliZUTHthhI7+D+37OpnamZxn0/SnsGe9ay+pMfODqPV2HrT1cG/+2dEHwCV9MAM9a8QPxaGsO0WYhX0BGJghekMTADvDwQB/akDNSHYH3qn9ThV9PFr+Nbd1lfd35g/k+jROvdNdbSrxpE5uii0kbJo++Nbg3vhUX1jLEaTqc+WwUH2RDOYa7Q/f5LRH5g4FD0cHJcXBXy5FqZ6hUgXklJwgWI4FQCBcdjvjZ8WTDfyTaqbcHbYWbwabG8jXEg72DDJhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(18002099003)(56012099003)(22082099003)(55112099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hW/Nq8RI/c15U5+d6dCEERNwm+SC81VeV0f8xEVJZ1RvJjt7XVMOZz6Go+fv?=
 =?us-ascii?Q?pxwkQgn+o8ZvkktlTI56X031sZA0sB1uE8Ka89ThzkJoH3OR7WOJMiGhmZjX?=
 =?us-ascii?Q?AksrhV39Zfu6v4tGPlywcQszPVRbWmP0Uk25egH/jhORAtzFzWabGALPsGQ1?=
 =?us-ascii?Q?bnVtJyIR8bqcJzuIuu6riSPz4n5rY7FCIdw6v3y6OA3eYZZn3vlDk7TVUmPc?=
 =?us-ascii?Q?38/jxHTY4o6AtU8SX+V/3VdUHwQYkqkahrVFevZdd35xDnSY7TK4Vyemo/2I?=
 =?us-ascii?Q?Dzrwp39j23nACqNsvQf8FlIaLAMMkk6qyP8UeX6IPb/S2aGld0OQBGfbVa1f?=
 =?us-ascii?Q?WCw3v2eJ4yK+2BuQotgtBG3vQIl78IXHw9rKFhzzj5ZyNIPAmhZjrXc871xX?=
 =?us-ascii?Q?9egAhhfNFIcI+DuN888aKybc+vlBFH0NoYwftqAmQeizOQumlQd1ZJqkAJJ1?=
 =?us-ascii?Q?qLsDFnc2XbZqZf4hqzbqnW5sbELF8sW658dJKc2xHSULm6gr2l2yPfEGIch2?=
 =?us-ascii?Q?XxuwQIa++Oea/He2+LnRN1XDTxXJfK21lI3GdE2NKMIoEPQVWlN1A1CfwAmF?=
 =?us-ascii?Q?BPNiIzLNHit8/HlNcSs5SbIYlRT+7sCkVQi3NlyY+FdosX2Uha9WHz1GT/lI?=
 =?us-ascii?Q?LE/8T3icuWtb8TIgtCNZYEKRan1zNmvlFsDQkHxoIwjY2ZLG4mf1sQaIriXg?=
 =?us-ascii?Q?N4EEl9t+q8xHGE7EmtxU8lzFKdMAttVvHJUEfDR/2t9BnNAze+ivkzugOo4M?=
 =?us-ascii?Q?QUnpemG8TiARVGrmi2i4SsNdDJSAA2S+wp4Q910DgmXwLMsxYBXf5xVMUWTu?=
 =?us-ascii?Q?IHpeeG8wOP5dCPzyjeDIo4NSVlOCHrkeCJKa5dravGxBW+Pi3iWUpypElHXo?=
 =?us-ascii?Q?dwnEOT6acedS754cvm4MWCCX7XGdQ9IBVopoyxQOEj4q7grBUN416FJmLbuA?=
 =?us-ascii?Q?3Aba7Nzy2I0HuhzOPoVOQw8v1PBMnlRr/u1MdoX3RiVbRbjuhjRIwc8prrU7?=
 =?us-ascii?Q?3GtVVqujr55w9iYNuMuju6tLPX3khnekMPAsiER5xWrMbOu48L9TdxuoMuYK?=
 =?us-ascii?Q?D5O53CHypaKG3QPi6lX6FVVR6tsWxN1NlQdPVwyx1mDRxMGLdJh1gHF9JFWC?=
 =?us-ascii?Q?GWNWtM8e4/VmjC66juvapaBchixmBCAm3bdAvMzFBphj/UFcen6QlxkArUHq?=
 =?us-ascii?Q?OLh/wlqow0Nf9J3y2p4SYZw/80ROTCdcVz5SzmjAwxUcvO3m5eEdhNfyOu54?=
 =?us-ascii?Q?gIwS/mKtntpawrOw54YjKM7YO791oBRQ/7vR9btMOHCAE6px4eSTccHdUQGj?=
 =?us-ascii?Q?ljYYRud4UAB1KEmZCONl7yVoDGL72H0AkJFI0i1fAvgalE7jWMTlBH2gQm59?=
 =?us-ascii?Q?+aHtftGKHVV4p88BuCCDMoafEZySMBSO6SUwdv6x6qAlRlX8cs/XsolvVQT/?=
 =?us-ascii?Q?IkNneO9q/M5Ml0saUMGrXK/mVY2a1rwP88uG5xL/EGItTaKNMKj09PU6FHu8?=
 =?us-ascii?Q?r/O5P2B6qZYKJZO5fFUu9Q6vCBOiMfnhsJ1vi4tX/bwvU2J+7N4wrFNuiXAM?=
 =?us-ascii?Q?SMGwa8zWBkdmEGrGQ/x6UV+0JipaRikPqZZpzqq3iksE16uQ8cJeoSB6+2tc?=
 =?us-ascii?Q?UNARjpxxbSlp4eQN+gPxTugHUB3sRtIG/4My5qHX7g5dr8dw8vNgNl3uekZ/?=
 =?us-ascii?Q?P+MtriFDEkvd/84a7ZRgY0cwXmYcLVT+JdIklRYQ1Y6MW8to7WaIhuC0KHZS?=
 =?us-ascii?Q?gIjjVuGVZzpdIalgElc2IG1ruYjOlck=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 317282ca-f16c-4cae-5de0-08dea612081c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:09:11.0472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNVZH1Eaz8zExKwTrT1+a5ROjVCYWRGzWHmpUoaZRGRnSH/hx6cZTCbhs8Mjh/MCqI4mRR28z2UDcgPqHyEYlSD3j1lhEQ5jpp3WQeUov8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_100915_797577_D6C371EB 
X-CRM114-Status: UNSURE (   7.64  )
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

ARM64 supports local percpu map, so select HAVE_LOCAL_PER_CPU_MAP
by default.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 0e12e531a5b2..1094154c1c45 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1526,6 +1526,7 @@ config NUMA
 	select OF_NUMA
 	select HAVE_SETUP_PER_CPU_AREA
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
+	select HAVE_LOCAL_PER_CPU_MAP
 	select USE_PERCPU_NUMA_NODE_ID
 	help
 	  Enable NUMA (Non-Uniform Memory Access) support.
-- 
2.47.0


