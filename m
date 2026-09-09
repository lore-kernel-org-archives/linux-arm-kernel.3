Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67F4C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 05:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nh6M4VZCYgC4q2LdczwdgMA5ELYVwccRqILicmGF2f4=; b=tGDkOffu1dCBPDEEwSPK+PKX+0
	YUksGI27H5UTh5B4I7FLrHvZ9c/J6wzLgMG1U/3GMKFbfJDbE3ki+27xLoYDOFBO4Ns7KPnCLvtEX
	TIgpYg38ksXGJbC84SUBLtlhuZnxUkDu9CEw8nvZ8DAIQqRujXWGE5+zCCrS4D+ylDuSqDLgK4aUv
	SFvdPvAXR4CQKGLHZ7VrPEiKFrv46XGfd5ccCBp4XLRU8hBdukLYVm1JbkDYt4fccospvJwb3EiIE
	72d8HPde/chz3Cy+m4R6rqk1CtF5lJ0bqmf0gK/aL17wInBMARR+uScHzvGEFPI1l89ZStmi6PyA8
	ywaniNbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x49wD-0000000Akko-3sWC;
	Wed, 09 Sep 2026 04:29:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x49w5-0000000AkkB-1sJN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 04:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788928164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nh6M4VZCYgC4q2LdczwdgMA5ELYVwccRqILicmGF2f4=;
	b=LlqT3u/qa//Vs1o2ZlPKsH/hnYRj07ZxO3zVon+ldqtdH5vZ9C0/2J1aMbp0qOoR4oQ5vz
	BjY1Xf/G4tZQ5kO37Dp2yESyR+fIYRYdS3ELXK97k9M6WPkN4XWfOeEpKLHGocuCylTEYG
	r6Y0rZrba8poTGaPPuLmVcQ7Lx2qwY8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-VtnrCzTVN_yMwmCPhqBR0A-1; Wed, 09 Sep 2026 00:29:22 -0400
X-MC-Unique: VtnrCzTVN_yMwmCPhqBR0A-1
X-Mimecast-MFC-AGG-ID: VtnrCzTVN_yMwmCPhqBR0A_1788928161
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso654176a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 21:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788928161; x=1789532961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nh6M4VZCYgC4q2LdczwdgMA5ELYVwccRqILicmGF2f4=;
        b=cl09oxs1jV5k+XgBItmjDcyVYFfXLa/LHRXw15qi+J+y/6b2JKdoND5UXkU5G6vfFP
         VraiZKA70n2Qb/FoAzVbM8pUY+RQ57zXefwDAr307k0IA/JEAgJMgurWoG4Pa6StFrvw
         hxzgDm99ZwKf98DjYwWiQwF4AhGan6VzbKce3bjtD00CF+2HxVaFhtXjmR7CpKXlUF1q
         LNlPQHLjs0rbdKB8cVobfwEpLeDKrjvs7vOvb95hWeetisqum3fsJgvuwd40t8if0PEy
         6lPBdkyu1FMt/AKGV+TRtBaUBL7axNKNAU05kPsxiIP2KISjzJQUN7vcagOAEP2IUtuc
         6Umg==
X-Forwarded-Encrypted: i=1; AKwUvBzw5xnvR8U/wFSMcu4LIG9Y8mJmmrhYxHffOecIqyrF/HLehFn32mqbWzdgeFbPxo18jp43NgL0xSSqANWrGC+L@lists.infradead.org
X-Gm-Message-State: AFuF++kHpbIl1GjJzEsTm7eHzhbg68yp5b7UxUTbfYykUCdUNbQj3Tv5
	IR3uoNDHh8ngl9y4YfLJUWTiOAuWYbhNb+rups0Xp4ZPbik26iCxHJeoDtCLriBTycSFHMp2tia
	fkd43YnIog5J6jnHz6quqjHQ+qmN+hLIDMzhCbpTdSCqpbphcJ/2Kd/uW16qkbfLSaSJT5ZflJO
	mLN6plQHpx
