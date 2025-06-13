Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81893C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 20:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKlTMyrwwqDx/wAU3aYigDU8KWuXM98SDm/vlqdsd+M=; b=BgNK+BJn3OipH5hP7hMB/M1oHR
	r2R+9vxcfvr0SHPcIdYKeCZRbiFPImKnukdMZxDbWpxXS5+3JGH/NMiJoPQw+8eR/WpsACoaQ0dyL
	b2yAgGB1n23laRhMdxw+CmekqokaU1qSB+UILgXUe6K15Sji0iHdPXmENq3P34LBC1d5EBJjm5/zX
	fZtlUQzRWUE0Q9aNPowt+Y52npSA7YoyUc9N9nNKss4Y+xomqE+F4D5g4EERyMcBLr+Di9PtSNVsT
	p9YA0sPSWtH3lNYxaEGK3I5HR5RWfsLlO+zDjnAOVciw4q37KSWQ5PtYRo46XcJGKt5LgUc05qvm5
	uHByt2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBSI-000000002mF-2oA0;
	Fri, 13 Jun 2025 20:56:54 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBOj-000000002TH-04vn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 20:53:14 +0000
Date: Fri, 13 Jun 2025 13:53:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749847991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fKlTMyrwwqDx/wAU3aYigDU8KWuXM98SDm/vlqdsd+M=;
	b=pVR5GWgkNqzsvtdbkN7JjzMCt22LvsxgOGhb/+msVanV1s7cBRUoJZ6bsNyRtYMjiXXiS3
	Jq95S+FMYqTB1feRQVAKEXu5wBaWE70jcJPnTo+rKRHdUgxmCbgd5muA55kq8S8KAcj3Ev
	bzi2e9zImCp9gL0sj9glDsWQV/2sN1A=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH v3 0/4] KVM: arm64: Add attribute to control
 GICD_TYPER2.nASSGIcap
Message-ID: <aEyPswyvfJ2-oC3l@linux.dev>
References: <20250613155239.2029059-1-rananta@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613155239.2029059-1-rananta@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_135313_195597_300E76CA 
X-CRM114-Status: GOOD (  15.81  )
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

On Fri, Jun 13, 2025 at 03:52:34PM +0000, Raghavendra Rao Ananta wrote:
> A shortcoming of the GIC architecture is that there's an absolute limit on
> the number of vPEs that can be tracked by the ITS. It is possible that
> an operator is running a mix of VMs on a system, only wanting to provide
> a specific class of VMs with hardware interrupt injection support.
> 
> The series introduces KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap vGIC attribute to allow
> the userspace to control GICD_TYPER2.nASSGIcap (GICv4.1) on a per-VM basis.
> 
> v1: https://lore.kernel.org/kvmarm/20250514192159.1751538-1-rananta@google.com/
> 
> v1 -> v2: https://lore.kernel.org/all/20250531012545.709887-1-oliver.upton@linux.dev/
>  - Drop all use of GICv4 in the UAPI and KVM-internal helpers in favor
>    of nASSGIcap. This changes things around to model a guest feature,
>    not a host feature.
> 
>  - Consolidate UAPI into a single attribute and expect userspace to use
>    to read the attribute for discovery, much like we do with the ID
>    registers
> 
>  - Squash documentation together with implementation
> 
>  - Clean up maintenance IRQ attribute handling, which I ran into as part
>    of reviewing this series
> 
> v2 -> v3:
>  - Update checks in vgic-v3.c and vgic-v4.c to also include nASSGIcap (via
>    vgic_supports_direct_sgis()) that's configured by the userspace. (Oliver)
> 
> Oliver Upton (2):
>   KVM: arm64: Disambiguate support for vSGIs v. vLPIs
>   KVM: arm64: vgic-v3: Consolidate MAINT_IRQ handling

Make sure you run checkpatch next time before sending out, it should've
warned you about sending patches w/o including your SOB.

Thanks,
Oliver

