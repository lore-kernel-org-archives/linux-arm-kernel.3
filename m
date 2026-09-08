Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E70BC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fX9NElGdJ1vvg7lNn1ooXtrYJaw0f4RzbfQAdaHbR/Q=; b=l6sjmYYPCU2TGtkIUNfew7Fjmx
	dNjIRLMJgHpkCX8uM3HjAe+er/UMdiLLmLr6TKCHhWm+LsLwvWvqa3R+L9+/nki7JSvyuF7e2f94c
	PJoAkXoTKXxDAdH+L9BBecgPc9RrV3K3wQTlQpnbTTkZCbCrY1yYeQ2Ag+uqV4/K8ZzbNYrEjCtr8
	S6pgxmuSjNFlGNJvJllTUuPcJFKsst71iIpo8L6tdj0SLwrn8t+qEKXVwDu7GjUNZN3rku7nnZ0ut
	7ictM16XVTljILt485yE12zpUvY1jq6uw71acSbU1Fe0SIeAPSDsbxJzYMHVRTohAxrQq51repZLE
	LbOoY45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZK-00000009Qwx-0Nga;
	Tue, 08 Sep 2026 15:17:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZD-00000009Qs3-36Fg
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fX9NElGdJ1vvg7lNn1ooXtrYJaw0f4RzbfQAdaHbR/Q=; b=BUOW6jRTC7pUuSOkR7xrqVztci
	ZrkzGb1jHLGjZ5ARZsQxStj1TcBVKJGTFSGx/rxz2JLeqmOugMSrk03L5y+RckUeuxxUyWl+JRwL1
	yXvJ+QumslxZQ69tpW/xyK9N5AkrCMFd6RPm8TWdb8csaU1kvkj1hrvxCimM9DKrv2S68Zj3TUfq5
	DFcfG+Kg6Lb8vvXa3o90X7h9513aDMHGBF3jM6L46+/aMfX4hEgKrV5U1J3yj7BfvC32Dm4K4tVow
	euI3nIePv1J7RTkss3OUflc0l5ybxqKcKNgbN3nJw6dJehI51lMerydO+3nW3+dsS+V7YVNM4bgQH
	69lcLx8g==;
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xZA-000000000Ep-0FPD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:16:58 +0000
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYrEw981989
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 11:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=fX9N
	ElGdJ1vvg7lNn1ooXtrYJaw0f4RzbfQAdaHbR/Q=; b=URL8qljur+o26RNDCwhc
	3otxNMr2qFFL7YmqHUgEk4Ox/BW7+OhP1HTONIGtt/wEcTTAEhw4CQav4KHY3grd
	ycpKIXbs9EvBw3TELRqqCd4D19Yv1uRnkoe94QRpy4O+KSa0cTHtWocpZTOzfMUh
	ByysD6ZPx4pnuvP/y+Z5zt1XCO0iHb2IJuuCTtN5L3vkKydqmhlPUGYpu3CPkd8m
	d8QgsZS7oDb2/z0OieyYkUORtzY2eCGqAUfpDe1GSNgcd0EGpcmInARCvRzL2H4f
	2cFO7Jv7ZAVanKzGoy7vuxFsw+KqKY0Cx7Y20Yh2Y7rm+yM5ukMDuOmSAkJ/Z4z4
	AQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj50j533j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 11:16:54 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8dd8be81so56252966d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 08:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880613; x=1789485413; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fX9NElGdJ1vvg7lNn1ooXtrYJaw0f4RzbfQAdaHbR/Q=;
        b=TTPGOo7+DS2obovk0xfEByZA4uomWJSQ66FZmDzQojOS92odtz9I305r/gohyN15BP
         SnDKgpaqwyBU9cOsC15pURB0KLyclS0IhNqGJ3S8UYxXBLP285tcJONVq/2pjvSHZmKp
         bNEphvS3E6Za36OOdgTp2kzziRatIR7X1bNRVd1C6Eo2n09TzyKPD4yWdBFQqRoo9O9i
         ybJKJCMGUddwrYBhRI0Gh9KkE89KDkN6WZFKl0q2C0eotC4XGaeul+k1Z8xepC8h3QqE
         6vumijxWh0DU/UxOEBPWaNw+ZN9c7j+MQe9gOBd7rpNAZ21Hq2d22oHmVBF2X7otrAaA
         1MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880613; x=1789485413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fX9NElGdJ1vvg7lNn1ooXtrYJaw0f4RzbfQAdaHbR/Q=;
        b=rCi9yT5koT6mWmYyyYguwcmX36fGsWmfb75E913O6aCZgWqKnh3s77M/iNigFSOlES
         DJUaTuWy6UMz1uRZvlrUEU9vquFHVmkZJRoH484AbmJ6hqhxxG0Tp1+A3fuyQeidVEdz
         W94XvK3YLkOYcc3nKO4wTX6wnZjlIsbrMrng9ZgI3FsytVI51Yj6JQAqIO/U2mqzVGMe
         Q7SoQeVtu9wDPgRqVXOBNVT7WqpWgHMGeCTVfDzVPW4RZKGrylvo+Dnq0FQotmWu3dr/
         kvattl7j7wBRKLNI1UG7wQ8qACd7/tN2s0tauPYMb/e+oognfxa3+r7sGEnVaHzWrMxI
         xMXA==
