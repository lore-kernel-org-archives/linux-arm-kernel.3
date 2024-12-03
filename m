Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88276E74AD9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 21:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+P6lLrcxWEupZ6a1qA14fHtwTbpOrTMlLv/FYV/3sc=; b=CfdOFNAJDZrkTMFL8Soo3khYVR
	9W0nQCIzy+xy4rCID8wp9tuH/KQP+gdm5r7HESu9Yu/L83SYAMHAS9VWjdd3f0vIlyF5pFj0bRjkp
	PXgtFnJIkkjXla/173WohgtFsi9rxPbk24CCvB9j++eTHOpmg/DMgqGG4B7QfbXOdsAyWhPwdpREF
	pz0tBvFNFJjDFc+ZTkzUE156ZVOPCDDjp2P6Y9xLaSCafJcu4TMq4+oAyjdlwLkQbjwbx5pogCZl9
	jd/a+hkpm5No1nu2zoXMUpWOB8ow2Ilk7A8jEuLONRuZ5Sfs06StRUoWTmTbgUrnCarLFejP757Ku
	Hzjn+WsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIaN7-0000000AmnT-3n8Y;
	Tue, 03 Dec 2024 21:23:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIaLw-0000000Amb5-1f6m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 21:22:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76FC7A41621;
	Tue,  3 Dec 2024 21:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2EFC4CECF;
	Tue,  3 Dec 2024 21:22:37 +0000 (UTC)
Date: Tue, 3 Dec 2024 21:22:35 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>, stable@vger.kernel.org,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH] KVM: arm64: Do not allow ID_AA64MMFR0_EL1.ASIDbits to be
 overridden
Message-ID: <Z092m3iNQYbKljHN@arm.com>
References: <20241203190236.505759-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203190236.505759-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_132240_494564_7C2AA3EB 
X-CRM114-Status: GOOD (  19.06  )
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

On Tue, Dec 03, 2024 at 07:02:36PM +0000, Marc Zyngier wrote:
> Catalin reports that a hypervisor lying to a guest about the size
> of the ASID field may result in unexpected issues:
> 
> - if the underlying HW does only supports 8 bit ASIDs, the ASID
>   field in a TLBI VAE1* operation is only 8 bits, and the HW will
>   ignore the other 8 bits
> 
> - if on the contrary the HW is 16 bit capable, the ASID field
>   in the same TLBI operation is always 16 bits, irrespective of
>   the value of TCR_ELx.AS.
> 
> This could lead to missed invalidations if the guest was lead to
> assume that the HW had 8 bit ASIDs while they really are 16 bit wide.
> 
> In order to avoid any potential disaster that would be hard to debug,
> prenent the migration between a host with 8 bit ASIDs to one with
> wider ASIDs (the converse was obviously always forbidden). This is
> also consistent with what we already do for VMIDs.
> 
> If it becomes absolutely mandatory to support such a migration path
> in the future, we will have to trap and emulate all TLBIs, something
> that nobody should look forward to.
> 
> Fixes: d5a32b60dc18 ("KVM: arm64: Allow userspace to change ID_AA64MMFR{0-2}_EL1")
> Reported-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: James Morse <james.morse@arm.com>
> Cc: Oliver Upton <oliver.upton@linux.dev>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

