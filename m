Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C63C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 10:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJ5yxwzSd18ze9t6hVLldU0j6KOkUmoNge4T8HYqBS0=; b=nl7sEk48xNaxRtc9gRgSKfkcEz
	htxc9ltXKDNhsE115stkVjhj93s5plMKENKAzMotww4AMQDZm3Cau4k8BW2pJAXJ4LuS150Dh9wfw
	HjpiaEGNFK0as/mp/BFFtoxTGM93JGv2fNYplv1+gtjjWbgeeKh7XkQXyhdcXFqPB1VSrb+TgY9ad
	mDLyGrjfVa2a0iut9wL3vOGOzwxIXaaqoMMe7FEX+zVb5gmYm5TgeA4JsW5ijlTUUq2PxeVEA1W+O
	JLcKn3pmCQH4kuju5HpU6Q5iVWPBZR6BP7vLTkWNOgbOtDKt1y2p5yNzDLDW92m+BcKVPkIV7aY9m
	eTMzCAeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBA7w-00000003ksE-1H7A;
	Sat, 03 May 2025 10:29:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB9nK-00000003jBn-3jNE;
	Sat, 03 May 2025 10:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dJ5yxwzSd18ze9t6hVLldU0j6KOkUmoNge4T8HYqBS0=; b=GOB+MR3VxfN1j7WarrQhI/6dmH
	vRfudx8ixVXXLahZ5Vh8j/YV+rz0bN0tn9bTArcTr1NsyR+0jGLwlNt8EYztmc0IUq0DpZL7Pe46D
	mCGzoxK2teuDvnXJsCVUEUXwYXDC3wAee2RqoeN+fsJd+RzTI+mQwxdDIvggeLZlaiKAWFLqPRq0S
	IuswIIPXKlfbEagBmwO0i3IGgARDudkxbUIeLTk+oovsy5LYtPuksQ4IQ+OneWlj/q6IJCz1xOC8h
	XittOBymb3zchZdOthguklAKCk9nDEM6I2jsYEv83el4962flzGypwFgOz5frjIaNshHKTwaMi6+8
	KWo6/NdQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB9nB-00000002xfU-2zcZ;
	Sat, 03 May 2025 10:08:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 09B7630114C; Sat,  3 May 2025 12:08:21 +0200 (CEST)
Date: Sat, 3 May 2025 12:08:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Boqun Feng <boqun.feng@gmail.com>, Borislav Petkov <bp@alien8.de>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Potapenko <glider@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Andre Przywara <andre.przywara@arm.com>, x86@kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>, kvm-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>, Ingo Molnar <mingo@redhat.com>,
	Jing Zhang <jingzhangos@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Sebastian Ott <sebott@redhat.com>, Shusen Li <lishusen2@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v4 5/5] x86: KVM: SEV: implement kvm_lock_all_vcpus and
 use it
Message-ID: <20250503100820.GF4198@noisy.programming.kicks-ass.net>
References: <20250430203013.366479-1-mlevitsk@redhat.com>
 <20250430203013.366479-6-mlevitsk@redhat.com>
 <aBUxqZ6qgfYZLsye@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBUxqZ6qgfYZLsye@google.com>
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

On Fri, May 02, 2025 at 01:57:13PM -0700, Sean Christopherson wrote:

> int kvm_lock_all_vcpus(struct kvm *kvm)
> {
> 	struct kvm_vcpu *vcpu;
> 	unsigned long i, j;
> 	int r;
> 
> 	lockdep_assert_held(&kvm->lock);

So I agree that having this assertion here is probably good from a
read-code pov, however, strictly speaking, it is redundant in that:

> 	kvm_for_each_vcpu(i, vcpu, kvm) {
> 		r = mutex_lock_killable_nest_lock(&vcpu->mutex, &kvm->lock);

will implicitly assert kvm->lock is held. If you try to use an unheld
lock as nest lock, it will complain loudly :-)

(my inner pendant had to reply, ignore at will :-)

> 		if (r)
> 			goto out_unlock;
> 	}
> 	return 0;
> 
> out_unlock:
> 	kvm_for_each_vcpu(j, vcpu, kvm) {
> 		if (i == j)
> 			break;
> 		mutex_unlock(&vcpu->mutex);
> 	}
> 	return r;
> }
> EXPORT_SYMBOL_GPL(kvm_lock_all_vcpus);

