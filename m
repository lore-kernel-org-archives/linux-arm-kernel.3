Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA05C83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 19:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvdW++MqUNAT9e7oRWP0qIFHszXC+6mKXAM1qsUsnHA=; b=ZgvAmcf8RNf+1rS0uLSdJFaUFy
	gvRcFh0eZSbVxGP1ho7RN9PCirB2e7/3TZ3roTMdLKlRAjurjkr8JQ/XRPWNb5YPDt80X+dCOYyXB
	Ea69a6D+gxUkuUNvEq6VLUR5FbfWgWLrJZg/4yxp+c4v8GJ1cjZmOtxTc4XMA4S9YKEIGFcvgy/lC
	BRiteH4U7TVbAkCWBOZBZdZB9sdpn7O+ZfLXt8l675qI+k47tN44GTJLGj3fml6OovmaaVdZnBbWi
	ukRQWX0Zf+WxjwhJGK3kkGiA8hACxJWrBeJXYn6FvZ8vE7+hJiwFtEEPqohMzM0LQFnziP7UwMxyr
	o1ct9+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2xH-00000009Nr1-0h27;
	Wed, 02 Jul 2025 19:17:15 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2oD-00000009MnI-37dX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 19:07:55 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-710f39f5cb9so70778367b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 12:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1751483273; x=1752088073; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvdW++MqUNAT9e7oRWP0qIFHszXC+6mKXAM1qsUsnHA=;
        b=GgPmdEgio9YTHGXXdTcn/oi8U1gzTtpSpE6I/nejEKk4MbNNMXfRhT0wCjU+/AnDRi
         7eiBahPaRx1wJDbO5j9wSrjn8o/82EVMjEwsAdnqbsx8nvBIdNk1kl5sKGjUr2GxF1ii
         UlTPkI3efr/J1Pc3WZUm9CQGPSCV8lvz4hj3J477tmUYjWWewyiKeT1qipXHqzsIUbNL
         rGkmCq1DZYsJ6Oz/ED4VDsD/WJEgtOaKaDr4E46l3FtR+8ScbhAYy4/J+bwHzciKSatk
         VfdKkvur28arfJKs/FY97B1k+KkcC7TlnI9T2Bx7EoArFTrdS2/jfaXjV8+oy5nn69fx
         nqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751483273; x=1752088073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvdW++MqUNAT9e7oRWP0qIFHszXC+6mKXAM1qsUsnHA=;
        b=pUUHyxFjrtDkFi5HuNdw/ZEpjXngzts/prjCaXqw80yiZ0Q6SDH5IOcDt6rMwRKSsM
         bK3PPsioFyvymvWbWxTXn/IbiMoRtWeyti0Uta1W3JfBJVzPeVZnofnaE9+GOcJlFW5N
         iPdKutC+K8fOr3yUXsqa6yKdtE3593M73+lqCYZsFjZl27L0RmJ88qwVRp5t850PihRo
         oSAQHwKzCaJasW7kf/Vj3A0FiW0yl16+xXDiYvH8P+MLUf89HqoKRfYrKCK8879NwxvX
         cn6neLjwY9Y4hxS7MYWbY4qa1iRAjukZhyBo/+3Vszo1/kJOOZiP5IhOnS/usD80mpzX
         Xsog==
X-Forwarded-Encrypted: i=1; AJvYcCUyZDkifQu45A8rK+a48GK/w/ZtrIDRjZWWC7zQo8mnYvHnaAHLfOIfGLuDPwHBExPMHS3yXArPv7BU5kaPH20O@lists.infradead.org
X-Gm-Message-State: AOJu0YyihV7HXNkTpBingNY7bVHoAbGR0DaHuRc3VLR6bhEo6eQyaF6j
	yLAM+WlTZihgpsjuqmKIFqa0OjR+DZWUfZZbAD1TEg3b7RsEFag7Z9oBxtRkXT7t1BhN3G9DbOM
	xD8qqJqihmXWyoyzAv8HXw1ZZM7Da4qiAESFbFtCz
X-Gm-Gg: ASbGncs4otlCr8aOVLBw6bVeHpf8lbtztEUwmbN81y2u9/XomymvEMko6tRWLk21Ix5
	K6gqRLJvwTC2qf7TaoMjuX5randnVHbfjfFI2BxeOPamcQl87zfIYKi/onrimer5zfSbqKQ0o38
	rTXrAuVRT/9O+usnARqJuVD25AsJDYJXcHuoTJDE5Ib2fbd7wrGYl9HtcqAo8CyKINwJiPIpUU9
	x2u
X-Google-Smtp-Source: AGHT+IGHElWqxIych5glg28+DrcUG1t7PUSfK4vTb3oHxY8WbSGSMjUbaCvnzu+2LABndjMybYrTqRZBHCrBQIwHt/8=
X-Received: by 2002:a05:690c:64c7:b0:715:1696:aafc with SMTP id
 00721157ae682-7165a3380f6mr3176317b3.12.1751483272654; Wed, 02 Jul 2025
 12:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
 <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
 <1j4ivued2q.fsf@starbuckisacylon.baylibre.com> <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
 <CAFBinCAkW+G9oV+SOJdac50oLezQnbc358dBgs56-RfjPd-zgA@mail.gmail.com>
In-Reply-To: <CAFBinCAkW+G9oV+SOJdac50oLezQnbc358dBgs56-RfjPd-zgA@mail.gmail.com>
From: Da Xue <da@libre.computer>
Date: Wed, 2 Jul 2025 15:07:42 -0400
X-Gm-Features: Ac12FXx0jufvdl6aujys7rH-wYZHUiDrrOxM3msmfy3FnqnGlyUndPFaQqBHPFQ
Message-ID: <CACqvRUYwwgRqid8AbLJ7bp+gTyHw2c=o-pj435Z0PDriJcnnKQ@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>, Jerome Brunet <jbrunet@baylibre.com>, 
	Anand Moon <linux.amoon@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_120753_862142_16E2F831 
X-CRM114-Status: GOOD (  19.23  )
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

On Wed, Jul 2, 2025 at 2:40=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Wed, Jul 2, 2025 at 7:22=E2=80=AFPM Da Xue <da@libre.computer> wrote:
> >
> > On Wed, Jul 2, 2025 at 1:07=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.=
com> wrote:
> > ...
> > > If, as the description suggest, the regulator framework somehow ignor=
e
> > > the timing set in DT, maybe this is what needs to be checked ?
> >
> > The regulator framework only cares about timing for regulator on.
> > Regulator off just turns off the regulator and returns without delay.
> There's an exception to this: gpio-regulators without an enable-gpios
> property. My understanding is that regulator_disable() is a no-op in
> that case (meson_mmc_set_ios() even has a comment above the
> switch/case statement), see [0].
>
> > The code makes incorrect assumptions. Then the kernel resets the board
> > without having enough time.
> Can you please name the board you're testing? I'm worried that I'll be
> looking at one .dts but you're looking at another one.

https://github.com/libre-computer-project/libretech-linux/blob/master/arch/=
arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi#L481

vcc_card is a gpio regulator that gets toggled on->off->on.

I traced the regulator framework a few weeks ago and forgot the final
regulator disable function call, but that call basically returned
immediately while the regulator-enable function complement had delays
implemented.

>
>
> Best regards,
> Martin
>
>
> [0] https://elixir.bootlin.com/linux/v6.15/source/drivers/regulator/core.=
c#L2980

