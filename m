Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F03C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 21:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYpJjvMop3p/gly/It61F2813t5+gwnEvzTnI0j75g0=; b=FaymjULgDYZ500r+eueiSBaZI6
	0nko1fF97GWZZ9KqdX+1t7+o5oryGfXGuZpxX8Wv3QUh84XiF9gGeeom5lO8syytUOBbseVSNdQ7L
	IjqP7i7kSaSfX6d/LWYKRmzAh3v1y0nsXFnJVC1p8/ntsE4IDszbkeLeuOmD50hOXsHrOdk70Mzx+
	/mjf5oHqJ98w65tYaMj5G50uVSDGYZL3uZSqs1gSjKMch5MYhzog52UuCXLQM/Q7VZcqKXX4bL5us
	GKacweB+fcIBTCR7hTWyXWbHzV+YXidjXnBRMY1EZVPLBuWxs3DZqCefOCwfS+etSQBEMOHSeXR+a
	LAtvxzvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXSG-0000000CtcA-0hDZ;
	Mon, 10 Aug 2026 21:22:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXSE-0000000CtbW-1IEN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 21:22:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4954aff6088so20733635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786396960; x=1787001760; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xYpJjvMop3p/gly/It61F2813t5+gwnEvzTnI0j75g0=;
        b=rO9j0ltjA9TryLyVI0kYdIAYBmy7dynoxDGxQidN4tCuJ1RX9lvyy+AANrpTnvOd6w
         zeFAZrd0cf75eAsgdKS8QPEzNPsN+gLUHQfQzRlKDInqqJFF7t2i58a+r9sycsYQM0Pt
         URpGyKaLBJrPcuYq3EORZqBMc/uX2yjbXYt1QI2OxeR3/tZ7zpnl5laZH9MoMu46juJZ
         TFeXA39tzM98Wwf3pAdWwLAbwuNGH5eEFPxoIqpYj8yF87hAwZEHfo8PIYvJxxW5pbhr
         Rvj17kDyCsL9AA5mdK/hFPqV+NURIuyuWf+6HSACkPM0EsstSC+834PQSf1efKIJLGtd
         dt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786396960; x=1787001760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xYpJjvMop3p/gly/It61F2813t5+gwnEvzTnI0j75g0=;
        b=MCZcKiKsN6OtoIPcKm9Hi2nSjER7x+or8A04cyoEe/+Yu8ssO7GINJNjm+Fk0Tdp8J
         BDsz7YBhrwcYOw+5/9w7RQgu54YrLOKaj1e0NKV08GuWSyvB3qqgu898wHmObFLAnsXk
         Y4EieXDc7OlXpIvg6/XpkmiJ2JMftRBQORY3LjX56yc+93v74cWvALkP7+RHb5m54Iz7
         dz81kXTjQt4BuwKZ8Gwvzkj1A4ZTtb12AHwzBnILnubAlN6fOOB2xha8iYUkEgqBI0PI
         SA1/jIj13+f9e5FGfO6twH84jijc3KdtN6SdRzV1O/DKI9ULPY3GeLqNWBHopExXpt0t
         7tvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0JfI1OBcPDanH0i998h5gqqhKWiOAWfFaSEIutoRAjBUyrwuL50bLYDF0s6Go0B5gD5dxld4S7YLCaLi2LzpP@lists.infradead.org
X-Gm-Message-State: AOJu0YzBKL7NFb6SykHOs4zi7gt4PYMK/jEfjXAHIXCvEmIWlJSVFGS4
	G+940Pw9rHV4sWG3XiLM/Lk7rS1pxtjaUrsfDvRQkbgVXO9jj9ng73Uv
X-Gm-Gg: AR+sD11iQZSPQB3U9N74u8T639D0VKUqsOiXmciUqEL0VfKSXOg1JLmH4j6dCrZvdEL
	GuykfGc22HhsmG21IQbvhchYRMhBDO5LWjwkYuR5jFdsI14KSzOFci+9PjaAMCr/MlaBei5wm0X
	OLM3sutkJyYR0E7xaN55SkPNO2a+KG+TE4mxSudOpr70LqZx8IN+W60YOhFaHGajeBFJ4Oxa2hM
	w8VOPSN5Lo6hHh7XaPrj1DYwoEQKUuYOgeCFsbX6UzYia5qs0nEHXkC//eAKt6YeUmpXbQjBcVV
	CZCsIOUAHzSAVxtttF38yXnCRnFIIDcKfASukcp1t9hPJh5U0mh9rQPEWcHMxywEeKnB+BDoiSs
	KKmfOSdZ5ed1FoWvt4xNfORtE8o/V+8mOlAZ1JCrDnDEMEmtJaOLOuFiuZfm58GLWzHeW07BFYu
	B/5wZ28Orx6rhGTM4WZD81PkVMfDPCaLAGiav8GmK70u0ogrpEySA09mk29JJngHn+tTEJnNUMk
	N2ItADp+3R00BPxxhyn41Lt+iZmnaWkqRdD4+sgybC8AY4qmWd/IDNVzyARaXXLhee7HtLaAWWk
	KNZYdalQHtMSh2015gwk5veSg/iRJDKGEBsA7v0ncSDGHmEDt1cdL55NtPpL9h7zhBNuW8M=
X-Received: by 2002:a05:600c:3585:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-49972740d07mr52058455e9.2.1786396959461;
        Mon, 10 Aug 2026 14:22:39 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a1e8-7401-316d-6c00-7a9a-8fac.310.pool.telefonica.de. [2a02:3100:a1e8:7401:316d:6c00:7a9a:8fac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499740d2c6fsm18342935e9.9.2026.08.10.14.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:22:39 -0700 (PDT)
Date: Mon, 10 Aug 2026 23:22:37 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Eric Auger <eric.auger@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] KVM: arm64: vgic-v3: Roll back failed
 redistributor region setup
