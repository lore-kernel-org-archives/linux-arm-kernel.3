Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D6EC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMgipE/4nB1yPB2hqAikydF1lygzlHpLyy2FzymIpC0=; b=SvEsbZkx1lr5KwRi9lIGFXMLb0
	HXuhivu7392K5S8j8nGC+9raHxz9y4OggcLFGhK3zlI1UbLPIGvyDOXpfk1zhXUwoAPbybqXl4IQX
	B7euw0Q3Ges/kQ9aO35L2W2Lpm1mgW/4m1Fs056KtArIe9v8vaeOHRYMhrtfmBX9VsF9KWT8Ts0nf
	UdGSe8QBl/O9BNjbZaoD7QFAtNKltEcEh/w2qHvguxp2grgMJPi2gZChtjrGBXipDTYZzYAbJHNY+
	7GeQQ678j1VgBRbX1ZQ5PGaV2rnhaPfnJj2xbiCr77Fb/ggTARLaLTezJHEL42yrbTNDX9xukzf/d
	GySeTcpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27Ua-0000000HOyw-1lLZ;
	Thu, 03 Sep 2026 13:28:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27UX-0000000HOx6-1PBY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 13:28:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 559CE1596;
	Thu,  3 Sep 2026 06:28:26 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4B203F7D8;
	Thu,  3 Sep 2026 06:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788442110; bh=+jGgT7hK4TtDO3DhbLQAW1lvQ0wVzLhxVC4xl/JmQdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQAQFGxlsIdiiIPgPxKshJUIDgxfHsawpgx+YXV51nBSHdspWkkH+n8yWYWo1uwVQ
	 /IOWGMiClJCeeP2I/cej/Hg7orK7DY0FV8m9WW6IddxyOtvlCMl8epntHnudof3KYk
	 rS0Yz3IaIOMVOdAgxSjyzEth+kGeZuGhAzWPQW8Q=
Date: Thu, 3 Sep 2026 14:28:16 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>, Wang Han <wanghan@linux.alibaba.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, oupton@kernel.org, tabba@google.com, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, catalin.marinas@arm.com, will@kernel.org, 
	ljs@kernel.org, itaru.kitayama@fujitsu.com
Subject: Re: [PATCH v5 0/6] KVM: arm64: nv: Implement nested stage-2 reverse
 map (new data structure)
Message-ID: <wsnf276xrun3g4hjr3t6alprapctg5z4kpj422v3hujqdjnrsa@swq4blkqvvj5>
References: <20260810205038.118843-1-weilin.chang@arm.com>
 <20260902163500.1841671-1-wanghan@linux.alibaba.com>
 <877bl26aqg.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877bl26aqg.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_062833_525041_68F650DD 
X-CRM114-Status: GOOD (  19.35  )
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

On Thu, Sep 03, 2026 at 08:43:35AM +0100, Marc Zyngier wrote:
> On Wed, 02 Sep 2026 17:35:00 +0100,
> Wang Han <wanghan@linux.alibaba.com> wrote:
> > 
> > Hi Wei-Lin,
> > 
> > I tested this series on a Yitian 710 system with an ARM Neoverse-N2 CPU
> > (128 CPUs, 2 NUMA nodes).
> > 
> > Test environment
> > ----------------
> > 
> >   L0 kernel: Linux v7.2-rc6
> >   L1 guest: Ubuntu 26.04 LTS, kernel 7.0.0-27-generic (aarch64)
> >   QEMU: 10.2.3
> > 
> > L0 NUMA balancing was enabled (`/proc/sys/kernel/numa_balancing=1`).
> > The host was booted with `kvm_arm.mode=nested`.
> > 
> > This series fixes a functional hang that is exposed when NUMA balancing is
> > enabled.  The previous nested stage-2 unmap path is too slow for this
> > workload, making the performance problem user-visible: NUMA balancing can
> > leave the L1 guest unable to make progress and eventually hang during boot.
> >
> > The L1 was started with 8 vCPUs and 32 GiB of RAM using:
> > 
> >   qemu-system-aarch64 -smp 8 -m 32G \
> >     -machine virt,accel=kvm,gic-version=3,virtualization=on \
> >     -cpu host -nographic -enable-kvm \
> >     -drive if=pflash,format=raw,readonly=on,file=pflash0_bak.img \
> >     -drive if=pflash,format=raw,file=pflash1_bak.img \
> >     -drive file=./ubuntu-vm.qcow2,format=qcow2,if=virtio,cache=none,aio=native \
> >     -nic user,model=virtio-net-pci,hostfwd=tcp::11234-:22 \
> >     -serial mon:stdio
> > 
> 
> Puzzling. If you are only running an L1 in VHE mode, there is no
> shadow S2, and therefore nothing to unmap. For shadow S2s to be built
> and affect the MMU notifiers, you need to run an L2.

I was thinking the same at first, but realized even with L1 in VHE mode
there is a small period of time where L1 runs in its EL1 during boot, so
one nested MMU will become valid for each vCPU. That causes
kvm_nested_s2_unmap() to iterate through the entire IPA space 8 times
(-smp 8).

What I am curious about is whether one single notifier unmap is enough
to hang L1, or were there multiple notifier unmaps.

QEMU with -machine virt uses 40 IPA bits only, unmapping that takes:
1024  (4KB pages,  unmapping 1GB per iteration)
32768 (16KB pages, unmapping 32MB per iteration)
2048  (64KB pages, unmapping 512MB per iteration)
iterations for each page size. There aren't many mappings in each
iteration too. Does this really take that long on real hardware (even if
this must be done 8 times)?

Thanks,
Wei-Lin Chang

> 
> So what are your actual test conditions?
> 
> 	M.
> 
> -- 
> Jazz isn't dead. It just smells funny.

