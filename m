Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA0EC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 10:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCz6TGTeY9Fm3CRXI9ycezdJoLH0CKAS6XvyEH2jrh4=; b=i2JKeJRINF75ONQ/N1yM73XAck
	Zl4C7LsuQOSsJ8acKUEE04q1bzpWWvRxTYj+TaojPPGdtU1cjNnKwWUZy46a290Lx7ULBPy/6YslP
	+0gHe+BG9BY3u+3AWU9X9KF2HhNEdR7ZKm3BT8rkGxaWqHItccezq7yX/BQkgAZ/0jIMXc3ylpTPA
	rp3ytZhZgo0exWijJgLRgEtYPxk3NFNMkhZJQtAOMcxyCrLkv8bPk9v5ethfSIzcqdb4Bmr8xjBPn
	jZb2bHMrQ/QxTZKnh5ueCkT0YTdT0XT9I1NgNPtvvnb39/o5JKCEV75ASIk0EW2bF+khRzzK2cKYn
	xylWoZ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0crX-00000007egN-0xmd;
	Sun, 30 Aug 2026 10:34:07 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0crI-00000007eX2-2hJ7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 10:33:54 +0000
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U9rCR23691309
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=JCz6
	TGTeY9Fm3CRXI9ycezdJoLH0CKAS6XvyEH2jrh4=; b=WEtkyWrQuMLAyQJfquvx
	k7UMw94sA32wFOf9YloYUNSyS4hQzHHb0ELsJQ5GIvapw8mZKuXQbGZz9Kx8q2Ia
	65hqikIprptymJ5GEDlBevRjNslGhFLtjnKmDlcEhSRwHx05Huct96UUzYanxApR
	+dMeH/qpAF8Z0bZc3t9xpB0jn7eeXT1P60fiFRnluk2e3IEq+N0Qp2LtgtSyJxd8
	TGWhy64E9dXzIudpWbcPrtssFIaxH5Abcxpis+8U3KcEe7V+rA7nVNboa70yUW0I
	dGNfLwGfbkzbsN2Z6ZjrbD+BJ5poFIcCbk/Hz2tDROeIfsNwpFM0giMzlDO6rXYR
	dw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gcgdtg98r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:51 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5283df62d68so40971651cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 03:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086031; x=1788690831; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCz6TGTeY9Fm3CRXI9ycezdJoLH0CKAS6XvyEH2jrh4=;
        b=QJPA/QtPTOeLQJIMSc6d/ti1u0mtD5NFsTzN3za7iqDWYobKgFwtNTuT4XVYfHtFEO
         jka6KgKU58ZAHUf5gopvXFc+ci8ERmxWXRK1O2XaZabVgxAmQVDuod0LTp5X818ujWap
         02Z2q2JpJ7y8Zf0F/56DlHbTQNTiYd9w5jWThHScOeshSWmbN4FSn+eko5mjoXQ8qcmc
         R8U5BC/nZ2SQDKBStXGQxFoQKWXlQ/jvRjIsQrNqP3wt38I8LOE8RhCi2EgEVepHEsyi
         id1FKvjDw0Z/5+l34pUJBRtzB7PDWAM18gkpaITntq7XMN6bxbAYjv6dVO+yfUCJdTjC
         T7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086031; x=1788690831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCz6TGTeY9Fm3CRXI9ycezdJoLH0CKAS6XvyEH2jrh4=;
        b=GJt/119lyjQWVl4PqYDikTXW3gF9V7P6sbta4UGx6TgMpTY3LM7+W5vG/ZuzKEVjMV
         4wPaeUVVD0g2g0EcewaHQuq33Ln6ouAkaQGzF1z162OUbBFylt0Gn+FvSA4JrL627/+D
         VkYSL89vMaki/F0cOMEaapx8Iywv2igpYGD4R0wIH+EptlRw7No6VNZUS4aW9O8TZb3E
         BE+6HxV7oXi63CihfNgbgdY2LyhrZYFPqpWfcvK7lQ15/wbOKbfU9GuMiAFq5gAMRd7C
         D0tIEUmOjLolmjKRDynYQG6LHY+7Wmd/oORFbBRxYvzZystwmU+sgyu8RNjdlasrvbSx
         5Bhg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+6LfvhPwBUrqWXYeXKnGL8faJPght7xe1S6/4eyLfEafvNI9Z9TaWfJKOf7tK2akYXUMBcRvUjv9T1kbiQQG/@lists.infradead.org
X-Gm-Message-State: AFuF++lU9YX/H7zcNhV+qzF9hEqq+tnM9//+kQG2f6WOjicTLY1QkqUa
	P1D6aHLpdgG14OHA6HSvVTTZZV0LsUgEVxwvgDIZfnmbSrXO9e72xpIkaiEHwrzCY9rgOzmStXv
	6igrp/yUpFBSxNAf0PRpovgUS67x0pwWEv5mg8IHPDMTldsWHRX77FcFoVP/WOi2rqQLSgq7Y
