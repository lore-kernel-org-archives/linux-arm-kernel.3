Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F8BC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 06:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ricfNGXl9VSu9JhntIh8Ka7l7KpuN0sprjBCC2XrPfY=; b=GI9WOOZJo+T/j2mNkqII/8RkVA
	34CVFiyuMt41WWW67IzRyANfMigxUSeUhOAWp+ucfQIhYOVXE789iQqhRZ64LEWt49tiRHqsM/qm0
	ucXfdsKXaBBNAhoPFqdp2iJG8MNTqqMy+sO211Y74Gg/tK3lMyRsA21bTe0zqffTjZdSww+QDjjra
	joT2EDCrJeR3y5nN1XxmqVgAsALM/jW1ojJOoilAVcZwMu63LZ8hKv7Cta8oa4GYMoLjaACS/OP5J
	lQjF1/8onk7DsPInpEVP3bp96TVXH+60YyJK0jA2+HS2DLKuaEQ3v61iGh61ZAcGkEkiN1Ai59nL5
	T4+W996A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75y3-0000000AiLx-3359;
	Thu, 17 Sep 2026 06:51:35 +0000
Received: from esa4.hc1455-7.c3s2.iphmx.com ([68.232.139.117])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75y1-0000000AiIY-026n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 06:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789627893; x=1821163893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L4sdGfPRJNvoS+s5nqiUx4BvRY4eQD3g+eBW4eqgX+g=;
  b=UJ7oSqfJkvVdBJ94r47ze8tVmXvmMrQ4CxebPPHFkcSKViIQNaSb7Ayq
   lSaPi3bxr9Gj/ZD/hbyAaiQgg/tQUa3bjQz0rCh3EXc2X4lx6JjGBw2HP
   X5uBaEJIRBJZM9gEmZdbtQgeg1Jnu1t2qBFl4DNN/BSi4+wgbiFHWCwKu
   DxWDWr9elXQnaUZ5xQqS8yLFQNUBkZpSWefZYNmUefVVLH09eGPnaTZU9
   b42rsFBkgcghpmK3XiIGpOq7WPY9KHNjKMuDs5JlSc5iPIp9oYvXWsIvN
   yhpKaBTom04GKnXIDXX8vdew2Fm41E8/tErffkGLqo83PVXaGc6oA8Ftl
   g==;
X-CSE-ConnectionGUID: qMOhPSW5S8O+tr0PR+24TA==
X-CSE-MsgGUID: LWHTWjV/RL+Xib1mteX7HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="254874381"
X-IronPort-AV: E=Sophos;i="6.27,103,1786978800"; 
   d="scan'208";a="254874381"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 15:51:29 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4A06F1C00648
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 06:51:29 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id EE0891001358
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 06:51:28 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id E35BA101E53D;
	Thu, 17 Sep 2026 06:51:22 +0000 (UTC)
Date: Thu, 17 Sep 2026 15:51:19 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Wei-Lin Chang <weilin.chang@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v6 0/7] KVM: arm64: nv: Implement nested stage-2 reverse
 map
Message-ID: <aquN5ytDxt44uORD@sm-arm-grace07>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
 <aqm9hXB6X9IQ8wHz@sm-arm-grace07>
 <m6ldbr7hdafmoycx7xjcbsg62mblcakcu52ndowwzqgxdjb3q3@huv4i5bfxtza>
 <aqnUWp_VJXUCcJnQ@sm-arm-grace07>
 <86ld9165cr.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ld9165cr.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_235133_602635_B0E7799B 
X-CRM114-Status: GOOD (  24.66  )
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

On Wed, Sep 16, 2026 at 08:08:20AM +0100, Marc Zyngier wrote:
> On Wed, 16 Sep 2026 00:27:22 +0100,
> Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
> > 
> > On Wed, Sep 16, 2026 at 12:22:30AM +0100, Wei-Lin Chang wrote:
> > > On Wed, Sep 16, 2026 at 06:49:57AM +0900, Itaru Kitayama wrote:
> > > > On Tue, Sep 15, 2026 at 04:42:58PM +0100, Wei-Lin Chang wrote:
> > > > > Hi,
> > > > > 
> > > > > This is v6 of optimizing the shadow s2 mmu unmapping during MMU
> > > > > notifiers.
> > > > > 
> > > > > This version fixes a few issues, and adds Marc's space optimization
> > > > > for kvm_guest_s2_mapping [1]. Please see the changelog for the details.
> > > > > 
> > > > > Tested by booting L3, and running in-kernel targetted tests described
> > > > > in [2]. v5 got some tested-by's from Itaru and Wang (thanks), I didn't
> > > > > carry them over since some bugs fixed in v6 are non-obvious. Some
> > > > > retest would be much appreciated!
> > > > 
> > > > How did you boot into L3, with KVM selftest or recrusively boot on HW?
> > > 
> > > I just recrusively booted VMs on hardware. :)
> > 
> > Good. Then I actually tried that on Grace CPUs, but letting L1 boot 
> > with nested mode did not print "VHE+NV2" KVM init log in dmesg, thus not
> > able to boot L3. Do I need to add other than kvm.arm-mode=nested to command line?
> 
> kvm-arm.mode=nested, as documented. That also puts in perspective your
> TB tag on the whole series...

Yes. Using kvmtool's --nested option did not bring vCPU with the VHE+NV2 boot
log. The Host kernel is Wei-Lin's version 6 booted on Grace CPUs, and
the guest kernel is today's kvmarm/fixes plus Wei-Lin's shadow stage 2 ptdump fix.

Thanks,
Itaru.

> 
> 	M.
> 
> 
> -- 
> Without deviation from the norm, progress is not possible.

