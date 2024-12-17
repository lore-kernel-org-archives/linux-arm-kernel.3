Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D841E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H51U4YGf/B8HFpwpmbxRVfwUHVnxk/+GoC49FtzGj+E=; b=mb/HWy5c2JQGrmIS8Yg/Yyh22D
	kmJ5NtXk8dWo4h8GxTTO8SVtDOOMz2vbousCObvNll8KbCVoTlBeHwyIgKnqvtSoygjHakV2WVgfo
	zS5mG31NroobElY6mA4o9wdXgHXyt4Sq0nskmx/Zi8XQgy6JhUb3UggMp9ui8LcJeSf5bJ28bT/DK
	LxsTuotTcNGRxtbOB12/JJUyiYJo0eH+PnWZP3nBbBNEWTRV33zDyA3K4ENCWBsU4lMZqlAHOqy3j
	vY0tQyPyzUXvOjTz0gX7yf/VyBjBfDCamllg63gkQXN2fuzml2jt72UawFenECbQs9rQ3JZks49la
	qPxRYBZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXb8-0000000DZcs-0R8H;
	Tue, 17 Dec 2024 13:26:50 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXa2-0000000DZR4-1ubu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:25:43 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4679b5c66d0so203561cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 05:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734441940; x=1735046740; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H51U4YGf/B8HFpwpmbxRVfwUHVnxk/+GoC49FtzGj+E=;
        b=LaHtdekOEp95dcYixQ7LmCahcVhkSqYB90YTeSxSvTlbCqK0TCKYKYwEJXUBipVDCK
         W3Y5u3UTgQTRupclyNc9Ol30zx8TF6rDFMoZ1vbc04yvb4NiIJK/Js0qatWnYml7fv62
         03HqoNYwtEUfMudyISnX9pPljcUEKnJ+yr8CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734441940; x=1735046740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H51U4YGf/B8HFpwpmbxRVfwUHVnxk/+GoC49FtzGj+E=;
        b=bop7+UBrJeshJKVUeUwLN68kXagqAvr0MdklCmeU5EqIrzJIXYW0ZQYxdVxpeldVew
         PuAzp2ritCNnpcCTq88pJS8flp6BpxpeUl+1YFbomjZsnpbV5OuU1kGiZJtjFArJ3qWl
         43Ui5AGYNc6U0jRBb4BYAIHkODT7mpbqBhb3uLeMZKIvJX3vSsf6/eGpQXU7VPpdT7D1
         7qm0YnD1DTpmkU5jd/bYVRaUM2XtYPtH+uebOfCqxgmTfsM/itStHX+GEnZvG82ro8Xd
         uEVSbPlAIKHE+mZvteMaYDzh0Pm2UPf6uxqc+kHrrZTiGLAHLzsRPfLexGtjxfQ4QqEJ
         7BWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOW9h0fA/T1e9sxmQQiI7cL8ZXHmdXOsCRFpvd5kyjhjdyuOXm/9ywtIYW+I9hAk1amsEkC3/P9xjwtS278k0p@lists.infradead.org
X-Gm-Message-State: AOJu0YygJjtZNZTlMDJDDkSmLKN/QI6kZj9HnPx/hEi0oaAuLp6XkPo2
	Ox6NoIdnK/QocHWi1S9zSiOMHtep5pIWUDHoeQjHaCAJsLLwKyokf+6rGaGQAuPAVIxTP+3dzxg
	GzSSxVUceRstBORXJJXCiyrguPgNBP8nVrwJs
X-Gm-Gg: ASbGncud0WUStW9CW/AzFkhBZNMl6wcoX58ghXbY3RQJzljUx2zve2E8KQVPVlrRdZp
	ZR46s8DxeuChy+rYzKKkTif2SLh8uUWaomCnZdz4PJPYSjr4TbiFzYM+iV0g/QYbkuA8q
X-Google-Smtp-Source: AGHT+IGJW+l9zXfMUaeo40XK+7bPUSnqauK+Az+lGUzluD+yQ/VlTXkwH2X6x8KUeaEMIrTECPFcD4EfU3yVGGK8l9A=
X-Received: by 2002:a05:622a:20b:b0:466:8a29:9de7 with SMTP id
 d75a77b69052e-468f96fac57mr3950571cf.12.1734441940466; Tue, 17 Dec 2024
 05:25:40 -0800 (PST)
MIME-Version: 1.0
References: <20241214005248.198803-1-dianders@chromium.org>
 <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
 <CAODwPW_c+Ycu_zhiDOKN-fH2FEWf2pxr+FcugpqEjLX-nVjQrg@mail.gmail.com> <CAD=FV=UHBA7zXZEw3K6TRpZEN-ApOkmymhRCOkz7h+yrAkR_Dw@mail.gmail.com>
