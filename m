Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30B5C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0W1Lz/54tGMWp2hamaCENav3d3oGjbDnHiZEdOsJjcE=; b=k2l28El53d13m2NE4j4j2eIzNc
	uvYP75MuojkaMLEkAesXpWvcFl+EJ6nt4rGTVuASKmu7EbW7z1xj7fnLcVSpAxs4L2sFPAKXrW3Ge
	zTDR6cyscnEruw/TQW9Yi/NrkKZUWfliHHFD1QNeiIDtGETHDPZimVOyZzbEPpCl2YAdoQ0fFcQb3
	TOAx+M3IvswHmeZcv/z1uixRFNo51hDCvlNttWH0/BvymRf7olMrEap/61bP/gkCCggOLntlqLNVr
	i99gsxOusQS1mQOnHm7QDXxh8Vyw9hycYmOkdemEo3VmAUitx59B21vKlMdCwZc8R+iWOoVmuX0QG
	pzyp/1IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZJ-00000009QvY-26P2;
	Tue, 08 Sep 2026 15:17:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZ6-00000009QoH-3D7a
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0W1Lz/54tGMWp2hamaCENav3d3oGjbDnHiZEdOsJjcE=; b=V7LGcdq5TTDsO3ektxcjEvLkrr
	spKM8CX8WVwEYKiVXpjG/L80cO9XUZdhjisadb9yNXH5YCQ+tWS1BahTa8UsJxpCQ7zruRoNzYC8z
	sPyTnMOJAhnyA8WEfeEnuFM8AlfqBgf1BsFZL4zyM6JePH7LKvHu0RSS5oozTQ6ggoXqcMcdbXj4o
	H8d7y7Ta7LQcJ5sR5IfX7JXRXz8Z4dDa6cWNrP+Af9BefU1GOxTZN4XNC2w3xiaPS3az0goQrKyTr
	Ac8DF+1pTnid4OMj4KOMkO5lzZr9Z/1jiWppw8HdZwmnUqJLypVhrOEZCdKlZ/u/VRr6oXnwqxgRI
	g6ZRTgxg==;
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xZ3-000000000Ap-0DqZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:16:51 +0000
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYjCC1600535
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 11:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=0W1L
	z/54tGMWp2hamaCENav3d3oGjbDnHiZEdOsJjcE=; b=EhIGSTan304r/fde464/
	/uPwl9N/ujQitXaTUybYajUJSVwBUeh7Dvfl3s/Lxxsyz79+AqWxNHzOtJEJozOZ
	DzcidU8D3aVkVnIEDxjSOIlv/W2MLB5yAvskFAbvqNaBQq7ytqx+vcBpIMQH1kRs
	i9UpcJfeqTwWEeUHaceEw5SG2C8v8c4JpdpKY+xg6v9lEHoQpZvJnz3y+JZw+Y04
	do1YsxzqLKRoGEUy4Tqtm1JkiuzlAZNIjSuVANTpTqy9+4yJc9jSyAU0u1cbj4SC
	tG0VxCY7W8CsO7SvuekZNMj+DA/qjm7X+gIT8i5/ajNDVe3GMzVecaso317KvYMo
	7Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj3gadjhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 11:16:47 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9104215fbdbso113144996d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 08:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880606; x=1789485406; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0W1Lz/54tGMWp2hamaCENav3d3oGjbDnHiZEdOsJjcE=;
        b=Aa132rxDByqxWcKdnsj1VQZEG5phy01OQTGdmeh54hi9/prtyN4KF8fODErU9176Od
         CIfzB+QaycoiC8ZjNZsOW5FJxvsQ67e2Ynekt6xGY4zCDFiKDdCQXr8rNEA5wSW7cRTI
         fiujftFDmQcFFM/0AWhurr+W+9kcjX+vGdrZCBMkaLTCDv5H++LhUu8bFlucjRvHFguP
         AznlBOUAACmMTrPrFmH+TLyvP0Jc0lj8q7glRERHDd+o/EUf5tNdi9zajQzmJ4Y43noR
         Yu3gJlGrtAYxtTLzDjj0rDqbTfR8vpW2v6JrJykCFdieY6aXh/idoZ41xPOmEjYfSFwK
         Lnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880606; x=1789485406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0W1Lz/54tGMWp2hamaCENav3d3oGjbDnHiZEdOsJjcE=;
        b=TM9JrQsNiuKR1Ow5Voj5aAiOnAsu8qzASeZCOZ8MCUDEgzUYpkbxwj2fe81OCRgQJP
         aPmfoAhVaE0uk9wFEDUIduBdygLou55jm9/ZCrd9SPz5nMgZD8SP83XjIInXwYJ9huoJ
         5qMUKpx2aTkhei/J/ryPC9LARLHAHuDA6pZr+heuH7eYjsS117KYUn2s2ylCWRjf2xu6
         vAenPT4fUuHRLuMXhQ3RgL0aO1ze3OKHMO9E2uVA4rAnXh5y6AX2TmzlVi0fVWrY6Ybo
         sfASqffc2rJgq++YBGm8skxj3BaW06NvQjhfoFo87mbQvy7EyyXTlAPL7gQe6RJyxMFn
         VGQw==
