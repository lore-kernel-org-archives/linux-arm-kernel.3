Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C0DC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JCgFZ/UvwntchAgFQ3Xf4ZwQOPcJC/BRoTP7E39rY0=; b=pDtlWVtCOXG4YMHpeQy4F5mQ2X
	4vMjIWNCAV6IU487vuPASTR0GhmanWS3N7VTDUDbQkpiiDFlTmOgX6Ldhr47L7G/JB5lV90GPiZsT
	qaGF1Q5L+pIEt2ZpPsBTneYz/FzUdDRtipWjLTG9GlrLFm1ea/7NZKTu8c9Pk3yn7H68KidsGF2Ge
	Wgx8PcVSHQP9UnxYJ9BuoS3f+g7O/ehH9wWwLUka9IALQMUejcB+qoP0SZ0ra0AFxtLXx79RqWTwm
	8aM8rclzvDOfUthJExkgISt4NoZMYG3MCM8T2bPGHc4v9ECrhu6rm0d1bIZt7j/6Tz3uzeVd7iotB
	29phQs2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZJ-00000009QwD-2uwr;
	Tue, 08 Sep 2026 15:17:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZ8-00000009QqK-46zp
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:16:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3JCgFZ/UvwntchAgFQ3Xf4ZwQOPcJC/BRoTP7E39rY0=; b=ThGooFZoGrqnaHTlfl94UjQ/w4
	Q3Kq4PR8P6gU3pkfA7YKnWkNcPwrmzQymzlfw/HcMnWOFTA0XDZAkJRGsKwaBp35wmh+PbcGPxVlS
	X5VhndUcYfRjWIN9snAAthtQ7oRTe9RDTlt3pgHXxR5ToaP/d/9BAsifAlahM8smtYh8KKJtBM6F+
	zdyXdQZGu4MBtyq+/b5wiubltww4RN10hvnL/zH7HU97w2lKNxLTigtgWKGMCorF1oiSd0B+ydJ8k
	IB9F2YVchZqgtVC4IykGMdP26zCpO/wPOdenCvCGximPzWvwMocRb+EL8/ivjCzlnnxYHXy77h36G
	wk+fR0yQ==;
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xZ6-000000000CW-04ui
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:16:53 +0000
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYrIE981959
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 11:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=3JCg
	FZ/UvwntchAgFQ3Xf4ZwQOPcJC/BRoTP7E39rY0=; b=lLElZI4WDBND/j21exF5
	0Oo0dMdO9bK6mmbakjQG25BaF/L7tpeXTa4lsAbU7J6DLIODHXbFkgUc9Qy4VWNZ
	miOS3hktYN8nFsIztOvv6fGpQQzbmdwdNukcw4N+lvUoFni+Azb+HOgUKlu62og/
	kdkOhzVz9gsY5SNf4nJs7wS/lUGsLtw+tnCSrSp12tZlGKEmuObDblJd83vCj7+i
	BsDGyaQDazVWO5dGobi6JIHwuLEjeSep3sgqQzPpHDu18ysVvCoaZLp55N4PSfIn
	ac52oMyDBnOLyIb5Az9YtV+NV97ocITLWBqkMqR4xmloXiNhGmx5GR2lW6pao+so
	CQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj50j532h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 11:16:50 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91055aae7f4so37627766d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880609; x=1789485409; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JCgFZ/UvwntchAgFQ3Xf4ZwQOPcJC/BRoTP7E39rY0=;
        b=sw5Y/A+JCqhS5tqKsmHev7jACBoG9QPQfVhMBxDKxGO5kQRFy+OVkIQN4ce/fYMVR3
         xEkQ/FxPV3ZEwEsPa7fVa9Gk1lT4WEE59PhC4ULPCUyikcVBvEa1K4ygz6md9I5CPDp8
         saNlF8mJ5gOoNr1NowKDXTDKOMq3W+kqxGrrP8Vp/RE/MlV4Z+9moClN0FySWUjDH572
         gjjwRVEYVpUKvxmqKS0IKOZCkC+XJk6cxE5xUC1eq/ly3EGj6Oo1BWuFFAdKKHHP4Xd9
         bsmzlFDpghZzQqZBhlcJ4730U0pLdRv8JOXWlgvau4EQ5AyMOoByOgsqrp/kpIHo/Q/A
         FR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880609; x=1789485409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JCgFZ/UvwntchAgFQ3Xf4ZwQOPcJC/BRoTP7E39rY0=;
        b=lFOSSaYQwl4qaho6xS6FOOUhGQcwm0r6mdwQwque4dpaqLHqyh5ESBnExqejWj/1Rd
         2NurNAlIO86YQOsM2hkwl3k0CUWFPMjJnWH1nndITBCBGI24MH3q/K6nk+b2TdcW5fv4
         BW4jFXP2s3OQd7mFnAy9MxIBEPjJVFaA0R9jGev9eozQrVJDYiDuYIz8q4sJOdU/yxCE
         w5D2jrM5a5mkBuIz4r0VXQrWMv9X7ihJL78jHidGcdYT7FOAPUxPXZVqH6KvTypJdYYG
         0VNxlsIob8pKeXsG9Hc3Yfcmv11BNfczPa4UILAXBfxfXjXFBiGSYlKKbK4RsSaw+GO7
         m8Iw==
