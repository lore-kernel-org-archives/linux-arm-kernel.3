Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7325AC79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7KTq1kvrsMit8SFzKcwQG7/KUyhDzvAvzAS7QNGVsPA=; b=jbTC4R71txB/J0
	ycIQf19U9L6IyqFimNXuWqOKUHKFZ35rp1V+6EsvThLcyw+RLN9sxEE13469R90YxuuByCvzimsvR
	YFZo2JUVRELOQMB/RLXSk0oz1knE8pTLigKHVs80TgC4stz2KvR1e2bkYsn4anZGtk4pFy8UlnEF1
	iZOdazEbfZy3W0LmTU8qAY2CIJCm+ZtuSRK0awBJ8tNSkf+vzdxlJS1yHBeyG2jHVE8WJuw9/toBf
	0KqakklwcA3TFvxEHiFJoEWeqSLcQ7KFbotQrehnlZHGjEom5MKdHvqhFifWmnoJZdLuRD9+aHgjB
	lf6Bgsi6pdE04nV4lEdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZ7-00000009Qpl-1UkE;
	Tue, 08 Sep 2026 15:16:53 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZ2-00000009Qms-0YCU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:16:51 +0000
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYmBG1082133
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 11:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=7KTq1kvrsMit8SFzKcwQG7/KUy
	hDzvAvzAS7QNGVsPA=; b=in/n1AU8hwERwEDKE3bsHQzCHdN8PKao27b5V92xL5
	ZaiUEQGmekNAL3glvpAW1aqYF/G3hgj+A0bjx+L6cO5knmTAly//PFEF8phzWE8D
	DTpWJAVpetifMXlEZHakVuAL04Bk8G289rEVn/t9lyiABm4y2yS+DP0EPoenATiq
	xgcU5rh68dZtp+ZnZD/of3fd75s8DPIFsin/c3c8e+gGkZPLahmGKnWFbW77SADj
	K3r1NZUZr9QfDXtVQoIOfEvIaTzvJtT3GyZr+tqQgJ2q9He+LE7FAKGufgiuG1w+
	Eu4cUuJ0k/i7SuFaWcLvJxYWIsyc4fvfRkkQ0L+b9Ktg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gjhqktavu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 11:16:43 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104215fbdbso113143636d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 08:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880602; x=1789485402; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7KTq1kvrsMit8SFzKcwQG7/KUyhDzvAvzAS7QNGVsPA=;
        b=Md5rEUWAEyJ+8RZibkCYfmt42qGsJ6taCLBhmoR0MSH785hYw2Qe7f2BjKePRVOezl
         /nH7ivfrdb+r3Ep/ku8BJNVpeOS6/CjXzFgflcHYdCd2QnxKHh4XDDg7EbT0uxyI+wTf
         if6nRa43rVGzl7Cdvt9WlzLWOAj898GPTDuFTJ07jOWli6VZBexvafRP3DgV36mVT10t
         9HOZ/1jq/MdfHreopzNaEuVuGBWPhzZJb9FFPnkNsRaOuEnVVB+kQF+3cT09Np8/CVsd
         beab17Wa89aV8vG18rKHXcSENujwA320XNBqLpUItD4zRbQYso7uVxTpKpWrBugr64Db
         /mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880602; x=1789485402;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7KTq1kvrsMit8SFzKcwQG7/KUyhDzvAvzAS7QNGVsPA=;
        b=PkynxOip1bPyqj3+txhebbRTTTWN+yOeWHalQ7zypsuYdPS2nksB50XfvmVQ3+m2UG
         fhKIXMbkF4FhLgthBeK5MwZolWqHn1DY48aoCKfJjQwvATDMNfIFitlJ3qA1tmFtkR0c
         uCy/SdyNcSurEacYTUeiCanRmkG/0FxLhHsc7RM/W1SWjoFVQ7B3cBudEtkwMg6CS4n5
         PN/yqxIT4tMlwTcw6KUthhNXhClvl0d6mcGqLtb/vmPscd+MKsKAovxsEp9yPh03RwBf
         jdxgReY8tuIbg8UzktbIMo8CICExmWAOaOm00/iksmCYFIPI70GE5cDtuf/xVXlq2IDd
         NezQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBHYt+JuXTI4c87EejdaYh3k1DoalnZhz9wu57Gex0by28ZYm3S4eacQK7HbinAnxqxdsq0kKA62oMa5U5wMKw@lists.infradead.org
