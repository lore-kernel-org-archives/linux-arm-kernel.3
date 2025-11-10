Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCB3CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a98CfjmePTD+JuGbf9VtPKBSfCpi8DNU4q7pZUy5p+E=; b=ZFN5j8vd8Xx5HY4SQkLd9VnEj6
	J0mKgmM9Mtn7lYA93AmSCXLYBzYQVozmGi5Wc4bAewt3OqdulnGaMoUY2v1lxIX501KGJhrzawnPI
	Ntt9mzWPzV9iVIIVQ0BWrIF5HKPZ+Cc59A8IgNem9x99SJtFSCLbt3g/1qYFuW7M7Bt38weVW7ybI
	KZsDwJfADudekp6AVnKardL28W1n9MVQxDRO3QhQScX50M3MgWKBr/cjOAkEHrb1MS4o2WmC6eckB
	BY9mkDoePpIQ1XNptd4O9Ua4+FMpoDAgssLHciPN3rtPBwORaElIzU2WPOmAvjGV74jMykmoQK7FZ
	MMY5U7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOVr-000000057ii-0fe3;
	Mon, 10 Nov 2025 09:48:39 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOVn-000000057hK-2GcA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:48:37 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9JwIFK013673;
	Mon, 10 Nov 2025 09:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=a98CfjmePTD+JuGbf9VtPKBSfCpi8D
	NU4q7pZUy5p+E=; b=NbIWz+FxDn8g+YGwVLhcZ4kAjY4rVSZVypeTK/djcxgB3y
	t7/KSQ1gaeq3siUv2+MPp8sqHlG2H9l0xGG6Z5ZJPkHRJjYijMfojEupoJ2Br7e6
	NTZ64OiwKuWhKeBXi9LOpZKR53eE34niMUMBOKVx1zJQPbh5NKOFMtgD5SbWwNC+
	GcK+byyZCWnDIFniIwqRBH7J7IgnbxUieVXlava9qo3jUCDw5oHnz4Sz1epOu3da
	/PFu6qIpnMeokCXog0bNcWI6VOOV+asmPyJiR5RQPKi6OZK1oD9W9osvthYMexIZ
	kK7Se1O9rdeB7I2x8DOgvT9Y5oNh1wbNG/auku4w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5tjnf3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 09:48:26 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AA9kQuV029027;
	Mon, 10 Nov 2025 09:48:25 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5tjnf39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 09:48:25 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AA97D0F004748;
	Mon, 10 Nov 2025 09:48:25 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aagjxn3as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 09:48:24 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AA9mN0R25755958
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Nov 2025 09:48:23 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0EAF20043;
	Mon, 10 Nov 2025 09:48:22 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DE9320040;
	Mon, 10 Nov 2025 09:48:22 +0000 (GMT)
Received: from li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com (unknown [9.111.94.180])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 10 Nov 2025 09:48:22 +0000 (GMT)
Date: Mon, 10 Nov 2025 10:48:21 +0100
From: Jan Polensky <japo@linux.ibm.com>
To: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>,
        catalin.marinas@arm.com
Cc: akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org, will@kernel.org
Subject: Re: [PATCH] mm/huge_memory: restrict __GFP_ZEROTAGS to HW tagging
 architectures
Message-ID: <aRG05VS-IIxV2y_C@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
References: <20251031170133.280742-1-catalin.marinas@arm.com>
 <20251109003613.1461433-1-japo@linux.ibm.com>
 <690ce196-58cb-4252-ab72-967e1e1574cf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <690ce196-58cb-4252-ab72-967e1e1574cf@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TjX7AmV5bBkDSJblXm1e_Oldw9yNMTAS
X-Proofpoint-ORIG-GUID: tOlnJNKqKiBpAi3dzDJ9nNv5_lNfPWyX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA5OSBTYWx0ZWRfX202bi/KWpMN4
 lEZVD3vrScGWetcEbpDI0EeawZ6wGN3cBoRTHHg+y6U33yRQUvrgwOulhmDxHfM4JQBIi5ZG/Ow
 lFb8Bg2uPBwIv49KrLI0dQIH8fvNBrYOkMAJjGfIv+uwvDCrD3KPzPTBhLyKwDq6wCdjozgPnFl
 VIcQuTH7Co3d23dxAcfb0z5blGkeIlmKOTxmKYgWHaWLxBDBktE1cHu2FS9ZnYEWQQ6W9idjYVV
 8sggU+jDiXohL6+DvF80k58U8mOmGtBCerWY0OCt/yk+Cg9WHNoo2i+j8rUKlT8yHnc/XKACvtO
 Zyqoux+rq5ckj15lEtM2Vgkf6jM35wJyU7akwda27XYWGTPjuALSNWRYJDUXYz5a2gLLA510tdu
 Yn667JfsSwrr+uT+MGwpsyRz0c8Bow==
X-Authority-Analysis: v=2.4 cv=V6xwEOni c=1 sm=1 tr=0 ts=6911b4ea cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=VnNF1IyMAAAA:8 a=x1nD6dm_iKPnSlzVoXgA:9
 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_014835_873004_246DDF38 
X-CRM114-Status: GOOD (  39.92  )
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

