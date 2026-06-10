Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB11CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 09:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzwKzXJwppFYu28O2GOVJSLTLDQbIld8hQ+mf0ErcfI=; b=M1n30T7x9IqDSv4BpOMZWhQe65
	kIqE2INFEVjVdlVoFta/R3biGOAtUg7p488q1TRtGycCmk/qzoniXbcLOJnOmFOWhS70Gy6lzmCvV
	3x3UK6dMyPa7p5z3uVJneSDvj37UTh9nk7NSvn+8c+c91Anr8lc/wlTmqSWKt+Fut0Po+cCummHej
	t/qLyLtzHbHlrLhPqkhwVfVU0Cw6/4pvMsbFgNcQuwVXEBI+VcRmLl80teb7l6MLGoL4EZlOJOdm/
	GogMHtdFwdfolosnSyl6wGFgYsfSI0hMJT/d7oTK+zhZShCVCpNcCX7FcP7E+Ujtr/S3AM7Gy/O8m
	r38vbNQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEqn-00000007Aiy-0f3R;
	Wed, 10 Jun 2026 09:03:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEqk-00000007Aic-20cG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 09:03:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so37978165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 02:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781082228; x=1781687028; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fzwKzXJwppFYu28O2GOVJSLTLDQbIld8hQ+mf0ErcfI=;
        b=PV/0eHFNypn5tvqswtVFT8SHCaOsW0RcsE9AZ49C7pOynDDKd2BCalASUG2ptCbvyl
         HX1bDAMXW6nTgVdEO9+XLqmT8ciDCCv02oNDjEQQBcufFlZFpCTPELVIOEuK6aY+udcA
         NLWL/XLdefTh1m0ADPfVQbfKJ1OvHhwcJ00hemwKPxbVrG4C0DU6nIfcYYoqGiW4ge01
         s7x8KErpnEU0+Ig1A+ZKxe41yBVROlpEgqhzDFzhlXMpZ18FveQYY5ogSx/qzucgd9o5
         pLoGcKckSrW9JErEiQRNz8IactVOy2x3vuPz5PDUmdK+LWMqJxGLEYAIMukYv0rZI9Yv
         dnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082228; x=1781687028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzwKzXJwppFYu28O2GOVJSLTLDQbIld8hQ+mf0ErcfI=;
        b=p+MEIfDmC22lBES4gYFku5UfneVOjSBB8cA2GDdhJQADcJITUUUOJRiThCBgjc4PDo
         jZBKErL8NPXWrfDzhUpfuuEIejJ2YRjvgcCuezva+V4pkAXtViDQqdz2rYtPDYeSpKsQ
         EDxmRS6k21dyPESduFmtjZSwjmChwtUWlQTF9+PDhYMmbpvUk39RhZMvFmcJSoR7KBZj
         2YbIBBY4iIFCpPWHu9fDru255znB2VvRQVbbcJCbZHfIbXjTkMog8RqA+tTIOU2UpJqa
         qpdh8JRhgRd3nEBuzOd4NbDm1gW9Hfdslwf6qy/tsoJg8riQ67TyqB7Ub0SNiFPJTThG
         SqVA==
X-Forwarded-Encrypted: i=1; AFNElJ+KAn1BPJdt8q3WC7K6OnPNvNAt1YDtoFbQ1zCKFEPXSYYZ6HphTalsJW/TwWlr0L/9aDYk/nX8RR/gbm0wMsq0@lists.infradead.org
X-Gm-Message-State: AOJu0Yymv6ZTBZnOJknMVEX1i3CbDirVm5F1nVRrrmY4x23WWlN9t2Up
	Db1kwhYILU8sIz+n7Y/PnHaPkUHr4XwNVnfJO6+OfH0BNFkh8HYiBGOqyKngXNW1pw==
