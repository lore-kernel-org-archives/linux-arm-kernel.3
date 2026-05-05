Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CBCCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9ONILeg0ZSj5kiYv8/h/3/f4+oB2CTpk4+TSVisOxY=; b=UTYXQikc7V0pcJu9lml/emEg6p
	DUoZm3rhOYzzZSLXYUYnhNbOny763QOZ8HpFqbT0FB1fkWj2DalfZJVN36JV+Wo9p8WrssKRXkf+5
	l+P96eoONfd3qBSGqF0IwB9tsJufH9ARgcVpCD4HCGuqYP8HZ/FzdpVZhl4OHsUqhRmN6Jwzgu9KO
	GkhHyk8PVCH/a6LJsepJFdGJPyJozggMlVJHuzrAyiC5DSJpNGrYqVLEo5jr3eQlrllWky5x5FdtF
	/mAJdlIjhmpZ5VUmorBZSvY2nUjhYVRyWF3VhSWJ5eV2BK4yMzCU26qjp4y6rei1mqsi4LAFnAzi3
	p84dz5IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDND-0000000Fwzj-33PS;
	Tue, 05 May 2026 10:51:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDNB-0000000Fwyp-2vHB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=i9ONILeg0ZSj5kiYv8/h/3/f4+oB2CTpk4+TSVisOxY=; b=bW/BJ+XTCX58f7A/RsZJd5BZk8
	UUG63cqSpqMugGJQwwDTeISD/EXOA0pGomwqFxk9kfEIYbk0cuOySLvGhmgyDftt8sx2joKcs89vW
	zV2XrMkwlE65dvTgxMEwfDgx1uImeuZWmDAhRQ8rtUyxtQbIpHJ9sICAHQFSXTkChMGtk6tAZjhc7
	6iO+onjcjqeyFL+aIveu16kiGl8L2YUIOI5QA/kfHCNDQ5w0hTuckBvY5+rmej2iOMD4Wrl5eCOBo
	o4vZCCJ7jQzami8Yk61/EKt3rSoC2+FfAHO8Cz8BOpar7laZeMVFy5NUFz00zoDsWV62eE5mFPE+N
	ClKtK8UQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDN8-0000000DGJe-0gFl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:51:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48921293B;
	Tue,  5 May 2026 03:51:17 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 616003F763;
	Tue,  5 May 2026 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777978282; bh=yZGdbNWnv9AoNALmOOSMNuAEp4erSnU4LfuZqIJ1ueY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kziGBvU37OCRkjSk94kK2RNrvOTI7j03WaTu6gqQKEYis1J9WqfWuFXKEQJJXQ3Pm
	 f3Zcu2a1JWetSs8y/sR5hkYbTl2r17K+YEucmsp1K+ITQlE3tCjIacm9n5SXGQ/Cxg
	 qGjQ/dVMccsdc4nV7gwWQ+Ox028n1F5B3j4bRdRY=
Date: Tue, 5 May 2026 11:51:16 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	jarkko@kernel.org, zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, sudeep.holla@kernel.org
Subject: Re: [RFC PATCH 0/3] initalise ff-a after finalising pKVM
Message-ID: <afnLpG4osopTzpip@e129823.arm.com>
References: <20260505095409.1948371-1-yeoreum.yun@arm.com>
 <8942c12e-6315-493e-98c5-d55f4e6341f4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8942c12e-6315-493e-98c5-d55f4e6341f4@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_115126_626100_2DE3FCED 
X-CRM114-Status: GOOD (  32.30  )
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

Hi Ben,

