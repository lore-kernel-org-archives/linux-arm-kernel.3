Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE5AC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBYyXUMBd+7KXf34imR2vb3TQVXmdkbzzqR23++a0to=; b=foQVFMtSQS8o/YzeTz7sOAe9SM
	caFCYzHyCF+XsVYvuR8fuCIZ+TylNxFTyM2VCQ4H8hnebl8waShx1kaTB48LEQ0o5HtPLI/PtqEp4
	sy1yTtuUveVpiRLwi9apIRS/ZsnHq7G5lHqnihh+0+T0l2pRoSKaeLSLAkJgdZv5UICUHuxggdFeV
	RfHp2OPvFZxpmLTW7xVOEWA48mLI5vq9w8TwlXVJC+szFMwNKmvSD4C5LM8VR+G6UnuHEoGNgYP+l
	rVpGJRTLLx15dOxDBU1UqNsT+jrMlbm4s7MJNsMHc5u+xeWmRuKV9XMVRmrX5UQRVxj7RhxgHTcGu
	12fTQK2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaICk-0000000FT5G-0Spt;
	Fri, 11 Jul 2025 18:10:38 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHmR-0000000FQpb-421J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 17:43:29 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-32f1df5703aso18567951fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 10:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752255806; x=1752860606; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBYyXUMBd+7KXf34imR2vb3TQVXmdkbzzqR23++a0to=;
        b=Z81q+WD9xYDKC8rLwAyY1FdU6bIq9brhggFHguguDV4Wvtgddorcu8sNOv1YocFbB5
         T29bkrAjmpXDGYAAayuE0Ok4SZQyNr+bNblEZorPVMGaacWPg1Mxx7X/hPiQn2B/UGMf
         29XxnxdWK5Z0RZF/kwH5ayV+Aofeo99zMsaq3LofYELMi/m/wcQ9Fl/l13jX/JL1yhM8
         NhJ4YK88B093+axVLAd27dwtXUC/jqVzZKqps8T1F0ZvW46+Ht2YL3XB/2mO5UAmtIxf
         qWFDxB+pCAbOHgOPIYGrtyKZjGiHWbbGjMJFXDUpMfjIT1gjOrG0LwCBietw3QcETObC
         oUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255806; x=1752860606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBYyXUMBd+7KXf34imR2vb3TQVXmdkbzzqR23++a0to=;
        b=r7Tpl28FC8b4f+51y7L7QfEoUc88cjoz7ptMw9d9/z5FCLbseLT0X4hjPSuhC57RBq
         QQ54bTnrzmWRLSmBw/C87xtzC3FrEo8b2DesCdzpHS6vMJY/NCNnvJfN/hbbhTfBIqkL
         oTUsByR55NvMd4IgpSSc5/pVpvRQLWdeT4dxTEMrUK59w6tBcC7B7/amyDFOjO2hPsDf
         9EAAc06XlCc3KwuZtxHuES/aF1f4qWM5bkIrAXaSVcopwswA8CRErRtK5A37fIJKQCh9
         2YTAHPGvg0yQcU2wMTCUrWAlPwGurd+RXx04yw52NQeWPGZscmxdR7M8hj+FFAXxrCBp
         vA7A==
X-Forwarded-Encrypted: i=1; AJvYcCVQmBOYuD3buBdPmkS5gw7FDWlVUEeH07t6alPewho0vBzLrOaWrYbwVQxNyf1L539l9cIMgPsT58fin9VaQFn4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz87rj2/SP30trvkOSh6IuR55gZoejwOpa3v0NK+1ndsSGvHkqF
	XY337/G7vM13L5KsyDEVIKbY6G1zdE1fwVOnbs+KYX34bRreOmqjR/wR2JOrnOfAekiXYljFuIa
	ZrVEPRzYn77tPZQpYfbe+J1XUC7idDN+9VwMgB3RKPQ==
X-Gm-Gg: ASbGnct/aRL15D0IeEzYmT59RlDvBVut2Mj7GvDeHLShJ+LOiRvveWEOWAbfc1wvEF1
	TruSoWCBAG3gxLNtwmfQH2YsUKadldoXlNEEOG9BOWbcJp+n/8wJn81K2N86PLdGGU8h9fx8VAw
	MG4HkqiOk7tPnffpJvE2IiA9MRpIzkAsF8inuSSat+9NOjoPailYMHtboyKg5iKcg3NayeNIqK9
	630+SM=
X-Google-Smtp-Source: AGHT+IFf2G+BjhVwnAaVKOD3baeNQou99YqKL5bnStqK1N6hwpimUlctewJeISypbJUHXx97EBEN1zE4x7sNQYPxkrQ=
X-Received: by 2002:a05:651c:b24:b0:32b:82bf:cc53 with SMTP id
 38308e7fff4ca-33055085f43mr14251531fa.31.1752255805688; Fri, 11 Jul 2025
 10:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com> <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
In-Reply-To: <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:43:13 +0200
X-Gm-Features: Ac12FXy8ncwT9MizP5dA-KS5LUC-_phaq4FRA0TbkNqcyhAAKnTK7Oh5Ed2WmSo
Message-ID: <CACRpkdYDTXA7+YN2zRCsQxu2AKEAwbDVq8-m27ah5XTw9iRNPw@mail.gmail.com>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_104328_018493_A10B23EB 
X-CRM114-Status: GOOD (  12.17  )
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

On Wed, Jul 9, 2025 at 5:09=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:

> This is not my area, so i will deffer to the GPIO
> Maintainers. However, it is not clear to me what get_direction()
> should return.

This callback should return the current direction as set up
in the hardware.

A major usecase is that this is called when the gpiochip is
registered to read out all the current directions of the GPIO
lines, so the kernel has a clear idea of the state of the
hardware.

Calling this should ideally result in a read of the status from
a hardware register.

Yours,
Linus Walleij

