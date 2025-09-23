Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF9ACAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWyQsVT69lCH4BbHgJw8BTZrGLVn1LISbLgsWJksB2o=; b=COK5yiLs1rf7VI5CSAfbiPHYQW
	7t2h8JVPLGUgDiZfMtRYplY20qid8xv9+HBztolEmEfx2MzcWPxI/n2tO3X4QS2VfactrvE48HNbR
	gKPwWYVQAXl/hOV0xVG8KMFA35KoFbA352a5Le2iMKmrM0WYLfMWYaSwNRqUN2kCEodWuthBu2m7Q
	2P6bRmCaPLU06Okv28WNY5yDUIfGg+BuSWQ4YtFKBKlvYpjdWp0O6RQNM1MNnozkAjn5s8E67Cz6N
	jZm18COodh8XjXNs77uLgYIhNZXwY1ZRlsSbPeGzj1T4gSWWOrihEC617a/zbKhccf3tO1/4JXS6x
	NHW17iyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11Ow-0000000DDlQ-0FRw;
	Tue, 23 Sep 2025 11:41:42 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11Os-0000000DDhP-1dw2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 11:41:41 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b07d4d24d09so924773066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 04:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758627696; x=1759232496; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IWyQsVT69lCH4BbHgJw8BTZrGLVn1LISbLgsWJksB2o=;
        b=V/adBUZiBcdVo3kzzB81YP7kFV/Rkek6rK7rCGxj6Lk3PzyK8pqCUOECSLWEgvoyHm
         0wkqS35UFKApu32J0RxDTY2K36isdP5Ki/rZfvrx2F24i0YF1Dj9NOdLrd9ov5uwwoYK
         rEOY8BbLqUN1qFHBZc7eJ0DP1Hhtzz6evtHxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758627696; x=1759232496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWyQsVT69lCH4BbHgJw8BTZrGLVn1LISbLgsWJksB2o=;
        b=uVF6wkSaivbFm4H5ZY/gQL721Z0eh/uFqCQdyq8bMIaJ03UdAykKttxBqENSEkrqFb
         IDnlPdhReu82MK4Xkv7iy6M+fyMR/SEauw9W41UPF2wdf/HPAeVpfdFWFYM9tTFLnVnN
         fXBm8/RM6ZLQ2JtR+1/lquaa5+M+8UdDtrt45jcKPQBdoc3XvywX0/N1r30IJwRQmsyX
         gJWQntSdGnGPpURje544wBNb1OT3NSVVDEEU7i/s/xokKeqElcaP0XraldParv+mZRmy
         nu/GiG26T4TLDQtMtKdlLZ0l9Vll9KDx5dD5glT9DQWC4O4ABxJ2esUvjEpohd8VTBIt
         t6pg==
X-Gm-Message-State: AOJu0YyewQMS22o0EccpEfLsOa1dFpISqEuQK1vmmbVYSr7mBAacVJKh
	CoS0QyPKr1WOEdCXv186SAk4O6qN6dbJlhjPjZiWXj7kp+waY8PUr7Ws0Yk7/eNQjyVQ7ncitQD
	2PI4TBj0OYelGUtR/dKejPX1baNaUX9YE/ovYR4JR
X-Gm-Gg: ASbGncsBZU0tdZC06sS6TzRjQ2gY2oEBp2lb9udsZQ3tfOlBA7z4wW0R13yu5PnWRok
	oj5+vCB3LIflNhcAw6jQTuD8WQTlwGU9HTU5Fwaa67QxNkptJX7cRewqKLySG7D5kzdEC4kTLsS
	uF2FqJwGeQCTBaV1gfL1VADr5wMwmVhI5CQvkBXIZm/A6DikPbVnkZZ9C6VzGNkJsC9++k/kOeJ
	bSDDA==
X-Google-Smtp-Source: AGHT+IGrdWASkDi0uzKstAS6gCO+IkX+beb6qDtQM/pHo/U2gJML4F/8n8aKHXSqRtEtzuVCYsCIm2sq6lJUE+SBu9U=
X-Received: by 2002:a17:907:3cc7:b0:aff:17b1:dde1 with SMTP id
 a640c23a62f3a-b3027262102mr225357866b.1.1758627696464; Tue, 23 Sep 2025
 04:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250922224835.1918759-1-sjg@chromium.org> <20250922224835.1918759-5-sjg@chromium.org>
 <c02f08cc-0613-4e57-886f-9d49803cea00@infradead.org>
In-Reply-To: <c02f08cc-0613-4e57-886f-9d49803cea00@infradead.org>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 23 Sep 2025 05:41:25 -0600
X-Gm-Features: AS18NWB4EKjOIEuMPIXmxBf8Tvh6v8BvbRz0KdMc1wY4lFgjkq_tIGSsRb9Mi1A
Message-ID: <CAFLszTjZX4raMaxG0mk1Tbborh8=ZBJWSCxAL_=4H-G1fQ6f-Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] kbuild: Allow adding modules into the FIT ramdisk
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, Nicolas Schier <nicolas@fjasle.eu>, 
	Tom Rini <trini@konsulko.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	=?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Han Shen <shenhan@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, Rong Xu <xur@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_044138_511083_130D8C05 
X-CRM114-Status: GOOD (  21.29  )
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

Hi Randy,

On Mon, 22 Sept 2025 at 17:08, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> On 9/22/25 3:48 PM, Simon Glass wrote:
> > Support 'make image.fit FIT_MODULES=1' to put all the modules into a
> > ramdisk image within the FIT.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > ---
>
> Regarding $subject, a comment in scripts/make_fit.py says:
>
>   Note that this tool does not yet support adding a ramdisk / initrd.
>
> Is the comment incorrect or are you changing that feature here?

I am changing it (in patch 2 of this series).

Regards,
Simon

>
> Thanks.
>
> >
> > (no changes since v1)
> >
> >  scripts/Makefile.lib | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 1d581ba5df66..2e880d9b4706 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -398,9 +398,15 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
> >  # Use this to override the compression algorithm
> >  FIT_COMPRESSION ?= gzip
> >
> > +# Set this to 1 to include an initrd with all the kernel modules
> > +FIT_MODULES ?= 0
> > +ifeq ($(FIT_MODULES),1)
> > +EXTRA := -B $(objtree) -m
> > +endif
> > +
> >  quiet_cmd_fit = FIT     $@
> >        cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> > -             --name '$(UIMAGE_NAME)' \
> > +             --name '$(UIMAGE_NAME)' $(EXTRA) \
> >               $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
> >               $(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> >               --compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
>
> --
> ~Randy
>

