Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8D6C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 18:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPpGE6KfgFPKO8JJBADUbGZ8Ya+RMAHRsJf1swlqxCs=; b=x+yqO996/+ldDsvh963BW5rej/
	eaTGXCE4zxj4kVAk1XU6UVeQ544sCOEgE5ta6DUDDnGxI9GUzI9iyA/9NLrEqhKU7TpIJ0rK+55jZ
	9FJS2iIIRsun6eVgad00oDHijR30iOLZPIaej3pCYSQlW/qFg9D6rRzZTigPciBP+sd+uWzN4WaW+
	huXxnY3Qbi1oYwLcbarwIta5sQYyeaL/Lq2/Hfs3UhINEm8r0QnW6dJTpaaRUTX1nEYKJGpfViBcT
	kafonidYa+/Md5jeBScyCaBhsuFn+5dvKxR8PZI8UJr2XKb4MKDhgroJJKNPwu0oVWhgn/1ZshJVx
	EJg6DAfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgT00-0000000Ag6u-2crW;
	Fri, 07 Feb 2025 18:22:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSyd-0000000Afl6-3GB3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Feb 2025 18:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DPpGE6KfgFPKO8JJBADUbGZ8Ya+RMAHRsJf1swlqxCs=; b=UA60dOZS2gtHGJ9bNqwqE46MxX
	gQqm48sNF+DQKHXPgrTGVS+UDFF24bbTkDu9Kg2ByG3iB4Rd9Ie7CTNsZw1ljwhOrb4rCPbXk1XSE
	bEXTZF/ShEwCm2lHwmOctHWNPTz8ARduAkCZdCFCHYREKGfE8yCBfODIulGRhdfgK4FV1sI0yDhJd
	DCHLBk2xV7kVHxfs5Fm3bLMjGcD1pL9H8MY8JUq+7jPx4pNkeGzppCGHj1i7dff4KpokfC1+2ToY1
	lPg+49NDJQQBa3NSKCbPvkJIwDTacPXpkQiJSmmXOW4IVgwNQbxRqDp8DUPxvQekoQZuhvtgFt3EC
	cNtbUdnw==;
Received: from out-176.mta0.migadu.com ([91.218.175.176])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSya-0000000HI2D-1qak
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 18:21:18 +0000
Date: Fri, 7 Feb 2025 10:21:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738952468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DPpGE6KfgFPKO8JJBADUbGZ8Ya+RMAHRsJf1swlqxCs=;
	b=EOhoGwfg5dGbnzpteRz5Z7syVX4X8qA26qOJ6hJisGwZtjhHUmar9tOM/mhEMSC1sMoMdS
	mqqkw/8RAxgz6I29IwPLACUqROlhn9rbFa8WDg4iyjrvi/TfwBnkEBrcwI0YZj2aad2BQQ
	7YQ7PLA5+sTPY5mb6GdSIrOPb13Xt40=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: kvmarm@lists.linux.dev, maz@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, cohuck@redhat.com,
	eric.auger@redhat.com, sebott@redhat.com, yuzenghui@huawei.com,
	wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
	jonathan.cameron@huawei.com, anthony.jebson@huawei.com,
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v6 3/4] KVM: arm64: Report all the KVM/arm64-specific
 hypercalls
Message-ID: <Z6ZPDml0JKuSjLIO@linux.dev>
References: <20250205132222.55816-1-shameerali.kolothum.thodi@huawei.com>
 <20250205132222.55816-4-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205132222.55816-4-shameerali.kolothum.thodi@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_182116_638869_F4E663D9 
X-CRM114-Status: GOOD (  15.90  )
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

On Wed, Feb 05, 2025 at 01:22:21PM +0000, Shameer Kolothum wrote:
> Currently ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID returns the
> bitmap corresponding to KVM_REG_ARM_VENDOR_HYP_BMAP and it only
> returns _KVM_FEATURES_FUNC_ID and _KVM_PTP_FUNC_ID. Change that
> to return all the KVM/arm64-specific hypercalls exposed by
> KVM/arm64 to guest operating systems.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  arch/arm64/kvm/hypercalls.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
> index 27ce4cb44904..5cef2590ffdf 100644
> --- a/arch/arm64/kvm/hypercalls.c
> +++ b/arch/arm64/kvm/hypercalls.c
> @@ -359,7 +359,11 @@ int kvm_smccc_call_handler(struct kvm_vcpu *vcpu)
>  		val[3] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3;
>  		break;
>  	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
> -		val[0] = smccc_feat->vendor_hyp_bmap;
> +		val[0] = GENMASK(ARM_SMCCC_KVM_FUNC_PTP,
> +				 ARM_SMCCC_KVM_FUNC_FEATURES);
> +		/* Function numbers 2-63 are reserved for pKVM for now */
> +		val[2] = GENMASK((ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_CPUS - 64),
> +				 (ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_VER - 64));
>  		break;

This isn't right, vendor_hyp_bmap is very much load bearing. We have a
documented UAPI that allows userspace to control the hypercalls exposed
to the guest.

The idea being a user wants kernel rollback safety and doesn't expose
hypercalls that could potentially be revoked.

https://docs.kernel.org/virt/kvm/arm/fw-pseudo-registers.html#bitmap-feature-firmware-registers

-- 
Thanks,
Oliver

