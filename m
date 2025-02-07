Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C285C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 19:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0hzUnHzdhCo2y6/Zd0m67AYnch7xq5CWs11SS1frqA=; b=ccGVtGVRiu4Di8nAklhKTcQ9l0
	t48D0sZaTy8faLPAFNxDWcjYa3wyFqpUdW+eH2k+HlEuK8x62e04mCmdnqeQ8O5z3+AqAnGCed5vS
	4qOcgeQYfLI5kT2VGgJS9yClq5a5PgPFMOXsdmDoqN2fQxihRAtj98zRtLaVdm++gO0HhDY2tEt0a
	DRgar5buRsis0drkjcmax2/SfjL6rMRpyIgiKgNefVFJx1D3LJ/mZ7EALVVs5ynDtrfguVy9DwCyN
	j+U/8YEwZOdqgEfEhrTXiYGLkFqwLTQrAoEA3MMizeUi/2FIKEY3MClMuC5snJozgXszzr2PNgIos
	R11kZx+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTkP-0000000ArVX-3i0r;
	Fri, 07 Feb 2025 19:10:41 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTiJ-0000000Ar70-0kmh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 19:08:32 +0000
Date: Fri, 7 Feb 2025 11:08:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738955303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U0hzUnHzdhCo2y6/Zd0m67AYnch7xq5CWs11SS1frqA=;
	b=SMDXcW6C8ljTR21eTp2x0+eWZlmxR3qfLrtZHahBQAHzrBnFfq/SeM0H+atDZAAsjOQz5m
	gXSxkybAbiEROU7ZuFuiPPPJcVIrzEGMDZeEwHZws+N1vazLNlfHjfMA51O7DjjTQyfAbD
	sMKNHNGEWC9UK9SMaK7BSzbXZqLU/DI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Eric Auger <eauger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	kvmarm <kvmarm@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	christoffer.dall@arm.com, suzuki.poulose@arm.com, will@kernel.org,
	catalin.marinas@arm.com, coltonlewis@google.com, joey.gouly@arm.com,
	yuzenghui@huawei.com, darren@os.amperecomputing.com,
	vishnu@os.amperecomputing.com
Subject: Re: [PATCH] KVM: arm64: nv: Set ISTATUS for emulated timers, If
 timer expired
Message-ID: <Z6ZaIVtZ2k798Dn0@linux.dev>
References: <4d443db1-85b1-4071-acd5-3187deb9cb17@redhat.com>
 <2f6b2cb1-3d32-480a-9801-9b993ae74e2d@os.amperecomputing.com>
 <152d262e-641d-4bb1-9656-a13e049d62c4@redhat.com>
 <86h661wje4.wl-maz@kernel.org>
 <4a9fbdd9-ad23-44bc-8ba5-399f08068db4@redhat.com>
 <86cygpwfy0.wl-maz@kernel.org>
 <b22d5916-8b55-43bc-a256-2136d66ad25f@redhat.com>
 <86frkptzr6.wl-maz@kernel.org>
 <Z6ZMdv8jJUvYwQzT@linux.dev>
 <86bjvdtxb5.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjvdtxb5.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_110831_493251_95B0BD4C 
X-CRM114-Status: GOOD (  31.21  )
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

On Fri, Feb 07, 2025 at 06:38:22PM +0000, Marc Zyngier wrote:
> On Fri, 07 Feb 2025 18:09:58 +0000,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > Hey,
> > 
> > On Fri, Feb 07, 2025 at 05:45:33PM +0000, Marc Zyngier wrote:
> > > I found at least one issue that could fail the migration. Before the
> > > VM starts running, we limit the feature set to the subset we actually
> > > support with NV.
> > > 
> > > By doing this, we also change the value of IDreg fields that are not
> > > writable, because they describe features that we don't support.
> > > Obviously, that fails on restore.
> > > 
> > > I need to have a think...
> > 
> > We spoke about this a while ago (and I forgot til now), but I was
> > wondering if we could use vCPU feature flags to describe NV, including
> > the selection between FEAT_E2H0 and FEAT_VHE.
> > 
> > I think this might match userspace expectations a bit more closely where
> > the state of the ID registers after init gives the actual feature set
> > supported by the VM.
> 
> I'm not sure that's enough. Let me give you an example:
> 
> My host has FEAT_XNX, described in ID_AA64MMFR1_EL1.XNX. For whatever
> reason, we don't allow this field to be written to, even out of NV
> context. This is odd, because for an EL1 VM, this field means nothing
> at all.
> 
> However, we don't yet support FEAT_XNX with NV (it requires some extra
> surgery in the S2 walker, in the S2 shadowing code and in AT).
> 
> How would you manage this field if you had a vcpu flag saying E2H0 or
> not? I don't think it helps, at least not in that particular case. It
> may help for some things, but not all.
> 
> It feels that we need to define the field limit (and what is writable
> or not) based on the NV/!NV support, and maybe E2H0/VHE as well.

I think we're both aiming in the right direction, I just didn't make my
point clear.

The ID registers we make visible to userspace after KVM_ARM_VCPU_INIT
*must* describe a feature set we will actually honor for the VM. No late
masking of features (i.e. first KVM_RUN), since it pretty much
guarantees userspace won't be able to save/restore correctly.

While we describe NV up front, we've been talking about allowing
userspace to make the E2H0 v. VHE selection through the ID registers as
well. My suggestion is that we have userspace select the flavor of NV
it wants (E2H0 v. VHE) up front and completely nuke from orbit the idea
of late feature fixups.

This would solve your example of XNX, as we'd apply NV enforcement early
and not expose the feature. Same would also hold for VHE-only features,
such as recursive NV.

Hopefully I made more sense this time around :)

-- 
Thanks,
Oliver

