Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001DBCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zhkdC954/XIoW9lj3eK97QBTio9c6/Ra5E7JBlylD0=; b=lnNbzJWHOjjwbT2Lql3RftAgyI
	mGM3L/Zi8btkkVn5NUZAC3hYLzKffc3aAeKxYcW1WwZQBKJlrFHqTB/U0bDP2Y/NCe5mjLTOaRSUU
	iVDuGyKGk+XnezjXgwDwck1k8HOVa5jgN0GRN7N8w34zT1+zZdKAeQ1DUJF46IK84IQPinkxAK+t7
	NMhBJSwRIp34tepakcYUdb9Vgi0o7VYeTOjrWyciUM1628fn0mKFITGSQLLFvoORptxeM55y8Dx+L
	cANGeO3Gzi/yRqVzBLgFjT7+UR/i17PU7fkysmcCYgaRWCDhMLmoWatanM22o7O7Twx9Xp0yh+QdZ
	CBWIdJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlrS-00000006z92-161A;
	Tue, 11 Nov 2025 10:44:30 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlrP-00000006z8G-0esn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:44:28 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAMNRj4023632;
	Tue, 11 Nov 2025 10:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3zhkdC
	954/XIoW9lj3eK97QBTio9c6/Ra5E7JBlylD0=; b=i+8ZqsKpJTU9G2r3wtEEHL
	nVc4aj19EgJvtBtVjgz6wPQ/+qdui4Imp9dEwiDbaH8n4w6z0a+qpuCd+y71kgrs
	KRZK+a2NMCEcE02z5B2CtUZWzXnGNduu1hFdOiAMP3fFjXxY8jD/nKSWBeHASo8g
	3MMTBu4T7mdFomUJpwOHAaUY37zekNmawB7ShjD9MFqzbNEG5ly5CowZfD1JMt9X
	ypu3NaYJ7DN+KN05f4FjFCv5/cwGNmm1F+kXi9SA2K540gdZueJgrfnvhCOFZO4o
	ZnuPHopPVsVEvrWWzjf9jLiIya4osAC04TRdLEs5At9seugZmSMnHWcl3c3EGYeg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wc74qxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 10:44:11 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5ABAWr3U002403;
	Tue, 11 Nov 2025 10:44:11 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wc74qxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 10:44:11 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AB9pbYK008260;
	Tue, 11 Nov 2025 10:44:09 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aah6mtbd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 10:44:09 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5ABAi7Zp42664248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Nov 2025 10:44:08 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9B7C2004D;
	Tue, 11 Nov 2025 10:44:07 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A392520040;
	Tue, 11 Nov 2025 10:44:07 +0000 (GMT)
Received: from li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com (unknown [9.155.201.149])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 11 Nov 2025 10:44:07 +0000 (GMT)
Date: Tue, 11 Nov 2025 11:44:06 +0100
From: Jan Polensky <japo@linux.ibm.com>
To: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>,
        catalin.marinas@arm.com
Cc: akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org, will@kernel.org
Subject: Re: [PATCH] mm/huge_memory: restrict __GFP_ZEROTAGS to HW tagging
 architectures
Message-ID: <aRMTdt5tqJhjLgGd@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
References: <20251031170133.280742-1-catalin.marinas@arm.com>
 <20251109003613.1461433-1-japo@linux.ibm.com>
 <690ce196-58cb-4252-ab72-967e1e1574cf@gmail.com>
 <aRG05VS-IIxV2y_C@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <fbca7868-6f68-4b98-a2f2-e39eb46b7f12@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbca7868-6f68-4b98-a2f2-e39eb46b7f12@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAxOCBTYWx0ZWRfX/7v5MALMQkkz
 5sjvinfISCBxNCIY43PoelSTNcEIUJW93X81M3VejNVqM3aTrNjD7iOyyWHqxsUtKeZ49AsDTWy
 hMvv/Q0Sskmg3YbV/M7CWmHtJ83wd1YNQqLStx1q+PBadGEZrPRJMSdYUTXtYUs/At8Iu/FrmaM
 izstGxJOPjKXqDR+T4bkrzBCsR1qNRCnGEG1amHpvb2YiKGHAz+rSE7ic14VkdN3q+PLjaOEDYq
 sYj8sOC9iIq/NGHgHdXWxv2Lkw8pPT04mrygd35AqvzsJWQiXmBSYAMnag0vFYyBI9yvVGbCEmV
 ETZyvOkbuMXcwMXhL4G+Q/b6zv1Ts75mRX3FwLUU00uVWqq2WsBJtamQecCawhnUxeoIrjqX/FM
 qbZf+Od6U5LQqA+MAHLnNgiH8HjC1Q==
