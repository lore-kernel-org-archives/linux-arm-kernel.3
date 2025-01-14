Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DD5C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 11:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wqXI6CyENxSmPvQ3J3pe6HFrLkWbh8jBi/thSfMFqk=; b=uqAOB/a3FG8ShrIS1whYrBeKxM
	vV6bwD+1lI/eG0vzs/yX0qHxHjzSh65cUXHPkNfRpH5t8ZLRkBtGJOC1pKWW25uefmazGFCRwvtcg
	B/Ws2zqTAQxWRX+lPmGyNQyK8bC7xrgVlB/MIZAXByEcDToPZVL7twewmli9+7R0FNJYWn6Gfaq8G
	sTAEZ8U7hJJQrgWiRnaeHAh/QuKQU6+qKpT8i0UmDE9ie+R+LHHP4cWczcoGxDzAkBMPJC/IERG0K
	FZju8lpCuQ+ZEFrgtQAwlW33ZGlochHtgWTYoS3Esh96l03xUYb2q6oWtJ0K3P7sINLxPbL/vjRcK
	Ypf7Q9Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXesU-00000008Dfq-0b3j;
	Tue, 14 Jan 2025 11:14:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXerE-00000008DWg-1rL4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 11:13:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33F4C11FB;
	Tue, 14 Jan 2025 03:13:42 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A99BF3F66E;
	Tue, 14 Jan 2025 03:13:12 -0800 (PST)
Date: Tue, 14 Jan 2025 11:13:07 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 0/2] KVM: arm64: nv: Fix sysreg RESx-ication
Message-ID: <20250114111307.GA3312699@e124191.cambridge.arm.com>
References: <20250112165029.1181056-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112165029.1181056-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_031316_524953_49CC2B9C 
X-CRM114-Status: GOOD (  20.17  )
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

On Sun, Jan 12, 2025 at 04:50:27PM +0000, Marc Zyngier wrote:
> Joey recently reported that some rather basic tests were failing on
> NV, and managed to track it down to critical register fields (such as
> HCR_EL2.E2H) not having their expect value.
> 
> Further investigation has outlined a couple of critical issues:
> 
> - Evaluating HCR_EL2.E2H must always be done with a sanitising
>   accessor, no ifs, no buts. Given that KVM assumes a fixed value for
>   this bit, we cannot leave it to the guest to mess with.
> 
> - Resetting the sysreg file must result in the RESx bits taking
>   effect. Otherwise, we may end-up making the wrong decision (see
>   above), and we definitely expose invalid values to the guest. Note
>   that because we compute the RESx masks very late in the VM setup, we
>   need to apply these masks at that particular point as well.
> 
> The two patches in this series are enough to fix the current set of
> issues, but __vcpu_sys_reg() needs some extra work as it is doing the
> wrong thing when used as a lvalue. I'll post a separate series for
> that, as the two problems are fairly orthogonal, and this results in a
> significant amount of churn.
> 
> All kudos to Joey for patiently tracking that one down. This was
> hidden behind a myriad of other issues, and nailing this sucker down
> is nothing short of a debugging lesson. Drinks on me next time.
> 
> Unless someone shouts, I'll take this in for 6.14.
> 

Testing using the updated kvm-arm64/nv-next branch:
Tested-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks!
Joey

> Marc Zyngier (2):
>   KVM: arm64: nv: Always evaluate HCR_EL2 using sanitising accessors
>   KVM: arm64: nv: Apply RESx settings to sysreg reset values
> 
>  arch/arm64/include/asm/kvm_emulate.h | 36 ++++++++++++----------------
>  arch/arm64/include/asm/kvm_nested.h  |  2 +-
>  arch/arm64/kvm/hyp/vhe/sysreg-sr.c   |  4 ++--
>  arch/arm64/kvm/nested.c              |  9 +++++--
>  arch/arm64/kvm/sys_regs.c            |  5 +++-
>  5 files changed, 29 insertions(+), 27 deletions(-)
> 
> -- 
> 2.39.2
> 

