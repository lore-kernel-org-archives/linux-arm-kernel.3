Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCEDC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkNK4V4s8P1105G9M2GaM/bKTLtt9JfO/Y81L6C+ekY=; b=q+stGXvdrZr2JFky1DxfgKCbRk
	w0Z3kPlI1AC9rDWGPZtyKuhXQiO5zkIf7VdwZFXfqJFIOkw6Jngasmk9kJmk/rSoCt3gD/dRRqmKQ
	hwcGsL9/VbE49kA9+RHol9aeD4qCnt3icGIxplLieC0q7Vz9R+Rbn/ahOQcIEJEBmdLRpsiEugQoR
	TmwzRWECX2NV3WBUTjuViaDnp4Egp1EMx47pGivZCJHEvkB444GFEQ5gl2kxxrPBDpNIYzhBT/0no
	AlKjblSJtlIeDZO7qQCP6uq9hS+PoVd2apavfNQIty31YeVkiaeeB5urcAQV4TGCgBLMqt8BVmOw9
	fmv8HgIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJSK-00000002zuh-00nx;
	Fri, 09 May 2025 08:51:44 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIjU-00000002rPU-0rn5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 08:05:25 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54e98f73850so2004490e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746777922; x=1747382722; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkNK4V4s8P1105G9M2GaM/bKTLtt9JfO/Y81L6C+ekY=;
        b=WkEHpBJLB1vsb0iMb0e9HMBOMx7HxMipSb2PY0xrmuxKuG7Rx7nx4YvU85ifPhPrkV
         NBcznwPGuBF41CxRg0/4niXzjv8vhDgTnWYnaHYDo4swKyomafTSdgut884qqzdmhyPP
         veaL8tbVw4juiHLxOrF50t8ISKPNLKO8U+BiM40V/IwL+jYgEwJ8hmHHopsgcEBpq/vS
         l9YZLkXBaS9W2kdmMQRo+iCXAwBuOlMj/2jSc7BHQaKkvS3i7SJNA3UfVRhmmCR9/HmL
         ZwmCwrcTtU8VeqtrTOhbF6gNngM/xvEUnSvMk+XRbVQsAdEZMzIxMqDKp+4PP78oREi8
         TNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746777922; x=1747382722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkNK4V4s8P1105G9M2GaM/bKTLtt9JfO/Y81L6C+ekY=;
        b=s9mMH+qyiOWUaRk8Dvr/Q24rED8v4vaz91W4OT4W/n7J9hU1d+GkBOQmbuOkkwoYgN
         STyRRvVYGm+rX+mHnpsChB0yz1P7T1O5HjyAfHu9ZXe4NlQxuPrPExQHKbSTb3RuPXjn
         H6u7EvI29s+Dc08CgwzbnO/hpaZ/VAeXdD+KrzFHmoeb6ezEWwObHo531EInT0HSZ7AD
         lcOB/5HdZ7XX167loN7ccIM58V2MAFk4zMa+lvry4sdWoLHQC7atf3uu8mbpMrCH7cOp
         IyUVueCZ/0ZG8awzu8rNXsSBLqpaei+8by3krG+SZF4kOpZogMMRO3tSxQW1njFqTFNH
         MelQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAnJu3exaXydai/NuP7EfilOR3wh5ujDb50e1gkewtbhuAoxjNy5qZgp1arjQo8VuiWP6qT8YYhsumM40/ENr2@lists.infradead.org
X-Gm-Message-State: AOJu0YzSuKhSU5xRbojVb7K2B8pVE0200qnscNgxfPr8UUiQYFRWFHOq
	nkOQ+O/aySfglBAZd3s08GBgOYCFDuiCxBCGTHIoSUi6LDddeQXzLt0JvyBd5MsrcF18LLupR4S
	vc8BvsRTq/OddsBePKHhqtcF+8bvqWJlfs0XMEA==
X-Gm-Gg: ASbGncs64DUaVsf7VUVKVZ/oe+8l4TPeFiLEIbAR05TtpmUqSBJpOOCi8eSpIgPU1Jf
	97zJzu5GKhcYyuKfKfuBqGs28giiXUOhEWT1mLKoa1liZ8FoE4EK/PVlpyDfZ/iEHhxfhR3eVki
	xFrPROfn9x8uwGtQtJqDS9ow==
X-Google-Smtp-Source: AGHT+IHygTOWySTUQ1JX00eO97lqc6HJQVUyB58fvB2NipEYZeQL68WbWlijYDIMb2+wa1Msnq90mTMLlhAfQvVGkBw=
X-Received: by 2002:a05:6512:6802:b0:54c:a49:d3f4 with SMTP id
 2adb3069b0e04-54fc67602f6mr649569e87.0.1746777921621; Fri, 09 May 2025
 01:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 May 2025 10:05:10 +0200
X-Gm-Features: ATxdqUHooQ8Ld9mj2dz6cfM7sdUGr8k9BsEqfTdMAuQ6XUXjp9g6npbLz8jBOxY
Message-ID: <CACRpkdat91GuhtkYw8mzzt2fgufktWCy4fnA5Dkos2=pWfWftw@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: mediatek: convert GPIO chips to using new
 value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_010524_247614_8AB4F8EF 
X-CRM114-Status: GOOD (  11.21  )
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

On Fri, Apr 25, 2025 at 11:01=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the mediatek pinctrl GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All 5 patches applied!

Yours,
Linus Walleij

