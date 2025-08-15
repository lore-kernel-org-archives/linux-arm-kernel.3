Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B784BCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQFhDMG6wtC0xbgPYPLGvT/+vu5ckjHmrmodQJCw2rk=; b=u2lxMcWG+55nFKXEpj5l2VQFKJ
	ry8rZMMJT4ZzFzKZVsxStZuDfJz4o/F0lWYDqoh2umKVeyDrPpLoVPTETOUF+vMlUXg4X2j9nDKv3
	NdeXLnCetyrLXBWIk/PaBQfTTdTbeROFG3tfTEjRmtf1V1PUvFQRtPNdJWSU3O2OkFxkRGEkVAdOj
	PsW8mB0p8+MBP9PDLWzlsj3xV+Rvp/1RICTm2BXlhEphXNizOeuRPPdQjyASPg0yNjykLacKWQ1so
	PZWT9UdWDHWpMJkRykMVnJw05ztWy+qoy7VWJLuLw6t+cyFr8KI/r7XbgU9Vs0sX7/mAOqAhR76GB
	KrRVsOBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvCI-00000002gpc-1xht;
	Fri, 15 Aug 2025 14:14:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsZ0-00000002KXS-43jy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:25:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D2B71691;
	Fri, 15 Aug 2025 04:25:30 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB5673F63F;
	Fri, 15 Aug 2025 04:25:36 -0700 (PDT)
Message-ID: <9338d248-1392-414f-8bbe-dedce8cb048c@arm.com>
Date: Fri, 15 Aug 2025 12:25:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Correctly populate FAR_EL2 on nested SEA
 injection
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>
References: <20250813163747.2591317-1-maz@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250813163747.2591317-1-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_042539_054372_DFE04EBC 
X-CRM114-Status: GOOD (  14.40  )
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

This patch looks good to me. Just a typo in the commit message.

On 8/13/25 17:37, Marc Zyngier wrote:
> vcoy_write_sys_reg()'s signature is not totally obvious, and it
typo: s/vcoy/vcpu/
> is rather easy to write something that looks correct, except that...
> Oh wait...
> 
> Swap addr and FAR_EL2 to restore some sanity in the nested SEA
> department.
> 
> Fixes: 9aba641b9ec2a ("KVM: arm64: nv: Respect exception routing rules for SEAs")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>   arch/arm64/kvm/emulate-nested.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 90cb4b7ae0ff7..af69c897c2c3a 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -2833,7 +2833,7 @@ int kvm_inject_nested_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr)
>   			     iabt ? ESR_ELx_EC_IABT_LOW : ESR_ELx_EC_DABT_LOW);
>   	esr |= ESR_ELx_FSC_EXTABT | ESR_ELx_IL;
>   
> -	vcpu_write_sys_reg(vcpu, FAR_EL2, addr);
> +	vcpu_write_sys_reg(vcpu, addr, FAR_EL2);
>   
>   	if (__vcpu_sys_reg(vcpu, SCTLR2_EL2) & SCTLR2_EL1_EASE)
>   		return kvm_inject_nested(vcpu, esr, except_type_serror);

Thanks,

Ben


