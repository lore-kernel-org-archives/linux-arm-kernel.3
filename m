Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FE4D148A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjwIjBUgLAFKKBvp99piZyRXPyLPy4NE1kk/jvEE2wY=; b=pFKY/BkdTXoAGtfX3Cut4wxG9/
	eJ2/SFJe4ebH/DMOVwWSoiliGqsCAl5OsnGwBcdqU7wBf4KfdLf1ExyjLnNFlbTEGG/MtkUmwNcx4
	4vODDYdbn0JWe3s8/Uf1ts+JmfdMYdEYCk+b0tv6iAU4U1Fep1G7fnc6VSIUQhQ4l5wWaKcEXymFL
	ySJYGMkCx/fkKAB5/nVEDZWcNUe09iDytM1xovlnWcyXO9YSrI6XLSl+iJV9CMQxzHIsfnAHvz8eh
	zFaNbJCv/su+kgBgyPN+bJWa1tTshxevA8mQi+KxKbGWBj0gz0K3MWAeRceD7mxIfHloeyyP1m9VJ
	9WGIZAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxx4-00000000vfD-4886;
	Thu, 08 Jan 2026 21:53:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxx2-00000000ved-01rx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:53:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BB2A42D8B;
	Thu,  8 Jan 2026 21:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3DCC116C6;
	Thu,  8 Jan 2026 21:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767909231;
	bh=pES8CNvgEWUrZSrme3hkhLAvBUh0MV/JNCf1LMiME4k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Gsx2osJ7hvB0mpEKQ4fqhnwT2ViurpZNG2S3fBsbAu0UMzSzFsVt9m70Wib8e3q25
	 me4TZhsJ+iRHr+5NwZNtKxHIlTQHQg5EIHLtj0Uv1pz+eRvT8SnYAyGWPl+f33nm6Y
	 tsxhXx1odR9DBjVbB2c4t69tZpVurqUFS3WPray2iRp1laPgIvkRKfmohAUkRsisMS
	 XbQ7J/JIDLf9XYw02DqeAaX2Ax1K7IoxBJHAMViDszRveLaAaN6b94QV7K4OLSzN8D
	 IgKSCK5k/VyIl1XQdhSSW6zWoAtIGx3GuOsoiYb2qtQpmES5fl7jPXiRACs8bEcJGw
	 uK4jglxXRlfDg==
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
In-Reply-To: <874iovu742.ffs@tglx>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-40-seanjc@google.com>
 <njhjud3e6wbdftzr3ziyuh5bhyvc5ndt5qvmg7rlvh5isoop2l@f2uxctws2c7d>
 <42513cb3-3c2e-4aa8-b748-23b6656a5096@redhat.com> <874iovu742.ffs@tglx>
Date: Thu, 08 Jan 2026 22:53:47 +0100
Message-ID: <87pl7jsrdg.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_135352_091265_797D3C0E 
X-CRM114-Status: GOOD (  10.79  )
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

On Thu, Jan 08 2026 at 22:28, Thomas Gleixner wrote:
> On Mon, Dec 22 2025 at 15:09, Paolo Bonzini wrote:
>> Of the three, the most sketchy is (a); notably, __setup_irq() calls
>> wake_up_process outside desc->lock.  Therefore I'd like so much to treat
>> it as a kernel/irq/ bug; and the simplest (perhaps too simple...) fix is
>
> It's not more sketchy than VIRT assuming that it can do what it wants
> under rq->lock. :)

And just for the record, that's not the only place in the irq core which
has that lock chain.

irq_set_affinity_locked()       // invoked with desc::lock held
   if (desc->affinity_notify)
      schedule_work()           // Ends up taking rq::lock

and that's the case since cd7eab44e994 ("genirq: Add IRQ affinity
notifiers"), which was added 15 years ago.

Are you still claiming that this is a kernel/irq bug?

Thanks,

        tglx


