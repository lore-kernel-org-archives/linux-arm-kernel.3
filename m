Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C986103A9AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkE1roP0rQTN4agoxojZxa0tqCSQLd/1PEJ1rtsPXGA=; b=dE1vH4aTVsiqcPWHRJ3kVqM7Jy
	fo8M7sg1eqx1MNPQdzm75r25oe8WoOISD1n/PBM/n679vNoj7HMx9lg5Mu3tnGywxUCaSzm+5KOAu
	4B5300lWq44WihyKV5t9in0LscTqjZ3PXaryKgOGJoZKF8YPJ5D4BJ4YdGLchsVFdhaZcF13v4Ijg
	4KdJlYtZiTRxwYiQ//b9bHLFQm7IbrYKGPcZas2/Ba3bWVcYByRY+OlE/vdIsztulKWIA4iTI+ZVZ
	9o0WwOn1ngHUSYD/DixNCp7REF3b0ou3ejmsh1GxNyecDig9XijAPg4w3/jJJG2+ZlAZfcbmSNo2Y
	UgFzvSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MWF-00000003H9z-34RX;
	Wed, 25 Mar 2026 11:35:27 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MWD-00000003H9L-0m2v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:35:26 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43b5bded412so1808822f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 04:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774438522; x=1775043322; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zkE1roP0rQTN4agoxojZxa0tqCSQLd/1PEJ1rtsPXGA=;
        b=sU/2/20gBTH3WLEBE3+RdbPQA0sd7S7mn3BaBd5SQXQq0/+f7lO4AFqFaI8bTgXDs6
         5PdiQ9kr58ioFZe8WwMNyQUulCf75Ecc2tYCIVnySmZHjsnlaQH8gsmh0vSiGn8IoBNb
         PqF25gu2JWMCDq5c05XqtWu5PX+E+V96lvW2ghh1CczGMf7g/WYUnUBr1m+jTKgh9kS1
         0CpltNgby09NAGX+dy2QyBM9IJikLopHx8KC46I2QM0DVI5116cL5L3FgIMUksuOf67q
         y6p0OZeiX1s0KVn9A7qG2pk8x9KwZ8gudE4acctqn6ZR+qTJYfQ+O+sRrJ+pKPuBpGPT
         72Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438522; x=1775043322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkE1roP0rQTN4agoxojZxa0tqCSQLd/1PEJ1rtsPXGA=;
        b=rCNwSFB9BREZDKzj6dNrXnXeh9sHmkskQpSNTWU+4OJxcwpCMONNAsXZJVm3Tc/zBN
         AP6WR9mz6y1GSsRnZSpTgOWmgL4dG1VCdfnpEI8Zl3WQeu9vALDnMc1Ju7YKN2AKsPg9
         jWUZltURZaXgiB58s9NRJVTTzgGJGVaHzkxlOucK2pBzxfe0IiTVBXrJwstKEz8CHXLJ
         m7htiB+MV4wtX20ykKP8GPuaz0bzRD6Lc7/81JO55otS9/DVm5Ifd8FaBhUcp5ijKHbI
         D+UEaczb7hmFG0f747eG6xzkXc9PgvWhHB6kNK0m1iiUb0sbI/mL8yF0CMmORiqHXGJV
         TsAg==
X-Forwarded-Encrypted: i=1; AJvYcCVVqY5Vpz6o6GTGv7bFWd0tGExgVXYJW4Kicz92DKgx7TwxFlO+VNV/NdDb1Tv1a2Eyi95qW64LT6dsKl1IP3LF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8+bUR7VzrJgq1brSj4/ZYjUrhxntRPH8FezOW19VH3MJSPa6+
	zVF5b+2eTzW5XRPQeyeyHv7W1Pk2n1Di+IB6jwgoigOBTFwB0AEAyBSYarTP2Wl/sg==
X-Gm-Gg: ATEYQzwSGwZgxckSMgdiI0i73crQQlc4+q4RUFMdXichcPxzpgoZvVilQXN6SWyAM4+
	rmw9454T7i77v8J3kb00VNZtXTPjeB7j//6vL57vWJFpIUjupWN7odI+hgdeI1RB2N5PlMsPisH
	7y20bTbEVucjHE/S0aDIRGQm/ADq+mEjy+Tny5vubAlg90cBDsvzzjlUfaL9srUVQOB1s3icwXs
	AdHtspkOxgRq0SdUo+AhnHzpBQlCKuKn+b0G9b5Utp12pLAAhBTnOyLurxwIWO8fwL7jLhTl3Qe
	7q71U08J/aVU8G4US/vorMbjTDeF3YUVTgMZLOuhX5zxVpwWBQLDr1Y7wjS/s2H52fta1eA6z61
	5MyaRYCfPzgoGEosssC9x4OqIvFry8SgS14aB74yvLoJsxYOD/muw0hFvRV/Zlt3hB/Zt9HpJsr
	LT5PUbS7jISyb/Gouy4yaFreHh1IZ/aQSd4OybcTD3KyfnGxFMCK1hGZbU7w6hIBHEJ4E=
X-Received: by 2002:a5d:6806:0:b0:439:c157:2577 with SMTP id ffacd0b85a97d-43b88a055a4mr3167113f8f.34.1774438522008;
        Wed, 25 Mar 2026 04:35:22 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b86fbb195sm10280737f8f.14.2026.03.25.04.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:35:21 -0700 (PDT)
Date: Wed, 25 Mar 2026 11:35:18 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com,
	maz@kernel.org, oupton@kernel.org, suzuki.poulose@arm.com,
	tabba@google.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH v2] KVM: arm64: Prevent the host from using an smc with
 imm16 != 0
Message-ID: <acPIdoA8oc7T8wKX@google.com>
References: <20260325113138.4171430-1-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325113138.4171430-1-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_043525_246624_42FF971E 
X-CRM114-Status: GOOD (  22.43  )
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

On Wed, Mar 25, 2026 at 11:31:38AM +0000, Sebastian Ene wrote:
> The ARM Service Calling Convention (SMCCC) specifies that the function
> identifier and parameters should be passed in registers, leaving the
> 16-bit immediate field of the SMC instruction un-handled.
> Currently, our pKVM handler ignores the immediate value, which could lead
> to non-compliant software relying on implementation-defined behavior.
> Enforce the host kernel running under pKVM to use an immediate value
> of 0 by decoding the ISS from the ESR_EL2 and return a not supported
> error code back to the caller.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
> v1 -> v2:
> 
>  - Dropped injecting an UNDEF and return an error instead
>    (SMCCC_RET_NOT_SUPPORTED)
>  - Used the mask ESR_ELx_xVC_IMM_MASK instead of masking with U16_MAX
>  - Updated the title of the commit message from:
>    "[PATCH] KVM: arm64: Inject UNDEF when host is executing an
>     smc with imm16 != 0

> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index e7790097db93..4ffe30fd8707 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -762,6 +762,12 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
>  		handle_host_hcall(host_ctxt);
>  		break;
>  	case ESR_ELx_EC_SMC64:
> +		if (ESR_ELx_xVC_IMM_MASK & esr) {
> +			cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
> +			kvm_skip_host_instr();
> +			break;
> +		}
> +

I wonder if it isn't better to move that into handle_host_smc() as this is part
of how we handle the SMC after all? (and it calls that kvm_skip_host_instr()
already)

>  		handle_host_smc(host_ctxt);
>  		break;
>  	case ESR_ELx_EC_IABT_LOW:
> -- 
> 2.53.0.1018.g2bb0e51243-goog
> 

