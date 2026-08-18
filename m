Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6DAC5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4Ux+/QWCkRJg2MxE2yY8qzYqHCrz3TmVY+vbgce/Xw=; b=lnPU5c0eIjO99GnVutWgFwLO5H
	9X2UwudpDQq5D8sEfGENnohz/Rb3W9htOCjQGcziKNp4QY38+XMlUTCTjchkZCm3Rn21EgtRJe7a3
	FqBOH6LxC3k/R4rBRazRCl1b2Q4uhni2K36NFtHX5v/81TFaMzLh7Q57MgR7J3jHznMDGRnsSQ8AY
	NuCNqv/SgFxl870QyMqEh65OzJr2uOuWwlr9y4RlMT2XtpYA7Enfb+/BobuESjtdaBp/FODLYSvA+
	goNrV3fqlP0TUbCpBiorBE+D2urnGJBpNTOIQOJS3mV7ha04vLyE/ZncKbURBHXWlZMYoSIO/w7Nw
	0DUowoow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKp7-00000008An1-3CFh;
	Tue, 18 Aug 2026 14:29:53 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKp4-00000008AmP-34Ti
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:29:52 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE3ffe542523;
	Tue, 18 Aug 2026 14:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Q4Ux+/QWCkRJg2MxE2yY8qzYqHCrz3
	TmVY+vbgce/Xw=; b=RWVwh/VvvXlls5dH7wvJ3j00r2j4SyKTzO3VZmiIPcIy50
	tOGXXtcdikNr/VzbxPfgwbfPIdYfd3Ug4vzkA0tTcba4tZW+RPSW2AzJUvAWKDxd
	jhfGokTFUhg4zyz7UdA6phuw9E1SY+fjMNuIoHhcCvCoLzCjuoI9aJAjy2xPJsKL
	YJ2QpERhsCloi86UHfQfLINbokEbIbfol+tusUc68cpkoUTCC+NQwcB4qBn6ozDq
	0/cIUEy/EUxcQ2Zat9Epm2ty6lpGDprtAlh0XX8rOs+2edu8AcBLeuwrIM2Frnj1
	oLoo2II/kYFSpNjAF2Qxb++wElX29GemY3ecratA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4g2frt88gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 14:29:37 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67IEQeEg020014;
	Tue, 18 Aug 2026 14:29:37 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4g32eq3ts3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 14:29:36 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67IETXuM42009038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2026 14:29:33 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED8402004B;
	Tue, 18 Aug 2026 14:29:32 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DE7920049;
	Tue, 18 Aug 2026 14:29:32 +0000 (GMT)
Received: from osiris (unknown [9.224.76.185])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 18 Aug 2026 14:29:32 +0000 (GMT)
Date: Tue, 18 Aug 2026 16:29:31 +0200
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
        Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v6 08/33] KVM: arm64: Use accessor functions for core regs
Message-ID: <20260818142931.21865-G-seiden@linux.ibm.com>
References: <20260812153631.3376090-1-seiden@linux.ibm.com>
 <20260812153631.3376090-9-seiden@linux.ibm.com>
 <86a4qq1gyy.wl-maz@kernel.org>
 <20260818092924.21865-C-seiden@linux.ibm.com>
 <86ecfv613k.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ecfv613k.wl-maz@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=OfaoyBTY c=1 sm=1 tr=0 ts=6a846c52 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=v8CuuPHm0S7VpODZ9BkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEwMyBTYWx0ZWRfX+NVez4jOsbpG
 godyTBBEaM0PrH1ZZzKoPyxEiSsG5XX8DiV1/X3t4jBzQFjdzJPIkJUewzswzoJoWFgwB/EED4H
 WICgLAmS5wNH/M3LXQL0K48xhvGGsf8=
X-Proofpoint-GUID: ibFV31CahW-cnJdkL25DpOaeaRym7fEh
X-Proofpoint-ORIG-GUID: 7vXRAGfGpAKRcPWjy_33qur8DqEHUmHs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEwMyBTYWx0ZWRfX/Yyr2tRG5nTs
 vzLAP3kp2L1nLG9boP1NJI61AQkTpCz2JLJDnwuCCkRMUjplnpaZKbjWFy2EFSC02jnjkLKOvT8
 H3brincHUwbwXe5xs9kMaTwcgkxZPGACQysqxW2Qo4h1pIPx3cHK05r+piP/bEhTQHAypVO9Rt4
 tescpu0HW/OeBJnbd2lKPuuH+eqkvGsbFfk415nH0442qMMOrp3LuCWjiuH6N1R+g69zIeu/vzy
 ch0e8QUETSXWhL5f17CYUDMk2GqzGKtPCu5QTV678rlsk3tMEsa/V7DvF9fk/+NNJqScq1r8bBy
 qQJRWey+5PZyGQdgG/DYZHmlrblxmu7z9GnUvZpfDDHvqXyjzTXKN+u85Vq0SXHJ4h8qAZb/ioq
 Qrc8kNba0IXedPI0heqhouUZusm4W/l3e9oVkXEv9sOOaupAh8LHcRwOWdIqFJkrm8u4FqqqMOx
 Dn3r+qmLQRi9eYzNlXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_072950_893344_5209E013 
X-CRM114-Status: GOOD (  29.84  )
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

On Tue, Aug 18, 2026 at 01:54:07PM +0100, Marc Zyngier wrote:
> On Tue, 18 Aug 2026 10:29:24 +0100,
> Steffen Eiden <seiden@linux.ibm.com> wrote:
> > 
> > On Thu, Aug 13, 2026 at 10:56:37AM +0100, Marc Zyngier wrote:
> > > On Wed, 12 Aug 2026 16:36:04 +0100,
> > > Steffen Eiden <seiden@linux.ibm.com> wrote:
> > > >
> 
> [...]
> 
> > > > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> > > > index b01d6622b872..773f6c8e5026 100644
> > > > --- a/arch/arm64/kvm/guest.c
> > > > +++ b/arch/arm64/kvm/guest.c
> > > > @@ -134,19 +134,19 @@ static void *core_reg_addr(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> > > >  	     KVM_REG_ARM_CORE_REG(regs.regs[30]):
> > > >  		off -= KVM_REG_ARM_CORE_REG(regs.mregs[0]);
> > > >  		off /= 2;
> > > > -		return &vcpu->arch.ctxt.regs.regs[off];
> > > > +		return &vcpu_gp_regs(vcpu)[off];
> > > 
> > > Doesn't this belong to the previous patch?
> > > 
> > 
> > My thoughts about positioning this change in this patch:
> > 
> > The previous patch changes the semantics of vcpu_gp_regs and just
> > touched the part where the old semantic of the function was used.
> > This is mainly done by not using vcpu_gp_regs where it was used before
> > as it cannot be used to access e.g. pstate anymore.
> > 
> > This patch then introduces and *uses* new accessor functions for
> > abstractions (and uses the vcpu_gp_regs abstraction where it was not
> > used before). 
> > -> The patch changes direct accesses to using accessor functions.
> > 
> > However, I have no strong feelings for this. If you want this in the
> > previous patch, I can do that.
> 
> I think it'd make more sense. You can capture this in the commit
> message to make it clear.

Just that we are on the same page: you want me to move the change to the
previous patch?

	Steffen


