Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E5ACCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VW0WR6gjAMLk7ssOuT+h93+Mq/Mh2Qgy6V3tj7tIR6k=; b=M4QlG1xMfKaEnPSCKzAcYqZye4
	z+zAvivP+MsYlsPoNao8500doLZX7WVQZIgxPtGuCur2EHzL2VzBX5Y+Q1rVX+dy9ZiDo3nli97kF
	glT9fXNssKJzZGkwsO0q8+Mz7h3CF+DoDUzk8dOanPTeRsZSnfKo1dY70GTyfW9UKJ0w9h3vpQjqC
	tPyqVa1D13AopcNlK4KKeIANXCQ1J1b/SZtrt13mesPoFSRAO4IuprCi6bUF6GGHz16EllIuERC55
	7psY8AVWbw4KgsMVpBldhQ/guvlDMqw+zK3BzZZkKAZsZt2+EyTEdYjuvp+VOLAVFBjvSXolSXIqP
	LlTF27MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6slQ-00000006Wp8-2X4K;
	Thu, 09 Oct 2025 15:41:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6slL-00000006WoU-24kW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:41:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8270348C5C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Oct 2025 15:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A6EC4CEF8
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Oct 2025 15:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760024462;
	bh=80dr6FmDPaHXZjye0QIHqLx3K1DQ3O1X0T0RQaSoT3Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CsJSuWu06qyUNIn9w8dHf1ZpuFWiDaewcxQ3BGLr/v81sEUOe3KRgIKdEJ5qBuFpi
	 sxHJfrbNl7AK/j+gEeNSk9Mzbczj80AJ9vAnj4N9x29VaUuhWC9h2X/ER7wB5uHdIg
	 p0woDlwTI5ZX5VgcbNCAarQdPpXio5F3/PNXmXIayxCX5QsAXv8UfepgqWFv0hcROt
	 a/6MFc4zrjPbjhgxsiHOQWNcAA2G1hYNGSdEGjiHbqFMRice5blBCojbW78PZiQb6H
	 fdMjVVFiNsFXQ7QwsfOA1iJhtxaqQcBVndUN1tnKhJ5n6f3ZsnLoLZcwZnAF4DnRGw
	 L4z6mCEgB6szA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso1390456e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:41:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4nB/4a7XOsuy/nfWXkkFDruVNnbH9AxzpGtBNOFS4xWuDv/wjhIL3/lkxTrT5kOgpiNm2cuX6ZH+ZavcoJF5X@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8WS3vD5ZcpHXmmnhu46t5IOKfthn2YwPHsZagHtpsRo/dEIpH
	PaOmIFxrDSbTjy3U2GmhiO9YxMSoOkcqheomBqqxglmvcbBWBczAOa7xszersIRnhx0ZruGiKWn
	EEpBl9aKPe2WpSkfZOi5Z9Xgs0f7tg4M=
X-Google-Smtp-Source: AGHT+IFvggn52Jr3Pk4NDKzUSkMqXUOlcIgJNBxXoDLjqm4Ytfqw+5sO+oeTOLvazwEtX7+h4EfrdY9IRaVlq2vyDMg=
X-Received: by 2002:a05:6512:3b22:b0:57d:c4a8:4565 with SMTP id
 2adb3069b0e04-5906d88a511mr2037498e87.15.1760024460711; Thu, 09 Oct 2025
 08:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <lEQKYlJspHGzmd8DyuKKcpZege3zgX8WlhnHUM044EmEhtaElIqZrX-cZ5ApNx9ylcn8fS1JjzCPcmEP72WXnn4H0JrsFYge3Jba-YngKrs=@protonmail.com>
In-Reply-To: <lEQKYlJspHGzmd8DyuKKcpZege3zgX8WlhnHUM044EmEhtaElIqZrX-cZ5ApNx9ylcn8fS1JjzCPcmEP72WXnn4H0JrsFYge3Jba-YngKrs=@protonmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 9 Oct 2025 08:40:49 -0700
X-Gmail-Original-Message-ID: <CAMj1kXHMAb_AzfTK1ze3L_kA4wPxXqNOZfj_Qj5ccU6oHVo6fQ@mail.gmail.com>
X-Gm-Features: AS18NWArMxTMnsmC-FN585JeC7ZXeqqELRKp1ZQvVVc05BQTRTTrkJSLsOL_qjk
Message-ID: <CAMj1kXHMAb_AzfTK1ze3L_kA4wPxXqNOZfj_Qj5ccU6oHVo6fQ@mail.gmail.com>
Subject: Re: [PATCH v3 20/21] arm64/fpu: Enforce task-context only for generic
 kernel mode FPU
To: Jari Ruusu <jariruusu@protonmail.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, 
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>, "ebiggers@kernel.org" <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_084103_576623_AB111123 
X-CRM114-Status: GOOD (  13.89  )
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

On Wed, 8 Oct 2025 at 21:35, Jari Ruusu <jariruusu@protonmail.com> wrote:
>
> Ard Biesheuvel wrote:
> > So enforce that kernel_fpu_begin() can only be called from task context,
> > and [redundantly] disable preemption. This removes the need for users of
> > this API to provide a kernel mode FP/SIMD state after a future patch
> > that makes that compulsory for preemptible task context.
> [snip]
> > --- a/arch/arm64/include/asm/fpu.h
> > +++ b/arch/arm64/include/asm/fpu.h
> [snip]
> > +static inline void kernel_fpu_begin(void)
> > +{
> > +     BUG_ON(!in_task());
> > +     preempt_disable();
>                 ^^^^^^^------this looks okay
> > +     kernel_neon_begin();
> > +}
> > +
> > +static inline void kernel_fpu_end(void)
> > +{
> > +     kernel_neon_end();
> > +     preempt_disable();
>                 ^^^^^^^------this looks wrong
> > +}
>
> Maybe that second one should be preempt_enable()
>

Indeed, thanks for spotting that.

