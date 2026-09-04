Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB919C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNWxGUtV2EU2Wd5p5baspv/bibNFUU+yh0RSzTXOsN0=; b=LKUBeAdtA3b1cPz0mA6pUwNy4Y
	/zF2k3W14P9yMcP38nFx+zYIjcY/GX0u+AN+mzi4iaQsvEGD9mAO/FBY3xOkXgRb7pdgeV+nKXNM0
	PvzGw2tP+30jTRw6vf7ARIxpC+/f5ZUrvSGrwyk4q34eGsfkXnPd7IgILjPYCbJvPxCMopzV752gb
	MyzU9aHx8VpVHMGMxbwdTzxHUHh3GeWc8i0vk3LY47MGZ6KMHiHTvLoXq9wPrsAeUtVuOBLLtIrte
	pKpQdy0XG/HysnoG7co/P3mAOHXfiGthyPQnePeXVxRtLwHSW/5NogKJ5dyGo2wZD+OcS/etZIjKG
	D+z8YquA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ccE-00000003QYQ-2zpi;
	Fri, 04 Sep 2026 22:42:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cc9-00000003QXO-46e0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 22:42:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3949D1477;
	Fri,  4 Sep 2026 15:42:23 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4CA93F882;
	Fri,  4 Sep 2026 15:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788561746; bh=rR1eH2wW2i/JEuOr8EFz618T5pL01rNqEvXg57Ahkls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LObNHE3LPAhzFKAFLLp09Rc2itWYjVcwjba/VQpDr9oz4nvxxpmGHlFnomJvxVurG
	 K2Jx2j1ulInTavrbMF53oQknXko3+98UCJgoWLgYYhqcUS1XzJT+e0yatbcdUuxM8Y
	 IaG6AEBKANyf3Idd2ER+sbkEevrYTNw4ht27eE1U=
Date: Fri, 4 Sep 2026 23:42:15 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Wang Han <wanghan@linux.alibaba.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	oupton@kernel.org, tabba@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, will@kernel.org, ljs@kernel.org, 
	itaru.kitayama@fujitsu.com
Subject: Re: [PATCH v5 0/6] KVM: arm64: nv: Implement nested stage-2 reverse
 map (new data structure)
Message-ID: <eylfcgxs2xzu57czyuhkpmum45lpxyccyu2yh3mipr67aq3xo6@xinygxzavoja>
References: <20260810205038.118843-1-weilin.chang@arm.com>
 <20260902163500.1841671-1-wanghan@linux.alibaba.com>
 <877bl26aqg.wl-maz@kernel.org>
 <wsnf276xrun3g4hjr3t6alprapctg5z4kpj422v3hujqdjnrsa@swq4blkqvvj5>
 <875x0l5udh.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875x0l5udh.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_154230_285006_F40E4B9E 
X-CRM114-Status: GOOD (  25.75  )
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

On Fri, Sep 04, 2026 at 08:49:14AM +0100, Marc Zyngier wrote:

[...]

> > > >
> > > > The L1 was started with 8 vCPUs and 32 GiB of RAM using:
> > > > 
> > > >   qemu-system-aarch64 -smp 8 -m 32G \
> > > >     -machine virt,accel=kvm,gic-version=3,virtualization=on \
> > > >     -cpu host -nographic -enable-kvm \
> > > >     -drive if=pflash,format=raw,readonly=on,file=pflash0_bak.img \
> > > >     -drive if=pflash,format=raw,file=pflash1_bak.img \
> > > >     -drive file=./ubuntu-vm.qcow2,format=qcow2,if=virtio,cache=none,aio=native \
> > > >     -nic user,model=virtio-net-pci,hostfwd=tcp::11234-:22 \
> > > >     -serial mon:stdio
> > > > 
> > > 
> > > Puzzling. If you are only running an L1 in VHE mode, there is no
> > > shadow S2, and therefore nothing to unmap. For shadow S2s to be built
> > > and affect the MMU notifiers, you need to run an L2.
> > 
> > I was thinking the same at first, but realized even with L1 in VHE mode
> > there is a small period of time where L1 runs in its EL1 during boot, so
> > one nested MMU will become valid for each vCPU. That causes
> > kvm_nested_s2_unmap() to iterate through the entire IPA space 8 times
> > (-smp 8).
> 
> It should be one nested MMU for the whole VM, not one per vcpu.
> That's assuming they share the same VMID+VTCR.
> 
> > What I am curious about is whether one single notifier unmap is enough
> > to hang L1, or were there multiple notifier unmaps.
> > 
> > QEMU with -machine virt uses 40 IPA bits only, unmapping that takes:
> > 1024  (4KB pages,  unmapping 1GB per iteration)
> > 32768 (16KB pages, unmapping 32MB per iteration)
> > 2048  (64KB pages, unmapping 512MB per iteration)
> > iterations for each page size. There aren't many mappings in each
> > iteration too. Does this really take that long on real hardware (even if
> > this must be done 8 times)?
> 
> This should be close to being at zero cost, so something else is
> amiss.
> 

Guess what? I am completely wrong once again.

The complete range of the nested mmus isn't about the value
supplied by KVM_VM_TYPE_ARM_IPA_SIZE. Instead it is the PARange exposed
to the guest. That's because the guest hypervisor is allowed to expose
whatever memory map it likes to its nested guests, as long as it is
within the guest's PARange. This is explained clearly in
init_nested_s2_mmu().

Now the PARange exposed to guests should be much larger than 40bits. On
the neoverse-n2 it should be 48bits (256TB), therefore the iterations
required for each unmapping would be 256x:

262144  (4KB pages,  unmapping 1GB per iteration)
8388608 (16KB pages, unmapping 32MB per iteration)
524288  (64KB pages, unmapping 512MB per iteration)

I think these numbers match the hang time Shuai have shown.

Just to demonstrate the difference I have tried manually limiting
kvm_ipa_limit to 40, and tested with software emulation. Before the
manual change a kvm_nested_s2_unmap() finished after 42 seconds, after
limiting kvm_ipa_limit kvm_nested_s2_unmap() can finish in less than a
second.

With this, I think there aren't other underlying issues, it just is that
slow unfortunately..

Thanks,
Wei-Lin Chang

> Could you please have a look?
> 
> 	M.
> 
> -- 
> Jazz isn't dead. It just smells funny.

