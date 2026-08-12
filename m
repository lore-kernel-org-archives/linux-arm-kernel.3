Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32DBC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 12:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmhoMmaAz+CvujGyBRDlgisDo1zbLEudFEwzXdr106U=; b=FGSe0W62Q+s7sunWYYkk+5utn7
	CLCT+nSiU7pmuaEsBO4Ef6T6UGiNdYuLLUyjqyt/zdC/KYtFai8m5BRC4QALM85OWQVphcvLzPJZL
	RcMZypBNLTiBz/5mVDgu+RzT35KL2QuwIe5oqDnySH2xio139Pns8Hjh9MAMyAx96Beu24az6wL/s
	JrNWQQrMLVIvWYZ3Z9HERMq03Jkbly4Qeoatx3TnKMnNn3rcnIGL4WvNuWqZDiiktU4YGv+IQpOiC
	eQZ/Yec9BP1YVMwyKyJ+/W9doAfkUdG0ep9VDkcMr0SGrIz1UbkkFGXmOI8iNznaGPxbUDNvU8DIy
	g3yG45DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8VW-0000000GEX4-2pmn;
	Wed, 12 Aug 2026 12:56:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8VU-0000000GEWW-2IHy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 12:56:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48F081596;
	Wed, 12 Aug 2026 05:56:27 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F2AD3F632;
	Wed, 12 Aug 2026 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786539391; bh=qCQ5vVd9hvs873dfwrrsv7PJkSHkES7vZkCYqGWPE38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tg5/dqGqlXnBTt/6+eVWrJsiAx2QzQF4N2wLDifhSBPmkYPN6qMBSmlRpSiXkJ4UD
	 9i/hfZzC1zpZcehx0GqCXtkYBp+oI5vhQcYx7aSCNAoGY7kLoEVEsZBAp+WU02tSq3
	 RuQb9J5AVwo3WYH1plawk5dFNrQd2HKhvJUzz2uQ=
Date: Wed, 12 Aug 2026 13:56:27 +0100
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
Subject: Re: [PATCH v2 3/4] KVM: arm64: vgic: Reject out-of-range GICv5 PPI
 IDs
Message-ID: <anxte33cYsGjjoC5@e143914.arm.com>
References: <20260811150941.941295-1-sascha.bischoff@arm.com>
 <20260811150941.941295-4-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811150941.941295-4-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_055632_705373_089CE641 
X-CRM114-Status: GOOD (  16.77  )
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

On Tue, Aug 11, 2026 at 03:11:18PM +0000, Sascha Bischoff wrote:
> GICv5 supports up to 128 PPIs, but KVM currently implements only the
> first 64, which contain the architected PPIs it supports.
> 
> An encoded PPI with an ID outside that range passes irq_is_ppi(),
> which only checks the encoded interrupt type. vgic_get_vcpu_irq()
> therefore looks it up in private_irqs[], where array_index_nospec()
> clamps the out-of-range index to zero and aliases PPI 0.
> 
> Include the supported PPI range in irq_is_ppi() so that KVM interfaces
> reject unsupported PPIs. Also reject an out-of-range PPI in the lookup
> as a safeguard against callers bypassing the predicate.
> 
> Fixes: 4d591252bacb ("KVM: arm64: gic-v5: Implement PPI interrupt injection")
> Fixes: eb8bce08ecb1 ("KVM: arm64: gic: Introduce interrupt type helpers")
> Link: https://sashiko.dev/#/patchset/20260724104819.1296803-1-sascha.bischoff@arm.com?part=27
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/vgic/vgic.c | 2 ++
>  include/kvm/arm_vgic.h     | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> index 352d52bd6315c..b25303d9919fd 100644
> --- a/arch/arm64/kvm/vgic/vgic.c
> +++ b/arch/arm64/kvm/vgic/vgic.c
> @@ -118,6 +118,8 @@ struct vgic_irq *vgic_get_vcpu_irq(struct kvm_vcpu *vcpu, u32 intid)
>  		switch (type) {
>  		case KVM_DEV_TYPE_ARM_VGIC_V5:
>  			intid = vgic_v5_get_hwirq_id(intid);
> +			if (intid >= VGIC_V5_NR_PRIVATE_IRQS)
> +				return NULL;
>  			intid = array_index_nospec(intid, VGIC_V5_NR_PRIVATE_IRQS);
>  			break;
>  		default:
> diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
> index cefddc9c621de..1a549cceecbec 100644
> --- a/include/kvm/arm_vgic.h
> +++ b/include/kvm/arm_vgic.h
> @@ -65,6 +65,8 @@
>  		switch (t) {						\
>  		case KVM_DEV_TYPE_ARM_VGIC_V5:				\
>  			__ret = is_v5_type(GICV5_HWIRQ_TYPE_PPI, (i));	\
> +			__ret &= FIELD_GET(GICV5_HWIRQ_ID, (i)) <	\
> +				 VGIC_V5_NR_PRIVATE_IRQS;		\
>  			break;						\
>  		default:						\
>  			__ret  = (i) >= VGIC_NR_SGIS;			\

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

