Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73171CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 14:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOKKIBOjWpb4LV8H7itJJDiddCX5oAvi130926on9HY=; b=1AW+cKcySmxj785VNdS4j7gdM6
	SrrCQY6sA3IB9l7gb7pt3n8VScg8LPHF3xj5JBSemtdedPmePuHaxUMBS48b4HsrqzmjHItdUEfbT
	0skCucu5cMJg8fAhI+GJ+F3QiGavaM9d90vj09A0v3M+g5JAHnHperGPHYQJAS76VT04b8VLp+lrz
	Y4S6Q2FeEzgo++PgVX3fpMMKSjVpEbmp46g9lmZeggKdKBSG8FywESd2igYnkCqtw+d1dZRElhSp7
	tY2XHiGi+Clrcllj2XNjWNF7XSZ0WKjW53CuXZ87IkcXdiYN+x1S14VP8bJA7IKR3brjsFzgy6KtQ
	VcsuGdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUi5-0000000FuqH-0jxh;
	Tue, 16 Jun 2026 14:24:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUi2-0000000Fupl-1dvK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 14:24:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490b23c828aso46605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 07:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781619848; x=1782224648; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mOKKIBOjWpb4LV8H7itJJDiddCX5oAvi130926on9HY=;
        b=deQa12GY5pLqdU9QNUmPrbGia8taGdjzF9bmGyy5EBRSMFGNKyEER33aKhBzcqes5k
         LbwuUjdsdXvhi3LzjHFeuu0fBWraw0SO+zWvATNmewlnx6+RmkpYWrpoT4e9QUrze0ib
         RFI1atKs7YULmKTUSD8izG+dwo21CjSgUTSI1WvTOVf9PQe5St4OYm8AJdRfwsX3Idu6
         jdP2GX5c3FgsCuxZL7TBhAks1VlZ5iykGFdY4pSB23Rik3eBVW7v7nH+p4Eb5oO6ggRS
         OxLx7T2WeWiSr43w6ywrdxn0sI0qQXbYAE3KeNrLSS8BM+W/qUfngSH8uy/8UCnyNvmW
         AWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781619848; x=1782224648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOKKIBOjWpb4LV8H7itJJDiddCX5oAvi130926on9HY=;
        b=L+sigZIuF5hwEfl32mGanDMwc3PiE9K3nac03CBqylmhRgc+xjmaNWvcbzCpB4IrPF
         JtE+5qOBZx1FstzEMvS1ehfiWJ9u87ogvYlO2O+BE1fMcRbB3bzQFe2VuQIWD4euVcZo
         WgAjf36BAuH103W7lisiTen1Fn0U5hE0FzGuF/FBKupnC2DrhRfwopUNvOjQR9xgukly
         ZxQS/++ABEUJf8D+0kuHlO00DgHmIjpyg7YzEhrhRX0fsJK8V4V2XBI6WglJE32ID4JM
         XM/zew4n9m8wTux1HBg5XmVLsMeJByWYunvfsSTqeehzPakN/n8LxL3d3CwAyk6m4meL
         QejA==
X-Forwarded-Encrypted: i=1; AFNElJ8jTszeOsttrMpqDaF3wu94KSfUi8jxRE7/0JRikj2Njr7+tUvzzmtvqejOtaIkC6P4HUubl8tM9V+WZvBudBjR@lists.infradead.org
X-Gm-Message-State: AOJu0YxAdilvR7Jx571Ua+/H9DLZ7Uidm16Blks67gs6g+lfW2pG61NC
	0eloaNdjwnVpPlOdkIrOGChbIvmRGCP+EbYhmXEaAN52zrqZuiqRWRsUtY1CbOqteg==
