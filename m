Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1381ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrKzRKvPlqc1QwFwyTNKlG24n0S3B0erGWAU2bVkVqg=; b=alDSWC0FRip7QJH2opL5aJwZFk
	koxAVfdsid/HSYqJ0sQv9aaVnZHc9EFB4OoAe3+pvrqRNixLeBjDbAQb9e1VnJRiup0IY1k80+h9o
	Zw6dzmw+US09G/2tYp0kWcMQ6hQsvJ9lyuqGZDn6L7qS2jJNEbL6/rVVh4mp85fYxojmSxeCB5F6u
	G3fJ2wid2ifX58a3JzcTkQVHQWv+32Vkrhg0BLvwmQEsT2VJqeL1+g0GsN0X9fa1H6XQO952ThDyd
	G93R+Yk46BdIXaiyXamOuWOwywmyGF0zaM/r7d1tm9fOnEfjXhrMzmnkN3UWyRIIL1FtzsQKwAVsB
	DvTuFpZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVA-00000005Qv2-1eQS;
	Sat, 06 Sep 2025 00:09:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYkt-00000002uN4-2qwD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Sep 2025 15:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yrKzRKvPlqc1QwFwyTNKlG24n0S3B0erGWAU2bVkVqg=; b=Cud1tWjW4zyt4JYA0fBGVHyslB
	AZMYzeWhO+TqI3IqN/lbl4aWbdJqRCivavZnFmpGJpllHqKuG/fnd4FREouRpBoXPTbGHJYjuKws/
	kj4VlDjjycugh9ndU9AlvUT9m43WSHoTsnJcpB0Mg0SOekiUisCKozd3P7QpvkEJHRHa+5Si1VJtv
	AXZi00vUVJ89cmJL6fmsD2MIut+hP7eygn4GBLJRJV8Lpz3xIG73Qmpp32KgmAHj74gO7+mZ3xmYs
	kRnTSTegj2q3Q66qPdQhd3p6YG8PU9Y2in3yU2WbfdnH7TncSPqqI1369LYkh7YRQnNLX/QcvUmbw
	U2WU3lPQ==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYkq-00000004eCF-3Ath
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 15:53:38 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5858qiX8001199;
	Fri, 5 Sep 2025 15:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=yrKzRKvPlqc1QwFwyTNKlG24n0S3B0
	erGWAU2bVkVqg=; b=qnifUl96cq8S6mdWIUWZY6BIWU8yF2upNweBx/YvMVrUqk
	RurxzzOfjdHTO1vZruHBUGw3vkJ3WeEmWzLy0ib2dt0fUdi9302JluZSn5voqpb9
	tt+K2LZopne4AXw3OGAsBjWP8De3MBm1hwH4/INAMOLsTRAjDmX8jUJ/gKxB4XAc
	KrIlZNUzwzjCaqkU+ZOpln4XrPIJTWESS5y/saIRobaltfDoOVm72NdzSHeS2nKf
	hGMYLo6HZzSBX5xdzjXsfqIsGIlRMWccKTKAhN9S2rP+bQ/qPKUMPRNpVA8A/v6E
	L8fXKTqpSJEYDa6i80pdzLQ72TamFaiRukB8PM0g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48wshfcpx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:52:50 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 585Fmcsp012235;
	Fri, 5 Sep 2025 15:52:49 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48wshfcpwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:52:49 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 585FmxfV019937;
	Fri, 5 Sep 2025 15:52:48 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48vbmujcy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:52:48 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 585Fqke750659768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Sep 2025 15:52:46 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C56520043;
	Fri,  5 Sep 2025 15:52:46 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DCE620040;
	Fri,  5 Sep 2025 15:52:45 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.111.48.240])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  5 Sep 2025 15:52:45 +0000 (GMT)
Date: Fri, 5 Sep 2025 17:52:43 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH 5/7] powerpc/mm: support nested lazy_mmu sections
Message-ID: <074ff6ab-5868-4fde-b5bb-9e17632ad817-agordeev@linux.ibm.com>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-6-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904125736.3918646-6-kevin.brodsky@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lCd6YOMsS3DuDBadSx3AqoWK9sgWIwBw
X-Authority-Analysis: v=2.4 cv=do3bC0g4 c=1 sm=1 tr=0 ts=68bb0752 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=j0AthGTrb4EvYsEn83oA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: f87PfJay9odLOn37oqVwjr2CAlcWWHn1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA0MCBTYWx0ZWRfX6sVQx3QDeZVb
 n0/AHQXDAd1IPDvrbQDAZqWNvYoji1vUEPP9JAjcx2sdZwqxFNT8P6jKDiqCdhkxMnGuyNq6xN0
 S8g8X6OMzE3gSb6sI+vSPcwT7zIQgnHlzsA9jiitgokDLD2w11I2lobQd0RzFFdQVPBFq7gLH2W
 w3OGrenK+wBn0voMSBbmNjp1Fjlqy/CSo5Vh9PvP5VNsOgQXuA9fqz0KJ8mfFGOfUfce75STf2p
 eu65lI0DTVxqmjYKeyaFdLRjc3SxwtmZeh1Pe6KdSGdqawAHM6zOfs0r4Yils+ob60NU/kRnAup
 7+9DLLEmBuvBzuYqwqF9czbkIes2bGJOe8p5YqMQ0X/8i+oJ9lIUH4tj2BythK5q2hT0kmdi9nq
 KtlUPSlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_165337_102423_517EB4C8 
X-CRM114-Status: GOOD (  18.43  )
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

On Thu, Sep 04, 2025 at 01:57:34PM +0100, Kevin Brodsky wrote:
...
>  static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>  {
>  	struct ppc64_tlb_batch *batch;
> +	int lazy_mmu_nested;
>  
>  	if (radix_enabled())
>  		return LAZY_MMU_DEFAULT;
> @@ -39,9 +40,14 @@ static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>  	 */
>  	preempt_disable();
>  	batch = this_cpu_ptr(&ppc64_tlb_batch);
> -	batch->active = 1;
> +	lazy_mmu_nested = batch->active;
>  
> -	return LAZY_MMU_DEFAULT;
> +	if (!lazy_mmu_nested) {

Why not just?

	if (!batch->active) {

> +		batch->active = 1;
> +		return LAZY_MMU_DEFAULT;
> +	} else {
> +		return LAZY_MMU_NESTED;
> +	}
>  }
>  
>  static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
> @@ -54,7 +60,10 @@ static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
>  
>  	if (batch->index)
>  		__flush_tlb_pending(batch);
> -	batch->active = 0;
> +
> +	if (state != LAZY_MMU_NESTED)
> +		batch->active = 0;
> +
>  	preempt_enable();
>  }

Thanks!

