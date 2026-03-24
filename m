Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7227FF54AC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Cv1GxwGjsnJyKeumjJielENFU1WPaGfL15dJDHDpzM=; b=2+LuvPHcH5dipGy03C0X1zH5Mg
	ibT/ZY8bOOLdnZNM2aHrijjW4B0/G5MljlaPX0Y87+3CzEGqSSWnS0wE1kfcMEV8ffd1NDjWczP+l
	ZTy6N9K01OWn96Ycy+FK+gjsnQev12UKmGXh+/mChaufopJD340unDf/Jc6GQHUpOm+IxrOYO7uQm
	ljQOqkwubdW51U4jUYkvpEgwvDopFvVggbCQXzqi18p8xzcrMd1lP3NUlKZ28Cb87YzaY3wRWhO/S
	ytHPlnBxlMWiWmuZ4rWtIzFDPZs4KEXxuK3H9/zIvO8GKvugz7+UNgGYSP//Kxizybss5VPyZSxBg
	+OEadGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52PA-00000001bqb-2Zd1;
	Tue, 24 Mar 2026 14:06:48 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52P8-00000001bqE-165A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 14:06:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43b4d734678so1342286f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 07:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774361204; x=1774966004; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Cv1GxwGjsnJyKeumjJielENFU1WPaGfL15dJDHDpzM=;
        b=mJ+SIVHZiK6y2NIy568avVpu7Y6f6sGFPyIEV4eY/HU74ClfsSaywPKoQpEcUVvYK4
         KEeCOmozdFIy2eQ22mln4qA5roMYEw5DL070oB4zEiyLTgPy9vuCxnJl0ot+oKvjL1pX
         PpGcgoIUuMyxTH6i7twtonE6/nGfwh/dyIk+KxEbpqMOJRDkiqCITRqa6YuY940cg8Fv
         JnVvLCxDMTQw/Ny4emXRDYe3rRrvBipKZE8/dREWoDgZU49Eo+Xh83jceuXaExc7AgIV
         nA63d870977MUTUovKjWPOMYwDIMCj98z5lEhR12ss0C8MxdmhBss9PzPipi6zL07H1E
         XtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774361204; x=1774966004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Cv1GxwGjsnJyKeumjJielENFU1WPaGfL15dJDHDpzM=;
        b=pirRXATNBzrfduOl8g207zNXrZbEqWKHk85+3sVBLMQGC0OkBAid6IVt0ev2yggEDC
         vRREQ2gLRjdEiX/aBubj+cMsC5GQgaQczCFUJgdgRwluR+xoBLZDl/wutYhB70z1blQc
         T+4uNjLdJC+HLskU2PoT12hsnyLntniYPQjUa3r0z7khMti/pVC2Vd0u4Ux/IDF58uwz
         DkVm8zNPEFpTHlVoyj1eXUXqstBlR7Dm0t1TgUJdJJiRwi6j1/45cOxcUCeaXoyQcGAL
         A/f0i4Ve4bvUYbTNST32Beiz8aikbaHB01nEi1btVNxIJchH9Y4PcZybU+QHEsUDNkzi
         JaGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2CuThgD9EtnhtxLCgiLqSch0pJgruBIQaZCVU7BN7cAxgnebbSJUdHfwNuqYUFeGvDoLFke9v5FLeOxHz6gJW@lists.infradead.org
X-Gm-Message-State: AOJu0YxM1EEZa7e57FEXrRuLXNr4qTRLXrauq5ntdA3wYoiD8ekylhlB
	r7kYggylMD1+UfRrxCnKub9riX+fqWWCaCYW8G/Uli5G1oafqsb7hgva6xH7uh0ZbA==
X-Gm-Gg: ATEYQzwtFftu6EJ1rK6spH6CJEM7jQLyCqPOlMxct1/AmIfYw8zGmdpDy29WTEJD0Xy
	bHUtGXieaDKdUje7BXAYsp77wLdMsYNfmkACwzg+1OvvoMJ4RLUYFoLRGiS/hdziaYe7nNac9R0
	OYd5uajgJvPdduCy3tNO/4mERWkDPtuViGlLeWp8U9dcVUH8eA7ASJNzPUwXD2LnnwSTM5T/XEX
	Q/nc5eEQeEedhGJkMZcazEZfgsmiRNLnkclTH3O13qeP2arwMOU4L9K4fJIVGg6Rgwx6auFxKPG
	lcvlt6roWHxzoS4g1B88vl55of27qrakVQMtSO4KmkML5wi9QMhhQ8fEZsJJQ112sSfO8+0AEUZ
	IEphrAkcf97SCVSsxjkkyVXVBv3UKd2E62rLwA512ybKxIxFvb2y7jNdzvUHXvU3pY+ko6Gl5vv
	H3do3dp5WLHZji9M/vEoFcPcW6M4VdhKJo9rRDwpKS5dIn0ocQ/2upcmjsY0+RVXK2n08q6MSDp
	jKOgA==
X-Received: by 2002:a05:6000:240d:b0:439:b7c9:2ef1 with SMTP id ffacd0b85a97d-43b6423bc2dmr25256797f8f.20.1774361204032;
        Tue, 24 Mar 2026 07:06:44 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm38308646f8f.18.2026.03.24.07.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 07:06:43 -0700 (PDT)
Date: Tue, 24 Mar 2026 14:06:40 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com,
	maz@kernel.org, oupton@kernel.org, suzuki.poulose@arm.com,
	tabba@google.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: arm64: Inject UNDEF when host is executing an smc
 with imm16 != 0
Message-ID: <acKacAd6aV32624m@google.com>
References: <20260324135728.3532400-1-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324135728.3532400-1-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_070646_339842_C56A92DB 
X-CRM114-Status: GOOD (  20.50  )
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

On Tue, Mar 24, 2026 at 01:57:28PM +0000, Sebastian Ene wrote:
> The ARM Service Calling Convention (SMCCC) specifies that the function
> identifier and parameters should be passed in registers, leaving the
> 16-bit immediate field of the SMC instruction un-handled.
> Currently, our pKVM handler ignores the immediate value, which could lead
> to non-compliant software relying on implementation-defined behavior.
> Enforce the host kernel running under pKVM to use an immediate value
> of 0 by decoding the ISS from the ESR_EL2 and inject an undefined
> instruction exception back to the caller.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index e7790097db93..ff6a90a4a4c7 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -756,13 +756,18 @@ static bool handle_host_mte(u64 esr)
>  void handle_trap(struct kvm_cpu_context *host_ctxt)
>  {
>  	u64 esr = read_sysreg_el2(SYS_ESR);
> +	u16 imm16;
>  
>  	switch (ESR_ELx_EC(esr)) {
>  	case ESR_ELx_EC_HVC64:
>  		handle_host_hcall(host_ctxt);
>  		break;
>  	case ESR_ELx_EC_SMC64:
> -		handle_host_smc(host_ctxt);
> +		imm16 = esr & U16_MAX;
> +		if (!imm16)

if (ESR_ELx_xVC_IMM_MASK(esr)) ?

Also, I can't find void inject_undef64(void); I think you need a vcpu for that?

> +			handle_host_smc(host_ctxt);
> +		else
> +			inject_undef64();
>  		break;
>  	case ESR_ELx_EC_IABT_LOW:
>  	case ESR_ELx_EC_DABT_LOW:
> -- 
> 2.53.0.983.g0bb29b3bc5-goog
> 

