Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC76ECCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 07:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CR+8roHK+/LDuQ73yW6ockKv+8Mv8IDa0Xrtz7eQhq0=; b=R0041se5unrFy1yf9alAChNBS9
	pvZ7pZvndFZZRQQR6h89htGscU81y6BjbPkOV2hlNi7RjLssRxBYWt9jHwPJhAKpwoqIPZdYqA5xI
	VrMNrmrUldWlzVjqjC/k6VF22dfzf4FOV/xvwarsmMMzMYyG43Wn1xPWXhjXOKchrMOyxW9frgdQE
	ReYSckTxWFz1QP4mQlxEu8IDF8r1o/A1bMpCpB+THZpg+gtMQ51m7nBQcnil+y2ph/4RolpvracGv
	w3mJTwhylF9nnSX40XazZh/01mVRj/OpEkvJ/Fom8jyJjIBkEJozDLE3VkEt2hLhQWrbgGmED4fP2
	V5xTq/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCC6Y-00000008TGJ-3c54;
	Fri, 24 Oct 2025 07:20:54 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCC6X-00000008TFf-15PP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 07:20:54 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-591c74fd958so1942962e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761290451; x=1761895251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR+8roHK+/LDuQ73yW6ockKv+8Mv8IDa0Xrtz7eQhq0=;
        b=vWHOSUMJSlfLQH1cf6pBwKbkoEyGoQswApXFKfMFWLMoIkrNtTtgjxCJf2dD3nZK7q
         /yTkuRHI6iYCnOlOHMTNel36g6JFpHurvMY4n+C0mwDSxNmtvoixdY18LKynA4k7/rxe
         3rNc61ZnqhD/IG7cForwccjEHWTt1AVd0G1sfFIhPKyGFoltNY4+TCNgG7URSHNrYP3k
         nuBwyT2THM2bGH4IDXvHVw46rm8y49JNHkltV0BByxaWKiOmUkDU+tTkN6uVpdtbhefU
         CnSulWKu94YH7Bwz5WfgIEayARNRb7jQVHQdphSZonNTno60CEhbRTusFnVKtdzVbvSM
         X2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761290451; x=1761895251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR+8roHK+/LDuQ73yW6ockKv+8Mv8IDa0Xrtz7eQhq0=;
        b=ciY1HIMxhFej9X9uFT9XNUJAMj7dnCZ21G/ozBjIgjw+gTJdRXmS09cwV6A7yagYMd
         fDblTngXi09AfevfBXWS2wWVK0z4j09Y/MK9GJ4bBhtxrgGNn4r6ius5qrVeuvfW4mMi
         KWuEzr8aS8raBE6Ug8NoxZr3fDeDK2sGoIWTSS4T12NkA/i7iNaVYwrpJQXzT9aTeVX9
         JFlK5EoFXFtyIpADxBZdlq7aG1ylO9d/pz+UPm35cjthYcKza7SILEZNRgUKkJaoz8lj
         8uSvbezDxXfb/Am3gZbCm8QU8KDCsW7Gf7S6pzqMU3DabZsI8Jd5OJjRLd4FQ60gdiAm
         4jnw==
X-Forwarded-Encrypted: i=1; AJvYcCVWwrMVUVxdqgDdigs+XXBRMNrxeH9kE1/YKTup8xW80/BtGqLxJJSljl7PwAW1mtQqRnqXM52t+dBBWD6ntrjX@lists.infradead.org
X-Gm-Message-State: AOJu0YwhV0rXNGvf40gRUsQV3XJ52KWUEHDDxsHITQuOtJw+PLG6XOve
	3LrR1OuEQTTcngQr1pyN0QThQoOOFXV2ydZxSL0VtQBIfWuMKRRWQ7XcnmPxfy8SN+L+0c+ZruI
	yxlmZAeHdsg/Er0yiJPCRYVjwSAl+AStEFg+r/R7l4w==
X-Gm-Gg: ASbGncujDB+CvfpiAs238KHI66mVxpNEsPrXhM+f+Q5Hv5EKBY5EKDI+V8ZtrPFwGEP
	kEOBx91cfeJwdY2Ya7j4e+BqblgQvTTYnhtLefSfnDcwZKIBCb7OiClwISfIDyOYDwqkFTFVshC
	+xMgpfRtE/wdOgxyqLJmRZR2NEitb7ndR6A/vpdJoJdVkFDNJ6PDUj3qnrxliYKmh1k6Apio+qK
	EwKqdgWdlInntSmtjmLdTopGlHYGGWUhJycjxTM7uWmn9as83LLLLQTFRxTSX0XkKB4EYA0XoIQ
	hn70ZdIMcZL52wb4qLiYd3Apzg==
X-Google-Smtp-Source: AGHT+IH0zdKNAnAn0HY8zeCAL8aa1oecPklr3WTZJPyPQRrZZ9JAeaLToU97/5gWoSWPOCpiqMgKR7gX6TBItcaDYYE=
X-Received: by 2002:a05:6512:220e:b0:592:f5f9:f5a9 with SMTP id
 2adb3069b0e04-592f5f9f709mr1849794e87.36.1761290451029; Fri, 24 Oct 2025
 00:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org> <db05003c-8ac5-49da-b0ce-e0b668f49caf@linux.intel.com>
In-Reply-To: <db05003c-8ac5-49da-b0ce-e0b668f49caf@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 09:20:39 +0200
X-Gm-Features: AS18NWBFHHtshqZfLTmGnpCECipG6SuC-vURJ7Hpik3InZgpuKVx4aYTO-AzQUA
Message-ID: <CAMRc=MdWjyTyJh5zfE5qncO8ABn7QSuV1CUZXa+cSMjWoXUrNA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] gpio: improve support for shared GPIOs
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
X-CRM114-CacheID: sfid-20251024_002053_315642_B15A1E53 
X-CRM114-Status: GOOD (  18.32  )
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

On Fri, Oct 24, 2025 at 9:17=E2=80=AFAM P=C3=A9ter Ujfalusi
<peter.ujfalusi@linux.intel.com> wrote:
>
>
>
> On 22/10/2025 16:10, Bartosz Golaszewski wrote:
> > Problem statement: GPIOs are implemented as a strictly exclusive
> > resource in the kernel but there are lots of platforms on which single
> > pin is shared by multiple devices which don't communicate so need some
> > way of properly sharing access to a GPIO. What we have now is the
> > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > doesn't do any locking or arbitration of access - it literally just han=
d
> > the same GPIO descriptor to all interested users.
>
> I had few stabs on this in the past, all got somehow derailed, one
> example was:
> https://lkml.org/lkml/2019/10/30/311
>

The main issue I see with this approach is adding an actual device
node for the shared GPIO which is now not accepted in DT bindings. We
only create nodes for actual HW components. All the information is
already in the device-tree, we just need to scan it which is what I'm
trying to do here.

Bartosz

