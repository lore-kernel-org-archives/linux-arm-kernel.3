Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA96ECD583B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2ekXdwkRaQOz3Sz8euHH7R8sRGKGoQ61Xj6VYJaUFo=; b=wlxNKu9pKAgSJbPtm+xAru+3Z9
	oKvX0WLGVb/7xV82ijjm7n46lYO4NfjX/Du2B1yIVFIlnpRnzAeG7kyBfcX7Mb3gp8JjOVxwPiu4M
	rMh9ONcDfI4xVa5nTdw2ZCbdgp000vjazB4CWnm9FYpwZbvyd7z/DZip2N/KFuBqFRJ0j9hvTBcp4
	ThaE3f4DDObGi1/fWDlWqz4GJ1jP7gZn908OLRkypnOLaPiJXi7udOPVKnR9EhzNCoNlXeJsjHSB3
	NCNjb0tISTUG+xHBJ5J6UUxfHu521FZZ9lt4noAe5FYjacb+w9mhKDbINRvXTT5YpHRLLNn0U/DiP
	bRiA3b0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRZd-0000000EomQ-0Q3Y;
	Wed, 07 Jan 2026 11:19:33 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRZZ-0000000Eolh-46tq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 11:19:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=R2ekXdwkRaQOz3Sz8euHH7R8sRGKGoQ61Xj6VYJaUFo=;
	b=RR2OQnXMbTS/HVamxAIuS9XrpdZf8asUYRx9ouGYFlJ0jf+C0JB+qXwNh1m29HysXLAYNkZ9P
	y17RdxnYQm7UenfQxVnyMb+hjXIxUjgd7O2+NnJXTzW6fKu8Yufm7egOx8nfNLGw6Uxvot8WNBa
	flu/arIx3XDvKl0Z5dLw2SY=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dmQVL1HMVz1vp2G;
	Wed,  7 Jan 2026 19:17:14 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dmQXk0SNczJ46mZ;
	Wed,  7 Jan 2026 19:19:18 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D57A40570;
	Wed,  7 Jan 2026 19:19:21 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 7 Jan
 2026 11:19:20 +0000
Date: Wed, 7 Jan 2026 11:19:18 +0000
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
Subject: Re: [PATCH v2 11/36] KVM: arm64: gic-v5: Support GICv5 FGTs & FGUs
Message-ID: <20260107111918.000037f7@huawei.com>
In-Reply-To: <20251219155222.1383109-12-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-12-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_031930_910242_41A62736 
X-CRM114-Status: GOOD (  15.30  )
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

On Fri, 19 Dec 2025 15:52:39 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> Extend the existing FGT/FGU infrastructure to include the GICv5 trap
> registers (ICH_HFGRTR_EL2, ICH_HFGWTR_EL2, ICH_HFGITR_EL2). This
> involves mapping the trap registers and their bits to the
> corresponding feature that introduces them (FEAT_GCIE for all, in this
> case), and mapping each trap bit to the system register/instruction
> controlled by it.
>=20
> As of this change, none of the GICv5 instructions or register accesses
> are being trapped.
>=20
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Hi Sascha,

Superficial stuff only on code flow to make it easier to extend next
time.

Jonathan


> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 3845b188551b6..5f57dc07cc482 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c

> @@ -1511,11 +1595,19 @@ void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu)
>  	__compute_fgt(vcpu, HAFGRTR_EL2);
> =20
>  	if (!cpus_have_final_cap(ARM64_HAS_FGT2))
> -		return;
> +		goto skip_fgt2;

Nicer to avoid more complex code flow and just make the next
block an if.

	if (cpus_have_final_cap(ARM64_HAS_FGT2)) {
		__compute_fgt(vcpu, HFGRTR2_EL2);
		__compute_fgt(vcpu, HFGWTR2_EL2);
		__compute_fgt(vcpu, HFGITR2_EL2);
		__compute_fgt(vcpu, HDFGRTR2_EL2);
		__compute_fgt(vcpu, HDFGWTR2_EL2);
	}
> =20
>  	__compute_fgt(vcpu, HFGRTR2_EL2);
>  	__compute_fgt(vcpu, HFGWTR2_EL2);
>  	__compute_fgt(vcpu, HFGITR2_EL2);
>  	__compute_fgt(vcpu, HDFGRTR2_EL2);
>  	__compute_fgt(vcpu, HDFGWTR2_EL2);
> +
> +skip_fgt2:
> +	if (!cpus_have_final_cap(ARM64_HAS_GICV5_CPUIF))
Given the above shows this code sometimes gets extended I'd
be tempted to just go with
	if (cpus_have_final_cap(ARM64_HAS_GICV5_CPUIF)) {
		__compute_fgt(vcpu, ICH_HFGRTR_EL2);
		__compute_fgt(vcpu, ICH_HFGWTR_EL2);
		__compute_fgt(vcpu, ICH_HFGITR_EL2);
	}

=46rom the start and avoid future churn or goto nasties.

>=09
> +		return;
> +
> +	__compute_fgt(vcpu, ICH_HFGRTR_EL2);
> +	__compute_fgt(vcpu, ICH_HFGWTR_EL2);
> +	__compute_fgt(vcpu, ICH_HFGITR_EL2);
>  }




