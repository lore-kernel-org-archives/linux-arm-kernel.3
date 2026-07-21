Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129E1C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 12:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPlPzqvav1UW5eHaa40ZbJscdEd+i1OC+0ehWg4cK3E=; b=EGVQRhzzsee5fkEeojnsdD6OnM
	SHXy5eIGJ1os6i0IcHT86yLpm5vaycPn0eJtAoMgOmXSVc6hvjEKqRLD6IzMe74vNiwvowHJFccxN
	I0r4YqcKWFRhS2OJ55ZzeqOfr1bBXNCpiAZNgvVjxI3WXMSYY48ssINjTlA49wLU6gNS/mDMl7HgO
	oKq6Ow3MfZU5tZfUyvCp3L/eGkoSibLeB6bPnKPy5Yw+y1urThx1I0j1z+WaEAJV7eHiguinQjYYs
	KNyxsolyMRKhn6wq4hJKoLb8TgLRT3J5Xo0jsUtmkYZ3p5AyplIr3qVy+HMWemqYZgdDYdqFRfbxl
	uR1Kel6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9ml-00000009RSq-2dHV;
	Tue, 21 Jul 2026 12:41:23 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9mi-00000009RRh-3njg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 12:41:22 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAfsVU793700;
	Tue, 21 Jul 2026 12:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=iPlPzqvav1UW5eHaa40ZbJscdEd+i1
	OC+0ehWg4cK3E=; b=nMTllraDCvXzlQ4gSXh5/QOPJ0MHn7mfMQmwGww2FERYza
	3mZJ7lRspjiI+v7D2VoxYDFEmEFFciuwPc5yYcYTj3PRDTHbMDUZzKB9bMuzb652
	9gvnEFDZy9SgYJZd16lZ7Ff489jCVh8j5hrI7OdN7lZ4jJqZDU4EHij346BLWyH0
	+lCmjbgkQb/4EQQ4DmgaM5kE/aYv2OZj2UrawOc7Ab0pe/BOx5Pigu7gfBbWHLYP
	UjXfvzH/PCweM3nDKSSA+xjsv8IrcQdnR3ODYBqjuUSbcCXFDAHrT2JkZOpgOgP/
	lJACeA6/CWy2Kp1a9aOQthVCa4ivXyIHEsSatL0Q==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fg790vh2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 12:41:02 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66LCYYLH002468;
	Tue, 21 Jul 2026 12:41:01 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fgm6w2c6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 12:41:01 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66LCex8G42664360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jul 2026 12:40:59 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 024B72004E;
	Tue, 21 Jul 2026 12:40:59 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3D232004B;
	Tue, 21 Jul 2026 12:40:58 +0000 (GMT)
Received: from tuxmaker (unknown [9.87.85.9])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 21 Jul 2026 12:40:58 +0000 (GMT)
Date: Tue, 21 Jul 2026 14:40:57 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Pedro Falcato <pfalcato@suse.de>, Ryan Roberts <ryan.roberts@arm.com>,
        Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Mike Rapoport <rppt@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>, linux-s390@vger.kernel.org
Subject: Re: mm: opaque hardware page-table entry handles
Message-ID: <20260721124057.2820903Adf-agordeev@linux.ibm.com>
References: <74182e50-b54f-4d2d-a27f-3a59a538d6bc@arm.com>
 <31d36023-d728-4eee-90f8-158c7066f565@kernel.org>
 <e22407d8-4509-4a53-9ba4-491b9d5c5ef7@arm.com>
 <4bfeb697-9c1f-4316-96bb-9bfd66f959df@kernel.org>
 <6110202c-057b-4701-8c04-1a76ee7bb9ab@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6110202c-057b-4701-8c04-1a76ee7bb9ab@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y-cS7h0zIIKKfU5heE1tSQvzZjOAVoN7
X-Authority-Analysis: v=2.4 cv=V6RNF+ni c=1 sm=1 tr=0 ts=6a5f68de cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=WHKbetgI1jfQOmHUsxoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyOSBTYWx0ZWRfX5L8TJE6Lf5z/
 PQ4oUUYB41NczNetweoXhqbQVYI4cGQ5SH66WxF9ziddwLi534CCE8LEyy62iBcCqZtE1f+D9RK
 n5vYb/6LHZ4bxhdeg3gEDqW/yeWmPqw=
X-Proofpoint-GUID: y-cS7h0zIIKKfU5heE1tSQvzZjOAVoN7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyOSBTYWx0ZWRfX3cWHXzVyanrU
 IGkEbOlm9FJuFbDU97cgAhueRbpaYHss3q5E2bfV9nfbIgx8kPrhkm4y1bhf6uQ6lfPCxulrP56
 oJyn85GoW7FBamrYjdFw6soYQS7jF0BnlV6VhHppblUpc25b0SqU0riM3hBXJzwwDvIr0dO1orO
 8Su/34UenHl3yQjtQI4E4Fm+0doYENDWsyVgzbyQ+w0CoCvJ2d2j8rJdzODTG55f0CaihWQNL2z
 DTvIAWRpAdV7o9rFTDFXqeQATE9OrNPJtibgXzfadiVtzk02wQRR3GYuPOdKaKkbRCxLAziVOhS
 t/+rWhBtsUJwDCb2fnUvtNStfgyelrCiVLt1tKgFEE/dqCc38GhK0aAK1qCOgyN1KRj9Sb608j3
 YCQB83mcJYOTjta5lm61iP+fkq4BzxsHvvosQ9aYfCBv662uIRSZQC9ymiHfmX+19wh3ppkxm5d
 SX59MRyJoyPubstxIRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_054120_954095_5CA73B94 
