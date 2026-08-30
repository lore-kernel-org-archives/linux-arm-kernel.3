Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13C3C61DE5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 10:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hv7UB85+3sed5S3Bw6RQxVg14F7gqMHHFVjFXK3+ME=; b=pzAi7A1BIaCXJMy/U8Zz6iUZ8t
	kKIFnwyytk6+5UWv5l34v7X3c8zDEbgIVK3ZMXG0P4lAsE4sq9BpdFXf79wsdk6D5nOXj/hDOQ9X1
	ZvXkyNA9A/Nn5gC8bRLa8FULuHAD4qHTW3Gm8kxzax8HZ0Pddtbh1pjSOxD+0vD2+TGjZJ3N5RD2v
	WB1UT7DfhB4ew+wxbtUqSB7vK/hd3cvedUHryUGOpgohMjWvtT1DtsOZ8btibl46SbIg2mzF6UtJA
	KMi9Swm0H90r0Ki0zOGv21S60IwK9IxqpkFDfC2ByxqO6urwa7tmXB/4/lLHoYBLsblbNMEgg9zGB
	+X15vA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0crI-00000007eX5-0JoZ;
	Sun, 30 Aug 2026 10:33:52 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0cr9-00000007eTm-2W3X
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 10:33:46 +0000
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U9pewN3227041
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=5hv7
	UB85+3sed5S3Bw6RQxVg14F7gqMHHFVjFXK3+ME=; b=D8u1sq1d7VwcqZO3Q3C+
	o140neDrpn6FYbpDuNcy11Mpm/cKasG/+o6veAJEI3BO/Rsc1KJWrYTwwwXAoDT3
	VjZ+nncd0mFRsbL225J1tQ8H2RFTZWvaeQbPSlWP64oXd3phUUb1Q2YZtzye8gFt
	yoHfhJ0JvGUspsm6NJzAoyz9bVVUIXp22xCl2nNXgscFko5Ogpc8axyoRovjNCus
	QljAheSEYgDqkd0WqgbBAOWFo+nDTBK7qPEoPb7u315/J6hYsNPCcK1WhCEuHIo1
	OAZCLkpA2gnN6UABkyZe4YXg0RsHVRxYswQPc7cxurnuh8r9XZkDB9Dhd3dIdSQZ
	jg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbs0pvvr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:42 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so51266451cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 03:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086022; x=1788690822; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5hv7UB85+3sed5S3Bw6RQxVg14F7gqMHHFVjFXK3+ME=;
        b=d578UEE6Kr7i6Q6dSV9x2UNOYsd200d/BnqeqJ7lMlSCuEENDVLFeI0TQUVBL9BsKG
         /5+3MGowVQs+EUmd8viNSSut+6IetUsgThi2wGqEWDL6D8vPJZ0I0PjCWCyJv94YavuL
         vwNsCvH0Bemrn3M5FcObU0hSRhkX5eJSbvrSjU39tvtVvpfOOCQIy12Hh8Qdtm1RLnrc
         GTvRk0PLcwTwimysTVChBhBaKtkMfZGyPuIKOUZSGcQ2Tq29TPeJSXPmC59y1HNnVtIi
         SmvJc3kXXH4A8zP9ZvsRCQNqa98aCy/ZXwcnNZ5rjH6JQ4VI0FLtAtgVCmx98ZZIHbel
         Y6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086022; x=1788690822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hv7UB85+3sed5S3Bw6RQxVg14F7gqMHHFVjFXK3+ME=;
        b=UX0x6xWvDxpsg1CeK7nltRSxxME9ld7KGoD9TtPOtpfPxLUFXK/PHuL3jeSF5Sr8G4
         uVWiMvPZQCF1ml95RB/qVEYq9QJnr64B7fB5R68TkylJE2UVP6Hi71SnUcfcSdb/OMe8
         9PUavolQuzvhGsa+Kfj2S1Zxn7lMw6du9GcCjWDEsC/ITLrX69X9EMqcxfBqdmu8REyk
         14FobbclWu5Gb/bOTTnMHSKRFPUcXrVndw1ff9tp5juWxYPcnD9zvxdWpETN7NvVu06z
         41sXP25RePjWoZZTDJd92Bhj+o01RlVdtQDv6ouU36hSRA8KvdXYAO7j+Eze6poJztap
         CVmw==
