Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7829606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bB3mk3Av;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dJkZCPrA;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jLO2LuVO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u21UTFmux6GWpsHxQyjMm4C7qQp2KgUxiXBHFByAtzM=; b=bB3mk3AvKtN3vKVOX6ZX6fYw47
	fngo54nK0ujaKNOx4MgyZWUzy7G2/DZZjT6QGPBQYDgN2IsHZkvGyihO35daaWBaTl5o3wLZP3sbH
	E8r6waC/1XA89KBMfVok439m0u56x0R7uU0Sj2KLn3DzjUIg2tQXwekWCy5ax21LZndFCvrZJlPHU
	GYafu/YZy9/NiproYEwvZUOL3EeHBXPjM53AULAZvczWwhFPQW+hyRgMTAe3WdvVvztNnLtc0FgGU
	ed9/ksTg5kiV1hBhL8b9fQoGL/gyNZTOpEB/fG7zo7mt+i/AObAQdR1kne44g3+3khxGC977zEeL2
	g61jxp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaQz-0000000CabS-1VBI;
	Wed, 21 Oct 2026 17:49:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaQy-0000000CabA-1Wxk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Oct 2026 17:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u21UTFmux6GWpsHxQyjMm4C7qQp2KgUxiXBHFByAtzM=; b=dJkZCPrASr9BQg8YqVFh8d6YJs
	CBnRc8ROiAvLG+dP34cCledJ0KET0KZb8eJp1NryRqpwhea2sgc3NMxugvvl6hKyAJ4+YwEFWxfEP
	PJRokAcIjfMQ93MhLnb63BtyWwIZjpucuyDR/lyKjB8pv6QHp582s6gfFUwyuba3AYL9giJfv2Azf
	xbHI/hd++c8WUq37FOeylSoOSDoW6jx/XJcgwdlrdl5BzcAbVYFJ7ZonmCoeGjYDR0V85F118t8Tt
	hS3K98jCqPN9XpEH3seKfbhJwkpdn8pEmU3Pm41Rk+4bRj+LsiuIGTPfDPGaIbD5uPdJrKHrZNyu4
	SsXpJy8g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJaQv-000000065tu-1Hyv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 17:49:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55CF516F8;
	Wed, 21 Oct 2026 10:48:54 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 356E33F7B4;
	Wed, 21 Oct 2026 10:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792604937; bh=bEa9giIeZfDBMDwMUgTW8YTFn1UnEm9XoYsTu1CX0h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jLO2LuVONwtdmLRHFnELMpS1lxH3gZTntDBxAbGW9KjLlWgiBvkDKAp5Nw1YJcZxO
	 lipPGRVxkc03dKFZUrIiHwM2M4wUyIatvCJAj5t3jkuQCxVl/GRwS4d4Pc/G49ZX0C
	 argPPnBs8MRvzm4HMuckndnnPQaxYrK4eORDIYaI=
Date: Wed, 21 Oct 2026 18:48:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, will@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com,
	yuzenghui@huawei.com, linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v19 5/7] firmware: arm_rmm: Activate the RMM
Message-ID: <atj7A1CV4paW3htS@arm.com>
References: <a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com>
 <araketG70TIKeNuf@arm.com>
 <12e83d88-de4c-4230-aac2-1796123320ad@arm.com>
 <70d47475-e26e-40e1-b409-b0c16aecb8c0@arm.com>
 <195cdfe4-a55a-453f-9c34-620738eca244@arm.com>
 <arqrZ_Auk9BYOopa@arm.com>
 <0f68dcff-1dfe-4515-9912-515ca6457674@arm.com>
 <arudWVBPXcnUvYNh@arm.com>
 <5d487949-9195-442f-97af-acb9e3fdfb0d@arm.com>
 <86ld7ryvm8.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ld7ryvm8.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_184901_727923_55A65116 
X-CRM114-Status: GOOD (  33.75  )
X-Spam-Score: -2.5 (--)
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

On Wed, Oct 21, 2026 at 03:30:07PM +0100, Marc Zyngier wrote:
> On Wed, 21 Oct 2026 10:58:13 +0100,
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> > 
> > On 29/09/2026 12:15, Catalin Marinas wrote:
> > > On Mon, Sep 28, 2026 at 07:28:20PM +0100, Suzuki K Poulose wrote:
> > >> On 28/09/2026 19:01, Catalin Marinas wrote:
> > >>> possible, to defer the RMM activation until the first user (still do the
> > >>> RMI probing as an initcall). If we run on RME-capable hardware and
> > >>> firmware but don't care about realms or TSM, we still get the normal OS
> > >>> functionality.
> > >> 
> > >> Would you prefer this in the first drop of the RMM ? Or is this
> > >> something we could add as a separate series ?
> > > 
> > > I think we could add the deferring as a separate patch, maybe together
> > > with the KVM bits. An advantage of keeping it here if we merge this
> > > first is that we still exercise the activation path without full realm
> > > support or TSM. Otherwise a lot of this would be dead code until the
> > > other series arrive. Either way, do it as as separate patch on top of
> > > this series.
> > > 
> > 
> > I have been looking at the "on-demand" activation support and came
> > across the following design decision.
> > 
> > * We have KVM_CAP_ARM_RME which advertises that KVM can create Realm VMs
> >   to the userspace. A VMM could check this before it creates a Realm VM
> >   using KVM_CREATE_VM with type=RealmVM.
> > 
> > 
> > Now, we could delay the RMM activation as late as the KVM_CREATE_VM and
> > kick it off while we initialise the kvm as part of kvm_arch_init_vm().
> > But if that fails, we would fail the KVM_CREATE_VM.
> > 
> > The question is, what should KVM_CAP_ARM_RME indicate ?  We could
> > initially enable the cap based on the presence of RMM (but not
> > activated). However, should we turn the KVM_CAP_ARM_RME=off when we
> > fail to activate the RMM ? Is that senisble ? (i.e., runtime
> > disabling a cap).
> 
> I think this sets a bad precedent. If activation can fail, KVM end-up
> not delivering on the promise that it makes, and that's not great.
> 
> My take is that the least surprising behaviour is best. If you have
> bought into the CCA kool-aid by enabling it on the kernel command
> line, that's not by accident. You expect your VMs to reliably be
> created when KVM tells you that CCA is available.
> 
> So KVM_CAP_ARM_RME should indicate whether the RMM has been
> successfully activated, and nothing else.

Tying activation to kvm-arm.mode=rmm works for me, roughly similar to
kvm-arm.mode=protected. It's still an eager activation (just
conditional) and KVM_CAP_ARM_RME then only reports whether activation
succeeded. We lose kexec/hibernation but that's fine, it was explicitly
requested on the command line.

There's also the case of a host-only PCIe TSM (without realms). IIUC
(grep'ing FIRME spec) on an RME system IDE key programming goes via the
RMM, so this would need the RMM activated even without KVM. Not sure it
makes sense without realms, so I think we can ignore it until there's a
concrete use case (and add one more hook to activate the RMM).

-- 
Catalin

