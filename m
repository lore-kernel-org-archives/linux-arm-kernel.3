Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3F4CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 05:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoUQNrGqm47SfMzQQZnlUAHB757FjtGMtZ/e1e1ss9E=; b=iK09PHY6eN0JhwOVTkGxJHdpat
	B9Ut9snZa8MmVMRMNmrd7JqRsXtqQ1aRG3cMTuVsbznHxsMvDk+8aFymRIkQeWTATmozeaZZ8FG21
	v+3xlICnlh8G6l7/A0RcKSC9cq917jl4oPuC8NC4HDSVe11CKKV/rUFezXneoGZNPacGVNelwL0w9
	hn1rHY4F6MOVhZ2DAx2eXHxG3IQuzm2WNFIJ6XUOMm6IB6fAc/0UN33ySA4VSU/5pXWc2zE0w0JPv
	2fHXeKQT9HX0oEzyzrZQzy63VfJkH1CnRYZ1ONrpTTvMAtInh/HNvSvKcrPcucQtpIo8t+yZApLu2
	bGWFLN+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ06u-0000000DdXH-1cdS;
	Mon, 15 Jun 2026 05:43:48 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ06r-0000000DdWs-3Irj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 05:43:46 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84234c83142so1281527b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 22:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781502224; x=1782107024; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BoUQNrGqm47SfMzQQZnlUAHB757FjtGMtZ/e1e1ss9E=;
        b=PIQh/itt6HyGOxq9liCxLLSjryUHfC/Hsmkdn6uccq00iJC+cwqYbAmFtSth6APTM7
         E/asSYUrGnqh2/4qEck0X2KFEv+zS0FxfO0Kj7mYiBaiu4fIq+6uGZ+yj8hUVk7jiua4
         zfuFNJ3lqBd4s5SxBPYRCVsLtDqgbXhZfv5HUtqvWWkOnIAoQIhUOP02Zypcu/mR+i5g
         CIN9fbRVyudtkBG9CHPcLvh/cd25XoYjlRf5ccU2Wk4WtHBHMIA5rTF8OrqMZJwzipAC
         7cPNfwzOUi3NStMLvTt7IuD7UwQ/vVwspRIPVwUJTgSOTZUwL3dRne/B7vzTBlN5W69F
         ROuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781502224; x=1782107024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoUQNrGqm47SfMzQQZnlUAHB757FjtGMtZ/e1e1ss9E=;
        b=DqElsqlUjlcrjMBzslsgwprAAOjfUglzs7i8Eihb4l1JDUutLNMiBjAC1uSGEHz/ds
         yjo/ZNTUYSnDejqfboRj4PT8vOFkLge7jW3O0/+9/atG1rXc5+H8SJDwV2aQ2NvGvi41
         5imtG5aEG0Su2HK6CFKSkATo3hu6V+UDhIjM/6AluZ/M2O+1LlEFOmzul+zKKBB7O8Bp
         TA0uNVPDi3gB7WJzHFgbhmlVa8UPRUb0ZYbrZsM5GqjvFY6mmYlR4ql+zXTWP3ZsGTC5
         Ih2oA8v3JcucedWJ8090Z6d269eGmhku8JAelXFH9Us56lfU3qgC/kqiR3ahYSfinALe
         zzCA==
X-Forwarded-Encrypted: i=1; AFNElJ+VLQwIqnfKppb7Uh/VnVlwEqLSC0We2hyv7QGAPgcx9Ls60PBMAMcug7cigoCIrofQe0XgcF4ICe7LvNSrJbGo@lists.infradead.org
X-Gm-Message-State: AOJu0YxvOVaTbGwgxaPIDtb15SJfdVH+vjhCn72Fn/1p7koaEMu2u/Q7
	fcW+0erVYKhE7RFebjzbbmNFtzp7SStfxnYZl1Rv85S1nyj9MFsP9jZu
X-Gm-Gg: Acq92OE183x9pbD9npt2VjIxwJr85xOPN4xI5OnNBZa7IKWxUDlN7M0ZDYBLlLlCfSt
	7NF/8F24wdZ108thFPSqxw91/gEdP7kShAIv9Ouag0grKqNGL5ZDT7iEsIOcQXKbVnJ81GMZDcf
	3ubV5PaSUsBYAUlis4/vkSdpl1nNBxtL3A1m2ZF4dV4bN9fH4tjDCisKaWMnALDCFOG6O9YS3O1
	F2LMFJHp2KGBhuTvuPMI+/9Hvmo9AMxaMlijUDfVdTDRpAg6AmM95G99J7NxXM+K6cYNiKvv+yJ
	AmxPCH3bXgvf+On2VJB3yMp+h+7QUy/Hn38qVZr5dYJDothMaEZVgAm7MBkHyR+IdoCUDUL7BEQ
	c1YR+Te0YIeljFT8Bcldk5YQx01dbpw24pTStDE4Ziz8uLAZ2AhfCA8ofuMUgjICP/i/IOBXqAs
	woH7qKRr3XnFTeTBw5CNYRPrOCkzsoVZoOW5DKLM1+nis=
X-Received: by 2002:a05:6a00:4089:b0:842:40f8:74d0 with SMTP id d2e1a72fcca58-844e193a46fmr10195772b3a.6.1781502224229;
        Sun, 14 Jun 2026 22:43:44 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b020b53sm8483438b3a.47.2026.06.14.22.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:43:43 -0700 (PDT)