On Mon, Nov 10, 2025 at 10:09:31AM +0100, David Hildenbrand (Red Hat) wrote:
> On 09.11.25 01:36, Jan Polensky wrote:
> > The previous change added __GFP_ZEROTAGS when allocating the huge zero
> > folio to ensure tag initialization for arm64 with MTE enabled. However,
> > on s390 this flag is unnecessary and triggers a regression
> > (observed as a crash during repeated 'dnf makecache').
> >
> > Restrict the use of __GFP_ZEROTAGS to architectures that support
> > hardware memory tagging (currently arm64 with MTE or KASAN HW tags).
> > This avoids unintended side effects on other platforms.
> >
> > Fixes: 1579227fe0f0 ("mm/huge_memory: initialise the tags of the huge zero folio")
> > Link: https://lore.kernel.org/r/20251031170133.280742-1-catalin.marinas@arm.com
> > Signed-off-by: Jan Polensky <japo@linux.ibm.com>
> > ---
> >   mm/huge_memory.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index aae283b00857..0c1794656d7a 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -209,14 +209,15 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
> >
> >   static bool get_huge_zero_folio(void)
> >   {
> > +	gfp_t gfp = (GFP_TRANSHUGE | __GFP_ZERO) & ~__GFP_MOVABLE;
> >   	struct folio *zero_folio;
> >   retry:
> >   	if (likely(atomic_inc_not_zero(&huge_zero_refcount)))
> >   		return true;
> > -
> > -	zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO | __GFP_ZEROTAGS) &
> > -				 ~__GFP_MOVABLE,
> > -			HPAGE_PMD_ORDER);
> > +#if IS_ENABLED(CONFIG_KASAN_HW_TAGS) || IS_ENABLED(CONFIG_ARM64_MTE)
> > +	gfp |= __GFP_ZEROTAGS;
> > +#endif
>
> That looks like the wrong approach. If an architecture does not support
> __GFP_ZEROTAGS it should not trigger anything. __GFP_ZEROTAGS should be ignored.
>
> I think the problem is that post_alloc_hook() does
>
> if (zero_tags) {
> 	/* Initialize both memory and memory tags. */
> 	for (i = 0; i != 1 << order; ++i)
> 		tag_clear_highpage(page + i);
>
> 	/* Take note that memory was initialized by the loop above. */
> 	init = false;
> }
>
> And tag_clear_highpage() is a NOP on other architectures.
>
> Gah.
>
> I wonder if the following would work:
>
>
> diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
> index 65db9349f9053..56b82e116cb79 100644
> --- a/include/linux/gfp_types.h
> +++ b/include/linux/gfp_types.h
> @@ -47,7 +47,9 @@ enum {
>         ___GFP_HARDWALL_BIT,
>         ___GFP_THISNODE_BIT,
>         ___GFP_ACCOUNT_BIT,
> +#ifdef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
>         ___GFP_ZEROTAGS_BIT,
> +#endif
>  #ifdef CONFIG_KASAN_HW_TAGS
>         ___GFP_SKIP_ZERO_BIT,
>         ___GFP_SKIP_KASAN_BIT,
> @@ -85,7 +87,11 @@ enum {
>  #define ___GFP_HARDWALL                BIT(___GFP_HARDWALL_BIT)
>  #define ___GFP_THISNODE                BIT(___GFP_THISNODE_BIT)
>  #define ___GFP_ACCOUNT         BIT(___GFP_ACCOUNT_BIT)
> +#ifdef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
>  #define ___GFP_ZEROTAGS                BIT(___GFP_ZEROTAGS_BIT)
> +#else
> +#define ___GFP_ZEROTAGS                0
> +#endif
>  #ifdef CONFIG_KASAN_HW_TAGS
>  #define ___GFP_SKIP_ZERO       BIT(___GFP_SKIP_ZERO_BIT)
>  #define ___GFP_SKIP_KASAN      BIT(___GFP_SKIP_KASAN_BIT)
>
>
> Likely we'd have to make __HAVE_ARCH_TAG_CLEAR_HIGHPAGE a proper
> kconfig option.
>
>
> Then we could turn the default implementation of
> tag_clear_highpage() into a BUILD_BUG.
>
I'd like to suggest to keep the enum untouched and only use the second
part of your suggestion.
Which works by the way for our arch (s390).

 include/linux/gfp_types.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index 65db9349f905..c12d8a601bb3 100644
--- a/include/linux/gfp_types.h
+++ b/include/linux/gfp_types.h
@@ -85,7 +85,11 @@ enum {
 #define ___GFP_HARDWALL        BIT(___GFP_HARDWALL_BIT)
 #define ___GFP_THISNODE        BIT(___GFP_THISNODE_BIT)
 #define ___GFP_ACCOUNT     BIT(___GFP_ACCOUNT_BIT)
+#ifdef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
 #define ___GFP_ZEROTAGS        BIT(___GFP_ZEROTAGS_BIT)
+#else
+#define ___GFP_ZEROTAGS        0
+#endif
 #ifdef CONFIG_KASAN_HW_TAGS
 #define ___GFP_SKIP_ZERO   BIT(___GFP_SKIP_ZERO_BIT)
 #define ___GFP_SKIP_KASAN  BIT(___GFP_SKIP_KASAN_BIT)

This solution would be sufficient from my side, and I would appreciate a
quick application if there are no objections.

Thank you David.

