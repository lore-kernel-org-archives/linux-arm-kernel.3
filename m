Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4E7CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlKBLad2Erh4BtAqk3Be7oRe/1BCOSeCPkKHDyyOPcs=; b=t0b3CZsDQQSHiER7t0Cn1ooNII
	oPVZTSo+ESiYTJGLCFU3fhwhF2V84vXfQCSu9HkG3Crr8yyjuerhAcAVn2Bojyqcbx7/Ei9+I9KNz
	VwTk/A8gQBsS0AOPjxhbxtc6zfaB1wQ3Uw3Q4bEQgGbZ412yDnBQfB0ONJH21d6S+MW9VTSoBxxAD
	41JyoP4vyrFw07pcMQZ7iQbs7w9ztg/gA2xtgOPi7bLkb4+hi5nuaNQHM3maKHtLcCLB/nIjUI8Hx
	WnXnPnvguKeJ9dfckcb15KpfFoDl/00XjdUl37f7eOdyi5xpqU5m2ws0VXqHVWxrl83tB0FPglobL
	zFfc/GwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT7s-0000000FmSc-22h2;
	Tue, 16 Jun 2026 12:42:44 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZT7q-0000000FmRM-1Lmu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 12:42:43 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-bf046d4da1fso415311166b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 05:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781613760; x=1782218560; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KlKBLad2Erh4BtAqk3Be7oRe/1BCOSeCPkKHDyyOPcs=;
        b=Ty429RlKZTVsj8qWLmGrgoMqNaFRq5qVEBkhNneVNi4M49kaygidrKBI304M6PlX8r
         dXtSfTcsb7NtbLTLX3fq6VFr9hfKEf7DFOw64ub2YZAka585nFwptPf1O1om7c8TA/J3
         yIJxWTSfL7y8WH8HsQ0nJTrMBVmovSdOkcXxQpJsSlTXYjlYufrvQfViBZE9Gzz6q1xk
         PJyat5dNVng5OzP+OlHZQJZuzX0e6wWhsYOiNGV2kjhAXT8qTHTuFouD7j1SKcBAUZlC
         Hnd8fwtdQ/DiB78rl8Lzz/ZDyWDfV1cW3dnUjzaIQ3P/mBsZUk5Ez4tgIUZPyE4Q/YJU
         3y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613760; x=1782218560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlKBLad2Erh4BtAqk3Be7oRe/1BCOSeCPkKHDyyOPcs=;
        b=o01NYavHTfnTbqkbREUiEz+R+JaEtM/loUqNRWdPpJ7l/4wUrGM3v02UJ3LbftAhhn
         4pfOn8JgJehEwOOEtThyuCxFMPxDjPkif+nnw4YRWBRVWd1v9gX7wVfleZhznchaTZcn
         6ychgRiIQegUJ8B0hFmcPxXvDOSWkALrOjsfMU0HOh0TDLcPcb4Lk9JN1AjRAG9KgCrN
         mtpHvfzdMo+T5XxoU98seb5YCBkYWggW9QtuWbZcApGLB2YWd0dbp7k7hUb9xJRlnQBL
         CP/7fbMtjTHOw9u1JfuzWsfqPFiDx/zqRG/bkxzTmsePJ0sHfwxR7oD+787orsbI4UAB
         XmVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8X/DOQ48RPZ4Im9BPVqRFjQbYzLw++MSrxY/Y+7/WG0LyG6SSr7zIu8bI8Ep5Z6KKDIt7Shqfn5t98sjWXiQMC@lists.infradead.org
X-Gm-Message-State: AOJu0YyFFp8X+vg0dXkzAHEHxAs4vljD0JODaA4Jr5p1X//OhmyGReLH
	EFWlL6I6IbTZ5ofZP8o8ZMBYXv6mFFvCW2fZG3yjdGL+ye+V9lv80J2PEhUAeDrNMA==
