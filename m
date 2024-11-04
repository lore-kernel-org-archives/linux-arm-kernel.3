Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3846D132DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JL0QwF7qaAEQ6R4QliLROnaIzvWF3coIHu4GBpM2ebc=; b=SXFBkPkAy0Pw/lKwy8A+xyt4N0
	eCnKYHGFF55my6BiFvBggue5D8gWMedadQ6U1Pnu97/ad57d4QkNtEjIhtm1BZ2vaZE9+t5BfCA+C
	9xfEn2LmaZky/E4qWaGA+nmqVFyMsbwUbq6nspzkKbVjkdSMTRgrVxo0Ov27Gu14VleRMB/bSXJ9H
	Smv/tQkXvoJOZQEovitxcNB31Ul20RZvbqxxb1WFbymP1iiT6rKT6VKZLHw6WgZie/77oksMHm4Kn
	gQToz6ZMsQL60FqMSnvT3yZNQuQVBkt4Bsyk8yE2U76JbXxnred5E+O+AjL0q4RL3zz43CsKEAy1c
	+61Wcq2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ylf-0000000EAH9-17YT;
	Mon, 04 Nov 2024 15:13:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yjx-0000000EA0R-3d6X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 15:11:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C53F45C5682;
	Mon,  4 Nov 2024 15:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3BEC4CECE;
	Mon,  4 Nov 2024 15:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730733095;
	bh=kTcIvo7yioetmpNQbu0IC5h4s6IrPCBWdMVl5D73t7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lxceTN5NoMnOb7R/VPtFgRQBTl8fQIQGc+4Gk8OT4K//G+8yFdf1m763nh4hbSYjQ
	 Q8L0dM+aIbjCHQBdLLToU6JHIkL0xE1N1MhABdTFa4no5VZJo28LxZQQBoWB/t2irM
	 h5+K4mIJXpoBeCpFomfpoaJA0yVQ95MKtcPaM1xFuLRiXCcZpu4o9nJ6qlaqTN5121
	 YfE8P7UqD3VEHAvSGFS2dsG4TFkL6XuDxtv562XTMv3j6/0Cdx0wFHXFycCvk81Ndz
	 w+K2Nd4Qks64XUx2V2qChbExvIWBEDSFoFlvjbEWoQUHMeDg67rC+qPPhYHGReiBK2
	 bN5bKB2JDwa6w==
Date: Mon, 4 Nov 2024 16:11:23 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, sami.mujawar@arm.com,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
	Shuah Khan <shuah@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Francesco Lavra <francescolavra.fl@gmail.com>,
	Miguel Luis <miguel.luis@oracle.com>
Subject: Re: [PATCH v6 6/6] arm64: Use SYSTEM_OFF2 PSCI call to power off for
 hibernate
Message-ID: <ZyjkGwkrQ+R+fI8m@lpieralisi>
References: <20241019172459.2241939-1-dwmw2@infradead.org>
 <20241019172459.2241939-7-dwmw2@infradead.org>
 <ZyPEn4qhaYyYqrzk@lpieralisi>
 <ZyUUh6KawapLkj0z@lpieralisi>
 <CAMj1kXFma8-GqKuOs5-UAQY9asbq2p9EubSjjbywaURa4T4WnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFma8-GqKuOs5-UAQY9asbq2p9EubSjjbywaURa4T4WnA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_071138_023245_72EABA53 
X-CRM114-Status: GOOD (  39.92  )
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

On Mon, Nov 04, 2024 at 02:54:12PM +0100, Ard Biesheuvel wrote:
> On Fri, 1 Nov 2024 at 18:49, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> >
> > [+Ard, Sami, for EFI]
> >
> > On Thu, Oct 31, 2024 at 06:55:43PM +0100, Lorenzo Pieralisi wrote:
> > > On Sat, Oct 19, 2024 at 06:15:47PM +0100, David Woodhouse wrote:
> > >
> > > [...]
> > >
> > > > +#ifdef CONFIG_HIBERNATION
> > > > +static int psci_sys_hibernate(struct sys_off_data *data)
> > > > +{
> > > > +   /*
> > > > +    * Zero is an acceptable alternative to PSCI_1_3_OFF_TYPE_HIBERNATE_OFF
> > > > +    * and is supported by hypervisors implementing an earlier version
> > > > +    * of the pSCI v1.3 spec.
> > > > +    */
> > >
> > > It is obvious but with this patch applied a host kernel would start executing
> > > SYSTEM_OFF2 too if supported in firmware to hibernate, it is not a hypervisor
> > > only code path.
> > >
> > > Related to that: is it now always safe to override
> > >
> > > commit 60c0d45a7f7a ("efi/arm64: use UEFI for system reset and poweroff")
> > >
> > > for hibernation ? It is not very clear to me why overriding PSCI for
> > > poweroff was the right thing to do - tried to follow that patch history but
> > > the question remains (it is related to UpdateCapsule() but I don't know
> > > how that applies to the hibernation use case).
> >
> > RFC: It is unclear to me what happens in current mainline if we try to
> > hibernate with EFI runtime services enabled and a capsule update pending (we
> > issue EFI ResetSystem(EFI_RESET_SHUTDOWN,..) which might not be compatible
> > with the reset required by the pending capsule update request) what happens
> > in this case I don't know but at least the choice is all contained in
> > EFI firmware.
> >
> > Then if in the same scenario now we are switching to PSCI SYSTEM_OFF2 for the
> > hibernate reset I suspect that what happens to the in-flight capsule
> > update requests strictly depends on what "reset" PSCI SYSTEM_OFF2 will
> > end up doing ?
> >
> > I think this is just a corner case and it is unlikely it has been ever
> > tested (is it even possible ? Looking at EFI folks) - it would be good
> > to clarify it at least to make sure we understand this code path.
> >
> 
> I'm not aware of any OS that actually uses capsule update at runtime
> (both Windows and Linux queue up the capsule and call the
> UpdateCapsule() runtime service at boot time after a reboot).
> 
> So it is unlikely that this would break anything, and I'd actually be
> inclined to disable capsule update at runtime altogether.
> 
> I will also note that hibernation with EFI is flaky in general, given
> that EFI memory regions may move around

Thank you for chiming in, I think we are OK (I don't think this patch
will create more issues than the ones that are already there for hibernate
anyway) - the reasoning behind the change is in the commit logs.

Lorenzo

