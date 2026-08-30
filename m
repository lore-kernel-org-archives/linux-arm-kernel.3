Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD83C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 10:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LuS1cAhpHN/002NExYW8l/WUkJ7AVF4N4va/1EdeIs=; b=x3Yw11fsEzPTnEf/31OYSDAvZm
	8iZDIxQ+E3n8ap4SoBUDmyYmSgn/Im4YeepkHHwXTE0ENrga2kIYefVLUd2HAKSla2cdNrqKTDlBn
	Vhg+asrvgqwtHStqMnJ4Q3grerLkecY4m9o/yeWAl3NUROE/Qdf06C1NbO0g9mPvAEx9kwVeHdw1r
	kqtjS1VM+1sqvG+7peuQjpJ8+TFbKUtV889jlAN5mNwW25RXYUo7OU9+MDB/2UTbk2YuFWHmYtm9g
	1wfGsB3C2LbiIqm75Z7XM/SrB3F9wXq+CuwGj1XfD6EFZGLhIbijl1OBrQ0ZYHKXYFm100nESi1oa
	XuFzrUEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0crX-00000007ehN-2IML;
	Sun, 30 Aug 2026 10:34:07 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0crQ-00000007ecc-3jBB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 10:34:02 +0000
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U9jTWG3217470
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=4LuS
	1cAhpHN/002NExYW8l/WUkJ7AVF4N4va/1EdeIs=; b=IXoUJkw96fCN/XyjcqpD
	491pbwuYBSKoPTLPSK88jTx3wDc5f/avjj6UkJfc2RY+eAXpwwyQuVm/CNMHtJdt
	I3SGbEttZPJWlVAnQWpY8RBO1G/772+Ed/ktdidamMf2U2YuNV3v0kbAutlecFIu
	yV8AtPLAInDKxKKEMzKIOOeDNBNK7ebrtoPtSTWSYh4POq4ZQLtWI41ynENlkyQ7
	dMv3OQiPLdifw0uCkTh3pu3fjZHNkKI0nHzp+Nola8S3JI3V6OUphApb6lrpoNyu
	o6WA83hKxfObfo6DkAA0GfmTq6W87hHfksB9szLRudRNySij2TovNephxdQ9gyAc
	fQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbudj4n27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:59 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf321d786so22031841cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 03:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086039; x=1788690839; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LuS1cAhpHN/002NExYW8l/WUkJ7AVF4N4va/1EdeIs=;
        b=BTUkbywmz1NPJekCAFnSZiTkgNspEGW7oCgcsuZn95nmVO/xDyKCX8ZHYr2gWzKQ1V
         ZCsCXSCJZh1zK2rJ02HL72WI3HguIiO1vaTzqJP2jjWXEbulkwRYFtBA/r8IDRG5xTWl
         vy0Wcx4xXctOu0eC0zcLtLV0yJCaYoZzEdBLA5kCVSLgs/4daVmah+p2gw2Olc42jgVX
         ZK4J1Od0Pvhui+Ta7FXEliXsUmulpiuRDLlZnuM9r+nqqkfK60o4VUNxaog7moL3WYDb
         kAS2mI6xtnOoDGkQoq/6ga1WX/pX7ukJvipGMyFXBiZG5HNPBjpR1qiR4v0Yp00nhhtp
         PoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086039; x=1788690839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4LuS1cAhpHN/002NExYW8l/WUkJ7AVF4N4va/1EdeIs=;
        b=S/CbwyakCR+X+tJFvN2dUGiqejgvQlclMZkAneVcVWGN4kfwKYhFrp4aI7ZjIPKPhP
         aU00vfUMFoAD6fqi/L1mRVuceAM7HP4BDMolBY/93BE3UDWXMJaZ/6Hq9JSEsAIBrnXk
         umIhQIgqejnCcjPk4BFIPXC3SpIOPxqUkeprsgwIHgX8yveExQ+//4TrB5T4tAvkROJo
         Ac3lm764f2nJFGuKW1v3dZWuU9WRnFfoXOH19Ar4OZwZXZ9MRSWtMLVuPPdoPcCpMjXG
         yzSSlWIQ6+iZ7KgmJ5WzIQ4u3gfs9jv/virm1yMOPdFfdG3hNdIlWC4163QUItX9pR/E
         C25g==
X-Forwarded-Encrypted: i=1; AHgh+RqI+/lomh0Zsek8H4/JT5/EyANo2pFlF8g7r7csZ9ZkXTgucx6DcpPzewbHPBkSMinTKDdfD7NvWNP3s3fUvYmM@lists.infradead.org
X-Gm-Message-State: AFuF++njKFL0ASvXSQADElHHWHV9uFAISwuABppQKnMs0IVn53mfUiOB
	pbfUzX/785y2YDteLADIrhIZjMY1cZybSPOM27Ce4eayWZStWVxn+kWn5UirzsTwugFWhUJMkHj
	2BHBxoy0ZzbOS0/4lOM03FymAi8cxx95ESCbjx11VVdEgMn7aSN+3deuxAV9VdRIwk2f6h7/A