X-Gm-Gg: AR+sD11J11/4Iw3WaiK8eP3LQUkEK7WEjOB8J2I6dHq6swDkErctYLeZ7AduuvQqpx/
	330wCPlngw1sO2Y7nkPi2avf2UFFyIQc5KokWHtQl3DmgKTETFuJ+SDdCkvre886ueJBplQtO5W
	o7EXpI5vyJJ03GN21KZU5MPle3P1Bl3a2VC/0hwAmLr9fMfZ7rho83ozzhx0m/Yf0MV3RhuST4P
	DMeoY67o87UzK5naxD6qRqUtc9nMRY8A8ia8khdQD8JWcjhaIeA8GSpdbK9YjtCkf4lfAsciRIH
	jxDFTeBNst/bT+//kF+tHMhr9sLv+/6+CnvLMM5UQ6SvGj16RuvXpUOMEdeMo9RPMAWvTd68epz
	k8+mjv0JxK00vY/yPL2a9/MK/JcCFhi/D6Eiq3fr7Aw==
X-Received: by 2002:a05:622a:5592:b0:52e:12e8:54f3 with SMTP id d75a77b69052e-52fb93b34a9mr275721471cf.8.1788086025949;
        Sun, 30 Aug 2026 03:33:45 -0700 (PDT)
X-Received: by 2002:a05:622a:5592:b0:52e:12e8:54f3 with SMTP id d75a77b69052e-52fb93b34a9mr275721061cf.8.1788086025492;
        Sun, 30 Aug 2026 03:33:45 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:44 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:27 -0400
Subject: [PATCH 5/8] mm/swapfile: use folio_page_swap_entry()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-5-7786b52acbc8@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=1012;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=QUnk24a5m8yz5ZbJrqhe5QuRGQ1y8Pb73+CWqNpDSpw=;
 b=rD3bjW5VlbToPZmsPYLIPdScpwZ9iyNjv5RFx5o7TeUw25j31bQHhyFDgRRA45Wy3q+XZswAN
 z+0pSelEWUqAt2c+uOLcWNt4kpdF525CGBahVVb1EDd4i59VGMgTxN/
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX0eB3Ejxhh6Os
 Ez+DibiEPS8THOsZ9+Hh4CBd2SjN9QfkeE18vprciqeTHDfMkpIw3IbYM22NoG9XkrBRzagizS2
 2WBtIf7cc1pWRdoWaf0mFykbD6ppkPW2SFxDo1LeRJK/RUitfJ/jqZysAEpEm5f0C9ynYEzJvPo
 5t2TcghF7jkJKu+q/K/QxnCaBoqkUby//X3VS8N8orxnGNxGYfNoRorjWz/pH00SrmRJiyMmbBB
 uhuk43jl5zD94V9Ja41ElBjZzQ37gnf/b0IiYXls/08FaO0Mj/s5/WVugat8meaVOETcevRaX1f
 gfgouZE/cvgTIdin4Epd27X5UFs8lpWuF4wRsiRr687UmS52Dog+NgvjnHDvg5r/acz9/wTLK+I
 G65KSkl7asrCkmPy2e/SnTdOPOZQSlknSz3rdcBfSpHJRCK8CXcZiBEwMGxxn2qQtbpn6H7qv94
 G6PZnNxrmPoZmvUkGaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX4WWXS8hwrKsE
 tYeN7fB7b0bLWeuo/QTO4YLujtrjQqgbeV8O3D3gG1XstQsqk2tfJgZqXDHNY7EpBKGmbG/QQ/G
 tQlyEOMlALwNRoRaWKdzU8rSQWjM39wWs+2vKUTg/hVTYEeK+Gd7
X-Proofpoint-GUID: b1z9o7Iv21kyAkKfVJhOw1tWt5_GEm5-
X-Authority-Analysis: v=2.4 cv=ZKXnX37b c=1 sm=1 tr=0 ts=6a94070f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=xqDBoplpeononJk8d44A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: b1z9o7Iv21kyAkKfVJhOw1tWt5_GEm5-
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=10 priorityscore=1501 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=10
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_033352_812420_4AA11ECC 
X-CRM114-Status: GOOD (  13.23  )
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

folio_dup_swap() and folio_put_swap() open-code the swap entry
computation from folio->swap and folio_page_idx(). Use
folio_page_swap_entry() instead.

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/swapfile.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 58db70424253..c7b8e69a1227 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1810,7 +1810,7 @@ int folio_dup_swap(struct folio *folio, struct page *page)
 	VM_WARN_ON_FOLIO(!folio_test_swapcache(folio), folio);
 
 	if (page) {
-		entry.val += folio_page_idx(folio, page);
+		entry = folio_page_swap_entry(folio, page);
 		nr_pages = 1;
 	}
 
@@ -1837,7 +1837,7 @@ void folio_put_swap(struct folio *folio, struct page *page)
 	VM_WARN_ON_FOLIO(!folio_test_swapcache(folio), folio);
 
 	if (page) {
-		entry.val += folio_page_idx(folio, page);
+		entry = folio_page_swap_entry(folio, page);
 		nr_pages = 1;
 	}
 

-- 
2.39.5


