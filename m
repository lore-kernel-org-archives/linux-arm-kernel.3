Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06AAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 23:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WE4k0gwgTAUdZ3znm9Bphq+twxiG2Hgud2fjJc9JwU=; b=mPDz9UbFvVIqub/Q9etIgAsTKH
	kiQrXScfGqEcNsfDnpd547sY6ZMU0mrS6HEj1G/RwekgHgzrIyW106xl1l3Iuxj6ETXk/9bjmK3Hc
	37FtMF1cPYzuIfVna0DpdQiLi3cV2v+yI7ymedx8cqKpW3ga+njBChhbz6f5GN4ZTBUNQVtD0Uf/d
	ZH/f2eAT5DW+2siPAlCm4DHdPJIPwhgJnC/Bn9Tmura7WdfaHS49X6YsH2knd8Hpn8Pzh5vyeKS17
	zaCvO6coBzSIys3MgUug1KR5TpLOZEqI80H/962cwONd+wUfzdpfGC3bwavwtzTGwfQ34jBNQYjUu
	UjoaS/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0q40-0000000D2UX-0hln;
	Fri, 04 Apr 2025 23:03:04 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0q2F-0000000D2I5-1agK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 23:01:16 +0000
Date: Fri, 4 Apr 2025 16:01:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743807670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7WE4k0gwgTAUdZ3znm9Bphq+twxiG2Hgud2fjJc9JwU=;
	b=PyNqoE2/uDWdg8j9a/zZA+hEa6IgIfhZnH++GFAzOCUqkD/3MxaMoGETH/bOrsK4RMj0tZ
	3cuWIXLc2+4QaqYxb/3koglx3rsxd33mzVqIdmCUJ8zXAPn4yta8DhMdtByqfwr7S7d5JV
	82bM8c0zA8FEttfc3VTH8bcwMH6KGUQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	Oliver Upton <oupton@google.com>
Subject: Re: [PATCH 2/2] KVM: selftests: arm64: Explicitly set the page attrs
 to Inner-Shareable
Message-ID: <Z_BksUn4JiPPGc4G@linux.dev>
References: <20250404220659.1312465-1-rananta@google.com>
 <20250404220659.1312465-3-rananta@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404220659.1312465-3-rananta@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_160115_617050_1F089671 
X-CRM114-Status: GOOD (  14.57  )
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

On Fri, Apr 04, 2025 at 10:06:59PM +0000, Raghavendra Rao Ananta wrote:
> Atomic instructions such as 'ldset' over (global) variables in the guest
> is observed to cause an EL1 data abort with FSC 0x35 (IMPLEMENTATION
> DEFINED fault (Unsupported Exclusive or Atomic access)). The observation
> was particularly apparent on Neoverse-N3.
> 
> According to DDI0487L.a C3.2.6 (Single-copy atomic 64-byte load/store),
> it is implementation defined that a data abort with the mentioned FSC
> is reported for the first stage of translation that provides an
> inappropriate memory type. It's likely that the same rule also applies
> to memory attribute mismatch. When the guest loads the memory location of
> the variable that was already cached during the host userspace's copying
> of the ELF into the memory, the core is likely running into a mismatch
> of memory attrs that's checked in stage-1 itself, and thus causing the
> abort in EL1.

Sorry, my index of the ARM ARM was trashed when we were discussing this
before.

DDI0487L.a B2.2.6 describes the exact situation you encountered, where
atomics are only guaranteed to work on Inner/Outer Shareable MT_NORMAL
memory.

What's a bit more explicit for other memory attribute aborts (like the
one you've cited) is whether or not the implementation can generate the
abort solely on the stage-1 attributes vs. the combined stage-1/stage-2
attributes at the end of translation.

Either way, let's correct the citation to point at the right section.

Thanks,
Oliver

