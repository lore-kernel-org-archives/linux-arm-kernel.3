Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EF8E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+XS02ndYuHh8Y6R7lznhLt5EHIcca3+r9gOHrH6w2Q=; b=gheA0+qb6ZlS0c7JId7y7M6BhU
	7P6o5w1h6FjrcRow7etFlaDZgU/7bjdYZJjkIeJ4T9nkj/qZFGDyxNA+9FptXS2kKePfNMGk/V2fT
	GrdMOC2hwXRGgIHRH1KvlaEgHEjOCo7kbS9rTIsaq0feNmQOnz3K32atnGJvA4WXlPLKAa62Tv6m/
	1gP8RTTHRKxLwwZhw4JKtD30kJg/CljwK5HgCmTVtVHaRz3zWcnCquCizcH2Xu4yf8UqjKkPtRZny
	dnYN4gcv+puOkqYweWCbVxJqdFp3Zwus5qzsXVyN/zRADI4R1NvhaSgFaOaedrVCUGoHGEec0FcKD
	QfFzF4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsil-0000000GWqS-2MbT;
	Wed, 18 Dec 2024 12:00:07 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNshf-0000000GWhy-2Rls
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 11:59:00 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5f321876499so333725eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 03:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734523138; x=1735127938; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1+XS02ndYuHh8Y6R7lznhLt5EHIcca3+r9gOHrH6w2Q=;
        b=pbqa6D7ptPVykn/KjQ15FGN0mko3kBN9bft0zTiGG//SlqCPnd3h+HsSIMJ+S7KX3d
         o5i3N4sst5N4i4e05R9QTLisZFPFMjaB5eOR1qZeeg8BdBYdInN49wUke5EMVoApmSJh
         00usBzRabj0CMr6MhLqdQd60CqshJxB3ybowEVY5HZStz3C9/cRhf67hYYGTVvsTDg2O
         ft3Uchgj7TTBmb5Dy0zPEytDhpOahj50L12nrmGJLJTR1km/gCB1Yt3cWD+o5DCgQ4dW
         GsD2mqgVfffmbtVv2LhYkQwC3XM/aA+2PElwasrHCatQDUatHDOqOs3AovDpy+fH7uNM
         foBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734523138; x=1735127938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+XS02ndYuHh8Y6R7lznhLt5EHIcca3+r9gOHrH6w2Q=;
        b=nOF6tiFnm8jM/pefdDVApF3TPy9JNTvNGnBbMzCs1GmlNOKqeongzQd4oGAdiDAzro
         zJ7lbGsWo3jC8gEpu1M/wxulupKdAE4ciTD4RH84YP0MOHlJDvYH2RlB5fPOsth+UQND
         q1Dbi7AlYGCg1Vi6rbfNCxHut5RAGTrhqUHm9OYrNg6cr1jNO0vogkxo9p3y5XF6g+K5
         koVYy72CMaV4EehFihPwYvdzD8qYbDEvr1OfRfL1cHxeR0c2TmTLjLw9tg6ER6U5l5yn
         +nGZdrenVQIYDPEd7LhNm7szPzW3KJtoTPrnI0+dTHcDf9R6nHHaYWwAFo3PRXVICvKc
         4DOg==
X-Forwarded-Encrypted: i=1; AJvYcCXx4ktTzTo5upENs8Xl7kyr2FGlm8UjeKFyri4BOSz7weRlXpQuEEB/ADE/yow51s46JsGLjlg5PNIkzfXFrdfu@lists.infradead.org
X-Gm-Message-State: AOJu0YyJA8gYviTqvqXoUvh/HxzJWynTik4BLxVkfhHOOlPTova6fC8Q
	2NFHEkCX11VdFfTu0QPvYlVSjxum0tHHaCQfaW0hdoOADaJKD/hQw7J9Qt2jmSMfqzorgKkJ/Fs
	dc4aBfO/2RzHv5nj1LI+uy87OJZtYlvjaCalIzA==
X-Gm-Gg: ASbGncthfDjRS6PZlJfTysH/ceI5IwRW17OypNpJfHFZbN+S7dhcnMTaQA9pdCJ3aFx
	4qVDo4KSlBdU14ig+P3gYhLIhMqtYOmhsRgIsNMs=
X-Google-Smtp-Source: AGHT+IHTn5PamW7QopLfPRzomInn7e/qfueiK6Mp/67924pi7x26nUbu2hSnUQW+W0L7ObbKhwdLAp9PQ0RRDehLdt0=
X-Received: by 2002:a05:6820:2287:b0:5f2:c5e0:453f with SMTP id
 006d021491bc7-5f4ca701b85mr1225321eaf.4.1734523138285; Wed, 18 Dec 2024
 03:58:58 -0800 (PST)
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org> <20241217-acpm-v4-upstream-mbox-v5-2-cd1d3951fe84@linaro.org>
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-2-cd1d3951fe84@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Dec 2024 11:58:47 +0000
Message-ID: <CADrjBPp5M8+3eX75XEVPUO_voVBHP_ZbMXP6YRJbrw0xj8ftRQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] mailbox: add Samsung Exynos driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, daniel.lezcano@linaro.org, 
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_035859_626873_68EBFDEB 
X-CRM114-Status: GOOD (  12.64  )
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

Hi Tudor,

On Tue, 17 Dec 2024 at 09:40, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> The Samsung Exynos mailbox controller has 16 flag bits for hardware
> interrupt generation and a shared register for passing mailbox messages.
> When the controller is used by the ACPM protocol the shared register is
> ignored and the mailbox controller acts as a doorbell. The controller
> just raises the interrupt to APM after the ACPM protocol has written
> the message to SRAM.
>
> Add support for the Samsung Exynos mailbox controller.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

[..]

