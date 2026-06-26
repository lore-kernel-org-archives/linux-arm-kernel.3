Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47440CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjqCo4kmauvoUPfN+QEClRvw7Akj97xdCM6sGhDBsz4=; b=M3jZ1WzoZjvDOthDIKrxDi8IHM
	Un07dLPPjnTk4B/bhCdActWR8Pho+/0+QLc5B/VUukHAjyF2B0pm9ODID1H/q6Jxb3P7tJSR/p6EM
	vAmsbpHXyOjh1wEz4lJHRtCuSa/3rSnpEIRSda6CB9TZuq/jzL/pB0dZe6V02MSUderPCXSuI+y//
	lA3pfynL9xyiz5pHgOL4ldYEs1OxwP1SQWNfkDFfc1uDJoEtp01+W2K5AdjfBozeAzRc5wlQKM5Mx
	UOMcZphgU4oGNyEEj8X6PvZXhxtVYD8W0ttnGXBdB4BZ7mG2q97exRsKp7xNTUbm+Of2xU6H7zi5U
	jcnPjkCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd30r-0000000Aztp-1LzZ;
	Fri, 26 Jun 2026 09:38:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd30p-0000000AztA-0Fcu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:38:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD049204C;
	Fri, 26 Jun 2026 02:38:07 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0FCA3F836;
	Fri, 26 Jun 2026 02:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782466692; bh=meUP+Y0CS1ctaBI7eOPfAVVBnMsYGpnlBuYQQ6TBgvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ogmJejklrPg6Gl7OxBcpSgA/vb8kqaWxyD/jtOomRZifPgmNp6gk0xNAOYrchUmPH
	 eDbtd8VNaifCeE8NcEMhy6wXMhJiS8pGjWG90K6Ndy5DrUR7viVVLehMlVsQy8HEzY
	 FaeycKEJg+W3VzVFYkHKcWan2tsmMgYcdYltXGrc=
Date: Fri, 26 Jun 2026 10:37:55 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH 0/3] KVM: arm64: nv: Shadow ptdump fixes
Message-ID: <tl7vhu4wzqnptrfkl3bvvs5zc2ufcdhn5jwdav5hzve22hqcxq@zyu3drghk4sp>
References: <20260623142443.648972-1-weilin.chang@arm.com>
 <ajty6I7ZqodP4ous@sm-arm-grace07>
 <fabkknc7dqpve4oo2hsgcsodq4syfgg5bp54qi6cywzssaue7u@ow3q6tupzwyz>
 <86h5mrq71b.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86h5mrq71b.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_023815_195206_78887EEE 
X-CRM114-Status: GOOD (  15.96  )
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

On Thu, Jun 25, 2026 at 10:54:40AM +0100, Marc Zyngier wrote:
> On Thu, 25 Jun 2026 08:47:04 +0100,
> Wei-Lin Chang <weilin.chang@arm.com> wrote:
> > 
> > I don't see a way out with this per-mmu file scheme. The core issue is
> > mmus have a different lifetime than the VM's debugfs directory, and
> > both's removal can happen in parallel, i.e. the VM debugfs directory
> > can be removed anytime we are in mmu notifier release freeing the mmus
> > and their shadow ptdump files.
> 
> Why isn't that a problem with the existing S2 ptdump code?

For existing stuff, in terms of the ptdump files:

 - For the canonical s2, the ptdump files are only removed in
   kvm_destroy_vm_debugfs().

 - For nested s2, files are removed in two places: "manually" removed
   at mmu<->context unbind time in get_s2_mmu_nested() and in
   kvm_destroy_vm_debugfs(). get_s2_mmu_nested() is only called before
   kvm_destroy_vm_debugfs() of course.

So no dentry UAF in the current code.

Putting everything together, the situation is pretty complicated. The
canonical mmu, nested mmu, canonical mmu->pgt, nested mmu->pgt all have
different lifetimes, and kvm_destroy_vm_debugfs() can run in parallel
with mmu notifier release (like said above), which frees nested mmus and
canonical + nested pgts. Additionally, the .show() callback can be
called after mmu notifier release (Sashiko).

Now having thought about this again, per-mmu file can work, just defend
against freed mmu or pgt.

What I'm thinking now:
 - Just have all ptdump files removed at kvm_destroy_vm_debugfs(), to
   avoid accessing the dentry in mmu notifier release.
 - Revert effects of 204f7c018d76 ("KVM: arm64: ptdump: Make KVM ptdump
   code s2 mmu aware") because the mmu pointer stored in i_private and
   the ptdump state is simply invalid after mmu notifier release for
   nested.
 - Only store the kvm pointer in inode->i_private or seq_file->private.
 - For nested, check both mmu and mmu->pgt in .show() under the
   mmu_lock. For canonical only mmu->pgt check will be needed.
 - Guard nested_mmus freeing and setting nested_mmus = NULL with the
   mmu_lock so .show() won't have nested mmus disappear after checking
   nested_mmus exist.

I *think* this solves all problems known at the moment...

Thanks,
Wei-Lin Chang

> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