X-Gm-Gg: Acq92OFJS+Uanm1kI6VY+1PtnPJiCCl1TCHowt99KWFVRu86sKzAvgGaLUBPHkiFRCB
	qhRbejCbTirrIsTta/TJ42iJ03uAJ8gAdGaf2SYzG7Rz1yZheiCqHQg2frD4h52ZQ18X/zy+sxK
	u0NUz/OuSctUpKIJcQ8s2getHCwOH/NOpE15VEKnomcJBIIdC1SgGD51u+pQZvKk0eHTG6CPmM7
	13jIfgyNNmhkNCiUn/LIILIRd4WTYTjsIOyAxC/WDQ82KkVdkTKAVnjS1netj4+1rhmLITHEZYc
	i2+BKQzoz6Xlb5O0p9+mjsPNjRNoD4yFEhfsKny2QJlQlmZXlBtYZ+/yX50j7ultdMlFp468yF+
	6YSDR7WMP2O9vp7/lAEx40IYv85Ns+Il9BybnTVhr7wrFo6PvsTQfnZEBn+2nPC5KnGarg8W1qc
	xK6bp9yKAe6UF5hKzDxiOhjhQLqGxMzj8sLcsodDk0crH99qSj2cTXNcTFk3er/TsCtLM=
X-Received: by 2002:a17:907:ab8:b0:bf3:e968:bf99 with SMTP id a640c23a62f3a-bff49921dfcmr500315166b.10.1781613759630;
        Tue, 16 Jun 2026 05:42:39 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8e1db3esm637694466b.56.2026.06.16.05.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:42:39 -0700 (PDT)
Date: Tue, 16 Jun 2026 13:42:35 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v3 2/7] KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls
 to Trustzone
Message-ID: <ajFEu3rjmWxVKgyW@google.com>
References: <20260616105417.2578670-1-sebastianene@google.com>
 <20260616105417.2578670-4-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616105417.2578670-4-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_054242_377432_7CE41C6D 
X-CRM114-Status: GOOD (  20.42  )
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

On Tue, Jun 16, 2026 at 10:54:10AM +0000, Sebastian Ene wrote:
> Allow FF-A notification bitmap messages to be forwarded to
> Trustzone from the host kernel driver enforce checking for
> SBZ fields.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index c723a21006aa..dc7496ec295f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -713,8 +713,6 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_MEM_DONATE:
>  	case FFA_MEM_RETRIEVE_REQ:
>         /* Optional notification interfaces added in FF-A 1.1 */
> -	case FFA_NOTIFICATION_BITMAP_CREATE:
> -	case FFA_NOTIFICATION_BITMAP_DESTROY:
>  	case FFA_NOTIFICATION_BIND:
>  	case FFA_NOTIFICATION_UNBIND:
>  	case FFA_NOTIFICATION_SET:
> @@ -909,6 +907,28 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>  	hyp_spin_unlock(&host_buffers.lock);
>  }
>  
> +static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
> +				struct kvm_cpu_context *ctxt)
> +{
> +	DECLARE_REG(u32, func_id, ctxt, 0);
> +	DECLARE_REG(u32, vmid, ctxt, 1);
> +	struct arm_smccc_1_2_regs *args;
> +	u32 idx_unused_args = func_id == FFA_NOTIFICATION_BITMAP_CREATE ? 3 : 2;

nit: should probably better expressed as a int as this is the type in the
ffa_check_unused_args_sbz proto.

Perhaps you can even fold that directly into the ffa_check_unused_args_sbz()
call?

> +
> +	if (ffa_check_unused_args_sbz(ctxt, idx_unused_args)) {
> +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> +		return;
> +	}
> +
> +	if (vmid != HOST_FFA_ID) {
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
> @@ -967,6 +987,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	case FFA_PARTITION_INFO_GET:
>  		do_ffa_part_get(&res, host_ctxt);
>  		goto out_handled;
> +	case FFA_NOTIFICATION_BITMAP_CREATE:
> +	case FFA_NOTIFICATION_BITMAP_DESTROY:
> +		do_ffa_notif_bitmap(&res, host_ctxt);
> +		goto out_handled;
>  	}
>  
>  	if (ffa_call_supported(func_id))
> -- 
> 2.54.0.1136.gdb2ca164c4-goog
> 

