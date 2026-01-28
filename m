Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C77FD25B44
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 11:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sR3yOvEanCCv4kAGiE4ro9nNhwneHcuB6+V0EWWMj8=; b=GO9zY3K2gqXtgL7EO8PCyJIp1S
	83ah5MJNNrS8eajunsq7E8Au/FQQ4tuczEXHD0J6hPjPzj4uepQQnjkLFRIxTPFtj7EiS+w5mTwRW
	RHW4qCx7/eTbqDEMhwpi1jvZR0w7bjqznpPy5I0TXrvIvRvtcm09I1RyHucLBYDF/w4Ep78j8UqI3
	Wn9cyM9loCfxpSwJmN//dkiJb7tQLtC4HxNShBeeY1mxzNubm4Y4M4JQ9sCI85bLxC78CTj14QtBV
	hzsm2oVbB1NLI5iB1q5XipXINi5jav6BU4pkVnwnfntF9pLzXzv/JlCeiw/aiKDVA9l7hZAAv9w4b
	Y4QqT7bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl43y-0000000FxSh-20Oj;
	Wed, 28 Jan 2026 11:50:22 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl43v-0000000FxR6-3Pbx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 11:50:21 +0000
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SB1KUd3541108;
	Wed, 28 Jan 2026 03:49:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=3sR3yOvEanCCv4kAGiE4ro9nNhwneHcuB6+V0EWWMj8=; b=Dlw/8eqdQHt5
	7lZZcxaOCvV89JZWGSEnAzDPiOB4lcLaRFhrCP2j42KEuACZC5V03WbpWGTCCxSW
	IBh6pQOzWn3+elIlQSRE0tNJxq+iGZ0Cc4UpGDNMvdOazF5FgkQJa8YUyyXzQOnp
	X2BYEbYuFjaMzsjxnnz5IOSV+W6TIlUP8WCg9h7et4D3gnVmvDN+oupW8eqf+mzs
	/SSAYF2Wz6rMk7/vHEasSxQPx1MFbyr6QHTKojVgznPGJ17A+hFJFOzwbd9bAnev
	zsaRgAn+UR9RZpRu5XvVeMtJmp8kTK4sdYiiHvM4hjZpc6GeoYmmeFnJjUlreFK/
	x3fosorduw==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4byfjegygc-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 28 Jan 2026 03:49:55 -0800 (PST)
Received: from devbig003.atn7.facebook.com (2620:10d:c085:208::7cb7) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 28 Jan 2026 11:49:53 +0000
From: Chris Mason <clm@meta.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
CC: <akpm@linux-foundation.org>, <david@kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <lorenzo.stoakes@oracle.com>,
        <ryan.roberts@arm.com>, <Liam.Howlett@oracle.com>, <vbabka@suse.cz>,
        <rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
        <riel@surriel.com>, <harry.yoo@oracle.com>, <jannh@google.com>,
        <willy@infradead.org>, <baohua@kernel.org>, <dev.jain@arm.com>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 4/5] arm64: mm: implement the architecture-specific clear_flush_young_ptes()
Date: Wed, 28 Jan 2026 03:47:43 -0800
Message-ID: <20260128114936.72280-1-clm@meta.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <9d866a2644051e13a41ef4d6ca3909c6e1f9e229.1766631066.git.baolin.wang@linux.alibaba.com>
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com> <9d866a2644051e13a41ef4d6ca3909c6e1f9e229.1766631066.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:208::7cb7]
X-Proofpoint-ORIG-GUID: b-m_VTtyJFGqx8Wk26KZECPrbXwG6GcU
X-Authority-Analysis: v=2.4 cv=dIerWeZb c=1 sm=1 tr=0 ts=6979f7e3 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8
 a=MGNFab1UUB5QvBCUKlEA:9
X-Proofpoint-GUID: b-m_VTtyJFGqx8Wk26KZECPrbXwG6GcU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NyBTYWx0ZWRfX7lAz2qDJSew2
 nPUAe+g6Z2mDxCV6iqhRxBR+FrVuJKpCVLSJrX9QYEqZoWuEAKmCiT8NGqqPNAEDXiG0l6dwcGH
 tYA2FsxvjOp76ILWLbMqFAsSfrlKo62kNrI7hDZmMY8i3Rk+hv3I8g5N/SUcVTuRJE1uQoACz2R
 9cBFQCbPzRdTZHxICyfkrlICfIKcgDO5Sl/f0gFTBjKHb+awUq/ePePMsk0T5YARDS10ZsPUFnU
 rt91CLPk5cPNWdg4ZSaeEJrvsxHzrQ5u+s3ICRYPCeyc2XQgbBfOYTB725Fpwj+TUc2S++Kot1e
 Ne+dehN/vT655V4UV0WHTYW8dLCaUlgYoR99LqCTo/v3PuGCbZ+RlGldZsVdgwXLsVWXqRStvSK
 LB541OK5uB5KTJPKW4GLU9HOVLePhWX7lFet7JQNWgBJ/KkMtSnRmevznFz1JsFn20Ar6PKaRKn
 2grUTFFJPf9Uv+i980A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_035019_994118_8D3D7677 
X-CRM114-Status: GOOD (  12.16  )
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

Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> Implement the Arm64 architecture-specific clear_flush_young_ptes() to enable
> batched checking of young flags and TLB flushing, improving performance during
> large folio reclamation.
> 
> Performance testing:
> Allocate 10G clean file-backed folios by mmap() in a memory cgroup, and try to
> reclaim 8G file-backed folios via the memory.reclaim interface. I can observe
> 33% performance improvement on my Arm64 32-core server (and 10%+ improvement
> on my X86 machine). Meanwhile, the hotspot folio_check_references() dropped
> from approximately 35% to around 5%.

Hi everyone, I ran mm-new through my AI review prompts and this one was
flagged.  AI review below:

> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1838,6 +1838,17 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>  	return contpte_clear_flush_young_ptes(vma, addr, ptep, 1);
>  }
>
> +#define clear_flush_young_ptes clear_flush_young_ptes
> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
> +					 unsigned long addr, pte_t *ptep,
> +					 unsigned int nr)
> +{
> +	if (likely(nr == 1 && !pte_cont(__ptep_get(ptep))))
> +		return __ptep_clear_flush_young(vma, addr, ptep);

Should this be checking !pte_valid_cont() instead of !pte_cont()?

The existing ptep_clear_flush_young() above uses !pte_valid_cont() to
determine when to take the fast path. The new function only checks
!pte_cont(), which differs when handling non-present PTEs.

Non-present PTEs (device-private, device-exclusive) can reach
clear_flush_young_ptes() through folio_referenced_one()->
clear_flush_young_ptes_notify(). These entries may have bit 52 set as
part of their encoding, but they aren't valid contiguous mappings.

With the current check, wouldn't such entries incorrectly trigger the
contpte path and potentially cause contpte_clear_flush_young_ptes() to
process additional unrelated PTEs beyond the intended single entry?

> +
> +	return contpte_clear_flush_young_ptes(vma, addr, ptep, nr);
> +}
> +
>  #define wrprotect_ptes wrprotect_ptes
>  static __always_inline void wrprotect_ptes(struct mm_struct *mm,
>  				unsigned long addr, pte_t *ptep, unsigned int nr)


