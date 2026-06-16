Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F883CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 13:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnzW1lCgZUE9U3suyJwPj7ScgyD/az5VlYfMmVApb6U=; b=maLuCN1BbxVtRdpJ910/qhf56+
	hcbreWpsjBwo99HmZez2z4xBQSDrTtLP2gbvpnVEv2eoSBCG+l80mleXlxxeOfPoGgiytUgfLQ728
	userdoY9/7BBqyx0CfGjuICAlGIIvI/zcqU/pEVDRwY3Yiq9IjPvvi9P6XT3SoOccaAnthDwj+eAq
	rcc8v9TeWeTm0S1fyG+NnuF4rfyGJ7GDbGZvNccZ0/Ja7p0zVk9AMGzUrnycmZHk7gEcDyj5etcED
	xy05rf8heKF3Uj+H/HTBHfj/eIAP2UH9c5nsVCydNCbwdC16hhx0q/nUgUchM4saBUkqEs0PgOr8W
	3Utq1+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTUl-0000000FoSR-27bl;
	Tue, 16 Jun 2026 13:06:23 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZTUj-0000000FoS3-0rfH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 13:06:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-461edb387ddso159131f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 06:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781615179; x=1782219979; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QnzW1lCgZUE9U3suyJwPj7ScgyD/az5VlYfMmVApb6U=;
        b=TwQpGWdSjZkOasUSh9qeoaYAe4vm8v1kzrtTN/4CHk9O0PeIsXuWDCZwlX65SMiH3R
         Xp1VgxIJG32d3PlVI8IAsjCfX1nL1Yqn6MUApBYUHjVHs3y0EMGfIPIvrr+mBFItE/fh
         CUFdjv/bXIgCHzAyLauuCdkQECJH0n4v3/dJd3kPvloL2Lpj+fsCzPsxXP+14A0yorwq
         gow/i1YLm/DaDZ1ujPkpir+KgxFhlxIquGcLwTl69LBE8hXrvMYizCzoJ0CSjYArtNUs
         6eHCZbc9yE2u1FJaWagjAyy3ewTa0L8jjkT52t4NyeEA/KHf3svKPC1pbaFd50CP8DmI
         ilzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615179; x=1782219979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnzW1lCgZUE9U3suyJwPj7ScgyD/az5VlYfMmVApb6U=;
        b=YZli52WMym2ShOEWn9Y2Uu/FP5AZnKAa7L+62RBUMWj2jV2+zOiX/zIr+RM42z2IlU
         v+iDuZ4wzpz1unjAAjDPT22vh1JECfmBKOStUKz6ScSVhGg/7Bl4LiKTnRwxaSiQxE2z
         hFA2zbh/KYsSjZa49UuzWVZETnO/C5S48SWkuT3ExDWy+7Zjl3oh05DKhX2vHNNx/IL9
         dE+YFhkGlQ7nu2nWBxvbszj85KMp5qQIKy90M+IE0ydJemjqcsGPb6pdoHAB6Y9+2ADV
         dNF30fZhRfN0gRA0qpn9hnVazjjA+PBplO+XBZdnfk/VaDARO4Ca824JvGGFas4/qXbl
         qT+A==
X-Forwarded-Encrypted: i=1; AFNElJ+6ZgPifiXSs7JRHDa3HiPz+6o3aUIb7Bi4satYYpPI66qcb81Lol8hEdyGOFDlx8m1SXR/M+SB9JxuYScMOBJX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6qfU4oSWaMHbwW/qV0NUeTGrYj93VAfZfdhgD/zX61R0OhcDJ
	NdqXqRJXSryGpTsSOrCuGMpDPkZHlO79qxUp98L13rQl+bs5PpfNCQQtMOaeSj8nfw==
