Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B40CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8dPq5z6m1qmF3lfWoJltmjfpShaHtrEx/mXnH1vSGM=; b=F7rYWXuddAcIgcs+4QmMA6JhOo
	4Ysm3qBXgxAU+l+Bi1vb8LzrAGbE3IyiRIxXhfaik1M5Zysne8oTrxR6x52/rRrDqnPVmQZU4ChdZ
	X4w0zYCvSQRvBSXW3RygLMp9+3kIya49eRnd82Uqpi9X8P5bWInp8A/V91Rdc0T29qbvSpWZmI7lA
	Kofc8/Mr7wt1k90J90jNN04Fjb4q3bRbCqTuDONNQ2qYDonik5hjLIn7bNKiC03kxMnbaKAVdnCVN
	I9UR+ld3RRgbN1Af3Mnhdp02HiEs7u5EzAvrRgz6gRdflpDLntkKAayQmZ8fDyRgBWAbJf++s44Jy
	nZ4ENV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT8i-0000000Fmb2-347D;
	Tue, 16 Jun 2026 12:43:36 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT8g-0000000FmaE-0tJA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 12:43:35 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-68b90fc6a1dso8712265a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 05:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781613812; x=1782218612; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8dPq5z6m1qmF3lfWoJltmjfpShaHtrEx/mXnH1vSGM=;
        b=ho0fxhIxcbsmKvFtOb5ZaTka6M73XxU8vWR5pjawPxT8+i4cNlPJoa30sWj9hQz/4A
         8XQMyg3RDgDd+HvijchpDMxuop2uKziDVKrQqoO5zWSPufKWmt5M8zl1qbCiVP0htSXx
         Y9CsHYByN1GETqyvV96sv/CfaCagxz3BEoILg24h9xLOkpOUyFOrrnlB7L6uhXKp7n/c
         nj76a4bjJ6u9cFFcjgRLgzWIuoX9hXmGY/DwZZRb6tei52jKG0ZMlmtjGd85f3aaNe08
         EDR9pvwtQnnwGmD4wu3ghCL7W47AminMg7pSEYZrotQPjUCZFK/lwLtXGrPIGzhEr/nr
         fvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613812; x=1782218612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8dPq5z6m1qmF3lfWoJltmjfpShaHtrEx/mXnH1vSGM=;
        b=o4u/n9h7Fi5acsKibmCLiCctsPDqo9AlSd1/trw5Pk20baQsXO8/w0YiDvWXHCrjdE
         8kSK/IO5XP+klNgNZjHbqt4o4u3scTbN0gq8pxp7qWj/hd5nbXFGZE9DYqSq5e43vRxO
         lRy0nNMm01Zwonv6ZmihykaesndsIydhNlwZdm2y4cUaQAtRD9gTBvCMtUeH7KSox84o
         Ua623efzo2aHzGqO5+4ZnQGtTTD6ATJQ0n793ALdeOAxhOaUhMyoV7Yl1/NBYUHBbWci
         Yrwrk8cUmxOhPN4vpu3BSZzicyqNt1gCspXRnB44Gdg4/rfWLP5YmGxlUzy3bQvS8trP
         qaBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PTRmjgVKi9DAJc+K1Lmm73L53n47tHm1/7+A6hQOf9tHATSm7W/Mtc32dSAfu8a5OmVRL+N1XrtWzazBlHPZW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw328LaVynhGEgz5/VTei5dfLcJLSsYciRp51bZGzL5K5OX6Tqj
	zDWLTZkAC8JLO5V0/0YKIWL6ASPT6vGHrd3+J0xgBd3Je27BYIdUsPXkpmQ47p4YZQ==
X-Gm-Gg: Acq92OFBzPaL2+6CA8ptJk0bxg7azWx1+8VrqEWIa1K3UrbTtbu5BYkOuv2lHjd+PhL
	qlXuhS++r+wvpVEXVe4/1z2zE3fgjm48scAEmxsoWUjQqxz1a8aGD50zFgRk6Z45iM/mA8e+neA
	+vabp+jSrUhk8Y9KJ41iDAaGm8UiVtbiCts78cN6ku+uDzk28DTzemTSoPvB/5TEK8BU4O0ecVe
	hu3mngE03Rl8xi5sYIaoxUBjbwJuYSPGytkf0kHf+YU2Svz9ao5rwzCooL7J17N6KXsLZtpgPHf
	9u09/V2PY6NJ5z1lBjCt6Lee6QCbGawzsiXkeSdPZKdZJ3+mgXXx5s108hNzC2ENiLI+GddAdam
	+sI2A+6aJjbjeMjlzfwQI/78hF39Z9PBkovrw/foAZbJB7+WmeEv0eh+WebTdvy2shoGC89UVa2
	tViog42vjesGiIG5TedvE6R3ZBc71amEC7rqCJ9XILPqHP9jFj40E7O1ddVwnQ+WTImN0dpevzu
	sRxSw==
X-Received: by 2002:aa7:c047:0:b0:68f:9fd9:435a with SMTP id 4fb4d7f45d1cf-69508237df1mr1454321a12.17.1781613811803;
        Tue, 16 Jun 2026 05:43:31 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937938a524sm5008893a12.18.2026.06.16.05.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:43:31 -0700 (PDT)
Date: Tue, 16 Jun 2026 13:43:27 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v3 2/7] KVM: arm64: Support
 FFA_NOTIFICATION_BITMAP_DESTROY in host handler
Message-ID: <ajFE7wrrXcdzXdkI@google.com>
References: <20260616105417.2578670-1-sebastianene@google.com>
 <20260616105417.2578670-5-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616105417.2578670-5-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_054334_343214_B11806AE 
X-CRM114-Status: GOOD (  17.96  )
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

On Tue, Jun 16, 2026 at 10:54:11AM +0000, Sebastian Ene wrote:
> Allow FF-A notification bitmap destruction messages to be forwarded to
> Trustzone from the host.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index b1e5f9ee86ef..49a43c38a931 100644
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
> @@ -876,10 +875,12 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>  static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
>  				struct kvm_cpu_context *ctxt)
>  {
> +	DECLARE_REG(u32, func_id, ctxt, 0);
>  	DECLARE_REG(u32, vmid, ctxt, 1);
>  	struct arm_smccc_1_2_regs *args;
> +	u32 idx_unused_args = func_id == FFA_NOTIFICATION_BITMAP_CREATE ? 3 : 2;

Hum, this one applies weirdly too as it's been introduced in the previous patch
already.

>  
> -	if (ffa_check_unused_args_sbz(ctxt, 3)) {
> +	if (ffa_check_unused_args_sbz(ctxt, idx_unused_args)) {
>  		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
>  		return;
>  	}
> @@ -952,6 +953,7 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  		do_ffa_part_get(&res, host_ctxt);
>  		goto out_handled;
>  	case FFA_NOTIFICATION_BITMAP_CREATE:
> +	case FFA_NOTIFICATION_BITMAP_DESTROY:
>  		do_ffa_notif_bitmap(&res, host_ctxt);
>  		goto out_handled;
>  	}
> -- 
> 2.54.0.1099.g489fc7bff1-goog
> 