X-Gm-Message-State: AFuF++nZnJrQpbaDj+Oik2/OX4jTmFkUrqrAHhPOcl9jIa7kesKBK31I
	UTrVSBU6CMso1nj0xJuD8/y3dpabN995QpmpGke7xnRz0rVu9nE/JffIXQcBINCgxAxoXWEnnVW
	CXeSbpZv56dPpH+xSMy70HSwBf/TTZxX47voN1Q/0JArkA7uLRtipLXZBaj1jFhG+uz860W/Egl
	Ag2Paq7ak=
X-Gm-Gg: AYBFou2FOju70u5faxyQ4T39gUCLb3gWVrvCse7GAOTzSd0HOVYWvAAr0rsnHmTPE9h
	91W0KeM3/Z37dZtGLJ7ZbOND5uUgv4X5cL0QeLEfJNJnRTwbImayC8+pQ9I/a4/IyLY2V9QBhZQ
	9z+S1x4Ev9YpQUxMjPVwz5qYQUVgGdVPdXf270iPawsv8Gh/P9MUAkvFI7yAPLynv28a+gVMbHI
	48p/mbvzh/zJq6D518KF8/di3KxE5qO1RaAlYF5OPDdS93UJVeGAtVG0ZXixPVsoCI5ybHaXMj2
	TIXOzSABye33T2ZBAS2s1f+DZHvk28+0z8yyMTryeJrAiyjmxmBJLqzeOa87lmLPPMRlTvYWPKF
	t8pIrLBx8pAdCYjZw4If1mV3G3zeX3bXcrvT+XXVvH1Q5tOhWAm1BQA==
X-Received: by 2002:a05:6214:3386:b0:910:3453:505f with SMTP id 6a1803df08f44-9103f06f122mr371615656d6.33.1788880602476;
        Tue, 08 Sep 2026 08:16:42 -0700 (PDT)
X-Received: by 2002:a05:6214:3386:b0:910:3453:505f with SMTP id 6a1803df08f44-9103f06f122mr371615166d6.33.1788880601876;
        Tue, 08 Sep 2026 08:16:41 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:41 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/8] mm: remove page_swap_entry()
Date: Tue, 08 Sep 2026 11:16:30 -0400
Message-Id: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4moGoC/2WNyw6CMBBFf4V0bc1QQmlc+R+GkD4GGYOUtIASw
 r8L6M7lSc49d2ERA2Fkl2RhASeK5LsNxClhttHdHTm5jZkAIUFBwWvfkq/iS/cVdkOYOeaZk0q
 m4BDYNusD1vQ+krfyy3E0D7TD3tmNhuLgw3x8Tunu/fIZ/OenlAMvCiVNLrQ1Vl2tb8enIX1GN
 7JyXdcPRyQkHsUAAAA=
