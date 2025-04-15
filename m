Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47354C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 21:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/GU520f/3jBAe24+ir+D2COnHV2dCfaPkORIPMWF9U=; b=M294z5SKl4vBcmCITuJ9b5HdA2
	bv9eZ7PTVK+VjpUkzQMDfjM8/QJW6XVlqwjM+bLBvsvReQ0PUAP23XcHAvqkQG1rGtq1ZOcmYgRsp
	IERZu+AcZGu6x1gO8EgxwG8GGS/Wj0/RfAtI75LGMgoyZ7gHFayHcv9adaQNdZ3IwC7hXDe6NAU7s
	k/Qf8ZN00EAdr4cA8sWAr9H/XusVSgRxPuQS9KiREZw//pjBrtkY+a6UqXLq+x5RvtanSFTb3o+lM
	aL9y9/IEszD0lEqEahSh8XcWRa5UNvHoIig5T9K18PTaumy1EotPWMw6lCXDZGv+HEpVDGeH7G5k9
	x/Iw7xXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4oB6-00000007ExV-3D2Q;
	Tue, 15 Apr 2025 21:50:48 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4o9G-00000007EVr-24mP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 21:48:55 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54d42884842so1510920e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 14:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744753732; x=1745358532; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/GU520f/3jBAe24+ir+D2COnHV2dCfaPkORIPMWF9U=;
        b=IPD8k/N6g/v3ha5yCyDSoHm5pb5WPLt87oMT34Wm5uhgA5O/CNtgtowy3X3JrHEybb
         2Xao50cSLVdS+1VULJxZ3t7/M2QTaOzEz87qzTeb0R+anzUyTYpQgZO9iiI1MLvr0gUc
         /5aCF+IWqet/DXDWWcV4+bDOSjizsQPjji5Ox6pgUpoqvxGVRnkLIfgIqnMlFRKB5brh
         /4qfWbYh3DEcrv5JYKeTx3C0gag3hKJMV3JsU9E2uKg9OdZWPdeoE63eQ7c9lUhIPcFS
         uRQWvcd4qKcpAmyTGfgQSWdmzKzW71l4pUVSegK+iww+Xe3+DfEAgioL+WurVTyQLCTG
         0Myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744753732; x=1745358532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/GU520f/3jBAe24+ir+D2COnHV2dCfaPkORIPMWF9U=;
        b=CbkxrPI1fPOI+EgVjNHvFx9nTonb1GxoJXJwVqFk7k/IWZzdNX/Ba6sncpuOAF1Tf6
         m4F2Bm36Q8T5U0mNQOgyHXfdHkC2nD8yLb7isNKWRMS2UMSkXxiTOb2Sd5uVY6zILWMW
         SFG0rO6GDsTPNBPT8bVSGMKbokO4TdcR69d2qcWeUbWzTb3vHy0B32MvNKoU852Is/Bg
         ZQCsVPwLn4cJH94t+NFKA6pZ3QAvrbcoRDTZfI5cSARED+p2iHVtxV1PkfGdvruDkCFO
         E2W5Cr1SWlXdwfE1c8cfE1KqFadHAwrMIvfiHYnV8bjuEZBao0QWaPjp2sMMC4tvitkO
         /plQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF/TT1RdvDo2MyIMSwdiwmKJVKuzPjtSTFYr/f4bKqH3/uNB38RbdEkKp+11qQ1YI77bzaPN1vtiwHV5kQTaQ0@lists.infradead.org
X-Gm-Message-State: AOJu0YwFZIMmyGg/mmFGZ4sat1oRZhjK3dmUE85fsTp9ogNRZ3DGCKO3
	fGTS+Xi0pID2dCuynbpb4J/cHXV0GNO2mFm5NyfR0JyNKd/BF/7EeA/hEz1dnmUtK8gnzMxwGCV
	jOfahD+0VduKp+dVODU+npoR/iLFaVjudRj3vDQ==
X-Gm-Gg: ASbGncv0hss0Mb+rq61D7VSwmHRlhl9td13r2eohwvf5tNyruIcd3aehuaonu3AA3KS
	Xe/pIXOYx+QDtgBx9DKy8GFr/PHz1dKqrXb2E3sNicyLyPLPR9W3b2sARdei7mg8R34SNiyyYZS
	uoiohpuL1ZBZXvOQfH2gUgWQ==
X-Google-Smtp-Source: AGHT+IFSu+OKLB2VNur9Dle83J6HMvG4kflsWZSu9S8S6IR4G67eFIhSB0oS7wnO/q/UzPPA34KfjLwXTtDj9Vzih0s=
X-Received: by 2002:a05:6512:1328:b0:54b:f04:59e8 with SMTP id
 2adb3069b0e04-54d60517c07mr145437e87.23.1744753732331; Tue, 15 Apr 2025
 14:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 23:48:40 +0200
X-Gm-Features: ATxdqUHvlNdtzl3Q_1xgpiYLVxVG4W9MxWXBnWdrebvCbvJB7NiLnFtisrLsjeo
Message-ID: <CACRpkdZGmHqS=Ln=YF26aCLcuJOB-Zx3AUA8sSyf+Z_LJiC2Uw@mail.gmail.com>
Subject: Re: [PATCH 00/10] pinctrl: convert GPIO chips to using new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_144854_529906_3F9EAE8C 
X-CRM114-Status: GOOD (  10.68  )
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

On Tue, Apr 8, 2025 at 9:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> the first part of pinctrl GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All patches applied for next!

Yours,
Linus Walleij