X-Gm-Gg: Acq92OGzQyOTORR+m9/Oj81MON9HKvG3B6NZJwV+88Oqqd3i4LPejHoNy4309Rme97f
	JvUfZQuijWT9FKllb4jDgSRT22uM2kyArjxyQSa3Ua9bsRrbFjeIHfzEMQ9JEO17kOdoKhi6w1Q
	KEgoEXsGyuB5dEvyNbypK7q8MH7XFmQOqhq49bK8GJqfTvJN9JOTFjS4vOzaYQPpjs8tQVbe2vW
	avMxBLIKNKqP1KUzpRpEbGQMgY5cYgC2cNnypeqmxx/+sHW+tnOxusAC3opw/FYs49iaYA/pTJU
	SjRr3/Kd8mZHI2vNrHfSSnLq1NbzddS4Ra8aHDRWiafVaiJf7k62VVwp46jCd5eDuoXhWeu/o0P
	VE1UjjaEtWzCGKkExVVPbHwD3bhSnksyUUmA6vS/stGru6wwfj2uCGRN4FyzwPZvaGBzyvg3Dk+
	+ov2u0dS6ZzqJq1lHsTgBl5QVYscV9mTo3NK69ciJJ4QNbVBctsbINUorAAz10uRuZYLaSiQ==
X-Received: by 2002:a05:600c:c3db:20b0:490:c2b7:5551 with SMTP id 5b1f17b1804b1-49230894f68mr920755e9.13.1781619847684;
        Tue, 16 Jun 2026 07:24:07 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26392esm44203678f8f.3.2026.06.16.07.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 07:24:07 -0700 (PDT)
Date: Tue, 16 Jun 2026 14:24:03 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v3 6/7] KVM: arm64: Support FFA_NOTIFICATION_GET in host
 handler
Message-ID: <ajFcg37mjtT4jt5M@google.com>
References: <20260616105417.2578670-1-sebastianene@google.com>
 <20260616105417.2578670-9-sebastianene@google.com>
 <ajFPIhMGsjqAbtN7@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajFPIhMGsjqAbtN7@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_072410_448575_D1344F1A 
X-CRM114-Status: GOOD (  21.55  )
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

On Tue, Jun 16, 2026 at 02:26:58PM +0100, Vincent Donnefort wrote:
> On Tue, Jun 16, 2026 at 10:54:15AM +0000, Sebastian Ene wrote:
> > Allow FF-A notification GET messages to be proxied from the pKVM
> > hypervisor to Trustzone and enforce MBZ/SBZ fields.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 24 +++++++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index fcfaa441770d..549250ff8f82 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -715,7 +715,6 @@ static bool ffa_call_supported(u64 func_id)
> >  	case FFA_MEM_DONATE:
> >  	case FFA_MEM_RETRIEVE_REQ:
> >         /* Optional notification interfaces added in FF-A 1.1 */
> > -	case FFA_NOTIFICATION_GET:
> >  	case FFA_NOTIFICATION_INFO_GET:
> >  	/* Optional interfaces added in FF-A 1.2 */
> >  	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
> > @@ -1001,6 +1000,26 @@ static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
> >  	arm_smccc_1_2_smc(args, res);
> >  }
> >  
> > +static void do_ffa_notif_get(struct arm_smccc_1_2_regs *res,
> > +			     struct kvm_cpu_context *ctxt)
> > +{
> > +	DECLARE_REG(u32, flags, ctxt, 2);
> > +	struct arm_smccc_1_2_regs *args;
> > +
> > +	if (ffa_check_unused_args_sbz(ctxt, 3)) {
> > +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +		return;
> > +	}
> 
> Shall we check that the endpoint ID is HOST_FFA_ID here?
> 

Yes we can add this check

> > +
> > +	if (flags & GENMASK(31, 4)) {
> > +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +		return;
> > +	}
> > +
> > +	args = (void *)&ctxt->regs.regs[0];
> > +	arm_smccc_1_2_smc(args, res);
> > +}
> > +
> >  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  {
> >  	struct arm_smccc_1_2_regs res;
> > @@ -1072,6 +1091,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  	case FFA_NOTIFICATION_SET:
> >  		do_ffa_notif_set(&res, host_ctxt);
> >  		goto out_handled;
> > +	case FFA_NOTIFICATION_GET:
> > +		do_ffa_notif_get(&res, host_ctxt);
> > +		goto out_handled;
> >  	}
> >  
> >  	if (ffa_call_supported(func_id))
> > -- 
> > 2.54.0.1136.gdb2ca164c4-goog
> > 