Date: Mon, 15 Jun 2026 14:43:39 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, Sascha.Bischoff@arm.com,
	jic23@kernel.org, timothy.hayes@arm.com, andre.przywara@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: Re: [PATCH] KVM: arm64: vgic: Check the interrupt is still ours
 before migrating it
Message-ID: <ai-RC2FlxE5y38mP@v4bel>
References: <aiHnI1mu6SGQrgnz@v4bel>
 <aiJmBfXAxcytfGha@kernel.org>
 <87ecila0w3.wl-maz@kernel.org>
 <aiKMNIUMv9GQiIbD@kernel.org>
 <ailsCnyoS82r_QRz@v4bel>
 <865x3qtmg6.wl-maz@kernel.org>
 <aitta-IcWnRepEva@v4bel>
 <87ldch884j.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldch884j.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_224345_885189_6D06FE66 
X-CRM114-Status: GOOD (  43.12  )
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

On Sun, Jun 14, 2026 at 04:16:44PM +0100, Marc Zyngier wrote:
> On Fri, 12 Jun 2026 03:22:35 +0100,
> Hyunwoo Kim <imv4bel@gmail.com> wrote:
> > 
> > On Wed, Jun 10, 2026 at 05:00:25PM +0100, Marc Zyngier wrote:
> > > It's rather unclear to me what the semantics of this are.
> > > 
> > > If vcpu-a decides to nuke the LPIs of vcpu-b and the LPI had in the
> > > meantime been migrated to vcpu-c, but obviously not observed by vcpu-c
> > > yet as the LPI is still on vcpu-b's AP-list, then I don't see the
> > > point in keeping this state.
> > > 
> > > Am I missing something obvious?
> > 
> > I looked a bit more into Oliver's review, the one suggesting that pending 
> > be cleared only for resident LPIs while the ones being migrated are left 
> > in place.
> > 
> > What the leave preserves is the pending edge of a single LPI whose target 
> > is already vcpu-c but which is still on vcpu-b's ap_list. This edge is
> > always lost when we just clear it, but for a device that fires again a 
> > later INT reaches vcpu-c through the oracle, so it is mostly harmless.
> 
> Not completely harmless. When the guest writes EnableLPIs==0, it
> accepts the lost of any pending bit that could be stored. These won't
> be regenerated, unless the device signals a new event that maps to the
> same LPIs. But again, this is the guest's own decision, and I don't
> see a reason to prevent it from shooting itself in the foot.
> 
> > The
> > exception is a software LPI that never fires again(irq->hw == false): 
> > that edge is then lost with no way to recover it, because 
> > its_sync_lpi_pending_table only re-syncs the LPIs whose target_vcpu matches, 
> > and the disable path does no pending writeback. I am not entirely sure about 
> > this part, though.
> 
> I don't think this is a problem, as the architecture doesn't guarantee
> the state of the pending table after turning EnableLPIs off. There's
> even a note recommending to move the interrupts to another RD before
> doing that.
> 
> > 
> > Since this does not look like the common case, if it does not need to be 
> > covered I will send v2 keeping only the pending clear and the ref hold in 
> > vgic_prune_ap_list(). What do you think?
> 
> So that it is entirely unambiguous, my suggestion is to have this:
> 
> diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> index 5a4768d8cd4f3..70a161383e5a6 100644
> --- a/arch/arm64/kvm/vgic/vgic.c
> +++ b/arch/arm64/kvm/vgic/vgic.c
> @@ -203,6 +203,7 @@ void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu)
>  	list_for_each_entry_safe(irq, tmp, &vgic_cpu->ap_list_head, ap_list) {
>  		if (irq_is_lpi(vcpu->kvm, irq->intid)) {
>  			raw_spin_lock(&irq->irq_lock);
> +			irq->pending_latch = false;
>  			list_del(&irq->ap_list);
>  			irq->vcpu = NULL;
>  			raw_spin_unlock(&irq->irq_lock);
> @@ -792,7 +793,11 @@ static void vgic_prune_ap_list(struct kvm_vcpu *vcpu)
>  			continue;
>  		}
>  
> -		/* This interrupt looks like it has to be migrated. */
> +		/*
> +		 * This interrupt looks like it has to be migrated,
> +		 * make sure it is kept alive while locks are dropped.
> +		 */
> +		vgic_get_irq_ref(irq);
>  
>  		raw_spin_unlock(&irq->irq_lock);
>  		raw_spin_unlock(&vgic_cpu->ap_list_lock);
> @@ -836,6 +841,8 @@ static void vgic_prune_ap_list(struct kvm_vcpu *vcpu)
>  		raw_spin_unlock(&vcpuB->arch.vgic_cpu.ap_list_lock);
>  		raw_spin_unlock(&vcpuA->arch.vgic_cpu.ap_list_lock);
>  
> +		deleted_lpis |= vgic_put_irq_norelease(vcpu->kvm, irq);
> +
>  		if (target_vcpu_needs_kick) {
>  			kvm_make_request(KVM_REQ_IRQ_PENDING, target_vcpu);
>  			kvm_vcpu_kick(target_vcpu);
> 
> Could you please give it a go with whatever reproducer you have?

I confirmed your diff fixes the issue. Could you submit this 
patch? Feel free to add Tested-by: Hyunwoo Kim <imv4bel@gmail.com>


Best regards,
Hyunwoo Kim