X-Gm-Gg: AR+sD11y3brJpnrNwJvn3Jk04WyEPWaABTpSzNh1t+vc2dte3Duw+CKNFRlS9tXH7dJ
	nsO6UB3v9l0jyktO/dimnqXnhijOa8CwQ2Tkcu0uQBemis2R3h/K9SmqhcA5+H1pnY3a69eZvV7
	sg7ebNJY1dAqBghLrfSS1XNb1qgD3bjp+6AQ5LgZOpHeAHAzRMW+dtZTdqXTnQxNOnUI3bem+S9
	iR+UaFwkx9UZrU/lbqBMWN3dZ6+udW9X9MRAGqOoezHnJ4V+kVR+zIM88/3yMpWGNlITH7xnaHg
	+4EAXr6nHZH0/vncreWCQQ0PQevJKQk8yoIEusUcnvtZ5k0++O05QbNpESYZgu+gE3vBdpbgEGR
	3+0rJgvItGCK9TiPc2fn2P/20+E0e9Z3AeB9dkebK2A==
X-Received: by 2002:a05:622a:1f95:b0:52d:ea18:a9c with SMTP id d75a77b69052e-52fb96ae584mr248428291cf.34.1788086039174;
        Sun, 30 Aug 2026 03:33:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1f95:b0:52d:ea18:a9c with SMTP id d75a77b69052e-52fb96ae584mr248427871cf.34.1788086038722;
        Sun, 30 Aug 2026 03:33:58 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:57 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:30 -0400
Subject: [PATCH 8/8] mm/swap: remove page_swap_entry()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-8-7786b52acbc8@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=860;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=I6pqPB1rjj1dnKeDegsZzTB+MKdm/VicYFt2MhO9II4=;
 b=c1jy1sFkrBpeZiQjHJklG3Cc9bw220ASIOw8htXuLhr6GFpKtinuTg02ps2C0CsMWWqMiNTgv
 qRxm8iGyx/jCCuJf20TtrXph9N7ANFUH4+EmKzwECevAXN+hQ/31BDF
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX07hifJr+oD4m
 UFGjwdnRa9dLrZzSzF6YqwCh/k+bLk7v3WeaW2WIjsfgcXWhu5AH2LCeKFLMi7/0MnCcq5du5IF
 VS0byutD1+ZxIXYL+kFiNQk1vvD6kw+aJV3WcHIhlkQfCZYofKo8
X-Authority-Analysis: v=2.4 cv=Gr5yPE1C c=1 sm=1 tr=0 ts=6a940717 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=t2YXVXqu3yB8mPBWm3YA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 6oTAon1cV7HpigY2T_9Yx2dWLRuMIYGw
X-Proofpoint-ORIG-GUID: 6oTAon1cV7HpigY2T_9Yx2dWLRuMIYGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX3S+Li+iLGC7Y
 /Kq6UcHwlA6AibXToooj5NFW5aL1bk4kHoJ75zf/6l1S2Ucti1OBjAyKqaEujmxDZzP0xEB42KI
 EMhwFaEOtWOmTfGVlRMQL+NmE3Q21e9HBly3yFIFNHXb+LFjE5fCERP2SYe2J/O/mlF9RxarSe4
 Q4As1t9L2nUkpZ+sAS5A4Mv10bydu1lFgzn67kmwYdCqdHHkKTKRQZvyqqbDN746B91QwBPcINh
 oVOcqZ1u3z7Lf+OyZyBR5tlxQV7hDkwBhzPKXnuJ3UTThTiGSuywlVx/qNNt/SMWjPyI8xZMoDw
 3b52PljLB2DcTib2AH1/HbukgEKOrRMmQJPpmwCDlU8+PibKiwibiSR8lwWnOu0z085XFUNt0Yh
 Cdecmcq3wjb2MM9msZvRkIvoomDiGzbcqYNQR3g0BNlTXV1y1m0v4rVy2xcfyQi7K2cpy4k794Z
 jmgY+Uhs3ZXmUZ4/A9w==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=10 bulkscore=10 adultscore=0
 impostorscore=10 suspectscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_033401_047014_84BAC4AA 
X-CRM114-Status: GOOD (  11.09  )
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

All callers have been converted to folio_swap_entry() and
folio_page_swap_entry(), so remove it.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/swap.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 48632aacbc2a..2fa436958fdb 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -311,15 +311,6 @@ static inline swp_entry_t folio_page_swap_entry(const struct folio *folio,
 	return folio_swap_entry(folio, folio_page_idx(folio, page));
 }
 
-static inline swp_entry_t page_swap_entry(struct page *page)
-{
-	struct folio *folio = page_folio(page);
-	swp_entry_t entry = folio->swap;
-
-	entry.val += folio_page_idx(folio, page);
-	return entry;
-}
-
 /* linux/mm/page_alloc.c */
 extern unsigned long totalreserve_pages;
 

-- 
2.39.5


