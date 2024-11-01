Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA6CE6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+MyDPhu+gRQJeZ5D9KJsASFFjjeY9n3SiERHagzivM=; b=eU3HpiNn9/hfDck6QLn8Ii0bgj
	s8+jRLdbK/Xth0ooeMHTBMHF6RMWo+mxOQqj7PGO8g08wNi2rGkdCEaDhHodFXOsg9ZVS2akD/YSh
	SYDGbRZ5VyQeMeljoPFLbyaP5IE/67PBJ3ccSmBfACGCYPdnNbY5lzlGZhuMDTDdCodfvShlPTccM
	kPfxlJqRBPc6zYKb7y3RJ9/6pGyfNpuwGwQ9cYxhjo6E9cT8M9/ONuwDQnby6xEsRJEqRI3YBiwzI
	ReuG8J5VNIbLhFJqAcnqTMLUODHweYxo8mnp1Qzvsdk/8u+3H7I8TUVkHswU9CQbIHc6n5j++z60X
	67GAEfdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tmQ-00000007XmU-0htI;
	Fri, 01 Nov 2024 15:41:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tgg-00000007WrR-3Mp3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:35:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43B1FA436CF;
	Fri,  1 Nov 2024 15:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FA3C4CECD;
	Fri,  1 Nov 2024 15:35:43 +0000 (UTC)
Date: Fri, 1 Nov 2024 15:35:41 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] arm64: Expose ID_AA64ISAR1_EL1.XS to sanitised feature
 consumers
Message-ID: <ZyT1Tblp624a79CD@arm.com>
References: <20241031083519.364313-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031083519.364313-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_083546_920111_2866904D 
X-CRM114-Status: GOOD (  10.57  )
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

On Thu, Oct 31, 2024 at 08:35:19AM +0000, Marc Zyngier wrote:
> Despite KVM now being able to deal with XS-tagged TLBIs, we still don't
> expose these feature bits to KVM.
> 
> Plumb in the feature in ID_AA64ISAR1_EL1.
> 
> Fixes: 0feec7769a63 ("KVM: arm64: nv: Add handling of NXS-flavoured TLBI operations")
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Happy for this to go in as a fix via the kvm tree but let me know if I
should pick it up instead.

-- 
Catalin

