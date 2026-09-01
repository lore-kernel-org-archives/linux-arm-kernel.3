Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DA7C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxhcAqB8QEZ84GojTYdwOMRzkKgA+w1XZ/nRxWLm/OE=; b=gD2i+nEZYYmjp8u9fxvVBlnC0F
	8NmJShA6wZTAa888Lw4ealLDsvnJug55t9KbkXFC9z8V9c3Q3eOzQxWKYLmUeymOWSUlsU6ty5Rqu
	UC/0CUDOgX7t45cGsrdHjvZYcxbhvvSd4SZdkLtOqF5RRRKoaQxz+AY/iTrxgwK2GW32UzNYRKvkm
	BVG5FOai6vpLFrXdNEPnlZalfXrBZ9l1lxTLctbXkRp7n+i3bR3bGWWaSJ0sieq2yT5DPR/Nchney
	W24orxTcie5vqK6o9gqJxWL4MBfR3oUHEDypOZtZGuoyJqYI07/f8WiV69HvbIbUQwUNMZwmdRV5H
	H0HAXWhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K3A-0000000BJU5-1K6M;
	Tue, 01 Sep 2026 08:41:00 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K37-0000000BJT2-25Dz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:40:58 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6817VVKP2892253;
	Tue, 1 Sep 2026 08:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=xxhcAqB8QEZ84GojTYdwOMRzkKgA+w
	1XZ/nRxWLm/OE=; b=ggz/p6PeqfDDYriTMw42LJo7m/yt0CLpS4lNTFBYlIjG10
	SV7h0CBlhsG7REXslows6EKVjWkSUSw9/LOCGLt9UODV2PuQRPntFMbmTvLf13St
	hHRZkjBukmKtlRPMj9K+f8OmuN6KU2YdxOl0Ngo1snLhsKsdaLv9f5XWW8x9wThz
	yxKzrr0bzgIaTHObEFD2J82td5Mq/J85+OtEZy4sZTyl7B0BawHoyAC3wURaGoJK
	6nIxbY+o/DSCXv0xC0uG5RDHaHuMk+F5wpkcIRHQNTXb7Ig3I/tySS2rYNE68cIc
	EpsHqxiRtgFZNcXxn0BUYptH5t7a0ZXh1S5olybg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbq3r6mwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 08:40:44 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6818QMdF020562;
	Tue, 1 Sep 2026 08:40:43 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gca4w2s2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 08:40:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6818echH39518516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Sep 2026 08:40:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F93A2004B;
	Tue,  1 Sep 2026 08:40:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F4A920040;
	Tue,  1 Sep 2026 08:40:38 +0000 (GMT)
Received: from osiris (unknown [9.224.76.185])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  1 Sep 2026 08:40:38 +0000 (GMT)
Date: Tue, 1 Sep 2026 10:40:37 +0200
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
Subject: Re: [PATCH v7 11/23] KVM: arm64: Share arm64 code with s390
Message-ID: <20260901084037.185345-C-seiden@linux.ibm.com>
References: <20260831144802.834315-1-seiden@linux.ibm.com>
 <20260831144802.834315-12-seiden@linux.ibm.com>
 <87se3tmlrv.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87se3tmlrv.wl-maz@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=EIc2FVZC c=1 sm=1 tr=0 ts=6a968f8c cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=o0YXK4FomTIqG83GwfgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3NSBTYWx0ZWRfX3bKHd2onVRQi
 M1H/ksAUgtv8GUnhaCvKhEAE1bQlLbtyox34SXSGO9hkxC6nXHVvEU7/XhpF7f9hC3a8FxITGnm
 Rnm8kFH19g2K8SfKTF+QVUudbmFOuIWjnDC8aSjstj8KyWREgwyqdu3u8U/jhXP/ATneT6gNXgf
 9f8K9AdXXyAp/68A46zDq7DeVf92+uYuC7Eu6txfWiB895BXHx1MXyQGIaIV0jtyOUZ9zQg9FAy
 gBMSQA29oPrMz4QBxXBBl+XeJyEjlt5eCxt4H4aJzuPhepWCvo9jeInWbBT8srTGUvOu64SEbAq
 0pGCUORdGVPKlHkOlRDT5qgfTZuHMFf9AyPsjKadtfjhBJcPwWP02lJA45wZJba4k93/IOpkZjv
 oxfLahHfF/0uOaX/pvMd6YeDI6F5ZhC6dKbOBh/zyKHkufGA1Gug3k2zkTVQR6Y73IF0BmFkm+I
 hlaMP0OC2KpawS1dZYg==
X-Proofpoint-GUID: 7wKUDKpRsoBqOygV8xzSu0WG5_odBX3U
X-Proofpoint-ORIG-GUID: GYY_qmqbellrpmBXqM2ldcTkZ8eYLr0D
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3NSBTYWx0ZWRfX8lILL3zXjoYz
 sqUCvOK85NCWZfjNpuA7uLa0uoHm5h7675EBfui2MeNOeNh1Rv4PzpzJRHm0WngGooMQA3GJChR
 OBMNRlosW5WWUFCYy8uSQ+jr2AOz/hU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_014057_543707_5139BCFA 
X-CRM114-Status: GOOD (  34.07  )
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