X-Forwarded-Encrypted: i=1; AHgh+RoSIbs93VeIRlwUOp+l2EX3dYrLkRdyOCmPtEcSVjSJ1qYQBs08GUuJtmt64sDbgLMA4hLnIlV3PWg0jpoy6TF0@lists.infradead.org
X-Gm-Message-State: AFuF++k3RqRClb/4wTSNinzm4I5Kt8yxQ91G9AP8cKxfaCAkGcVGWXdy
	+dHbCJoqLM4teoNQmuZ92fB05D3q94cgVvT8XX6tRKBmXMiMyZzBcxcoLqeV0Wn/r46GRTFp6D8
	bcYbJXLc2bEo/XciESI4+ykH9k5u2E7VORW/XK1FLVj0bkaooXTDqzyNulTq/jLy36YaIQhrI
X-Gm-Gg: AR+sD10bydgu/SOiCMuEIny4TlNHhOvmYQws98Y8UwjPYkW0itqelU5X0t4vrsy9OFj
	46b0aPf/DFqz90n0AelFtMdHrfnGY2Cu3U530sSwDUTWyIltTLLBE93FEcXdmfZcl5dGGstkEjZ
	NCUz1TkGcSB7coMz77IesaANPpUHdQgajOc6+0PHqSs5xlRb4tVrqk+N1kdAxdfLa2OLEkeuabk
	5nVhbij8rYddqbfS4NIYl0IzCS5Vo8EnNCr5NedRnEdc4AM1k56hmW4OAt2BLaEL1Zgv3+HNqlQ
	IHF8obP1hPMQzBDh4M7z+DuJG5u0hBcFKbGbOI8UhlTjwmrbvBvJk9i5D1ErL2QhQbQzDcm/snE
	pu5dkX0RWL4mwSVAAgifJeIx9Gggt1XApsWvFILf90Q==
X-Received: by 2002:a05:622a:1dcf:b0:50e:474a:47e1 with SMTP id d75a77b69052e-5300b8aea8amr14547481cf.10.1788086021911;
        Sun, 30 Aug 2026 03:33:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1dcf:b0:50e:474a:47e1 with SMTP id d75a77b69052e-5300b8aea8amr14546791cf.10.1788086021397;
        Sun, 30 Aug 2026 03:33:41 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:40 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:26 -0400
Subject: [PATCH 4/8] mm/zswap: convert the store path to take a folio and
 index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-4-7786b52acbc8@columbia.edu>
References: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
In-Reply-To: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
        Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
        Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=3733;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=zHKyX7u/bn4nak9pCenYEmsbJoOA3IZ5m1jHPNOzKoA=;
 b=4eGm5s3wMRhMtyl2KDA7tHu6Ni8dzHC/clJdeLywA4tmCGasoudESZYVbGlzGooeyJ5yCSNiB
 DqkznY1tScvD7VGLmhid2OffaI9AHRU0q7WT5HvTmnC+5CEXfKFG3Cp
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX3MbB3Sr5YHWB
 Y2BeFBmeE29SVXOIds0iw1x8TGq7SYkMyGIUqDO9HW02ThLTHhE+2ZHZ2p5x6QrcT+xfr/yKGhW
 UDVamoHnEd4FhXkhP5qaBmOrgEbiuCc0wqv0rwXXNwLnKXv+NiqTKhiu/UNJoQqg138JOH2Rpwb
 iHuQhM2d+zFnzKz2oZ2PtYbvIq4Tom6IeYpoQSJRwz3VHDaFixpxK3IYrLm6T4J4JR/SGVBXgFj
 7Msn7QodJTRx5bCMg/NF2lC+gUm+4nst0wUSJKg8chpM3RaqLlHBGyXkbaHNm5Oln3OA24GaWN6
 pQPIOIGUC9Jxv3szKLWKwHayiQlG6rjS8BKFFaodxGNqsYZniF8CA5PcjF4M25dzPOlMecx6R6F
 wG4InVLDJtcXXCqewBeZzXZA0X3WJ1N+50r4w6hOeMwSyBO7pSyceMZLloKYrXhnmyFn3okzCBL
 Mx1JJ92n9h6hMZz2kYw==
X-Authority-Analysis: v=2.4 cv=EtbiaycA c=1 sm=1 tr=0 ts=6a940706 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=Zkbyt3CucH-xCIxE:21 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10
 a=A0y_DWxS2BwA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22
 a=QOCMdifcju39GKoXhKua:22 a=ASlJD9JRYGfELUMjv9QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX9L/c3mgd+cs+
 /7i5v85wHJKPz6kK+RGk6gS9wBPJdGHJlA1MNdVsOIHOmeDgDo3DN0Z7/QF3YV1vGzwLvFknUi6
 x3Um/QNb13Fe0Sl0aWQHOOGu1D0jTfpomAsK22FBKRjHtEk/qLdF
