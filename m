Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE9BC47BDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 10:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04OixR81Eo2/0PoYjn7l6e+QVGFigG8111KV8jI1AXI=; b=E5M3zd4atHkV54QrEUsMgBj1T/
	SATdvc8J3Xx/jD45+ZJE6SUcLXuDaqkWNaKClbXMhZtT8+vashzBzGrCgIb2C4zWzVpKOoLQBLHKY
	k0q9FtFV7DMJPmO9qpIfU2PncVp6kq+hf+icnMEXQvR7f+ydxl8FokWj2A0zI9xtE2WOpqcbGs1/e
	nUMQ88fD5d+4S9L4saTG0lArRK1Y4sUmnL/ZKIHAqwXMODwMFyg3aJ0rc4dAOD6TJbHkYWwYJaO0D
	lrI9He8qmx07ddtKG4rlu1l8fMiqhG8vzQvYiVtLcjpUFEW+au+9SJvu5AkC5DxvKJcT2sWicnIPt
	W9KRCAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4Ua-0000000CoaY-1PfF;
	Tue, 06 Jan 2026 10:40:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4UY-0000000CoZr-0JeT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 10:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03ED46014D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 10:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B208CC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 10:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767696044;
	bh=t4ddXhA7JhrJytwJ6SG59Nok1jm7v4ErHkDUWq3UJj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mSieI+pFor5cLkViqqo0XupaQknJKW4qXwhxNKsnkhZBXp0cZu8oWKcIyXbTMMSMk
	 gwGxE0lWhvaYyl3XQ2fhPHVXLbTvOER30qdGQHHdh+iMU6JsL+GxtwgzfovULoc99F
	 mXbWKynoFgcnB6G2pamlI14uuRo2at3NV73Lay6ERyiIqCocu687OMS37AGr0X1kLg
	 Rd7aDSUBKEM6yFr0ceS/+75FpdrSVc6SLSGo84a3Ni38ciQVYaUWclKrEPBkvMx/MY
	 lNrATBByqJQhebSfhOKinJ2eZz02PGnlKXrmJJAPvRdst4qc+lptjsHXsSh99WRVNb
	 /8V3vfzwc31oA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59b67388c9cso515990e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 02:40:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXji5uHig9cKQ3eYYEPBr2086Ysqj1C5HD/c3vouXbTz7wOY0V3r3IgfiBAAD+fTgGjyBWnIwz3vpIExGBQ6l+c@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhq8Qj98SuCBk2dxLAZoV8ed3EjIMJOC18YvpgEt96LRFTVPCr
	Rh/YhW5T+wilWWBG+QAJb9wV8o0uBF+HIXQlqLDc5ZIT1dR/PrIbpQN202IXaJSKS054BSXlhY1
	zuXKItjplOexGEVTGjS5UIXgsZYzCyZqWLWV+DdXzIQ==
X-Google-Smtp-Source: AGHT+IGjEVOXW8CYG+0OH4S7sVxLtDmjVtqmU3wU1q5QsPBg5CO1iHEaU9Sc0XqZ9TEkG2QTbcPfX+ONV8l5hR9iWrc=
X-Received: by 2002:a05:6512:3d18:b0:594:27dd:2700 with SMTP id
 2adb3069b0e04-59b652e62e7mr943934e87.47.1767696043393; Tue, 06 Jan 2026
 02:40:43 -0800 (PST)
MIME-Version: 1.0
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
 <10d5df9b-842c-45d3-8821-d4ca0c364e97@linaro.org> <7dc8a830-5863-412c-bcf3-498f47b35615@amlogic.com>
In-Reply-To: <7dc8a830-5863-412c-bcf3-498f47b35615@amlogic.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 6 Jan 2026 11:40:30 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me+mgRZ4thXnYFUv42hQBV36hM5DUckM8U_VQa8chNehw@mail.gmail.com>
X-Gm-Features: AQt7F2r1rD5CkKYlWA8KJJCMMCqY-jVpyYiin_uV38wrHGuoHuGV7M0VqD8OJdI
Message-ID: <CAMRc=Me+mgRZ4thXnYFUv42hQBV36hM5DUckM8U_VQa8chNehw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jan 6, 2026 at 10:32=E2=80=AFAM Xianwei Zhao <xianwei.zhao@amlogic.=
com> wrote:
>
> Hi Bartosz,
>     Could you explain the reproduction method for this problem ?
>

Please don't top-post on the mailing list.

If you have a pin shared by multiple devices in device-tree, it will
now go through a dedicated gpio-shared-proxy driver. It will use a
locking mechanism depending on the can_sleep flag of the GPIO
controller device - spinlock or mutex. If the flag is wrong - like is
the case here - it may happen that we take a spinlock and then descend
into pinctrl where a mutex is taken resulting in a lockdep splat.

Bart

