Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618F8C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 18:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLebe+jzGLux7DSpw2Ptd+bTvs2CJro4ymjhGMecT2s=; b=FmQ2KVBFBlspxpPMKiu0TK6i3u
	GV4YleoGVUqeBWtJNmMTLWIDZ4cZdy2SbxLHf802RmnjEz1SMJUTDmjnQPMrcmk90HHREk5KzTMXY
	9dRjkO/5kc0p5aqFV7m2rGNuWxY1bS1UNFkT7hsoTzLxyaPw3+WQkPrRLnfdcZMWYbEsPi0c8CaiT
	lRYPzHhVbtOMuviI6zAuXRLDmQ45D4nJqt35rnGktpxv9eZT9bNaDU+XbdLHV/xfLrDiEJCpWQiEF
	Jt2IB0eesqdA2NpO5ObvNzlJVTX3rOeffroFIiYpo5RFlfGPxtpFzJs17Xg2CnIlbpzch+mV+20xN
	JUfYh/YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thYI7-00000000s8h-2A58;
	Mon, 10 Feb 2025 18:13:55 +0000
Received: from out-175.mta1.migadu.com ([95.215.58.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYGh-00000000rr8-11uB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:12:29 +0000
Date: Mon, 10 Feb 2025 10:12:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739211143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oLebe+jzGLux7DSpw2Ptd+bTvs2CJro4ymjhGMecT2s=;
	b=TVf+uKDDvKnu/oeSc93C892wJYH60SLMrlWI3XwVY0HrADEZScMSzN8qkJz96sq1PHBhYk
	UfaZKCjoDAr0sYpQKz9CChwj3KLaQZQKZMTvW6A2WVjgpmt/aGVdRvxcyp0er5maX+DqrJ
	V+9T5NjYbngj+ESa2xauSK9bopNaUSk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sebastian Ott <sebott@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] KVM: arm64: Allow userspace to change MIDR_EL1
Message-ID: <Z6pBd0XgEvrMoLcS@linux.dev>
References: <20250210154953.27002-1-sebott@redhat.com>
 <20250210154953.27002-2-sebott@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210154953.27002-2-sebott@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_101228_156652_4E520133 
X-CRM114-Status: GOOD (  14.31  )
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

Hi Sebastian,

On Mon, Feb 10, 2025 at 04:49:50PM +0100, Sebastian Ott wrote:
> Enable VMMs to write MIDR_EL1 by treating it as a VM ID register.
> Since MIDR_EL1 is not handled as a proper arm64_ftr_reg apply only
> a sanity check against the writable mask to ensure the reserved
> bits are 0.

How exactly does the VMM's MIDR_EL1 find its way to the guest? VPIDR_EL2
is still set to the hardware value.

> @@ -2021,7 +2037,11 @@ static int set_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
>  		return ret;
>  	}
>  
> -	ret = arm64_check_features(vcpu, rd, val);
> +	if (skip_feature_check(id))
> +		ret = arm64_check_mask(rd, val);
> +	else
> +		ret = arm64_check_features(vcpu, rd, val);
> +

Can you add a new implementation of ->set_user() for MIDR/REVIDR/AIDR
instead?

> @@ -2542,6 +2571,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  
>  	{ SYS_DESC(SYS_DBGVCR32_EL2), undef_access, reset_val, DBGVCR32_EL2, 0 },
>  
> +	{ ID_DESC(MIDR_EL1), .set_user = set_id_reg, .visibility = id_visibility,
> +	  .reset = reset_midr_el1, .val = (u32)-1 },

nit: GENMASK() instead of truncation by casting.

-- 
Thanks,
Oliver

