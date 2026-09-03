Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E19AC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oLkw0qjqO4GI99RoguIDq2Of1fwQfbYDfKvR2b2tKM=; b=jCLUAg3rmunYPzY70LdfFU7F5+
	zFhFPuDdNvDDWn3/COT5MWJg8UtB9DCCGkhpYfJAbRYTl2rC7FxNwu8x2yiu4OtGpODAcBr9GBdC7
	xLjl8GNKqOPJGDLsPaOzIZhpkYbyW4OLA3g68T7ul51rVgZGMRhDDBjdtMqPaeTfZR7d/zX4x5VBo
	UvJ3XNGwwwo5HN/q4/X8ygkcSjeVOlhCHQbUlAlskLpbiIpaNrVk40SDJmSrMsVIWd3xs4JngzCU2
	ACTv5AFXrlP+nBEbV0gJSk5A3g9JJvgwYh7hGqNXG6ttP6dqhQgMByNa3xwxji4P7h0+bnbwjgGiJ
	NAd/hvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25qS-0000000HECw-47l6;
	Thu, 03 Sep 2026 11:43:04 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25qQ-0000000HEBs-2y1T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 11:43:03 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AVdb82788612;
	Thu, 3 Sep 2026 11:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=9oLkw0qjqO4GI99RoguIDq2Of1fwQf
	bYDfKvR2b2tKM=; b=DhmA2OlbGLz7GEK7kiDWIF4IAi/NILmTDomo0TFAlGFHYB
	KSBRpb745sgCXhVbDqoHnrruxZwZazgfAewAwe+DNLAZeiar3doff+n+NZil7l4Z
	NGh5jbCEb2Xybon06LggFN59wHOS4+asVFQuKc1BdWDiWUVWxh8iXmO0ig69KbIe
	K6R7sOSOElBYFPPnuUVVRC1z6ibyYJvAJx/TApIMIC8GFuOXwTSOAyeiE4fK+Yci
	OWZZ4HnI22dhJUNyPQzp+tJF+MLnXW/wTWYT1MR/XeMSMPNB6i0qH/+BWYDopddU
	RnkECX5KJRxY67oueIpSOpVyXLVyeaWeqp8dddhw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbq2tm0p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 11:42:48 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 683BfFVY021696;
	Thu, 3 Sep 2026 11:42:47 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gc9rqqmb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 11:42:47 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 683Bgi6a37159326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Sep 2026 11:42:44 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8B1D2004D;
	Thu,  3 Sep 2026 11:42:43 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFAFC2004B;
	Thu,  3 Sep 2026 11:42:42 +0000 (GMT)
Received: from osiris (unknown [9.111.48.84])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  3 Sep 2026 11:42:42 +0000 (GMT)
Date: Thu, 3 Sep 2026 13:42:41 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v7 02/23] KVM: Make device name configurable
Message-ID: <20260903114241.33034-C-seiden@linux.ibm.com>
References: <20260831144802.834315-1-seiden@linux.ibm.com>
 <20260831144802.834315-3-seiden@linux.ibm.com>
 <apdweRfqt4dTxcU9@google.com>
 <20260902075028.231001-D-seiden@linux.ibm.com>
 <aphLXQL1H2zYZgTi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aphLXQL1H2zYZgTi@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bc1bluPB c=1 sm=1 tr=0 ts=6a995d39 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=OuOidQGzm_B0OR8t9-sA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwMCBTYWx0ZWRfX6I//yFMP1cvb
 2NSO8UtcbS/jeQvugs8aSITFHUubx5IDuYFtrPh776Rm440IrrG9V06vQwZk4Apbqql1Mo/zmhQ
 Kbu98tkJDhVTrcay/2quJr5yzNARM8c=
X-Proofpoint-ORIG-GUID: PFKHzACBWoaNkpsFvvSuoBR3lbObVU9R
X-Proofpoint-GUID: Z39W2fnS2iSIUk0mKJtmPKWfITGpItDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwMCBTYWx0ZWRfX5yoMhPcW5hld
 BSYUovIRTMpBfqaI5PY8NfO/hznkg14OqthzmsfqRtis/roYxWNnMh0UeE5A3A9mINIYzataINO
 m5mbnK0N17WYfJ4w4V3VSHXkKWPDyhAJchPu0ncyQL1t/hEfis116Pu5/ZIQuGr72yGXUomuO05
 qar4zin8TnoRPRhkvif4leyWJI1RA1T55RQ/+5qVgtyyfSb+oDH16eA6IyLWkDdaMQHVhqxjW4N
 rh7OZ7aYsuS0dYbbycwpP/ObNh/kQuhi8yc1QygjxFzUuLnlkGs7MmXt0wpPoNnOmFQoFPwlbnR
 Xio5HUs82IsLmULN+4kmxpRagb3nMBp9SNjMR+defDYovoRq0HhjhdYnOFXYA9/v8IS17ZTwdkX
 RJ/Rfootf80xDNOUceFSdXfcUKgSpSDxe2JFUp+HXb6aWwPWkVDm7oQWxDY51HWX1e27KlJ3/RU
 xaJxHFYeIifbL/hYI0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_044302_864516_435A271D 
