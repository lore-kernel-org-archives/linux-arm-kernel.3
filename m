Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74983CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CW2dDor0IqMzIAmq0spxwQ7puBTFQtVzTFSMyEgoGjA=; b=yQslTPt6XDKHMYKYDZ84ZM+Lym
	Bg48aQSyvQutFq2cFBnVZXsCnntgwpViPbnHCh3/gB9cMDfpd3RH2E5pFENn3IksdLxV0GxRMDw5z
	CjaZDMGQlIUznkugUQAsX9NvTxxmtGD7ZFt2vCUaOt+iT+uXo+GTxTNKekPJ+nB7rvRu+ROArtjDa
	4jP4E3p4rs+OyjoVOevtJJuz9ml8I+D8KKe5zFrhVGFxoCtGPSsLHfcVl30gRt7AO9bAwTm7AfIXv
	D7L5dasEJCeTkaGKGo7Grb3kXwnpHBzkdT9K+wlogx9KLUlC7NK0SwN+ix5UYIkmvQejjxkcwJd9B
	D/heFr3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1xM-00000008q1q-1apB;
	Tue, 09 Sep 2025 17:16:36 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwo8-00000006qeP-10li
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:46:45 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896Wdr4031713;
	Tue, 9 Sep 2025 11:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=CW2dDor0IqMzIAmq0spxwQ7puBTFQt
	VzTFSMyEgoGjA=; b=P7fiZwOZoDl89TYxIoDk4jbhXrf0kjh5+A0apcBU6C2GdT
	340+8Qq55LXFwzCb2OnrGtv2LTms5uaynX6WfkjgKzFQGzs3e9pvZUBahm6iSSWT
	WAluYtYKMO3NEFWsaHTLmzNgjJggCA+UUE8JfV+YFOMHIpa6bduy64J5wPglMBbo
	1st8bDHq/DM0/FJSwtUsBhE7FRmCOK1/CvbO0pfJAVLuQ89IraoJ4ZhEiV9SJGge
	R76Ejpm7X8SvuisIf2tyP1lB+0dxfGRnwYufiviL57J7ea4xGb3TC+Uy45RwDr54
	4cOe5ZFz+UmaDEeE2xXzL/ExCyZXDdsidA5E1ouQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcsq781-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 11:45:56 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 589BTqxc006985;
	Tue, 9 Sep 2025 11:45:55 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcsq77y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 11:45:55 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 589BMn2N001188;
	Tue, 9 Sep 2025 11:45:54 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 491203akyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 11:45:54 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 589BjqjF8323344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 11:45:53 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D59D020043;
	Tue,  9 Sep 2025 11:45:52 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 247CD20040;
	Tue,  9 Sep 2025 11:45:52 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  9 Sep 2025 11:45:52 +0000 (GMT)
Date: Tue, 9 Sep 2025 13:45:50 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
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
        Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
Message-ID: <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfXzv0l4od4j6eW
 QmMdktKyBl9+62xDiwDCsXs13FmwdhJ/yKVW0Nx7wmldwiO4Gphv89/+dwt/LpECn2XxOtXfh60
 jKyl21EsFo5dPWLP41rL8yAE8JVwfpPHGCyDSUYtA7sAOdIW58vIVprQ0pXotY+dKbj+gh2UVow
 aUYpiI8EbPfiUOAf+qOVUjNN2gNw6goKU2Itja8LgZVxED1lOakW8e7o8p6kPC5x+5elb/cjfAw
 /8FfQVABacfNl7ZdgYZjcvC3V+L7x+hQVkP58f0SM4yX0U4T+rMqQaJBKGdD5nUVcqnn5OalH7l
 hJOgJuaJEM3zF3TSqJtIp3pJKLVcHjM9sdtipTndXY1FAdeDQTINxSKeTjMqDRhxe/M13RVfvwK
 e7diuTK0
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68c01374 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=sjzYMD-SKWPhrPIpRwUA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: XopatD14CEfuivKQbcWn3mfk3pBU2G5u
X-Proofpoint-ORIG-GUID: YV8Uas4Jwghz0nGFl4MnfkXLTyTlxDw-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_044644_404358_11F04C10 
X-CRM114-Status: GOOD (  43.27  )
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

On Tue, Sep 09, 2025 at 12:09:48PM +0200, David Hildenbrand wrote:
> On 09.09.25 11:40, Alexander Gordeev wrote:
> > On Tue, Sep 09, 2025 at 11:07:36AM +0200, David Hildenbrand wrote:
> > > On 08.09.25 09:39, Kevin Brodsky wrote:
> > > > arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
> > > > (taking and returning no value). This is proving problematic in
> > > > situations where leave() needs to restore some context back to its
> > > > original state (before enter() was called). In particular, this
> > > > makes it difficult to support the nesting of lazy_mmu sections -
> > > > leave() does not know whether the matching enter() call occurred
> > > > while lazy_mmu was already enabled, and whether to disable it or
> > > > not.
> > > > 
> > > > This patch gives all architectures the chance to store local state
> > > > while inside a lazy_mmu section by making enter() return some value,
> > > > storing it in a local variable, and having leave() take that value.
> > > > That value is typed lazy_mmu_state_t - each architecture defining
> > > > __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
> > > > For now we define it as int everywhere, which is sufficient to
> > > > support nesting.
> > ...
> > > > {
> > > > + lazy_mmu_state_t lazy_mmu_state;
> > > > ...
> > > > - arch_enter_lazy_mmu_mode();
> > > > + lazy_mmu_state = arch_enter_lazy_mmu_mode();
> > > > ...
> > > > - arch_leave_lazy_mmu_mode();
> > > > + arch_leave_lazy_mmu_mode(lazy_mmu_state);
> > > > ...
> > > > }
> > > > 
> > > > * In a few cases (e.g. xen_flush_lazy_mmu()), a function knows that
> > > >     lazy_mmu is already enabled, and it temporarily disables it by
> > > >     calling leave() and then enter() again. Here we want to ensure
> > > >     that any operation between the leave() and enter() calls is
> > > >     completed immediately; for that reason we pass LAZY_MMU_DEFAULT to
> > > >     leave() to fully disable lazy_mmu. enter() will then re-enable it
> > > >     - this achieves the expected behaviour, whether nesting occurred
> > > >     before that function was called or not.
> > > > 
> > > > Note: it is difficult to provide a default definition of
> > > > lazy_mmu_state_t for architectures implementing lazy_mmu, because
> > > > that definition would need to be available in
> > > > arch/x86/include/asm/paravirt_types.h and adding a new generic
> > > >    #include there is very tricky due to the existing header soup.
> > > 
> > > Yeah, I was wondering about exactly that.
> > > 
> > > In particular because LAZY_MMU_DEFAULT etc resides somewehere compeltely
> > > different.
> > > 
> > > Which raises the question: is using a new type really of any benefit here?
> > > 
> > > Can't we just use an "enum lazy_mmu_state" and call it a day?
> > 
> > I could envision something completely different for this type on s390,
> > e.g. a pointer to a per-cpu structure. So I would really ask to stick
> > with the current approach.
> 
> Would that integrate well with LAZY_MMU_DEFAULT etc?

Hmm... I though the idea is to use LAZY_MMU_* by architectures that
want to use it - at least that is how I read the description above.

It is only kasan_populate|depopulate_vmalloc_pte() in generic code
that do not follow this pattern, and it looks as a problem to me.

> -- 
> Cheers
> 
> David / dhildenb

Thanks!

