Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E800C9EC8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QDz37KWIrGKJmQRekuQKacEiOZ1Lh9GBBMBkejVJro=; b=fvRibUuEHsRHxCB6oDF++TX5nz
	fBmw/jO8TJnO9qikqFCxB7mwa9P2teiLcBDF01R7Rbt5yU+8JQYX2Y8clxPch/DIXfgNJRAR7CaK1
	K/NCiKlPV0+g7zLyHfTl+XjZwB0f1mZdhTIHrr9JJe3sx+ZjR+Td1CpkFL7QYpU1NzuNz/Ye39mrq
	IYj+k6qFm3lKvj+FCeEAf4xcXRFskUXzlmjHPV5m3uJZtHo5qI4BC6Ly9nNA/l0MSqSBvPl5rq+2J
	IytOEz//N2YPfdikvmdBEAj3DnoVK5qI1Vk0AIEURXE+X5dt8W2Kg3Zm0ezLkcyBSZeXcCN9eAswi
	tbBHG0RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIT8-00000005TPp-1jDu;
	Mon, 12 Jan 2026 14:00:30 +0000
Received: from sinmsgout03.his.huawei.com ([119.8.177.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIT4-00000005TPJ-0td7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:00:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1QDz37KWIrGKJmQRekuQKacEiOZ1Lh9GBBMBkejVJro=;
	b=dsO1e1XRukv1/4C1Ssa5Dt7L+oNZgx+wsDpv1BD/+3tYI7wsWgnkFE9a8ZWtf22ug5Y6wYg16
	CWKdyMt8QDhg8efVl8MXtHdrlKm5DoIUwXNqtvoB8NSzZ8XpEzqkyO7eBAToCFNFu3oEUV4+AYZ
	k1g2pbfBy2MCLh+tJlMVbxc=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4dqYqT5k00zMyRj;
	Mon, 12 Jan 2026 21:57:57 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dqYsp4tH5zJ46F2;
	Mon, 12 Jan 2026 21:59:58 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 2673C40585;
	Mon, 12 Jan 2026 22:00:10 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 12 Jan
 2026 14:00:09 +0000
Date: Mon, 12 Jan 2026 14:00:07 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd
	<nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes
	<Timothy.Hayes@arm.com>
Subject: Re: [PATCH v3 02/36] KVM: arm64: gic-v3: Switch vGIC-v3 to use
 generated ICH_VMCR_EL2
Message-ID: <20260112140007.00002391@huawei.com>
In-Reply-To: <20260109170400.1585048-3-sascha.bischoff@arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
	<20260109170400.1585048-3-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_060027_126863_BB74E011 
X-CRM114-Status: GOOD (  20.04  )
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

On Fri, 9 Jan 2026 17:04:39 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> From: Sascha Bischoff <Sascha.Bischoff@arm.com>
> 
> The VGIC-v3 code relied on hand-written definitions for the
> ICH_VMCR_EL2 register. This register, and the associated fields, is
> now generated as part of the sysreg framework. Move to using the
> generated definitions instead of the hand-written ones.
> 
> There are no functional changes as part of this change.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

Hi Sascha,

A couple of trivial things inline that you can feel free to ignore.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  arch/arm64/include/asm/sysreg.h      | 21 ---------
>  arch/arm64/kvm/hyp/vgic-v3-sr.c      | 68 ++++++++++------------------
>  arch/arm64/kvm/vgic/vgic-v3-nested.c |  8 ++--
>  arch/arm64/kvm/vgic/vgic-v3.c        | 48 +++++++++-----------
>  4 files changed, 50 insertions(+), 95 deletions(-)

> diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> index 0b670a033fd87..ff10fc71fcd5d 100644
> --- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
> +++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c


> @@ -1064,9 +1047,10 @@ static void __vgic_v3_read_ctlr(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
>  	/* A3V */
>  	val |= ((vtr >> 21) & 1) << ICC_CTLR_EL1_A3V_SHIFT;
>  	/* EOImode */
> -	val |= ((vmcr & ICH_VMCR_EOIM_MASK) >> ICH_VMCR_EOIM_SHIFT) << ICC_CTLR_EL1_EOImode_SHIFT;
> +	val |= FIELD_PREP(ICC_CTLR_EL1_EOImode_MASK,
> +			  FIELD_GET(ICH_VMCR_EL2_VEOIM, vmcr));
>  	/* CBPR */
> -	val |= (vmcr & ICH_VMCR_CBPR_MASK) >> ICH_VMCR_CBPR_SHIFT;
> +	val |= FIELD_GET(ICH_VMCR_EL2_VCBPR, vmcr);

This one makes me a tiny bit nervous because it's not obvious that this
is kind of FIELD_PREP(FIELD_GET()) like the EOIMode above.

Only a tiny bit though, so it's fine as is.


>  
>  	vcpu_set_reg(vcpu, rt, val);
>  }
> @@ -1075,15 +1059,11 @@ static void __vgic_v3_write_ctlr(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
>  {
>  	u32 val = vcpu_get_reg(vcpu, rt);
>  
> -	if (val & ICC_CTLR_EL1_CBPR_MASK)
> -		vmcr |= ICH_VMCR_CBPR_MASK;
> -	else
> -		vmcr &= ~ICH_VMCR_CBPR_MASK;
> +	FIELD_MODIFY(ICH_VMCR_EL2_VCBPR, &vmcr,
> +		     FIELD_GET(ICC_CTLR_EL1_CBPR_MASK, val));

I'm not laughing at all and the _MASK here because that header
only defines the MASK form, even for single bits :)


>  
> -	if (val & ICC_CTLR_EL1_EOImode_MASK)
> -		vmcr |= ICH_VMCR_EOIM_MASK;
> -	else
> -		vmcr &= ~ICH_VMCR_EOIM_MASK;
> +	FIELD_MODIFY(ICH_VMCR_EL2_VEOIM, &vmcr,
> +		     FIELD_GET(ICC_CTLR_EL1_EOImode_MASK, val));
>  
>  	write_gicreg(vmcr, ICH_VMCR_EL2);
>  }

