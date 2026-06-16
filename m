Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22D2CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 13:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YK1mdYovXCET+aePqJYcxlz0Er7guRuMQroVpfBxRaQ=; b=VKd90FwgxB2xacucCBSsLM1cXJ
	vSWUtqoTOroFGnUgiMqogSoRpEiSn5z7NK80VvkgJls83Lj2MIFwNfdskF6S42Yuum+eisbiEQ6Px
	Gym59prWPIXqTSAthf4Rgpgf4b+m4Hmw/9WLtGJbL5Yj/w7u9a+deHMDyZ993TlXgOjxnNpj36aRv
	APARsIefAKDoY7lgV8+/DqcIuUewZ991bPMZpktz43sDQAmS4FG0vN12yagjP1WbzB3pnL6XA96Ys
	IjIYh2g3k0VB2MsO5i+EgF4XmzWJWbzE6qooTP5PMFQHRAVCAJHeSw+viaDZEE3pSPtpYP6xDtR9W
	B1cTKGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTos-0000000Fq1n-14NZ;
	Tue, 16 Jun 2026 13:27:10 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTop-0000000Fpzd-1AgC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 13:27:08 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6913fb25322so5916842a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 06:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781616425; x=1782221225; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YK1mdYovXCET+aePqJYcxlz0Er7guRuMQroVpfBxRaQ=;
        b=ThCCMr2kQkepaiZm7vMPeWd1FSpBxFlGm0B8dJ8Pj47sgL2pXAfPOXifNaRYN9hOcb
         ZbeJgqsTutBfq7AQq0rpypwgx9d4XAcwwrPrY/BvNmLGwAkj+W+tqhkIBTAyTp4gAxFp
         sVYWNkuDwnl2y2XQY/yEZBJOEDNuThOghMdxMmGETxFvzUvz6xJHOqEf/M0zHQ4LiUwU
         d+wkfBx0iWcbScSKU27WfYHUET9W/8k+WEHjXrq7wlsVlM6qqpGSi4/Z4FOs7uCoo1CN
         9MbkK3TrHkV/26wc5TTwJXk8K2RnaS8UleJwGD/bvQlNQA4B33VJCgLCqoBZlRktIB6O
         t+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781616425; x=1782221225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YK1mdYovXCET+aePqJYcxlz0Er7guRuMQroVpfBxRaQ=;
        b=ZikhPe9IE0zcZxzIrfJZn2p9lYV1nN9Z+ZF+uVnaniRU7GWp89rtSHJrnH1eDCfNf3
         u25h5XKpksB+ceARpIxJZsFCNW85e1NearjCKggHOXGqKJ+qtlsBnGtNe9xALjW1f7DZ
         x+s7xB2BBf2yEUB+HU8gIc5wink+oNJROSajSrwB+40UrjOqEasm3YtDjExyWtNCSJ7j
         6Ys7h0gd8Tp0pz9TJq5E8kdeNlqA3i5MKe9HtjjtK1IsHjx8a1byhQPNwfnLlTw/zG0Q
         jPoPqoeeYKCVfqZZbSdBlAqNhcr7qidBFXyA1NCVGkbmD1YJaOfeArGiL1ZAechAgY8O
         YuUA==
X-Forwarded-Encrypted: i=1; AFNElJ/Tdgyz5mCP0ZWjO+uXHfKRP2Ubxs+6hhWjH3PuwTvC55HjAavVQOHLutwFV8TW03LDMjk29YQGYhDT6jnPFlf3@lists.infradead.org
X-Gm-Message-State: AOJu0YziuwVgn61qMtWgyPaNH3h6wCbvAWMorBymTAdoVOvjC/JMa2DF
	LKls/Sr6SRsbHFRPxfLzA957gNiU81DvK7BkwTqlzIYJQv412biduzsH+DPSmACPPg==