X-Forwarded-Encrypted: i=1; AKwUvBwhaj403j0Iy36QYelE6+TDroa5pbYwHH6HiSf1fA6LhWWqRzZixLavpbDYrK+EZpbT3ZoiwPhgXG7yS1xryWPi@lists.infradead.org
X-Gm-Message-State: AFuF++nlxOaLOY/LWcwubYijQ7ZgBkjNC7lZnqxi/4Z9cyfQ1Cx4f3u8
	KcCBqcU+Kd+SOEemgG/9PGggxJNmVVfLm+jpUvj7f2nffnbaHtL3f1FG+lj9f0Xn/jZDnXLsF0A
	CfXBwfyphpB2ekbSEP3feb36yav0SO3I0PQJzLotEL8WRv2O1NBNxKe1EGfAINsN+2ltCKv8W
X-Gm-Gg: AYBFou2mac/aOwEnLd8rbmRHhTS8r5ViG2UXcHES5AMHsEfw/MZEqR4fRDo31Kzto/F
	4m0IK9xgnD+H3EXYfLpvBYzKeN3M22sArQR7zHR6r8g6aIaznaFdHpJl7K8xSJgQ5a4a8iJEKFj
	oEU8NvDGrVp6TZTAnIO444m92n8SiM1QsIhlX0EjBX8ecN5q10UR1wZYrF6/6iBfW3JfrkMZ6up
	giNGsRP8RA+hbehOTEtgm9rPlMzYMr/oIdQhu1yP6jssHXA1Gr5VDldXD0zBFCtx+8cBjMoFR2t
	jyYQEtV+rIgd6q0XWr01BBJCA2v9EjhRJBeQ+PxWMZF4mFWJLEMZcrjqNPp0brcGkec7EhiwHqP
	6ONyelN0Js031Rc+Us7oklUh3mNXRM5VVUumqck8kYjc0UyKc/3u1Xg==
X-Received: by 2002:ad4:5f8c:0:b0:910:3923:cc74 with SMTP id 6a1803df08f44-9103923d1b8mr310712176d6.29.1788880609121;
        Tue, 08 Sep 2026 08:16:49 -0700 (PDT)
X-Received: by 2002:ad4:5f8c:0:b0:910:3923:cc74 with SMTP id 6a1803df08f44-9103923d1b8mr310711206d6.29.1788880608454;
        Tue, 08 Sep 2026 08:16:48 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:47 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:35 -0400
Subject: [PATCH v2 5/8] mm/swapfile: use folio_page_swap_entry()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-5-ee6d01dfa5e1@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=1012;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=LABp5i3bhJrVd0Am+oCrRIeAA5xV3hfOSmtufFDiLIY=;
 b=6+jR6HpZ06c4dXTH61RnGlMCd2W093XLytaX4GORE5cv8EMZGRyemEpyApxc9zi+TVZItLfVO
 XlmbNtQmc6vBOGaiS1COlSt98pZlWdcycp/k1+8VHxNkEwfvnIXk1gR
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX13VtJwW/VAHA
 5zLxXsWhj2AErto7c2Ly7KwRrYssSp/uFdYmjTL9HwGUL/pcfN5OW0xsXPfo4F4bXnGYmQ2uqml
 IknAzh1w/8st3oQBjVSf419ABxaiOzu7eH2jL8ZMbfRrJIUpAruSL6vqLAGlqa++GN7DwJw5Jnt
 fURNEnyWooeiJ+Z7Q4yPoXSB87K7B8VWRrnINJ/6NYfjvEkaXAyJC1EAhVbyrYW45Y9C8RpmFgI
 5ZgtYwTWDnJvKJIFpJZpdgMahXPuRkr1BM9qI2Wk1qoaJBxUuu01xNB2Sbs/mEFm3AzwZ6iptjE
 6M1XDIjQysUKbMSWJIGEnJ/XdmLnFNbZ1XR19D4KDK3A8l9t6gAx9/u5yx+GsVFjHlBdpvFiaj7
 dqmjioz/g8ESvfLxyPZEOEtrzGM5Q90PaTMyFI5PtZb/wF0VZBwk2LTMtKysD/CdNANMmcJcGLo
 JKcyh4ceuKSmecH58LQ==
X-Proofpoint-ORIG-GUID: 5T8Wi9giLT3tLsUUo9QgUe6xA-kmM37o
X-Proofpoint-GUID: 5T8Wi9giLT3tLsUUo9QgUe6xA-kmM37o
X-Authority-Analysis: v=2.4 cv=O7gJeh9W c=1 sm=1 tr=0 ts=6aa026e2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=xqDBoplpeononJk8d44A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX6oLdNVAAhWKs
 VGpRlcJNUrZlcq1IiZgFBfk6I8LPBBOxmF9HgF8vMa7dv8JhoSey4A7UI0doa1yALC3HRza9fu9
 Xgk51yq2AcCZefKQDHkTyQgEzritbs23L1SVvXBr3iJH0pbD+Vw3
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=10
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=10
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_161652_411033_EA96F4D0 
X-CRM114-Status: GOOD (  14.41  )
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
index 869a918b18e8..0a3a3b2218c7 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1822,7 +1822,7 @@ int folio_dup_swap(struct folio *folio, struct page *page)
 	VM_WARN_ON_FOLIO(!folio_test_swapcache(folio), folio);
 
 	if (page) {
-		entry.val += folio_page_idx(folio, page);
+		entry = folio_page_swap_entry(folio, page);
 		nr_pages = 1;
 	}
 
@@ -1849,7 +1849,7 @@ void folio_put_swap(struct folio *folio, struct page *page)
 	VM_WARN_ON_FOLIO(!folio_test_swapcache(folio), folio);
 
 	if (page) {
-		entry.val += folio_page_idx(folio, page);
+		entry = folio_page_swap_entry(folio, page);
 		nr_pages = 1;
 	}
 

-- 
2.39.5


