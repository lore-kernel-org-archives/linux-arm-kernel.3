Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51842C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPds00CPuo0sl2ypaQ/wdQWyadF9e46X9vKuCNW/M40=; b=iWJrFkdQc/9FGCTCsUKSZoPPgz
	GE0GkcILhUNBWw3cIO7mJvyWpmvjc1m5k1F+ljem4Fnka6LJeELWyfwTsVWtdAo+lQ/iocHmNJ1ju
	lqh0y5eHIcwfI3cCUeBc6q5xOrGiSlFoqftLLG8UPX/i91estvgMiP8v0be3THnXfWaJ/aR1VTGli
	uNZ031JkGKjtwR+j2ZuH9lmJHVutLLEtb7uiElnfQAjFF1okkcX4DvrG2jVXr+l7nL2BxZN4eHW2j
	iFOpuNIfsqTypoNR41or/VxgzfHjiSx93RSZ0wXCH+Q2uYE87lA69qKAjkPkvq+ZGX+YaIynKd/3d
	y6pI/JJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eA1-00000002FnW-0Fpv;
	Mon, 21 Sep 2026 13:34:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8e9z-00000002Fmz-2qZe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 13:34:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0637600C8;
	Mon, 21 Sep 2026 13:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FBC1F000FF;
	Mon, 21 Sep 2026 13:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789997658;
	bh=uPds00CPuo0sl2ypaQ/wdQWyadF9e46X9vKuCNW/M40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SSXwlK38kiauqEhRh8+Pr0Ahx3wVZ6QcaM1Mm03CqCH91GgKLTwH/LxcxFLbVO4Zi
	 Fb8yRSey5wxIspybcq4fckdmq9+PkSFg47BLm9udssp5v+0jTutqSdQ1Akk4Wfohhe
	 loJGZ8Qi53PPffCB8DpvFsyTYwJzHKXWhRERxkSC+mxrUP/6UO1z3uiRBI005jZEm3
	 P5rNM/uZNUWZ7zbgwG2kg7GtfmM3sckK3Ow+5DrF+KDUDHOlW+K0dSUM4uQfASGmz8
	 59D6eS5pQyGD09iMfU48lSzvSyaQ8HBd2clEYyVbp+U8zlpMzqusbkFieywHlPkOf5
	 wTaBuLxz097tQ==
Date: Mon, 21 Sep 2026 14:34:12 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Jack Thomson <jackabt@amazon.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Restore the VM's feature bitmap when
 kvm_setup_vcpu() fails
Message-ID: <arEskPHpAPQf5SAb@gremlin>
References: <20260921063718.1604533-1-fuad.tabba@linux.dev>
 <arDYHSlFHm_XzGvN@kernel.org>
 <CA+EHjTz0-qS8RRhdT8XjAgWqKhgjjzbRsZ_jwTBVqM-8pXk7Vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTz0-qS8RRhdT8XjAgWqKhgjjzbRsZ_jwTBVqM-8pXk7Vw@mail.gmail.com>
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

On Mon, Sep 21, 2026 at 08:24:56AM +0100, Fuad Tabba wrote:
> Hi Oliver,
>
> On Mon, 21 Sep 2026 00:09:17 -0700, Oliver Upton <oupton@kernel.org> wrote:
> [...]
> > > Nothing in the tree loads a vCPU whose init failed, so this is latent.
> > > The upcoming series that enables KVM_PRE_FAULT_MEMORY for arm64 exposes
> > > it: the generic kvm_vcpu_pre_fault_memory() calls vcpu_load() whether
> > > or not the vCPU has been initialised.
> >
> > That's a bug, not a feature. We should require an initialized vcpu for
> > the ioctl.
>
> That one is for Lorenzo then :) I'll reword the message so the stale
> bitmap comes first and the pre-fault crash is just how it showed up.

In general this is the behaviour of _generic_ KVM code
(kvm_vcpu_pre_fault_memory()), which itself does not require an initialised
vCPU, and no other arch seems to requires that either in the arch-specific
pre-fault code.

The actual pre-faulting implementation intentionally only targets the
canonical MMU to fault in S2 page tables, which doesn't need initialisation
to have taken place AFAICT.

However I could add:

	if (!kvm_vcpu_initialized(vcpu))
		return -ENOEXEC;

To kvm_arch_vcpu_pre_fault_memory(), which would make this a requirement,
though that would bring us out of line with other archs.

OTOH, I don't see why anybody would pre-fault BEFORE init, feels like
something that should be done later on in VMM bring up right?

So I doubt doing this would really break any sane user.

Let me know if you want that change in the series and I can respin it.

--
Cheers, Lorenzo

