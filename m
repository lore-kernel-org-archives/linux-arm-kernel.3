Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859F6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55lo0aofODQs02uG9VovT0wfddIORdq11yOlKOcVWUc=; b=whid/p17+X5zjFWM9Cncd2+nru
	TXV6ehHNsPMjBnBC0+nppTiOn6AIlwf2dyyghMKXCifDFcLSAwYcDKb23rlwijivaCVdOP7S5uYF4
	V91Yos6NfYj+Z2cayPnJuv3sQ8IzTYoMx2mLoKq1lAjcFRgCGcnhIUnuuN69IRwNy6avoelTg/X2/
	xjly/KoRHQeo1jVeg8ti1wmahtGGNSeF5+nNlIhPmC28LllVtWx0GGKKqZKyVwna8iYqIO0QMkt+m
	Uau95HzK1KsK0fkMeKInfnf2CthgjTLOJyNMTtsgDEXVzzgzZ0L8hS+nAfifqI1Gj+uJik7ZcUB4K
	dTEdEw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wewuH-00000002Oto-0CGA;
	Wed, 01 Jul 2026 15:31:21 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wewuE-00000002OtO-1rNU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 15:31:19 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-51c10e86e52so279121cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 08:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782919876; cv=none;
        d=google.com; s=arc-20260327;
        b=XiF6evkC06oPri+AFwstYnokA6q569d1xngh5L8sFm4GH+LzYivszBR8QkLXjVT371
         2E0DtozfP9VKR5XAS4WFmkaOZD7Nau2e6pa1DAq4oOb/bfpEwvUQIGQSWw6gUZnIHeFz
         b+1Az+z8CPPsNFs1QxIYS7mzQSg31g41YF3MUq9lmmbe6ztm/WkmrH2F9w+4PIzzGbey
         Lj/XVvnnIpqgJQDvQp9q3gGXE4OBPk7GxIJjZLF5v1S1JsBVebUKWc/oWM0BneXv/eR7
         Prd/MInMntfruDvqAUZpRJBWj6rlXxIRx/RZS3anrfywxFV+2wTC1DfGFScse7/nkVzH
         ZEZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=55lo0aofODQs02uG9VovT0wfddIORdq11yOlKOcVWUc=;
        fh=3DhDWVS9i6BLt6fyvaC5GTCLtRxgdEMDUXTufyLop4E=;
        b=q76ZN/NZT9WeimPG0eKlBxjQm9vzUnzS+4NkNw46czM+EwWFOpbOSzMczSrKlTEHHJ
         LM334V5qRa66g4X9X/WqJLah7XVTfdOJRr3m0yFe52OdEkFtddzn2hT5j9GWb0CUxCIi
         PPoPJsgPMO335zc8KrDcjSYm7/e0ADFdXbgZ2qHW5xRdugwv2xIewCmIiXzCYOY1OIDn
         KIKAxlYYiPMJVuyXV5de4Mdt+pkZKR+QL5HdtUDd78dRUc2RO7u/zHRxQBalKVbqjqad
         0wvf8c55Xh0jNCZNhCjU6njroRECIoYzwuWwh3ONgYkT9ozwVl+wOR675VnbGcvFILvB
         Bu9Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782919876; x=1783524676; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=55lo0aofODQs02uG9VovT0wfddIORdq11yOlKOcVWUc=;
        b=g4eX7dbknmo1Rfn4lIpOrxaS8PF9+hcHNuSwbUKjMMXNZECd/CvMQpGfmgLvZ23S3S
         vUAA6cSrOnAe+chrbApSMAd18bU5ZOaTqq52iyW/eZPIf8A6EB3UHD/HDepGDBeM3AEX
         ljADbAhdecX3Z5rd1Zh/OrZWdlRVft6zH5kehebXD1ABMeK1bsX6LYD+x8oNdQZgBIw1
         z4Lmk7E9yg0Q1I/FenF1FEwq2RR1UfJRQnGKdteqYRz5VT/UoFa4a9+zDGddp1vRPB3O
         3adOk2H+xKalIrr7vgpLg1vD7g8k+Hj1eohBXPri0v+HfOa34qwnbLBc2ivqtd4PM2KW
         CtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782919876; x=1783524676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=55lo0aofODQs02uG9VovT0wfddIORdq11yOlKOcVWUc=;
        b=WDzdXoRS9b2bcQtcbs+U4RATcbGkgEcUqsSTAHpfiFSmee3GIVO4/KbaGbxwwYlCgP
         WlLgKK3gYU/ctKaiotn9ZOAUgzD3rbx19UY2FSE/mDBysCLVyqp7g4n020kVL7vy16zY
         5bJaWl7757LeCoPdSgDEtOWxAM7u70/12nbi2sQgqb1zoub53d+FMVeNqUEfz9nh5dZV
         jq3tbClCroBtQgMGmm5j7/Hd/TUdE8Hgk+UXQGZydydOvWoRn8FAW1FfBSa2A4QJin9g
         3ZvXvT66/QJ0fGKdx4dp9QQSEL5guz76hO+sidyW8MtqGmHOFC/PKIwdewgsk2Fgyezb
         nt8w==