X-Authority-Analysis: v=2.4 cv=GcEaXAXL c=1 sm=1 tr=0 ts=6913137b cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=-mZ0xOhmsHb9JoomMBoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: ZSHFsu6k6PII3E4XpGUJvo1JK-0hDjpn
X-Proofpoint-ORIG-GUID: 6nzRhirrpSwM50mDZO38SB8ub4IKHh9N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_024427_553438_22E03F18 
X-CRM114-Status: GOOD (  30.40  )
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

On Mon, Nov 10, 2025 at 10:53:33AM +0100, David Hildenbrand (Red Hat) wrote:
> On 10.11.25 10:48, Jan Polensky wrote:
> > On Mon, Nov 10, 2025 at 10:09:31AM +0100, David Hildenbrand (Red Hat) wrote:
> > > On 09.11.25 01:36, Jan Polensky wrote:
---8<--- snip ---8<---
> > > I wonder if the following would work:
> > >
> > >
> > > diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
> > > index 65db9349f9053..56b82e116cb79 100644
> > > --- a/include/linux/gfp_types.h
> > > +++ b/include/linux/gfp_types.h
> > > @@ -47,7 +47,9 @@ enum {
> > >          ___GFP_HARDWALL_BIT,
> > >          ___GFP_THISNODE_BIT,
> > >          ___GFP_ACCOUNT_BIT,
> > > +#ifdef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
> > >          ___GFP_ZEROTAGS_BIT,
> > > +#endif
> > >   #ifdef CONFIG_KASAN_HW_TAGS
> > >          ___GFP_SKIP_ZERO_BIT,
> > >          ___GFP_SKIP_KASAN_BIT,
> > > @@ -85,7 +87,11 @@ enum {
> > >   #define ___GFP_HARDWALL                BIT(___GFP_HARDWALL_BIT)
> > >   #define ___GFP_THISNODE                BIT(___GFP_THISNODE_BIT)
> > >   #define ___GFP_ACCOUNT         BIT(___GFP_ACCOUNT_BIT)
> > > +#ifdef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
> > >   #define ___GFP_ZEROTAGS                BIT(___GFP_ZEROTAGS_BIT)
> > > +#else
> > > +#define ___GFP_ZEROTAGS                0
> > > +#endif
> > >   #ifdef CONFIG_KASAN_HW_TAGS
> > >   #define ___GFP_SKIP_ZERO       BIT(___GFP_SKIP_ZERO_BIT)
> > >   #define ___GFP_SKIP_KASAN      BIT(___GFP_SKIP_KASAN_BIT)
> > >
> > >
> > > Likely we'd have to make __HAVE_ARCH_TAG_CLEAR_HIGHPAGE a proper
> > > kconfig option.
> > >
> > >
> > > Then we could turn the default implementation of
> > > tag_clear_highpage() into a BUILD_BUG.
> > >
> > I'd like to suggest to keep the enum untouched and only use the second
> > part of your suggestion.
>
> Why? We also do that for CONFIG_KASAN_HW_TAGS, CONFIG_LOCKDEP and
> CONFIG_SLAB_OBJ_EXT.
If we remove the enum entry, we’d also need to update mmflags.h because
the trace macros reference it.
Enums are compile-time only, so they don’t affect the generated binary.
My thought was to keep the enum list as it is and just apply the second
part of your suggestion.
That way, the trace definitions stay consistent without extra changes.
Just an idea, happy to go with whatever you prefer.
>
> > Which works by the way for our arch (s390).
> >
> >   include/linux/gfp_types.h | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
> > index 65db9349f905..c12d8a601bb3 100644
> > --- a/include/linux/gfp_types.h
> > +++ b/include/linux/gfp_types.h
> > @@ -85,7 +85,11 @@ enum {
> >   #define ___GFP_HARDWALL        BIT(___GFP_HARDWALL_BIT)
> >   #define ___GFP_THISNODE        BIT(___GFP_THISNODE_BIT)
> >   #define ___GFP_ACCOUNT     BIT(___GFP_ACCOUNT_BIT)
> > +#ifdef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
> >   #define ___GFP_ZEROTAGS        BIT(___GFP_ZEROTAGS_BIT)
> > +#else
> > +#define ___GFP_ZEROTAGS        0
> > +#endif
> >   #ifdef CONFIG_KASAN_HW_TAGS
> >   #define ___GFP_SKIP_ZERO   BIT(___GFP_SKIP_ZERO_BIT)
> >   #define ___GFP_SKIP_KASAN  BIT(___GFP_SKIP_KASAN_BIT)
> >
> > This solution would be sufficient from my side, and I would appreciate a
> > quick application if there are no objections.
>
> As raised, to be sure that __HAVE_ARCH_TAG_CLEAR_HIGHPAGE is always seen
> early in that file, it should likely become a CONFIG_ thing.
>

