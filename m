Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82471075290
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 10:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evK+TRJN754evcV2n7sFUGHclRwXOmtUFbQh9PWeEUM=; b=36CKgbs1j83GJeRv8SPcHP8zlG
	yg1JgneFh2a2DbVwYex7fd37NfEWEpCn8KpOzIEHOGjHCj7DCKVd2O6knHiY7cNizViietW8CqX89
	B2QDQggqBBME4rfBa3gvRsD3gfCa3VEWKuUwMjryfroD9wd3dkvAPum5AtYtUfLULwGR7l/u4MkgL
	74AuMrOBOt9DrmqSGq7wEA6592+crwKESpcSq4LN6FgvIzJAzic9ocEuC2W2h7OR/jNBpYss/Urt1
	t1DE/jc18f57kOCUPwcyyun7TUEEz2Chy5eryu6LTnT0U7gjT+dA+/aEvvmHNyvqvrYtQ5Zn+jALe
	RKE9UYkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ADm-0000000AN8y-1a6L;
	Thu, 19 Mar 2026 10:03:18 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ADh-0000000AN8H-3brd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 10:03:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=evK+TRJN754evcV2n7sFUGHclRwXOmtUFbQh9PWeEUM=;
	b=SMtTH0/YJIP3qXbUU6vd2oQAJVBu8ZwzQ1VHmyYDKTPdypiRKUTpUWEbNamRUQJxgnhCK1Lw6
	cDi7Azvf4G5dCnOLK1qC3mxZFZx2T4dYKRjdmO1fu7S5mc2m+L40MBKeDp+FBAOlZ2p8dPYUI4u
	cDSRsE1ew5nv0hCg3j16qTE=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fc1Nm6Mysz1vnMD;
	Thu, 19 Mar 2026 17:58:32 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fc1Sl4hMDzJ46pZ;
	Thu, 19 Mar 2026 18:01:59 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 6CFF540571;
	Thu, 19 Mar 2026 18:02:58 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 19 Mar
 2026 10:02:57 +0000
Date: Thu, 19 Mar 2026 10:02:56 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd
	<nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes
	<Timothy.Hayes@arm.com>
Subject: Re: [PATCH v6 01/39] KVM: arm64: vgic-v3: Drop userspace write
 sanitization for ID_AA64PFR0.GIC on GICv5
Message-ID: <20260319100256.00004de2@huawei.com>
In-Reply-To: <20260317113949.2548118-2-sascha.bischoff@arm.com>
References: <20260317113949.2548118-1-sascha.bischoff@arm.com>
	<20260317113949.2548118-2-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_030314_603080_1A3F9363 
X-CRM114-Status: GOOD (  21.57  )
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

On Tue, 17 Mar 2026 11:40:13 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> Drop a check that blocked userspace writes to ID_AA64PFR0_EL1 for
> writes that set the GIC field to 0 (NI) on GICv5 hosts. There is no
> such check for GICv3 native systems, and having inconsistent behaviour
> both complicates the logic and risks breaking existing userspace
> software that expects to be able to write the register.
> 
> This means that userspace is now able to create a GICv3 guest on GICv5
> hosts, and disable the guest from seeing that it has a GICv3. This

Just to clarify this is removing a check on a nonsensical setup?
I'm not against it if that simplifies things but I couldn't quite
parse the description.

> matches the already existing behaviour for GICv3-native VMs.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/sys_regs.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 1b4cacb6e918a..4b9f4e5d946b1 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2177,14 +2177,6 @@ static int set_id_aa64pfr0_el1(struct kvm_vcpu *vcpu,
>  	    (vcpu_has_nv(vcpu) && !FIELD_GET(ID_AA64PFR0_EL1_EL2, user_val)))
>  		return -EINVAL;
>  
> -	/*
> -	 * If we are running on a GICv5 host and support FEAT_GCIE_LEGACY, then
> -	 * we support GICv3. Fail attempts to do anything but set that to IMP.
> -	 */
> -	if (vgic_is_v3_compat(vcpu->kvm) &&
> -	    FIELD_GET(ID_AA64PFR0_EL1_GIC_MASK, user_val) != ID_AA64PFR0_EL1_GIC_IMP)
> -		return -EINVAL;
> -
>  	return set_id_reg(vcpu, rd, user_val);
>  }
>  


