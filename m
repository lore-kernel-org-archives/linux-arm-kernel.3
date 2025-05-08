Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F337C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HmAsO68wIoHkKrkmlfLUqA9TnoceoW6z4dm3cITFfs=; b=yJ8mI/WUv6rrGaumO3f5yBQK7d
	Nxm39HltRYMmY0bYm/RW8IbJ5MzjoNuXik1umXizNvS5lOeruU4T/LIjQNLdF7R4vXTYmgxj6bpbx
	0Zbc8rdrLvaCClCzbQCQcoBZ4TCVMWKvrb14eqXbd1ruI/lxuZ+r9YOUe8mky3xPP/tN7K6eG5RQF
	1Kpbs40nE5pIRcHrpovAoFRNUi0UXRLunOjwVXNBOKib8L5RGx9Z7LmTBPTsjYKy1XJwi7uGHTD6m
	uPoe29kD/OLk/BYdEWq/aNwa3ceprgeUzPQYOIUryl545H9Bk/kCwpjUhen3bWrCeq4YYEtr+kBiY
	eISAY+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxxK-00000000JaI-3AFW;
	Thu, 08 May 2025 09:54:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxWz-00000000Fqg-0fkJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 09:27:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 506D2106F;
	Thu,  8 May 2025 02:26:54 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BD493F673;
	Thu,  8 May 2025 02:27:02 -0700 (PDT)
Date: Thu, 8 May 2025 10:26:59 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Per Larsen <perl@immunant.com>, armellel@google.com, arve@android.com,
	Sudeep Holla <sudeep.holla@arm.com>, catalin.marinas@arm.com,
	kernel-team@android.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	qperret@google.com, sebastianene@google.com, will@kernel.org,
	yuzenghui@huawei.com, Per Larsen <perlarsen@google.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Restrict FF-A host version renegotiation
Message-ID: <20250508-spectral-sage-whippet-4f7ac2@sudeepholla>
References: <CA+AY4XcaJa1_U3qXQUBj4wZJYc9hKmRX8FTNeDvV2auEnC_WrA@mail.gmail.com>
 <86r017h00e.wl-maz@kernel.org>
 <aBnNXyJn818ZEKOS@google.com>
 <8634dfh47q.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8634dfh47q.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_022705_247160_54147EE6 
X-CRM114-Status: GOOD (  27.27  )
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

(just adding some additional info not particularly impacting the $subject
 change implementation)

On Thu, May 08, 2025 at 09:55:05AM +0100, Marc Zyngier wrote:
> On Tue, 06 May 2025 10:29:41 +0100,
> Per Larsen <perl@immunant.com> wrote:
> > 

[...]

> > Asssuming we drop this patch from the series and apply the rest, the
> > hypervisor and host can negotiate FF-A 1.2. If the host then calls
> > FFA_VERSION a second time to request FF-A 1.1, the hypervisor would
> > return version 1.2 (without this patch).
> 
> Why would it do that? Once a particular version has been negotiated, I
> expect to be immutable.
> 

Not suggesting that we need to support this, but it is technically possible
today by loading FF-A as a module—first inserting and removing a module with
v1.2 support, then loading one with v1.1 support. It can ever throw error
as not supported to keep it simple.

> > Per the spec, that means the
> > host is can use the compatibility rules (DEN0077A Sec 13.2.1) to go
> > ahead and use FF-A 1.1 (every function in 1.A must work in a compatible
> > way in 1.B if B>A).
> 
> I don't interpret this as "you can switch between versions" after the
> initial negotiation.
> 

Agreed.

> > However, the hypervisor negotiated version stays at 1.2 so it will use
> > SMCCC 1.2 for 64-bit interfaces. The host has no way of knowing this and
> > might as well assume that the hypervisor was implemented to fall back to
> > SMCCC 1.1 in this particular case. 
> > 
> > I don't even know that the host will ever try to renegotiate as it is
> > explicitly not allowed by the FF-A spec. There is no way for the
> > hypervisor to say, "stay at the negotiated version" so we must return
> > NOT_SUPPORTED. 
> 
> If it is not allowed, why should we do *anything*? And if the host is
> broken, let's fix the host rather than adding pointless validation
> code to EL2.
> 

Agreed, it is *not yet" allowed. There were some thoughts for a different
use-case IIUC, need to check the status. IIRC, it was bootloader vs OS
where bootloader like UEFI might negotiate one version(usually older) and
then OS comes and request newer version. To support such a setup, we do
need some additional support in the spec and the current latest v1.2 is not
sufficient.

-- 
Regards,
Sudeep

