Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CF5CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 07:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bddcz4w/VJhj01Kg7VsMFkvmKvDxEfuk9ts8Kw2NkYM=; b=tqtbFzqhjVBTLpb3dwP7phXUZ9
	km+hFhtQ02tNxWCEkXOjIa4piK0LJPbZAP5xaMfJkY53wdbrAJMIE6SppzUTNUmEWJNZ2eZP3Kyps
	8uiBl1xao0RwoexKY2Xuqli/4UxDOHSJRIZE1CroUSFh/aP17bzc713JKxtLDGKiqmVjY00MBOSWF
	hTeh1yMBVhlV1Ze1w7WYaKLyatYTFUMVrD+R+PRmQUOf73QWgn0xOV/Z/UaDpjd88anbx+ivYd73v
	APEpN2+FBRTYhmCCVUYczN++Ya5FhdA5PqChpgMRzRIdrwkL7echHP5j4RlSxfSmb2wtdep2S7iWm
	995Pgb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWfS-000000001hP-0951;
	Wed, 06 May 2026 07:27:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWfQ-000000001gn-2g7j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 07:27:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C53BD419EE;
	Wed,  6 May 2026 07:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C9DC2BCB8;
	Wed,  6 May 2026 07:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778052455;
	bh=DO5Il5qSJuFEpe8fEuN08Kr/jSvHBd9ZgBnBkCm9u2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3N3qBT69i21fIlYlmZ+v5gffaItiVQXQqBPFenOURqKYQQOdC2dVCpEQwkDv8mVg
	 Yp/Z89J6qJ67WvEg6XSFLrs9ipTMg+JQLooVT6HghUhiBnznPNdvorplRAPt/4OErs
	 Ca/a/1vIs+cmeFYT4PDryIeV0+16kYr5wlx9aYwdl+PvFr3urYiCbj3vsyOd2e/gpI
	 iAu2yCNMHeKW+PR8tviByaK3PKNDK3UsvNq+5VTYbU+CzWEPYUgM1WmbhKrshymXmU
	 KmofsrfvLHfFQ2tD8QndrcwbRzu1MZfhECeOwUA5DB8JmFiowt8A1ER/W2dbdfcfSL
	 hHyqqVRPcJk0Q==
Date: Wed, 6 May 2026 08:27:29 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	jarkko@kernel.org, zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 2/3] firmware: arm_ffa: initialise ff-a after
 finalising pKVM initialisation
Message-ID: <20260506-warm-deer-of-energy-522bfa@sudeepholla>
References: <20260505095409.1948371-1-yeoreum.yun@arm.com>
 <20260505095409.1948371-3-yeoreum.yun@arm.com>
 <20260505-super-gecko-of-argument-655030@sudeepholla>
 <afoHizU8NgFWzvYW@e129823.arm.com>
 <20260505-adaptable-mussel-of-virtuosity-2751db@sudeepholla>
 <afohuFhVBIyUFEMT@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afohuFhVBIyUFEMT@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_002736_721538_FED04C04 
X-CRM114-Status: GOOD (  35.60  )
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

On Tue, May 05, 2026 at 05:58:32PM +0100, Yeoreum Yun wrote:
> Hi Sudeep,
> 
> > On Tue, May 05, 2026 at 04:06:51PM +0100, Yeoreum Yun wrote:
> > > Hi Sudeep,
> > > 
> > > > On Tue, May 05, 2026 at 10:54:08AM +0100, Yeoreum Yun wrote:
> > > > > When pKVM is enabled, the FF-A driver must be initialised after pKVM.
> > > > > Otherwise, pKVM cannot negotiate the FF-A version or obtain the RX/TX
> > > > > buffer information, leading to failures in FF-A calls.
> > > > > 
> > > > > Currently, pKVM initialisation completes at device_initcall_sync,
> > > > > while ffa_init() runs at the device_initcall level.
> > > > > 
> > > > > So far, linker deployes kvm_arm_init() before ffa_init(), and SMCs can
> > > > > still be trapped even before finalise_pkvm() is invoked.
> > > > > As a result, this issue has not been observed.
> > > > > 
> > > > > However, relying on above stuff is fragile.
> > > > > Therefore, when pKVM is enabled, the FF-A infrastructure should be
> > > > > initialised only after pKVM initialisation has been fully finalised.
> > > > > 
> > > > > To achieve this, introduce an ffa_root_dev ("arm-ffa") and
> > > > > a corresponding driver to defer initialisation of the FF-A infrastructure
> > > > > until pKVM initialisation is complete, and to defer probing of all FF-A devices until then
> > > > > when pKVM is enabled.
> > > > > 
> > > > 
> > > > I don't like this whole ffa root device design.
> > > > Two question for now:
> > > > 1. Can FF-A be a module on systems with pKVM which removes the need for all
> > > >    this dance done here ?
> > > 
> > > But this means we reduce the other feature e.x) IMA with TPM over
> > > FF-A and pKVM feature. Since IMA must be a built-in, we couldn't avoid
> > > to build FF-A driver with built-in.
> > > 
> > > > 2. If it is a requirement to have this built-in, I prefer to add a probe
> > > >    and defer it instead of this root ffa device.
> > > 
> > > But, How? anyway all of FF-A device & driver couldn't be probed unless
> > > FF-A initialisation is finished and How can we trigger FF-A initailise
> > > after pKVM finish its initialisation?
> > > 
> > > The problem is ff-a intiailisation happens before pKVM finish its
> > > initailasation and to do defer probe, it should use dd-model and
> > > As we discussed in other thread, notifier couldn't be a soluation.
> > > 
> > > Could you let me share other way I'm missing?
> > > 
> > 
> > Will something like below work ?
> 
> It might work and when I write the code I thougt about whether to
> use add platform device but I didn't find why this is better than
> to create root device of FF-A (anyway creating a simple platform device
> for FF-A seems similar to create root device)

First, you tried to force the FF-A core to be treated as an FF-A device, then
added several bus-code changes to handle it as a "special root" device while
skipping all FF-A device functionality. Please consider the purpose of
creating it as an FF-A device if additional code is then required to bypass
the functionality it provides.

> If you don't mind why it would be better than to create FF-A root
> device in FF-A bus?
> 
> > If we add DT bindings, then we can add
> > of_match_table and drop the platform device creation. Also we can adjust
> > the parent device the way you have done by a simple change(not done in
> > this untested/not compiled change).
> 
> Might for a DT, but do we need to platform device creation for ACPI case
> anyway?
> 
>

Just acpi_match_table instead of of_match_table.

-- 
Regards,
Sudeep

