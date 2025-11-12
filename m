Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E4ECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JuNc9zQLBu8qi5B/xB29YuEpuA1JxpwE3GCaopKicOg=; b=vJiMo7xnzYo4l8PwMYErYS13cp
	v//MTCOZZETh9bjkz2KKpsaieuGvf0N9v6mRnAmJSq0ldL0SesRZYvfZPYlh5ltgMLnBYbLoYlpGK
	ZMTUxSHe3x5Y05qYN0LVoXd8Ee9UhxIyuWw84xTurTar90worRf1lHI4cK+u8K2BUF1YO1LOP3ojw
	VeYrjU7mXJk7ZEEHdezfvL17rB4nIhAvEMz7SqLMAJJtBFgx+RrB5BuJPYhac4S/FD+wE5URf6MCj
	gpm1hQmiQSUwlmq8Yk2kCbsaR8tZN2/uqGNiXvjwk7mm+XHU46WuJNCBnaU9AD1sgMCaToeUQrM+/
	Amj/QB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6U9-00000008NTr-2kbs;
	Wed, 12 Nov 2025 08:45:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6U7-00000008NSx-2RQ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:45:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E7B23434C0;
	Wed, 12 Nov 2025 08:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8BEC4CEF7;
	Wed, 12 Nov 2025 08:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762937146;
	bh=3PpC23lXWHMZc/xqZ8AI6v/rV2TDMJJUIRhSuy6tr+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyMxGT/HHav6pdcoZJe2w68jZ+BllzlUulSSnAFhC6j02cdmGIa6ljPeDogIuN6XR
	 xhLX/yJwi6pJBkqwM83lBtGiHUOPiA30EJ0qwUtS7Nyqr93Fcai3jYJ0ka23jKxlb+
	 MQJfYJlUGv+r9aild/gH4M3IRHMzB5OSH+31GPo7UPMwXoEkNZc1Gdlsyh00FmBWHl
	 I5dNhWL6hsS1AhaZ9ZJn2Xi10rtsUVD3qvUIjO30+IJgK81FQ2FCtDDPd5LKdOGPed
	 CkqIr6cMqr9rr30BORWUr9CFJA3YIl4HsbxqOT31AOgWiysacpegcIy+Bgrq9fcF6v
	 2TS3igp6FMojg==
Date: Wed, 12 Nov 2025 00:45:45 -0800
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: Re: [PATCH v2 20/45] KVM: arm64: Revamp vgic maintenance interrupt
 configuration
Message-ID: <aRRJOSNnvD1B0ZfJ@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
 <20251109171619.1507205-21-maz@kernel.org>
 <aRPQBQVPLVXGOxU-@kernel.org>
 <86y0obtzt9.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86y0obtzt9.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_004548_239858_CA175082 
X-CRM114-Status: GOOD (  17.88  )
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

On Wed, Nov 12, 2025 at 08:33:54AM +0000, Marc Zyngier wrote:
> On Wed, 12 Nov 2025 00:08:37 +0000,
> Oliver Upton <oupton@kernel.org> wrote:
> > 
> > On Sun, Nov 09, 2025 at 05:15:54PM +0000, Marc Zyngier wrote:
> > > +static void summarize_ap_list(struct kvm_vcpu *vcpu,
> > > +			      struct ap_list_summary *als)
> > >  {
> > >  	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
> > >  	struct vgic_irq *irq;
> > > -	int count = 0;
> > > -
> > > -	*multi_sgi = false;
> > >  
> > >  	lockdep_assert_held(&vgic_cpu->ap_list_lock);
> > >  
> > > -	list_for_each_entry(irq, &vgic_cpu->ap_list_head, ap_list) {
> > > -		int w;
> > > +	*als = (typeof(*als)){};
> > >  
> > > -		raw_spin_lock(&irq->irq_lock);
> > > -		/* GICv2 SGIs can count for more than one... */
> > > -		w = vgic_irq_get_lr_count(irq);
> > > -		raw_spin_unlock(&irq->irq_lock);
> > > +	list_for_each_entry(irq, &vgic_cpu->ap_list_head, ap_list) {
> > > +		scoped_guard(raw_spinlock, &irq->irq_lock) {
> > > +			if (vgic_target_oracle(irq) != vcpu)
> > > +				continue;
> > 
> > From our conversation about this sort of thing a few weeks ago, wont
> > this 'continue' interact pooly with the for loop that scoped_guard()
> > expands to?
> 
> Gahhh... I was sure I had killed that everywhere, but obviously failed
> to. I wish there was a coccinelle script to detect this sort of broken
> constructs (where are the script kiddies when you really need them?).
> 
> Thanks for spotting it!
> 
> > Consistent with the other checks against the destination oracle you'll
> > probably want a branch hint too.
> 
> Yup, I'll add that.

I can take care of it when applying. These patches need to bake :)

Thanks,
Oliver

