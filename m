Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42D8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOOk9gLsXApIvwBA8M0tLy+tmj4tVPTyU1/BKJeSsMA=; b=DP5TbhsfQsh6net9FniEayV3pA
	Yer2BYV7kQFuBVHMGiJ8IYIf1+ACnsieQyAbyl2DCm28ucOHNS+YyfdzA+Zit06Ie/9ZfiOlpX3zi
	nTbww8L/EoOnP4RW/6lcFk9s7AzvRwW7kysx+1A8inIiPjGeR1o+WpbPFd92g3bGG8mzOMMJ09cp8
	HQ9h0yxfo9O6dRHNjscewI+2XzyOsQy4ld0EIGQU1XtMFLQFZ7e7kwmLwrCcqRldet7EEOs7pdcml
	/JzJMfEGuwAREtuqtZjOCVZe1dKJbvt4F8YDZuKcGHMrIWqNGM0SwGTcZdtpWzZwzsx4BrPRzg2zx
	SzEPCfww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBtp-000000053Yr-2ERS;
	Fri, 10 Jul 2026 14:08:17 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBtm-000000053YS-3z5p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:08:16 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ADIRCa971536;
	Fri, 10 Jul 2026 14:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=gOOk9gLsXApIvwBA8M0tLy+tmj4tVP
	TyU1/BKJeSsMA=; b=N86bWeZFLP5N010H6UrSrANf8j6o+zhFRWES4H0AoAe89S
	+FuOR/LbKozpOBsrNPk104babkc9fKNcQrEpZCkq+IlIyO6l3x2V37HIM6vWOE4Z
	mSYUyiSq6TGfua646w8FnA2xRPsKRqv6pLm5yOHN3R9+dxToqAmA56ymY//c5U6V
	ZwECIf8R3UwlLp3O5TzgGfrTVaegzy6VYgRx/fugOej8qbWOSbo0uCqywwESZMEi
	drWbnwk/HXWVcEi5zZv8OVIJA38Ahuo+QzBKq3fZSN3Lz3zk4cXGQ2ieJq5y5+y6
	9qTogxHFPvcWvIAss99UVNEKj2PLzCFhTbyvLZNA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6sw574yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 14:08:03 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66AE4quP031520;
	Fri, 10 Jul 2026 14:08:03 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7eqgj4h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 14:08:02 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66AE7sWL28377470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jul 2026 14:07:54 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8CAE2004B;
	Fri, 10 Jul 2026 14:07:54 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC76F20040;
	Fri, 10 Jul 2026 14:07:53 +0000 (GMT)
Received: from osiris (unknown [9.87.147.219])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 10 Jul 2026 14:07:53 +0000 (GMT)
Date: Fri, 10 Jul 2026 16:07:52 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v4 25/27] KVM: s390: arm64: Implement vCPU IOCTLs
Message-ID: <20260710140752.984749-K-seiden@linux.ibm.com>
References: <20260706085229.979525-1-seiden@linux.ibm.com>
 <20260706085229.979525-26-seiden@linux.ibm.com>
 <874ii97obu.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874ii97obu.wl-maz@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sS_TGlGHVq4bSthohWRx-DfYjg95dK3s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX7WYWPja+doT7
 2MXIQ5AQFFqGugG6IM1pswLbY03miFWCsxVp5f3nB3eOvEZgIG9zcyqQQ73Dw7cJQ/tVsN30J8u
 eFTQtICUvkSYltrRlP8A9R8O+aX6GW51pSZJg7E7TAIJse6DaJUnVbLfP9Q9HEiZf5xQWQxLF8l
 lu2HSLnEgdlnKPjwFWZg+SP3qsr5G65EBMu07AaA1v1k++kYiuaobbggkS18jp21/S6HJ/nonCc
 pV4V+HisuOf+eBkOp1lckxMLbZyWEmfD7lelgm3rovAmXZCYXjbCYKAJjwkEvoRAZ+PH6uvg7a+
 hwdAu4+YRdmNpBkXYulkLk6fkVEGinag2mYU/5WlrXUEDfg+gVmsxddZufDP7MizvoABWDulCDb
 sLmsBEBMCsQjF6bV2BE3gWwADhlUJ11/GR95dDA/qwN6AXxpi1/z9wFOc9RWMvx8Le8puvtP/mD
 sjMB9mLDa+A7B95UQfg==
X-Proofpoint-ORIG-GUID: sS_TGlGHVq4bSthohWRx-DfYjg95dK3s
X-Authority-Analysis: v=2.4 cv=FqQ1OWrq c=1 sm=1 tr=0 ts=6a50fcc3 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=KsXPjCIZ-yAXfevDvz8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX0HKpe059BwhW
 1iF3fZngMzkFQx029U5OmavLgwyIc0r4qa2RAh669gT1pniKbAjWqMvHELwDqZ7Hh9Z8XxdZC8m
 JSUY9aUOjmRxEsZP+jIg8MVhdfihbPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_070814_997514_E67F0D1B 
X-CRM114-Status: GOOD (  17.71  )
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

On Wed, Jul 08, 2026 at 11:44:37AM +0100, Marc Zyngier wrote:
> On Mon, 06 Jul 2026 09:52:25 +0100,
> Steffen Eiden <seiden@linux.ibm.com> wrote:
> > 
> > +static void adjust_pc(struct kvm_vcpu *vcpu)
> > +{
> > +	if (vcpu_get_flag(vcpu, INCREMENT_PC)) {
> > +		kvm_skip_instr(vcpu);
> > +		vcpu_clear_flag(vcpu, INCREMENT_PC);
> > +	}
> > +}
> 
> Can you clarify the semantics of adjust_pc() here? arm64 also deals
> with exceptions in the same code, and I wonder how you deal with this.
>

We will do the same thing as native arm64 does. The KVM in this series
has no clue what an exception is. Thus I skipped the handling here. The
exception stuff is added in the second series anlongside with the sysreg
handling.

...

> > +
> > +	kvm_sigset_deactivate(vcpu);
> > +out:
> > +	if (unlikely(vcpu_get_flag(vcpu, INCREMENT_PC)))
> > +		adjust_pc(vcpu);
> 
> arm64 has the following statements:
> 
> 	if (unlikely(vcpu_get_flag(vcpu, PENDING_EXCEPTION) ||
> 		     vcpu_get_flag(vcpu, INCREMENT_PC)))
> 		kvm_call_hyp(__kvm_adjust_pc, vcpu);
> 
> It isn't clear to me why you can afford not to deal with pending
> exceptions when returning to userspace.
> 

Same reasoning like above. We'll do the exact same thing as native arm64
with the next series.

Thanks for looking into s390 code :) 

	Steffen