> Hi Levi,
> 
> On 5/5/26 10:54, Yeoreum Yun wrote:
> > This patch is split out from the patchset [0] --
> > fix FF-A call failure with pKVM when the FF-A driver is built-in,
> > specifically the IMA-related part.
> > 
> > When pKVM is enabled, the FF-A driver must be initialised after pKVM.
> > Otherwise, pKVM cannot negotiate the FF-A version or obtain the RX/TX
> > buffer information, leading to failures in FF-A calls.
> > 
> > Currently, pKVM initialisation completes at device_initcall_sync,
> > while ffa_init() runs at the device_initcall level.
> > 
> > So far, linker deployes kvm_arm_init() before ffa_init(), and SMCs can
> > still be trapped even before finalise_pkvm() is invoked.
> > As a result, this issue has not been observed.
> > 
> > However, relying on above stuff is fragile.
> > Therefore, when pKVM is enabled, the FF-A infrastructure should be
> > initialised only after pKVM initialisation has been fully finalised.
> > 
> > To achieve this, introduce an ffa_root_dev ("arm-ffa") and
> > a corresponding driver to defer initialisation of the FF-A infrastructure
> > until pKVM initialisation is complete, and to defer probing of all FF-A devices until then
> > when pKVM is enabled.
> > 
> > This patch is based on v7.1-rc2
> > 
> > Question:
> > 
> > FF-A initialisation can occur at late_initcall. Because it may be deferred,
> > some FF-A requests cannot be serviced at that stage.
> > A typical example is the EFI runtime variable service using DIRECT_MSG_REQ.
> > 
> > Depending on the platform, the EFI runtime variable service runs with StandaloneMm
> > and uses FF-A DIRECT_REQ. However, when pKVM is enabled, FF-A initialisation
> > may be deferred to late_initcall. In this case, load_uefi_certs()
> > can fail if it is invoked before the FF-A driver is initialised
> > via deferred_probe_initcall().
> > 
> > Moving load_uefi_certs() to late_initcall_sync, as in the third patch,
> > seems not to have any problem since late_initcall and
> > late_initcall_sync are both of do_basic_setup() and it's before loading
> > init process. However, it is still unclear whether
> > it would be better to allow DIRECT_MSG_REQ in kvm_host_ffa_handler()
> 
> The spec doesn't allow this. Looking at DEN0077A 1.2 REL0:
> 
> Section 13.2.2 says:
> 
> "If they are compatible, it enables them to determine which Framework functionalities can be used. Hence, negotiation of
> the version must happen before an invocation of any other FF-A ABI."
> 
> and a bit further down
> 
> "Once the caller invokes any FF-A ABI other than FFA_VERSION, the version negotiation phase is complete."
> 
> I would have thought that an SP would only go into the waiting state once the version negotiation is done.

I mean the negotiation between hypervisor and ff-a driver.
actually the version negotiation is done with SPMC in
hyp_ffa_init() but the negotiaion between hypervisor and ff-a driver
just choose the lower version between version requested from ff-a driver
and negotiated version with hypervisor and SPMC.

So, the version negotiation is already done with SPMC
but with FF-A driver with hypervisor is not yet.
However, DIRECT_MSG_REQ has supported from v1.0 
In this situation, is there any reason not to send DIRECT_REQ_MSG?

> 
> > even before FF-A version negotiation since handler’s purpose seems to hook
> > certain memory operations, and DIRECT_MSG_REQ has been available
> > since FF-A specification v1.0.
> > 
> > Any feedback or alternative suggestions would be appreciated!
> > 
> > Link: https://lore.kernel.org/all/20260422162449.1814615-1-yeoreum.yun@arm.com/ [0]
> > 
> > Yeoreum Yun (3):
> >   arm64: KVM: defer kvm_init() to finalise_pkvm() when pKVM is enabled
> >   firmware: arm_ffa: initialise ff-a after finalising pKVM
> >     initialisation
> >   security: integrity: call load_uefi_certs() at late_initcall_sync
> > 
> >  arch/arm64/kvm/arm.c                          |   8 +-
> >  arch/arm64/kvm/pkvm.c                         |  15 ++-
> >  drivers/firmware/arm_ffa/bus.c                | 125 +++++++++++++++++-
> >  drivers/firmware/arm_ffa/common.h             |  13 +-
> >  drivers/firmware/arm_ffa/driver.c             |  21 ++-
> >  drivers/firmware/arm_ffa/smccc.c              |   2 +-
> >  security/integrity/platform_certs/load_uefi.c |   2 +-
> >  7 files changed, 166 insertions(+), 20 deletions(-)
> > 
> > 
> > base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
> 

-- 
Sincerely,
Yeoreum Yun