In-Reply-To: <CAD=FV=UHBA7zXZEw3K6TRpZEN-ApOkmymhRCOkz7h+yrAkR_Dw@mail.gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 17 Dec 2024 14:25:27 +0100
Message-ID: <CAODwPW8s4GhWGuZMUbWVNLYw_EVJe=EeMDacy1hxDLmnthwoFg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Doug Anderson <dianders@chromium.org>
Cc: Julius Werner <jwerner@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
	Roxana Bradescu <roxabee@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	bjorn.andersson@oss.qualcomm.com, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_052542_527265_ACD8BF94 
X-CRM114-Status: GOOD (  37.17  )
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

> > - Refactor max_bhb_k in spectre_bhb_loop_affected() to be a global
> > instead, which starts out as zero, is updated by
> > spectre_bhb_loop_affected(), and is directly read by
> > spectre_bhb_patch_loop_iter() (could probably remove the `scope`
> > argument from spectre_bhb_loop_affected() then).
>
> Refactoring "max_bhb_k" would be a general cleanup and not related to
> anything else here, right?
>
> ...but the function is_spectre_bhb_affected() is called from
> "cpu_errata.c" and has a scope. Can we guarantee that it's always
> "SCOPE_LOCAL_CPU"? I tried reading through the code and it's
> _probably_ SCOPE_LOCAL_CPU most of the time, but it doesn't seem worth
> it to add an assumption here for a small cleanup.
>
> I'm not going to do this, though I will move "max_bhb_k" to be a
> global for the suggestion below.

If you make max_bhb_k a global, then whether you change all
`spectre_bhb_loop_affected(SCOPE_SYSTEM)` calls to read the global
directly or whether you keep it such that
`spectre_bhb_loop_affected()` simply returns that global for
SCOPE_SYSTEM makes no difference. I just think reading the global
directly would look a bit cleaner. Calling a function that's called
"...affected()" when you're really just trying to find out the K-value
feels a bit odd.

For is_spectre_bhb_affected(), I was assuming the change below where
you combine all the `return true` paths, so the scope question
wouldn't matter there.

> > - Change the `return false` into `return true` at the end of
> > is_spectre_bhb_affected (in fact, you can probably take out some of
> > the other calls that result in returning true as well then)
>
> I'm not sure you can take out the other calls. Specifically, both
> spectre_bhb_loop_affected() and is_spectre_bhb_fw_affected() _need_ to
> be called for each CPU so that they update static globals, right?
> Maybe we could get rid of the call to supports_clearbhb(), but that
> _would_ change things in ways that are not obvious. Specifically I
> could believe that someone could have backported "clear BHB" to their
> core but their core is otherwise listed as "loop affected". That would
> affect "max_bhb_k". Maybe (?) it doesn't matter in this case, but I'd
> rather not mess with it unless someone really wants me to and is sure
> it's safe.

Yes, but spectre_bhb_enable_mitigation() already calls all those
functions on its own again anyway, so I'm pretty sure the "must be
called once for each CPU" part of spectre_bhb_loop_affected() is
covered by that. (Besides, it would be really awful if they had made a
function whose name starts with is_... have critical side-effects that
break things when it doesn't get called.)

> > - In spectre_bhb_enable_mitigations(), at the end of the long if-else
> > chain, put a last else block that prints your WARN_ONCE(), sets the
> > max_bhb_k global to 32, and then does the same stuff that the `if
> > (spectre_bhb_loop_affected())` block would have installed (maybe
> > factoring that out into a helper function called from both cases).
>
> ...or just reorder it so that the spectre_bhb_loop_affected() code is
> last and it can be the "else". Then I can WARN_ONCE() if
> spectre_bhb_loop_affected(). ...or I could just do the WARN_ONCE()
> when I get to the end of is_spectre_bhb_affected() and set "max_bhb_k"
> to 32 there. I'd actually rather do that so that "max_bhb_k" is
> consistently set after is_spectre_bhb_affected() is called on all
> cores regardless of whether or not some cores are unknown.

Yeah, you can reorder the loops too. I don't feel like moving this
into is_spectre_bhb_affected() would be a good idea. Functions with a
predicate name like that really shouldn't have such side effects.
Besides, I think is_spectre_bhb_affected() is probably called more
often per CPU, both once from spectre_bhb_enable_mitigation() and by
whatever calls the `matches` pointer in the cpu_errata struct.
spectre_bhb_enable_mitigation() seems to be the function that's called
once for each CPU on boot to install the correct mitigation, so that
feels like the best spot to put the fallback logic to me.

