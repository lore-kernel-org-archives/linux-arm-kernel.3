Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831D3CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69R1izJHdq6eU+4kabS2mn4P5ih6+n31cQPINhDIjLU=; b=DHb6+o8cMC0LvWa4H0JIQvQaIe
	tVnbAeBmvwVYePi2eAIbc9PVOeq5gFyDuUHYo1qlPLMWGqBSt5yNgSqScLwKZJwisqo5TsDXY7q8I
	n/S39lfSaH+zKiI/uAl1Lb+twFbo3+10lPxKxL/WY6To2LtWhF9WRAw61hjdhdsZm3/2HxUQalHiM
	zLa9pJEcBLP95l/HnUhK7QqDt1dOXL/NeFGhA1QhGkqD8/xv48Io3gdRdiXWMaQJ8uquzCa1Fnicn
	aQ6blTt9wTUG2jsWK51f5qLb4lRl3lrEqLwvbX49wTrJPoWZoVxGRLeTScuO9lU2t8qDonXTFMUvF
	PeEyBUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEgm-0000000790w-3iiH;
	Wed, 10 Jun 2026 08:53:32 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEgl-000000078za-1F40
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:53:32 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-befee9e5ef7so778059866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781081609; x=1781686409; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=69R1izJHdq6eU+4kabS2mn4P5ih6+n31cQPINhDIjLU=;
        b=jfrCvwMPg7OXU45ISI8DKgzLX4NSoux54eedlkAgnGVbMKPjTFdMfjJOMh0xFHrmDj
         +ijYQJpVxyGfZEqRUtmnvWpKCNNwMQwY70RnDEK/K3esz1HEEulMCRkTveLm/DcxKaL0
         RxXAMtQAYrAw7sP0dbFzvSf7AH0jA0uj5+kd79CSiVz2KrmSkgB8PoOWHS/4Pt5bFUBg
         f3Au8w/6+k5H2hEXEGC1gJyFR5ruJSwcPBwFNyHR9hmRCISGiIcs531Nh5UBI06OhvGi
         iNjl57Bpmg+TDu2KzRAJQpiDqqA1yF7gP20+b0RxWD19cm5vmJStLe1RKR7FC7qU8xnQ
         5hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081609; x=1781686409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=69R1izJHdq6eU+4kabS2mn4P5ih6+n31cQPINhDIjLU=;
        b=hlWU4m/Fg9TpnQLY+UAZnVjCsvirHVkf+rFaEQ5JnmJmefg8j2UgTwGrAdri5lhjE9
         0V52yPxtMIBoj2kmGV1JoGU4IoFsWK73IDmROYaNOgx7GXNAdGQiSWp3r9lYvgirAIAP
         Kqh+KKo33IKTmLkEg80BMoryLBwM8JwCQK1j9UHBcbkBPzRA0oqzhgsoeRdIpAFaIPxB
         ENxlKO3AC0JpQKKR+ZibnV4Yd7kC/YFPrOTwZEZ++QqepHHagqdTemSebxyChzKPbNwz
         ndL5wCUHz2kyJNckiGzbWUxorYsP5NOiUyWkBa41U9LAKgQKpCxmuzy9JbaCOwWeMWtw
         Lvzw==
X-Forwarded-Encrypted: i=1; AFNElJ8QOnY2eK6Kknu1+29iZx350UUe/5poUTUSa+QmxOxexdS/of4xg9/WLYNbx4KiNx2F4FJdcrTc9AYRJ3IM6teY@lists.infradead.org
X-Gm-Message-State: AOJu0YzovC3wC19Nh/XBZP9nHP6EPxU0JmeSTnNk9GcTI9XXUaM++VbK
	FXNOKTcJ7txoiz6mRSLTuP2dJqupCF+BuJ10udSQTVuhWhW2akyycJVJ0v70gcHHFQ==
