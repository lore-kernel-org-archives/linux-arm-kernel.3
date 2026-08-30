Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F40C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 10:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUGgy+CgNjku4PJ/FQqlsQRbEqOOlPzZGqKdff23MIY=; b=F+/l2yNtX/oceCLGs1AAnMicqd
	XbVtTA0ct3NnjAdsZRzCuM+yYMauWiCrnRUuD1D5vKAdziXYE52C894aJ5z0O8l2fLm08OJLLvxXQ
	+IGF84Mlt7lgJW/9SQoHelpEbLV7AFDfZfm8Hbr+jbF9bWr5rmnBSUkEtUHkg1UCeV+zSICrNOngj
	rIhRuhc8u0Uprhd7Cw19NdPqY+64XPSVFmCCd3TyiTcNgFJSNaDxKmXZ2NNr6kfHJPLX/qnw7A7Oo
	k74W0i+1KM26AcqykJue3nfqz1IEY//hPdVCVgP1KazcG+jBHGooD5an6AjmSR4H7icVkWc/Gj5cu
	6ZETxucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0crX-00000007egw-1pZ3;
	Sun, 30 Aug 2026 10:34:07 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0crQ-00000007ecV-2XPX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 10:34:01 +0000
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U9pP1u3333836
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=TUGg
	y+CgNjku4PJ/FQqlsQRbEqOOlPzZGqKdff23MIY=; b=hVKwFx0hCSsZz5LmdePQ
	m0MIIXxBNMqk2TTE1r4loNFqwx04Lk+KyP0ANLw8p2b3pFEWesqV/I4u6L8EkBHc
	Ki+S48u1n8GvEGat8Rtjc3TUUqIdJhvCqYNrD9R/rIqqks3p3mk5CBvMuIVs8Oz7
	B//B9LqyRpbCSDnmdkjITeC47HXFSy+g/O5Z3/6qXde+vRLmNkS+cXQS3ZHR11ge
	pDD3LBJu+sx4wHBK7dQD+kY1QY1FQQgf+h+y0Woje8ozX0gMNvzrXuXCewHk+KO5
	0vROpyniv4JLtNCGRncW9+rPI79l/FNM6rRKlvDVfa7axqIxq4ZKLGZ0FZb3mDDH
	QA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbrhq514s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:59 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fc3bff8bdso36263341cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 03:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086039; x=1788690839; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUGgy+CgNjku4PJ/FQqlsQRbEqOOlPzZGqKdff23MIY=;
        b=anxPCghLFR/tktofQYjrMkYX3sV/wP/4KhvpknZmoJ88rCB4JzK2L3omJBBcPx7oBn
         RB6ky7vtjav//q4yDFNFG1nLciaSL/jO0jcG92YxEYGcvCWNfKExSsO3oj7Uh+Bx4oGM
         +ZmUnlErzOtEITS7PBmonAMIvUMZSPubQZbwwOwMrK0KQpuFeb61cJ6QSgqZaVqVXjMW
         O111+1A+Us/MMgSAv8sGWfQ0Jl5tBJv9oMAS390kLLC3+kKrsEaNSn/xljIEbaKdcKHW
         31ytOkeIuKoZkdkaFo/s5GIMuW0WjtfqOwsrJBRfNrfn1QEemooJspF2wignQKXbDk/h
         N45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086039; x=1788690839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUGgy+CgNjku4PJ/FQqlsQRbEqOOlPzZGqKdff23MIY=;
        b=DtaoMMDyTJ9XenU5ujr4F5vOsAuXTnSPCqJcHA6BgTEmzWu66QO4y/j5lfVo6vfDtF
         61e6UwMPV0/4hVEi1rXDKHmTG7HnRL0o+Ua1KLHU3JKnc+2l8FPqMHsKUfLIHlHhSWPR
         LhX8sWUiB9ho0MW88YPyqtHCOnPR7SGYGe4qbzRPwq+xbEyjY4Pyjc8MdDZ1R+ouYYTf
         zboWp06f+5ZYpqYTXh31CCuE3qrU4hs3tk7+lLLATqdx8sn72xJ0mJif5kUlWJe2O1SY
         A/3oNmJi6pGVwVUKmOCt3rTJzdIAtA8Qu0xSGbuKYj/cuq1cB0R9ciUPQnEMvisjm3+8
         cr7g==
