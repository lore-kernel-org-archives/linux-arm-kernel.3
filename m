Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365EBCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OeStcwvul6xuBmfHmqioB3II/ujcPrLl80+h0LOYME=; b=bpQ9qqB1hgxv/4SXM8x/v/we0k
	V3OiEyznr8Ne6fkT/zrLOEsZc8Ddg3qVwnXSYreaNf43wOLtHY9XTKekI6bEYglb4wDtH0Gp0b/lo
	G1ekFz/ntYOeJiz4PrRnxRa3SApWGJn7J8CJM1Fx3tBJqRK7ZohcdF7L99tdYTO0Ln37YXDhgXcoo
	spbBSr0ivFZA+otV0NNtxQ1xGQ9AG7FnBhPKRY8AI4K3qsrx1l5fSJ70s2lR41Yt6dmduAFSXDRJW
	nXDfqvZVIDXSZhTzDAsxoD6NoTChTOOHlu+lKQPKwtZbFGbRhhqCPy6eqIA9S7O+qVf1y7NjPtHSN
	Pl6mRnEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjgU-0000000EveJ-0fHv;
	Wed, 03 Jun 2026 11:22:54 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjgR-0000000EvdO-0lzN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:22:52 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-51765531803so397731cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 04:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780485769; cv=none;
        d=google.com; s=arc-20240605;
        b=JoL7yqvh+8/wIuQp407UyHkM+6FIjulvUtpqf2hBYXwm00oYkqG74PbovnKFqGEfUx
         DeBxyPDu7aXm9iYcV6Te941UM8OqgESxqFedI3MPxb0pPStYrvNaXP2c7VuEbp5hyjXE
         gZFybiBEwe/XoC7LRzyU3rOCyA9yQLL5O8iYa0KDbwnryP+wDEAiWW87XKsIhC8ury0t
         U3l9Rii7gs3pc3foJRBOuI7EUkVj/3Wv/qAXQBBGpUuvKciKHcxpFOh7BUnZ7cq5eLe/
         nwogLLFudMgUbscQwX3vU718WCoa37J3i+Fz0EW4H5asQWglzdtjO+TK2LgqQfbi9a1R
         qzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6OeStcwvul6xuBmfHmqioB3II/ujcPrLl80+h0LOYME=;
        fh=RgV1uwP8Nk020BYgRjPjXUMz0DBB/k/RwggFYuYCw2Y=;
        b=ZoZKDIJyOhNcz3lAhdcuIKcRwQCusHY+D0nOYaq9xHbdet94RpDHBwb5OWSzn4DqKb
         ds3HJ85yChQqObkuIUt9QRUgBIFXomZJ2knCVUeT29rE9Qtryyyx2m4FoMT058ao7IqC
         MXn3LJd8RjQgtVSAcKr7aXyrPiMNdkzARmtN6jI8BBhOsu7HktsmjpQT9+T0hdrlThoy
         5wlx1HHwT7PqcP7eNLCc6BK82EzkIF2qHvlZ8SEm0tySmJgAI0FtoUah3cBgOErQI+Um
         aNuiWbFV7P5TVs3BB+3z69DUJcI7Aw0WqAwzMvGhgOOJX3Za8k9fo20///mkocVagDIt
         6QhA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780485769; x=1781090569; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6OeStcwvul6xuBmfHmqioB3II/ujcPrLl80+h0LOYME=;
        b=PNqzUbEOmDDgeBN0tQ+YDh8wEjEuhIvwzM79vZVKlOSdR8ulqwJXp9f2SvkzLz55dE
         M4hZGLebrX6bVjW+lejIjc9W7cCN7utuSgp98uz3u+dcaaA2ZORIM4rRPQYDl2nhTdAz
         yURMdpTJjGhsKIlf0mEmgLbm3sYVRE4eCDYKlLvyowhdgm9GOkBgSrrq2ixYqszxavTi
         BqmeLuLgcyBy4SDLt5mJ95tYjY7gWSUlbwQhBWCUv+tRSq8SvOeaqi8Cc+pCh6RWjKza
         SrUuy/BZwJmq5qgdnsld44v7mIxvlixeis7zFT8OIVcbIroTwEgsEMXaSqjnICEyW+sP
         algw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485769; x=1781090569;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OeStcwvul6xuBmfHmqioB3II/ujcPrLl80+h0LOYME=;
        b=ScFUMf0OnqBOCg3juZ0YrU/0tomsXOOoKBcn8vdVuXGWk6D7YjSeEOlSAbC/EzrHwa
         FgO39wi54eN2J74Wf34ASF7Y5AviPvKs8K4PXGRv6/3il1w9ruAC1HqtTTxj1kOdeZwn
         fuUsEbwyDcuEo5NNlq/lgp6P5l0DShBt0pqznxsIiH3FqTuCq3Ealv5ptPfyst3yJOxl
         rxdDvXllZE9qvsUCfiHj3c5P7m6Y7uWh+4WdsHeyameiZM261NEJAd2wcWp9DWiDNXgy
         D2kq6O8EEkwMwd4j4+gzQ/dHzFDWaHbx5QD0AbS1blgxhMHPxD55mc3EyTsLQDLYwJlo
         GrMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+X3rcsILY/rEkY+QxdftjTGW7ctE0u5EgcRIl20qRrFG8ZIu1gSTXrCxn7q2+eZqtKXwEVGZgNqu3F2RlMzmVZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3r1a4Tr2+S6BTT4zXOyur8bVS+rEWUIleTn/wiKiusGQ28Wzo
	kN2rWq4u8GFvXv2qIS6G/yOZYtWhSmMFYcZuQV6VO/M6IrOHEHzZnrQ4Lfiam5EBpWrSXVK8vrj
	sDqj2cYhQ4FrwubejLYZh1OjUl7a/KpYGZNFfLaMp
