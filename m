Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FEFC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 05:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMvkKeYrjNymKP3nzuev6PMvw+A1W0w+cadnXyWgZ8s=; b=lnvIQF11yr204kqpkUdKncvrU3
	qPrs22trprB1N3LYPg0OgHuy1wi4iEa6ulrYn4cpRebNqejGTLyG6SDeaBgpMkiHaVidBI84r04UD
	syk7RgRGMNO+2BpqF6oPvm869+9nrzWqFHQ2Nn4edW7nYUpx9Peds4GZ+isAq2GDtbIYVXII37cn3
	dNFDvDVhtIVuclRqh0MH4W92te15LM60xndZLZdiGQQxGPIp+Ja4p0xbefNrdzml9hIV/FYJkZl8M
	LxkWZFndbaKTCtLOtFNGKfkWzUwq51PjEO/R6lB1+PAr2nEXNK0dZcfH5HvzAzSvV4GT086u2xg67
	daM6ODAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Xis-0000000DU37-45Fk;
	Thu, 10 Sep 2026 05:53:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Xiq-0000000DU2S-0fVO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 05:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789019598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aMvkKeYrjNymKP3nzuev6PMvw+A1W0w+cadnXyWgZ8s=;
	b=FIUlFVjdBJdbgYI/plRk4/jeGHJ6lH51+p8Rk5sm4E5xMGMuczK3o4FU4kO60SlY7V09Jm
	mMnZw9peX8L9OYOYhL+cfaVZB+PixMZv3j/Vjz5wqjFXZuW4jeVd9v4MmkwbYMQECj8ME8
	UPGFIVG+sqj8UXdZRDHv/HF33N8t11g=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-fvivDClXOnmFH2a1UYF4nA-1; Thu, 10 Sep 2026 01:53:15 -0400
X-MC-Unique: fvivDClXOnmFH2a1UYF4nA-1
X-Mimecast-MFC-AGG-ID: fvivDClXOnmFH2a1UYF4nA_1789019594
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb687f82eso80987095ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 22:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789019594; x=1789624394;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMvkKeYrjNymKP3nzuev6PMvw+A1W0w+cadnXyWgZ8s=;
        b=SHefVUjhH2ypyhrY7jDj4CmzDvsLEEtjEcJneT6p5mfMihhe020PloDjVNSex1AMvU
         aogM7fA08xHABZ3Uj5IcJKatGEF5ngMYC68mqK/9omAOaO+QQ/7e8g14GhEqvFB+zhnX
         TAUXyHXWOSUVTrclOqweOZz7k11y2d+hPnfTp0pDfHnKT7IZV+0JiX3vNn5ozLXbj2fC
         sQtkaLi4DYaERTcRViz9xyuzwICiZmjumtT2i2mA9yEJbPzglt6XfFvFgn+ThHG7m+BS
         4TLG495LjMl8QaBeqJbvTpF+Y73n5rqhVlhSE4qaL0jZ3Wtk6EREIHfdZ3/sRTr7wDVJ
         JSUw==
X-Forwarded-Encrypted: i=1; AKwUvBx0MVgFEMUtjQxNaqs2ijy3im3WZ6PTWNOlmYZkNV051+aq0bWQH8EVc6oQurCFztW7A7BENwR01MqgvLvt4yQp@lists.infradead.org
X-Gm-Message-State: AFuF++moGIl4JYWXwwUwBW6nMwwre246KgCP9yGdV7CPirMasvn/WZQz
	HkICeg/TJkPC3luuD85c1csWLC6gmurkY9nidKP3aU3vx3WgVnYHp6qj5Ymoac0EFeMFL33lUse
	AlDHLhEQM2zZK2uw7+bEZwVb6dEdNi3/kiSycRnCBkRSlYYNU1BSGM8z3G6wOmuTV5OCODFEiHR
	Ub
