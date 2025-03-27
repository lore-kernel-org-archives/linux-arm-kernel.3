Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06E5C3600E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 04:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbHOE3LAzwUNXQohBY3f+MJtijH6oB+n40/Np3jImiY=; b=frzlp4mxnG0A+bSttrpsjN2ttq
	FikBxXHsIVqlyi91Y22Ct2ifYWCHDUIBdkLkv2R1VxTC6GMhxZQDMmtdG+gsh4cIITjEtg7Gjkj7N
	rp2Pw2vC2IsCEoaFVfdZnEU4hbjBhDevyK3FPJ1C6C6Cq0Rdfl0BMeei8rUbqiijJWzEVByw2TGQD
	mzvGPKKRhc1f/YHVLZDaUnbf1NegeWAjeDU69o+YvaZiRUtYq6EdLj2K0DQK5/DB0tBcnilbx0woQ
	iDVbrxC6Tqjg9PDaRT9YAz0YAn85TvCTcdTvV4hyv1sgVv9yb5F4ncPRYhyeWmAYs1oER2S/HDqTW
	VRPT7hBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txf11-0000000A9sO-1SiP;
	Thu, 27 Mar 2025 04:38:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqr-0000000A4Gy-0MIv;
	Thu, 27 Mar 2025 03:24:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C66C6116B;
	Thu, 27 Mar 2025 03:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE74C4CEDD;
	Thu, 27 Mar 2025 03:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045856;
	bh=pfieFhDpfQvLevcNm0LMhPf+5kEs/vR8/60fuGlDo/s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UQJgvNz2l0z8fqtCdNnyUvqSjVoXL9wFCHHbvvPzybzC9+Gmf923AguCn+7ATs1dB
	 /l2CeBHujWK+xvCJN0M2aMdsKhViozJInjMMHMHuTHdemgu0HYqp/81iWGeZDsLvzd
	 rbyEySOqo0DaqGftGgf/4lE5qQCtgsvJfySatQPTo3xdKaI0+H3NF/GPTdd12tdB4i
	 IkHxpZ5h25C8oY/cPYvhAaPf+y26NAdF9cjddpEqLLo0nWxloMQ5npTdW/W8dkCepw
	 Jeb7lHih+Mj6k6AsS5KBshhrXBx4thVfrpsR6pUdWrEOLVPz8IvjinOfuk6M3fNFAf
	 cIwI8TWsAgfcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFB4380AAFD;
	Thu, 27 Mar 2025 03:24:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/7] KVM: x86: nVMX IRQ fix and VM teardown cleanups
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304589224.1549280.1623157194395422949.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:52 +0000
References: <20250224235542.2562848-1-seanjc@google.com>
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-riscv@lists.infradead.org, maz@kernel.org, oliver.upton@linux.dev,
 zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org,
 maddy@linux.ibm.com, anup@brainfault.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, borntraeger@linux.ibm.com,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, pbonzini@redhat.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aaronlewis@google.com, jmattson@google.com,
 yan.y.zhao@intel.com, rick.p.edgecombe@intel.com, kai.huang@intel.com,
 isaku.yamahata@intel.com
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

Hello:

This series was applied to riscv/linux.git (for-next)
by Paolo Bonzini <pbonzini@redhat.com>:

On Mon, 24 Feb 2025 15:55:35 -0800 you wrote:
> This was _supposed_ to be a tiny one-off patch to fix a nVMX bug where KVM
> fails to detect that, after nested VM-Exit, L1 has a pending IRQ (or NMI).
> But because x86's nested teardown flows are garbage (KVM simply forces a
> nested VM-Exit to put the vCPU back into L1), that simple fix snowballed.
> 
> The immediate issue is that checking for a pending interrupt accesses the
> legacy PIC, and x86's kvm_arch_destroy_vm() currently frees the PIC before
> destroying vCPUs, i.e. checking for IRQs during the forced nested VM-Exit
> results in a NULL pointer deref (or use-after-free if KVM didn't nullify
> the PIC pointer).  That's patch 1.
> 
> [...]

Here is the summary with links:
  - [1/7] KVM: x86: Free vCPUs before freeing VM state
    https://git.kernel.org/riscv/c/17bcd7144263
  - [2/7] KVM: nVMX: Process events on nested VM-Exit if injectable IRQ or NMI is pending
    https://git.kernel.org/riscv/c/982caaa11504
  - [3/7] KVM: Assert that a destroyed/freed vCPU is no longer visible
    (no matching commit)
  - [4/7] KVM: x86: Don't load/put vCPU when unloading its MMU during teardown
    (no matching commit)
  - [5/7] KVM: x86: Unload MMUs during vCPU destruction, not before
    (no matching commit)
  - [6/7] KVM: x86: Fold guts of kvm_arch_sync_events() into kvm_arch_pre_destroy_vm()
    (no matching commit)
  - [7/7] KVM: Drop kvm_arch_sync_events() now that all implementations are nops
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



