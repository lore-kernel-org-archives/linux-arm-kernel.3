Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14667C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exuwJXp1XHrfsCfmNkVrZR7xtGP/8Zf7C6Uz7JyF9Xk=; b=VnW05ECVHLiB5WyoVULDd9PVxQ
	lcRvF0IUlqEZtqC1XCxuBSUnYnory6mwh5kn0mVu+nVBX7beWWYuc2CxBk/a2GrfgGAT7NYaOP3if
	nGb11oFljkRDSun3dUJPaVtrbJjL75boD24J5MQprkWZRBK4+m1cobEJfG3SPkOL6EHFIutq09OM8
	epYNntkhp9CVOA/UPfM/vPqWLUwFicB7sBwTcn9D3q+/8K/RV+U9crcq9xwDCQpO0EVIFtxDTC8tA
	YXhpkHqNP303n4x6w5DPOWWR4iLCdQP1xqrecc7Rm3lojMartBAjFnMwtM+D7o4uxfNB/e4RD4vtm
	acCX1U8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7MFs-00000008k5R-19Gu;
	Tue, 22 Apr 2025 22:38:16 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7MD6-00000008jdk-0TSh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:35:25 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso577827a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 15:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745361323; x=1745966123; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exuwJXp1XHrfsCfmNkVrZR7xtGP/8Zf7C6Uz7JyF9Xk=;
        b=gd/DIzLISF4SxwvmHrTFaFTbvxXo5e8yrJpflPA4y18xJ0h12qys7S1waSXrdwooWO
         41UesyA090XhCUITVAUs4L+MdcDUUY0q93qrN6jjK2GiHNXZHi20ji36/+XQLMIv96uH
         BX5MxlGaeDHByWLHgz/N9F2j1KqN5QS+cXXscWEGwKOd89xxUBR/BIX5EVPxMh8RGQvl
         cqrbeoIuFpVVJeAiF9rQF96BB8O2hvQWlGkyMkGXex3FNx6F4kSCUE5/6yDfwUENJ78A
         u9hn+dv8Aa1Spm3HuZJkvNBeC6qrgnICk9dE1X89rvjVxBETNMU2ihAm1aEgF3YCAn9E
         l2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745361323; x=1745966123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exuwJXp1XHrfsCfmNkVrZR7xtGP/8Zf7C6Uz7JyF9Xk=;
        b=VJBCTmfUko8m2gRylJyjPJoRPQWqKlDLktaS0JQu+kJ3lIEFEQTWU4uw+11E455u+T
         zTTJSuXCEIYYFUPyfAgyCsijc7nMJSHdaxVMwtM19K1CSw3Pe7Ui34GVt/R1z8zxqfxR
         FpsgS9bPIHcL2OIcHstXxgbpdEH5Aefv0hhosDxAXirWCfZMXq219//PQ7VMCg1yo1gl
         7mef6rAIrpPpxNOaD5xzccj7U0+T7w4+iekoZ41Jj3dDFQOzGQy2ejFgH2wt7/V9OL+Y
         ff9AQPwAkXckSC9YblYN8aBdumeY/mz9zbfsyQEizHmm9fbETRD5885D0o8I9n+pwemu
         EWhw==
X-Forwarded-Encrypted: i=1; AJvYcCXPnclOyTCqhiDoqSbpnkYChwd9IjhAObnGcS1HHZ15Vr/aioTkevBvTXmpoHhB/LXf3gTBLGC7iVcZJmPXL4Dx@lists.infradead.org
X-Gm-Message-State: AOJu0YzeSnQId/MCx/gvxlAuCCDFp8Y8BbcAYbEcPLJVONJ5EnZCxSns
	v+J659PM0juZPP23sL6s3zq/ihg/7K0eBIfQGz3nM9nMGG9nxV2znjxxi0um6VrdU525g56zuH8
	+Lu3cZ/ORXSDAJ3U4T5M8qYjBJRk=
X-Gm-Gg: ASbGncv81EDFewY1yGwZhLO16wTQ2LKDbmd/nG/YwX85ZHoGmheNIES2ccC3q6cp4na
	2YXHCZRQfdTkLh9Pv6HlinkhlK9PpTETSW3w2GJL7hD4foVx5QmaTN9UZiE+9GGkitxa19abJiy
	OfUsFrUztwyJ5x3BcqKKtKsFFixaBoH2rO
X-Google-Smtp-Source: AGHT+IExyhwMK/xkdBJlNnfQyIQa2Se0td5YPkj+KT2p+5TchTOdRI0q/90ny8bjCRUvSLeT6NBK++pX+31tHxqRlEk=
X-Received: by 2002:a17:907:3e10:b0:ac6:e29b:8503 with SMTP id
 a640c23a62f3a-ace3f255374mr55218866b.1.1745361322568; Tue, 22 Apr 2025
 15:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
 <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-3-3fd36475c706@baylibre.com>
In-Reply-To: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-3-3fd36475c706@baylibre.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 23 Apr 2025 01:34:46 +0300
X-Gm-Features: ATxdqUESYrpnuCfs1f0bD-yTLn32Q3cQsMUye4m7pupxP-8uO4Y3zk6hss6f4Vw
Message-ID: <CAHp75VdpaD5X+p0JSxHRoCAguZH53jfxe_WdASRuRXuS50kkNQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] iio: adc: ad4695: use IIO_DECLARE_BUFFER_WITH_TS
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
X-CRM114-CacheID: sfid-20250422_153524_152711_9385AFAA 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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
> Use IIO_DECLARE_BUFFER_WITH_TS to declare the buffer that gets used with

I would use the IIO_DECLARE_BUFFER_WITH_TS() form since it's a macro
with parameters.

> iio_push_to_buffers_with_ts(). This makes the code a bit easier to read
> and understand.

--=20
With Best Regards,
Andy Shevchenko

