Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C85FF60C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 04:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndBUhcYREwyT73swQeBsr9e9GtqbT3xqQkNm76RxoiY=; b=sFyC+NuYT23dpiNzdX8+k5Q79+
	BlK9IH0MNFOX+a+lCGG63bYn+yM8p1pLOYub1192RRV5Rh/zkIkhXksjcZTiMNcus5dfuP8D4q2I2
	Cpe2Lxsgk+/8XxZPNHAEt3oo4yyDghPiQ3I+z1EH45i2XPTyR1LBLafNhRkP8P0cEw1L6r2NTw+xL
	M2Kh/NQg3MW1vu1ftmolJesmGH1ocUEhUBBALY+tkX3obMHD+6UyAbL0UXdagQOnI/Bt+xlBwBhwq
	vnk3i/05eKO8RlypkJVvuNPe06JFOvG4HQLb4VZemhPjyE7+LTg5LyMjJsLPVkGhx33F7WhHTZAsr
	sUV+NIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7QmH-0000000CHMY-3oQU;
	Tue, 31 Mar 2026 04:32:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7QmE-0000000CHM8-3YUo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 04:32:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8F2E1F91;
	Mon, 30 Mar 2026 21:32:22 -0700 (PDT)
Received: from [10.57.18.211] (unknown [10.57.18.211])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 813BB3F7D8;
	Mon, 30 Mar 2026 21:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774931548; bh=iUSmJen7EHvJbWNsD+5iM8jJX4poJCJT5ye2J7z9dkI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d/Vl+mYCWsLfdTiQ5ngQ+k7Gurmy3gcTv3lv/p1eD2ft61bcNanUrqx+Yuw8yLenA
	 ZskW+RkhwJtS5+/Ocx6Czyxz+CeEmV9hK4NJoY4nuN2OQtmeLquf7ty6hbUNihEFak
	 IcFVBz8ylhZXE2uh0yYgVJtp9lA1HEqjqjOforVA=
Message-ID: <f606d3f7-0aef-47a4-ae2f-abc4f163d69f@arm.com>
Date: Tue, 31 Mar 2026 10:02:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/30] KVM: arm64: Simplify return logic in
 user_mem_abort()
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260327113618.4051534-1-maz@kernel.org>
 <20260327113618.4051534-10-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260327113618.4051534-10-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_213231_023414_0609AB41 
X-CRM114-Status: GOOD (  17.02  )
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

On 27/03/26 5:05 PM, Marc Zyngier wrote:
> From: Fuad Tabba <tabba@google.com>
> 
> With the refactoring done, the final return block of user_mem_abort()
> can be tidied up a bit more.
> 
> Clean up the trailing edge by dropping the unnecessary assignment,
> collapsing the return evaluation for kvm_s2_fault_compute_prot(), and
> tail calling kvm_s2_fault_map() directly.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/kvm/mmu.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1b991300735be..e77b0b60697f6 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2005,22 +2005,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	if (ret != 1)
>  		return ret;
>  
> -	ret = 0;
> -
>  	ret = kvm_s2_fault_compute_prot(fault);
> -	if (ret == 1) {
> -		ret = 1; /* fault injected */
> -		goto out_put_page;
> +	if (ret) {
> +		kvm_release_page_unused(fault->page);
> +		return ret;
>  	}
> -	if (ret)
> -		goto out_put_page;
>  
> -	ret = kvm_s2_fault_map(fault, memcache);
> -	return ret;
> -
> -out_put_page:
> -	kvm_release_page_unused(fault->page);
> -	return ret;
> +	return kvm_s2_fault_map(fault, memcache);
>  }
>  
>  /* Resolve the access fault by making the page young again. */


