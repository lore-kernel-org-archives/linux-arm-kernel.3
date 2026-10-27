Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E1A606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 17:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QMkwC+Up;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JnukGCmU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BnI1ypDPlmui1Fn2L3S4sqAodoDBEGGvrnjTOR08vd0=; b=QMkwC+UpwFvyrjl3RaR+yYJK4J
	fNO3JvcGXwZONmHVekKBjim8E4JKZp6cb8iP08Lynow31DpjtXrJu+Ani950d9RBHwQj/HH1GJltX
	3grsJmrWN+KI86F/jCnEjfdFaFjxV8hIYAlP0acegAmvRUBNJSmRK/X9WRUTPP8WvQgvDDheTtufB
	7Rvka4+6X4Y8+Y7vjYiXRR3dkUpXvo06FtXsDVd/WdmcuLUAjioudzTEtb8sAyR3DWhu15Hxw4ltA
	gzAtGiP/Wyte7iqMzYedsk3qzml/QMsFLV97DJx54z/J6Wru2qCcXsM2pI3DoU2rvFtY7x2Ukauy9
	/hTphzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkze-00000005ShN-3qoi;
	Tue, 27 Oct 2026 17:29:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLkzc-00000005Sh0-2dSX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 17:29:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76CB01650;
	Tue, 27 Oct 2026 10:29:44 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03EA93F7B4;
	Tue, 27 Oct 2026 10:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793122187; bh=Px2Eb/FcnI3Ov0Mt8j5f3nVtsWHdzfl3d+dvv9q4c3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JnukGCmUw/pTUGbxSJRJln9Shqph1UdbZJ11e8Rw/XWFSYh2PALvpdxDCrDVUdYar
	 LzIMetk442+RLA1OwGDhiPXdCEN11FcDbAV7sW3W6KSaRWtPR5IOK52cwHFsvOA4lN
	 FVsMGnDA/gqePHcu3rFELPNmZ5TUvTU4GXnL+wus=
Date: Tue, 27 Oct 2026 17:29:43 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 0/2] KVM: arm64: Reenable MTE on VHE guest exit
Message-ID: <auDfhwB0oWFreEY2@arm.com>
References: <20261026082305.2515705-1-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026082305.2515705-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_102948_708495_C9BEFCE3 
X-CRM114-Status: GOOD (  16.92  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 08:23:03AM +0000, Marc Zyngier wrote:
> Upton taking an exception, the CPU sets PSTATE.TCO to ensure that no
> tag fault can be taken while handling the exception. It is SW's job to
> eventually clear it when it is safe to do so.
> 
> It appears that when MTE is enabled and that the kernel is running
> VHE, nothing eventually clears TCO when we come back from the guest,
> so things such as KASAN_HW_TAGS will not work until the next exit to
> userspace.
> 
> This series aims at fixing this. This is not a stable candidate, as
> KASAN is only a debug option.
> 
> Marc Zyngier (2):
>   arm64: Add return value to mte_disable_tco_entry()
>   KVM: arm64: Reenable MTE tag checking on exit from guest when running
>     VHE
> 
>  arch/arm64/include/asm/mte.h    | 10 +++++++---
>  arch/arm64/kvm/hyp/vhe/switch.c |  7 +++++++
>  2 files changed, 14 insertions(+), 3 deletions(-)

For both patches:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

