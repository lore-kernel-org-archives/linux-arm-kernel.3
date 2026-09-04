Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828EAC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 23:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvttKtEcaCMI+iTMj6fHxLxcsoxDPGgctjnzDBBojTs=; b=MQO5oVOaxVtMKiFyhk2QALA93c
	ncodfCHmlLvSc2CzkgHCqCGS87HYzv+SSxmA/eGrrLQO0Xt4bC+qUvCOSAy0VNQWnQoeLm4cHRBCT
	x1N6q3N5OyStOOEeI9DeICPwfhe+/QQ5KaNyiJG8MGGzcHd4fAHDSvjZzI3V5bmBJ7hd0f3zdLnak
	LZuY0CQeWWaa1WiHq7ZuiXl0wMIhN5V9kyJYbYEJDFoBBbqKX+vr7xlf3eHUzUKK1nj8Me2tE3oks
	udJ8gpyV6Og9JkIFJiQZuPiFUC6FA4WfXkjuRXwrnL8AEKfjL1TZclFV9ESjB5gfIdAf7O/JgdpCZ
	FmIhYFIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2d0O-00000003SMC-2SiQ;
	Fri, 04 Sep 2026 23:07:32 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2d0K-00000003SLq-49sj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 23:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788563245; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=WvttKtEcaCMI+iTMj6fHxLxcsoxDPGgctjnzDBBojTs=;
	b=QtMA2AvaD8LTH1kMmMvttySnxAbK2YVps5+i+iPnnjmkgaldwlNBjlnveFucvEXVzEvDhnlEoKzykLhYwZ8XYkUyxYNbu+Z5t1jFhbvDHKDOwYnfJXoRtDVd0pElPDbtblkgyacwCV7TyIFnc7BCxO5VyQiJ0VJ9T5LLbtDdCuY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XAJiLbv_1788563243;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0XAJiLbv_1788563243 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 05 Sep 2026 07:07:23 +0800
Date: Sat, 5 Sep 2026 07:07:23 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Ben Horgan <ben.horgan@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Gavin Shan <gshan@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Trap guest MPAM accesses whenever MPAM is
 implemented
Message-ID: <ans4c7lc4v3ouekqkpxrqyenhsvxoe32zkw2qhqgvtiwsbkaji@rjbgkm3yzq63>
References: <20260903160819.831518-1-fuad.tabba@linux.dev>
 <xmhaptfcp2gyoovgus35yhx2uloe2zt3zniwscd2dwnatf2fii@jqobvjdmkqed>
 <CA+EHjTwNJvqqeGtgxR2q+CRn5DJfigssLRcZxz-zY5XvATwOcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwNJvqqeGtgxR2q+CRn5DJfigssLRcZxz-zY5XvATwOcQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_160729_750531_2D1477D2 
X-CRM114-Status: GOOD (  21.09  )
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

On Fri, Sep 04, 2026 at 12:18:00PM +0800, Fuad Tabba wrote:
> Hi Yuan,
>
> > > +static bool
> > > +test_has_mpam_sysregs(const struct arm64_cpu_capabilities *entry, int __unused)
> > > +{
> > > + /* The registers exist whether or not firmware enabled MPAM. */
> > > + return detect_ftr_has_mpam();
> > > +}
> >
> > My understanding: arm64.nompam affects detect_ftr_has_mpam(),
> > thus when arm64.nompam = 1 w/ MPAM is supported in hardware,
> > the KVM's trap setting is skipped yet, and it's possible that
> > SYS_MPAM2_EL2 and SYS_MPAMHCR_EL2 are configured not trap anything
> > by firmware, thus guest can still access MPAM registers.
> >
> > Do we need check the raw id register values for the real support
> > state of MPAM here ?
>
> Under arm64.nompam, finalise_el2_state skips the MPAM2_EL2 and
> MPAMHCR_EL2 writes too, via the same check_override, so the kernel
> does not clear the traps either. What a guest reaches there is
> whatever EL3 left, UNKNOWN when EL3 is implemented.

That's what I was worried before w/ nompam = 1 for guest can still access
the MPAM registers. Now it's fine to me w/ limitation on usage of nompam
described in [1], the limitation on guest behavior described there yet.
Thanks for the reply! I just not aware [1] before.

> This patch is for the case where the kernel cleared the traps itself and
> never set them again.

Yes next time I will explicitly say want to discuss something may
related to the patch's main purpose.

>
> Gating on the raw ID registers would make __activate_traps_mpam()
> write MPAM2_EL2 on guest entry there. AFAICT that traps to EL3
> wherever MPAM3_EL3.TRAPLOWER is still set, which is the firmware the
> option is for: 10f885d63a0e ("arm64: Add override for MPAM") added it
> for firmware that leaves the trap set and does not emulate it.

Make sense, it break the nompam actually on platform need it,
this isn't good idea.

For the purpose of this patch:

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>
> The arm64.nompam hazard is documented separately [1].
>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/