X-CRM114-Status: GOOD (  48.56  )
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

On Wed, Jul 15, 2026 at 05:15:36PM +0100, Muhammad Usama Anjum wrote:
> Hi,
> 
> [Moved some already involved people to To. So they can help with the plan
> details mentioned below.]
> 
> On 07/07/2026 2:17 pm, David Hildenbrand (Arm) wrote:
> > [...]
> > 
> >>>
> >>> typedef struct {
> >>> 	pte_t __pte;
> >>> } hw_pte_t;
> >>>
> >>> And then simply use
> >>>
> >>> hw_pte_t *hptep;
> >> Make sense. So you have suggested to just hide put pte_t inside a structure
> >> instead of complex structure of pointer. I've tried to implement and it reduces
> >> churn enormously.
> > 
> > Right. And for most architectures we can probable leave both types be the same
> > under the hood.
> > 
> > So we'd only have to convert common code first, and can then e.g., look into
> > making architectures that care about the difference (e.g., arm64) actually have
> > it be two separate types.
> It makes a lot of sense.
> 
> Let's even divide the series into more parts as there are several places where
> conversion is controversial. (Xi Yan had mentioned one example earlier in this
> thread.) Most of those controversial conversions are pmd related. I propose
> that we convert pte_t first, then pmd_t and others. It'll keep the number of
> patches manageable and easier to review. 
> 
> I think wider agreement for this approach will be very helpful before I post the
> actual code.
> 
> > 
> > Just an idea to further reduce the churn and limit it only to core code (because
> > I saw some very ugly stuff in some arch code that would make such a conversion
> > harder).
> > 
> > [...]
> > 
> >>> Why do we need this and what would we use it for?
> >> The idea was that there should be two different functions to read value. Let's
> >> leave this out of the first initial series. It is complicating the original
> >> proposal.
> > 
> > Right, let's leave that out for now. I'm currently working with Levi on an
> > approach that tries to avoid the overhead due to READ_ONCE with folded page
> > tables. [1]
> So you are referring to page folding improvements. I also stumbled upon those
> while doing a dirty implementation.
> 
> > 
> > We're still struggling with some bits, but looks like we can make it fly and
> > have it be fairly robust.
> > 
> > With that, maybe there is no reason left to have separate pXXp_get() vs.
> > pXXp_get_once(). TBD :)
> Yeah, I was reviewing that series earlier today. I've not looked deeply, but it
> seems there are still a lot of cases where (mostly) pmd is getting dereferenced
> directly. To complete the conversion, direct dereferences need to be converted
> into an API. I've been thinking if there should be a dereference macro or we
> must always use pmdp_get() even though it ensures ordering. It may add excessive 
> ordering in some functions if pmdp_get() is getting called multiple times. But
> storing its output in a tmp variable would solve this. 
> 
> Do you agree with converting all direct dereferences into pXXp_get()?

For the clarity (e.g. on the PTE level) is it goint to be converted to?

pte_t ptep_get(hw_pte_t *ptep);
pte_t set_pte(hw_pte_t *ptep, pte_t pte);

While variables on stack are still may be dereferenced directly via pte_t*?

What about unlinked/temporary page tables in memory?

> > [1] https://lore.kernel.org/all/08ecabe9-0664-4aea-82fb-f9cb1739f762@kernel.org/
> > 
> > [...]
> > 
> >>>
> >>> I'm still not sure about the _once() really, and if we need that right now. We
> >>> survived without is so far, why do we need it now?
> >> The idea is to convert all current pXXp_get() to pXXp_get_once() and convert raw
> >> dereference to pXXp_get(). Let's keep this idea separate for the other work. Let's
> >> discuss it later sometime again later.
> > 

> > Sounds good.
> 
> I've tried to do conversions already. Converting by call hierarchy wise is very
> difficult and error prune.
> 
> Converting component by component (such as page walk, huge page) is also difficult
> as code is tangled. Some helper which is getting used in one component is also used
> in another component.
> 
> I see the following way forward:
> * Add the new type
> * Identify which functions need explicitly pointer to a stack variable. These
>   must not be converted. These variables must be renamed to a common name. For
>   pte_t pointers on stack some functions already use ptentp, which is unique name
>   if we look at generic code. So ptentp would be used for all such variables.
> * One commit per controversial change would be done at this point. We need new
>   separate function for stack types. Also we can do more renaming to a name which
>   will not be converted.
> * Run Coccinelle script directory-by-directory which would ignore converting any
>   ptentp (and similarly for other types). Coccinelle doesn't converts in some case
>   (pte_t *a. *b) which can be done by hand at this point.
> * Update any remaining functions

What is the approach to STRICT_MM_TYPECHECKS?

We would like to keep it, and I guess some other architectures too.

> -- 
> Thanks,
> Usama

Thanks!

