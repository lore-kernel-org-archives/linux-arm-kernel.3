Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2C8CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 06:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRAgifSudG0wZpugBPM8hbg3tAFsd9BARcUmc0q8uy0=; b=WXVDn9F3XRhhSiWlP+qQE+4Xxz
	7P7Jd+V9ZnLFV+FbJ3ab98/WTw4iKFf1cxxXSxaiD4OC8ADpACW9XAUAM50R5ZYq8egiU30jfzhB/
	0MKBXjVx6BBGLDXiL2cnMrMZjdKu5fpl1UDuC5uXROx0+BGEZTCydyUlUjLF2jLuL6ByM5b54jDEU
	LbCxJSSnrfpcBuNhh+/hGNt0pWqtKs5MOEOKtfuhLXyYFJk76ULKjc0jiwaANJhQuEL/raG/B/6Wo
	LO8+fUUoJHEnukVxU9ZUcF8UKi53KdKTj+1UZu4+2SB/FgupZEwZYVNaOr0dL/woRO8/A95cJWgn2
	E1d359KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3qGI-00000006njN-1kCE;
	Wed, 01 Oct 2025 06:24:26 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3qGF-00000006nif-3tYr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 06:24:25 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-57f1b88354eso7282181e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 23:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759299862; x=1759904662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRAgifSudG0wZpugBPM8hbg3tAFsd9BARcUmc0q8uy0=;
        b=ge21gnqOTkNSSuuSw7Hy5XhqlanHh1Kc7WZYyzCgU6ePFWwnE/NSnI+bi8++ojd4Ds
         wqnZCAE4WP6mbv6vtjzr1XgB97ZRZ/e0qtCp2zX/fyko6XahpaNBTKYUzbEPA32hAdPr
         6rBssbmoIXCOEgG1yAjX/rZiz2UE/kRAKKR24RePMVmBKIInElC5+x6lXiIKYlcjEK2S
         xpddLBuWG+LHX4ooczcv5sViGeqbyYcy8m22NR4kH1lvqnmMlnPKBvhNThW4tmoU4NWi
         J68WHKgH8h+4Ar2cH1Gew9eXOQOWn0oDLMSpbNJqir9qnHIKQOhOOcPe7Ak5uapjRgvT
         Ny6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759299862; x=1759904662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRAgifSudG0wZpugBPM8hbg3tAFsd9BARcUmc0q8uy0=;
        b=dFQDKpFxEFg/mWKWYy9ZOrHk6zexbbAxnebCar3it1cRD22UbXsM6smCCa58IayXEM
         qRNpt0YNY30YBjGY+2aYqD8NlRcK40CcWvWfujH13AYJf/iGAe+3YJkLrUX3e7ZF5eJ3
         vN3T7PVNfm6kFZsNckPjUpBPBWhV9lNq9vbvqILP+CsVufz6nc+qsRMwRUCaHhCc4tlo
         phQbjfwhlg9tKZkMMzso8ZSf6oTkusX01mZDzWnbjX0/uDJBmbwABlfS1Ns76Z+3rhvU
         7dQj3YbR4zLjeny8qSACh/wk1/y9RdF+eYEqm1vvHj2XbKJfT+zRsoejC1Ua/jB372qm
         uAcA==
X-Forwarded-Encrypted: i=1; AJvYcCUQQvDYgkuoc2hpktUkmESizZ0fJ8mMBrJy55jq1X7aGU4l+pmN9HimWU2DaIBF2CuBt4U17NbeupTCwqD0J6F4@lists.infradead.org
X-Gm-Message-State: AOJu0YwDRXejjYKeKKXzvu0KMASWByCd0EBT+ZS/r7I3gD12aOOQRPE9
	VZbF59dysaSVbmsTUWU5bm2gMOlcTRXOoJ47dkGBt6Sn5dFnpL2KQTaeApWQoajdgro+FLjfY4j
	56Oxr51i9r44+/ZH4wTK8GgCD97MQYWboHOYcgvcViw==
X-Gm-Gg: ASbGnct5p26+NsFwFA3GRA+3x4lqHsH5bbVz5o8H4xIeOTazjWw3oOcdjz9gVlgWUO9
	IdOAn2ciF9noE7crYs01LpK1S3VYfx5vWda4WXktwI4QDbB+fijxzv8xarcGy4mJx6u25BhIga7
	KuCk+fJ2QaOgXT4cyN4YBdL3WWPPXB2Z+tnH6Vzi7KyPasOn9ZKDbHxsTpYJ+pPmSDIYUbyQ/sq
	2/+LdIJbLGQP37LlWXFNG/rTJxv+PY=
X-Google-Smtp-Source: AGHT+IFozN4lyb6vOpauqxIZ3ZLWPP665BWKXXa2eLUpNSUCsqO967pjOJIApkPryd/vgSxP+dQ4iOCA8lbPex5gtHE=
X-Received: by 2002:a05:6512:6c9:b0:57a:1818:480f with SMTP id
 2adb3069b0e04-58af9f6e9famr596020e87.46.1759299861855; Tue, 30 Sep 2025
 23:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org> <20250917-rda8810pl-drivers-v1-3-74866def1fe3@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-3-74866def1fe3@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 08:24:10 +0200
X-Gm-Features: AS18NWB7xcfQD0XZT5zZ03zQzwmaWFrlIYwfqVvy-IagezTBvTp7mSD81HURh8c
Message-ID: <CACRpkdbhTWtu1tvGQ-nY3phUeD8+0D2TmEQQUwDXhXS5thHn1g@mail.gmail.com>
Subject: Re: [PATCH 03/25] dt-bindings: gpio: rda: Make interrupts optional
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_232423_982659_22F281CF 
X-CRM114-Status: GOOD (  10.35  )
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

On Tue, Sep 16, 2025 at 10:09=E2=80=AFPM Dang Huynh <dang.huynh@mainlining.=
org> wrote:

> The GPIO controller from the modem does not have an interrupt.
>
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>

Can you split out the GPIO patches (like the 3? of them?)
into it's own series and send them separately? They seem
to be possible to review and apply separately.

Yours,
Linus Walleij