X-Gm-Gg: AYBFou1VqvSGBAFaEiLrFYn/5yNFyEfVF77t0KBbNwqRbA4qqPyPDgcJQGLGX3Qliv1
	OueO8ijRb4fD5+LZGYMKkoXsQvA34yBkQ4Qr5qavjaIYgrnPCH85qKjPJz17W9IwV9BpFuDcBEO
	Vm0nHd6VlatKugMrFrogrBhSEz7H2vErhguaViev1M+9SuOTmQPuLDtTN1xQmldWrTUdFBSNoyO
	vQ68/lQPBoE4Fm/xzkJ3loDNV+KaRYfyr4IuBia0+AhK1GC6dCjjiAzikgFvYQlOs+XGehbezwL
	itXkEZVBvV6c4BnGkSX/Rd8zit5k6t6CWsBUc9TAtBvx+accKrY2cg/FNs+cEXH7NAyngyU1uSL
	10KrY5WTzK+JtBH5fjW+/gYr+fSv+18WMH5R+qLejXA==
X-Received: by 2002:a17:90b:5905:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39b262133ccmr56583380a91.18.1789019593817;
        Wed, 09 Sep 2026 22:53:13 -0700 (PDT)
X-Received: by 2002:a17:90b:5905:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39b262133ccmr56583277a91.18.1789019593097;
        Wed, 09 Sep 2026 22:53:13 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39bae615657sm2525614a91.0.2026.09.09.22.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 22:53:12 -0700 (PDT)
Message-ID: <e66698e1-e582-4ff8-9881-4ddda5bc1d94@redhat.com>
Date: Thu, 10 Sep 2026 15:53:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 06/20] KVM: arm64: CCA: Add a new mode for supporting
 Realm guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-7-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260908162223.1683432-7-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m_g_8HonZGh03QmrwjxQ_1TT_wMpp2o1U8mTyV5xGuw_1789019594
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_225320_278595_0843668B 
X-CRM114-Status: GOOD (  19.40  )
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

Hi Suzuki,

On 9/9/26 2:22 AM, Suzuki K Poulose wrote:
> Add an explicit mode to support Arm CCA guests.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt | 3 +++
>   arch/arm64/include/asm/kvm_host.h               | 1 +
>   arch/arm64/kvm/arm.c                            | 5 +++++
>   3 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 68647ff4bdd24..1afe3df3b923e 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3256,6 +3256,9 @@ Kernel parameters
>   			nested: VHE-based mode with support for nested
>   				virtualization. Requires at least ARMv8.4
>   				hardware (with FEAT_NV2).
> +			rmm: Support for running confidential guests in Realm
> +			     world using RMM, as defined by Arm Confidential
> +			     Compute Architecture (CCA)
> 

I'm not sure, but 'realm' would be more appropriate name. rmm (Real Management Monitor) is
the term limited to the firmware to me. Besides, we have been using 'realm' broadly in this
series like kvm_vm_is_realm(), kvm_realm_state() and so on.

   
>   			Defaults to VHE/nVHE based on hardware support. Setting
>   			mode to "protected" will disable kexec and hibernation
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index b2e99c5cb1cd3..31ae9d8d8e92f 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -69,6 +69,7 @@ enum kvm_mode {
>   	KVM_MODE_DEFAULT,
>   	KVM_MODE_PROTECTED,
>   	KVM_MODE_NV,
> +	KVM_MODE_RMM,
>   	KVM_MODE_NONE,
>   };
>   #ifdef CONFIG_KVM
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 9af3bbb2f8c24..50f0adfadab38 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -3264,6 +3264,11 @@ static int __init early_kvm_mode_cfg(char *arg)
>   		return 0;
>   	}
>   
> +	if (strcmp(arg, "rmm") == 0 && !WARN_ON(!is_kernel_in_hyp_mode())) {
> +		kvm_mode = KVM_MODE_RMM;
> +		return 0;
> +	}
> +
>   	return -EINVAL;
>   }
>   early_param("kvm-arm.mode", early_kvm_mode_cfg);

Thanks,
Gavin


