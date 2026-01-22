Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3C1D6CFA2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OByRIeYYG37nH3SEyJpXyw1KL+b7G9FbWCFF7m5McMg=; b=jFAB+hUffBs4tjs03MK3wY7EQC
	wHEgKFCv7xkq6R1QINfRho3h46olq5lWNCveHQjWAeILnoMSyXMDeNQW27l1RFIa051bmGdq8/3hI
	GImdflEM0xvY6B5sMhStnn/CrStlFQ5EEtBJ5nfOgUlDeeUPLwak4gDk6k2YWf9VxQGSGbH1D17XV
	sT2RkEaMIVGw7Rubhh3a4uHPksGM1KTCM92Uoi/a0sgIKIrOHEQn9JgYRJk/GpzfyuGXnNT/ZQYEx
	uhgese+DQA5YfvYJcS5wNELaJmD4rhv8T3vWiYuznias+ls7uWEGYiKTlA0UfYgaL8QWPmTXvwVZG
	dJpZGqZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viziH-00000007etG-1OZe;
	Thu, 22 Jan 2026 18:47:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viziF-00000007esd-3MiF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 18:47:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B441160053;
	Thu, 22 Jan 2026 18:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFC0C116C6;
	Thu, 22 Jan 2026 18:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769107642;
	bh=puZkcLq0LJbBc92hUq9q08tH9W7ZSmix0U1xdnYs+V0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Oopj1T3C87F1OYkkk/5BD0ca99ulodCm+Ezbv2lwzIfZcowo3h/CJJ0q0QidAVZoF
	 Bf9+oZMr8wPnKv+D1oedhwr03xBH2o2ZfAbV2qNAdXA5GVXIKxX6QGx5wE4LVt6Abm
	 9vr0IIGCmDkRvRCBoNLmve3e5ezH+x9ECFZEyrzLEiTakr/4wVNOxgcwsHfk+iR9TG
	 Pm1YBaMFd82xZvRFpRluuvy1Ecv1Gkw3QI9lf2rTFbtohxiMzfX3EGjR05bo/mbpDk
	 HGa6HnzEkZ837z6ETr/vpqCLC3W9hg+eor5l2Dp3conaZmwspMkZNMpG+8A6SLAAmr
	 IM2dAF1bynjRA==
From: Thomas Gleixner <tglx@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Ankit Soni <Ankit.Soni@amd.com>,
 Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu
 <baolu.lu@linux.intel.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, Sairaj Kodilkar <sarunkod@amd.com>, Vasant
 Hegde <vasant.hegde@amd.com>, Maxim Levitsky <mlevitsk@redhat.com>, Joao
 Martins <joao.m.martins@oracle.com>, Francesco Lavra
 <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>, Naveen
 Rao <Naveen.Rao@amd.com>, Crystal Wood <crwood@redhat.com>
Subject: Re: possible deadlock due to irq_set_thread_affinity() calling into
 the scheduler (was Re: [PATCH v3 38/62] KVM: SVM: Take and hold
 ir_list_lock across IRTE updates in IOMMU)
In-Reply-To: <5bea843b-dec8-4f15-bb7c-1d0550542034@redhat.com>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-40-seanjc@google.com>
 <njhjud3e6wbdftzr3ziyuh5bhyvc5ndt5qvmg7rlvh5isoop2l@f2uxctws2c7d>
 <42513cb3-3c2e-4aa8-b748-23b6656a5096@redhat.com> <874iovu742.ffs@tglx>
 <87pl7jsrdg.ffs@tglx> <5bea843b-dec8-4f15-bb7c-1d0550542034@redhat.com>
Date: Thu, 22 Jan 2026 19:47:18 +0100
Message-ID: <87sebxtrgp.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, Jan 21 2026 at 19:13, Paolo Bonzini wrote:
> On 1/8/26 22:53, Thomas Gleixner wrote:
>> Are you still claiming that this is a kernel/irq bug?
>
> Not really, I did say I'd like to treat it as a kernel/irq bug...
> but certainly didn't have hopes high enough to "claim" that.
> I do think that it's ugly to have locks that are internal,
> non-leaf and held around callbacks; but people smarter than
> me have thought about it and you can't call it a bug anyway.

Deep core code has a tendency to be ugly. But if it makes your life
easier, then these wakeups can be delayed via an irq_work to be outside
of the lock. That needs some life-time issues to be addressed, but
should be doable.

Thanks,

        tglx

