Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAF1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtNg2abh49QsnTa1XSIwbO/eokylj5yxtKMHXP/aBRw=; b=eCDCRz03Ix5510Kh06d9WDq94a
	HgImxTcvfgFKYD9YDqXI9NJ2ltXQ6eNOEAq4Gf5+SmKCThC9lGpBNnPLWNXy9gHLnqu+br5Qt+SCn
	IGxkV6aaxs/Y0ogme4tMv9o7Y0hM6oApikdOEAKA6u1+s6aoMW5LsSn+g9RoGi4NdwP4BuOyP/Lew
	PQXXqIyFEEAeVsN3WPQX56Lnhgh1V2Nxxe3D17YcAKwXNau6TYFCLcFN2r3pDY9IvFmqlZrmAShj4
	mkrPlmK4kP5e5ZOfHY5zgDxAS40c2++NkwxEGH9ZhDNhoDg1bH2zH3SyMZYG0yj2Wz6030IOasstD
	9YCzzHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7MUA-00000008lKC-30hM;
	Tue, 22 Apr 2025 22:53:02 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7MSH-00000008lBj-1gp3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:51:06 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ace3b03c043so85060966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 15:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745362263; x=1745967063; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtNg2abh49QsnTa1XSIwbO/eokylj5yxtKMHXP/aBRw=;
        b=AOnyFmIs8NPG+hZw3cnqjfhKtu0LLQym8T6Y1CmwYtISM5C+xAe1YprTiII4AyvgT0
         9lQcs1n076JmRkHF56EzUeApwA1WeDaAHqMkmz24dH+tLivlSC3qJRXgAPz6RnkiWm8e
         OJLnNIv5lHdlgGRCIjBQxkM7eWNun6A/muSLCRte4OH697VFTxW+uAYPJ7Xf5DFKCeL3
         dSj/aSq/n1fl0IVZ17xeWJJX/aQZnFLREKOKsEa/iQJlIQBhqU+DNXqNpGsrGQgunSpz
         qcltFIbinzQLrYjifBf3Abw63fuhtEKAhAC5c768N/Qfq0EpwNMvyqzfymA00UaMj5cv
         Qdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745362263; x=1745967063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtNg2abh49QsnTa1XSIwbO/eokylj5yxtKMHXP/aBRw=;
        b=wN4gMriMbB1A5i9mJYgGS1j6hNuTS6OubWobe0oDQO6Fui34mIJbPmCq41ZM/QDEHm
         h6+U2hyG1zqnEAazBiyQsuBrTuG+ED+/p6sLK4QGneTK+zn0KfvVSBEUk6D0Kh54cc8Q
         kD6Vd1TZdjqH4xBAWXjgE3lxCLSYjgRhuUFQ6bSFmwc/1fOswZVJLe0f9EhZdLLtspvD
         2ZoGFQkV00SgBuxLfb0gnODkGCo8nRcKLSySRELvTcdvZD6IHyfA0Jd+TkchKFiliWr0
         EmeyhBf0tDtysCWOov/+e0BCu2BHtoRpgOcW6z/eSg5QqPHdIJDEkvujZnvOOuRPw11O
         ZJZw==
X-Forwarded-Encrypted: i=1; AJvYcCXYDeShC/RqIOdIFOXlSepPCi3A+anEe5WrtEdIfjwzQl2HRJIrpUyYA6zDbdwCTF0f/gssaQ3J8/eLzftchuta@lists.infradead.org
X-Gm-Message-State: AOJu0YwgUzCJ5Yh8Pljr34f0566UlI6zuVOc7D3vrn9jfSkVA8U2xoOk
	8oT0On1rnsQMJrjpk8amSKa9PrbubCjsvtt6mKv51xJaPep3O0aEgJmLMCr28NBCxcohunKtG54
	2icy9sflpIYKitXrXdHsGVTFo/yjivgxj
X-Gm-Gg: ASbGncsqJCit5W8K8MbuSEjO0HwFEI4frpdM39ebrs2KGgvgtUIN0HsCkLRfaXIrter
	GsCov/K4h3aamplAX5uryXBVqtc0AcGP3KDhVO99bpbTPUTBU1lL4ozKTeo49rqGPRZsCCNv/CW
	hpjzvQeC5sNUqOtCQCtPTEMg==
X-Google-Smtp-Source: AGHT+IE5r0MFZFYCu7PJn/lLZUKtD7zvLcloIWqKzgfm6B6oQoGOwioIpprZLoxLjQ81aU2yyIye6lqvTx9A4VFkpPo=
X-Received: by 2002:a17:907:7b85:b0:ace:37d6:a5ce with SMTP id
 a640c23a62f3a-ace37d6b029mr163304366b.19.1745362263600; Tue, 22 Apr 2025
 15:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
 <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
 <CAHp75VeuNhfJrNAZZwY2tEHte=UPHLOPNUz7y_J20xv2+_Zdeg@mail.gmail.com> <f0948adc-8130-4417-8c59-f0b52a7a0e01@baylibre.com>
In-Reply-To: <f0948adc-8130-4417-8c59-f0b52a7a0e01@baylibre.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 23 Apr 2025 01:50:27 +0300
X-Gm-Features: ATxdqUFWkS9PxNa71tt9rtag-1SYSUfDj-KjVRpIxd6xsGuKNSHNFIJoyiRJZ98
Message-ID: <CAHp75Vde6BOmyc1UevU9EymVVzRD29w=KzkAdaAvsUb50UsrcA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_155105_437606_F1450231 
X-CRM114-Status: GOOD (  13.37  )
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

On Wed, Apr 23, 2025 at 1:37=E2=80=AFAM David Lechner <dlechner@baylibre.co=
m> wrote:
> On 4/22/25 5:30 PM, Andy Shevchenko wrote:
> > On Wed, Apr 23, 2025 at 1:08=E2=80=AFAM David Lechner <dlechner@baylibr=
e.com> wrote:

...

> >> +_Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) =3D=3D 0,
> >
> > Why not static_assert() ? Because of the message? But static_assert()
> > supports messages AFAICS.
> >
> >> +       "macros above assume that IIO_DMA_MINALIGN also ensures s64 ti=
mestamp alignment");
>
> I just knew that was standard C. But I support BUILD_BUG_ON_MSG or static=
_assert
> would work just as well here.

In the kernel we use u8, for example, however in the standard it's
uint8_t :-) Same with many compiler attributes and wrappers on top of
the compiler things.
According to v6.14 codebase the only one driver uses _Static_assert()
for that (there are many in tools/ and more in BPF, with a few headers
where it's fine (esp. in UAPI where no static_assert() available).

--=20
With Best Regards,
Andy Shevchenko

