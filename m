Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27C4C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 07:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akKizh4ZGxdpLf1b/hrYXdPrQ7KO6CR6fVuYsqSOts0=; b=EMlh+ciPUdIem1z44y3IjupfwZ
	Co9iSNIcEZrL0UhDa7gVS7Q7fuMMoCoSATVnjuzyt6tou8iCYaXw9DySuLEwygoVI1mo9AEH4sc4Y
	pAT008lbsanzUqsVeAM06dOKgNsJ4eZJ//6Zniw3ZIhrgEcTtuYnHlOSJnjL2XctKgsmPOrZXka5b
	Dc4BnkrPH8J+zKYwJWgyTKxpdZF630h+tjkET1Y6HF776N1xEBgaBx2cF6ycQK3FKeSPp4rpbtuHm
	hpf3oTWQq8Vy9h51Mlbhm6eEVl3kG9cDJ590yBg0r9dk/pMalCZq8wAuQa1iIgQ8ykOUBeRlaDFGr
	nw1OgJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76pQ-0000000Ao7x-3PgV;
	Thu, 17 Sep 2026 07:46:44 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76pN-0000000Ao7G-3fsN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 07:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789631202; x=1821167202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ffn4Z8w2vbV/yjMAVjCF39Xnvzt5sDQWpk/k1VIoL50=;
  b=itDFOEUpgmM3u5NgIifYWSHVt84v0dWpkkM3bFHA+HwOfjpAIb5jb+6l
   Ie9g6/u6dv0EeuUZsrf4EYJLJ9XX7GqelBNs9jNHr1lvsgvZOagoinr7t
   RfDtpqx+SVYwRrXTK56g+pVXQaQ4c3FFbfasEXj9+Ea4Y2ZLy5TIvpn+N
   xq60bz0kS35pQQL3HYjoVq2X7yGvKj42gt81hOBULyHuFjHJh34aU3R5h
   2Los3lrLeKJarYrvGDVC65i9tNGnTcQwyn2BEy9eabtqJmyQY+IJXvycK
   BqWTQcR2nJnL6Ql9+Zdc3CeNZmx/iw6tRwlzPOl92PPrS0yN/Ul0dVepN
   w==;
X-CSE-ConnectionGUID: BGFETOvOT5+fSZz91O8K6w==
X-CSE-MsgGUID: Vw8sM6E6TLin7DumlYzqhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="255378995"
X-IronPort-AV: E=Sophos;i="6.27,103,1786978800"; 
   d="scan'208";a="255378995"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 16:46:39 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5C091474
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 07:46:39 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 019651C0010C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 07:46:39 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 400491800B10;
	Thu, 17 Sep 2026 07:46:32 +0000 (UTC)
Date: Thu, 17 Sep 2026 16:46:30 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v3 0/2] KVM: arm64: ptdump: Shadow ptdump fixes
Message-ID: <aqua1jotej32hxLP@sm-arm-grace07>
References: <20260916230337.4162485-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916230337.4162485-1-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_004642_199238_09C43CAB 
X-CRM114-Status: GOOD (  22.40  )
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

Hi Wei-Lin,

On Thu, Sep 17, 2026 at 12:03:35AM +0100, Wei-Lin Chang wrote:
> Hi,
> 
> This is v3 of fixing the sleep-in-atomic problem of the shadow ptdump.
> The approach taken this time is simply creating a file for each nested
> mmu.
> 
> The ptdump files are created alongside the nested mmus in
> kvm_vcpu_init_nested(), in a sleepable context, and removed when the VM
> is destroyed (kvm_destroy_vm_debugfs(), before the nested mmus are freed
> in kvm_destroy_nested()). This allows us to store the kvm_s2_mmu pointers
> in the ptdump code, after Marc's nested mmu lifecycle fixes [1].
> 
> For the shadow ptdump, for valid nested mmus the first line will show
> the nested context's VTTBR and VTCR values, and whether s2 is enabled or
> not. The ptdump then follows.
> 
> The first patch fixes mmu->pgt accesses after the VM MMU teardown in
> ptdump.c, the second patch switches from per nested context ptdumps to
> per nested mmu ptdumps.
> 
> Tested with CONFIG_PROVE_LOCKING, CONFIG_DEBUG_ATOMIC_SLEEP, and
> CONFIG_KASAN.
> 
> Series based on kvmarm/fixes.
> 
> * Changes from v2 [2]:
> 
>   - Changed from creating a file that contains all nested mmus to
>     creating one file for each nested mmu.

I've booted your kernel built only CONFIG_DEBUG_ATOMIC_SLEEP enabled
mentioned above kernel configs; on Grace CPUs shadow_stage2 test did 
not trigger the sleep in atomic message.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

Thanks,
Itaru.

> 
> Thanks!
> 
> [1]: https://lore.kernel.org/kvmarm/20260911162203.1919330-1-maz@kernel.org/
> [2]: https://lore.kernel.org/kvmarm/20260630121005.1130996-1-weilin.chang@arm.com/
> 
> Wei-Lin Chang (2):
>   KVM: arm64: ptdump: Check the page tables aren't freed when accessing
>   KVM: arm64: ptdump: Fix shadow ptdump sleep-in-atomic-context problem
> 
>  arch/arm64/include/asm/kvm_host.h |  4 --
>  arch/arm64/include/asm/kvm_mmu.h  |  6 +--
>  arch/arm64/kvm/nested.c           |  9 ++--
>  arch/arm64/kvm/ptdump.c           | 75 ++++++++++++++++++++-----------
>  4 files changed, 54 insertions(+), 40 deletions(-)
> 
> -- 
> 2.43.0
> 

