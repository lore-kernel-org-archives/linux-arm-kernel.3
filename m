Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3069D5E147
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaMh04+CLb7ZuQdQwd4gSI6K1RpPGQ2X0wWmQyg4vCo=; b=MDZIRE4q7GqLU3dxX49ydIMx5W
	OHEhVrZEVRZpNPadUItkZ35I+kpRxTdSpdtbgnNpGSUxSjP7Rn9opBLxMPnTR+nYglxQbK6SrqdBX
	jqPXzmQNpPDBulcV+5fRDIOd/Edp5s9Hkr/CsQmlcB+Cji3uwYOE6zuL58BndRXlzJhXISkY3WzhF
	zCWndA2XxtJF3rkO8Ji/L6OckKr/OWRVguQI70opPIROF1UMUHE92NUrYPzhByR9JOlgEzujGrFu1
	sIZ8uRzfm6X+rUlTLlDUHZCol4ZRKAQPkMdnJX83giBQwvllcTC5+QT/XkPG8GnFmWteYJpq5eJXX
	dS9eBwPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KRt-00000009nBn-1tP0;
	Fri, 08 Nov 2024 08:34:33 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KM4-00000009lrt-3888
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:28:34 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so19923441fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 00:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054511; x=1731659311; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaMh04+CLb7ZuQdQwd4gSI6K1RpPGQ2X0wWmQyg4vCo=;
        b=LVZ+M4sR07FZL6yhmqbhjNryw0GuhkfFxMFtqikSc2vvg9U6Rmxkdm2Qio+v85YAZM
         6RiefHOcRDNxqEi9BgZ95oDoTcsBsxYpGt5gr3WGmP1nbEmKiNaDG3bYEvw7jHWnwCk0
         2bmaliiQZXHDZ0dBNZ2HUbWTm/OAw2IjgvCRKGouKG21GII/vEf2UTi4dUTzXjby2v2a
         CT9LC9C3xXah2u5inEtDwdRZbgNtWb6petIHR8y1sV88/YQk0jbTfqy7QhJrBMeTVUbN
         Tab4Z1JEUaZsz2S8GFwBrvBayxHlUoNWQc6gA1RKFCxQSCGnwrTehoZ3y6Y+fpwXTjBo
         EFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054511; x=1731659311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaMh04+CLb7ZuQdQwd4gSI6K1RpPGQ2X0wWmQyg4vCo=;
        b=NNHaDhFjy9ryn3l84Md7wLrdTxT9MRQxneQY2h7cuS/O46pE3x44MIvkBSJGaTny64
         +aYAP2Z+6CGg3jRc0O0LXUDwwDnUcu/Ugc2IVCDi28fIP7zpP5f5EBRIfKUVHG+aFzE4
         ByCtk7PyrGrztPzOd+T3Mgvm/kQjjQ0t9Z0MtlAChUnVwJbPLVKZKlYaZdMMZp3ZCiKr
         Y9HedO7pt6TWrQt3fdd0OvrzJ97dcFMGmmBmdeW81xYW7VYc2Edfde3scvA7IxnM8SYL
         +4O3TB/HuVyoGuzfSh5ALMZmfYwOk+NICDUrcsbCfuIIaBIPKIF7c+CbwYKuOhkV81Mk
         GR8A==
X-Forwarded-Encrypted: i=1; AJvYcCXHqrfvHJc47I3H10zYNl1/30+TKgSfqvPpWrgX2tafTQEmz+YdI+uunkUARytM5DXJAm103rb9DS+4zs1ubSY8@lists.infradead.org
X-Gm-Message-State: AOJu0YzcCk/dzDJaI/SDL2X+C25DiiWWfFG6osS9D3EgY90ruPD39xfI
	2Wjpf9IZE8ZVsQ0Z5diP9oYtUbHmyn90loMlKugjmPfeYPn6fQPsIIdnkmQLbuda0d5xCctrCJy
	gEMd+dQkQLAwKhFswXayGVHCtN7bE0yoigc3uNw==
X-Google-Smtp-Source: AGHT+IG+g9QB/Q7yhaX//JsVe1DFtQNOzLjrFeQ0iseJ97Cr2u/qsa6qFZ/FQqJfsYHVTCRrxZ6pRHR0v/dSmSX5cBg=
X-Received: by 2002:a2e:b8c2:0:b0:2fb:48f6:27e4 with SMTP id
 38308e7fff4ca-2ff2015261amr8351291fa.3.1731054510817; Fri, 08 Nov 2024
 00:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:28:19 +0100
Message-ID: <CACRpkdYF-_6vb3SsJ9EHh1mCbqeW5=qoYkLF7Re+XyGq36OJSg@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_002832_812053_0B8D11A2 
X-CRM114-Status: UNSURE (   9.31  )
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

On Mon, Nov 4, 2024 at 10:36=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks right to me, some testing would be even better
because I never trust these flags to get right.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