X-Gm-Gg: Acq92OGT/kFpta18mMFOMpXQqU45b9+/hL5VDjVpU5+8W1M6G50xr+VIS0r/Gs6gnk0
	KLXluN+7RN4edyPXKAgyMCefJVGcfETD6YFulW4F+5rOgOhE81UZnEl7kyd1wtF/g+mEkgHa2aD
	2ivsRSnHFB6c7vJa6OO3/dU5JTvapkZWdiK5RD/R3FJrope3HA9Sij0mgMWDbUy+/5dj3dwoRvl
	c9FiINPZTPeomojn7eGHYpIRUkBFyEUG8qtw7YlIPeU1izcpo9J8GnwjvzwbmpJKBoeVIGvin0P
	1Mi18VgGVnoGKt6PtM6U4HVz5iPZj8CHqAB3uwqPtKEo34gKOmFt63STuu3qm9JouRGA1fbcOPk
	+zaL7o0e5zDhrQXSuR3vHnWpiPPCCQ4eZKhQV/6mJgB2IoJ3kAf7QAALuoez5ZaDMi/IzsZIoAp
	3N+NLR2k1oL5ItpijhKooNbOEV51KZb6Pg+DlY+wcI4Hv1Ahpa8Vg+axfFDZcQbjCFYW0=
X-Received: by 2002:a05:6402:5d0:b0:691:706b:183a with SMTP id 4fb4d7f45d1cf-693788fb0c2mr9398945a12.6.1781616424703;
        Tue, 16 Jun 2026 06:27:04 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937938a524sm5111182a12.18.2026.06.16.06.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:27:03 -0700 (PDT)
Date: Tue, 16 Jun 2026 14:26:58 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v3 6/7] KVM: arm64: Support FFA_NOTIFICATION_GET in host
 handler
Message-ID: <ajFPIhMGsjqAbtN7@google.com>
References: <20260616105417.2578670-1-sebastianene@google.com>
 <20260616105417.2578670-9-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616105417.2578670-9-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_062707_333862_32007E47 
X-CRM114-Status: GOOD (  19.91  )
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

On Tue, Jun 16, 2026 at 10:54:15AM +0000, Sebastian Ene wrote:
> Allow FF-A notification GET messages to be proxied from the pKVM
> hypervisor to Trustzone and enforce MBZ/SBZ fields.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index fcfaa441770d..549250ff8f82 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -715,7 +715,6 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_MEM_DONATE:
>  	case FFA_MEM_RETRIEVE_REQ:
>         /* Optional notification interfaces added in FF-A 1.1 */
> -	case FFA_NOTIFICATION_GET:
>  	case FFA_NOTIFICATION_INFO_GET:
>  	/* Optional interfaces added in FF-A 1.2 */
>  	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
> @@ -1001,6 +1000,26 @@ static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
>  	arm_smccc_1_2_smc(args, res);
>  }
>  
> +static void do_ffa_notif_get(struct arm_smccc_1_2_regs *res,
> +			     struct kvm_cpu_context *ctxt)
> +{
> +	DECLARE_REG(u32, flags, ctxt, 2);
> +	struct arm_smccc_1_2_regs *args;
> +
> +	if (ffa_check_unused_args_sbz(ctxt, 3)) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}

Shall we check that the endpoint ID is HOST_FFA_ID here?

> +
> +	if (flags & GENMASK(31, 4)) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	args = (void *)&ctxt->regs.regs[0];
> +	arm_smccc_1_2_smc(args, res);
> +}
> +
>  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  {
>  	struct arm_smccc_1_2_regs res;
> @@ -1072,6 +1091,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	case FFA_NOTIFICATION_SET:
>  		do_ffa_notif_set(&res, host_ctxt);
>  		goto out_handled;
> +	case FFA_NOTIFICATION_GET:
> +		do_ffa_notif_get(&res, host_ctxt);
> +		goto out_handled;
>  	}
>  
>  	if (ffa_call_supported(func_id))
> -- 
> 2.54.0.1136.gdb2ca164c4-goog
> 