X-Proofpoint-ORIG-GUID: EYIVZyD0abHkXQ-2B7IugK91yunCkPUb
X-Proofpoint-GUID: EYIVZyD0abHkXQ-2B7IugK91yunCkPUb
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=10
 spamscore=0 clxscore=1015 impostorscore=10 phishscore=0 bulkscore=10
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_033343_769567_3377E767 
X-CRM114-Status: GOOD (  18.18  )
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

zswap_store_page() and zswap_compress() take a page that zswap_store()
just derived from a folio, then convert back to a folio for the swap
entry, memcg, and node. Pass the folio and page index down instead, and
use sg_set_folio() and kmap_local_folio(). zswap_decompress() already
takes a folio, so this also makes the two paths match.

This removes the last struct page usage from the zswap store path and
saves two calls to compound_head().

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/zswap.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index f3ae3c81e48e..3a6f89017646 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -824,8 +824,8 @@ static int zswap_cpu_comp_prepare(unsigned int cpu, struct hlist_node *node)
 	return ret;
 }
 
-static bool zswap_compress(struct page *page, struct zswap_entry *entry,
-			   struct zswap_pool *pool)
+static bool zswap_compress(struct folio *folio, long index,
+			   struct zswap_entry *entry, struct zswap_pool *pool)
 {
 	struct crypto_acomp_ctx *acomp_ctx;
 	struct scatterlist input, output;
@@ -841,7 +841,7 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 
 	dst = acomp_ctx->buffer;
 	sg_init_table(&input, 1);
-	sg_set_page(&input, page, PAGE_SIZE, 0);
+	sg_set_folio(&input, folio, PAGE_SIZE, index * PAGE_SIZE);
 
 	sg_init_one(&output, dst, PAGE_SIZE);
 	acomp_request_set_params(acomp_ctx->req, &input, &output, PAGE_SIZE, dlen);
@@ -870,8 +870,7 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 	 */
 	if (comp_ret || !dlen || dlen >= PAGE_SIZE) {
 		rcu_read_lock();
-		if (!mem_cgroup_zswap_writeback_enabled(
-					folio_memcg(page_folio(page)))) {
+		if (!mem_cgroup_zswap_writeback_enabled(folio_memcg(folio))) {
 			rcu_read_unlock();
 			comp_ret = comp_ret ? comp_ret : -EINVAL;
 			goto unlock;
@@ -879,12 +878,12 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 		rcu_read_unlock();
 		comp_ret = 0;
 		dlen = PAGE_SIZE;
-		dst = kmap_local_page(page);
+		dst = kmap_local_folio(folio, index * PAGE_SIZE);
 		mapped = true;
 	}
 
 	gfp = GFP_NOWAIT | __GFP_NORETRY | __GFP_HIGHMEM | __GFP_MOVABLE;
-	handle = zs_malloc(pool->zs_pool, dlen, gfp, page_to_nid(page));
+	handle = zs_malloc(pool->zs_pool, dlen, gfp, folio_nid(folio));
 	if (IS_ERR_VALUE(handle)) {
 		alloc_ret = PTR_ERR((void *)handle);
 		goto unlock;
@@ -1392,21 +1391,21 @@ static void shrink_worker(struct work_struct *w)
 * main API
 **********************************/
 
-static bool zswap_store_page(struct page *page,
+static bool zswap_store_page(struct folio *folio, long index,
 			     struct obj_cgroup *objcg,
 			     struct zswap_pool *pool)
 {
-	swp_entry_t page_swpentry = page_swap_entry(page);
+	swp_entry_t page_swpentry = folio_swap_entry(folio, index);
 	struct zswap_entry *entry, *old;
 
 	/* allocate entry */
-	entry = zswap_entry_cache_alloc(GFP_KERNEL, page_to_nid(page));
+	entry = zswap_entry_cache_alloc(GFP_KERNEL, folio_nid(folio));
 	if (!entry) {
 		zswap_reject_kmemcache_fail++;
 		return false;
 	}
 
-	if (!zswap_compress(page, entry, pool))
+	if (!zswap_compress(folio, index, entry, pool))
 		goto compress_failed;
 
 	old = xa_store(swap_zswap_tree(page_swpentry),
@@ -1515,9 +1514,7 @@ bool zswap_store(struct folio *folio)
 	}
 
 	for (index = 0; index < nr_pages; ++index) {
-		struct page *page = folio_page(folio, index);
-
-		if (!zswap_store_page(page, objcg, pool))
+		if (!zswap_store_page(folio, index, objcg, pool))
 			goto put_pool;
 	}
 

-- 
2.39.5


