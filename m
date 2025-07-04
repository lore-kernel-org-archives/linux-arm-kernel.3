Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCEBC83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 06:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCUK/t7X+pIOse8Uf1Inai7L3EMmExK5q+I9AWRkSeQ=; b=JudowDSVvbNV7SJfHC6d1SkC+A
	h97+OxW+EQuO30WxnkLLO1L6C9FMSJve+YpHrj95IcUMzlK004S7bhJQbwymvV+OAPxeeH2r8IH6u
	dW+6QDxJbN8cZaxDLpMp+FcHeErIWxAMNHu5GoYzvEbSc9pX+J/noJ32stYjmuhOPSBuhWBWr08Pl
	H1nOXJfZviyXSuuscaFcVwwt1PelYO8Rf+hARoQFT3oSGHftxwOoDkU3/043BWzzJXcjJh/OkkB1S
	W7eHacNMci/7KzLlrQuDBstDkOTShb9z/O1jdl4xAL+fQc9NvxUh9/k/2q48c/DVfPleQPrN5eTOi
	gqIdOvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaCe-0000000DSh7-0vQ3;
	Fri, 04 Jul 2025 06:47:20 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaAH-0000000DSFw-0FfC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 06:44:55 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bYPG45GX2z2BdVd;
	Fri,  4 Jul 2025 14:42:52 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id F24791A016C;
	Fri,  4 Jul 2025 14:44:40 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 4 Jul 2025 14:44:39 +0800
Subject: Re: [PATCH 1/2] KVM: arm64: Fix enforcement of upper bound on
 MDCR_EL2.HPMN
To: Ben Horgan <ben.horgan@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
	<linux-kernel@vger.kernel.org>, <james.morse@arm.com>,
	<stable@vger.kernel.org>
References: <20250703135729.1807517-1-ben.horgan@arm.com>
 <20250703135729.1807517-2-ben.horgan@arm.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <ca3054b2-b053-3859-a992-09499809d4d4@huawei.com>
Date: Fri, 4 Jul 2025 14:44:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20250703135729.1807517-2-ben.horgan@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_234453_296593_FF9DB528 
X-CRM114-Status: GOOD (  15.08  )
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

On 2025/7/3 21:57, Ben Horgan wrote:
> Previously, u64_replace_bits() was used to no effect as the return value
> was ignored. Convert to u64p_replace_bits() so the value is updated in
> place.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Fixes: efff9dd2fee7 ("KVM: arm64: Handle out-of-bound write to MDCR_EL2.HPMN")
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/kvm/sys_regs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 76c2f0da821f..c20bd6f21e60 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2624,7 +2624,7 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
>  	 */
>  	if (hpmn > vcpu->kvm->arch.nr_pmu_counters) {
>  		hpmn = vcpu->kvm->arch.nr_pmu_counters;
> -		u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
> +		u64p_replace_bits(&val, hpmn, MDCR_EL2_HPMN);
>  	}
>  
>  	__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

Thanks!

