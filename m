Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46AACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 13:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2c11198VsY+oz/CIp0xQBhtrP4p/c0jMKwxdakbhgK0=; b=K7Yfm8fxXpQMvm1u+1FZRI2XIp
	PhzVC4nokXMuIpwGH1tX2bQpVXYNg/HUdAse6eogbZUoQ9eSR2j+djNgOSiGnwVeifdnWSQhGlFlD
	kKK+/MejllGZ5eRedzJQuobSGIDytZm+Ms2O1FbIGWS88d9k7/qO1qVKQiIO+flIBxgdHotTQrnoD
	G8abdyf45WR0WBoY7+18vY2rNviE+b8ZtWnVd01VqJk89MDNFKAjy89hQNr7OatKaROzLr64aVbm2
	2eebbu09MRuvcjXxIW1wArWuB3M7pH9uxlOQ4n02UC7iLwZhjF8YEYul3LUgIgPFKzkj6A0PbdDQx
	MJm6NkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhNn-00000004kEP-44OH;
	Wed, 20 May 2026 13:54:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhNl-00000004kDu-3TsH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 13:54:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE58028C7;
	Wed, 20 May 2026 06:54:37 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF3413F632;
	Wed, 20 May 2026 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779285282; bh=/RmDA6+Bl7H/V0dVFxBbUuFNuutxEkFoHlUy6TU9LOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DCUht/4z8YOxEl7qvK/IkpWfUlEHN+FDmEpu2UGWV3eBWkKCIKwXVn6ZI9q3ZHQNt
	 Tby0Ncxg05qzRlWKmw6gamgpJyj9mASdHwSgKWHWQeEDPKv9UFdPt80us3oL8UkjHH
	 aNtwH7fc9o8/zp/KwnYau84O3qcZEfeaewFYc/W4=
Date: Wed, 20 May 2026 14:54:39 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: Re: [PATCH v2 10/18] KVM: arm64: vgic-v5: Add missing trap handing
 for NV triage
Message-ID: <20260520135439.GB4027812@e124191.cambridge.arm.com>
References: <20260520091949.542365-1-maz@kernel.org>
 <20260520091949.542365-11-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520091949.542365-11-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_065445_909684_BF2BB647 
X-CRM114-Status: GOOD (  18.70  )
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

On Wed, May 20, 2026 at 10:19:41AM +0100, Marc Zyngier wrote:
> From: Sascha Bischoff <sascha.bischoff@arm.com>
> 
> As things stand, there is no support for Nested Virt with GICv5 guests
> yet. However, this is coming and therefore we need to be able to
> correctly triage the traps when running with NV.
> 
> Add the missing fgtreg lookups required for that to
> triage_sysreg_trap(). These are specific to the FGT regs added as part
> of GICv5:
>    * ICH_HFGRTR_EL2
>    * ICH_HFGWTR_EL2
>    * ICH_HFGITR_EL2
> 
> Fixes: 9d6d9514c08f "(KVM: arm64: gic-v5: Support GICv5 FGTs & FGUs")
> Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/emulate-nested.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index dba7ced74ca5e..a4eb36b4c4421 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -2631,6 +2631,14 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
>  		fgtreg = HFGITR2_EL2;
>  		break;
>  
> +	case ICH_HFGRTR_GROUP:
> +		fgtreg = is_read ? ICH_HFGRTR_EL2 : ICH_HFGWTR_EL2;
> +		break;
> +
> +	case ICH_HFGITR_GROUP:
> +		fgtreg = ICH_HFGITR_EL2;
> +		break;
> +
>  	default:
>  		/* Something is really wrong, bail out */
>  		WARN_ONCE(1, "Bad FGT group (encoding %08x, config %016llx)\n",
> -- 
> 2.47.3
> 

