Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF675C88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 21:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:To:References:In-Reply-To:Message-ID:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRoVtCxPXlE2WTj7/cuKQLp9U1WSy4uS8DQXyNSJ1GI=; b=mL6lpSCxcajTcdCIl+DEtjfq36
	IU0hSaK5k/kefOkyAbMbIBF1xEgxSzyJ9ygJ12aBN9rIiMQ+tbzw0XpbUu7EagHPdidHnKTVktJ+T
	RS1Yc1YrGU9f9stkFQ2HTONBW8rYrkHaz5aR5B8NrMtWM8imo35oCi8/szGsrG1JCr0iDGoVM3fqs
	A2ck3p1KKChJGMzjcmAQFDoVcnkEpjnWF7nBhdZN2MBNMQwH8zm7IDCQbfTb5LwrZEmcIXtO2XCwv
	tX1UUh62/o+1FUXVaUS7YKWIRjjuTLYzToJc5uBeEd+Voz2i9pAaz9Zm0dhrc/N53w829BDblmHVu
	oWhumEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5s9T-000000023sg-1Y6t;
	Sun, 13 Sep 2026 21:54:19 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5s9P-000000023sI-1q75
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 21:54:17 +0000
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DKXfRh652193
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 17:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=fRoV
	tCxPXlE2WTj7/cuKQLp9U1WSy4uS8DQXyNSJ1GI=; b=a707JlvKtuC6saMFXszo
	48RTvnQk78GeFs5uHDcT6SKuA7eDW6+BrVTEhXs3jwE8cnNkDDD2dAWusohAzO3g
	HlznYoK2KnQND9jw4Taf1Pu8L5w/OZ7FP7tA9OXIDq363SIXMe0YGXkTzGg2nP/o
	SpeidmZI56MZiDB+5A0i0qzhEyjZ/AezDp1zgezSUBtVPC+zb8K26Delw4+zyxSi
	8a+aYiorEI9/lr7viJuNv23x1bUrvMToi6Gp546Kh9pYXNwC77vvO0qWR2yM46n1
	Ell5m+zd6BNAs2dmgp0+pMHiQbDoy5T8z2vJsVoGNU3MNp1BbZl+CkSkZJEoHi3M
	wQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gp2mjgaxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 17:54:09 -0400 (EDT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939062ecda9so415127985a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 14:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789336448; x=1789941248; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:cc:to
         :references:in-reply-to:message-id:subject:date:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fRoVtCxPXlE2WTj7/cuKQLp9U1WSy4uS8DQXyNSJ1GI=;
        b=Z6uqS9QiBg2M946yUrKAPir2iGqA6iHOzHI87hIRCTrCqLva/KK3W3eKrBP4iKDF4F
         h/7z8H+JNpNYnOafXtKBYZEZDFmicJtMw2KuitVepzg71wGaH2MqG0WlhchEUXU0sZFD
         jN6VRxGAfLSPrDymQ9tPKfETlfSchz5EQIRBQlvN69wFbcdDndXj9yv6KhMGksXn5X3D
         HGXbybDSOyNYuCIcLSZFiqsAGINCw6kS8x2h2mTtvLF2PjgdmhdbmpMChhixUre9U8xu
         pkYdgbAKvII+q6/4Guw70iGCX7I13M1OE5CbPun/6wp1Jlx7LeQ2wqgOlirEgmltNLyo
         Kq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789336448; x=1789941248;
        h=content-transfer-encoding:content-type:mime-version:cc:to
         :references:in-reply-to:message-id:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRoVtCxPXlE2WTj7/cuKQLp9U1WSy4uS8DQXyNSJ1GI=;
        b=SEwMkTfqIkNh8Fwmtqj6bFJVzDfbTRCgm1gmb11Jnlw7neUXf+fldTYZHkRwKp9Y1w
         ZHf73maM5tlSJ4Gb5lUB5i23COmON3fm47WnGnsnCKoYMwiI/80aR8f/pZuSPmLJXihE
         A+hLwXyhkTvyc4Lyo7/AORzcEqWx3bmYNId95prGAtyjacNhlj1t+d1btOyhsEjU3pfL
         GodOGZ7Hy8AiWrVUk2/8A3mNGUbzy3J+Zudux5u8D1F6wzrTqsfKwcA7v1mwftY9CKV+
         jVpWKrGaOPXCknrnDyi1fElIb7Fd8QEpJSHVWmArUh37UQuj8vF87Cc0a4DYBAgc17n7
         ZYYg==
X-Forwarded-Encrypted: i=1; AKwUvBymOQhSxUQ+tNGAZ3u1kYriPcyec9Obx1QeCHtB+v9cvK1CAKtTuiWtGUqhnNI8v5B5gRkiBHKIEtIuA07yILJt@lists.infradead.org
X-Gm-Message-State: AFuF++k+6ZkYlzaft2FA0+1RpazTmYMOlmDXvfumvJ4yeeNlRPY9l15w
	3iuk3oh4K99QukGrUzMkQzYFuLVbCZZcq0g8JoRCb+Aav7OiV/FVMU5v6foRUTMBjEXJmQVtVqE
	TSzvWVHOqkSoEwSJovkvWwM+wpzL++odmtbMp4YhATTfx/8z8XwCnqcDBlSTDXRwGjWyVUktJ
X-Gm-Gg: AYBFou3Zc3OdlVyxpKqVrkT0548KiqkKHPUAr3mJIXIxbYDywJc+mys7lMrDROxWwwX
	ObhRomM/F7RhaYlykTBrhJb5rlbPz5X2+77amfY1KGKinbyl1ZtI1/2IZPDS9eyZHBzfah7l0QV
	VUIMxUaqT+tw+mvBMone2JJMzhQniXJp/teQUL4f1+9d4qu/kr9/talrojyJu5ArAJSKEo3W6sU
	NFe5f2q/z84xz1ovoi1igzTOd34pNHbvt5VoWRuugfK4JBlMnJdmw4wQTiNLee7b7iRsE1hmUZH
	SKptxr8OQjwc6cr4GnqeKuQ+XVBQwMpzC0D3ifAnm1vDEzIsu2Aa3u2yfFZuNf4SwVXdnJy+lE8
	JRecY7snfpec/wHmeYmwc82Fy0XbUUF18CCntPUMdJcUbX6hE0I1Q6Q==
X-Received: by 2002:a05:620a:2a04:b0:937:372a:b97 with SMTP id af79cd13be357-93a297fc791mr2911185a.17.1789336448484;
        Sun, 13 Sep 2026 14:54:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2a04:b0:937:372a:b97 with SMTP id af79cd13be357-93a297fc791mr2907585a.17.1789336447954;
        Sun, 13 Sep 2026 14:54:07 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ecc38105sm762619485a.4.2026.09.13.14.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:54:07 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 13 Sep 2026 17:52:28 -0400
Subject: Re: [PATCH v2 1/8] mm/swap: add folio_swap_entry() and
 folio_page_swap_entry()
Message-ID: <20260913-folio_swap_entry-doc-fix-1@columbia.edu>
In-Reply-To: <2b0a6809-bd88-4133-a002-7a9acb2a973e@kernel.org>
References: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
 <20260908-folio_swap_entry-v2-1-ee6d01dfa5e1@columbia.edu>
 <2b0a6809-bd88-4133-a002-7a9acb2a973e@kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NfpzRGD4 c=1 sm=1 tr=0 ts=6aa71b81 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=02raouAbq-PgjEkgBGoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMxMiBTYWx0ZWRfX6QWLV4MDfTeB
 Ikx5AhdAf1a43CzsAC/Z0yw4CM0+u8ol9fIZcYR7sdjvpuKYrO6H0SAtjRutkG0J0M/hvMEUAHM
 OSAtHyix9p9IJrGouOuIQurY4ZNH6/lPNprL9m3WVdnqfHmBbQoqedeKxt9z/J2YWZXU4DD5A2O
 J8wTErIELfXADoIT37UYlMUnc/vOkdeelvfNYgtYOCfjyqLYfg5UVH5zoh6IA0WbBD4soBP9Gyo
 2fTECEyM038DHjMN6A3SkXB4JwuKCtRthqjajUj9aRIm5aTTol49lKE5BwXurXDEyHe5zPIKUo7
 K88lYdpmTfe+9NOcklCNgzxnPFzWH79dwP7l30Q5JgUW8YndqoO+LBmpF/x8SmPsA1tN5paqoAO
 fN2HBR0ZAR0Vih/pjzKslZtv2NL2wquchzBw+05xRc9KxEnz9BF8XC6OQFYLLnpUix2XHdIHMu+
 V2VCoGJme5LSk9xvy4g==
X-Proofpoint-GUID: qZPR48T2SVjd60G7NqY6N47vQMfPy5iR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMxMiBTYWx0ZWRfXwOzDlTC7CK3F
 q2Eb/PoR5jVdWp17PkLZRgzKSYiF9m9SpnlKSf4N+8/0X/Ymv2RbSuOtFTSMJpOSnAgSPCBxSn+
 X6sO3q3BgdggWs1jGtW7Pl8Zfrgt+jE0NToh3CIfOg+5X1vFcMeV
X-Proofpoint-ORIG-GUID: qZPR48T2SVjd60G7NqY6N47vQMfPy5iR
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=10
 clxscore=1015 adultscore=0 lowpriorityscore=10 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130312
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_145415_609346_B782D4E6 
X-CRM114-Status: GOOD (  15.51  )
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

Andrew, could you please apply this as a fix patch?

-- >8 --
Subject: [PATCH] mm/swap: adjust the folio_swap_entry() kerneldoc summary

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/swap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 78974da6810e..43155e122b5c 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -273,7 +273,7 @@ struct swap_info_struct {
 };
 
 /**
- * folio_swap_entry - Return the swap entry for a page within a folio.
+ * folio_swap_entry - Return the swap entry at a page index within a folio.
  * @folio: The folio.
  * @idx: The index of the page within the folio.
  *
-- 
2.39.5