X-Forwarded-Encrypted: i=1; AKwUvBxZpni+IId9mzlGo4JrSijZnm/9i/NSOSpmlUxWuzEhu5ny4e0a3XKqEC6FR033yM7Yd7xkCydVRyhTAX98udb1@lists.infradead.org
X-Gm-Message-State: AFuF++ma+IkJbXNDoA9G/lo1kaLGtDxtRf95Ydi13Rs9iJbengW6R9kR
	SCTDJ37epk29httXE1GkLKyINbPxitPu470JnvszCkZ1DmGgKF7WXzXUj0Cuv5N41sN3uS/4Foi
	Oy0p3cfP/I3WidBD4bTA5bUNb/bT4WzemU0/jT5w76KsjdRc1nsWVp2YWONPV1Ed5fGgT08Nq
X-Gm-Gg: AYBFou1fNakV2ODTNVUW4aSE7Fws+fJVZrio2nBsC4jFXsUh5D9gsWVQdglGyWaOwAl
	bmNcN4psewKF8pEQ2b+WYbZBg8yuXwTomfc/JBMJZcCxuVKWPjexwfNBdluer4D+5Phk9jheWZL
	OpVdHZuC1NOOJCbmOPiWqBay64e9pZqiaoDqYW921U4mARmsYr+NB6aJXiziLgFGj+1U3OGYSPh
	tvn5c/9+JSPRT94yQQrkacMe629mGl6LW0nBccYZggleTwCH51ceorhpIGFjWUom+UrMuAZv70J
	ThNZMoh0klo0Y39lcmUMhZzlxVw4fJA+a5Gt/BpJFZJ3LWBWc670BiRPr9ehnKJgQHJh6SHgtFw
	1+NkEKXyte0Oif8MTR0f4iCJs/DMXQQMQu86FFNKC+CJ7iwFY6k1WLw==
X-Received: by 2002:a05:6214:398c:b0:910:3453:5060 with SMTP id 6a1803df08f44-9103f06ffb0mr368498486d6.34.1788880606270;
        Tue, 08 Sep 2026 08:16:46 -0700 (PDT)
X-Received: by 2002:a05:6214:398c:b0:910:3453:5060 with SMTP id 6a1803df08f44-9103f06ffb0mr368498146d6.34.1788880605812;
        Tue, 08 Sep 2026 08:16:45 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:45 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:33 -0400
Subject: [PATCH v2 3/8] mm/rmap: use folio_page_swap_entry() in
 ttu_anon_swapbacked_folio()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-3-ee6d01dfa5e1@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=796;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=yvkP2mDf2z80hosg9Pmvfjl+tEpO2wMDimHyUBJdJvM=;
 b=9NTCtRV8ef8tsMDWIW6LGrns0RiqDw6081+w5XUEOPyzRj7uB4Tjy2rWtBHQT/fE7wnw8kXJf
 Ba8d8kUblc6D13/0BuFkZZ/M0zXTyH+jrCL1a8+dKG8i3uQOKN4EQVo
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: rSnFf96mNzrzBvlhxKydy5T2c6o9vJM2
X-Proofpoint-ORIG-GUID: rSnFf96mNzrzBvlhxKydy5T2c6o9vJM2
X-Authority-Analysis: v=2.4 cv=C7vZDwP+ c=1 sm=1 tr=0 ts=6aa026df cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=gAJobatAmFEwf0K8sXEA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX16B38IhVcuD7
 qmJJVsR5zc45br/BdaodNeiTxuO+sz6CGhpOL7k2KMeoESbnkSZ3m1yPOHH16R266J0SbThLZV7
 nNTiVYgt5dKksu7BpFjC9bAsq2kk/vFnHnxKqONqFd6mVvUB/0bCDaSiUQUOEHSXjBJxZ+EC1XF
 6Mh8TLEGSKHL/uNkQ7DnSpdQVWKhbKqbTKx8No4YaYL8TQcwyr0V3fx5rOOk3wG8tBONKMH9/8v
 nxkbI77Gvx0xDNfSG8G4iXFgVBP6kGyVmaVF7toQ64JnJGhOoDdH2bR4qwVpDRVmIJRq9VSxhpi
 maVTEQlexpJ2NCmKG1AaLml+8lL+4txQV6TQPy6HL8JeCSsXjMx9Ze63TMqDk4eAWLuKd7VVWm0
 WArrlaKBUjtq8t7QHlh6hRoAcyStfMvzHQB2FatJSr/X0iNgqayzjwjDuLass1aA/C0+lNykZ4v
 pGO0QcSouYZrgnKWfoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX+dQgNMNXmqoQ
 lmOb78V7cILPK+WIDoikyC2tG0W1Xee9rJc0MKCxr+7oKbAyFgDTybXXSDG6GrKeunWrNVR4sr/
 Bzl7KsaNhFGc+SXV81C/ZH+y/tCqLemzmzLu4U5x2McA5wFiIFdV
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=10
 bulkscore=10 impostorscore=10 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_161649_556584_6EC647F6 
X-CRM114-Status: GOOD (  15.03  )
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

We already have the folio here, so use folio_page_swap_entry() instead
of going through page_swap_entry(). This saves a call to
compound_head().

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/rmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 5fefe5b060b1..193e1264b631 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2147,7 +2147,7 @@ static bool ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
 {
 	const bool anon_exclusive = folio_test_anon(folio) &&
 				    PageAnonExclusive(page);
-	swp_entry_t entry = page_swap_entry(page);
+	swp_entry_t entry = folio_page_swap_entry(folio, page);
 	struct mm_struct *mm = vma->vm_mm;
 
 	if (folio_dup_swap(folio, page) < 0)

-- 
2.39.5


