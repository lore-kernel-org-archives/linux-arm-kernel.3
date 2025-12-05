Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A6BD2E008
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 06:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIo92LZ9GBEyQzV+BFKrFnfKVkO6IQsZzGx3HuizYL0=; b=f/pSMuxMQb/+hrK/mWxpVRHHIY
	YfqM2Zly5zIgKmfURCGZlyE3MOl7Ao/rGr6rtyN6KIACOZBgGUhuDV7wWbAxd133aaHqEnYQkvaak
	uG1EW9D9qsF0HK/H3u0Us3GCP6/pkKkYPv8sVUB2MbCXwgxoVXcq7OJHtPx5rp3ppk7LlzXKex8pg
	JIYsx8EGG/2ivcKPOZCCG2I3sI22Kg8FN3oSVLdIhOXmuSGrKsrQbLfkyVT81OeN0azFN1/dPtkj6
	iVhDh4keZ0sQm0K++5AzDuP1aBxgwBMZGfs/uM+OOsvY9O00OPCoNYIvniGLEnb52+NibqS00DthW
	H7iapDaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vROuK-000000094ct-3hdC;
	Fri, 05 Dec 2025 06:03:08 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vROuG-000000094bZ-3oca
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 06:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764914576; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=zIo92LZ9GBEyQzV+BFKrFnfKVkO6IQsZzGx3HuizYL0=;
	b=xHS4sZ6Y9xxmiRjSHeB+Sz0yVsl/e5E90ryIKtskKzcQjoU6aZ/24KKteRebioZRpwxw2lV6mwZeR4wtFB75w5paznwEatduiMBQIanhoi+QxdHnowO4ExyOoLZzBnLmGsRSo535A8tjk/KdZ9r8u4DEIKl9gDX66TshwszNvEE=
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0Wu6mAy7_1764914571 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 05 Dec 2025 14:02:51 +0800
Date: Fri, 5 Dec 2025 14:02:50 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH v3 6/9] KVM: arm64: Force trap of GMID_EL1 when the guest
 doesn't have MTE
Message-ID: <3v4gqr3eghu6gcruhhp2255pqq5s5nsaaowobaaqecpkp7an5v@vrntb3ggwecp>
References: <20251204094806.3846619-1-maz@kernel.org>
 <20251204094806.3846619-7-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204094806.3846619-7-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_220305_721263_0F4F4CA3 
X-CRM114-Status: GOOD (  13.38  )
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

Hi Marc,
On Thu, Dec 04, 2025 at 09:48:03AM +0800, Marc Zyngier wrote:
> If our host has MTE, but the guest doesn't, make sure we set HCR_EL2.TID5
> to force GMID_EL1 being trapped. Such trap will be handled by the
> FEAT_IDST handling.
>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index ae1e72df1ed45..2e94c423594eb 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -5558,6 +5558,8 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
>
>  	if (kvm_has_mte(vcpu->kvm))
>  		vcpu->arch.hcr_el2 |= HCR_ATA;
> +	else
> +		vcpu->arch.hcr_el2 |= HCR_TID5;

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>
>  	/*
>  	 * In the absence of FGT, we cannot independently trap TLBI
> --
> 2.47.3

