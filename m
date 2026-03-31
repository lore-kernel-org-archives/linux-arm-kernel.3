Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE9D1061B2B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 02:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXnJaJoemcaiDGH1WZmG/hzLsuogYk0N7x2l4+nhrvM=; b=u/EtG2Bus5bYyzfIQuCQXpbwTI
	XjT5r9jXxKcTBcgmuilv1Q9DFPMtbVaH0myET/sK2b+NpmLhYT+ysfd08RRYAjMqcp59pWRnriOt0
	QziHG5j9RhnIVkK3X2daRcG/r5QcDXYuaznGO97we0SKT0/r7kWaUYdCxI9Qn61XwJkitLRPqChOg
	q/WX0y19SpXGp945lOYJ1gKm+rGO10J2HiUz3CqZSlkiT62XhvzNDRcHtRtXgMoz2Qijxd83sq/Bq
	Z7cBfkYxqPYc2aYC9XAmt+afpkg8GkgW+lO2XI3tGhCn2Eql0jKgm8yX/uuzLfeSoxY4vSFCkNMtH
	1MCoVxuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7P2a-0000000CC3U-37rv;
	Tue, 31 Mar 2026 02:41:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7P2Y-0000000CC2k-1a5Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 02:41:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so68225845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 19:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774924871; x=1775529671; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LXnJaJoemcaiDGH1WZmG/hzLsuogYk0N7x2l4+nhrvM=;
        b=P+xpesSE8vk6xsqUTk4HzTz9Z7uu46DsQea1c6ElngFHRjXpPnUOLr7ofHZPO4aQVR
         6MQSTg8WMR9wvrBW3KQwkKEiMXIs09RdeaMDXm/GcGIfuHMlPIVdRDtENWrN43+TJPXo
         OuSl8JoK7THKELbtvcTjhgm2PRLxC39XWMrsTEUP+wKZBXMq6J5hB9Vf3l3hGBdVAXG2
         KnIcRPIdhDTqe9gJgSyp9z50Of56uWDQh6f6X6Or72htUiqyBOCGubkWkKychnOTe3Ow
         m9yTPrN7NAwUWJ4F46PjDObJxkrBAmondeQx8A1cDB4vgoZYMj6bd9IKeimHTT/35yab
         e7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774924871; x=1775529671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXnJaJoemcaiDGH1WZmG/hzLsuogYk0N7x2l4+nhrvM=;
        b=Z8ZS771PkJUX+txKE88Km2R4w6C1FKr3ARmqs+c5ZV27q0GV20ptJte+UkHpOwBvFy
         XsntOMT+SS2pnjVYXJer9o8xXgqo0XA0yn9cmRyWiuNiXCdw+1nyFQ9VLCE9HePrj51j
         fxPtqPtFbjXu5p0OOqYd57EZ/fevXBWQtWKQP1zN9dDAuA5Uipj2NEBJDqDnG3mb5D0d
         eY5Ex8jSH7qt1dlYAfwkNfYeFkMzDOVL2m4QiasZE21ZbfHgHPSIn/x+P3qb3rLgXVpN
         ZKIe+bqNAygPIkq+xDOri30hB3Us7J8lcaZ/7ILW+Gq/rbI93JzMdmlPrbkbQoq1YZas
         vMcA==
X-Forwarded-Encrypted: i=1; AJvYcCU483lP57DuGsjHe60B8Kh79yYcBKpVG97LPF9U3YgZqdr/anywuOKoxwB6f8lXYCtIX0t91bZe1y9WkGynt4pP@lists.infradead.org
X-Gm-Message-State: AOJu0YwrIA5Zn5kzE81f1cAJUK+Ua+aiJ3ovlWFZcHnbbERa2Jx63Sbp
	Us7hR1a6lhtZMkx55WxIJ8OfJaEvf/mNxF4j+bq6qM9zGl9iX6VHY0HwT94txUelBw==