X-Change-ID: 20260807-folio_swap_entry-e53d68610de0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=1968;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=BW1jUF2S5ycmeA+jFwvHzlz0Ys2b5JeYJvusxui8Gw0=;
 b=pW4BwiQnZqvQ8s20P0IiCWnMFrvc6b6RE03aLWSNO+VqtkHPIJ6wzKMNqS6Ttm+TPdFUYKmf0
 zH+0YdBwZwODqfWWolQOWLlGw8f47azHMpmTmAO8ApancQrfdo8RefZ
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX43gcSRzcC7an
 weJWw0TutSwc/Hdi/LatuI+4R9DyIDdxrLwetJcnFhXvPZp5KsJFkxAevNQ/IfnStyFK/KZSVKi
 6mFnoG2aJxB1unm5N8RUToIijGL8C5LMCaFkkd8ildV/KptqKWsKN9xuk5Fw5RdDE+fN4GIdgNO
 xsjGGfXJtGG4tgvnJPItbtwBfsOQySxzZNu1GUsVNQXqgPqA9rkYmgmyHFNTrXpnGl6mkUR57QW
 0UpmGi1VheUIeOkdIl5vpnd+K1Q/9S7R/7FQ5EIMIdxZvz92+WBXJioZ53k42kjzaoG4gCZhCQ5
 HJlzxslWXLjbNhOmeBu0ka90frJGiaWNtVkIbkEupesM1ARKGiDnpqaoo7/lf961ZcZC8xMO6Bd
 ysWSCx45/CjX0JPXj2Le13qWn1yj/GtgGVeW/MKsOeeRFsI8fvXHwtvKPNHRgVtt8rU0J7/VjRn
 skKBAkzluek5KpzW+XA==
X-Proofpoint-ORIG-GUID: QNbYpsMJD0UrN080GiYFfne9TzX-a8u_
X-Authority-Analysis: v=2.4 cv=CuOPtH4D c=1 sm=1 tr=0 ts=6aa026db cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=bC-a23v3AAAA:8 a=YU6N8qweUkUyprsO3vAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfXyyVpP1F49pan
 EjP1NGDtTVSOLhc11FSfVFA7y5E7NDQ4jskgvd3189znIRV6nUl5RC5OO6oiYnLQCwjBUlyJJGY
 F2iCV09vcqNMQjnmMQaUb/cC+AQh2yeRaKk4vhrqjZDoQ2jmeuEK
X-Proofpoint-GUID: QNbYpsMJD0UrN080GiYFfne9TzX-a8u_
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=10 spamscore=0 bulkscore=10
 clxscore=1015 impostorscore=10 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_081648_543291_3A70B4F4 
X-CRM114-Status: GOOD (  14.94  )
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
folio->swap plus the page's index in the folio. The swap entry is
folio state, but the only helper for it is page-based:
page_swap_entry() takes a page and recomputes the folio its callers
already hold. Several callers avoid it by open-coding the arithmetic
on folio->swap instead.

Add folio_swap_entry() and folio_page_swap_entry(), convert all users,
and remove page_swap_entry(), with a few other cleanups along the way.

---
Changes in v2:
- Keep the swap entry computation in __split_folio_to_order() open-coded
  and add a comment, per Zi Yan.
- Reduce the zswap patch to using folio_swap_entry(), as the folio
  conversion landed separately.
- Link to v1: https://patch.msgid.link/20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu

---
Tal Zussman (8):
      mm/swap: add folio_swap_entry() and folio_page_swap_entry()
      mm/huge_memory: add a comment to the open-coded swap entry
      mm/rmap: use folio_page_swap_entry() in ttu_anon_swapbacked_folio()
      mm/zswap: use folio_swap_entry() in zswap_store_page()
      mm/swapfile: use folio_page_swap_entry()
      arm64: mte: make mte_save_tags() and mte_restore_tags() static
      arm64: mte: pass the swap entry to mte_save_tags()
      mm/swap: remove page_swap_entry()

 arch/arm64/include/asm/mte.h |  2 --
 arch/arm64/mm/mteswap.c      | 32 ++++++++++++++------------------
 include/linux/swap.h         | 30 +++++++++++++++++++++++++++---
 mm/huge_memory.c             |  4 ++++
 mm/rmap.c                    |  2 +-
 mm/swapfile.c                |  4 ++--
 mm/zswap.c                   |  3 +--
 7 files changed, 49 insertions(+), 28 deletions(-)
---
base-commit: 9d3243fc689fef444f87e0a703b4c99653137e1b
change-id: 20260807-folio_swap_entry-e53d68610de0

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>


