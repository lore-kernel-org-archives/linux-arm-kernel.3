Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693FBCD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIkvauF10sSe2Poa7JVmuLLeALb9mXVPDLiKngYfXa0=; b=cy+VSBWCW4TbQuCB26UGcvgf3J
	yKaz5JKXffAj8teprog1+hf5uKhTNZm1ZRFZ31p4Aaplv4tKO8u2Ay2HF+Oxec2JV78KNgrU1m16P
	KmEuXfgRMKCMvuSu/FAdL+amI+tlSjR7cYWinO5tkLX9APocY3wlll52DAWKHxuaMhUHTHMRL0qZ1
	iarYkZzxydwWFhgs06NYcGKD3MrbNmZ0d803TcSzBq2AiTD/4EQ3efi67afk7jZPfnLe/fKDsDvLa
	rOajNJCriMLxH6xXHhCmfo9+HtIDWGEvWiWULOGlxkamKNWmNhcZW+XvivvbYsFdYiDdKhfpAcvRL
	V93SmwSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTCJ-0000000Fn4K-30tR;
	Tue, 16 Jun 2026 12:47:19 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTCH-0000000Fn3m-3716
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 12:47:19 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6914a658115so5793407a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 05:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781614036; x=1782218836; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MIkvauF10sSe2Poa7JVmuLLeALb9mXVPDLiKngYfXa0=;
        b=WCpUQcy7zRues4abNI6oN9PoiNoXwMAFw+/+LGok5ndXRlha0oqJ3wPEsn76Am0KTp
         CvOTQER3k0aYXbH7PT3p6ICdCyhi8IX7rBZStsuRpalHu08xHkGgkZnOVZ2oUXTAx0e0
         tyeckj6SNedsk372B7BNQ2AfA4LZqwVOqVk+qkwOCP2zNVoyo1p+Yt3QYWc3R7hH/OeS
         O0qRFT07PoWWWVmljiRKN4Auf3PpoXjzESFOayXDjhaMj231fB1jHGTW8BgCdeKyIhRD
         U3AY7KJNJVJEk2btggmytUwotC799N+5S7j6Iajcrt6GJRSnYNjkROfUFKRCtGs8QZXg
         mOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781614036; x=1782218836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIkvauF10sSe2Poa7JVmuLLeALb9mXVPDLiKngYfXa0=;
        b=noLEfWsoW1NwWZ/Y+UhXB/Rh+o32jgF0Hp+UafGRyl8ev/RWxVOOqSdeekGFnH1mmM
         qf2A25xNiPBhYOUWmEsqdOL7FtUXhmy5w/yxApIZLKl6yL3cUsO5xvz/nuV53UkkIumN
         KFgLNSKbhAqdFPrtI8IM+LSo/jVGfBzpd/GQgfTDPEDYT1Y5JOcPOV9N/wr7EVyI7RQL
         iDLZL8GfdKqzTsKpJdRxKu5LSKXsMBse6Az3uFioIyRIjGpOjDC2jamJimk5cT9BXt8Z
         5MGdIRYyHbvvo5i/5ZX91rhuQCZ7F6/hU0ixI3oJjwOBHQlMYuHaDRoJhafqbi30XwEN
         R5sQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0tVEAYUUh7Z9Xdzy/oZPuo6KeSdXTDVlVxmcvUsbz+bT0ZsV3Kc0+GmgLbHpYlkRZ+tISDUExdsFV2hpuynU7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8azyy8eT0ryh7BZQcyAcND+8v53v1tQyO55hxZ8IruLxys863
	c2rRCsNywfJkwp/MPHlzOLLK2ISd35cIBC0TsTLgPAfuBi3uc7KiuYm/Y+YAJ+VbPA==
