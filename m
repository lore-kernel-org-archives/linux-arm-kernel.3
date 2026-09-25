Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C316C98324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGmUzdss5rEW+R1oGfgJFhDqCoXEACtVuCJeVlCowUQ=; b=vl3F80aAVP6dP5G1B8Ie66x6yl
	ofGebwgSI4NVqMHSEGORse16UXv0re8X3rY4I1ej4pOazYTjIuskZMB6tRoLh3ITaxYicfuM3xXYe
	lzDSnTLfisN51or6E/Rh8AIWsj4sT3WxhFYMhG3ZgALiUBqeOGEaXB0cDHo9Fhp7tZ0DSsJfn+i6A
	rOpA8U+cR5vMN1JGztEWeDjYcTg+q7Wp7HG4KNLtONKw2OvM1j2bF+P96AldwgaJcdMQcQXbjG7gB
	PLV1aECtv8937HFP6JGHaSedpK2BtEHKB4XfwHtMQpMwj5pw2TIX5hkjLZED0ypdan9grF/V3vk3i
	fiE/HNaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6Cq-0000000DTjg-3l6I;
	Fri, 25 Sep 2026 13:43:16 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6Cn-0000000DTir-41C0;
	Fri, 25 Sep 2026 13:43:15 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4aW25102815;
	Fri, 25 Sep 2026 13:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=pGmUzdss5rEW+R1oGfgJFhDqCoXEAC
	tVuCJeVlCowUQ=; b=EEplY4dXyT5TnlQDtoDm7+L5X9sOTEzNipvqTUu8s1LEuS
	eE94bO88HaakzMucn+OCPYiFQp6Wnqb9URcR3KvpjdPsC+6pUd9lyOG7lG3cS6fd
	JLSaHkUVH7mNl9f5pM8QTuajQ8YZT7bF6NxXRt3FYfLZULvx9FFZIH6vrSWo8iW1
	30otN1vJD/yoIQYiuCgGAWomjRNOHFIDgczLSgBkxfcWeUT38vh7+jU54ORlkPiI
	ZlaggeNnjPsy6+Prosf7S200q/znrivWcxMVpp1KI4aX6n/HjoZAFyx+sTDP01Lt
	kFJLVqwmsAvJxQImOPyA1WXN5RTuARVhiG+CEb0Q==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gskdvpb5t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 13:42:30 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68P9k7il3288275;
	Fri, 25 Sep 2026 13:42:30 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gvbe22mcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 13:42:30 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68PDgQOw13107688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2026 13:42:26 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1237520043;
	Fri, 25 Sep 2026 13:42:26 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC7AE20040;
	Fri, 25 Sep 2026 13:42:24 +0000 (GMT)
Received: from osiris (unknown [9.111.31.68])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 25 Sep 2026 13:42:24 +0000 (GMT)
Date: Fri, 25 Sep 2026 15:42:23 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@kernel.org>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Ingo Molnar <mingo@redhat.com>, "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@kernel.org>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH] arch, mm: promote DEBUG_WX to CHECK_WX
Message-ID: <20260925134223.23528E0e-hca@linux.ibm.com>
References: <20260925-direct-map-verify-wx-v1-1-7fd2f7d6d23b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-direct-map-verify-wx-v1-1-7fd2f7d6d23b@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: az6V2wRZNTPsfcgPJvRvBbZTbbclocGz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfX8eL1fhw8Wcuz
 gwW3tmVcEwpUDvML7GILF9tAuDr0VlXZUr5Wt11Sb6FgeUgSArMjIqmr7nGQy57VhoNxjcdb1nB
 xgUIIMHQV/ped6lC1/jiVHQShjl212s=
X-Authority-Analysis: v=2.4 cv=FLiOVOos c=1 sm=1 tr=0 ts=6ab67a47 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=AFSQz8Mf0LVJe8Ay4m4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 0vhv4zhVL0x6H6vYd9vrkIP5KCg73iuL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfXzgmDIjyBU9XH
 AZygS5+FQqXvvslTnG00liNVJBCMapoyGbK83aD/2abGIeLAKYFSQ+7bK6Q9bFom2evAfxDBE9T
 GZArUR5CDRcYvKoLKJulQESBL84U7K6X+/9MkHAWIhl3JByi7BSRQBQoXzCf336JUrpREKgaIPL
 TfdL9OOeOBob+ckLDr79fGOo6b+bCdZoo0z+sZ2qJUMXXT5yANcfQjcS04U02Ha1zOwDt9O3wCE
 4QilhmxAIrZKRzqLdgDG858DA/wV+CDDlXaGCdtKe9LCeuQFrfIZdyAHwbC7cQGjJqnHWaU+Th3
 RwDS9SMwEBch3wrMER1CIygLEMvYbf23X0BPjzvJkIZIv5xU4a/z3fpCB7p45+V/64blb8yDwTk
 nQUAAlCd16ruDY4xCr9wFhHy/g2X/4msugQqmL0LTkJdjwIz0I7AuYeStPUMi1mSxjMScYQUOtz
 jwmTnG3Z501Gy7oE9DQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_064314_119293_212CC6C4 
X-CRM114-Status: GOOD (  24.97  )
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

On Fri, Sep 25, 2026 at 12:53:46PM +0300, Mike Rapoport (Microsoft) wrote:
> Verification that the kernel does not have writable + executable
> mappings is about detecting security risks rather than a pure debug
> feature.
> 
> Major distribution configurations enable it in their kernels as well as
> defconfigs of most architectures that have ARCH_HAS_DEBUG_WX.
> 
> Rename relevant generic configuration options to use CHECK_WX and move
> their definitions from mm/Kconfig.debug to mm/Kconfig.
> 
> For arm that does not widely enable it, only rename its variants of the
> config options.
> 
> Enabling CHECK_WX adds a few kilobytes to the kernel binary and while
> the added size can be slightly reduced with churny updates of
> architecture implementations of ptdump, the core functionality takes
> most of the added size. It cannot be moved to .init.text because the
> verification has to happen after init sections are freed.
> 
> With this, make generic CHECK_WX default to STRICT_KERNEL_RWX while
> still leaving users targeting small kernels the possibility to opt-out.
> 
> Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
...
>  arch/s390/Kconfig                    |  2 +-
>  arch/s390/configs/debug_defconfig    |  2 +-
>  arch/s390/configs/defconfig          |  2 +-
>  arch/s390/mm/dump_pagetables.c       |  2 +-

Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390

> diff --git a/arch/s390/mm/dump_pagetables.c b/arch/s390/mm/dump_pagetables.c
> index 89badbe72ae7..a23a0bd4d8a8 100644
> --- a/arch/s390/mm/dump_pagetables.c
> +++ b/arch/s390/mm/dump_pagetables.c
> @@ -86,7 +86,7 @@ static void note_prot_wx(struct pg_state *st, unsigned long addr)
>  	 */
>  	if (addr == PAGE_SIZE && (nospec_uses_trampoline() || !cpu_has_bear()))
>  		return;
> -	WARN_ONCE(IS_ENABLED(CONFIG_DEBUG_WX),
> +	WARN_ONCE(IS_ENABLED(CONFIG_CHECK_WX),

Hm... looks like there is bug with relocated lowcore handling in the if
condition above the WARN_ONCE(). I'm going to address that, but that
has nothing to do with your patch.