X-Forwarded-Encrypted: i=1; AHgh+RoKsopd8ypD9rDfzEF8kuxhxcOLSQx+Xj1C7C9hwYVF8TCmE2e36l6Ht/UbG09b3dU3v4aWp3iuTEAQR+iGt4ZL@lists.infradead.org
X-Gm-Message-State: AFuF++nIMDwOQAh/f7OIXQVnPVR1XNvkSajS9SQIztUBBXCrZEMYo414
	XyVM7BZbIgunVHiffsqe3V3YaTteOen2X2nbBqvngf+6vpXF4l4E4BFDbsTT3LTWAkCFMT/ONp4
	EVVlpjSyPpKlq+75AzIB6596ixQd4MCOiuhLNgpYteh+FwJczLaXMAPDxkTF0Ixu3GYrX8tmZ
X-Gm-Gg: AR+sD13cIo5VT4YNTjwPUq36Y1VhfmYhq+Ue5+OVpjQKZjgsXA2xerhOT9CPoZbc8AS
	DQ/2wJpwlu49oLnN7OKEHQRYCJ0jO4RTLwTMkcEjxy1JELkP4YaHPj3Ix75/ZfaWPMaznOFMWze
	p9Iyjd9sK2T+K4AtHC8dtDpppNNPHqCYMs/2FgK3uZ0xcYjKx2zsQ5ih1A+LwaPdENKqaM0AAbp
	Z3kY9RaDBMLH1Vvjn4QDu4dEE4CAqLFGea46hktPRkWH+GItRDxqJlh+5rt8R+2i++jVG+5VvNv
	Uwa9e4RNRWuQ0xecpTcnum81bOSPMQBmg+0AYWsvm8SHAeFU89DBA8H/1KtcwCgZsLC9TA+xMSw
	8JngiLTfs576qrPoelPFo0F1cnAkaJQBGhICwgJWi4A==
X-Received: by 2002:a05:622a:48a:b0:530:4ed:c251 with SMTP id d75a77b69052e-53004edc327mr39477981cf.12.1788086038940;
        Sun, 30 Aug 2026 03:33:58 -0700 (PDT)
X-Received: by 2002:a05:622a:48a:b0:530:4ed:c251 with SMTP id d75a77b69052e-53004edc327mr39475241cf.12.1788086033785;
        Sun, 30 Aug 2026 03:33:53 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:53 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:29 -0400
Subject: [PATCH 7/8] arm64: mte: pass the swap entry to mte_save_tags()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-7-7786b52acbc8@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=2617;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=8STOz0RYKi+7v+knfY76tg8bbf4f7uqOVYm5Jf2KOls=;
 b=DZ1RAcNFd2t3tiLlyqIoCis24ccxkX5i8IRMFWWWvBGYd/Bq0q/3TDIYxtAmdd4DXmVWWJweQ
 rUY0XsF3guHDHQMeLSpYerreROURlWUbDCXQd6WCqK9O6SjIYu4z8Jv
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX0GPzOz0dSvy2
 9m4SMK0iJ0QKuRK5djyzASq4eaMAuRpDzmtekrqNZrMs0DK+74MKjJQQelFEY40lqEF11Hk7v2S
 g8Q8konl2UZfitXnenzCsFT6bGKPyt2KqGOX3gfDhqt3rBLD9eHXt4GQ8rXS7rYs83GOed5bR+Q
 z8q+EnRw8cdxbMrL94a96FrV7ZNY7U7FqCZuTwuTOtbD+ckHugezLJLJJr9CZ5Q6x4Qj6CRjCjZ
 G+MqRWxMnnZ8+3gJISoA6EIdEvGsJ7+zgGjxzBDQqSsUEwSmKyLBK4MP18yuIzfFYN21hFP7bjw
 jk0I1r9F+jVRkAilxl9ZReC7ezagzgs9iYvHOL7wyHR4Pqpeo3FDzWlYCXmbm4HsQ4Yc9GobtcL
 a4xzroMIgh5jn+ieXaXm1MWzdC9D9aNSFcDVQ6Lmbw43lPFIGV1aKoaj8E46Nrldgi0lwb9toGb
 YLYaKNxCqroAh0uv0bw==
