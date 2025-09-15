Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C747CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 19:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6wqGfRu2qI7+46L6ERmQDqDyxlRm+K7+bHyAwd1/ys=; b=5D7DQPT3JOUUVJl1+qno67JRtY
	2WIbDlK/3KGsuhBiqDh97hl4Z0LSK6WIiFcr7NYp5+wnB+uX66rJT2TfeZHaE38aSCV4SaoRwmQiK
	WYWgv4IYu1An8bfbKt9bMAUoK14D7gzMVi1DEskz6GPbyr9tt67sLiN079UXhaHOBDLddPR8H7Qjo
	brTC5M0npEbTQnijb5JmBHTMUvg8+4aPTc+n+RrD9JXQaKckLkiYCyRq6RCP08Utq9xTR9zRi5hKd
	WtZbHzN3V2MFANzQcfc3LRjXW79lWeeBr9R0oQn5iszQT5C1zJ4Nv8txIGw+J3JHXNk+vczes9fEr
	nS5tUl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyEfC-00000005URZ-0JkZ;
	Mon, 15 Sep 2025 19:14:58 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyEf9-00000005UQX-1gC3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 19:14:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-267a5aeb9f1so6441925ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 12:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757963694; x=1758568494; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6wqGfRu2qI7+46L6ERmQDqDyxlRm+K7+bHyAwd1/ys=;
        b=Xx8WKkvGDkucxqwXPDoIIsD4KWDWIaXpu8Sk3Qp4i/sNPFTgO1izRGYTQ8tTDZMe5x
         ao8ABZjc8doHoeXWmCvbZEewFgyP7vlYSL1T9lGakjGriQl7BTAERdznWwDF+BUk/buP
         +IN21P28zZW+dffVwgyEny174YpQAucBPPcU8PS3EmnKUBGNM68T0EAkBw5C4twCoels
         v5Q6Ced2zo/N2DGBeJZIPS+urTSxZSvoDYw6DzE8G309afInpVMvYDZYGZ0Ss64VnCQb
         ZtHYmwf8Aoi2AvR8DcPuEnq57/NTkrOWXw73E2krScigifScZgn0MN/olyZPJ40anBEx
         s9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757963694; x=1758568494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6wqGfRu2qI7+46L6ERmQDqDyxlRm+K7+bHyAwd1/ys=;
        b=Y6p/pTgACSXzvOaxjwIejuF5iTPJlZIlx/pe4p+sxSYm2kd8UdaDHFzWCIgK2UULnr
         u5PcHGz7cfEu+PTXFJKBmkXyWQwxHZxw09v2Apbe+0zzl5kl9cPZ/bmDnho4j+/PofzU
         yQXSCOoU/V/teCDByi2wJC9+z8wTHyHcXzyFwRY6Fuo49kd3jpBOrFNrkzyb+1aqChX/
         pNhhJBBqpwihCqPJXxt0ESN/VPPIdfCt93pbIdQicBXTwztogRXQYFvjUXCM48Yff1Bb
         54tvdqc/+vTkK4yKBYpn9meRtcU6ISNd9+B4bkpl7cBVdAC6wnIhc4JP1UfzpHuvdCsy
         UfwA==
X-Forwarded-Encrypted: i=1; AJvYcCUevaCqBdS2JoxtFjQ/+aIxx2aTDzwZy8arXAPItb6JctPp7xyPAFzk95oXVha5f9gtd1R6JVjA2zL9p+9evoHN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8kOt8MsAW2P4x0gOdlUw4v647LdZ/p/DcegCGaYku88PypUOL
	yEVlbEY9fbDbNRpbSIBuvjh4JIh5uQ1MGdvekqoWvBWYiYN5J6cKhwYYjYp8Tc/ZW6AwxR5k4TE
	8tstIdbxdleOIH/KerP7g34MQE5xav+S95E6nOzc1Fw==
X-Gm-Gg: ASbGncuFhjW7Tm9oKq2iF6YHfqYEnh+ah9HsWcEJyzPeJo12fZfRQ2ISyF+lBApe26z
	Q1di6pKDcPdfM8pX5Gz4DRBTAHeJPYAGJ6Lec9zLhl4HKK07EXLHBRH6rlYqIwOawo9SDwFmrzp
	4pvcY2sU5mdUZEIlGnS3MgHjK93W41C+1C0DwnjxIIfoIzBeF6dycf4olN8Wis06eg89ID3xxsW
	vUzJBzOYXC6a1xW5PItud8WBg4oQCYVkcWnFRlZNiXay2dMi0ACStz89P+00jzR+sBB0DKeWzPY
	VPNqmQ==