Message-ID: <anotFcOP0kcQJwrA@gmail.com>
References: <cover.1786344511.git.kmehltretter@gmail.com>
 <4e00fc25aa61ec52e6ef033a53588ce3f5550982.1786344511.git.kmehltretter@gmail.com>
 <86tsp2139b.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86tsp2139b.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_142242_380178_0A8E14FE 
X-CRM114-Status: GOOD (  32.62  )
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

On Mon, Aug 10, 2026 at 03:03:44PM +0100, Marc Zyngier wrote:
> 
> > A later REDIST_REGION attribute can be inserted successfully and then
> 
> Later than what?

I meant a REDIST_REGION write after earlier
region writes have already assigned RDs to some vCPUs.

In the selftest (patch 2) 
- region 0 contains RDs for vCPUs 0 and 1
- region 1 contains RD for vCPU 2
- the REDIST_REGION write for region 2 fails while KVM processes vCPU 3

> Holes in the MMIO space are the norm. The IPA space can multi-TB
> large, and there is no reason why it'd cover everything (where would
> you place the RAM otherwise?).
> 
> Is the problem here that you are left with vcpus that seem to have
> been matched to an RD (base_addr being set), but that really are left
> unconnected?

Yes I guess "hole" is the wrong term. The vCPU still has an RD and a
base address, but its iodev has been removed from KVM_MMIO_BUS.
An access to that RD address then causes KVM_RUN to return
to userspace with KVM_EXIT_MMIO.

> 
> > failing vCPU already has its base address and region assigned, but the
> > old i < c rollback does not include it.
> 
> What is "it"?

I meant the current vCPU redistributor iodev.
vgic_register_redist_iodev() sets the vCPU's region and base address
before calling kvm_io_bus_register_dev(). If this call fails for
vCPU c, the rollback in vgic_register_all_redist_iodevs() processes only
vCPUs with indices below c.

> > Preserve devices assigned by earlier successful setters. On failure,
> > unregister only vCPUs associated with the newly inserted region, clear
> > their cached base addresses, and free that region. This also includes the
> > current vCPU when iodev registration itself fails.
> 
> What I don't see here is an argument explaining that doing this
> doesn't change the guest-visible assignment of RDs, which would be a
> regression.

vgic_register_redist_iodev() returns immediately if a vCPU's RD base
address is already set, so its RD region and address don't change.

Regions are filled in index order, a vCPU without an RD address can
use the new region only after older regions are full.

So freeing the new region and clearing the RD state of vCPUs associated
with it restores the state before the failed write.

> Based on what I understand of your earlier description, why isn't this
> as simple as this untested hack:

I ran the selftest (patch 2) with this, still failed with:

  Unexpected MMIO exit at 0x8050008

When redistributor registration for vCPU 3 fails, the for loop does
vCPUs 0 to 3. The issue is that the iodevs for vCPUs 0 to 2 were
registered by earlier successful region writes and should not be
unregistered.

On retry, vgic_register_redist_iodev() sees the set addresses
and does not re-register those iodevs.

> I don't mind the cleaning up, but not as part of fixing the issue,
> which has to be as small as possible (think of the backports).

I reworked the change without a new helper (see below).
Is this closer to what you had in mind?

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 5913a20d83019..d9a28b983ecca 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -841,7 +841,7 @@ void vgic_unregister_redist_iodev(struct kvm_vcpu *vcpu)
 	kvm_io_bus_unregister_dev(vcpu->kvm, KVM_MMIO_BUS, &rd_dev->dev);
 }
 
-static int vgic_register_all_redist_iodevs(struct kvm *kvm)
+static int vgic_register_all_redist_iodevs(struct kvm *kvm, u32 index)
 {
 	struct kvm_vcpu *vcpu;
 	unsigned long c;
@@ -856,12 +856,15 @@ static int vgic_register_all_redist_iodevs(struct kvm *kvm)
 	}
 
 	if (ret) {
-		/* The current c failed, so iterate over the previous ones. */
+		struct vgic_redist_region *rdreg;
 		int i;
 
-		for (i = 0; i < c; i++) {
+		rdreg = vgic_v3_rdist_region_from_index(kvm, index);
+
+		for (i = 0; i <= c; i++) {
 			vcpu = kvm_get_vcpu(kvm, i);
-			vgic_unregister_redist_iodev(vcpu);
+			if (vcpu->arch.vgic_cpu.rdreg == rdreg)
+				vgic_unregister_redist_iodev(vcpu);
 		}
 	}
 
@@ -960,8 +963,10 @@ void vgic_v3_free_redist_region(struct kvm *kvm, struct vgic_redist_region *rdre
 
 	/* Garbage collect the region */
 	kvm_for_each_vcpu(c, vcpu, kvm) {
-		if (vcpu->arch.vgic_cpu.rdreg == rdreg)
+		if (vcpu->arch.vgic_cpu.rdreg == rdreg) {
 			vcpu->arch.vgic_cpu.rdreg = NULL;
+			vcpu->arch.vgic_cpu.rd_iodev.base_addr = VGIC_ADDR_UNDEF;
+		}
 	}
 
 	list_del(&rdreg->list);
@@ -982,7 +987,7 @@ int vgic_v3_set_redist_base(struct kvm *kvm, u32 index, u64 addr, u32 count)
 	 * Register iodevs for each existing VCPU.  Adding more VCPUs
 	 * afterwards will register the iodevs when needed.
 	 */
-	ret = vgic_register_all_redist_iodevs(kvm);
+	ret = vgic_register_all_redist_iodevs(kvm, index);
 	if (ret) {
 		struct vgic_redist_region *rdreg;
 

Thanks,
Karl

