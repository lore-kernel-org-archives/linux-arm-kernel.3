Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F302CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ui5TMnYOVOvWRbaK5ZQq5BRT+yh6rrNReDDZ55MO/g=; b=KXzkd74CxrUeXZ/yItu3tZyQdM
	IiwMRStiLnuVRsqUJZ4gI8kkopunihhxqj4Dcf33WJU1U8qLYbkWqhFb3TSFvqINszWLgtBMRUOX2
	hIHnScQ/EAm+FMTJS0Ok6OQoCQn9L7wRcUNwkjICbwbryEuzfPgivGbLsI/HPBOvFbaLcj2Yd1hLd
	C97Is9a8HQh5Dxn20jS94Ai/jgy2s3/KX0jOLWYNGyjpqpcn2OQmc51WShz96KFS07FUdZ3kfO6nJ
	//0rI0e2SEu7/+81wji2oA8/fTLOUv/waVFNWmD7BSTMqrb/x1e8E9UWd7jripsi6dQk0HDFO7k4d
	2d9StOXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlqR-00000006yib-3cM2;
	Tue, 11 Nov 2025 10:43:27 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlqP-00000006yi1-0jTm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:43:26 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-7866375e943so34194937b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 02:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857804; x=1763462604; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ui5TMnYOVOvWRbaK5ZQq5BRT+yh6rrNReDDZ55MO/g=;
        b=q/4uj2z8K1lAKh1mrDk5iPRkj3BeyFM2UksgEC9r/3znmK5j4mW9IE+qIsxZVu/a+h
         nQmkKnT0N6h8eBJ3O9OIG79Npn2+Agqu4Wu+s40Tv1jlOEjIveD5MwUdi9gAMHnxWlcY
         fkXSGIkUUFFGrfDJHJWhalInwsk2LuCplxcS5HwqSw0dL7NVffPjZwKuncWOiWVEjaKK
         /tLUHlJie/rOa7xw6AcpaRAR8oskUomm8y7SI/XyeBR9Z3a/2d+9eweOcpi6zM5sRVj+
         Jz2xdVRCT0501fVRzjMz2YDmPiCFvSKEligCHLeQVyO1YfBfrqORo1Nn2hL8JogM0IDy
         muVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857804; x=1763462604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ui5TMnYOVOvWRbaK5ZQq5BRT+yh6rrNReDDZ55MO/g=;
        b=erTdeKIdJtngBbUQjGDYXmzql2RAmAZhJXmwvH8bgMVvaA8pdbjdgrfWSesezlzHZu
         ql2l3Kb+vcezqDxAoIxXuykcbAkpIYTxwLu0Ee11uHlHlL9iP1JU9LEQN3xIc4FEJPVZ
         XFgHnFCj9pxg6aKIIejJCsuib7BAF4N9nVKb+Sbd99CDN7b87MUE2Pa7MklX4EzUB9C+
         2M0E3SMbCIhRW+FjdeBUAOq/oVM7mkk3+QoHMSSA5iPZkvmdGjVafvQw12NoN2VCUxoC
         HSTJhA418hGyJ7yGUCA2BMCV4u33D0iCDgOK2E0550MFJ3R4tcilDNdYckrdfcoGLseW
         A6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCX+9cDHIb+OpAXhIEbWy+FOsnGXwRw25+FpGANVmKbPaFgdJhC7nb1ugxyUhve5meFAzZWaZAUu+hqTbFD/j3E0@lists.infradead.org
X-Gm-Message-State: AOJu0YxCVyCQpRumt+Na9w5Rr78nupa9J3KejRVrby1LyjGjqeq0gJFM
	RC9iXLQToMjaoZ0xNqK+CSnT/Uk67TBCQ0696JCRFNMY1GHrvOZlkSsqq2D3Z8hQGzGb3v3N+k4
	uh81ShcHrddN2EUUcoemJHyq8S4zgvuwTLLLTwQL32g==
X-Gm-Gg: ASbGncszg++5gYz+7u6yKmscJVxvMCXoB/oPPNnqB/rKg5ns+qYAZ/FLdllJd93os6f
	MvwtiXVmHI70MezREqlcrk9f7vun2E/bIgW7Z7E/+jXBIUY2KLqlcez5yQQLWJFckRPeijWGgPL
	EzBStuCwRdfO378Z8NiuRRRsAKbyIq0q0a4GlPIbeqYrmTVw3P3oMrgJpZzA6Bg76qNnFJE7ncG
	d1CPKycK49GT66gyxpAUCPHbttcfotnndji6FaHVqE7ZPmv/rtoalqahYGDTmRYt1wQVNM=
X-Google-Smtp-Source: AGHT+IEzf7RfCe+CUiwe51rQWA4HYxWkXb8u+xLvSy8sgIDasS0jY0uVlkjQd1JySagC9Zi6HIYv6L+HM/XcKpRnSaA=
X-Received: by 2002:a05:690c:3341:b0:785:c08c:d39d with SMTP id
 00721157ae682-787d54504b5mr104136687b3.57.1762857803858; Tue, 11 Nov 2025
 02:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <20251029-gpio-shared-v3-4-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-4-71c568acf47c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:43:07 +0100
X-Gm-Features: AWmQ_blT5oSFL37n1q5J1-YrABo5OT0VdTa69W3o0jcai3WIlfGp5Mqx5NECKoo
Message-ID: <CACRpkdYH01pOnXs-jH5mzfT+THtHcQDoCKB02hkGaxf02nm96g@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] gpio: shared-proxy: implement the shared GPIO
 proxy driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_024325_222287_AAA7F66E 
X-CRM114-Status: GOOD (  18.29  )
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

On Wed, Oct 29, 2025 at 12:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a virtual GPIO proxy driver which arbitrates access to a single
> shared GPIO by multiple users. It works together with the core shared
> GPIO support from GPIOLIB and functions by acquiring a reference to a
> shared GPIO descriptor exposed by gpiolib-shared and making sure that
> the state of the GPIO stays consistent.
>
> In general: if there's only one user at the moment: allow it to do
> anything as if this was a normal GPIO (in essence: just propagate calls
> to the underlying real hardware driver). If there are more users: don't
> allow to change the direction set by the initial user, allow to change
> configuration options but warn about possible conflicts and finally:
> treat the output-high value as a reference counted, logical "GPIO
> enabled" setting, meaning: the GPIO value is set to high when the first
> user requests it to be high and back to low once the last user stops
> "voting" for high.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With same reasoning as for 3/10:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

