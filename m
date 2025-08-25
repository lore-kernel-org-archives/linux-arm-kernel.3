Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C40CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 22:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQ6ZxU9qPw4vkvXRX5Uv3LAGHE1s7LId4Lk2ftW+5fQ=; b=IVqIKAMScrjwWRLqgdIVv39mMR
	PCuPDDSezXDWKqB18aiooZgGXC9W1/nVLZ1vGGlXzJoX3wAl0XSPJWv4gLs7E2FZ/7OQNUw4qNPXh
	DlJ1L0Cn6Dow85Ewv0fkJUbqnFh9cLWI9hZ9nBdyNN+0RnNuiP8D5yuCnL2TKzAZ4VTqfSqfMN7GB
	MSd8blKLRKQbJ6ukiwKhm0UNwJv90IQ4Sf6KCLsPbsklqVwqTBp9hHuSI1KRmScvxWhS+8/8ArCup
	YFRbI+br49PGpfwTh9ZdIcQTucFhvofcDUxvZY6RBsev0yqSBuSOX/I3PnMQ0qVTn6GQTTy2leiza
	mAaeoZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqff8-00000009xDn-4Ahg;
	Mon, 25 Aug 2025 22:27:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqfb6-00000009wOZ-0sZF;
	Mon, 25 Aug 2025 22:23:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VQ6ZxU9qPw4vkvXRX5Uv3LAGHE1s7LId4Lk2ftW+5fQ=; b=Dl7NKkPggz+LyLx3g8yECmKY46
	frByDzPrm1d7k7r6fUYBr7sJ1/gtI3/xuCZztOdzBTfXHZW5dLTfoeezOIGEPointBsAmd03xk48d
	WlEM/iwO4pRpd/cRbRKw3fHveNo5GXY5PxTUSJ8+GZzhKGoxCHx2gpOCpjkylBAeqT/2dyKgrAimm
	+dCTSl+QYVkt2M0A4NwjYvWM4SBpo+zMRuLXJJRssy7tLZ5SJF8r5hIe+zRkvyqcggHxDm1LnCjKo
	AkoKfXPmuduAgVkKtztmrNNPM5r0DScPdhFhgKU4NzqG9y6QY6PhELbLGykH30oOt1dX2dZTR1OUR
	AnNYWLvA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqfay-000000024iA-1xRz;
	Mon, 25 Aug 2025 22:23:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0C1983002C5; Tue, 26 Aug 2025 00:23:19 +0200 (CEST)
Date: Tue, 26 Aug 2025 00:23:19 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Andy Lutomirski <luto@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, loongarch@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org
Subject: Re: [PATCH 0/5] Drivers: hv: Fix NEED_RESCHED_LAZY and use common
 APIs
Message-ID: <20250825222319.GO3419281@noisy.programming.kicks-ass.net>
References: <20250825200622.3759571-1-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825200622.3759571-1-seanjc@google.com>
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

On Mon, Aug 25, 2025 at 01:06:17PM -0700, Sean Christopherson wrote:
> Fix a bug where MSHV root partitions don't honor NEED_RESCHED_LAZY, and then
> deduplicate the TIF related MSHV code by turning the "kvm" entry APIs into
> more generic "virt" APIs (which ideally would have been done when MSHV root
> support was added).
> 
> Assuming all is well, maybe this could go through the tip tree?
> 
> The Hyper-V stuff and non-x86 architectures are compile-tested only.

I suspect there's more of this wreckage in the new VTL driver that
they just put in:

  https://lore.kernel.org/all/20250729051436.190703-3-namjain@linux.microsoft.com/

although ideally they rip that thing out. I don't know how that code can
ever be correct.

