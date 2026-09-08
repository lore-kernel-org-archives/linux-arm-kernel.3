Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41853C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEW56JejWUnkPaYS3ZKh84eLtVvqFm414kT9yUb9ry4=; b=ctgPoEQB1QIlZoVxmOIUloUJM7
	2chzUti7Z+ObhwrOk7d/CCvfLx5KjNsuZr/AHRiyCbzi5dnDjEP3x6tllowgSqt2d8yquSgWwJElo
	2PANSQt5alI6X83MiabTzn00UwGEMNMQjm2riHnXVtF954JgOZF8pfUAztiVpge9/5psdZnwnZIc5
	PfG3Z9jzKhY9vAoiEKk17+0DpQJzTPwA8hNhAZM9qLIR45cX8Zuyfw9iQu5bLGxWigv7qDUnvKvfQ
	kmRtQMz6qgtv8Jy9LEsFEO8faUbA55ZdWWRm7mDJtxR8JOsG1t/PXB0qHK6XKWsNftX8S14KBZnig
	HwJaBSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZ7-00000009QpH-0avt;
	Tue, 08 Sep 2026 15:16:53 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZ3-00000009QnL-0yAN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:16:51 +0000
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYtHU982239
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 11:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=KEW5
	6JejWUnkPaYS3ZKh84eLtVvqFm414kT9yUb9ry4=; b=F8qfU00kTiWnanrMZoAc
	tW1rVxmHitpXEcM2pkmXaG5hQprmnRz8Ac5IJORFDzuSnPavZH2qXEH52m7PTJHU
	P8X9fx+lxEm3WTd2RdpHFoyTxloqoYOG1G/p4IO64Wfv5PK1WO9hGt0yQH3OpYda
	wu+pY0o3l6ePb378loqGUu+h79QeS47gefSsfnwi90uK1O2GAztZ5N/KsBqz89JR
	04OhuRwYtDCceQHgwbSkbZ8kkJedXjmzxXL1PephgK5BUMJcn9GdijLCDgofz7St
	uSrgfIg3K2wmszc8wA/AblhEVBqSoWwSyjO82SMYIfVoJNqzZbjjn3GNWodmDps9
	PQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj50j5327-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 11:16:48 -0400 (EDT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66ce3040ea9so6017308d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880608; x=1789485408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEW56JejWUnkPaYS3ZKh84eLtVvqFm414kT9yUb9ry4=;
        b=aCJflAc4r9Ir2EEKz1l4jk/OBQi8G4x4MmHgQJKfSpQapPhpPo9fBmDKgxbcx0A60h
         65cMtNi2XAe0kpRUVpttSgM9vLi+3hPHJkd8XthMbawHS6rj9ZnPduJcw76LJP9vNFz2
         yd6jnN69eTF32O3lEr4eKkmRXT1fgAY7YJlAwgPZCPnnlKMEeHYu+HXecOr0Dz47G0qk
         9fBZ+YybuO4Xq8fkNdlxsBiejXkhB9dFKfFWHXdhnifR5O417Atdf0grCty4RBJ4gjHg
         EU2La6K7QrQwvBYKaIWZ7I0mBtmyRyPgr6h3LJH2Ez2YFaJOUoen/vEb/iMXHTawn+er
         1x3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880608; x=1789485408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KEW56JejWUnkPaYS3ZKh84eLtVvqFm414kT9yUb9ry4=;
        b=ficcILN16ijgpX5ikyaNBIUbYRgGyytVJ/rByCVKP3BffFF/QUv+ntyjzAFNPuMF+8
         kD6qhpQ/55MPvAeQLo9XwVzWFBRkm5hKDa1HGonipjJYoHYX2vmsqxo2CtDZR5EzI7le
         jGgA3ht3qArAgQSpMfC3RbXjyKHTtxfRmmeSkLP0WYlWaUP4Atr+p0P6mQBFDg2Snq7e
         LSFVMPT2DIu9Bceh/Iyy2CbvHBSGq05y/bkNj2e61AhhdE+N+qXTk4CfZkgzv6i9pUYr
         WuwOJ7FFd9OQeMMQiHi6C96704Uk2QewelZzzKXDQohnMOVrKHPVB3IIQM5WjsZaarck
         GhdA==
X-Forwarded-Encrypted: i=1; AKwUvBwKpr1v7P/B6OeYY5VhIQV+yZskppDeDzS6s5YqjO88/IctkUgAKtwirZYqf0uMYWp5lGXI16721vlCxUG+8FYx@lists.infradead.org
X-Gm-Message-State: AFuF++mD1oXestJMwbUAMna0pLdVKtpF/OK6EWxduZFnrhVKtCoOiFmO
	3bVDlqpjirx5gEX3091cUA64V+ddysM0QSJrmHGj2jq+8v2IQDnqlurwPC6Xolcsajd97o+Qcqo
	Wq5Mf9r8J2Und20KyRfz07Z6FL70EHQPCvWEjQpq2QFhFa/L1IIubEXPGtczaYaBiGlC199E7
X-Gm-Gg: AYBFou2B3oBoRKv2GMM3+aaOQV0rqlLRnwhNySQkTHyeoYlv4hSm1EfufMTIR0j/MDI
	T5efuHkwMWvP1ajgxLVsuSvPi7KDTRlgcBKdnLNKwkUsHyJ4PcPbwu/ZzTLbs8u3YQ2ZI/+HCIm
	7IYq6thnoeT/zVCc9XjcavJT5xcCotdlG+tVEFR24AwXBL+CnT49OTTDAKb/rvkZ3u4mVv+jELL
	3gFfRuCGgXr95SlIatF99nyvQ6+VrATDJ0FXKgtWr8v0pBwdYHtChEZJ783dvzs96u6HvhAtlqL
	u+PyrWomdincVC7cHBgXrwSPQyDunfVjny8yMtuO2CvLfrlWvy658YfcAZt3zy5j9Rk+iY0AzLm
	14++LLT8GTAlqwjk3sT7/Ks/ncnehzHMl0xKxvdNk0+36qIJ5huhjpA==
X-Received: by 2002:a53:ac8b:0:b0:66d:ca8:bed2 with SMTP id 956f58d0204a3-66fb5a6d869mr8592451d50.40.1788880607505;
        Tue, 08 Sep 2026 08:16:47 -0700 (PDT)
X-Received: by 2002:a53:ac8b:0:b0:66d:ca8:bed2 with SMTP id 956f58d0204a3-66fb5a6d869mr8592383d50.40.1788880607058;
        Tue, 08 Sep 2026 08:16:47 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:46 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:34 -0400
Subject: [PATCH v2 4/8] mm/zswap: use folio_swap_entry() in
 zswap_store_page()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-4-ee6d01dfa5e1@columbia.edu>
References: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
In-Reply-To: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=809;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=8AYImtP77V28QZu+QpRL/jO+FL03+XtzE9Z7zsh/mng=;
 b=uZ2zEOx+HX0JY5Ju3hCDh0SXAKTVBbrmKJa0Tzb/jbmsxqOFRFGF7tBeIaRnkWDnl5W+MmFsd
 OWzWdJ95vWBCHcciSRV07CPafJrAmEMk5d6veCOX6VowyFC+1bVmoTb
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX+UmA0TWImf6y
 KbU8KkeRzYQCarRtbfoBD2DlG0EMjKGstYgzCZOsGT5tJOXgLbRJo6bMseqmm/1RDp1W5YyTiP9
 Vs5HHZBcZb6hoo5qzk8MYXeLfPagwSEk0oAfgBk3AkyV0wh4zc4glG/aFwPQgEVzOj+qpb3ihbu
 sIafYNHLZ1bPOqYfxk6pYHPcRDsymPCGEvQGsk+hkGz4sFrn8+UC4icjU9BFORB07vduGlUmkVB
 bOd6VuVyauAue6kUpAaMqHaEkpIHVtybFvYCa+0REa11T2+19vRX+enNZHhMz7Cr7l3j64KlRYP
 cEukdgRx6+mgjsz+tbF42VXV9NoYC4DBA0iSyI2TbZhYJWI6vSzsf3IclHhFlMyra4zCVQAZend
 RYpeax+8SjxK+/YQemj+Vt7UGlmPeibtzUGZjcO9yYxgAxYF2P7QheSWhCtT/b5ZM1lDYVEw+yK
 3uE+jkqRixxqyVZb/0w==
X-Proofpoint-ORIG-GUID: j-BzmTdCORGtjTumZdOOGcuJZsJm4BZ6
X-Proofpoint-GUID: j-BzmTdCORGtjTumZdOOGcuJZsJm4BZ6
X-Authority-Analysis: v=2.4 cv=O7gJeh9W c=1 sm=1 tr=0 ts=6aa026e0 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=Y3A6ZkbiG78JemsH3QIA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX6G+6BYpWE5lc
 yMQFgcYFKErY+pnUvDoFRcI1cltuMonnvJquUN3lNWJQS7to0mU8syiYeb0yaTaLXGiOtopZufL
 YzFM9TlVrPT8jKIRJc+IIpqld/CEoUMUGjKaYjMLLAUEV+h5eoNB
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=10
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=10
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_081649_277436_D0090126 
X-CRM114-Status: GOOD (  13.90  )
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

zswap_store_page() open-codes the swap entry computation from
folio->swap and the page index. Use folio_swap_entry() instead.

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/zswap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 5d0d8bd72193..c27e22d067e3 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1398,8 +1398,7 @@ static bool zswap_store_page(struct folio *folio, long index,
 			     struct obj_cgroup *objcg,
 			     struct zswap_pool *pool)
 {
-	swp_entry_t page_swpentry = swp_entry(swp_type(folio->swap),
-					      swp_offset(folio->swap) + index);
+	swp_entry_t page_swpentry = folio_swap_entry(folio, index);
 	struct zswap_entry *entry, *old;
 
 	/* allocate entry */

-- 
2.39.5


