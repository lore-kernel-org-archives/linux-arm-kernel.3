Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9978CD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 13:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuc3Pms4+K3aWFusIGvCSQgbvYf1noIU83gft25Y0Jk=; b=P36JhfkyYNOAydSBzoH1aWxWOg
	N09Qvp8EFH6Ac4IfuRbZTUrwsBNqQhLvgaIJasvEdMN3wuX+rFub/BeDMN2XlwxXUmrxX4bmhxZ3C
	jcJhhHmvzowxTvKLdZvPPmXZ15oL1HIHx4HxyYZABzAB2YcGKg4gwxIu0FAMMuD8EcwPdfp5NyQMe
	3i7nHciPKcCKNjMmUvwyW11IZZaCfGdjTI4cogcX73izL5FGUFRtRktIxzoRspQWGGR5OdAY2xpVb
	vZp0N4o0EBn+NdOqK2u/xQyEJnMOp1FfQzn8qfOe8gQX/Ocuc/EmWQmRgX7NWlu45UjnLV8/+r3ll
	ANAGh+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOyxo-00000000VgH-19ka;
	Fri, 28 Nov 2025 13:56:44 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOyxj-00000000Vfl-2Wp1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 13:56:42 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ARNulWW017020;
	Fri, 28 Nov 2025 13:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=wuc3Pms4+K3aWFusIGvCSQgbvYf1no
	IU83gft25Y0Jk=; b=nfuSb531tk/ek8JrdBpnHmvTEUDTGbCOp0mphA7ZrbDjev
	BoWgzhxao1BJFJ59KJWq6mU5zymb5DM0QmNtdKaLoycmcEjymQLzMJV/TgfJJzco
	x72Yvin16SARaWpet5dCakug5hQt6Tv3ziLwE724GmNpAat1fUldsTgBmAGjUWvw
	qa8kw+7V9U9fBKvVz1m5BZgU8xpkzn4262BQtEgONlaRwL64IR0LfDkCSyvx8nkI
	sDg9UvJ4tHfUID1Q+oblXNoCYf6305+ge0nzqdrEOkRZ4n4+jKR7y6mgw/6K6xW8
	6lOcMGox4kBO0S6c5bfbGrgZ8yMnmXl9ytTmhifw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak4uvpnu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Nov 2025 13:56:04 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5ASDu3As032077;
	Fri, 28 Nov 2025 13:56:03 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak4uvpntw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Nov 2025 13:56:03 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5ASBu8XO000831;
	Fri, 28 Nov 2025 13:56:01 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4akqvydb5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Nov 2025 13:56:01 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5ASDtvda33423852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Nov 2025 13:55:57 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F99720043;
	Fri, 28 Nov 2025 13:55:57 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E38D220040;
	Fri, 28 Nov 2025 13:55:55 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 28 Nov 2025 13:55:55 +0000 (GMT)
Date: Fri, 28 Nov 2025 14:55:54 +0100
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
        David Woodhouse <dwmw2@infradead.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        x86@kernel.org
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
Message-ID: <23dcf752-0b75-45a7-84f8-25bddf97af08-agordeev@linux.ibm.com>
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-9-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124132228.622678-9-kevin.brodsky@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAyMSBTYWx0ZWRfX384OntFmUues
 dIOJyCctOD7nT813bCm/GhJf1ZL6CQOs24jDcqmIzdmwQ5T0RXoegg27XMRfiI/9rumngr6NMHx
 tl4nQN+mvmC+VcOHvBu4um686d8ss4oR9DYJ5Ixwx22asl3RT+5FAdIGmztRh+XF2zs4cr6A6QQ
 2iJfQR9W19UY77K6hY2ve4BgoptnP483ec00f8cJVrDJ8H4kjr1jbZu+2pYFaT3+wJs+yp2bpxN
 Z2mA9gIRx8y/C6JYy4/N+CX6k84tbzt6buSUWK1JGk7/Kg3P14z/anrGpqdlT7BTI/og3OVkJqE
 hlGzPPlMS7WwIcss+Fa5oKUZR6EVsKg4LDkTSZbq+j+4sF4jCL4HPpqSwmzRhTJdfHsyh20fqJg
 JHubqHqdjGvQbJ9GegZsZoMEJOKyzg==
X-Authority-Analysis: v=2.4 cv=PLoCOPqC c=1 sm=1 tr=0 ts=6929a9f4 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=h1tPiQvNrzWZOeg10D8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 9jG27-IvFUYEwqeWcDa4RUx8C7I3n3xe
X-Proofpoint-GUID: 3YWVV-kCMzKLLzypHTUX-OcmdogqNxWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511220021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_055639_646002_43E91FC6 
X-CRM114-Status: GOOD (  26.73  )
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

On Mon, Nov 24, 2025 at 01:22:24PM +0000, Kevin Brodsky wrote:
...
> + * Nesting is permitted: <code> may itself use an enable()/disable() pair.
> + * A nested call to enable() has no functional effect; however disable() causes
> + * any batched architectural state to be flushed regardless of nesting. After a
> + * call to disable(), the caller can therefore rely on all previous page table
> + * modifications to have taken effect, but the lazy MMU mode may still be
> + * enabled.
> + *
> + * In certain cases, it may be desirable to temporarily pause the lazy MMU mode.
> + * This can be done using:
> + *
> + *   lazy_mmu_mode_pause();
> + *   <code>
> + *   lazy_mmu_mode_resume();
> + *
> + * pause() ensures that the mode is exited regardless of the nesting level;
> + * resume() re-enters the mode at the same nesting level. Any call to the
> + * lazy_mmu_mode_* API between those two calls has no effect. In particular,
> + * this means that pause()/resume() pairs may nest.
> + *
> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
> + * currently enabled.

The in_lazy_mmu_mode() name looks ambiguous to me. When the lazy MMU mode
is paused are we still in lazy MMU mode? The __task_lazy_mmu_mode_active()
implementation suggests we are not, while one could still assume we are,
just paused.

Should in_lazy_mmu_mode() be named e.g. as in_active_lazy_mmu_mode() such
a confusion would not occur in the first place.

>   */
...
> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> +/**
> + * __task_lazy_mmu_mode_active() - Test the lazy MMU mode state for a task.
> + * @tsk: The task to check.
> + *
> + * Test whether @tsk has its lazy MMU mode state set to active (i.e. enabled
> + * and not paused).
> + *
> + * This function only considers the state saved in task_struct; to test whether
> + * current actually is in lazy MMU mode, in_lazy_mmu_mode() should be used
> + * instead.
> + *
> + * This function is intended for architectures that implement the lazy MMU
> + * mode; it must not be called from generic code.
> + */
> +static inline bool __task_lazy_mmu_mode_active(struct task_struct *tsk)
> +{
> +	struct lazy_mmu_state *state = &tsk->lazy_mmu_state;
> +
> +	return state->enable_count > 0 && state->pause_count == 0;
> +}
> +
> +/**
> + * in_lazy_mmu_mode() - Test whether we are currently in lazy MMU mode.
> + *
> + * Test whether the current context is in lazy MMU mode. This is true if both:
> + * 1. We are not in interrupt context
> + * 2. Lazy MMU mode is active for the current task
> + *
> + * This function is intended for architectures that implement the lazy MMU
> + * mode; it must not be called from generic code.
> + */
> +static inline bool in_lazy_mmu_mode(void)
> +{
> +	if (in_interrupt())
> +		return false;
> +
> +	return __task_lazy_mmu_mode_active(current);
> +}
> +#endif
...

