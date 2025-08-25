Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B1DC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 22:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYwi+0oKLYDyDskrsw+31gFX40pKxXE2Q84qmgPR+V8=; b=AxDIhhJw1FKUEyTg9jTMM0Mad4
	FPQ8vLuuj4BhQxbggBHso+ZiTZx2bUcp4y2izS8N0HzeAN2MrsS3WFxb3yDPEwx+aTDNXK+OUWefz
	/ZH4uPFWTFR43BSIZbbBfzxF8TYKWfglQl36SUUz9sfabp8O/iJWDXOH5X2D0E/cLygVDSroqxSce
	YPPPzUkZB7wxtSc+zcRBubk44NUDxCWC7K037S1fvNVLJUBZ5PZ2y0FCo8z56985DDBBFMMCwPCAI
	EtfGZd4qoDRj3A78UAc1wSRlZu75r6k695zdfc081/d05MNA2bKBT1v4DlW6i72SKajJsxYpqam2Z
	IlMzvWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqfhs-00000009xz3-3MT6;
	Mon, 25 Aug 2025 22:30:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqfeD-00000009x1h-2cGA;
	Mon, 25 Aug 2025 22:26:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B63F940704;
	Mon, 25 Aug 2025 22:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FEDC4CEED;
	Mon, 25 Aug 2025 22:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756160800;
	bh=GoT/IDAj0/zl52GctB7u4AkgxxaowB1GBSt3qSkJ1E4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NWhRXs6Cbt9IBasNjzbrSoMfcGqD7tsG+V408f534nn6Bx+XQJj85bVx7NsFSy+yU
	 TmOztuBY/wqLhaH+5EZk96/TwXUXIkZZXJhymLz/XqCycTtAp21dM7xDlt7u77Efi9
	 i650eYZ5SRgcoXWnDHonuVKfPSVk7N9gIJBPt4VR0KeDj/UrZnQxBpWGz/KEXpMEC5
	 KC+SFUbdvyPM/aYHhQlv8UHOZRNBZQnoYRbhwKGap+ReS6crF/1t/uenNLY9qNSDYf
	 irJDfpr3g/Zb1UeuMJWMPgi888bpBrHyT/dBPpbUsGxoLlDL0YFx55ub3z9UObaIVS
	 hCBvdVm4TTUeA==
Date: Mon, 25 Aug 2025 22:26:38 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
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
Message-ID: <aKzjHjtI2fbFjBpe@liuwe-devbox-ubuntu-v2.tail21d00.ts.net>
References: <20250825200622.3759571-1-seanjc@google.com>
 <20250825222319.GO3419281@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825222319.GO3419281@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_152641_690165_879B5A26 
X-CRM114-Status: GOOD (  15.40  )
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

On Tue, Aug 26, 2025 at 12:23:19AM +0200, Peter Zijlstra wrote:
> On Mon, Aug 25, 2025 at 01:06:17PM -0700, Sean Christopherson wrote:
> > Fix a bug where MSHV root partitions don't honor NEED_RESCHED_LAZY, and then
> > deduplicate the TIF related MSHV code by turning the "kvm" entry APIs into
> > more generic "virt" APIs (which ideally would have been done when MSHV root
> > support was added).
> > 
> > Assuming all is well, maybe this could go through the tip tree?
> > 
> > The Hyper-V stuff and non-x86 architectures are compile-tested only.
> 
> I suspect there's more of this wreckage in the new VTL driver that
> they just put in:
> 
>   https://lore.kernel.org/all/20250729051436.190703-3-namjain@linux.microsoft.com/
> 
> although ideally they rip that thing out. I don't know how that code can
> ever be correct.

Please give us some time, Peter. I have asked the corresponding team to
respond to your comments.

Wei