X-Gm-Gg: ATEYQzyQAMVUDF86PeRUpClcvSq4KjpueaaVCeKSd8aj/VtLAokHlqpbehimhAgAvtW
	gojzgZ88kaLsMfS/KxIE4kannBQuSkiDpqNe51eIsLQ8FyObcyDUnzhC6L9eqfLkgsM9Y2KgATj
	w5k7Kwno4R/5rdabhb+AV2cIcqKGwGRGa1fBFg/t/bRPZODuWs5IDJShETK3hBm5ccXyL3mPGLy
	2+moy79eX8yTLk+ieQhbQgSFkEMfBdgo06+gW7geZmHiW6qxg+RE6i7Vmhk9JFJ1xWtIOHfYqlW
	Cl9y8FCP0tp3vhJd1aUnlNsPOCpV9uc8rQ8CEWYsZEmakq8r/Z5BIjA9FhgQ5M+id9iYPOUxwh8
	/hRQO+ZRdsOWfxyZaqXxbm8YVgH9bxNk+dKki13VT8NT1ep8fNymsXzXLs43IuZgFfbMNr4xW60
	h/mnMpcPgLAMY8MQ1jjv4z4j0uuAO6uP9IiEnmXkMrg/+44WCHLCykMz6hcgkKkJlZKhI=
X-Received: by 2002:a05:600c:c090:b0:487:338:b4df with SMTP id 5b1f17b1804b1-4873de6ca3dmr61799345e9.15.1774924871032;
        Mon, 30 Mar 2026 19:41:11 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873062ec9bsm219312745e9.7.2026.03.30.19.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 19:41:09 -0700 (PDT)
Date: Tue, 31 Mar 2026 03:41:05 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com,
	maz@kernel.org, oupton@kernel.org, suzuki.poulose@arm.com,
	tabba@google.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH v3] KVM: arm64: Prevent the host from using an smc with
 imm16 != 0
Message-ID: <acs0Qbjfdmlkvd1e@google.com>
References: <20260330105441.3226904-1-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330105441.3226904-1-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_194114_452960_68E0BD16 
X-CRM114-Status: GOOD (  26.42  )
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

On Mon, Mar 30, 2026 at 10:54:41AM +0000, Sebastian Ene wrote:
> The ARM Service Calling Convention (SMCCC) specifies that the function
> identifier and parameters should be passed in registers, leaving the
> 16-bit immediate field un-handled in pKVM when an SMC instruction is
> trapped.
> Since the HVC is a private interface between EL2 and the host,
> enforce the host kernel running under pKVM to use an immediate value
> of 0 only when using SMCs to make it clear for non-compliant software
> talking to Trustzone that we only use SMCCC.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
> v2 -> current:
>  - move the ESR decoding of the imm16 in the handle_host_smc where it
>    was supposed to be
>  - updated the commit message to include the reason behind while we are
>    not doing for HVCs as well
>  - updated the commit message to clarify that pKVM is not handling the
>    imm16
> 
> v1 -> v2:
>  - Dropped injecting an UNDEF and return an error instead
>    (SMCCC_RET_NOT_SUPPORTED)
>  - Used the mask ESR_ELx_xVC_IMM_MASK instead of masking with U16_MAX
>  - Updated the title of the commit message from:
>    "[PATCH] KVM: arm64: Inject UNDEF when host is executing an
>     smc with imm16 != 0"
> 
> Link to v2:
> https://lore.kernel.org/all/20260325113138.4171430-1-sebastianene@google.com/
> Link to v1:
> https://lore.kernel.org/all/20260324135728.3532400-1-sebastianene@google.com/
> 
> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index e7790097db93..461cf5cb5ac7 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -676,8 +676,14 @@ static void default_host_smc_handler(struct kvm_cpu_context *host_ctxt)
>  static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
>  {
>  	DECLARE_REG(u64, func_id, host_ctxt, 0);
> +	u64 esr = read_sysreg_el2(SYS_ESR);
>  	bool handled;
>  
> +	if (esr & ESR_ELx_xVC_IMM_MASK) {
> +		cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
> +		goto exit_skip_instr;
> +	}
> +
>  	func_id &= ~ARM_SMCCC_CALL_HINTS;
>  
>  	handled = kvm_host_psci_handler(host_ctxt, func_id);
> @@ -686,6 +692,7 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
>  	if (!handled)
>  		default_host_smc_handler(host_ctxt);
>  
> +exit_skip_instr:
>  	/* SMC was trapped, move ELR past the current PC. */
>  	kvm_skip_host_instr();
>  }
> -- 
> 2.53.0.1018.g2bb0e51243-goog
> 

