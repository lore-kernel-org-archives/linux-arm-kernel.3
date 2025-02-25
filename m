Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFC7C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvxAuSGVB9Fk2YXlPJPH6TjtzJg78Cc3kmQfhG3Xd3w=; b=RMEK4khvwqj3zotNQBozjX/TSk
	SwEok5D6jqF5TVhlzQWHf0nnbLNc+C3Jiyn2C9kmbhbAQUqXkJBgfPK97bKF8Hi09Gk5GhbNolWxi
	UOA1Mlhzs9ABNUpNQrX3yi3wjeausKgz3SN8QYHlXhRQA9KzHaUflgeLdfvBbzQY+xxA5PmG2k5/j
	XWAPc/mHcs2hP/b7kLGM1rW5ehzTTP4xxJHSEFlMBvz7Uh2a8Na1kCqcD7zj4CLJSqfncvfdadW+c
	Am69WYfw7TsCwFxLa/wTnGGduQ+H+MS6NV9OpodaTbsoyY2eEjrkvsMrcaull1TEyORXW3ZM9ex6G
	VDYMunbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxyq-00000000Ia1-39y3;
	Tue, 25 Feb 2025 16:40:24 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvsu-0000000HWYQ-2Avu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:26:09 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PDjZh8022623;
	Tue, 25 Feb 2025 14:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=wvxAuSGVB9Fk2YXlPJPH6TjtzJg78C
	c3kmQfhG3Xd3w=; b=jtRnHEGoTj6EJFDmINcSULObNgdDWy6ro0FozVsnHV2eQY
	qLzh3kD5Gvxo6yw46CKSxwRFyQ36iYBUqO7oMWPZQDRR9TTe5T+KNL8Eip5mALGq
	btHuDCFdZUGq55vDaJfVRKzmRSoTG95jnw54s96zu6DhhQcjl9QDxBjp1ZNa6vVN
	iojCsFCYV+KZk5okWrwZu+W5tTcKhzwpULwrsQiLYw6D9dDcUmOwRygFnKGz1LUs
	aHbu0SbWV8efEIHqcKNpaTRBCMCtawK3r3UlfmjODC1upfAneRoBMy2EpT5OiE2d
	fVJgkfEquORT1c29LFkakg/OIDLsMHs+bjbIh+Jg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4511wabtb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 14:25:27 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51PEPOoh025571;
	Tue, 25 Feb 2025 14:25:26 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4511wabtb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 14:25:26 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51PCtwCK012457;
	Tue, 25 Feb 2025 14:25:25 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44yrwsnjmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 14:25:25 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51PEPLDs31261438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 14:25:22 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D28C52004E;
	Tue, 25 Feb 2025 14:25:21 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D253A2004D;
	Tue, 25 Feb 2025 14:25:20 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 25 Feb 2025 14:25:20 +0000 (GMT)
Date: Tue, 25 Feb 2025 15:25:19 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        Uladzislau Rezki <urezki@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        David Hildenbrand <david@redhat.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Dev Jain <dev.jain@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] mm: hugetlb: Add huge page size param to
 huge_ptep_get_and_clear()
Message-ID: <Z73Szw4rSHSyfpoy@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
 <20250217140419.1702389-2-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217140419.1702389-2-ryan.roberts@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hRWfN18hEO2fPQP9rHHQq1sJOqEpDKtg
X-Proofpoint-ORIG-GUID: fwGWLQmJP9EGxhfU0y0PNHJe6OP6pufb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=824 mlxscore=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_062608_563647_587955B9 
X-CRM114-Status: GOOD (  26.19  )
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

On Mon, Feb 17, 2025 at 02:04:14PM +0000, Ryan Roberts wrote:

Hi Ryan,

> In order to fix a bug, arm64 needs to be told the size of the huge page
> for which the huge_pte is being set in huge_ptep_get_and_clear().
> Provide for this by adding an `unsigned long sz` parameter to the
> function. This follows the same pattern as huge_pte_clear() and
> set_huge_pte_at().
> 
> This commit makes the required interface modifications to the core mm as
> well as all arches that implement this function (arm64, loongarch, mips,
> parisc, powerpc, riscv, s390, sparc). The actual arm64 bug will be fixed
> in a separate commit.
> 
> Cc: stable@vger.kernel.org
> Fixes: 66b3923a1a0f ("arm64: hugetlb: add support for PTE contiguous bit")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
...
> diff --git a/arch/s390/include/asm/hugetlb.h b/arch/s390/include/asm/hugetlb.h
> index 7c52acaf9f82..420c74306779 100644
> --- a/arch/s390/include/asm/hugetlb.h
> +++ b/arch/s390/include/asm/hugetlb.h
> @@ -26,7 +26,11 @@ void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>  pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
>  
>  #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
> -pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
> +			      unsigned long addr, pte_t *ptep,
> +			      unsigned long sz);

Please, format parameters similarily to set_huge_pte_at() few lines above.

> +pte_t __huge_ptep_get_and_clear(struct mm_struct *mm,
> +			      unsigned long addr, pte_t *ptep);

The formatting is broken, but please see below.

>  static inline void arch_clear_hugetlb_flags(struct folio *folio)
>  {
> @@ -48,7 +52,7 @@ static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>  static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>  					  unsigned long address, pte_t *ptep)
>  {
> -	return huge_ptep_get_and_clear(vma->vm_mm, address, ptep);
> +	return __huge_ptep_get_and_clear(vma->vm_mm, address, ptep);
>  }
>  
>  #define  __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
> @@ -59,7 +63,7 @@ static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  	int changed = !pte_same(huge_ptep_get(vma->vm_mm, addr, ptep), pte);
>  
>  	if (changed) {
> -		huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
> +		__huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
>  		__set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
>  	}
>  	return changed;
> @@ -69,7 +73,7 @@ static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  					   unsigned long addr, pte_t *ptep)
>  {
> -	pte_t pte = huge_ptep_get_and_clear(mm, addr, ptep);
> +	pte_t pte = __huge_ptep_get_and_clear(mm, addr, ptep);
>  
>  	__set_huge_pte_at(mm, addr, ptep, pte_wrprotect(pte));
>  }
> diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
> index d9ce199953de..52ee8e854195 100644
> --- a/arch/s390/mm/hugetlbpage.c
> +++ b/arch/s390/mm/hugetlbpage.c
> @@ -188,8 +188,8 @@ pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
>  	return __rste_to_pte(pte_val(*ptep));
>  }
>  
> -pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
> -			      unsigned long addr, pte_t *ptep)
> +pte_t __huge_ptep_get_and_clear(struct mm_struct *mm,
> +				unsigned long addr, pte_t *ptep)
>  {
>  	pte_t pte = huge_ptep_get(mm, addr, ptep);
>  	pmd_t *pmdp = (pmd_t *) ptep;
> @@ -202,6 +202,12 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
>  	return pte;
>  }
>  
> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
> +			      unsigned long addr, pte_t *ptep, unsigned long sz)
> +{
> +	return __huge_ptep_get_and_clear(mm, addr, ptep);
> +}

Is there a reason why this is not a header inline, as other callers of
__huge_ptep_get_and_clear()?

>  pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
>  			unsigned long addr, unsigned long sz)
>  {
...

Thanks!

