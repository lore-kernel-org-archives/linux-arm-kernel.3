Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3231CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 08:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3eKQ6GmE7pEudYvJGiXiRGd4Lj+JI9MJxwq8aQwohs=; b=2S2Vgo1NSO83tx/dn1CQx3b1/y
	spVQkVV1oA71H4/BtKV8so3gXGylfWc/+Lit6Hh6ITa/TMrsFEcxo9NgJT5k8FY9RENSxsILGobjy
	h142LSUIMoE1lUATshcb9aiI/lkS3rLkxHsfxzhgoMOeBv7uq54L1c3m2STx4LKos3DltctlmNN0j
	/qdDy+EncKq0u9IqOGtbUdu7vqE6mTr1jbW7WqeYg3LOWoZCabXDc3JtjtXW3YWzAMw09fVAc9T/w
	9bKpsyDA2GCLMYNSeQUFUbagK1ri4JVQHI+i50gnsOONsMCN3jOz2YlCuhwOcmWp0Iac455SABHY8
	ZmZpyjuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9Sn-0000000EDCG-0iAy;
	Fri, 11 Jul 2025 08:50:37 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8ib-0000000E4AP-2aTI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:02:55 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bdkbk4QFCzXfBn;
	Fri, 11 Jul 2025 15:58:10 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 423211402CC;
	Fri, 11 Jul 2025 16:02:37 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 11 Jul 2025 16:02:36 +0800
Subject: Re: [PATCH] KVM: arm64: fix u64_replace_bits() usage
To: Arnd Bergmann <arnd@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Joey Gouly <joey.gouly@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Mark Brown <broonie@kernel.org>, James
 Morse <james.morse@arm.com>, Sebastian Ott <sebott@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <20250711072752.2781647-1-arnd@kernel.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <60a9ec28-cf1a-a504-25f6-523471732f38@huawei.com>
Date: Fri, 11 Jul 2025 16:02:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20250711072752.2781647-1-arnd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_010253_820996_20DD4DB3 
X-CRM114-Status: GOOD (  17.62  )
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

On 2025/7/11 15:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> u64_replace_bits() returns a modified word but does not actually modify
> its argument, as pointed out by this new warning:
> 
> arch/arm64/kvm/sys_regs.c: In function 'access_mdcr':
> arch/arm64/kvm/sys_regs.c:2654:17: error: ignoring return value of 'u64_replace_bits' declared with attribute 'warn_unused_result' [-Werror=unused-result]
>  2654 |                 u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
> 
> The intention here must have been to update 'val', so do that instead.
> 
> Fixes: efff9dd2fee7 ("KVM: arm64: Handle out-of-bound write to MDCR_EL2.HPMN")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/kvm/sys_regs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 33aa4f5071b8..793fb19bebd6 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2651,7 +2651,7 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
>  	 */
>  	if (hpmn > vcpu->kvm->arch.nr_pmu_counters) {
>  		hpmn = vcpu->kvm->arch.nr_pmu_counters;
> -		u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
> +		val = u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
>  	}
>  
>  	__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);

Already fixed by Ben's patch [*], thanks!

[*]
https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git/commit/?h=fixes&id=2265c08ec393ef1f5ef5019add0ab1e3a7ee0b79

Zenghui

