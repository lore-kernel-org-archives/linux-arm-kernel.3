Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD23C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Srw4rp2gp0iaY947nLv/AFW8jF58tIFsnOOPIzi0dFo=; b=jVYXbBvJGJAga1+oDNWU0vigms
	tqFzpAxWBxBzVeNuQu5nnci+BiCUBJWvtqMPeNpmldW8mrQ0/x7qmqwIex7mxJTz/yu48PkhTOnhL
	7WdwyJD8ihSJFBK2Yv0oNMiNqiSUJauuiFyM4R73XqGFZHKubs24shEk/vd55BfKvnCe5FrlBplLh
	nmYZvVnM3dNFfqqsBuLOX5hNX68ner0xbCJp1tDOzf7FCh5INUq3zK33v+Db4j1js+y2RNoflesTO
	pYNr5BpR3j+zZ3gpCMYgcpIUjCACyO5bng78ic8tHehgXsGs2Gaeznf7FoUUVtZW08ZoS7r+NYA3S
	i85+qwCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SEb-00000001qhZ-41om;
	Fri, 04 Sep 2026 11:37:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SEZ-00000001qgX-0HkV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:37:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6699C153B;
	Fri,  4 Sep 2026 04:37:22 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F1323F7D8;
	Fri,  4 Sep 2026 04:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788521846; bh=m2jJiBlsGUl4iHLP2o7iADnOmSK5Bj/o7he5EW66eco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eiar/h/118H3a26KLPtyaEh01KpT6iuhc/C4MWOEQVSZ71ewPamnAN4Sh8c8NOBT5
	 tf8GjBQDEl+RQyte6ly7DVyLotsZugzcktiZLPkqB4ujHbpMgcQUZ3Z2umKCC/eKYP
	 DNTgvTtQVNGmE01bJbFg1pGSyX2iOOzLE+dDleTM=
Date: Fri, 4 Sep 2026 12:37:17 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Wang Han <wanghan@linux.alibaba.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	oupton@kernel.org, tabba@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, will@kernel.org, ljs@kernel.org, 
	itaru.kitayama@fujitsu.com
Subject: Re: [PATCH v5 0/6] KVM: arm64: nv: Implement nested stage-2 reverse
 map (new data structure)
Message-ID: <nhqjbq4kwx2n7id4eovyhg4htgbh34m57o2vx2swbuxc5lu2pl@xelx6xh2qvq6>
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
X-CRM114-CacheID: sfid-20260904_043727_145259_81A9EB06 
X-CRM114-Status: GOOD (  20.94  )
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

(sigh) Yes, rookie mistake from me as always.

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
> Could you please have a look?

Of course.

Thanks,
Wei-Lin Chang

> 
> 	M.
> 
> -- 
> Jazz isn't dead. It just smells funny.