X-Google-Smtp-Source: AGHT+IFS5Yosk8zDvCLXFq8KmRAPDnuqfaDSdxmgmvOa6yUNvkUlqGro+dILUrXNR4yBf3K+Z0YAEwYFzYRDWuMc2Nk=
X-Received: by 2002:a17:903:40d1:b0:267:bd66:14f3 with SMTP id
 d9443c01a7336-267bd661815mr9354435ad.51.1757963694201; Mon, 15 Sep 2025
 12:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com>
 <1e331ebb-3315-4cbe-b194-ccbeeaded4da@t-8ch.de> <965c8d7e-c5f2-4bd8-ab7c-c3116632f015@sirena.org.uk>
 <5e4d9943-3a8d-4281-9007-f49bfc66dc6d@weissschuh.net> <b9b8b8cf-4920-4f9d-bcea-bea913058601@weissschuh.net>
 <a1dc9839-ab45-4dd6-9eeb-4bbc35bf8d90@sirena.org.uk> <5fe12804-2538-42c5-b5c7-66d36ff947d9@t-8ch.de>
In-Reply-To: <5fe12804-2538-42c5-b5c7-66d36ff947d9@t-8ch.de>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 16 Sep 2025 00:44:42 +0530
X-Gm-Features: AS18NWAPyThDdNoP11CbNq-0STFMKwn1jS9ssO9hoUB8yYX9018L0FgtP4-g6Ow
Message-ID: <CA+G9fYsnPBYoeVMzQJMCPA1JGhcJXr53Y-_uOMKdB_3D7ZGQNQ@mail.gmail.com>
Subject: Re: next-20250909: selftests/arm64/gcs/basic-gcs.c:390:30: error: use
 of undeclared identifier 'HWCAP_GCS'
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Mark Brown <broonie@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_121455_451730_00C0E40A 
X-CRM114-Status: GOOD (  18.72  )
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

On Mon, 15 Sept 2025 at 14:53, Thomas Wei=C3=9Fschuh <linux@weissschuh.net>=
 wrote:
>
> On 2025-09-12 12:14:00+0100, Mark Brown wrote:
> > On Fri, Sep 12, 2025 at 01:07:58PM +0200, Thomas Wei=C3=9Fschuh wrote:
> >
> > > The Makefile does *not* use -nostdinc, so the nolibc program probably=
 finds the toolchain's glibc asm/hwcap.h.
> > > There also doesn't seem to be a static arm64 hwcap header in tools/in=
clude in the first place.
> > > I am still wondering how this works for the other tests.
> >
> > make headers_install puts a copy in usr/include, probably we just need
> > to include that in the include path.
>
> Naresh, could you test the patch below?
> The other custom $(CC) rules in the gcs directory are also not
> respecting $(CFLAGS), but I'll leave these for now.

I have applied this patch on top of Linux next-20250912 tag and
tested and reported build regressions got fixed.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

> diff --git a/tools/testing/selftests/arm64/gcs/Makefile b/tools/testing/s=
elftests/arm64/gcs/Makefile
> index d2f3497a9..1fbbf0ca1 100644
> --- a/tools/testing/selftests/arm64/gcs/Makefile
> +++ b/tools/testing/selftests/arm64/gcs/Makefile
> @@ -14,11 +14,11 @@ LDLIBS+=3D-lpthread
>  include ../../lib.mk
>
>  $(OUTPUT)/basic-gcs: basic-gcs.c
> -       $(CC) -g -fno-asynchronous-unwind-tables -fno-ident -s -Os -nostd=
lib \
> -               -static -include ../../../../include/nolibc/nolibc.h \
> +       $(CC) $(CFLAGS) -fno-asynchronous-unwind-tables -fno-ident -s -no=
stdlib -nostdinc \
> +               -static -I../../../../include/nolibc -include ../../../..=
/include/nolibc/nolibc.h \
>                 -I../../../../../usr/include \
>                 -std=3Dgnu99 -I../.. -g \
> -               -ffreestanding -Wall $^ -o $@ -lgcc
> +               -ffreestanding $^ -o $@ -lgcc
>
>  $(OUTPUT)/gcs-stress-thread: gcs-stress-thread.S
>         $(CC) -nostdlib $^ -o $@
>

- Naresh