X-Gm-Gg: Acq92OEWE8Pd/oJwvEppCBJL68CI3XyW44JkQMOiR8r2o8faWwSd4W61obb4waLaYIQ
	5Zx1iYzxS1RU1ZyaszyJnxpQ3bHOboTG1M9wWmsw0zy4Tkp2ygbTJ2xUUEkppitl+KLpIl+qmwf
	qrYdmGYIHHoijg+iHuvGvXSCgywOLikxlJ9kA/fPIkMiIuHNYExFaeMgGCnkxGEXhuVktCf3udB
	Ia1NSx3XJbT0eGXOS2QEHPuiVQEHkugWlnmBJA33ZKwnzZyoDCqWyBiCbnn76AhgAVxcWiyOG4d
	p28u1y9SXl7pFLIoeqRdNUjSALzg8DAScmhIDdJdi8QgbjBoCyYqre1WhQ==
X-Received: by 2002:ac8:580e:0:b0:50e:41f3:6467 with SMTP id
 d75a77b69052e-5177bacf8bemr7041881cf.12.1780485768086; Wed, 03 Jun 2026
 04:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260603110312.2909844-1-vdonnefort@google.com>
In-Reply-To: <20260603110312.2909844-1-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 3 Jun 2026 12:22:11 +0100
X-Gm-Features: AVHnY4KI9ky2nK9uhZkT2wqO6-ArzdUSiw-eQWvqiODT58oZSiJAb0P_fIrw1BA
Message-ID: <CA+EHjTwFZGNi=WqE_=mD4nifowHidxyNVuho1XiuU7msMe8MFg@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Set a linux errno on SMCCC error in kvm_call_hyp_nvhe()
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_042251_228794_BEA84081 
X-CRM114-Status: GOOD (  21.43  )
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

Hi Vincent,

On Wed, 3 Jun 2026 at 12:03, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> If the HVC called in kvm_call_hyp_nvhe() fails with an SMCCC error code,
> we WARN. However, the returned value isn't initialized and the caller
> might get garbage or 0 which is likely to be interpreted as success.
>
> Set a default -EPERM error value, ensuring all callers get the message
> when SMCCC calls fail.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> ---
>
> I have encountered this issue while working on a follow-up contribution to the
> hypervisor tracing. In that case it completely crashed the kernel because
> IS_ERR() failed on that res.a1 value.
>
> Now, if it makes that function more robust, I do not believe it is fixing any
> existing bug which is why I haven't added a "Fixes:" tag.
>
> In case we want to stick one, here it is:
>
> Fixes: 054698316d87 ("KVM: arm64: nVHE: Migrate hyp interface to SMCCC")

You are fixing a real bug, even if it's latent; I think you should include it.

>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index a49042bfa801..6b8fd494792c 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1273,13 +1273,14 @@ void kvm_arm_resume_guest(struct kvm *kvm);
>  #define vcpu_has_run_once(vcpu)        (!!READ_ONCE((vcpu)->pid))
>
>  #ifndef __KVM_NVHE_HYPERVISOR__
> -#define kvm_call_hyp_nvhe(f, ...)                                              \
> +#define kvm_call_hyp_nvhe(f, ...)                                      \

nit: This realignment would muddle a git blame on this. Prefer you drop it.

Otherwise,

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>         ({                                                              \
>                 struct arm_smccc_res res;                               \
>                                                                         \
>                 arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(f),               \
>                                   ##__VA_ARGS__, &res);                 \
> -               WARN_ON(res.a0 != SMCCC_RET_SUCCESS);                   \
> +               if (WARN_ON(res.a0 != SMCCC_RET_SUCCESS))               \
> +                       res.a1 = -EPERM;                                \
>                                                                         \
>                 res.a1;                                                 \
>         })
>
> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
> --
> 2.54.0.1032.g2f8565e1d1-goog
>

