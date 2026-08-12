Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD58EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JL3ym/m7B2Lj/F5920epHyUrdlsd/N7hUJ6fY3MDCww=; b=gLGgpMPWyoNySYuZ0sLqj8XHfL
	Scmrdnp0BfmtuIsLejWrTB1npzzxUqZ1f6xacDwVLIVNio39X9sa0ngzvO9qbNt1qeRqmRBNJSE40
	cHVzpL075hs76UNJP7BECiClEntJLxHodmcAvkjlwVzkENAz6fOfLsh7c0afE9WlsGk1TOR8ckxMu
	8HylGnAR93eoWA3iRRuI2cYUQ8nHJkyob2NyTE7imxBNwHPP7Gmxkwgawn5K1n5Fqw0dlHLkGDDD7
	g4Z3irCHWhHwx4NJ/xxpMNjANs57kUcUPpqrHr50QgxDR//88boSk0uYgHFjSdn/ynmIpk33wb8Ub
	cGFFqM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9Ew-0000000GJWD-17Fi;
	Wed, 12 Aug 2026 13:43:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9Es-0000000GJVX-3FtH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:43:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BE16153B;
	Wed, 12 Aug 2026 06:43:21 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E4563F66F;
	Wed, 12 Aug 2026 06:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786542205; bh=m/vxrrX8z+05JeaPz5hzIwTbbMakrEQQh0BPBp9z378=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQdi2E2ruUznlpNz9wyBxM5/1YHCirBSne1uR66NxfMMcJNEF4Qf4Nd/Pw8Mn8PKL
	 +KWqd8OsDnqzeXipkEOa+DCrZzgHsSe5AdxFZfVV3Fmt6XZoVlkFrFnmsL9H9WG7ej
	 fjjCOrunT0aa5yxbgZuMPrhzbHY0KYmB2cW0zKJI=
Date: Wed, 12 Aug 2026 14:43:21 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oupton@kernel.org" <oupton@kernel.org>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>
Subject: Re: [PATCH v2 2/4] KVM: arm64: vgic: Prevent speculative SPI array
 underflow
Message-ID: <anx4eaMeaAumku9G@e143914.arm.com>
References: <20260811150941.941295-1-sascha.bischoff@arm.com>
 <20260811150941.941295-3-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811150941.941295-3-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_064326_914511_A371A3A2 
X-CRM114-Status: GOOD (  19.20  )
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

On Tue, Aug 11, 2026 at 03:10:47PM +0000, Sascha Bischoff wrote:
> For a non-GICv5 VM, SPI interrupt IDs include the private-interrupt
> offset, while KVM's SPI array is indexed from zero. The lookup applies
> array_index_nospec() to the absolute interrupt ID and subtracts the
> private-interrupt offset afterwards.
> 
> On a speculative bypass of the range check for an interrupt ID below
> the private range, the clamp preserves the small absolute value and
> the subtraction underflows to an out-of-bounds SPI array index.
> 
> Convert the interrupt ID to a zero-based index into the SPI array
> before applying array_index_nospec(). This way, we ensure that we
> clamp to a reachable SPI ID, rather than an out-of-range SPI index.
> 
> Fixes: 41b87599c743 ("KVM: arm/arm64: vgic: fix possible spectre-v1 in vgic_get_irq()")
> Link: https://sashiko.dev/#/patchset/20260724104819.1296803-1-sascha.bischoff@arm.com?part=27
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/vgic/vgic.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> index 74bace10a22ed..352d52bd6315c 100644
> --- a/arch/arm64/kvm/vgic/vgic.c
> +++ b/arch/arm64/kvm/vgic/vgic.c
> @@ -93,8 +93,9 @@ struct vgic_irq *vgic_get_irq(struct kvm *kvm, u32 intid)
>  	/* SPIs */
>  	if (intid >= VGIC_NR_PRIVATE_IRQS &&
>  	    intid < (kvm->arch.vgic.nr_spis + VGIC_NR_PRIVATE_IRQS)) {
> -		intid = array_index_nospec(intid, kvm->arch.vgic.nr_spis + VGIC_NR_PRIVATE_IRQS);
> -		return &kvm->arch.vgic.spis[intid - VGIC_NR_PRIVATE_IRQS];
> +		intid -= VGIC_NR_PRIVATE_IRQS;
> +		intid = array_index_nospec(intid, kvm->arch.vgic.nr_spis);
> +		return &kvm->arch.vgic.spis[intid];
>  	}
>  
>  	/* LPIs */

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

