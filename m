Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582ECCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0G/75DudiEyDcCLmdDPS8Zu4rNUfvJFA499jcPToPio=; b=irL5nSWDAsUAOJ4rCSwW2Kyh9n
	3U9KX1fUu/vVT2xpWAZx+LYZ/g8DL3x+RHvF1NAWgcz8kqres6ZT+MbAfCwgGFO8FXPpD2gnBPjZc
	+vKpgKQfddp41WyWuEEpVmtjzzkxWr3coZxU0aWHZXnhQII1a394tA2Tt/dwRMoZJP56uWRWMSMvB
	qNVInimynNOBOOHS6iNCVDPrgqt60LQ3IocJnPXgEHlT4JDwXltQciDR+93rK430oQhxj2OzvVxn8
	O/1gQkPrPZdbJDL6fMZR69Eq1Rx4mIEeut06f59dIx8aWP+oIXx6hJZDa4wRuSDc6CpQAtE6WXYA7
	H1ARFLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBJA-00000003lrb-2AiV;
	Wed, 27 May 2026 10:16:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBJ1-00000003ljU-0dOE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:16:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CBB2169C;
	Wed, 27 May 2026 03:16:00 -0700 (PDT)
Received: from [10.1.38.169] (e121487-lin.cambridge.arm.com [10.1.38.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 789273F7D8;
	Wed, 27 May 2026 03:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779876965; bh=+hL59vccO1ks9MzdM5CR38jiGk+XWT0SUi7IA3xkX5w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KiGG6vSz6PaoZdrTGFxpjyETQnPYOLshZ9pb7fUxb1O6qXXA0g8B8N8JwM6dB9Qe/
	 whiJ1iSAdbl30B1eiRbE9oZmBc3+d0gb8E4G6I9kbB6Ul7wDPKV3P8h6T2jYCGYDs/
	 W5pESKAwp7D0f4Popu7KQ7LkaqLQZwqG3F+trREo=
Message-ID: <7e7de0e4-2bc8-4391-82ff-23a0063f513d@arm.com>
Date: Wed, 27 May 2026 11:16:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/18] KVM: arm64: Don't override FFR save/restore
 argument
To: Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
 maz@kernel.org, oupton@kernel.org, tabba@google.com, will@kernel.org
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-3-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260521132556.584676-3-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_031607_278422_C622AA2B 
X-CRM114-Status: GOOD (  20.48  )
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

On 5/21/26 14:25, Mark Rutland wrote:
> The __sve_save_state() and __sve_restore_state() functions take a
> parameter describing whether to save/restore the FFR, but both functions
> silently override this with '1'. This has always been benign (and
> callers have all passed 'true' since the parameter was introduced), but
> clearly this is not intentional.
> 
> Historically, the functions always saved/restored the FFR, and there was
> no parameter to control this.
> 
> In v5.16, the sve_save and sve_load assembly macros used by
> __sve_save_state() and __sve_restore_state() were changed to make
> saving/restoring FFR optional. The implementations of __sve_save_state()
> and __sve_restore_state() were changed to pass '1' to their respective
> macros, and the prototypes of __sve_save_state() and
> __sve_restore_state() were unchanged. See commit:
> 
>   9f5848665788 ("arm64/sve: Make access to FFR optional")
> 
> In v6.10, the prototypes of __sve_save_state() and __sve_restore_state()
> were changed to add 'save_ffr' and 'restore_ffr' parameters
> respectively, but the implementations were not changed to stop passing 1
> to their respective macros. All callers were changed to pass 'true' to
> __sve_save_state() and __sve_restore_state(). See commit:
> 
>   45f4ea9bcfe9 ("KVM: arm64: Fix prototype for __sve_save_state/__sve_restore_state")
> 
> This is all benign, but clearly unintentional, and it gets in the way of
> cleaning up the FPSIMD/SVE/SME code. Remove the unnecessary overriding.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/hyp/fpsimd.S | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/fpsimd.S b/arch/arm64/kvm/hyp/fpsimd.S
> index e950875e31cee..6e16cbfc5df27 100644
> --- a/arch/arm64/kvm/hyp/fpsimd.S
> +++ b/arch/arm64/kvm/hyp/fpsimd.S
> @@ -21,13 +21,11 @@ SYM_FUNC_START(__fpsimd_restore_state)
>  SYM_FUNC_END(__fpsimd_restore_state)
>  
>  SYM_FUNC_START(__sve_restore_state)
> -	mov	x2, #1
>  	sve_load 0, x1, x2, 3
>  	ret
>  SYM_FUNC_END(__sve_restore_state)
>  
>  SYM_FUNC_START(__sve_save_state)
> -	mov	x2, #1
>  	sve_save 0, x1, x2, 3
>  	ret
>  SYM_FUNC_END(__sve_save_state)
> -- 2.30.2
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

