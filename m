Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AE7E6F06E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2aDcjvOVvmje1zY26ZIHZ0u+4oui1JaOZ3+57t9ABA=; b=H7D4pH48TSa1/+M6rhlU8/vQ2x
	Moe7SDWVSO0G+hpds531KpRX3vjFvRUrYHC8RpHUh03XotAOYtcEOX2QymTy/z3FfUP3NrJ1t3EGn
	FyQsEwuReHmJc83/Naj6gj5i6bNCsBtB7SrvXaj4RXOPEaFcoGK03SA66ck/aFbv3b3zKKsYm8pSN
	OS8qQAsdwBQ8cvoPtGQBLTO3qm8SGivDHHPYXWXJwK5HYEQX5gEnz6xfMnMCkziVR0A0NhoCpsptM
	wsZfBLkcSwUl3A0XEmvwwlYdLVH8Yly5UdBsVBNtGeQ5r+HDRo8K+H62iE+4DemRFUC5KIXuCPPt9
	DRV6OSHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ugo-00000007i8o-1I1R;
	Fri, 01 Nov 2024 16:39:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uc5-00000007hNn-3tL1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:35:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67D17A4455B;
	Fri,  1 Nov 2024 16:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9EBC4CECD;
	Fri,  1 Nov 2024 16:35:02 +0000 (UTC)
Date: Fri, 1 Nov 2024 16:35:00 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] arm64: Expose ID_AA64ISAR1_EL1.XS to sanitised feature
 consumers
Message-ID: <ZyUDNCu-vYh_tpKv@arm.com>
References: <20241031083519.364313-1-maz@kernel.org>
 <ZyT1Tblp624a79CD@arm.com>
 <ZyT4JG1Nec_xPCHH@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyT4JG1Nec_xPCHH@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_093506_056222_281ABCE0 
X-CRM114-Status: GOOD (  17.18  )
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

On Fri, Nov 01, 2024 at 08:47:48AM -0700, Oliver Upton wrote:
> On Fri, Nov 01, 2024 at 03:35:41PM +0000, Catalin Marinas wrote:
> > On Thu, Oct 31, 2024 at 08:35:19AM +0000, Marc Zyngier wrote:
> > > Despite KVM now being able to deal with XS-tagged TLBIs, we still don't
> > > expose these feature bits to KVM.
> > > 
> > > Plumb in the feature in ID_AA64ISAR1_EL1.
> > > 
> > > Fixes: 0feec7769a63 ("KVM: arm64: nv: Add handling of NXS-flavoured TLBI operations")
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > 
> > Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> > 
> > Happy for this to go in as a fix via the kvm tree but let me know if I
> > should pick it up instead.
> 
> Thanks Catalin. I think this can wait for 6.13, would you mind grabbing
> it?
> 
> If you do:
> 
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

I'll pick it up. Thanks.

-- 
Catalin