X-Forwarded-Encrypted: i=1; AFNElJ+hbuwxzxKnvKmAV4VkkEXL0NlmKaJtLl6yWvQeqBV4zDXiBnLPtCpDKdSaykAhKOL1m6+xgdnAjOgZ+1OPE0Q+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1N4ThshyvOAKk9f80HmR9QDHOS+Q5LhrEpl3JMxp3FOLgSTYI
	KrHPBmGoZAKc8bdj9n7iEhcc/qfTrO93KbR5SKTHgGpW3eBwrZ8v/sWCquFkKx/pYWj8gTeRZWR
	e5NUV4rHzDy+vdAeuXqgmJ4q+iSsvEVQPnJGlPzP4i0CRsqvwx7b4azidaZM=
X-Gm-Gg: AfdE7ckawCHC4M7aObpd3H/HJPyOJghkB5SlOIbj/8NH3iLXZ4WBypq3RtN2X139W4L
	LgMR3GcZx6TP4oWamHvISqLPSv+kIx6Pj+5H4sJBz1SPzmOmcg292UmPuDqY0BAbVTGy8Ex3U4K
	PY6IxKg5amF1ZX+bLzHYrTdA5+PWjlcYJ69udDaWjzC+e1WV0feFkSlTrFqM0UWtaJHnZq4Effj
	K5dUo4C3q6URMGnAT6emM3NfZc3SQFt+OsUbY2PbpgB+NLYNJXskHdZ59qEadoiFRy24NRLOwTB
	iGZb
X-Received: by 2002:a05:622a:1489:b0:51c:289:6979 with SMTP id
 d75a77b69052e-51c24ad22dbmr7660531cf.21.1782919875291; Wed, 01 Jul 2026
 08:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-arm32-cfi-bug-v3-1-e3c37e2b80a4@kernel.org>
 <akT1lr2iNzbnGEzH@shell.armlinux.org.uk> <CAD++jL=_j69pFuM+vv-8Q7x4VA=PUX8iV1Yfw4YkdxGDFo9D1g@mail.gmail.com>
In-Reply-To: <CAD++jL=_j69pFuM+vv-8Q7x4VA=PUX8iV1Yfw4YkdxGDFo9D1g@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 1 Jul 2026 08:30:38 -0700
X-Gm-Features: AVVi8CccdFxYQjLQCTfyDOXy92KNPnmhAMyQo3FP3svHlBkgrYYSxYCe2kFFN_Q
Message-ID: <CABCJKufpj8LiSYtkSS=oCJqt+gW=tY5yFTyWr7KP4iLUzxiO4g@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: breakpoint: CFI breakpoints only on demand
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	slipher <slipher@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_083118_485957_5992510E 
X-CRM114-Status: GOOD (  22.50  )
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

On Wed, Jul 1, 2026 at 5:50=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Wed, Jul 1, 2026 at 1:10=E2=80=AFPM Russell King <linux@armlinux.org.u=
k> wrote:
>
> > Have the LLVM compiler people responded to this bug yet? What is their
> > plan with the silly choice of BKPT usage for CFI failure?
>
> Haven't heard anything.

LLVM's generic KCFI pass uses a debug trap as an architecture-agnostic
way to trap on failure. It shouldn't be a problem to switch to
something else now that we have an ARM back-end implementation thanks
to Kees.

> My tentative plan is to follow this up with a patch to LLVM (and I guess
> then later also GCC...) to enable handling CFI faults with a read
> to the guard region at 0xffc00000 instead of using BKPT so we get a
> good old predictable segfault instead. I was thinking something like
>
> -fsanitize-kcfi-guard-region-address=3D0xffc00000
>
> My idea is that the unwinder can then see that this is caused by KCFI
> and act accordingly, but already the existing stack trace should make
> it pretty obvious what happened.
>
> It's the best I can think of at least, haven't seen any other ideas.

Note that for X86 and RISC-V the compiler emits a list of CFI trap
locations in the .kcfi_traps section (see CONFIG_ARCH_USES_CFI_TRAPS),
which the kernel uses to figure out if an exception was caused by a
CFI failure. I'm not sure if this is useful in your case, but the
plumbing is already in the compiler and could also be enabled in the
ARM implementation if needed.

Sami

