Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD001E68979
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 11:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJBDcQs/kcps8BhKxMUwfSsDRoa+vONC40odWj8nSqo=; b=G5DjtROZi/XfHOgP3dGTsgIBx7
	+4Yo1D7QXDgRPU36s5TJx1ArOeju1VpVfcfpF1wEbagktJQsC8ahxO/pNj7NzvO8YauJZCV//DyXi
	im/gOWJhBXCJq4IVm+nvilMpUdWInj337MWTFe9+2kw9g+t4/R5rI+kWcjzZ8L395XNbV4q8MEtDa
	h9LGE0HrAydeP9pQn0vJ+O9tRwv0lhEi7ubw5/gxiE9WSog9pCTnlp5sY/Uu5g4rna895NX6/ayrE
	mHx3rF22koAoZQjMFIL7E67LeE6XDhZxsZNoF/2yC/lIKksL58o+oyGKRIVEIJ9puSRPB39JG32xn
	0FW4lqVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Tpk-00000003T4U-0a8u;
	Thu, 31 Oct 2024 11:59:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6To5-00000003SuG-0pjM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 11:57:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3BA5A43EF7;
	Thu, 31 Oct 2024 11:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13940C4CEE0;
	Thu, 31 Oct 2024 11:49:40 +0000 (UTC)
Date: Thu, 31 Oct 2024 11:49:38 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	anshuman.khandual@arm.com, gshan@redhat.com, james.morse@arm.com,
	shameerali.kolothum.thodi@huawei.com, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jing Zhang <jingzhangos@google.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 2/7] arm64: head.S: Initialise MPAM EL2 registers and
 disable traps
Message-ID: <ZyNu0mDR0aicfPrS@arm.com>
References: <20241030160317.2528209-1-joey.gouly@arm.com>
 <20241030160317.2528209-3-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030160317.2528209-3-joey.gouly@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_045741_357500_59C16F5B 
X-CRM114-Status: GOOD (  12.13  )
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

On Wed, Oct 30, 2024 at 04:03:12PM +0000, Joey Gouly wrote:
> From: James Morse <james.morse@arm.com>
> 
> Add code to head.S's el2_setup to detect MPAM and disable any EL2 traps.
> This register resets to an unknown value, setting it to the default
> parititons/pmg before we enable the MMU is the best thing to do.
> 
> Kexec/kdump will depend on this if the previous kernel left the CPU
> configured with a restrictive configuration.
> 
> If linux is booted at the highest implemented exception level el2_setup
> will clear the enable bit, disabling MPAM.
> 
> This code can't be enabled until a subsequent patch adds the Kconfig
> and cpufeature boiler plate.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

