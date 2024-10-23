Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E339D2E02E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X36zWetOyTJAz93vBOWJ+rocrYfNGhJ7Z73gXa68vyg=; b=A+kbF/QZHsHx34cJaT2xOVhYF0
	5C4Khxoh6KpiKwsWVZ9simFR9s+5bz7aL2ga+jJ2h6UK31YsnvFaSxKBV3PtqO3MTIONJOI4+Iesk
	cmSNfboQx20RUcLdxzdfJ0PdsuKj15CeA7Seo7D974eul3IyDe+CaiBUlI7ec10YJe7Y9DEeU/9is
	EnH913aaVQe8RZ5VgR5YOuV9ARgE00THuwsq11YEY4yuM1CJfGmu9/9P2FeFqNiUhVN5RQAbTQx/E
	BSrj72+7YBg03eSD/ZtEsfqW7Ur+JvuutjDzgPYnWJT9Yd/+5JEpMMY0EkUEzYlcVJvxIE/QSy9/w
	FNYQEKug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xgx-0000000DnqW-3iRO;
	Wed, 23 Oct 2024 09:30:11 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XIy-0000000Dhks-2IkX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:05:25 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539f72c913aso7655670e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729674323; x=1730279123; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X36zWetOyTJAz93vBOWJ+rocrYfNGhJ7Z73gXa68vyg=;
        b=kIaPhaWdYdYzHqAdycgJ0yZ/5WRuD6nwZll6T6wGtX02qbqQQKouAaBjf21OEvNV31
         4NxNEW92V2W1foxa5DAOAm2A2/vDlg+hQTCLvRWRxnhbwK7zdJFC1qCk3OO9zgJLsr2D
         kXVqSix5AItIeQG7wvFnmFxJkRRnM004tEEY5yp3Un0pXUdnFnV0bdGT1nZTUHuNr6dY
         +2N0Me6hhoUsFh0Xqiag4RTCbTC9W/EN+UlIo006ZGWNgXbjvCSvuh1cO7ceCFodDQzc
         v2hjWHL3csOv89MYsuad1I9nSQAoRhoxRywTIx+JqpWhISttPY+8u6297uO1FLwNeJhg
         Xssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729674323; x=1730279123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X36zWetOyTJAz93vBOWJ+rocrYfNGhJ7Z73gXa68vyg=;
        b=vP4tCqh99GGi7PIx0PE93z9qqdUF35Qb+gSuOk5y0tcr8eBVqPProiIK0KjeZLJke4
         X32IIhVeEXedEKgfL2I86tCjwiGLrkm+2dneoEXTOjOi74y0/1U4CrbHClnPYExFdQcS
         h6ls2guM9CnVScAMz8VwC4FChp7Qb9h7/ecKfY/3ZkSqc3Gbulqyss/0jpfRcgUU4GIu
         LIKZqb/pvH9x46+i1/ixsUeHnAv1Av/j6l2TkGxzo0oolzDFKZ2XctmS8672t/GJcvkw
         PAzcsAq8gyN26upeynNFK5olGxldxjpoIGgTE4OYDfmsTyETB0us2/Beb0ZDzKXSANjZ
         oxqA==
X-Forwarded-Encrypted: i=1; AJvYcCWeQKwDT2NpdcJS3Tg0MXqPo8oidSQ1eT8H64G8Se3e+w253cJ41ZSRQExYNbRZiT6jprwZPWr6sla9E8GC1EiP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5tRmE/qON1ooSV/TqrVay0FLeBnnYOCL8QUluFxmjqalUzswW
	S5Jh1YIO+QwkGy641Z3iMJxv8eQKRO9UZcK9/jfENIOKayO+QLDjBzODkANoFODtTwpRnJcqlGf
	D0rSSh1qxrDIAVB2uP8ywrkkBgiyd+qAMutaW+w==
X-Google-Smtp-Source: AGHT+IH1+v9bDoKekaMKgbzEkbrdYTS5dXGjA0/CBdqgcdFe8CjG21FHGf37DjwlkgqMpl892dYOQgZjGQaLo7ZGFiE=
X-Received: by 2002:a05:6512:3e0a:b0:539:f37f:bed9 with SMTP id
 2adb3069b0e04-53b1a2f42ffmr857364e87.8.1729674322600; Wed, 23 Oct 2024
 02:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20241023044423.18294-1-towinchenmi@gmail.com>
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2024 11:05:10 +0200
Message-ID: <CACRpkdZP9oDd+fRKKagFtGbfLx=Rk5LJ7bvaKimw5-t25XZAfQ@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 00/20] Initial device trees for A7-A11 based
 Apple devices
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_020524_609925_1499217E 
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

On Wed, Oct 23, 2024 at 6:44=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> w=
rote:

> This series adds device trees for all A7-A11 SoC based iPhones, iPads,
> iPod touches and Apple TVs.

This is a good and important series. FWIW:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Are patches not getting applied since you resend them?

Yours,
Linus Walleij

