Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF4ECD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hECA0utA2/L/UXnbxSWEvYNIQRYUaYa7ERfSy+Q2v9E=; b=gKZku2r5vXDIBi/WA39a6wfu2K
	JpSALWA9kOWntwJZnw4H7/mqoeQ2THi5Ks8s35wY4vTXllwRqLTA9WDWmsRYkzPHYQBnGNAocQsJQ
	Bk0o6nR69NBBSU4fHWNjz/A0eocNVWPOto2V6phJteB1TM3thD8KzRTMwfnKkNo5237c94bStEZvO
	YHHmlXxjc/BhTe7LJTBaUzM5W1iHMxpXGKZuUgzoh959p8Qv9lY6nwvB7KWuNq2M2B0nsida5Bpg1
	KhZ9nO+JXeKAM2rEniWUU0zq+ocGrOXdOwGy82EhwvmXLdONtbAJHyeAxi954vliqNI+otIkv1FqS
	x7+w6Kqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStnV-000000075mi-2LCz;
	Fri, 29 May 2026 09:46:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStnS-000000075m5-2yY4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:46:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F6732247;
	Fri, 29 May 2026 02:46:22 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CB1E3F905;
	Fri, 29 May 2026 02:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780047987; bh=NsFQRYip/hELKHXpSdhGRL1Zi8kiBFNQRk5a4eoFpyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cPtp8E8fiJFsIpbd4nDiEiAUlhSS9OYxgGdFZjsU1PMbXgie/yZqfAz3zm01OrzkD
	 39NJj4WjVcieajBynQfLB3WVipKS8FkXwfJiW8NOsb0T/r41l8OAVqUb760iy8nlJa
	 E69nTGWBqOTKgpS74gEYN3o/PGE0DbYd6AW3Ht3E=
Date: Fri, 29 May 2026 10:46:21 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Preserve all guest ZCR_EL2.LEN values
Message-ID: <20260529094621.GA1196227@e124191.cambridge.arm.com>
References: <20260529-kvm-arm64-fix-zcr-len-nv-v2-1-86cad51992bd@kernel.org>
 <868q92vace.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868q92vace.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_024630_843500_1C272C75 
X-CRM114-Status: GOOD (  32.87  )
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

On Fri, May 29, 2026 at 10:22:41AM +0100, Marc Zyngier wrote:
> Thanks for respinning this patch quickly.
> 
> On Fri, 29 May 2026 00:01:44 +0100,
> Mark Brown <broonie@kernel.org> wrote:
> > 
> > Since commit b3d29a823099 ("KVM: arm64: nv: Handle ZCR_EL2 traps") when
> > guests write to ZCR_EL2 we have clamped the value of ZCR_EL2.LEN to be
> > at most that configuring the maximum guest VL when accessed directly as
> > ZCR_EL2. This is not clearly the behaviour the architecture documents
> > for ZCR_EL2.LEN, while things are a little ambiguous currently there is
> > a fairly direct reading that suggests values will be read as written.
> > Further, the documented procedure for enumerating vector lengths means
> > that it is expected that values larger than the largest supported vector
> > length will be written in practice.
> 
> Honestly, that's not the core issue. And even $SUBJECT fails to
> capture what is at stake here.
> 
> > 
> > The reasoning for the current behaviour is not specifically articulated, my
> 
> I don't think there is a reasoning behind each and every bug.
> 
> > best guess is that it is intended to ensure that the guest can not see an
> > effective VL greater than the maximum that has been configured, though
> > this will be ineffective when a VHE guest uses the ZCR_EL1 accessor.
> 
> This last point *IS* the core problem. It is that the guest can access
> VLs beyond what is intended by the VM configuration. Not getting the
> read-as-written behaviour really is secondary compared to that issue.
> 
> [...]
> 
> I've rewritten the commit message to make it plain what the problem
> is, see below. I've also slightly tidied up access_zcr_el2(), but the
> fix otherwise looks good.

Seems like you're starting your own CMAAS! https://lore.kernel.org/kvmarm/86cxyzxymq.wl-maz@kernel.org/

> 
> Thanks,
> 
> 	M.
> 
> KVM: arm64: Correctly cap ZCR_EL2 provided by a guest hypervisor
> 
> ZCR_EL2 can be updated by a VHE guest hypervisor either using ZCR_EL2
> (which traps) or ZCR_EL1 (which does not trap). KVM handles both in
> different way:
> 
> - on ZCR_EL2 trap, ZCR_EL2.LEN is immediately capped at the VM's own
>   VL limit. This has the potential to break existing SW that relies
>   on the full LEN field to be stateful.
> 
> - on ZCR_EL1 access, we do absolutely nothing.
> 
> On restoring the SVE context for an L2 guest, we directly restore the
> guest hypervisor's view of ZCR_EL2 into the physical ZCR_EL2. If the
> guest's view of the register was updated using the ZCR_EL2 accessor,
> the value has already been sanitised (with the caveat mentioned above).
> 
> But if the guest used ZCR_EL1, the raw value is written into the HW,
> and the L2 guest can now access VLs that it shouldn't.
> 
> Fix all the above by moving the VL capping to the restore points,
> ensuring that:
> 
> - the HW is always programmed with a capped value, irrespective of
>   the accessor being used,
> 
> - the ZCR_EL2.LEN field is always completely stateful, irrespective
>   of the accessor being used.
> 
> Additionally, move ZCR_EL2 to be a sanitised register, ensuring that
> only the LEN field is actually stateful. This requires some creative
> construction of the RES0 mask, as the sysreg generation script does
> not yet generate RAZ/WI fields.
> 
> -- 

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey

> Without deviation from the norm, progress is not possible.