X-Gm-Gg: Acq92OE80i4IZpp4V6rSDObP5D5cfWz5ETGL7gyAr0p5rD2U218tF1PhjHJEK9gpUfb
	9Pa3QHFbDp48wFP1E6Um1DszMG5/okKBwWOjWlvP9rF+MTL1WPxKsUsyqPZR2G+oLPsb5EE66Bl
	oyJT1BPUv7Sjqsjgdt35h7D+A0CgYD0sQIUVDAT8MFKmM7HEk5Z1+Q7WbtDySqLobVgxGv1W37r
	lFYh1WvZvod6wxKTF+7ABowgZ48/QLUK92dtsWt+4Uc+D55gEiQe3a5ziYkGrzNFxWRXTcBWBBE
	+MVwHIFmv24lfNoQdLK7Nf+ACoMS1XUohVBMFmMneopmimY2QlqxhI85fdwHVqmFLwuZZCD7WMT
	BJv5tRT0WP1rMlHEoa5JkVmpmVGlgp/4MKssQ/Xp3swMtTcPHs3jBD574OgFvoHHEWOX116r5fZ
	BdsoZD6WpJ/Asq0wtJgP8hDOAsxEfSg3J3UwI8Lk2tuB/gKP9cyODWGetFkoo/6oFOsF7Ut6G5+
	5YUkmXzDlsM/CnK
X-Received: by 2002:a17:906:4fcd:b0:bec:436f:1857 with SMTP id a640c23a62f3a-bf3702817e4mr1205610366b.7.1781081608995;
        Wed, 10 Jun 2026 01:53:28 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553040a7sm1153912066b.50.2026.06.10.01.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:53:28 -0700 (PDT)
Date: Wed, 10 Jun 2026 09:53:24 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v2 2/7] KVM: arm64: Support
 FFA_NOTIFICATION_BITMAP_DESTROY in host handler
Message-ID: <aikmBBHEUfolXrHC@google.com>
References: <20260608165549.1479409-1-sebastianene@google.com>
 <20260608165549.1479409-3-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608165549.1479409-3-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_015331_348453_4A2A4682 
X-CRM114-Status: GOOD (  20.33  )
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

On Mon, Jun 08, 2026 at 04:55:44PM +0000, Sebastian Ene wrote:
> Allow FF-A notification bitmap destruction messages to be forwarded to
> Trustzone from the host.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index c20d45191085..91e89d889c44 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -688,7 +688,6 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_MEM_DONATE:
>  	case FFA_MEM_RETRIEVE_REQ:
>         /* Optional notification interfaces added in FF-A 1.1 */
> -	case FFA_NOTIFICATION_BITMAP_DESTROY:
>  	case FFA_NOTIFICATION_BIND:
>  	case FFA_NOTIFICATION_UNBIND:
>  	case FFA_NOTIFICATION_SET:
> @@ -893,6 +892,26 @@ static void do_ffa_notif_bitmap_create(struct arm_smccc_1_2_regs *res,
>  	arm_smccc_1_2_smc(args, res);
>  }
>  
> +static void do_ffa_notif_bitmap_destroy(struct arm_smccc_1_2_regs *res,
> +					struct kvm_cpu_context *ctxt)
> +{
> +	DECLARE_REG(u32, vmid, ctxt, 1);
> +	struct arm_smccc_1_2_regs *args;
> +
> +	if (ffa_check_unused_args_sbz(ctxt, 2)) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if (vmid != HOST_FFA_ID) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	args = (void *)&ctxt->regs.regs[0];
> +	arm_smccc_1_2_smc(args, res);
> +}

Sounds exactly like do_ffa_notif_bitmap_create. Could we use a single one
"do_ffa_notif_bitmap" ? 

> +
>  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  {
>  	struct arm_smccc_1_2_regs res;
> @@ -954,6 +973,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	case FFA_NOTIFICATION_BITMAP_CREATE:
>  		do_ffa_notif_bitmap_create(&res, host_ctxt);
>  		goto out_handled;
> +	case FFA_NOTIFICATION_BITMAP_DESTROY:
> +		do_ffa_notif_bitmap_destroy(&res, host_ctxt);
> +		goto out_handled;
>  	}
>  
>  	if (ffa_call_supported(func_id))
> -- 
> 2.54.0.1064.gd145956f57-goog
> 

