Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2D0C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRQ3dUIptAKwY6MQYxUEHGw6dXXH6tF8Q68IhjO6QLY=; b=AbDHoGSMUVGtdcDokVLABrD5ha
	h4dyAQhfFq2K6+Tjayw23wXl53AWZDnBgGlSz7DIcFiQp72XQ2znH5Iyl1KQi4k5yIqThtgENCHlO
	d9ob7mkpYWKmtmH/2hF+1A3cLetBS609wOWeCC9to5m5LKzO/O34aqLlvCN5pmJHHNTAr0T5+txGj
	7oAobanS0qkrYClsHpini4Cq2/KiCy0jpfNzdPQUEX1L8HsY428RXf6pvRVq0pcVo4d7whRRBgdHg
	pFxz0g8gnIrWfhAlmS9RXM3YTy3wfmAxbfY7ilTqumC8xGED+mkkerO6cjs77i/Km9IJSIZZTC2J6
	Irmant2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiV0g-0000000ALkU-2Fln;
	Thu, 13 Feb 2025 08:55:50 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUxn-0000000ALNQ-2utf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 08:52:53 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4bc09a23949so179665137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 00:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739436770; x=1740041570; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KRQ3dUIptAKwY6MQYxUEHGw6dXXH6tF8Q68IhjO6QLY=;
        b=iXSR49f0uQDKbPUFxtiKBip8EPH+y5zchorjKOHn/lduN9SPQC29Mz+izeBW3QZUjR
         blCNZmJ7Kh529uj+f1ZYWfOUQ9/9DcaalrhXB+Jl8WZET92G38Wb05fwjJjLZSgBxevZ
         miQ+pK9cgTwhclAyC4C9I/X9wvxmudMXI8sVaUAHDilOQi/P4BZiRgrI/Uvv1syWfYVA
         c2FMo/qmE/wmz7VOxAfooQZNZZnGupKA3UCo3j+p+4eGTxEPBcUy625ovzsXrvuZYXpB
         0VoE54391UmkLnND88ns9k6/jpUm7KJCctM+lVwLgczPTWXURtiILZLFGHsrnBhruRoc
         XHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739436770; x=1740041570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRQ3dUIptAKwY6MQYxUEHGw6dXXH6tF8Q68IhjO6QLY=;
        b=bGVIhx8pxQY+nSw05AHx3wXkBZ5KKdUa7e2bpWbIbeDQH5LDpb8SJa8HP2xORi+3el
         Gc85j2GybAp02vuVLrDHbnZgwBI4yecIz+5vVa/Z28n2JQR7gGtPXMgGARrmlTZ+KLfo
         q13PgQq6XxYqbaKvH7njgP92QdMf8GTt2Kw30OQzE4bxeIu0a3dF9P8bC9Jpni4j0gjX
         6EUxma56SYdSRiy9zc6g1Cfh6L7WkrJtgf4gXQmd69Yhpwbjlz4JTTqOnNFn4wFF+OVC
         SGebqnC8adS3pgNbQ4UhUwl79N/leB9zgvVlaOpv5ZpGY+ZpeB7ZNzLTYR0vH+QqrBxy
         Zafg==
X-Forwarded-Encrypted: i=1; AJvYcCV5jS4TcoOCNbP8aP2d1Bznz+owfnx7XtrmfbPL71cdt7b8O+PpR3Gi2W/h9gaOkzXQuKNnY9ISuU6SqjziQAUx@lists.infradead.org
X-Gm-Message-State: AOJu0YzEi9TqozlPeKwxuOvlLxG8rPm4BQPsWADoNTiuHyXcj41M1KAT
	CwSe1i0jVIW/UKBg7ZwYh7/z9YRCSQ4z0NXXVLIx2UlGJO7tDQiCw8/x3OHp4IME2c4D5PzxgQv
	tp1ebng5vtjVg68HKUAg5ZclVprRtdfSqN6QQZQ==
