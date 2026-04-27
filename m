Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9128BFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 05:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcwYOBMc+yK36LdyPYEOFx9D/UsqSBJDiqZK+/FoA3c=; b=a0ZhhgakaivrlA60hhoZXZmOEE
	7ukGGBc32kvhgQcPoAvfJIYoy3apnX5g1eOEV1IWkeuZgiUhqeLomS/lCQow8OFdlnKaS6kxEWGSx
	ycIyDfUH92N1V0yUY8tnls9ueCjR/38kp/Fmv3wsnF1nZ8JEVHEYn/Symz0pGSrXbb0Kusa0tkONj
	7Syjn90KDrkJq3FBy9G88MF6I1nPmEhtcZwHHnB+Svi4eGaIf37OLpS9nhOj2GoqkpMr+apfzPdSd
	wCNJBQ++WBUaPFx9DsLCRure+PkWeYIDOH0CLbKwVN3ajP5jT5Dm65HGgGlSwQWS1trK1lv48xB1p
	TL0aB0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHEYw-0000000GBYa-32Nv;
	Mon, 27 Apr 2026 05:31:18 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHEYt-0000000GBXO-0oJm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 05:31:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777267867; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=DcwYOBMc+yK36LdyPYEOFx9D/UsqSBJDiqZK+/FoA3c=;
	b=SjL8SGg9tS1JhN6Ttr12rvT1kbkMdDaw8gCDr3JDv+37MXJ6iNH+yqiWj8NeSeYuDKf3xPff5T3P/BjPb4t00QCwJwAmnjuI6iKvyVEskq0VYkhIEU3te1rKzuRiuMmpjV4AQ6YnDT4Ruls9pC3EcH+EWM26bOpQeFZHV5Bum+4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X1jDD2S_1777267863;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X1jDD2S_1777267863 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 27 Apr 2026 13:31:03 +0800
Date: Mon, 27 Apr 2026 13:31:02 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Wake-up from WFI when iqrchip is in userspace
Message-ID: <gd2ju4harg3bpt4kfbenyblfhg4di2vsu6q26e5rsg2whibq4w@rl7sippqm3sj>
References: <20260423163607.486345-1-maz@kernel.org>
 <uhqgyol622go4lm5btbk4jyieb3swhskpkyel4mnksfeki2mo2@ecnjvxwiqcfw>
 <87jytwbz2d.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jytwbz2d.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_223115_917585_E361752B 
X-CRM114-Status: GOOD (  30.03  )
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

On Fri, Apr 24, 2026 at 08:24:42AM +0800, Marc Zyngier wrote:
> On Fri, 24 Apr 2026 07:33:02 +0100,
> Yao Yuan <yaoyuan@linux.alibaba.com> wrote:
> >
> > On Thu, Apr 23, 2026 at 05:36:07PM +0800, Marc Zyngier wrote:
> > > It appears that there is nothing in the wake-up path that
> > > evaluates whether the in-kernel interrupts are pending unless
> > > we have a vgic.
> > >
> > > This means that the userspace irqchip support has been broken for
> > > about four years, and nobody noticed. It was also broken before
> > > as we wouldn't wake-up on a PMU interrupt, but hey, who cares...
> > >
> > > It is probably time to remove the feature altogether, because it
> > > was a terrible idea 10 years ago, and it still is.
> > >
> > > Fixes: b57de4ffd7c6d ("KVM: arm64: Simplify kvm_cpu_has_pending_timer()")
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  arch/arm64/kvm/arm.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > > index 176cbe8baad30..8bb2c7422cc8b 100644
> > > --- a/arch/arm64/kvm/arm.c
> > > +++ b/arch/arm64/kvm/arm.c
> > > @@ -824,6 +824,10 @@ int kvm_arch_vcpu_runnable(struct kvm_vcpu *v)
> > >  {
> > >  	bool irq_lines = *vcpu_hcr(v) & (HCR_VI | HCR_VF | HCR_VSE);
> > >
> >
> > Hi Marc,
> >
> > > +	irq_lines |= (!irqchip_in_kernel(v->kvm) &&
> > > +		      (kvm_timer_should_notify_user(v) ||
> > > +		       kvm_pmu_should_notify_user(v)));
> >
> > How about a new helper like 'kvm_should_notify_us_irqchip()' ?
> > We can replace the same part at beginning of kvm_vcpu_exit_request() and
> > here w/ unlikely().
>
> I'd rather not introduce a helper, for two reasons:
>
> - this needs to be backported all the way to 5.19, because that's how
>   far it has been broken. So keeping it small and localised is far
>   better than introducing a helper that will make the backport less
>   obvious.

Agree on this point very much!

>
> - I have patches to remove the other calls to kvm_*_notify_user() as a
>   simplification of this utterly stupid feature.

OK.

>
> Finally, and while I agree that this could take an unlikely()
> qualifier, a much better course of action would be to have a separate
> patch that moves the qualifier to the predicate itself.

I got it, thanks for your such detail explanation!

>
> Thanks,
>
> 	M.
>
> --
> Jazz isn't dead. It just smells funny.

