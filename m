Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F773C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 18:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5lk9jhdHxqhJGM2EvAiNOOlsC8BNa3794LCUzwdQio=; b=3k2o90lAcvQqm7wl8VObt4cgME
	mVU57/b4Du2ZX9z0cpi+zHgD6vtGLEitRvxm8U5q6tvzZwO5IkWy5jWXxIwyuHa3PiULxn2w7YyRZ
	G4H2dOuGcNgNkgxBgIyVOUMLCp27oKOukubPW/wK/9em2GENh1v5qikp1qGUyAthosqXLoQ/BArO4
	BL89lIppFTJcAsL6dNF3+eVKsPKdrA4rbPh3cWryTkp4Jo+QZfp62HKFNgiB81yW4QGcRQjFS0H6U
	7HtVsGOCKI/Cp3s9zSzlagUkuBuQvzlwjW8QRYbz+rVwAec/LHKkw776zcHbGx66Krr6kP58WUDB/
	vCbq1C1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzJg3-000000017BW-0Prz;
	Mon, 31 Mar 2025 18:16:03 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzJeG-0000000175M-1QsB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 18:14:13 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so5609030e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 11:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743444850; x=1744049650; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5lk9jhdHxqhJGM2EvAiNOOlsC8BNa3794LCUzwdQio=;
        b=bsVaBF2Z9YdJepoEAkwuAcXdmYoeNxxEWG+8WXdot7vi5Con/shwPRAFYBpYENvNq2
         lsXaxPL6M8dPoY0A8mirjUw9n2NfeM7WNsctPXhH0Ty8nsiSkTE8cDI1Zmztvhxntqal
         /OYfRQEeNcplu1LZ177yBgY8TNI+M+Yqd5DrJrO1qGuVqQqaUZFffVJDJp5DcwIjePnR
         QvJUQl9YxMm2v7tzvUHiwrT2MBDY+/fzs9XJXaqj30qXFqB1pggAzobsHWlwmUxriaj4
         pPFiWj9zoQjMi4t/v5Uh/OiDDlX1/MZBygN/6zXyZJKzINz3rxHmmbIKp711nDQPbsYJ
         Ox0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743444850; x=1744049650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5lk9jhdHxqhJGM2EvAiNOOlsC8BNa3794LCUzwdQio=;
        b=IOD/fbPnLPfHRgdzk1NisSmC0ll2CJu3ZsRTdtOnmAO6WNMxEqHFx9Xr8C8KUCZnaK
         QTaDHRlU9dsaOdngU2RfrviJSzYiKUj9eTPJG93Y+SQsIaBaa73hgaB6v++vq7nqDY9M
         hZiMBdxBDJ2sEiG7JBJ83C5xyG7E9uxzSQqQlcTh6lnnSrwJ/raGsymHfmx0oT1I2XlY
         w6rmIcZVWCZSjZ30CW9B4n+hm5kp9g9BEDOORmOT97JiYWCHkW6vfBMJP25tTW++XDU5
         bZxhGBWN5Rr6O8RFXB0r9ZpinGKMq1VygGcAvxQKhG0tvj0SVDkU8P57YTzypk+ozosA
         fPHg==
X-Forwarded-Encrypted: i=1; AJvYcCVJrzIan3/VZ7E0D9tdt1rxqN0Ff1/nDoplWCK9XN7MvedTSGdK894x1wHz04tqdCw13nDX2a2ZZGJflcRdJi0H@lists.infradead.org
X-Gm-Message-State: AOJu0YxI9TZeYBltBccC9bXXlhXSf8au9cNqrgVeRde6R2iqZKSa1QWX
	5I5r1FXpXxiFFM3eCzHWSlDQOwYjEwbBj088gmDsXUnOF2SqUpAY5AMJrQv1IT1XQtt3LP0Ubhb
	PaXIcD5DPML4l+uNEeYO5sDJABzs=
X-Gm-Gg: ASbGncu6DRIKr7OZXTEyIhGvI3ehHmCHH5iMLeBtGkh74CQxjhagJ5UEEmi/DzIQsik
	cEVsIExCelkivu9Y3/v59MaxukYYb4zQ0Y1dpaby5VoDk8rLt8zmchyIG3Yu0UjYx1qasnaSJmA
	1PsIYcF5Uz//RGbXmVLwLFIUfPpN0npQxfF9J6lvc+gaqB31yEQbqieXMzbqqMaxWzHOfZ
X-Google-Smtp-Source: AGHT+IHKzL9HwLPvv//AcrZpsGw9jXwcmKxRn4dqH2+JnEGKxalj4U2wocYAbP1m6LV80Fp1ly5wMt1Lp9f4JagIqw4=
X-Received: by 2002:a05:6512:31c3:b0:549:4a13:3a82 with SMTP id
 2adb3069b0e04-54b10dc6b6bmr2519774e87.21.1743444849596; Mon, 31 Mar 2025
 11:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250331103116.2223899-1-lukma@denx.de> <20250331103116.2223899-2-lukma@denx.de>
In-Reply-To: <20250331103116.2223899-2-lukma@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 31 Mar 2025 15:13:57 -0300
X-Gm-Features: AQ5f1Jq-g5W90csHkjK9HYDezlRlK94-DydnLNjU-qHoYaOMSuEvsPfN0-r6dq4
Message-ID: <CAOMZO5A4P=JbmXRyz91e3DSFbXjG7aRxMyBaTMsfB9jpVG9tww@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: net: Add MTIP L2 switch description
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_111412_378004_83F55E28 
X-CRM114-Status: UNSURE (   8.19  )
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

Hi Lukasz,

On Mon, Mar 31, 2025 at 7:31=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:

> +properties:
> +  compatible:
> +    const: nxp,imx287-mtip-switch

For consistency, please use "nxp,imx28-mtip-switch" instead.

imx287 is not used anywhere in the kernel.

