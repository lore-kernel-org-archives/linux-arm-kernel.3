Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B089AFF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeXCIGnEb/3g6Y3m0Qw1PW4OMaubdiXb/TWbR+VA6w4=; b=hl/08z57IsQUKg73xyDbdOK/24
	RcJxDWKFfHvxiyugQi/vf1tiTDIF0vBAs2mfkCAFh/h+f9rwS6WCAPgke3k1fa+w5sR0vhl436EP4
	dWH2jchvPAnG4qPLkEFsL7wBlfFDq2jNLEILGNCUjd4RntVXMG55qkxR7dOsvfNkTOROgJrI33whb
	w1/MFDcE+/8v5xFMjUDT02InyhXIDEpe5zoSBNODWmUK2uL0dT0MSJigAC3J5jbaD1UCblILDEnjB
	x4qGLDr8PFoJWGObBHQ1B1+V2GsRzTKWN+2i5SzkKG1OI6jCivGLnqv7fF4vNntxexLpNF3X2vNJ5
	Iay5zWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8Pr-00000003wVA-1gNx;
	Wed, 29 Apr 2026 17:09:39 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8PS-00000003w7G-1DBj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:09:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZx1j8gwjleh5BWwHH6ziDcsnqCr4HGpu2TwJ+e+rJzrVL/p+4VV6YeVC/Gpd8RiZhUURm5KfXEVa/X5p/Dcfgy0QlfwdiMPP4pAXjDl9PBaFX5Acj1lk8i08ajAM6K8E1LGvzgEK9vlcAA5zyJskFrYY/WxkHZIXI6lzMSo4jQ7ZPM2h5iUN6qcaoxOlbtDxYuC9O6nYEVvMAvA7/tBu+4YrEHYduF1N+3pCIKE6mBG4e4tBBqzThEFNAf10BjuIQ3Fb48aq3lyVQmEKWCcySYq5Qgh4Du6FDSqrH/ccindsLOG5QBxf0cR/ioCAVP3wZtSRbfiYrAJ/xYfrPl4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeXCIGnEb/3g6Y3m0Qw1PW4OMaubdiXb/TWbR+VA6w4=;
 b=KRzaF6crE9H9mluDY8qnJjiEn7Q/WFr0B/GacWtk7fY9CKL5LHHCexedXLHFv1LBr+2ZlmRyG5n0MJuxQ6+GiJFY0pUg6owNI7ECFKSSXZorXeaLwKdOj5CxfzxZPsgmTsSs3rmen44qRxcsC2q7UAMYvuDBuSbxB4UfEFFuyjBmzQfvM+KBdAsoTnV7SJ3NS6d/F5uF63hqgidk3Ve2OmCTGEyhAjfr8uL69MhBK6jmJPjnKOwam97RJ8NWcIavGOPSjEMPtk4eKjkGi2C5v4yYv3OH0dVh9tvjI7vKfx5JTum1LSSctNUMyxAeiAXgtqINUymVoKe6b5pgh3g9uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeXCIGnEb/3g6Y3m0Qw1PW4OMaubdiXb/TWbR+VA6w4=;
 b=tPlBpKduJxCVsLu5qYPU2FAE/8jWRYOX+VRlx3JsBQG1xUFvpc5QLHa+TPlhpSRUnbPmG9xg+CAXpcKZPYHMIcXZ++zdKx3xUelGH6OIa7q7aqaDbHFzNITB91+suI9bDyYetZloGApjtsLZFTnRjb5HEg+Ze6nMBPhh/RXJWcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SA1PR01MB6671.prod.exchangelabs.com (2603:10b6:806:18b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.26; Wed, 29 Apr 2026 17:09:09 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 17:09:09 +0000
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
Subject: [PATCH 09/11] mm: percpu: allocate and free local percpu vm area
Date: Wed, 29 Apr 2026 10:04:37 -0700
Message-ID: <20260429170758.3018959-10-yang@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7360a4f6-cbd2-4a06-7671-08dea61206e6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|18002099003|56012099003|22082099003|55112099003|921020;
X-Microsoft-Antispam-Message-Info: HgT8Q1KlzpLtEZekpFn5G64swoktl7uhptjQVLarDLLRWdcEMDBUQta8qijwN4fWMR5DENgpNF4ra+U+8jIuwZsuHUMugfXYMFwRzWWTUW4R1lLX3ylQ7IFnP8/xdLIcMCQ5Vxcyi29vOva2dgjk3L0HI8iSNgermdjlMqOYPCa/QFXrMfcmzYpGKtnvGQOS3Ym9u1KMiPH5ASmpIOT9xp2EL4xt4+paro0k95SkQ+gsWrJLuUsOvpYrzvC/XK1Uk1wBM24C02Vj4TbLM5hJU1hoXEqlPW45YKQLaFqSmOE8WYYFayRGHjh1Zc/Cy6U/DQVu0zJJuK0s3hz1Ty9P3KhYxPCGHatkLhGNxrQ6EGyxhYlSW+mDP7q1ms36k29v3A40fgKY/5TnN6Gpu+jPAUFJugsRegLYkRYpry4tWpS7nnwDdlzy65fz0aY8RN88IYUCxsOFQtW+4uAvKCw/iHfAkumdsxwCfTZ/gi2HNzMVGk5WGTSWmbpWtoHf9CddJn27PPH+kWcPqRifkHd058uUrTqCQzBlPTzLilAdxcyM9Ti9zlp6/wiLnNwZDW7MVA+Y0H6MH8BOHlI2bt8WeuQbIL9dOH5XdrR03qRuMbshVv1hk7SGPnZlxINz3yS9OE/kx5BIDhufahP250bBdXB2ZbXWQ9Eou7THw2bqmqbm/uAGWK7JdfwgZHqyRXl8GVeqyQy8ChNH4Eq6OWCrC0SnpYWXkcBE3hBNBrYiMQUj36js8TVYbHoIlomWz0Pd7qrWMVNkChCtCLtB2vYfEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(18002099003)(56012099003)(22082099003)(55112099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P5JQXJKImD4QWlOMN1HwJmGYee69e3vw54P1HoCDd8gnjrFuh0XZAh79LbGR?=
 =?us-ascii?Q?8vXeivZgWzWbLla7Zm+HfT3NCuBW0M28bXXxtmGOBvd+NlJFKIlN16e9L+Rc?=
 =?us-ascii?Q?yDmeXiOT6Pe04YlQ50UJlyoxEs9NMjzxlOgdjVjBCVODNpW7gWp6JDiBQ5YH?=
 =?us-ascii?Q?x2AQgUf57b0UA8xtCRuuqOTzYFLJqqQWswh1Kv7fG3Vg0hXkhntFkr2B7Yj5?=
 =?us-ascii?Q?+vnNQPYG5xAQk8hJ4XLDxmsYnm9PcHLy3gkzWrwTPMBmbFLtC/IkUUsQEn+1?=
 =?us-ascii?Q?uXUq8YIC63NfyzouAYhR4ZZm0XAxg1NC8k9lyrOMhwnABUPMCCWFuajL3g9V?=
 =?us-ascii?Q?GB9VfPGVuAx6+iIovj8dVoKnKFCTUTjx2ixBNyrIR1RMLr5MpqJL74qq2+Rg?=
 =?us-ascii?Q?qxsz5R8map2W845K+dmVXiq6hY+bicTDAKqCkxNT0lvt3X0yElfvz91Nsw03?=
 =?us-ascii?Q?tcH6ZWwdxwWKJxtYvrZu1goc599G8AWoYUAetstStiWyhfnSZUtXo/HmGTfw?=
 =?us-ascii?Q?L4BRXD0H6ngRuaud/KPw8x+dveeOqC62EDh75yW0CXrZX03wPl4W7M+M84+K?=
 =?us-ascii?Q?bS4lh+KYsJoC101STd/PXfsFsRRjGSljREU/yRrb4iJ8q4u8eOm9TLAo8IyR?=
 =?us-ascii?Q?X4ayOySWszJDSCljORY5AGKTRZ7P/MFoQvgXdwjczTfb1HDA6Ycr9oWNLTQd?=
 =?us-ascii?Q?Fg8L8SJ/ygoVLv8AgqYUIrL2kqNa0xgH56JNRgXF3ttJHc0oD0+n05Fk0FDs?=
 =?us-ascii?Q?1FHzPQVGVrS5TcSp8QToC/e49HUVFnlQteRy7sFkrEI/Op6BPxxBAWgpc3W0?=
 =?us-ascii?Q?Xyt3edNBXYuFgukN8cTMdyoVddPrIaKXMXl87RmzfGTcxssh/t8wdvzhrG2j?=
 =?us-ascii?Q?YXP/OkQCF4VGuSUSl8IV6xGGSgnc5nhxmVVx/Mh+uiLgd8Shlj4etYuDyIg+?=
 =?us-ascii?Q?v14yCHKCgNTko3cmAsJpbXPec34xNUmWmC26UJ6XG+WB42h0qy0w782m39IW?=
 =?us-ascii?Q?PH/K8mP3Vn/6Fybh7zpXdM18j2wdqnNgn22ka0lS/Q8eDrzuXjnAmPmaJIvz?=
 =?us-ascii?Q?duW07BT8/ptpPm32IgT5q8e65xOZOgGzrDCJgR1H9y9ry5fIfmSWpRjTJpGL?=
 =?us-ascii?Q?8Ri5ah/+ZT5lpOiMX+sAfuA0gpNxEXrzn/oINyLVaixZlYJ7cs6p0ywGuDwV?=
 =?us-ascii?Q?mUAYLnIztGJ57hdO6MvzrMnHPGK2hL540IEJBjPpYkApXLcNcRr7BKOR2Akf?=
 =?us-ascii?Q?gKp+nC9zuLAC+oSHDVko+cGoFdN+aTEHqQzuvl+hPg94KOzp5AlGDzU/xhNk?=
 =?us-ascii?Q?J4z3PK6v9BRD6//Rjv/n0ca1VT3ITHL4z2H/ww8W5lYmlKhFYmq7wPTp9EcP?=
 =?us-ascii?Q?A5tLusUKI1eIvwR4ikRiA87TctIraAfQlVPJm5qmRHr0fiezjV75ESL2k9DO?=
 =?us-ascii?Q?NWbPV3hDYOFtup7RlIh+L5iVVYwPw37hr742RZPdwjzG6iO9wVj9Kj5XPEBw?=
 =?us-ascii?Q?p1YSN6bY3R0dqVn8lCg+xwIEpqn+X3CbnzluzMk3TiQYVqiI/+h5unCc8EnL?=
 =?us-ascii?Q?jPeyzFIuMahZp+yWrPRGyqt83611j121iqFou/x38mhGsgcexGNVQw8G8D8H?=
 =?us-ascii?Q?oyfwjRTwAg/3EUaNo2Sx1qBII31U8q5buvJpoFUaJlQLOSqI+WLcFCxI4oaF?=
 =?us-ascii?Q?GemdGAXEKyl1Y4pzIHfQsz6U+Qu4IDQvn0IIWS1Z73WtoPW/E6GmANLyErhY?=
 =?us-ascii?Q?qv5pWX9aMCVjqtSeFU6TsSh2Rysjtco=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7360a4f6-cbd2-4a06-7671-08dea61206e6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:09:09.2459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8f1JthR+gJn+fl5oWeAKs+3GCNnMEqDKq2kgnfaJuJzkjPJX91zOJdKVkmeA04S7A74VqyaJCa/NyPKZMaCh8nOGXkEICxdSXw/pQNIkYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_100914_337570_5BF1E46C 
X-CRM114-Status: GOOD (  19.10  )
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

Allocate local percpu vm area.  The delta between the allocated addr
(chunk local base) and pcpu_local_base must be same with the delta
between chunk base and pcpu_base_addr.  Each CPU's local percpu area
will be mapped to its own page table.  This section of page table is not
shared between CPUs.

And free local percpu vm area.  Also unmap from percpu page table.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 include/linux/vmalloc.h |  3 ++
 mm/percpu-internal.h    |  1 +
 mm/percpu-vm.c          | 91 +++++++++++++++++++++++++++++++++++++++++
 mm/vmalloc.c            | 69 ++++++++++++++++++++++++++++---
 4 files changed, 159 insertions(+), 5 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 3b02c0c6b371..4b53992a063c 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -311,6 +311,9 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 				     size_t align);
 
 void pcpu_free_vm_areas(struct vm_struct **vms, int nr_vms);
+struct vm_struct *pcpu_get_local_vm_area(unsigned long hint,
+				     int unit_size, size_t align);
+
 # else
 static inline struct vm_struct **
 pcpu_get_vm_areas(const unsigned long *offsets,
diff --git a/mm/percpu-internal.h b/mm/percpu-internal.h
index 64b48b99ac06..2c560e44ee58 100644
--- a/mm/percpu-internal.h
+++ b/mm/percpu-internal.h
@@ -71,6 +71,7 @@ struct pcpu_chunk {
 	struct pcpu_block_md	*md_blocks;	/* metadata blocks */
 
 	void			*data;		/* chunk data */
+	void			*local_data;	/* chunk local vm */
 	bool			immutable;	/* no [de]population allowed */
 	bool			isolated;	/* isolated from active chunk
 						   slots */
diff --git a/mm/percpu-vm.c b/mm/percpu-vm.c
index 4f5937090590..1e6b8fdcab71 100644
--- a/mm/percpu-vm.c
+++ b/mm/percpu-vm.c
@@ -9,6 +9,7 @@
  * This is the default chunk allocator.
  */
 #include "internal.h"
+#include "percpu-internal.h"
 
 static struct page *pcpu_chunk_page(struct pcpu_chunk *chunk,
 				    unsigned int cpu, int page_idx)
@@ -130,6 +131,11 @@ static void pcpu_pre_unmap_flush(struct pcpu_chunk *chunk,
 	flush_cache_vunmap(
 		pcpu_chunk_addr(chunk, pcpu_low_unit_cpu, page_start),
 		pcpu_chunk_addr(chunk, pcpu_high_unit_cpu, page_end));
+
+#ifdef CONFIG_HAVE_LOCAL_PER_CPU_MAP
+	flush_cache_vunmap((unsigned long)chunk->local_base + (page_start << PAGE_SHIFT),
+			(unsigned long)chunk->local_base + (page_end << PAGE_SHIFT));
+#endif
 }
 
 static void __pcpu_unmap_pages(unsigned long addr, int nr_pages)
@@ -137,6 +143,20 @@ static void __pcpu_unmap_pages(unsigned long addr, int nr_pages)
 	vunmap_range_noflush(addr, addr + (nr_pages << PAGE_SHIFT));
 }
 
+#ifdef CONFIG_HAVE_LOCAL_PER_CPU_MAP
+static void __pcpu_unmap_pages_local(pgd_t *pgdir, unsigned long virt,
+			    int nr_pages)
+{
+	__vunmap_range_noflush(pgdir, virt, virt + (nr_pages << PAGE_SHIFT));
+}
+#else
+static void __pcpu_unmap_pages_local(pgd_t *pgdir, unsigned long virt,
+			    int nr_pages)
+{
+	return;
+}
+#endif
+
 /**
  * pcpu_unmap_pages - unmap pages out of a pcpu_chunk
  * @chunk: chunk of interest
@@ -166,6 +186,10 @@ static void pcpu_unmap_pages(struct pcpu_chunk *chunk,
 		}
 		__pcpu_unmap_pages(pcpu_chunk_addr(chunk, cpu, page_start),
 				   page_end - page_start);
+
+		__pcpu_unmap_pages_local(percpu_pgd[cpu],
+					(unsigned long)chunk->local_base + (page_start << PAGE_SHIFT),
+					page_end - page_start);
 	}
 }
 
@@ -188,6 +212,12 @@ static void pcpu_post_unmap_tlb_flush(struct pcpu_chunk *chunk,
 	flush_tlb_kernel_range(
 		pcpu_chunk_addr(chunk, pcpu_low_unit_cpu, page_start),
 		pcpu_chunk_addr(chunk, pcpu_high_unit_cpu, page_end));
+
+#ifdef CONFIG_HAVE_LOCAL_PER_CPU_MAP
+	flush_tlb_kernel_range(
+		(unsigned long)chunk->local_base + (page_start << PAGE_SHIFT),
+		(unsigned long)chunk->local_base + (page_end << PAGE_SHIFT));
+#endif
 }
 
 static int __pcpu_map_pages(unsigned long addr, struct page **pages,
@@ -197,6 +227,32 @@ static int __pcpu_map_pages(unsigned long addr, struct page **pages,
 			PAGE_KERNEL, pages, PAGE_SHIFT, GFP_KERNEL);
 }
 
+#ifdef CONFIG_HAVE_LOCAL_PER_CPU_MAP
+static int __pcpu_map_pages_local(pgd_t *pgdir, unsigned long virt, struct page **pages,
+			    int nr_pages)
+{
+	unsigned int i;
+	int err = 0;
+
+	for (i = 0; i < nr_pages; i++) {
+		err = vmap_range_noflush(pgdir, virt, virt + PAGE_SIZE,
+				page_to_phys(pages[i]), PAGE_KERNEL, PAGE_SHIFT);
+		if (err)
+			return err;
+
+		virt += PAGE_SIZE;
+	}
+
+	return err;
+}
+#else
+static int __pcpu_map_pages_local(pgd_t *pgdir, unsigned long virt, struct page **pages,
+			    int nr_pages)
+{
+	return 0;
+}
+#endif
+
 /**
  * pcpu_map_pages - map pages into a pcpu_chunk
  * @chunk: chunk of interest
@@ -224,6 +280,13 @@ static int pcpu_map_pages(struct pcpu_chunk *chunk,
 		if (err < 0)
 			goto err;
 
+		err = __pcpu_map_pages_local(percpu_pgd[cpu],
+					(unsigned long)chunk->local_base + (page_start << PAGE_SHIFT),
+					&pages[pcpu_page_idx(cpu, page_start)],
+					page_end - page_start);
+		if (err < 0)
+			goto err;
+
 		for (i = page_start; i < page_end; i++)
 			pcpu_set_page_chunk(pages[pcpu_page_idx(cpu, i)],
 					    chunk);
@@ -233,6 +296,9 @@ static int pcpu_map_pages(struct pcpu_chunk *chunk,
 	for_each_possible_cpu(tcpu) {
 		__pcpu_unmap_pages(pcpu_chunk_addr(chunk, tcpu, page_start),
 				   page_end - page_start);
+		__pcpu_unmap_pages_local(percpu_pgd[cpu],
+					(unsigned long)chunk->local_base + (page_start << PAGE_SHIFT),
+					page_end - page_start);
 		if (tcpu == cpu)
 			break;
 	}
@@ -258,6 +324,11 @@ static void pcpu_post_map_flush(struct pcpu_chunk *chunk,
 	flush_cache_vmap(
 		pcpu_chunk_addr(chunk, pcpu_low_unit_cpu, page_start),
 		pcpu_chunk_addr(chunk, pcpu_high_unit_cpu, page_end));
+
+#ifdef CONFIG_HAVE_LOCAL_PER_CPU_MAP
+	flush_cache_vmap((unsigned long)chunk->local_base + (page_start << PAGE_SHIFT),
+			 (unsigned long)chunk->local_base + (page_end << PAGE_SHIFT));
+#endif
 }
 
 /**
@@ -349,6 +420,24 @@ static struct pcpu_chunk *pcpu_create_chunk(gfp_t gfp)
 	chunk->data = vms;
 	chunk->base_addr = vms[0]->addr - pcpu_group_offsets[0];
 
+#ifdef CONFIG_HAVE_LOCAL_PER_CPU_MAP
+	unsigned long delta = (unsigned long)chunk->base_addr - (unsigned long)pcpu_base_addr;
+	unsigned long hint = delta + (unsigned long)pcpu_local_base;
+	struct vm_struct *local_vm = pcpu_get_local_vm_area(hint,
+					pcpu_unit_size, pcpu_atom_size);
+	if (!local_vm) {
+		pcpu_free_vm_areas(vms, pcpu_nr_groups);
+		pcpu_free_chunk(chunk);
+		return NULL;
+	}
+
+	chunk->local_base = local_vm->addr;
+	chunk->local_data = (void *)local_vm;
+#else
+	chunk->local_base = 0;
+	chunk->local_data = NULL;
+#endif
+
 	pcpu_stats_chunk_alloc();
 	trace_percpu_create_chunk(chunk->base_addr);
 
@@ -365,6 +454,8 @@ static void pcpu_destroy_chunk(struct pcpu_chunk *chunk)
 
 	if (chunk->data)
 		pcpu_free_vm_areas(chunk->data, pcpu_nr_groups);
+	if (chunk->local_data)
+		free_vm_area((struct vm_struct *)chunk->local_data);
 	pcpu_free_chunk(chunk);
 }
 
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 8ef7d9987e18..f224ffec5696 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4836,17 +4836,21 @@ pvm_find_va_enclose_addr(unsigned long addr)
  *   in - the VA we start the search(reverse order);
  *   out - the VA with the highest aligned end address.
  * @align: alignment for required highest address
+ * @pcpu: whether request allocation from local percpu area
  *
  * Returns: determined end address within vmap_area
  */
 static unsigned long
-pvm_determine_end_from_reverse(struct vmap_area **va, unsigned long align)
+pvm_determine_end_from_reverse(struct vmap_area **va, unsigned long align, bool pcpu)
 {
 	unsigned long vmalloc_end;
 	unsigned long addr;
 
 #ifdef CONFIG_HAVE_LOCAL_PER_CPU_MAP
-	vmalloc_end = PERCPU_END & ~(align - 1);
+	if (pcpu)
+		vmalloc_end = LOCAL_PERCPU_END & ~(align - 1);
+	else
+		vmalloc_end = PERCPU_END & ~(align - 1);
 #else
 	vmalloc_end = VMALLOC_END & ~(align - 1);
 #endif
@@ -4955,7 +4959,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 	end = start + sizes[area];
 
 	va = pvm_find_va_enclose_addr(vmalloc_end);
-	base = pvm_determine_end_from_reverse(&va, align) - end;
+	base = pvm_determine_end_from_reverse(&va, align, false) - end;
 
 	while (true) {
 		/*
@@ -4976,7 +4980,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 		 * base downwards and then recheck.
 		 */
 		if (base + end > va->va_end) {
-			base = pvm_determine_end_from_reverse(&va, align) - end;
+			base = pvm_determine_end_from_reverse(&va, align, false) - end;
 			term_area = area;
 			continue;
 		}
@@ -4986,7 +4990,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 		 */
 		if (base + start < va->va_start) {
 			va = node_to_va(rb_prev(&va->rb_node));
-			base = pvm_determine_end_from_reverse(&va, align) - end;
+			base = pvm_determine_end_from_reverse(&va, align, false) - end;
 			term_area = area;
 			continue;
 		}
@@ -5149,6 +5153,61 @@ void pcpu_free_vm_areas(struct vm_struct **vms, int nr_vms)
 		free_vm_area(vms[i]);
 	kfree(vms);
 }
+
+#ifdef CONFIG_HAVE_LOCAL_PER_CPU_MAP
+/* Find free vm area starts from hint */
+struct vm_struct *pcpu_get_local_vm_area(unsigned long hint,
+				     int unit_size, size_t align)
+{
+	struct vmap_area *tmp_va, *va;
+	struct vm_struct *vm;
+	struct vmap_node *vn;
+	unsigned long end;
+	int ret;
+
+	va = kmem_cache_zalloc(vmap_area_cachep, GFP_KERNEL);
+	vm = kzalloc(sizeof(struct vm_struct), GFP_KERNEL);
+	if (!va || !vm)
+		goto err_free;
+
+	spin_lock(&free_vmap_area_lock);
+
+	tmp_va = pvm_find_va_enclose_addr(hint);
+	if (!tmp_va)
+		return NULL;
+
+	end = pvm_determine_end_from_reverse(&tmp_va, align, true);
+
+	if (hint + unit_size > end)
+		return NULL;
+
+	ret = va_clip(&free_vmap_area_root,
+			&free_vmap_area_list, tmp_va, hint, unit_size);
+	if (ret)
+		return NULL;
+
+	va->va_start = hint;
+	va->va_end = hint + unit_size;
+
+	spin_unlock(&free_vmap_area_lock);
+
+	vn = addr_to_node(va->va_start);
+
+	spin_lock(&vn->busy.lock);
+	insert_vmap_area(va, &vn->busy.root, &vn->busy.head);
+	setup_vmalloc_vm(vm, va, VM_ALLOC,
+			 pcpu_get_local_vm_area);
+	spin_unlock(&vn->busy.lock);
+
+	return vm;
+
+err_free:
+	kmem_cache_free(vmap_area_cachep, va);
+	kfree(vm);
+
+	return NULL;
+}
+#endif
 #endif	/* CONFIG_SMP */
 
 #ifdef CONFIG_PRINTK
-- 
2.47.0