X-Gm-Gg: Acq92OFJUD4rxKoMuOvemJwb3NA5cbnQatq1hGk/4NU6quwXDRp+my7fNWiZ3VHSt5i
	8+z7yO1DDJFfwg8P30DBrS+8qBdcakiXnVcE3tJAFEMGQMY1j3JEcg1bOGDd0RbTUhsWgrz7RTw
	lItE/QmDRaZfvfivS/Sk3d2tCCthQaDYACqfBh+N59ysU3bq9yCZUp/5iC1GTMKh05MmPaLBoZA
	P60SEIeM+UsJm5Q6tAr46uD7oBKJkn9Xi1rsOJZpBi6zzdStqwwPBYKCaUwMFCpcuOuGBfL4rGv
	qR//AArtnWOy/sURSxefZ5Kysrvlg3GzaOyS72cmbe1oUFE5FWSnedhp2i7h65LfdxZWsHsJz6W
	f9jBLTI94X59qa8/2ydiwv9FIESCoFoLHR/bOGg8HXYgeLtmcEYiPOspF4QZF+g4smN9ObicJ2O
	V3UU8uoN+6E5eCJBHp8eSaMs/w7+VrnPvGp5nvoCyjKgoIgHbeC+d40tgg9mDrAeSW1rc=
X-Received: by 2002:a17:907:734f:b0:bdc:9d94:3257 with SMTP id a640c23a62f3a-c043cdcf4c9mr126540566b.14.1781614035236;
        Tue, 16 Jun 2026 05:47:15 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d9b7sm644734366b.41.2026.06.16.05.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:47:14 -0700 (PDT)
Date: Tue, 16 Jun 2026 13:47:11 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v3 7/7] KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in
 host handler
Message-ID: <ajFFz0mE24ZcusuP@google.com>
References: <20260616105417.2578670-1-sebastianene@google.com>
 <20260616105417.2578670-10-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616105417.2578670-10-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_054717_828253_58658A52 
X-CRM114-Status: GOOD (  19.03  )
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

On Tue, Jun 16, 2026 at 10:54:16AM +0000, Sebastian Ene wrote:
> Allow the host to query the FF-A notifiction status and proxy the info
> get message to Trustzone. Make sure that the SBZ fields are enforced.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 549250ff8f82..dac30a5fcf5a 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -714,8 +714,6 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_RXTX_MAP:
>  	case FFA_MEM_DONATE:
>  	case FFA_MEM_RETRIEVE_REQ:
> -       /* Optional notification interfaces added in FF-A 1.1 */
> -	case FFA_NOTIFICATION_INFO_GET:
>  	/* Optional interfaces added in FF-A 1.2 */
>  	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
>  	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
> @@ -1020,6 +1018,20 @@ static void do_ffa_notif_get(struct arm_smccc_1_2_regs *res,
>  	arm_smccc_1_2_smc(args, res);
>  }
>  
> +static void do_ffa_notif_info_get(struct arm_smccc_1_2_regs *res,
> +				  struct kvm_cpu_context *ctxt)
> +{
> +	struct arm_smccc_1_2_regs *args;
> +
> +	if (ffa_check_unused_args_sbz(ctxt, 1)) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	args = (void *)&ctxt->regs.regs[0];
> +	arm_smccc_1_2_smc(args, res);

	hyp_smccc_1_2_smc()

ditto FFA_NOTIFICATION_GET, FFA_NOTIFICATION_SET, FFA_NOTIFICATION_UNBIND

> +}
> +
>  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  {
>  	struct arm_smccc_1_2_regs res;
> @@ -1094,6 +1106,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	case FFA_NOTIFICATION_GET:
>  		do_ffa_notif_get(&res, host_ctxt);
>  		goto out_handled;
> +	case FFA_NOTIFICATION_INFO_GET:
> +		do_ffa_notif_info_get(&res, host_ctxt);
> +		goto out_handled;
>  	}
>  
>  	if (ffa_call_supported(func_id))
> -- 
> 2.54.0.1136.gdb2ca164c4-goog
> 