On Tue, Sep 01, 2026 at 09:13:56AM +0100, Marc Zyngier wrote:
> On Mon, 31 Aug 2026 15:47:48 +0100,
> Steffen Eiden <seiden@linux.ibm.com> wrote:
> > 
> > Mark functions that s390 can use to implement arm on s390 as shared
> > functions.
> > 
> > No functional change.
> > 
> > Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
> > ---
> >  arch/arm64/kvm/arm.c         | 3 +++
> >  arch/arm64/kvm/guest.c       | 6 ++++++
> >  arch/arm64/kvm/handle_exit.c | 6 ++++++
> >  arch/arm64/kvm/mmio.c        | 2 ++
> >  4 files changed, 17 insertions(+)
> > 
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 8b080804bc90..6b92a3c1d490 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -1603,6 +1603,7 @@ static unsigned long system_supported_vcpu_features(void)
> >  	return features;
> >  }
> >  
> > +#ifdef ARM64_S390_COMMON
> >  static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
> >  					const struct kvm_vcpu_init *init)
> >  {
> > @@ -1656,6 +1657,8 @@ static bool kvm_vcpu_init_changed(struct kvm_vcpu *vcpu,
> >  			     KVM_VCPU_MAX_FEATURES);
> >  }
> >  
> > +#endif /* ARM64_S390_COMMON */
> > +
> >  static int kvm_setup_vcpu(struct kvm_vcpu *vcpu)
> >  {
> >  	struct kvm *kvm = vcpu->kvm;
> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> > index 773f6c8e5026..6ca5a9f357cd 100644
> > --- a/arch/arm64/kvm/guest.c
> > +++ b/arch/arm64/kvm/guest.c
> > @@ -62,6 +62,7 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
> >  		       sizeof(kvm_vcpu_stats_desc),
> >  };
> >  
> > +#ifdef ARM64_S390_COMMON
> >  static bool core_reg_offset_is_vreg(u64 off)
> >  {
> >  	return off >= KVM_REG_ARM_CORE_REG(fp_regs.vregs) &&
> > @@ -306,6 +307,8 @@ static int set_core_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> >  	return err;
> >  }
> >  
> > +#endif /* ARM64_S390_COMMON */
> > +
> >  #define vq_word(vq) (((vq) - SVE_VQ_MIN) / 64)
> >  #define vq_mask(vq) ((u64)1 << ((vq) - SVE_VQ_MIN) % 64)
> >  #define vq_present(vqs, vq) (!!((vqs)[vq_word(vq)] & vq_mask(vq)))
> > @@ -543,6 +546,7 @@ int kvm_arch_vcpu_ioctl_set_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
> >  	return -EINVAL;
> >  }
> >  
> > +#ifdef ARM64_S390_COMMON
> >  static int copy_core_reg_indices(const struct kvm_vcpu *vcpu,
> >  				 u64 __user *uindices)
> >  {
> > @@ -591,6 +595,8 @@ static unsigned long num_core_regs(const struct kvm_vcpu *vcpu)
> >  	return copy_core_reg_indices(vcpu, NULL);
> >  }
> >  
> > +#endif /* ARM64_S390_COMMON */
> > +
> >  static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
> >  {
> >  	const unsigned int slices = vcpu_sve_slices(vcpu);
> > diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> > index db37678dcb05..6e59a7b12d40 100644
> > --- a/arch/arm64/kvm/handle_exit.c
> > +++ b/arch/arm64/kvm/handle_exit.c
> > @@ -213,6 +213,7 @@ static int kvm_handle_guest_debug(struct kvm_vcpu *vcpu)
> >  	return 0;
> >  }
> >  
> > +#ifdef ARM64_S390_COMMON
> >  static int kvm_handle_unknown_ec(struct kvm_vcpu *vcpu)
> >  {
> >  	u64 esr = kvm_vcpu_get_esr(vcpu);
> > @@ -224,6 +225,8 @@ static int kvm_handle_unknown_ec(struct kvm_vcpu *vcpu)
> >  	return 1;
> >  }
> >  
> > +#endif /* ARM64_S390_COMMON */
> > +
> >  /*
> >   * Guest access to SVE registers should be routed to this handler only
> >   * when the system doesn't support SVE.
> > @@ -404,6 +407,7 @@ static exit_handle_fn arm_exit_handlers[] = {
> >  	[ESR_ELx_EC_GCS]	= kvm_handle_gcs,
> >  };
> >  
> > +#ifdef ARM64_S390_COMMON
> >  static exit_handle_fn kvm_get_exit_handler(struct kvm_vcpu *vcpu)
> >  {
> >  	u64 esr = kvm_vcpu_get_esr(vcpu);
> > @@ -439,6 +443,8 @@ static int handle_trap_exceptions(struct kvm_vcpu *vcpu)
> >  	return handled;
> >  }
> >  
> > +#endif /* ARM64_S390_COMMON */
> 
> Why the exit handler, and not the EC handlers aside from the UNKNOWN
> one? Yes, you probably aren't there yet in this series, but I can tell
> you are going to add more and more of these.
> 
> But the EC array is absolutely architectural, and there is no good
> reason to maintain your own.
> 
> So instead of this, why not keep the EC array altogether, and
> implement stubs for the ECs you don't support?
> 
> 	M.
> 

There was no specific reasson to define our own EC array as far as I
remember. I will try reusing the array and find out if there are any
issues with that. But I do not expect any. 

I assume the stubs probably just forward to handle_unknown_ec, or do you
have a different suggestion?


	Steffen


