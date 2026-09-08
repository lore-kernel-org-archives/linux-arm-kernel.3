Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418B3C79FAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gj5Zp+Hf7hb0eLuXb3JsQ3zN3lqZPzkqR65AkPfI+wc=; b=hBlxgSgmzg/791ntGaKkSYci9x
	V6lYDWYBEHLhzmxNkXddaia3gC126Mp6XZkl3pD16h+Mdn5zaB5Vy6Qn/GOncCRTuR96JSabekQaB
	oW91iWLeDOreUdEUVvSmITJw0FFS/07z85ZTAPrANng6jjPYa58R3RCahQePrJvFLxbfRKPF4OZiD
	OlJV/it4GIwZVwVT83i9PPj/5wD5egLJ87pgXxtmGRiOfIgX47lUvmGRBORzQLmhX4wrTHcBFZAwL
	t/kvgG3V4h7mDAQ9msPMlnfQowhEdprZq+tbok+LxL8BDkUKKCCrMBmTvXT+I0G+vSHJLpHN03NBx
	C2PqjB/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZ6-00000009Qoa-3cxs;
	Tue, 08 Sep 2026 15:16:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZ5-00000009Qnc-0MKc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Gj5Zp+Hf7hb0eLuXb3JsQ3zN3lqZPzkqR65AkPfI+wc=; b=SdiloudYTeUMuUxwX/ZV9zS2xf
	s0kyhDvq2mbuDqgTX6FQSGav0MbADa2b4JIdEZmE4uzb+3L24SjRCuqGP1IspKsGr/PHvGNgWzLv7
	gvj8T9Ut7+6dxL1E8Xvx+yUNoCPM2jCcPr99+fjZ6exQGUhWFZoNjn+JQzvypGKOCzmtpBRdwJ9p4
	/Me0PNJFsk8xaBk4JM/pRcQlq+qY1ZeUPJuT7EU9xsaWzsn77CTziQT/IrggiLdUixQ3B//A5/TH/
	Q3s+Ldg0jgNZabYEMPBPZaO4/umU6EY9HAPziC60Nn06gM/fT931pgIU9dzZJp17Xc1cJeEgw/u6X
	qoHCGVhw==;
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xZ1-000000000AZ-3paA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:16:50 +0000
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYoo1900166
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 11:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Gj5Z
	p+Hf7hb0eLuXb3JsQ3zN3lqZPzkqR65AkPfI+wc=; b=hR3yQeBXVrib9uXqGBgE
	H+c2oLr8jUTZ9b2pEsceow1ABxwqElSCI04sTB8TlbgrM+7UC86an1Gd7k8dRpF1
	3kydobGuJMXRBbQE0W088avJtKol4lLVulTgqIU0KELr/9m9qVAoOjhqgEJ1CkXE
	I25YQfg5JAiAOiUBcHZVaYj8qfB2NSRdMTe/nogjtExXhsEwqRErhS9UpGEXiDBT
	/uB664pRcO2HyoPP3nHpuuuOwwtbSk+vKCT02aD+pNvl/1oOtGaCTws+XEk8bDng
	NCg8Y+fp9biK5pMXEtZ/iUvLFQvJia1jTJzmwPPEeweN7bpZM5F+9hznMepTvTyV
	Aw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4ykw1hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 11:16:46 -0400 (EDT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8756efd56b7so56655007b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 08:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880605; x=1789485405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gj5Zp+Hf7hb0eLuXb3JsQ3zN3lqZPzkqR65AkPfI+wc=;
        b=pmk4HC/f0A2tl2aGN+YB18cnslykjPE6o8Hv8FxHCmDBwxlg/NcE5t1+5DOXmZ7lbr
         HW4fZ6Qr+mDuJGgeG3HfEkDCIq6s17vYIBjFSJ00PsRdtAul6ctJRjNlo+pBj0VhXkrz
         yiICNKIKsbUp0nLj734J7h/oRdiPW7bgLz8VuI0TVRdXth8qt0KAx/KAPM8soqTCYVJQ
         kHuc+yYe/cBMcrZRk960Az26Zz3Z2IovHXIzqdtz81pgD14Qo0lX0UZzcnClW2D0h0ax
         ZJbZi6l16Z4oq91GX5DXxd3qLA3LEA9gZNQXCsY5AnAcmWJuxTX/WKEVxw/sRWQiOYIo
         LAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880605; x=1789485405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gj5Zp+Hf7hb0eLuXb3JsQ3zN3lqZPzkqR65AkPfI+wc=;
        b=bY4yr+DC+/W7ek7QNA7JNblNTZd3yCa5eGGrX3b4s2UX5e4ACh6lx5UrgQG4KJ7IUr
         vDETwcqAmYwHwxtUBogI0OpGn7PYB4JlGANCm2opHSwOo4Bsfoz873b4g7f/ws04Upa1
         LZP8FyIw5qKJNb1H9nr7JG9jOyj1QHlCgI/+ZNpSb5K8GbZJ6l2b6b7AnGJ4lfKYBSYt
         gpEY+IHwA1gRy9xwIo1NE7KpqUsiowWt++cQb7/kR4xQ4FJPEI6WyO9CnJi4QewwYNgT
         Gwk7NKqjpwiRau73+HM2OKP+pyoFlt7Smgd5+4dghAoy6CwV7NpATrOGFYYY9DzQxrbu
         o7gg==
X-Forwarded-Encrypted: i=1; AKwUvBxCYr40TflYQLkLrmTv4R5Tx/G6wa77RiSNzPRuavkomR9Qr0dnXMNaK4Wq2n0M+z4AebeQNoesOhBIjCWy1yxC@lists.infradead.org
X-Gm-Message-State: AFuF++nGl8c7lVmb10LMuxFwy718KRNm5zHhFfVkgO412rxfJikjsLdr
	8tWzm8X9KhM6xFiG2lETPqB2dPJvlJP1RgOVlB0qves3CxgBV6Jn3uVJqNmLvI1kxJPskbN/gks
	WHdzSZezh94QsVPiiuJFll3jAkcbWXlguXc2QGXwlORLcSyrvMNPD5y1wNBd6Iki/Z2z6caoK
X-Gm-Gg: AYBFou2/6EGr8Vmv5o4YuyM06XkD1wGpN3Zupa5DB2NZFCkFu/oqfZMloElMjgW5bQJ
	/TWOz2vgAgD9+/hZp76kiHCWrNAR7fIc8gEdDMV6ZJmPa1BNBXwR27AQ4n8rDM8Mfs8VT3I5ih4
	n7/J08YOSwJHfhukvmfquyzBko2xaLBfC41wWavB7y2ksn/OHi/ltg+LuPZtBXB90yxisI4o+Pd
	PTIZX744cImMPvoOH7WkOFacr1lYWfY8wKLiLgVgKw3RrbUvp7SU6W3vYEabLm88nkr8DxvxNDN
	gtXXq2UJg6J9FmyqPDDmMUwofIIX0IlfhKflXSEywbcil4sByfujk7/9l0gc2rBz5+eIXbnw7P5
	7patce+n9gpJh9RoLNlhcISDf4e5G9yZQaPrhhDBkRrjP4L/zeLCg7g==
X-Received: by 2002:a05:690c:7:b0:861:a2ae:8c31 with SMTP id 00721157ae682-87127848ae6mr116780547b3.29.1788880605048;
        Tue, 08 Sep 2026 08:16:45 -0700 (PDT)
X-Received: by 2002:a05:690c:7:b0:861:a2ae:8c31 with SMTP id 00721157ae682-87127848ae6mr116779827b3.29.1788880604485;
        Tue, 08 Sep 2026 08:16:44 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:43 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:32 -0400
Subject: [PATCH v2 2/8] mm/huge_memory: add a comment to the open-coded
 swap entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-2-ee6d01dfa5e1@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=906;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=X5qbXzCaQfbIvXd5MmRhi5GzAdDclgePXL2NiDB48ac=;
 b=uK0LERQcpXKQIHl4Fe0BtkcAaSCmFGqTL2NMvbL1j3TixZ7N83u2P8Bs4llT2jpLvN+8PYknZ
 j48zbH4MSCgB0VdKnnVQAwjEV5D1CfGWlm+Wjq24m4M0lO/kE4WpYYk
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=bJQm5v+Z c=1 sm=1 tr=0 ts=6aa026de cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=uQMuDZbhYfZjsEHDzQ4A:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX79PAEonDrf2V
 txUydb01E/mhqnDlTa31mvZPT93Wcsn+NDZB/X5huSewOrfB5K8a+Qru/nrNayL9GbgHZZn7V36
 6lykDC1devwZhzqFSlqRHIXnqD99k5M+wqptgD+YU2Eicl2BRfEK
X-Proofpoint-ORIG-GUID: ex5XEwd1krfi32KmFxYp6Nm_t3R8mI0z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfXxMFHWQ/FZIxY
 CfYCGu2iKUFQzab071qJUwdiqWN4K6Azbv2r7OpwpQs8u/iW/RpHcnpVr4XHwJV/KEPxoPJ9pzm
 JTTXBmz36JRRRbKX6XN5yW4J0naiy1pdHIEWjzSN/YlIxfmId75cznLNqY8ulHKtDcW8YyxAKsP
 6wEPVmepvf9wkXihxWIkjSK0+HnzCLvo6HfLb34lj1HYZQykypT3Bgv6a0LFC3paS1atgWcP0lc
 HkwlHNbugqTnIZs75Is1JCbKokVECSln9skJYfRVhjK3lM3p/r3WLuTVByOq2cwpW5VHKYQJJDw
 lvQhV8IsFLKQFMLfwWOOC888WztQdwnWew0G1DTrIJkdEalwfx2XHtSsDMFINo8CWK9lI6GDSeM
 lu5CNZr25vNUjvc3yd7m6mK7Q1aR3KRymQEMH0YU/8cjT9E797Q/67owZdTfd8LO9rb3+Qetba1
 jxXVacyJumQYuiztqAw==
X-Proofpoint-GUID: ex5XEwd1krfi32KmFxYp6Nm_t3R8mI0z
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 impostorscore=10 bulkscore=10 priorityscore=1501
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_161648_372475_3B1199F1 
X-CRM114-Status: GOOD (  13.93  )
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

The swap entry of each new folio in __split_folio_to_order() is
computed by hand from folio->swap rather than with folio_swap_entry(),
because the folio's page count is not valid while it is being split.
Add a comment explaining this.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/huge_memory.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d1ce061601bc..1fabdcbd8c8f 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3763,6 +3763,10 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
 		 */
 		VM_WARN_ON_ONCE_PAGE(new_folio->private, new_head);
 
+		/*
+		 * Not all folio fields are valid during a split, so open-code
+		 * the swap entry rather than using folio_swap_entry().
+		 */
 		if (folio_test_swapcache(folio))
 			new_folio->swap.val = folio->swap.val + i;
 

-- 
2.39.5


