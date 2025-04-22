Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3068DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzNCI1euiML81T+O/Mxg+dH4/vZAirx+HsgT3Ub2AsQ=; b=NADX965SlE+CkPw3781bxpfMGn
	UcYpo1Md02vwz52G4LofkuhCBNTl/3KBKjEr7+iyz1NZli4CY0PiNUlmmjHQZibSRTMSnqsmLKNP2
	51ijOriwdOmEnVpWd/B9SkqKinPIcs8ImGWTYBWrrNF2ITe7j/mczIWWXU1VEb3Q1zxZo+FbS2wBu
	L9I1OFpi9BZmC03swKnAp3rFh/zCWWMhmS7mSr/cXr1ohodJQWq/pag/nVEoYyjhGELXTQSHurbCq
	hOUG6kDd7oRvVTFJKEGrJ31dSH8kiM2hsNADJIZV3HgWyi+b8ybcU307c111Vl5zeQ6JpTRNqG+T3
	aN76EzHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7MCA-00000008jWK-142O;
	Tue, 22 Apr 2025 22:34:26 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7M8m-00000008jF2-0tNg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:30:57 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5f62d3ed994so7579988a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 15:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745361054; x=1745965854; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzNCI1euiML81T+O/Mxg+dH4/vZAirx+HsgT3Ub2AsQ=;
        b=H3zTdekeBoh6HF0ob9GoXLNUDeqRmQNqS9NByq7DNBAWZAcxWWTOaVYoyKeICmCdwJ
         HzjTHo+GmAIG7WPXk5K62AfLbXdp5wSVv7KoojXTmQE7TEvaDTXS3O2GuleV5uyDBNa8
         lSYY2z1pQcYq7wi+QGkJFg1b4GH6CiAHkSgXfqHY7JGZPMUbsRzebMN24M/cAp4sIk5F
         g0UdeskqVkiHmJhKzjvnp8xtHwHrUnB+W3dUIPsrtHDR7p5yoNNT2dYloCy33o6sn/8S
         CBQBTbvj2Zjy2+dkMrcwPXZd/qDWnchXSxKcmwpu2KQlkHKvb888YG0lu0dcptYm4NHi
         lXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745361054; x=1745965854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzNCI1euiML81T+O/Mxg+dH4/vZAirx+HsgT3Ub2AsQ=;
        b=dh/c2rvutkDYWqZJHd2uLRh64uPUVs0lhGzp95N0tnQV7JsdTr6+8SLdilGACSATJK
         UeKQZc7186hHhvhMca3RQh7ELJTJJat2HhHyxZiNe0FgoISXEHjOh+9sGd120EBh8b8w
         bvFd0z17RE105ZQEMp9p8yJNQRY6wZjo1HetibWvGBSoTMHalp8Z0N27pkbJrafv5rh2
         CwArF8t2ZZPf0KVISl626z6xrVTlbGJXQZz8Y1PLy4IFMhsdQ1Nd8tNa2OVUtldat0IP
         V+wcaZf3QJqS1ERNJSV5/BxxZmIziKY+BVu9VxV7AQyAIORs0fiU4VpghXJZbi2FwG8z
         hV2A==
X-Forwarded-Encrypted: i=1; AJvYcCW8OWwVxGLizFLhwnCFEdtQ7bra8f7l/e2Ww1Y6sjdLc8Ra4r1eXYe0EbG9kZaVjxyXJAStAuCn3Nx6VtF2GgQT@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ6MAcAtMoPbCcdp/hmxmjUpAc8AUtkUBADc91BzkntNQnGJ10
	LzGNQU0lEAL6W+v9xYkNXKjFTHWiXSQN9e/vHtPct24mAfUGeypYAKEWJb+p5UrTPWrhgjRWI6+
	+g7p7gcNm9UIVtGhpTxrR0ssQptY=
X-Gm-Gg: ASbGncvfM/1L3msnRKRKOCGSdBQWBOn90IIE88VQ1MVjWqZH1t18KrX5GB3+mWHrQCx
	YKq+o8j1PRvfTvJwQDjYzHhhmUGrDFMYaM/dMW1WxaVNCgeTlzYXLg1zTmMI+w2FdHwn+1ZRPpt
	Z/x695FjJ2SHIRILDp3ovbiw==
X-Google-Smtp-Source: AGHT+IE3998SOoM5TQwHkEiv9/r4ac5IEpqWhP34QWkVmaptlSFgMZv97T7hlOYNeYrjUabrHKcmyKVktjZdI8yC4gE=
X-Received: by 2002:a17:907:3fa1:b0:ac2:c1e:dff0 with SMTP id
 a640c23a62f3a-acb74b4ccd4mr1141325966b.19.1745361053675; Tue, 22 Apr 2025
 15:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
 <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
In-Reply-To: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 23 Apr 2025 01:30:17 +0300
X-Gm-Features: ATxdqUF9L-QdkcRUaS4VEbEYroG2Kvz6r19047Y4gFd893gEmo8RVU6ynKAGZL8
Message-ID: <CAHp75VeuNhfJrNAZZwY2tEHte=UPHLOPNUz7y_J20xv2+_Zdeg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250422_153056_249123_D18D84C0 
X-CRM114-Status: GOOD (  13.63  )
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

On Wed, Apr 23, 2025 at 1:08=E2=80=AFAM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> Add new macros to help with the common case of declaring a buffer that
> is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
> to do correctly because of the alignment requirements of the timestamp.
> This will make it easier for both authors and reviewers.
>
> To avoid double __align() attributes in cases where we also need DMA
> alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS.

...

> +#define _IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
> +       type name[ALIGN((count), sizeof(s64) / sizeof(type)) + sizeof(s64=
) / sizeof(type)]

Single leading underscore seems to me not so usual, I saw people use
double underscores to make sure that it will be visible that it's an
internal one (kinda).

...

> +_Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) =3D=3D 0,

Why not static_assert() ? Because of the message? But static_assert()
supports messages AFAICS.

> +       "macros above assume that IIO_DMA_MINALIGN also ensures s64 times=
tamp alignment");

--=20
With Best Regards,
Andy Shevchenko