X-Gm-Gg: AYBFou2NEHKiYsLiYchrySYf8BLbnay/M7DKUTdoFh5D7fH7FhkMxms1QNTbLOcMLdO
	9ImNgJ1i28DNqMnxvph1Q3nK8Ea8fQR7wHnldVHz021IopoE1ZKWRS7WXOjlb9qJGHJGvpYwRuH
	i/5xm0pC9rE/zP1c8lSXWF1c1vQmrUMNnEcd4iIR17gQUQU47EL23Vipix0piYSw0Zhjg4e7OX8
	x+SS1DySSfPefMEME/jRzmDUq3Dj+rsmdI/xkTxrdI22tKj4wax28GxCEMJN/ymNGdnXWEO2X5k
	SYKDpavk7QZfSLQpx7c2u8ftXCG3aveTO0ZlT3YnQ9noRtbPtKS1aunHcFBEK01NU7TghDdbWYA
	ykuDylK4sI4DB1bkyRBf8/uYXjwxNXJwdtVKJrQrNKQ==
X-Received: by 2002:a17:90b:564c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39b2612338dmr54737967a91.4.1788928160903;
        Tue, 08 Sep 2026 21:29:20 -0700 (PDT)
X-Received: by 2002:a17:90b:564c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39b2612338dmr54737906a91.4.1788928160430;
        Tue, 08 Sep 2026 21:29:20 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ba0a7b2c3sm5544813a91.0.2026.09.08.21.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 21:29:19 -0700 (PDT)
Message-ID: <aac304fa-a371-4210-8703-74281c9748f8@redhat.com>
Date: Wed, 9 Sep 2026 14:29:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 5/7] firmware: arm_rmm: Activate the RMM
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-6-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260907095942.1140734-6-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q80Nbf8qoJdYtOaNkalvYDPLgQ6bwpDzuJq-qxnr5UU_1788928161
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_212925_591186_BAA34D4C 
X-CRM114-Status: GOOD (  24.68  )
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

On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Activate the RMM after the basic configuration. This is a memory transferring,
> stateful operation.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v16:
>   * Split into a new patch
> ---
>   drivers/firmware/arm_rmm/rmi.c | 17 +++++++++++++++--
>   include/linux/arm-rmi-cmds.h   | 11 +++++++++++
>   2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> index 42c973c3a98bb..d969c8738efde 100644
> --- a/drivers/firmware/arm_rmm/rmi.c
> +++ b/drivers/firmware/arm_rmm/rmi.c
> @@ -641,7 +641,8 @@ static int rmi_configure(void)
>   
>   static int __init arm64_init_rmi(void)
>   {
> -	int ret;
> +	int ret = 0;
> +	struct rmi_sro_state *sro = NULL;

Why we need to initialize those local variables ('ret' and 'sro')? :-)
Also, we can use the scope-based cleanup function supported by cleanup.h
for @sro.

	struct smi_sro_state *sro __free(kfree) = NULL;

With the scope-based cleanup in place, we needn't explict 'kfree(sro)' at
end of this function.

>   
>   	/* Continue without realm support if we can't agree on a version */
>   	ret = rmi_check_version();
> @@ -656,7 +657,19 @@ static int __init arm64_init_rmi(void)
>   	if (ret)
>   		return ret;
>   
> -	return 0;
> +	/* Activate the RMM */
> +	sro = kmalloc_obj(*sro);
> +	if (!sro)
> +		return -ENOMEM;

	if (!sro) {
		pr_err("Unable to alloc SRO object for RMM activation\n");
		return -ENOMEM;
	}

> +
> +	ret = rmi_rmm_activate(sro);
> +	if (ret) {
> +		pr_err("RMM activate failed\n");
> +		ret = ret < 0 ? ret : -ENXIO;
> +	}
> +
> +	kfree(sro);
> +	return ret;
>   }
>   
>   /*
> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
> index fed0f3421895d..dea7c7004d35f 100644
> --- a/include/linux/arm-rmi-cmds.h
> +++ b/include/linux/arm-rmi-cmds.h
> @@ -64,6 +64,17 @@ static inline int rmi_rmm_config_set(unsigned long cfg_ptr)
>   	return res.a0;
>   }
>   
> +/**
> + * rmi_rmm_activate() - Activate the RMM
> + * @sro: Preallocated SRO context to be used
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rmm_activate(struct rmi_sro_state *sro)
> +{
> +	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_ACTIVATE);
> +}
> +

rmi_rmm_acvivate() would be used for once by rmi.c::arm64_init_rmi(). Lets
not expose the function by combining the logic to rmi.c::arm64_init_rmi().

>   /**
>    * rmi_features() - Read feature register
>    * @index: Feature register index

Thanks,
Gavin