X-Forwarded-Encrypted: i=1; AKwUvBx3Y7Vx/a4Ym7uAeVDs8r0mZaNEyhosJxIkBJl666hIJNGd4dOZDt2mKReBG0H7sIiA2A5ZIdBQmYYyzn0C0EVW@lists.infradead.org
X-Gm-Message-State: AFuF++njCum+877UHX+2pMpmvX4HN7u8wEvf87lCSL71vEFljkal5yiE
	wgGXAiDBE35zH0VIyuqsirmfx4hiZ9OCxMpuZlkSajZOaMTohFdg2LX9yY6fK9RIPjmSXSj1z71
	gipYbgbEmVT0EPPJ5vzM/BLNNqgM7FPY2NsdU107SHX8BCsMdF52PIoHQ3x5qHw42eqOoTOLS
X-Gm-Gg: AYBFou0VxJDQhauQyu186kxKm9yJAud06P5I72+aNNLMmfewVRdO4UGYuOa2imWh4Ht
	UE4ApN2NDRAwHP5eEBBAZsjZd3Y6txIySiBJddg3ajzbkLnHffU+cZ5d5oLKslb/TZJtWJya3OU
	UY/O3wIxrUOYvLAjxGSz79KBM+5T7sgEN/67e0cgM8Jk91U+JxT/ollFryacZYcj6BnORBm10ei
	ikQUfaQy2kPEaTXP6U9qRkxlw23JNhO/h9quYhvkFgtsvVIy4JIqBIPieZv2bsSo6KTr2Sj4UVB
	Jps83Nn+1HmJocb41ywMz+SP+Lr0GMsWnpt4PVTqGAo+EGI9gxTGmeckeLe2+56HgxOasuSjkWT
	Tmdru1NDs21OH+wZGEHWNhEH55660XQ+UD4ulD1DCN9ZNmTgwCO82QA==
X-Received: by 2002:ad4:5aa5:0:b0:90e:838f:d282 with SMTP id 6a1803df08f44-9103ef96606mr374577876d6.18.1788880612901;
        Tue, 08 Sep 2026 08:16:52 -0700 (PDT)
X-Received: by 2002:ad4:5aa5:0:b0:90e:838f:d282 with SMTP id 6a1803df08f44-9103ef96606mr374577136d6.18.1788880612245;
        Tue, 08 Sep 2026 08:16:52 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:51 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:38 -0400
Subject: [PATCH v2 8/8] mm/swap: remove page_swap_entry()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-8-ee6d01dfa5e1@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=860;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=CwVUhQtJV5BBiMFIF7YsJllNsqsS2ZgEmWIprGlfLYs=;
 b=tyPDhjc61YJsztH5Euj8TQKxOFLCx/bN5LNbg4nPR3nHokHNyj+eIbeFvKstLN2ZgLUq75Jp1
 TIiTx3V2yBJDm7QS92klbDglsyL+bdllOp4LdCCYZmItGrGmI/LXvyx
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfXy25my28Tvjm5
 DF5cebwHUpXUmMHQU1Jhy2XLqTy+YOLHuXaBrXm0oM6DCfndGQVmhISGOMgz3kAsloviucyc9K8
 MQfxPvW7BiNrzet9VDbizR1WDOLg3rl01I9CdaqQd6B0HaSXbloNGyjTw2lXFMm7bV8Vbdwh2Y7
 4DtF3VPfHOPSC/If58+VY8JjNUSeJU0znNwufkdlsCGevGs89WbOPFq9Vt7yzQsAcYF3q/W+ZO4
 J2act6fMiymvvWeAPjKr1EmXrWNWvcn7R4iVHZ9XH1+iMA4wZCbfw6NnrCDncHlxhzavD4yHLRz
 Eb0CP++DjnWA4pRaSopc0LQr8rMQtoVHV7WuCMyTJ/BU1y5ksHvjFeipK+vx1j+fHIKD1T+2KHi
 3Y3LBV1njiwbeFm8Mn2MviSXXaVJ4SBTeU/a5GUdXncABOm6tKCOoTaQ5Jed5B67NM1EmYV80Xf
 w/n7PuTNgmCgKad8tgg==
X-Proofpoint-ORIG-GUID: nKYjQwGmamm70Qwq1r0HLEVCluw0BAwt
X-Proofpoint-GUID: nKYjQwGmamm70Qwq1r0HLEVCluw0BAwt
X-Authority-Analysis: v=2.4 cv=O7gJeh9W c=1 sm=1 tr=0 ts=6aa026e6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=t2YXVXqu3yB8mPBWm3YA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX33JykDMjlzTE
 z8oD02HOpRAekSaZQvSRQOF/umF1vLWgT0QWEFw0ymI23eSHtvMmGNw7aMVJTDxCZ7LZowka/sV
 bJCG/Gj9xv2EiXDU/hUkPpfuSpCz6FJW+kP09DpCEpOyJTXbR2aX
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=10
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=10
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_161657_254626_F627BE16 
X-CRM114-Status: GOOD (  12.08  )
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
index 1d979e76e78a..8032a0f3c319 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -305,15 +305,6 @@ static inline swp_entry_t folio_page_swap_entry(const struct folio *folio,
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