X-Proofpoint-GUID: nv8m8rrW8qwFQyox6dVK1_wwm4F1Mn8T
X-Authority-Analysis: v=2.4 cv=PeDPQChd c=1 sm=1 tr=0 ts=6a940717 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=p1CcqGZxNqfKctaSDs4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: nv8m8rrW8qwFQyox6dVK1_wwm4F1Mn8T
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX0fgrP1JbJzV0
 yncH8CHEVQFehUQxJgd5jO+UzuPgjZZivDSaNzssi4WEJ8JW4zv5q6RRSXWYzlLkjeOjKDuxDik
 BxnBmFi6HTgrFEOI6+S3tFN6BfepaOXKHrbVmGVqkZ6VOWryA57O
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 impostorscore=10 clxscore=1011 adultscore=0 lowpriorityscore=10 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_033400_772767_FFA4ADDC 
X-CRM114-Status: GOOD (  16.52  )
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

arch_prepare_to_swap() derives a page from the folio only for
mte_save_tags() to recompute the folio's swap entry from that page.
Pass the entry in directly with folio_swap_entry(), matching
mte_restore_tags(), and move the page_mte_tagged() check into the
caller so we only compute the entry for tagged pages.

__mte_invalidate_tags() loses its only user, so remove it and call
mte_invalidate_tags() directly in the error path. This removes two
calls to compound_head().

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 arch/arm64/mm/mteswap.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/mm/mteswap.c b/arch/arm64/mm/mteswap.c
index 3c54afc8b758..f64202b69309 100644
--- a/arch/arm64/mm/mteswap.c
+++ b/arch/arm64/mm/mteswap.c
@@ -20,22 +20,17 @@ void mte_free_tag_storage(char *storage)
 	kfree(storage);
 }
 
-static int mte_save_tags(struct page *page)
+static int mte_save_tags(swp_entry_t entry, struct page *page)
 {
 	void *tag_storage, *ret;
 
-	if (!page_mte_tagged(page))
-		return 0;
-
 	tag_storage = mte_allocate_tag_storage();
 	if (!tag_storage)
 		return -ENOMEM;
 
 	mte_save_page_tags(page_address(page), tag_storage);
 
-	/* lookup the swap entry.val from the page */
-	ret = xa_store(&mte_pages, page_swap_entry(page).val, tag_storage,
-		       GFP_KERNEL);
+	ret = xa_store(&mte_pages, entry.val, tag_storage, GFP_KERNEL);
 	if (WARN(xa_is_err(ret), "Failed to store MTE tags")) {
 		mte_free_tag_storage(tag_storage);
 		return xa_err(ret);
@@ -68,13 +63,6 @@ void mte_invalidate_tags(int type, pgoff_t offset)
 	mte_free_tag_storage(tags);
 }
 
-static inline void __mte_invalidate_tags(struct page *page)
-{
-	swp_entry_t entry = page_swap_entry(page);
-
-	mte_invalidate_tags(swp_type(entry), swp_offset(entry));
-}
-
 void mte_invalidate_tags_area(int type)
 {
 	swp_entry_t entry = swp_entry(type, 0);
@@ -102,15 +90,23 @@ int arch_prepare_to_swap(struct folio *folio)
 	nr = folio_nr_pages(folio);
 
 	for (i = 0; i < nr; i++) {
-		err = mte_save_tags(folio_page(folio, i));
+		struct page *page = folio_page(folio, i);
+
+		if (!page_mte_tagged(page))
+			continue;
+
+		err = mte_save_tags(folio_swap_entry(folio, i), page);
 		if (err)
 			goto out;
 	}
 	return 0;
 
 out:
-	while (i--)
-		__mte_invalidate_tags(folio_page(folio, i));
+	while (i--) {
+		swp_entry_t swap = folio_swap_entry(folio, i);
+
+		mte_invalidate_tags(swp_type(swap), swp_offset(swap));
+	}
 	return err;
 }
 

-- 
2.39.5


