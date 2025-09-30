Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C271DCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 17:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Abuvdp6dvcP4pY2sYCbxIW6RxmXHacrG5s1S0+d8Jjs=; b=XcnyU7Wcc3tr9AkQaYFP/mHcSH
	kZBtshu6ppeFuuEjoj5hGaLTpGE7G+kxzFJ+XXfbXuB2y1Q2ELcZbfVfy2k+vzXmfyfKn+5LKRYiw
	AORaDE2S+hP1LzavBV08MlHPIXNBUusFV4iKTsCu+aXGylVcW8Doy5cwzvcZ63VSA/1SVBq9TYMO6
	0kkXPZ7cUrsZAgfD5qqQmCXsXf+uy95y0ikrBzSG7VfkUIwbpbGMhsFfjIpnFg3pDfS8WT+2ERIpN
	3ChB4sVzyG9mPHydceSLAK6mStBc+r/0Dy8vOWWnIO7YE2xlGWtR3q1cKYPL8OQh4XCRftO9Nn+2R
	FaXGeHZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3edK-00000005vpb-3Pw0;
	Tue, 30 Sep 2025 17:59:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3edJ-00000005vpT-2noz
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Sep 2025 17:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Abuvdp6dvcP4pY2sYCbxIW6RxmXHacrG5s1S0+d8Jjs=; b=YLWZA+wW33nCRv15LpLKNuqX/k
	JLB7jK+jjCRsmS5H+LJLQ6DY7SC5LSKUfkSOAcmKMPHT/xoDYgXG9Lsf3N17c/tjWxmpl2hdP3DfI
	THxctV7t4kH8YNL2B3mDLiRq3PePybqVuzQb80xl2cBmZx7l2vVdghFdP6LuSevmNicV/bEhRD6Ye
	294FT6eFwlY2bg6BFlldnX9893uQylKAcBn8tVhCjcXM/JfYdt6VfKyhEUAXKRZVBxE4y+lyVGCBT
	8BYC6Tyy7VQ2KrMdu+H3fAdM0vTseAWu/Ie4QrsCbQ+KH95Hmr7PTW7ong+Bn7V59Wk+nelipe4h9
	mpTAT5eA==;
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3edG-0000000D0Ts-0wBs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 17:59:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Abuvdp6dvcP4pY2sYCbxIW6RxmXHacrG5s1S0+d8Jjs=;
	b=hkWwgsEbgCcQFMRP9aZB8XnU+yzXypXbwAPTH2NCWuuksjHy2aP/gVbgLF8/VxbH54g1zm4Da
	KwoV3C5mC2moRqmwVfIEYz8049YoF4KG451Lf42a1DaAxYcAeqwb/ajF89naiQl+11M3S4QYrFD
	LWMzFhkY8b0bWeKRYTPMUe8=
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4cbm4j4m5xz1T4Fp;
	Wed,  1 Oct 2025 01:58:13 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id E27131800B1;
	Wed,  1 Oct 2025 01:58:37 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 1 Oct 2025 01:58:36 +0800
Subject: Re: [PATCH] KVM: arm64: Remove unreachable break after return
To: Osama Abdelkader <osama.abdelkader@gmail.com>
CC: <maz@kernel.org>, <oliver.upton@linux.dev>, <joey.gouly@arm.com>,
	<suzuki.poulose@arm.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <20250930135621.162050-1-osama.abdelkader@gmail.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <8e289e80-60ca-977f-97a2-cbe1146baaf7@huawei.com>
Date: Wed, 1 Oct 2025 01:58:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20250930135621.162050-1-osama.abdelkader@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_185922_805149_FF04C0A8 
X-CRM114-Status: GOOD (  12.96  )
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

On 2025/9/30 21:56, Osama Abdelkader wrote:
> Remove an unnecessary 'break' statement that follows a 'return'
> in arch/arm64/kvm/at.c. The break is unreachable.
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>  arch/arm64/kvm/at.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index d71ca4ddc9d1..b04c00f95944 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -43,7 +43,6 @@ static enum trans_regime compute_translation_regime(struct kvm_vcpu *vcpu, u32 o
>  	case OP_AT_S1E2W:
>  	case OP_AT_S1E2A:
>  		return vcpu_el2_e2h_is_set(vcpu) ? TR_EL20 : TR_EL2;
> -		break;
>  	default:
>  		return (vcpu_el2_e2h_is_set(vcpu) &&
>  			vcpu_el2_tge_is_set(vcpu)) ? TR_EL20 : TR_EL10;

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

Thanks,
Zenghui

