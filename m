Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43EACCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cdWyWvVx1HiMmqJtLkBOepfaD6aK6+e9z5z1DN0zTM=; b=qSeKDH3OiyqgFsARzu3m+uRNGB
	PMzwK8BsqYEVODFlEUNX/n+OTzhKdqoX3zGyKjEN16Xaf1zTpz89ZcQNa+myJI3FC1NdMjTANg+GP
	OCP7gnhSsHRNrma/iQA3T2DfmcDOnjRpQL85VqGutr+s1+6kp8LIyOobAEBFAmHBw7twwltmaz72f
	+DqStni/A0MuEiJpWRYHvpmUBzQJpR/V9h7X/bN2XaEg7nYVTDnKWwAct4wv44GOcG7FohxN9v+HH
	+gqDDdjthNvSwstjUS9Mn5OV7jquucA+LUOYHkizsSfBmNDNATNiFDjvS4s6aFQqH3lngbeZXfnrO
	7qZHSQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlrX-00000006zBR-2T7G;
	Tue, 11 Nov 2025 10:44:35 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlrS-00000006z95-4829
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:44:34 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-63fc8c337f2so3172100d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 02:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857870; x=1763462670; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cdWyWvVx1HiMmqJtLkBOepfaD6aK6+e9z5z1DN0zTM=;
        b=maPxnaeLCGUeicscRdo/CuRjVdIA4DKTNSit47f39uIZfQ2IvkJZ9e+XKATEnULjqV
         yL1hp7RwtKsZZyEPyiXzqbgu8cNpev9GljyvHWmljtIULMnzLuPCw3wowvSwkzuvrxoD
         AQxkZq+a1thkJLvbVPpC3WacvhWo1nTOjgHmMxNo/Fz/HDv0iO0QjhafDP3rcSK0fsSO
         8wsXTfeQODjTDk0+SznLjwg5ENlmMsH5yMm/RVMjnWKe8EBVlujpa1g/6yBbC5ZP9TMC
         4GTKV+BwF2b189/jaihgfzIUIZl0thxJVwOPhUu4MfqxJD31qewU8KP2GIaBNS5hIwXL
         9xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857870; x=1763462670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cdWyWvVx1HiMmqJtLkBOepfaD6aK6+e9z5z1DN0zTM=;
        b=EJio6YCouvoFwzrSXC1QkAlgVPlR3RXfCgMP9MiZ9YDHCHl8VOvAGBn1SoiI1mimZK
         GLUhXAdXDVg6iLD6EXWh3W2nX9+MlW7Dqw18hT5MQKFdNREHuOdY+mPtK/4KCgHQozP+
         5TKp7eqquJ76nSkun3PV9TlwCjgIv9OpsdEN0wCk4EWlNcaz5B4+zRzDFOhJ25TukeL8
         iWYTaRV71Qv3Kqsor+GAHgNyEJD+gqlnK4RmCRtCCvoEfDg/St0XmPfWmtSCOd/5JFpn
         503Xyu2+p1Y/iWYE7CNwNK5wcpVunEebDa6SxewZaXYJFPJuEE1fB7/BgcGMJsMlGAny
         nhfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqcRKr/5QCYCI6h32QoSIPj3qLCADHT+IF/wITJ4TEDNqBy8QfFNaJhjwW66HCt5xbNzUi33JFOLh68EaTyE3h@lists.infradead.org
X-Gm-Message-State: AOJu0YynxmRmcWSuyhV2ZbzqmPAUUc/HiktJsgRJAsGYgv5kxEovYc3K
	BK44t1Nxg3CgNr4dKoAhrv7YV3oMRuS7T630+MrHxEvRxLbb9Ybj5wReHaqRqXtQFssRu6+rbk2
	CtrVs5eFV5bC7JO35XtHiTAkC4ZWA3oBC8i8Ni1xOuw==
X-Gm-Gg: ASbGnctCTmYay4Z1hQxCJD6uxqzfXkZvSr2qMZesx76/FlmWAVrNlw7HuxvLDCgx7Ix
	IjfbxOGRZ5TLiANyygocN4oFDNXqKVjYzjgzcwbo1XQOEZMBNwPHR/KqpIh31RMc0QtionIkVl0
	FFxFg0rF6CEQ21Zce8mretAeTqmIQqt1lc3KcO0xYqgST5Dp7Grhae0+4jY2EJvDvGOmolSEJQ0
	M/hGjansk2vVZxnphj0vHn6cjICe8Dys1o9sy+Dq0nRo0IGPGbad66gqe+5
X-Google-Smtp-Source: AGHT+IGM3E/e9Scx4gWocd3epZsySeg+GiSnUa6Lqk3ZWYP/cx+DuGwZohc+rkcKQ1+QYm8c7Jg9lh/z3+tSIbO/Q/8=
X-Received: by 2002:a05:690c:a719:b0:781:32c:b359 with SMTP id
 00721157ae682-787d541c211mr161593377b3.36.1762857869718; Tue, 11 Nov 2025
 02:44:29 -0800 (PST)
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org> <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:44:06 +0100
X-Gm-Features: AWmQ_bkCgjjs_tm6yJMft7dkXQVENEnuhOT2qvpn5ldswgUFUo9RrRQtDQDlZKU
Message-ID: <CACRpkdbqLyeaZx37yrKjDFWb=C5c=vK6aPgnW8cMQvwi_6Jiug@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] gpio: provide gpiod_is_shared()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_024432_894955_A740C614 
X-CRM114-Status: GOOD (  13.22  )
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

On Wed, Oct 22, 2025 at 3:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Provide an interface allowing consumers to check if a GPIO descriptor
> represents a GPIO that can potentially be shared by multiple consumers
> at the same time. This is exposed to allow subsystems that already
> work around the limitations of the current non-exclusive GPIO handling
> in some ways, to gradually convert to relying on the new shared GPIO
> feature of GPIOLIB.
>
> Extend the gpiolib-shared module to mark the GPIO shared proxy
> descriptors with a flag checked by the new interface.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