X-CRM114-Status: GOOD (  45.53  )
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

On Wed, Sep 02, 2026 at 09:14:21AM -0700, Sean Christopherson wrote:
> On Wed, Sep 02, 2026, Steffen Eiden wrote:
> > On Tue, Sep 01, 2026 at 05:40:25PM -0700, Sean Christopherson wrote:
> > > On Mon, Aug 31, 2026, Steffen Eiden wrote:
> > > > Allow KVM implementations to choose alternative device names. This is
> > > > especially useful for architectures providing multiple KVM
> > > > implementations simultaneously. Architectures providing multiple KVM
> > > > implementations must compile the KVM common code once per
> > > > implementation and mange symbols.
> > > 
> > > What about tracepoints?  Or do those show up as "kvm" and "kvm-arm64"?
> > 
> > Yes, I want them to show up as kvm and  kvm-arm64.
> > 
> > Thanks for pointing that out - I just noticed that I forgot to switch
> > the trace system to kvm-arm64 for the common tracepoints in
> > trace/events/kvm.h
> > I only did it for the arch-local traces in PATCH 21.
> > 
> > I would just do the following:
> > 
> > diff --git a/include/trace/events/kvm.h b/include/trace/events/kvm.h
> > index b282e3a86769..5d4f8a0693a3 100644
> > --- a/include/trace/events/kvm.h
> > +++ b/include/trace/events/kvm.h
> > @@ -5,7 +5,11 @@
> >  #include <linux/tracepoint.h>
> > 
> >  #undef TRACE_SYSTEM
> > +#ifdef KVM_S390_ARM64
> 
> Side topic, I recommend choosing a macro name that doesn't have a near-collision
> with CONFIG_KVM_S390_ARM64.  This *looks* like a typo, i.e. it looks like you
> forgot the CONFIG_ prefix.  Especially since the macro is defined in the Makefile
> and won't show up with e.g. "git grep -w KVM_S390_ARM64". E.g. KVM_S390_BUILD_ARM64
> or something?

Interesting. The name was deliberately chosen to be similar. But I
see that it could be confusing.

I am not totally happy with KVM_S390_BUILD_ARM64 but I cannot find a
better name either.

> 
> Side topic #2, this entire approach seems extremely brittle unless you make it
> all but impossible for non-KVM code to get at KVM structure definitions.  Outside
> of KVM, all compilation units will see the s390 version of KVM structures.  Which
> is "fine", but obviously dangerous and IMO asking for maintenance issues down the
> road.
> 
> > +#define TRACE_SYSTEM kvm-arm64
> > +#else
> >  #define TRACE_SYSTEM kvm
> > +#endif /* KVM_S390_ARM64 */
> > 
> >  #define ERSN(x) { KVM_EXIT_##x, "KVM_EXIT_" #x }
> > 
> > 
> > This would leak a bit of arm on s390 into common KVM but I do not see
> > another way.
> 
> Morpheus: Stop trying to use macros, and use macros!
> 
> The most annoying thing is that macro shenanigans don't play well with hyphens,
> but that can be handled either by using a different macro for the trace name, or
> by creating /dev/kvm_arm64 instead of /dev/kvm-arm64.  My vote would be to have
> the device be /dev/kvm_arm64, assuming that doesn't cause problems elsewhere.

I am not aware of any problems that could cause. It was just a personal
preference IIRC. 

> And taking things a few steps further, we can solve the MMIO issue in a more
> elegant way, and eliminate the runtime string building in this patch (after looking
> more closely, that code needs to be jettisoned no matter what, there's simply no
> reason to specify the names at runtime since they're separate compilation units).
> 
> Rather than splatter #defines throughout header files, deal with the bulk of the
> pain in Makefile.kvm.  By feeding conditionals into Makefile.kvm, the s390+arm64
> build can easily omit coalesced_mmio.o and async_pf.o, define __KVM_HAVE_ARCH_MMIO
> programatically without having to change other architectures, and solve the naming
> stuff.

Yes, this is a great idea. Thank you. I second you, this looks more clean
and stable than the stuff we came up with :) 

I'll integrate it into the series and send it with the next round.

Thank you for your input. Very much appreciated.

	Steffen

...

