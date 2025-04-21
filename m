Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0865C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1I3cbwltjOGElOuVsLVlgvPqjddyD9qAtM+fs2VWpA=; b=SrqvucAaAaNd3GFIgl/0lobLGk
	dDX6SrV1H1LpWrBBTTYiwZHbNsntknJ4Kd5ki45IjkyFnW3SGnGyteGV4qUX/uUDTV4zhRSzVpHos
	PYMZB+wsumQ8X9VFvfi30jJo1vewMYYVyk+eRiyF7Hif5lUNe4k1bsDE5t8pFjj35vnYakvo/u6lH
	Z7cIpGrXNPAh5UNwlk/IYVK1nX85/EjcKLAqmSHas04YtedZmEVEcTiT8KvDszPwaKL8ojflevlge
	HcDY/GHe2ke00o+ERhxV64LgeHvQ462H7jFPf7ieQxuaniURxEjcVT5HtJ2Q6j7sT1eQOJGthuq7n
	ipLRXdiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uFr-00000004kJL-12sY;
	Mon, 21 Apr 2025 16:44:23 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uDx-00000004jbo-3TNz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 16:42:26 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac2963dc379so615488366b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 09:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253743; x=1745858543; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1I3cbwltjOGElOuVsLVlgvPqjddyD9qAtM+fs2VWpA=;
        b=RfCu6FbjZeFtUk5AvMcKb4NpsaDGpIgO8DBUQak9kTphm2x6Cm+e5NRsPCsOXxAJv8
         CYCLOLhCOvvHxY3nNu/HI0FldXIIYrLr4i3zwHzF9oHFTSbW6W/fb3CtxxQ6qoLdhWyq
         F1FeySx4VJT6fUXZc9Z96iCoF4UoNi75BHOnH5RnsZ6D0BI/q+k1RQWqE05zguk+UqDV
         MgE4bPgBWm/ROL+r8x+hFo0SM3qMcs5Pa87PXLeym4DqntC4yjQKJdytHtpXg3PntMq0
         9CdCdsODd13od93pHONbgXu9DaeT8PZvNKoxLyXRkCBPnLHODR5axkKL35BwLmSqMV+L
         h9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253743; x=1745858543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1I3cbwltjOGElOuVsLVlgvPqjddyD9qAtM+fs2VWpA=;
        b=gvn3lXmKGG9utP7v4JsyUzoa0wID+dxoMii7fnEWAci7w87LFW1Vy8iHENsxF1EJOg
         Bzl9c65eAp2XS0CbkqdxA39b4r05ah2O6/79s4UI3g+FW78/16tQG63ZgnYWGvIIjkzk
         8eUdTkJck6mRyOXUg32bd8P942KoFV05fTNGEbCHO8GYucNKgl1/59UGm5O3NghFtB01
         Ql6Cj0ITox7wc39fx83oxlOYG6TohxO91YUN79S7Vz1XppfM9hv4TZ3SF4SyqGkcn6uf
         gUqqM6WbqCQso8FzpnM2C82Z1yuZDL6bf7Av4C0UJE/hZ9980TPtcgjDtIQIMXrBYkcK
         sMMg==
X-Forwarded-Encrypted: i=1; AJvYcCWdqZ6eAQjd7/MVapecbvYirt//5glKAQ0sprqLqe613SzTaXz6Y3ySgp0ZP0lIUVvxsLYw4FVdnEAPf/8/1dEP@lists.infradead.org
X-Gm-Message-State: AOJu0YwjebF+MVvfI/CG8afi3uRcXc0fOoUvrNw3M/UCrJimAevKbJn9
	4fCHFMhbDrTcu/nMZ/BX8Dm0nyTbTfJYjC6kEGDYcXRyPhTm5PFpZhG+RvM8kGZ44UDZajVVcOd
	GRfgArB1zYF05HAQj/sQq3HLK204=
X-Gm-Gg: ASbGnctTraSvIyyXeQKawL0q7r6wSAVp9T5kTCmsq9miiZ+UH+bFSnTaQS5KArnVUfE
	ku/FgcXteG25l7o8n0WZvZFmsU247sGGSd0o75aA4VunbjnbClCkyDzAC+Br07J1LGsLKg1RwXt
	zNyrgm+5A+RP2Z6qJQs67x6w==
X-Google-Smtp-Source: AGHT+IGOkY/7PisAD2oLp8QqIo0O9LumO+tYusSVEov8PZqxdtzgsegmull0yalfq2NuFZ5JO7zCd3FO9FZrDniI0y8=
X-Received: by 2002:a17:907:1b1f:b0:ac1:f19a:c0a0 with SMTP id
 a640c23a62f3a-acb74b1ca7cmr1191466066b.20.1745253743466; Mon, 21 Apr 2025
 09:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
 <20250418-iio-prefer-aligned_s64-timestamp-v1-4-4c6080710516@baylibre.com> <20250421121341.49e28ddf@jic23-huawei>
In-Reply-To: <20250421121341.49e28ddf@jic23-huawei>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 21 Apr 2025 19:41:46 +0300
X-Gm-Features: ATxdqUH5lMC16PsOqzsa5gclyWSAtg59GNIHcNrRLuTnmqVLHUh5EH6DsroQl_c
Message-ID: <CAHp75VcAHZV4zGMvR-xVuVhhBJMCmo7A0w0fnwASw3iAWU5wdw@mail.gmail.com>
Subject: Re: [PATCH 04/10] iio: adc: mxs-lradc-adc: use struct with
 aligned_s64 timestamp
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_094225_864290_C1008908 
X-CRM114-Status: UNSURE (   8.95  )
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

On Mon, Apr 21, 2025 at 2:13=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
> On Fri, 18 Apr 2025 14:58:23 -0500
> David Lechner <dlechner@baylibre.com> wrote:

...

> > +             aligned_u64 ts;
> aligned_s64
>
> I've not idea why timestamps are signed, but they always have been!

Because 0 (center point) was chosen as 1970-01-01?

--=20
With Best Regards,
Andy Shevchenko

