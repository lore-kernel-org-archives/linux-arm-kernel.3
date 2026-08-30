Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E45BC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 10:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIf6mQ5jieSfsR95OPMrcqML+UpgXiaHxu+WpaiXhhc=; b=lYa7T/GHLwS5lGB3THL+UCLomW
	xvEBXC7rbGAm7b0QAEUlV9h7SJ0a6bKXQ+LunmQKGvtLNvAEmLO7eazVDQ4PFG+HhhD8rOsYpd0ZQ
	oBwMFFZ6jdtpVDU66Y8t/PWzR8oYGAywZMloK/FlN+XsL/EJMvd8muVrBf5ftmFz3pBXuMaTu2qtg
	3sLB4kw/ADlk+ITYRiUvv2YWuwZ07Wnn1WOfCrKZs1ix7Clne1PED/YTrOdXvS1Kn6bOCV4mEbcHv
	qtPX4bS/xyp935lYcKf6sd9ASx4jGo/Aprg0ifytLCPB2qzLmzIQG6/PlpJUdDwaODjpWFMFzJZGj
	yC6z018w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0cr5-00000007eSD-2OYa;
	Sun, 30 Aug 2026 10:33:39 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0cqx-00000007eQm-35nE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 10:33:37 +0000
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U9f0tj3255280
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=DIf6
	mQ5jieSfsR95OPMrcqML+UpgXiaHxu+WpaiXhhc=; b=JfFX8hjA6sQeEQXVtvti
	qnAfnWQsEs219hHrOd1/v7ObcfRTKu71Um7EpMgtShSNfWiTyXtudW0PGmRmAuK4
	UuF22g+V0C1TnGy6dLpcIyZ5n9gsqlCagIz3B3vHfg7uq+Yz1e6d7c4kRRgR12mq
	Req+NB22JNLGSsTVp4+l/CeOR1InYFXxWSrcqezZrSLdK5M5dxtCgdV6q01LHIOO
	7+pjZmjffLiZWwTnig2OryPwCjYCSJpPYvOyN1yySfVaZV1ScK840Ubrn1nLm7xH
	hEUF5kf8ls6QDE7bLcSwjVbkJHIO/N1Ykfbejnln7XfsB8dyMBu1udurkTxB8y9e
	0Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbrfbvynn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:29 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so51263361cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 03:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086008; x=1788690808; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIf6mQ5jieSfsR95OPMrcqML+UpgXiaHxu+WpaiXhhc=;
        b=tLm2H2GBcMD6/JhRzF0FWEQgCxWaTcAVWcu3s30Lj1w6Ixuc+6PWhW3m7ZgWwizK5e
         4diYBNT+wGcst/hDOBk5QDd/eKPZkTtnc+kMblPjvrXTAsGDu1D+hR88x1FmBoP/bSWn
         4yCuoXW5q1yV+RDb4RWwVea3J/PgotqY7YvTWZlVhhzuHyXQmY64bIIOc6t7Y9AZdlj8
         HPb0Kj4BoI7zDrxRZ26gNkoEsINn9bScPr3CSHmxgbL4s5WKKB4+kJwzp1ovY+JCfvsj
         xtizvlnA0QArO86GW0baciPXpCnxZFWR7WT82akYdTtppmPStCs2SvA/42YhT7/9/oui
         I68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086008; x=1788690808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIf6mQ5jieSfsR95OPMrcqML+UpgXiaHxu+WpaiXhhc=;
        b=h2QmNnWaemZI4V3oq4rAcqSD14KpbEMjRblvL9DSdaJ531Hg4yX1dNbcZbNjzwU4XY
         z7hzJ7YkYz6Vn86Q5UTgs7HprSJlL0IG4TQbiLEEj1OMwziyLf8hNIZ+DNJuoLEaySwb
         facgR6kV7odYtEiL7QczK6qEP9uLFiNoujA2zIHVMNf3IxJ/npqUdjE4gYdrYoYiJ3dm
         ZsEeiSY+cR6E3zWxTDT1lWBcI+dSsS0IVxpGJ98dVMuz2VfI/V8FZo9X7dtgQaIKbT5O
         XLMkD2XalEQGF9I2jC9TBymXb6x/uNYfXRVE2aLZ6YU9mEahoTWwQRyRhrUFPwE5Wwhh
         npWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrba/b0liyenr6FuzTUauvinXd33No8vCtwMoFPcxlLpDbqGQrX0tGf95EwMb+v4XyyuI37+lmGNR5Ts3smskKN@lists.infradead.org
X-Gm-Message-State: AFuF++lOSi1BZ3qfne4oUCDUErDCPutE8G1TYFAWFzon7BTQJteqiL4J
	1z9uG4Z9iClekOrD49d4x+/bsAAM1RvRMSAx5G18qtYRULWo0qSzbkFnmjwYVeyyc4kNRf4CAnb
	kWFu+54xERhkO2Dw6TdO2BnEZrvrefEURyLq4m1nKx141C/WFr5uf4dpqSkEThCUDk/XQPPPZ
X-Gm-Gg: AR+sD13/+sbWHOBb7TS6EAlWqhGKcDIcHcgz0yb5s98CvJBaBmHk29vZwTtUYMherXu
	EgDRgQz6/1AFj/7yeDWdWkryeld6zoe/NjbgFgDTJtgUI8VKYx5hHMdE5BfRuD4PNBH7a7SNJSv
	zf1Rb43l3nj1kyhhmrtxAu6Sz43TrNFc1OivcuciYH0XF+RFfMVLcK+mNzFLQK/MmmA0fJ3sQhG
	20N2dIKQdg0P5+Xxwx9cOlGWHsMh6V4n0jdrJvjexZjUmp0voR1EZe/fncOg3SwuJhqhXgpovCg
	ncReCohTPoJ8otkYmbgx5IoSg+lXJZugAY8u7qnFickUDmbAcACrytuR7P4IyX7D/eZYfTSifYB
	Yes62EIF2A3MYZb0HgbQPudpt5a0aRkqsguWFvT3YbQ==
