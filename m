Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142ACC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 11:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTF+dwSPXI7zQik7/wJTNpXSd0XnGMrH9i8RbEfOFK8=; b=Rwf3Yshhp3fbZj7gespSKL45RB
	ZxkHP5JnauPC4lgF7fWxynS9/XTzj58G+KiJxyQgsWrvKjF3Gqrr3IcpmtKyqou/knvyD4bu+DipP
	I0ZeiDzXOfVUS0uyJABRrVZj99EAStMYlTp6NjKMzLsZF+MdRfK3t4N/wXBIrCzkI8IECv0fZhcBr
	pxYBrukHjHqsX11gCNDeub9QwM7CSRzFp2Jx7GZqBFJ7OAExHlN3U9/adU7SW1V5kTLoqK4xHWX5z
	+7Njoz3JjwPxGoLCiE1KAFb9cGUP6bgjnFdWlZbVcankW/6JJjOFE/cowpeMq8OTxvJfghjKm1llg
	54R3OC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taZN3-0000000A6s0-2VRt;
	Wed, 22 Jan 2025 11:58:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taZLj-0000000A6al-3rtf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 11:56:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 847CF1007;
	Wed, 22 Jan 2025 03:57:15 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 127373F738;
	Wed, 22 Jan 2025 03:56:43 -0800 (PST)
Date: Wed, 22 Jan 2025 11:56:41 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v3 09/27] KVM: arm64: Factor SVE guest exit handling
 out into a function
Message-ID: <Z5Dc-WMu2azhTuMn@J2N7QTR9R3>
References: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
 <20241220-kvm-arm64-sme-v3-9-05b018c1ffeb@kernel.org>
 <Z4pAMaEYvdLpmbg2@J2N7QTR9R3>
 <86o6zzukwr.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86o6zzukwr.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_035648_004206_088E17FA 
X-CRM114-Status: GOOD (  14.89  )
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

On Wed, Jan 22, 2025 at 11:51:00AM +0000, Marc Zyngier wrote:
> On Fri, 17 Jan 2025 11:34:09 +0000, Mark Rutland <mark.rutland@arm.com> wrote:
> > The TL;DR summary is that it's not sufficient for kvm_arch_vcpu_put_fp()
> > to fix up ZCR_ELx. Either:
> > 
> > * That needs to be fixed up while IRQs are masked, e.g. by
> >   saving/restoring the host and guest ZCR_EL1 and/or ZCR_ELx values in
> >   kvm_arch_vcpu_ctxflush_fp() and kvm_arch_vcpu_ctxsync_fp()
> > 
> > * The lazy save logic in fpsimd_save_user_state() needs to handle KVM
> >   explicitly, saving the guest's ZCR_EL1 and restoring the host's
> >   ZCR_ELx.
> > 
> > I think we need to fix that before we extend this logic for SME.
> 
> So save/restore ZCR_ELx eagerly? If that's what it takes, let's do
> that now.

I believe that's sufficient; I'll go double-check and spin that now.

Mark.

