Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD6FCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 17:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q37gll9uXRgmI+EFMA1NhDtwvLbIk280Pp5eRyLMrZs=; b=0x4FXU6MVXjtt2anbaxClzb4q0
	RMBVwJndSEHGAvOS2X/6NPPdA3lY7wcqQwomXgvI96ZG2QoLo5WEscC2Tsiy2fn5pEyKmBV5FeG/2
	de7Lwz873poqiy+wYINLC2y4GDeZBSVnUPMjlOVYDYn0e7kqZjICiW6tbJi6ojCNQjsiJKwqPnJH4
	8K57kBX224hY5R5PX64r9YA3XNXKPRQ2LRxXyrnLADnBSy4rOWj64zSRddUqJpP7c4YQQP/vgppiR
	vu9KLndgRhBmFqeSqzCitcWNvTS5+IhIGOwRjCrkd/SJxMBqYxvNUencpPnCnwXpPl7Xrk2smtBMK
	eSrxMv8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waGK9-00000001dfj-2o67;
	Thu, 18 Jun 2026 17:14:41 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waGK6-00000001dfG-2a5x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 17:14:39 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45ef29c5561so752191f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 10:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781802877; x=1782407677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q37gll9uXRgmI+EFMA1NhDtwvLbIk280Pp5eRyLMrZs=;
        b=SYbm3cFabneQf6OTNbJ4G3gwnzQ+NS4ouuV9IMvjvov8661VtE8iBDRiP/9CK6pg7h
         BONf8cyODEiPqCmHYLA/LzWr1uVNnEh2kiiBgIE0N+4s901hXolQbLnNata6heII4Wws
         uw4bJIAW2yqtJjnpzAxclJvw11WOkLHaP6FdvwC1tleSWCCx3xAFi3LlPBCpAp8tcgNL
         TcY8k98V5uwyntFUxCzVvqZgcJze/xRjrTUROX/qqwLYkO0jOaneNDY16r+MuFqIiwNo
         qJHPH5Tq749KEjzLibNfaAUPenMi9cEKRbRUL4utEGGvv1ioz8s5JbA0zwOYem3Klung
         S6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781802877; x=1782407677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q37gll9uXRgmI+EFMA1NhDtwvLbIk280Pp5eRyLMrZs=;
        b=iX5CHjwfd3NsJYc5lDZniwn/a7E9cZvJ1DHQbb7lTPDEc3A+dxCesIDfeC5tCJphck
         BQivY2F+7fOFB+N5CeFLmgBFoyQx4jtZvuibIl6YyHGfAQ+1lyFYESNGPPG4hFNHw6Dj
         WlTJymkNV1KWFdD9wfrS5ZazbyQmsZ7Xcv2MZ6+dmCXdKQgqJkMm+V0VbAL2fo1TYmpy
         P0eJ06ATO3vizY8boQ8bGHU5dJhzzSrUIkEg9lHdh7Jd9VL0N5eKW3FTaQ9MDshe8r91
         IFt8MfRPs9x2Rlr7yprO0P41cf5+hqbF4ZwK2XyR0peJYyCSMsqFS+V3Zswig9a3MfJb
         gP5w==
X-Forwarded-Encrypted: i=1; AFNElJ+ft633Ce+GjvL/l+UPNwtAiId0xq9OOvEolKqVhZN+r7YoTpeIkQ7WuyBfOsPBUSiCsXTtQUivuLLmVCsep5ln@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0oui1E/GylIOmlE51ev0ObBVrTxtMtUOqQrkkEOAtYLefUPkn
	kbYwBsNiS1sgcrIqJcCk0/2PfRNHmnZZhPX5cP+2gub70MF/89cCDmhxXzQ8kAFoMw==
X-Gm-Gg: AfdE7cma9UN86Hr934kdQ886422Eee2jHN5uJaRhw2m7naFPGHkl61AQHKpXYd0IdCW
	Q6PddKsQYHXGTRJXrKe/BwpE3OeF75vU5ZZFDGjX6pqd3kp5X3JcqQFLaMIRO52t//xUf0xJYSJ
	6i16wgIvuKlrgtff7CaNb6EJaT7KojeFontNiDgJ58CHWhNZouJa0+Fx/ZzhloAadExGHVofIyG
	OVwF2fe6yRkzHmTc4qc3fsjSc5IFpFH0IVHwQCjzNC253o8WUtKV9RdY5L7uOcbT0plOqULTXmc
	UeC/hNwd3gB+JYfneFQ5sn5w52NQlIDdZ3TAAQ9akPzwror8F0i/IgLxUODl9tuTo5eF7p91vif
	lG1GSuWJBsbzgDIvdmmedDnTtlJRIQK39l9KmKn4iqJW4xVmsVqZLyhIb7N+OBbnuvOcvxmHVic
	WLHI/Cd/bdowP0KOPVWNFVVMFAzhgSufzTaw403YOg9lEARRkO8XDXZpl+
X-Received: by 2002:a05:6000:184b:b0:45e:fa38:c899 with SMTP id ffacd0b85a97d-46500a02b15mr590072f8f.4.1781802875940;
        Thu, 18 Jun 2026 10:14:35 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46508a0546fsm418554f8f.2.2026.06.18.10.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:14:35 -0700 (PDT)
Date: Thu, 18 Jun 2026 18:14:32 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org,
	will@kernel.org, jens.wiklander@linaro.org, joey.gouly@arm.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	maz@kernel.org, mrigendra.chaubey@gmail.com,
	op-tee@lists.trustedfirmware.org, perlarsen@google.com,
	seiden@linux.ibm.com, smostafa@google.com, sumit.garg@kernel.org,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	Sashiko AI <sashiko-bot@kernel.org>
Subject: Re: [PATCH v7 7/7] KVM: arm64: Zero out the stack initialized data
 in the FFA handler
Message-ID: <ajQneFTingGFdPSb@google.com>
References: <20260617145130.3729015-1-sebastianene@google.com>
 <20260617145130.3729015-8-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617145130.3729015-8-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_101438_669503_D4CB29F4 
X-CRM114-Status: GOOD (  19.33  )
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

On Wed, Jun 17, 2026 at 02:51:30PM +0000, Sebastian Ene wrote:
> Don't leak hypervisor stack data when using the FFA_VERSION call.
> When the compiler doesn't support -ftrivial-auto-var-init=zero option

Even when it does, I believe this is an optional kernel option.

> we need to zero out the stack initialized variable before returning data
> to the host caller.
> 
> Reported-by: Sashiko AI <sashiko-bot@kernel.org>

It seems most people are using "Reported-by: Sashiko <sashiko-bot@kernel.org>"

> Closes:
> https://lore.kernel.org/all/20260616160016.C62C81F000E9@smtp.kernel.org/
> Fixes: c9c012625e12 ("KVM: arm64: Trap FFA_VERSION host call in pKVM")
> Signed-off-by: Sebastian Ene <sebastianene@google.com>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index d7c5701d0584..b321682ead04 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -883,7 +883,7 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>  
>  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  {
> -	struct arm_smccc_1_2_regs res;
> +	struct arm_smccc_1_2_regs res = {0};
>  
>  	/*
>  	 * There's no way we can tell what a non-standard SMC call might
> -- 
> 2.54.0.1136.gdb2ca164c4-goog
> 

