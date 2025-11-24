Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08558CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 16:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3e2+5ErfhqMPd2m9183lfzRZ3SAL+PNdFL42U93T6o=; b=HtHf4J7G4zwSnR9t2je1JTO3iF
	z70DdhHrEbPIg0NnPBltaJwX4VMLiGxENqMEBY4sBxMC+vGJ91ObYCwQFfZUNL6ItmNze6EQZkGib
	3F0acF4jBFEh5llbw0HS5CIXHj121WZbJs3bc0/7FL+NLBhZ5whBBZgA8tIaSl8mDpt1dyzMC+ecZ
	cq3xo/C+QZL9ZlbUZHbbrZamPpWdAYkW9bTQ5W2gXXfkQS3BY6mzd7h3nw6CAh8sqiJjcyo2pNRvw
	IIaElyByZMxoxi8ktHHtH+f49iduSaK12jSkpKCCsi5VfV0xc4ArDkebhDgeHcHSo97dxmVH3clJv
	GAtjHJXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZBv-0000000ByhH-1QYH;
	Mon, 24 Nov 2025 16:13:27 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZBt-0000000BygG-0724
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 16:13:26 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-640aa1445c3so6758315a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 08:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764000800; x=1764605600; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3e2+5ErfhqMPd2m9183lfzRZ3SAL+PNdFL42U93T6o=;
        b=QYLvFRKuk0rGQbuy6Ypy9RqGN9V/R2dZ7pAnzXjb8l/q1lX3yxybqgShdhDsDRvC+5
         nc+DEg5prbczAurJxyPujBTQkVxbmPr3nBbummG3wU1nV19iDCSNhUL5giJEmRfB4Owr
         MQmeqqfALcYy9JZkNQIan9g6LzwyJmB6Ta8u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764000800; x=1764605600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s3e2+5ErfhqMPd2m9183lfzRZ3SAL+PNdFL42U93T6o=;
        b=Bt1bgrp59QKcIum2oZcGcl7sM1EnFOqxJ8B5e3OecY+j6Rt6ciFvtZPz+mIKJT8dUI
         45h1VIoZdqla6TgchYSjjZidSrwfp7uzvP4cyX1sjRd2RmaPk+c27bWcv0Z8igHBicEm
         VV/uevttSZGIyfjMg/9YkJA5EE9bttvW53s7TuDwc76C4RLl1qAw5eCfI5C6z1yhqQxY
         rahusDbrhlDdmEZLZvpRGk3KjF5FiRDu368jvMPmF8HoFEKoMQSKXD9ngKKryfMBRshb
         Y0Ifq/yoMG1za6DeexZLMcKo5R5cNLG3meOlxwm++hfzCwSOMoxlc8dXpzNvLjfcxG/c
         0nQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9DyXMvg3/4x3vYZC4auy6b8Ag1SJKSGu/KGk9yDgSZrhOyzzSslXqLGy6uwhGbiwV4L0Uqu/uKOpyrYNa3sV/@lists.infradead.org
X-Gm-Message-State: AOJu0YyUUBh2u0QD4qsUS0g2PRruRzW2DNohRKNBMtIGrp4P4RfEm0YE
	Gco4FWVqd1icwDECaO02hlpIP8gvG6hLDxxwqy+MtMFifCuxrkJLht0vJgN5MP/9S+o3o0Krj2F
	WkshZZA==
X-Gm-Gg: ASbGncve0XZTth9osCdrCSLIHpMuV1nGe4STsR5PBULoI2num08SlToNKGcm3e4SFlT
	JHw9puXcdxkAoA9AxMCwBUCV/z7UqZ8WiGmLumIo4dPo012Hvs4Qd+hhiFYvYBrrQv6pkec686Q
	fcUm/DIRDwcQ21qdtkQkGj3gDcPQeJofwZOCYztNRmnksXrrY6O4IjyAVQSZznJKH25r9QEoQC9
	OBmrt/MltGc5UWLNb2+9nDzBbLVWFilhLF3kzBoHQLnlO7WD/goNhf1e+YMY+Iv0pZcY/cSDVEn
	RbA1rZd/YVj7TkClSDrfkqrb26EIwkGWwM8RlwggA9ebS5wjWTfP7HR7lHCw0QhsOnOUsEyFvf8
	JeZgCjgCR1HlBk3fRngVNvedBrzOvdxeYLGU1cFgdrGtUKyUuu4ts1mbknDibT48Fj5zJe+mWzu
	pNUwiTU6g/hBqRdjhrGxMFOl0lixvRpjjEbPqX7zvjS7edzRjfsBbW5BhrgKch
X-Google-Smtp-Source: AGHT+IE7TjH5dHyz5DtnST37pFmzTi7hsFxNkz0wZMDLp+FDJACJiRQpX9REB64oK3t57X667t5jIw==
X-Received: by 2002:a05:6402:5056:b0:645:dc31:fb9c with SMTP id 4fb4d7f45d1cf-645dc31fbb9mr1714318a12.10.1764000800400;
        Mon, 24 Nov 2025 08:13:20 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363ac8e3sm12796411a12.2.2025.11.24.08.13.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 08:13:20 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so3656426f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 08:13:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5CMNvtSlkyaUyT/a483Ygnhjeff+b+8lj8Rdx9Kv81JVO+KywAe6862HvklVp94qSA8hgOozZPdeNDMnaHct4@lists.infradead.org
X-Received: by 2002:a05:6000:2504:b0:42b:5448:7ae8 with SMTP id
 ffacd0b85a97d-42cc1d2d6fcmr12194643f8f.29.1764000799689; Mon, 24 Nov 2025
 08:13:19 -0800 (PST)
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org> <aSOKS35/huSWd/RW@duo.ucw.cz>
In-Reply-To: <aSOKS35/huSWd/RW@duo.ucw.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Nov 2025 08:13:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WVeiGa6YkRmce4McnePEV9X_n79YA0bywPdNZcZCV=ZQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnTIIDYlcAzuiT7QR2OuZm4XUUvQ7JBRQh8rXJBFJr7sqsbbpHBMlqok64
Message-ID: <CAD=FV=WVeiGa6YkRmce4McnePEV9X_n79YA0bywPdNZcZCV=ZQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: google: Introduce frankel, blazer, and mustang boards
To: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Drew Fustini <fustini@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_081325_105929_F0F8240F 
X-CRM114-Status: GOOD (  15.95  )
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

Hi,

On Sun, Nov 23, 2025 at 2:27=E2=80=AFPM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > This series adds barebones device trees for Pixel 10 (frankel), Pixel
> > 10 Pro (blazer), and Pixel 10 Pro XL (mustang). With a yet-unreleased
> > bootloader these can boot to a UART command prompt from an initramfs.
>
> Well, booting to full system with working cameras would be nicer,

For sure!


> but
> this is good start. Do you plan / do you have resources for full
> support in some reasonable timeframe?

As you can probably guess, I can't really make any promises. :-) Of
course, "full support" of Pixel 10 by an upstream kernel in a
"reasonable" timeframe could arguably be impossible no matter how many
resources were thrown at it. There are just some drivers / subsystems
where getting upstream working as well as downstream is working
doesn't feel likely as a short term goal.

That all being said, interest / support from the community helps.
Knowing that people are interested in this work helps motivate folks
at Google and (hopefully) upstream maintainers.


> Please cc phone-devel@vger with phone related patches.

I will try to remember.


> And... thanks! :-).

Of course! Hopefully many people find the work interesting / helpful.

-Doug

