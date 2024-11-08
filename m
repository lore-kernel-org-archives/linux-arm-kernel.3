Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53DFD5E147
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=; b=umYOeCvy9Sz+Tta92SGpJo3UWB
	y3qf4b3x3aVn2ID28QTM1gHhH3Ws8YVKNN3825qCKA0/T6BP+VwEZxh/QV56ntDFwv9eIXyEFY+Ax
	YkWIDwu7J8OdwMt2BIywmEasXBqaoADe1pNHtpcBX5wrRqwGcZKrfBYNGDROcT/3oDvuccU2u5lNY
	CM2dfSszIp5MOUvC3Y7PG7Uv2eUUUE0FrY3I3cnSJqe9zqUDfwRDOTgVHenoDZs9bKIC2tx2CM9lm
	mpDnR+s4vddv1eBwgTSjRmGYIq3uw7A6szvgE9EOjNmUwPt5shMTVy5/YhBcdTSN9UwOInTampY7S
	AAr0C8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Kfm-00000009pzY-2mfC;
	Fri, 08 Nov 2024 08:48:54 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KUe-00000009nza-1F6w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:37:25 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb49510250so18349291fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 00:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731055042; x=1731659842; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=dFE6Qkb4OHhGA2MOyCe5bxvSlDly/MYcf/0+rMormG5sJBizrQw77nja5ztfw2udeY
         uuTYoHqecfwTyvmQ3I3BBwVZ3UbOznQYNt9SuCw8MriAPlkrGkob4Pj4qfPHijKa5Llc
         93S4xMgGh5ZA+zGLXKWm/IT5ZB6CUJ76FpL8DJkNYR1c7Umif438Y8SWB1XPxsaWHWfV
         c+l3PbN+6v/Mbe8TU/iak3tq52ZfHI08PtpcSqlpB12bs9ja1JCuVdG52pL8iJ85c1t2
         h9LYevV9dIIF/Llhp817Oy7SIFGWzoKqa4hZq8vo1VYhVLXsdcp0PITSR7Lhv0o5gvxv
         w+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731055042; x=1731659842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=cBnO+GZQ8rcSlRRpQNXQU/DRcJmyGcgBrV6fGvIEncKboaz/IGaznC0MG+oCzyVk7b
         Nq2fByXG2YAoUtbZiYlcRMEVeMAs/Ptazk34fq9IzwbBbjeJsmW1721JaqLVZriq/HeF
         DTHQ2K/2CC2deHACKazdHHAc5QuTd4fGlaA0e9PTZBOu3CSrDMuuUPdGl1lB/xZNKYMg
         FvxqoOsFzNTZ2kNfOK8pR4O0s5wlXU1faEK8EQ/PprfQnlQ9OiMliAsYO27ZVLG+WqjF
         0K7fQznYA207Xu6ToXkfGpl+lR4Q/SOumEOXNXy+Up9bXiNB1itM6J50mz5WUVD/Qpj9
         CjOA==
X-Forwarded-Encrypted: i=1; AJvYcCW1eO8bCqSa3uG+luGhCa/JWxX31N5+Kiz1cBySYMHSGztU/Ho1EkEfN5xElYcCBQzMTXZ5q3DbjBHMYP61hy8A@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3hBCmqxl/lRyPQ4XQPEuJKpCyjJdyGvo3OfY2BpkYwI8Z5Ivr
	LN9aMmCZEV608bakbqcMyWH30afvcowfRFUSIPCGe47QvIx6xNVjapsDK9Pn3pvAI3AkmSS4IwN
	6eaQB+iHYhyQXzK7hz3GmMnfkgkai4zdoNOaz9w==
X-Google-Smtp-Source: AGHT+IFNMbx//cYEjFKlLreQGe6KHnDtkiSUF8TkDB0AJS6zWunIMN9dfiGm3wfKDkFfc9lg5KxffwMABzLboCKR1AQ=
X-Received: by 2002:a05:651c:881:b0:2fb:628c:2580 with SMTP id
 38308e7fff4ca-2ff201e6d03mr10547841fa.2.1731055042295; Fri, 08 Nov 2024
 00:37:22 -0800 (PST)
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:37:11 +0100
Message-ID: <CACRpkdb7gaYW3FXfqZ=E-yC6071LEiv8hnyMD4Hh=bxJ3BEdrw@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] leds: gpio: Avoid using GPIOF_ACTIVE_LOW
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
X-CRM114-CacheID: sfid-20241108_003724_355355_7F5CF8F8 
X-CRM114-Status: UNSURE (   8.97  )
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

