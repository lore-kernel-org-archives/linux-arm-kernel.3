Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DAFC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrN2boTDwdY7zzXQMC0DmC8Xqjzwg7Z5l0fiFiA7274=; b=2Rkv8OsSO+VIV8S0mI+HB/s+kr
	2KXUCYvMJnw001o0KnL6Cwx+gF9DbBHiTMorE0WZ1lKYj8Aw1LacQH4NQcjSkx1aofUsfFsZX10uW
	fUn9OJPj4Ww+Ys2TZeP+n2K11gTz7hk/RLlzBCd6mJ7KHxh5Ssgy7B8XskQPNV6KDbAiMnnlE27M0
	Otb8akml+okbe5rcjKNYsg1KOLWFgWMbN70bWSmuhPMJAnX7b5qPKHhCA6SxqEZE8w+iRqbKcTyAx
	lVcGSG7ixRFPyNdRCeEpoYDwNQojZg4tUT9zKYlCeOjZ/PMomOQVBe9Z254xRZng1NiT3mku8jDNW
	kS7c01jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaITU-0000000FVQb-23Qo;
	Fri, 11 Jul 2025 18:27:56 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIIm-0000000FUIF-0ffd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:16:53 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-60c93c23b08so4556469a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 11:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1752257810; x=1752862610; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GrN2boTDwdY7zzXQMC0DmC8Xqjzwg7Z5l0fiFiA7274=;
        b=APbOeUw/p9XbwiuppllSb/3UnRQCoSQaXPqiQtTvLY/eiWjWf7syOd3R7jh24tSNU6
         zFkY1cwQhsiC4JiyWcSHK44KLTYtPqSidPDYS9aZ4Fqi8YPl6hs+q0qBMMbWNGVIUJQE
         Ck1Gfh8qaxVwXxyXjXuPPRYJYd+spMOvVRu0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752257810; x=1752862610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrN2boTDwdY7zzXQMC0DmC8Xqjzwg7Z5l0fiFiA7274=;
        b=RWLQOQ8rtRdspPhq6UdNfT7jdlO0JwCIBWdLa1BUGAv+fEzurEM2lMCCQJiBV1hVwO
         pcZv8yq1b0IGYk9ig3GoJrup/3cM6eXbzauLcYnouKJIwBtRPrg/ePb/LHDIol+xBxV6
         O8QKtOS5fI7yPlfre6+BTo0BHpVZIvQ4J6w4RgGj2WI4N/8Qpmh/ui3udbOfYLfKlJhg
         0BxdFMGnY3CDb++DaCGhN2uwsUDXxetjmd1QmfAn/7SOCqxC2ybrV51pCWNPZhEqdni4
         CuzAtYikpkrvP7/xNvUqqJlxhhTM4objSlkcsV785zeVeKwqMr59PixdBJbYlKBqo1D4
         HApA==
X-Gm-Message-State: AOJu0YyN2roFHTUYIqNLV8eec3LsIYOqTW0H1sLPxzS6mGvjLTqNlGbI
	EQPtNG89t+WB3cHJ+8pntUUSDmAAMiMQO4xjN5f/H0PDX3efsnK/DsSlstQ4QKoEsF1dLK5ir83
	whqrlqjznaA==
X-Gm-Gg: ASbGncvfS8FrkO1EQXC7S7mdRw93S+oU0DuNpbXK4FLu62N8uJbkTrQLwNciGTMN0y2
	RAYrUVCedeWQ9m9voPp7ygnIS+Eqx7p2H2JTefpWP8OzFlEPKb/k5BDTmgMsWLeO18HKm2p/yKh
	t5HuAWhq2BBtQrgIvs87GjXX/enuZLuHdAVlLpyAfocu5kgGldf3WmVoZUPLnumAuUpALBHtCS8
	iMTUFb1fscFznEQXkYoewXuYRvukOCSREqnxmtLeFDz7sobbYgRYr4JjKfMBjcufzP25HlowQSR
	ZMi1BWqSA0apJaUDzg17ZbVMO7PgwHeCGr9LWJ1g9kp9RxG/1hEjn560DVgu0pukMezDbuUCo+g
	lEtwXssk/foU7OTefDuNximNY5G7xi+o4K465rgqgH/CeI+6WVg0rcXaczZdzpmot8tSPIms2
X-Google-Smtp-Source: AGHT+IGgqMywC44NUdkloFe6zkoDTRF+nkl43XFq+2TiwardG8JLAuzi3F5yym5qAcXmJNm6ThRoYw==
X-Received: by 2002:a05:6402:3889:b0:60e:726f:8e30 with SMTP id 4fb4d7f45d1cf-611e84a35fbmr4006892a12.18.1752257809993;
        Fri, 11 Jul 2025 11:16:49 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c94f48eesm2480974a12.3.2025.07.11.11.16.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 11:16:49 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso3642387a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 11:16:48 -0700 (PDT)
X-Received: by 2002:a05:6402:454b:b0:604:e85d:8bb4 with SMTP id
 4fb4d7f45d1cf-611e84a3613mr2945462a12.21.1752257808496; Fri, 11 Jul 2025
 11:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250711161732.384-1-will@kernel.org> <20250711161732.384-11-will@kernel.org>
In-Reply-To: <20250711161732.384-11-will@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 11:16:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wijmAO=-dWc8HUMdUbkdGqgNtiO6mntAcTekWc5qN3YjQ@mail.gmail.com>
X-Gm-Features: Ac12FXzHjD0wng1ky85XRCcFPrfFYtoOUVtma4lAy9KVvuoCMzEgKe72-0_IGfY
Message-ID: <CAHk-=wijmAO=-dWc8HUMdUbkdGqgNtiO6mntAcTekWc5qN3YjQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] arm64: mm: Re-implement the __flush_tlb_range_op
 macro in C
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_111652_320742_0605EFC7 
X-CRM114-Status: GOOD (  15.66  )
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

On Fri, 11 Jul 2025 at 09:18, Will Deacon <will@kernel.org> wrote:
>
> The __flush_tlb_range_op() macro is horrible and has been a previous
> source of bugs thanks to multiple expansions of its arguments (see
> commit f7edb07ad7c6 ("Fix mmu notifiers for range-based invalidates")).
>
> Rewrite the thing in C.

So I do think this is better than the old case, but I think you could
go one step further...

> +static __always_inline void __flush_tlb_range_op(const enum tlbi_op op,
> +                                                u64 start, size_t pages,
> +                                                u64 stride, u16 asid,
> +                                                u32 level, bool lpa2)

If you replaced that "enum tlbi_op op" with two function pointers
instead (for "the invalidate range" and "invalidate one" cases
respectively), I think you could make this code much more obvious.

And exactly like how you depend on that 'op' value being
constant-folded because all the different levels are inline functions,
the same thing ends up happening with function pointers where inlining
will result in a constant function pointer becoming just a static call
(and in turn inlined as well).

And then the actual *callers* would use the "look up op" thing, but I
suspect that in many cases those could then be in turn also simplified
to not use that op-number at all, but just end up using the op-name.

I didn't try to actually create that series - and I think you'd want
to do it in multiple steps just to make each individual step small and
obvious - but I think it would end up looking nicer.

            Linus