X-Gm-Gg: Acq92OGH8/sZH8xcTfVvOJYFVRvjdnGw7Wj3+vdELrrz/dSXsWsMo/FHb2I4YZMkD0u
	1xHgFHlUea4UcvvAnAqQzD+7CNjFfk2rqWrx3xN8NYjsGgi4NPoXboKoTcIdgoZOe9k34DlDxZG
	0TGniR4uQm5DGObM7N5UB5tnltTEdeYri5VwxhBHSeDH1d2m3auRlZzXsHFyFQWw5GWLz3z9PSV
	ImMACNfQvzNrBcwCDu7VG96B0+bXK5ebQE4gbKOHmND2s8dG15LN32ArsRmAHS3005iPN/oF6an
	xvaZZQcNZRJQwCQoQH21fKX4zyjtJ9/Td7ax/SyjS/jyJb29t8y7GABft9u/3IoNG3Wfrap7GqT
	XucUW1eSimwe+UuOj8AnwLEFNhx8lDmpbKH/auEi05hWLgFq7OxzlQyYzMbpn3yKqjWw+k/wx+H
	jil4JW1c+VzoYMxVy9cr9u+RyughFSPBXjDbSK6bc9XiT0v38qCeQtq6DU8xJAWstNfyTRmOzWI
	wWT/w==
X-Received: by 2002:a05:600c:3107:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-490c264cc2emr399213575e9.33.1781082228081;
        Wed, 10 Jun 2026 02:03:48 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2eadefsm72447165f8f.11.2026.06.10.02.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 02:03:47 -0700 (PDT)
Date: Wed, 10 Jun 2026 10:03:43 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v2 3/7] KVM: arm64: Support FFA_NOTIFICATION_BIND in host
 handler
Message-ID: <aikobxnyWj_G2iPT@google.com>
References: <20260608165549.1479409-1-sebastianene@google.com>
 <20260608165549.1479409-4-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608165549.1479409-4-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_020350_537630_3ABA0B00 
X-CRM114-Status: GOOD (  23.66  )
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

On Mon, Jun 08, 2026 at 04:55:45PM +0000, Sebastian Ene wrote:
> Verify the arguments of the FF-A notification bind call and forward the
> message to Trustzone.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 91e89d889c44..eedb01955a45 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -42,6 +42,8 @@
>   */
>  #define HOST_FFA_ID	0
>  
> +#define FFA_NOTIF_SENDER_ENDP_MASK	GENMASK(31, 16)

Could we move the MASK definitions form arm_ffa to include/linux/arm_ffa.h?

> +
>  /*
>   * A buffer to hold the maximum descriptor size we can see from the host,
>   * which is required when the SPMD returns a fragmented FFA_MEM_RETRIEVE_RESP
> @@ -688,7 +690,6 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_MEM_DONATE:
>  	case FFA_MEM_RETRIEVE_REQ:
>         /* Optional notification interfaces added in FF-A 1.1 */
> -	case FFA_NOTIFICATION_BIND:
>  	case FFA_NOTIFICATION_UNBIND:
>  	case FFA_NOTIFICATION_SET:
>  	case FFA_NOTIFICATION_GET:
> @@ -912,6 +913,32 @@ static void do_ffa_notif_bitmap_destroy(struct arm_smccc_1_2_regs *res,
>  	arm_smccc_1_2_smc(args, res);
>  }
>  
> +static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
> +			      struct kvm_cpu_context *ctxt)
> +{
> +	DECLARE_REG(u32, endp_id, ctxt, 1);
> +	DECLARE_REG(u32, flags, ctxt, 2);
> +	struct arm_smccc_1_2_regs *args;
> +
> +	if (ffa_check_unused_args_sbz(ctxt, 5)) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if (FIELD_GET(FFA_NOTIF_SENDER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if (flags & GENMASK(31, 1)) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}

	if (flags > 1) ?

> +
> +	args = (void *)&ctxt->regs.regs[0];
> +	arm_smccc_1_2_smc(args, res);

And of course just like all the other functions, it should use
the hyp_ prefix.

> +}
> +
>  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  {
>  	struct arm_smccc_1_2_regs res;
> @@ -976,6 +1003,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	case FFA_NOTIFICATION_BITMAP_DESTROY:
>  		do_ffa_notif_bitmap_destroy(&res, host_ctxt);
>  		goto out_handled;
> +	case FFA_NOTIFICATION_BIND:
> +		do_ffa_notif_bind(&res, host_ctxt);
> +		goto out_handled;
>  	}
>  
>  	if (ffa_call_supported(func_id))
> -- 
> 2.54.0.1064.gd145956f57-goog
> 

