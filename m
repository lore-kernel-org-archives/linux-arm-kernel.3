Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5830AC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DE5zARm1WiMEsfgjTTF4N0W92kd6jmsXzW2TA0JqO4g=; b=aNRwYINWoY+IKZVk5npUatSTX8
	8ItwVH3yvsMK3EL1Njzct1S+0bQ5+6qZq4z1gRVoa0zdi/nC2vyPHOPCaVACUQRbFUV5jlxcsWZUg
	YWgoYtlieQ38yagX0LJsioICzYqc7Pj5Ad/qdQxaxwWQeTEG6Wq60afSc2GBuHZWyjpjXF+Cd2CSm
	5adgnzJz7OXFVLrK12CdS5L5BYwSvlVQO+72itJm/vrkhHniOJVmErd2nhozxUjkWdzFIXf7thaHC
	Me0EptWWpuFpXwo8qxp7eSMb7E1FzjdjvBy+fYIgaApvq6OeDmt7iKUosmJHRXG44CV2DZK7YDKux
	iAEjlYjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wUM-0000000G6yT-0TYJ;
	Fri, 11 Sep 2026 08:20:02 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wUI-0000000G6xb-0cik
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:20:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DE5zARm1WiMEsfgjTTF4N0W92kd6jmsXzW2TA0JqO4g=;
	b=pLvxGjqSDVVZWgMHGLKbmYAIWr8kI0PJBj/87XvcTbLIaUUwBBPvM4zXHtbqC5QTApKmrkpOV
	MJPHShVGAjcRSKjAbnaK2vII8KR1phaRwEwNbCagERmQXBdiOYYHB9rM7dWNVmO8jQib1n5BITS
	fJYK8/iSH+RtFpyuoVWlSOc=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hh6cy1D1WzLlX5;
	Fri, 11 Sep 2026 16:08:50 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id AB37E40565;
	Fri, 11 Sep 2026 16:19:45 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 11 Sep 2026 16:19:44 +0800
Message-ID: <aa37cd26-b870-47c7-abe9-75370a33f1d1@huawei.com>
Date: Fri, 11 Sep 2026 16:19:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/40] KVM: arm64: Preserve host MPAM configuration
 when changing traps
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<jonathan.cameron@huawei.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>,
	<zengheng4@huawei.com>, <linux-doc@vger.kernel.org>, Shaopeng Tan
	<tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-5-ben.horgan@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260313144617.3420416-5-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_011958_791783_E395EDAC 
X-CRM114-Status: GOOD (  18.28  )
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



在 2026/3/13 22:45, Ben Horgan 写道:
> When KVM enables or disables MPAM traps to EL2 it clears all other bits in
> MPAM2_EL2.  Notably, it clears the partition ids (PARTIDs) and performance
> monitoring groups (PMGs). Avoid changing these bits in anticipation of
> adding support for MPAM in the kernel. Otherwise, on a VHE system with the
> host running at EL2 where MPAM2_EL2 and MPAM1_EL1 access the same register,
> any attempt to use MPAM to monitor or partition resources for kernel space
> would be foiled by running a KVM guest. Additionally, MPAM2_EL2.EnMPAMSM is
> always set to 0 which causes MPAMSM_EL1 to always trap. Keep EnMPAMSM set
> to 1 when not in a guest so that the kernel can use MPAMSM_EL1.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Acked-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index 2597e8bda867..0b50ddd530f3 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -267,7 +267,8 @@ static inline void __deactivate_traps_hfgxtr(struct kvm_vcpu *vcpu)
>  
>  static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
>  {
> -	u64 r = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1;
> +	u64 clr = MPAM2_EL2_EnMPAMSM;
> +	u64 set = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1;
>  
>  	if (!system_supports_mpam())
>  		return;
> @@ -277,18 +278,21 @@ static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
>  		write_sysreg_s(MPAMHCR_EL2_TRAP_MPAMIDR_EL1, SYS_MPAMHCR_EL2);
>  	} else {
>  		/* From v1.1 TIDR can trap MPAMIDR, set it unconditionally */
> -		r |= MPAM2_EL2_TIDR;
> +		set |= MPAM2_EL2_TIDR;
>  	}
>  
> -	write_sysreg_s(r, SYS_MPAM2_EL2);
> +	sysreg_clear_set_s(SYS_MPAM2_EL2, clr, set);
>  }
>  
>  static inline void __deactivate_traps_mpam(void)
>  {
> +	u64 clr = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1 | MPAM2_EL2_TIDR;
> +	u64 set = MPAM2_EL2_EnMPAMSM;

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +
>  	if (!system_supports_mpam())
>  		return;
>  
> -	write_sysreg_s(0, SYS_MPAM2_EL2);
> +	sysreg_clear_set_s(SYS_MPAM2_EL2, clr, set);
>  
>  	if (system_supports_mpam_hcr())
>  		write_sysreg_s(MPAMHCR_HOST_FLAGS, SYS_MPAMHCR_EL2);


