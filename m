Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E11606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3FRJjfmO;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cWG1PEKB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6+VMZP4/imQFRcxhHNIAtyuoExenFQEkCplGv1ihNMc=; b=3FRJjfmOYVizZfhjzvyjhdkxAf
	AEGcckUOVu9eHJSaYedLQuP8yPIh0ZUNRYH3kHBUWwx9+LUbZwSb3Xkc8vOMZqcSEWhmeTejW7lYj
	wYORh4hW07GNmYfnQCtsE2UAyWF49X5Lj4FpyrTwwXFYlABt2kPDtmDV2qJbumKmxsiAne54LuFRM
	aQdaiNAkPO217A1CnU+Ttq98D4jOyZnBwNpn1zdA+mgL9oy6bzw7ix6vOq3c9tqmGeswX1s31qOg6
	lie5kCqAqBnPGs3s9m2DTtlO6N0gsDFuGgj/rKoy9z6huGZiDBv23lJwrvVpSXV/ryicsg6Z9+6Za
	WHkeN1xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVfd-0000000HWbQ-0E6v;
	Sat, 24 Oct 2026 06:56:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVfb-0000000HWbK-2ETJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 06:55:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB12143D1F;
	Sat, 24 Oct 2026 06:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849EF1F01825;
	Sat, 24 Oct 2026 06:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792824958;
	bh=6+VMZP4/imQFRcxhHNIAtyuoExenFQEkCplGv1ihNMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cWG1PEKBSyP/Azxo7QWRPw7O0At9SIcnBK3p6Ebqohr42LjPoUDMYXSIkuSkIiMrh
	 feqUkXJNYkHqoQYkAtRJBSZK6VKS0PSRet/LOOM65IynGSY2Z7egGmaT3d7mB8KxpF
	 6FioWI4KokejBGS/RMK7Hm3nSgyL48YI2q9dG5xPqln+rkVk6HM0ow5cBn85lDmOHa
	 U0s98dmuTcGS4Hm7uSpFG9lSzOCoV5Ke46g466114qOX32mAwnpGwhAzCbYMqpaJUX
	 esiVY6142btfJ+pdnDPBUd27FzKqA/jhKEU3OuRNsp8zEvF5r95JYT6V4GTPum4udX
	 TEADT+I1GCSDw==
Date: Fri, 23 Oct 2026 23:55:57 -0700
From: Oliver Upton <oupton@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] KVM: arm64: Preserve level IRQ re-pending
Message-ID: <atxWfRsNNK8vdeSr@kernel.org>
References: <20261022064628.4206-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022064628.4206-1-kmehltretter@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 08:46:25AM +0200, Karl Mehltretter wrote:
> A guest can set a level interrupt pending again while handling it. The
> GIC records Active and Pending and delivers the interrupt after
> deactivation. KVM instead drops the second pending state for both the
> GICv2 and GICv3 backends.
> 
> The VGIC keeps software pending state outside the LR because commit
> 67b5b673ad4d stopped placing Pending and Active together for level
> interrupts. When the LR is folded, KVM cannot distinguish the pending
> state used to populate the LR from a later ISPENDR write. This series
> records the later write and preserves it across deactivation. The last
> patch adds a two-vCPU GICv3 selftest.
> 
> The awkward case, and the reason for the RFC, is a write from another
> vCPU while the interrupt remains in an LR. KVM cannot know whether the
> write preceded or followed the guest ack. This series preserves the
> write. A pre-ack write can therefore cause one extra delivery, while a
> post-ack write is no longer lost.
> 
> The exact alternative is to stop and synchronize the target vCPU
> before applying such a write, as the active-state accessors do. Is the
> conservative replay acceptable here, or should ISPENDR pay that
> synchronization cost?

Yes, just kick the target vCPU out and sync the LRs back into the VGIC
state. That's consistent with the approach we're taking everywhere else
where this sort of issue arises.

If we're lucky the vCPU is just poking at its own redistributor and the
synchronization is free.

> The issue was reproduced with Zephyr, NuttX and RT-Thread guests. On a
> Raspberry Pi 400 host with a GIC-400, each GICv2 guest handled the SPI
> once before the fix and twice afterwards.

Have you configured these guests in such a way to reproduce the issue?
What exactly are they doing that is susceptible to this issue?

Thanks,
Oliver