X-Received: by 2002:ac8:58ca:0:b0:517:c582:9161 with SMTP id d75a77b69052e-5300b777e98mr17168801cf.7.1788086008585;
        Sun, 30 Aug 2026 03:33:28 -0700 (PDT)
X-Received: by 2002:ac8:58ca:0:b0:517:c582:9161 with SMTP id d75a77b69052e-5300b777e98mr17168361cf.7.1788086008153;
        Sun, 30 Aug 2026 03:33:28 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:27 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:23 -0400
Subject: [PATCH 1/8] mm/swap: add folio_swap_entry() and
 folio_page_swap_entry()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-1-7786b52acbc8@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=2036;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=il7UMsRwFpzsLvluAxhowLr70Y3ODPga+2MhlPhEB3w=;
 b=740giHW+JUpfeL6BrdRfZ53BORRJ9DwBndjIt8Y9Znr21EeDOFcOZuhC9z/byBObIyBHeFQGI
 IjGTGV0AMNCDMktbmt2wy/syZZ5NwzV/2uTptcpt9hVzAKxCLlfl40u
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX7MCycCZRuc1m
 6qkU+itEUBA2HO6V2Kw5InZIk/4WJWZ2ylMm+UzYtpiKmr/1X4wS4/dhnmX5hzVzVa+f7D/ZG8a
 0yaGTehWuEnADAhw/NSECXFUUUtfDlaXDwENCwIucTTi7ziTaN+s
X-Proofpoint-ORIG-GUID: uiMP_MOiDV_WYVhK41ypTfP17dAVGNka
X-Proofpoint-GUID: uiMP_MOiDV_WYVhK41ypTfP17dAVGNka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX9hy7Ja/oOeli
 r7tfRUbs4V+GDnWluut/Yls/PxIlAlXP9+1cPMhe9JFWRIUu/bT1mLAQ07RM/O6LYYyjG11FYOm
 AHCd1Yd9jldsR+lP01UcbHPLDx8Naxkm+sNqAJNQ6xr0klLakW/9HEBMyU0gi1uT0c66HJ3FJNH
 gOe1amuxAv9Zujda/DtPF/k9c4hVJP1JKCRdDSeSjF3MWzEsSwdbbbvnrkPlH2lYSZKS7GwjK+n
 YQZBTKGHoB7/IQXK2QEZ8rJ7Rn5k0AFq3eWzEZI1GGh96HKihEAbBo5vNasdnCxnZjf2KDciklZ
 o5zy/oYOIAjAgZM1dFdi2E1c3y9msdEc6lwjH43z2eRdjdkeos84+FYsyZ9ZZhiP8bnR8kcvUnO
 A2m9Vzpb1V8NZh0CuSjm4I++04UhWWOVtrl2byea4V8PmRR9M0hT6Hi4P+EhkU96LY1V9k+BYfH
 KyG/ams+ZHN4Boejk0A==
X-Authority-Analysis: v=2.4 cv=beNbluPB c=1 sm=1 tr=0 ts=6a9406f9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=wCX1QjJdxvQAooojgaYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 bulkscore=10 spamscore=0 lowpriorityscore=10 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_033332_881281_AF3BEFCD 
X-CRM114-Status: GOOD (  15.25  )
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

A folio in the swap cache occupies folio_nr_pages() contiguous swap
entries starting at folio->swap, so a page's swap entry is just
folio->swap plus the page's index in the folio. page_swap_entry() hides
this behind a compound_head() call, and callers that already have the
folio sometimes open-code the arithmetic instead.

Add folio_swap_entry(), which takes a folio and a page index, and
folio_page_swap_entry() for callers that have the page.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/swap.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 0f953ed9c863..48632aacbc2a 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -278,6 +278,39 @@ struct swap_info_struct {
 	const struct swap_ops *ops;
 };
 
+/**
+ * folio_swap_entry - Return the swap entry for a page within a folio.
+ * @folio: The folio.
+ * @idx: The index of the page within the folio.
+ *
+ * A folio in the swap cache occupies folio_nr_pages() contiguous swap
+ * entries starting at folio->swap. The caller must ensure the folio is
+ * in the swap cache and that @idx is within the folio.
+ */
+static inline
+swp_entry_t folio_swap_entry(const struct folio *folio, unsigned long idx)
+{
+	swp_entry_t entry = folio->swap;
+
+	VM_WARN_ON_ONCE_FOLIO(idx >= folio_nr_pages(folio), folio);
+	entry.val += idx;
+	return entry;
+}
+
+/**
+ * folio_page_swap_entry - Return the swap entry of a page in a folio.
+ * @folio: The folio containing @page.
+ * @page: A page within @folio.
+ *
+ * The caller must ensure the folio is in the swap cache and that @page
+ * is part of @folio.
+ */
+static inline swp_entry_t folio_page_swap_entry(const struct folio *folio,
+		const struct page *page)
+{
+	return folio_swap_entry(folio, folio_page_idx(folio, page));
+}
+
 static inline swp_entry_t page_swap_entry(struct page *page)
 {
 	struct folio *folio = page_folio(page);

-- 
2.39.5