X-Gm-Gg: Acq92OH9v8JZTyV2fy0P+eKub/eU0JgzyveV4O0zqfogCHN2M5YRSeKpq3xJM5SEkYw
	c+nziEwLqkysu8+R7vLYKJRFfikaOscULeLuRqGS6FaxsvpdX/FYqrYWtHDRcJZBrul9gYKgPVn
	losL6q9wHEHICpoyuKweY+f7xh3fqj4tfUF/de9HFW35eWNNXD7NKn6+P8IAnbYGQCyPBOmL/mq
	dE1WJHq+Ev2yL31YovBqvLWDa1fvt3zGkLAAN/vg5IVNo6XaxmhXn87gnUaPiNMDhwKv+rYKX1f
	wsgczP9/Rx5STAeEIJe/6Uq6ePVipNS81ETl4ahHwkKP5JDhCc0ksbDP3RzjpgsYodtODKMMtGE
	FmF2voHLSSvi7ufCAKUT3GvcA0YLtFo2iFWaBf5o3QzK+98qzN8VD6kqunmfW7KoOcMnsMPenRa
	Tw03ctczBeEV8lpt2v/XqrTzciWEDjpdDeC4F9Cv25ofr/+wK9vavThsxc8p7D7tTlex4=
X-Received: by 2002:a05:600c:46d1:b0:48e:6db3:ff3a with SMTP id 5b1f17b1804b1-4922ff7bc90mr57743445e9.16.1781615178301;
        Tue, 16 Jun 2026 06:06:18 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47ce3sm88174375e9.6.2026.06.16.06.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:06:16 -0700 (PDT)
Date: Tue, 16 Jun 2026 14:06:12 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v3 3/7] KVM: arm64: Support FFA_NOTIFICATION_BIND in host
 handler
Message-ID: <ajFKRFj8vp_KqrNc@google.com>
References: <20260616105417.2578670-1-sebastianene@google.com>
 <20260616105417.2578670-6-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616105417.2578670-6-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_060621_342027_7FE5BE77 
X-CRM114-Status: GOOD (  24.02  )
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

On Tue, Jun 16, 2026 at 10:54:12AM +0000, Sebastian Ene wrote:
> Verify the arguments of the FF-A notification bind call and forward the
> message to Trustzone.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index dc7496ec295f..3d8ed829f558 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -42,6 +42,8 @@
>   */
>  #define HOST_FFA_ID	0
>  
> +#define FFA_NOTIF_SENDER_ENDP_MASK	GENMASK(31, 16)
> +
>  /*
>   * A buffer to hold the maximum descriptor size we can see from the host,
>   * which is required when the SPMD returns a fragmented FFA_MEM_RETRIEVE_RESP
> @@ -713,7 +715,6 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_MEM_DONATE:
>  	case FFA_MEM_RETRIEVE_REQ:
>         /* Optional notification interfaces added in FF-A 1.1 */
> -	case FFA_NOTIFICATION_BIND:
>  	case FFA_NOTIFICATION_UNBIND:
>  	case FFA_NOTIFICATION_SET:
>  	case FFA_NOTIFICATION_GET:
> @@ -929,6 +930,32 @@ static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
>  	hyp_smccc_1_2_smc(args, res);
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

"A Receiver uses the FFA_NOTIFICATION_BIND interface to bind one or more
notifications to the Sender"

Does that mean that if the host issues a FFA_NOTIFICATION_BIND it is the
"Receiver" and not the "Sender"? 

(Same for unbind)


> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if (flags > 1) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	args = (void *)&ctxt->regs.regs[0];
> +	hyp_smccc_1_2_smc(args, res);
> +}
> +
>  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  {
>  	struct arm_smccc_1_2_regs res;
> @@ -991,6 +1018,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	case FFA_NOTIFICATION_BITMAP_DESTROY:
>  		do_ffa_notif_bitmap(&res, host_ctxt);
>  		goto out_handled;
> +	case FFA_NOTIFICATION_BIND:
> +		do_ffa_notif_bind(&res, host_ctxt);
> +		goto out_handled;
>  	}
>  
>  	if (ffa_call_supported(func_id))
> -- 
> 2.54.0.1136.gdb2ca164c4-goog
> 

