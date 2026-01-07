Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE794CD5828
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJh6sKL4QAS0b5S62m0cU+/CYmQY81urSbcRIZncouY=; b=Jb4PHKRdzjiYM/Zn+dkE/j5uY/
	hxbVs3Z+6BD1QB5uJ05TDJt7azCAZqlEi9BNrR8lHLX0M4L6a53x+Hzb5kjOZHV/zmPl/PkddYmPO
	wjSDlpUGu6nKGT8oxdQXP54oxC+NI2AZTX4oWbjpuE5e8b7Fnk5QjSqSBDI3HPFyF0Z3c/AAdnZ89
	hiAwrCxCSAChUNVk503Y37xmINaRtit0xLU2BXEBdhB5p5whUHzbc+GRIKN0xhjQykKbYzKZSk2DF
	GgefyZFLsbH5lL8X0OXFyuBMZsKObcMYDtLr5AxJd63FHiG/HReCmL+Ata6PSWgKSKv1pNLeS5BIP
	sqN19N5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQof-0000000EiFj-3CIC;
	Wed, 07 Jan 2026 10:31:03 +0000
Received: from sinmsgout03.his.huawei.com ([119.8.177.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQod-0000000EiDb-0qQX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 10:31:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wJh6sKL4QAS0b5S62m0cU+/CYmQY81urSbcRIZncouY=;
	b=gDF2IkL2fkPSOMme51XAPHStUfn6PruUAX6/XTpIPVF0kQcFxsaEcEtPgPgO5HSxHzSN1EMWF
	H5wpyqkB4h7bJKalruKXUh7EBPX+qt13LVkKRiEuxy5yLbmf664NBa7T1NlVZ4NYjjbm6h/5l8e
	z64WxAyj0kiJLM3fwqJhJKs=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4dmPQL5KS1zN1J4;
	Wed,  7 Jan 2026 18:28:42 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dmPSj6cKszJ46dr;
	Wed,  7 Jan 2026 18:30:45 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id F2C6240565;
	Wed,  7 Jan 2026 18:30:48 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 7 Jan
 2026 10:30:45 +0000
Date: Wed, 7 Jan 2026 10:30:44 +0000
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
Subject: Re: [PATCH v2 08/36] KVM: arm64: Introduce kvm_call_hyp_nvhe_res()
Message-ID: <20260107103044.00000df0@huawei.com>
In-Reply-To: <20251219155222.1383109-9-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-9-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_023059_724982_8DAA6994 
X-CRM114-Status: GOOD (  15.63  )
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

On Fri, 19 Dec 2025 15:52:38 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> There are times when it is desirable to have more than one return
> value for a hyp call. Split out kvm_call_hyp_nvhe_res from
> kvm_call_hyp_nvhe such that it is possible to directly provide struct
> arm_smccc_res from the calling code. Thereby, additional return values
> can be stored in res.a2, etc.
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
One question inline, mostly because I'm curious rather than a suggestion
to change anything

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  arch/arm64/include/asm/kvm_host.h | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index b552a1e03848c..971b153b0a3fa 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1208,14 +1208,19 @@ void kvm_arm_resume_guest(struct kvm *kvm);
>  #define vcpu_has_run_once(vcpu)	(!!READ_ONCE((vcpu)->pid))
>  
>  #ifndef __KVM_NVHE_HYPERVISOR__
> -#define kvm_call_hyp_nvhe(f, ...)						\
> +#define kvm_call_hyp_nvhe_res(res, f, ...)				\
>  	({								\
> -		struct arm_smccc_res res;				\
> -									\
> +		struct arm_smccc_res *__res = res;			\

What's the purpose of the local variable? Type sanity check?
Feels like typecheck() would make the intent clearer.
Meh. Not used anywhere in arch/arm64 so maybe not.



>  		arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(f),		\
> -				  ##__VA_ARGS__, &res);			\
> -		WARN_ON(res.a0 != SMCCC_RET_SUCCESS);			\
> +				  ##__VA_ARGS__, __res);		\
> +		WARN_ON(__res->a0 != SMCCC_RET_SUCCESS);		\
> +	})
> +
> +#define kvm_call_hyp_nvhe(f, ...)					\
> +	({								\
> +		struct arm_smccc_res res;				\
>  									\
> +		kvm_call_hyp_nvhe_res(&res, f, ##__VA_ARGS__);		\
>  		res.a1;							\
>  	})
>  