X-Gm-Gg: ASbGnctp9a+Nlv56sml6bVO0npYonjpuqf5KTY32bgbZes/HtIPvBnFui2K68eOmQ0m
	TGZWJiOw2+MseHOs2h826XDEI/2IsfBnj9M0krqms/DG+6G0J/C22Fng0fh37ZeccwhrmkrauyB
	M=
X-Google-Smtp-Source: AGHT+IFnDuYWfE3Q7CuyUtwzYDsXyv9n6Um+OIw404XCQ3zk/sY/TE8+9JT3A2om7er1oTaCb7OwGKlKwkPboIKhvIY=
X-Received: by 2002:a05:6102:4187:b0:4bb:d062:452 with SMTP id
 ada2fe7eead31-4bbf207219fmr5886514137.3.1739436770171; Thu, 13 Feb 2025
 00:52:50 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYt6Cuu6=OO9w80yhJbZB77Q0qf7nzYdvjbgDbgAw6t1jw@mail.gmail.com>
 <8634gku30g.wl-maz@kernel.org> <3902208d-8814-46fe-ba98-3db833b9a886@stanley.mountain>
 <86wmdvs1oh.wl-maz@kernel.org>
In-Reply-To: <86wmdvs1oh.wl-maz@kernel.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 13 Feb 2025 14:22:39 +0530
X-Gm-Features: AWEUYZlmVi_oOrzpHstaYQ-1DQU14Cx8usJ0Mr5C5xxxvEXLMKHSQVpMklUZaec
Message-ID: <CA+G9fYtKxd8C5W4e5sO93TMC77pRVyJYL8w+i6q988jHk6ztxw@mail.gmail.com>
Subject: Re: kvm: nVHE hyp panic at: __kvm_nvhe_kvm_hyp_handle_sysre
To: Marc Zyngier <maz@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, kvmarm@lists.linux.dev, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, virtualization@lists.linux.dev, 
	Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_005251_765171_3ED5E7F3 
X-CRM114-Status: GOOD (  20.91  )
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

On Wed, 12 Feb 2025 at 19:30, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 12 Feb 2025 11:41:38 +0000,
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Tue, Feb 11, 2025 at 11:36:31AM +0000, Marc Zyngier wrote:
> > > For the crash at hand, which clearly shows nVHE, can you report
> > > whether the following hack fixes it for you?
> > >
> > >     M.
> >
> > No luck, I'm afraid.  It still crashes the same way.
>
> Right. It was one level deeper. The following change fixes it for
> me. YMMV.

Anders applied this patch and tested on rk3399-rock-pi-4b,
and confirmed that the regression is resolved.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

Link:
 - https://lkft.validation.linaro.org/scheduler/job/8119717#L1251

>
>         M.
>
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index f838a45665f26..b899d815d272f 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -501,9 +501,22 @@ static inline bool handle_tx2_tvm(struct kvm_vcpu *vcpu)
>         return true;
>  }
>
> +/* Open-coded version of timer_get_offset() to allow for kern_hyp_va() */
> +static inline u64 hyp_timer_get_offset(struct arch_timer_context *ctxt)
> +{
> +       u64 offset = 0;
> +
> +       if (ctxt->offset.vm_offset)
> +               offset += *kern_hyp_va(ctxt->offset.vm_offset);
> +       if (ctxt->offset.vcpu_offset)
> +               offset += *kern_hyp_va(ctxt->offset.vcpu_offset);
> +
> +       return offset;
> +}
> +
>  static inline u64 compute_counter_value(struct arch_timer_context *ctxt)
>  {
> -       return arch_timer_read_cntpct_el0() - timer_get_offset(ctxt);
> +       return arch_timer_read_cntpct_el0() - hyp_timer_get_offset(ctxt);
>  }
>
>  static bool kvm_handle_cntxct(struct kvm_vcpu *vcpu)
>
> --
> Without deviation from the norm, progress is not possible.

--
Linaro LKFT
https://lkft.linaro.org

