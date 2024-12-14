Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186FBE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 01:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGPU+ei2UNXPVjxwRtXib9gV3ppcgfLysjVG+R1rZDo=; b=CWeCi2cXSI1490n2wb6JkyMmcp
	NP0hPOKWY0UujdI0LJ0mPSotCb2m+997MM4l3as8EjzWGNMYIGDUKWHb/XnlsBNwbwjlgDb8F26U/
	Apt1yo/mUkDu+RhQPO/P8ypbqevGwlFquuxtFvfU6aLNMtRAqUcwm/3w7RgVwxgpB6dKoFJW6gaXQ
	730vlTO7KfJPZMsRB4KAnU8LYf5h/KxZmsdEpCk/7PNoph8r3iKjOkEW/q1bYfoV3QUAmpVWH/SnT
	KGMf5c62bIAPeFn2E9+0ToRxvsOsncSaYZ5b0MORjqWRhg4RxRivUVXmkAEKzQeayW/n/EW5cXbmx
	HmDvz/gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGYZ-00000005SFG-0jL8;
	Sat, 14 Dec 2024 01:02:55 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGPf-00000005QsH-3za0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 00:53:45 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3001e7d41c5so23181251fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 16:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734137619; x=1734742419; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGPU+ei2UNXPVjxwRtXib9gV3ppcgfLysjVG+R1rZDo=;
        b=HEdIYBi+4yz+Jst/cyCUnBGXNTzsWeUE9R73jAa7zpBsMqvGJN2+S34vc+WM9GaHjo
         idvBHxi0oJrjv5RoHgWj8WDObIuUvCisSoQDCAkkOwDRBVBgWOYHEMPEiDgeCV6kpUmn
         xC3GS0CNgpkO8RR22GSrMovz8KfNVn9Ea6MWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137619; x=1734742419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGPU+ei2UNXPVjxwRtXib9gV3ppcgfLysjVG+R1rZDo=;
        b=XKI3piOI43PUo8kCkqW3MVXsPW92Fd98skl0KSeleSYwuzktM5EtLmjUKLLaram0ft
         HoX4fcKqRogJfxCth2lbiPRLg6r9hbRGKL8UFXTPHhmH2xtpZ2d6oe0iWVBInMfjqZZR
         C3NNEhW9GuyhjBpRcz2YoHwOnpeYz6ZyQqbgU11bxHXLrO9CnxLH6ZZKTDNdT0KxmeDf
         kSHdxsAzDUtF9TBczJrRYcTRB9lICWG+zOkmtRBowhcbWI/GSpSkTFG8ngTnT9MwY87w
         dN8sdoHMmdLehxoCLz+cZH7X6kB2In8N++lOGud9EX9mvsIXYsizPz+pnwPydtyZm83l
         YLsA==
X-Forwarded-Encrypted: i=1; AJvYcCVGqoIWTdpKlj3RpePJASqgWOYdRgJENbl9NMJ0bcF4DOuHRGSZ3Na5ybvO9EWExx1LlQm+77W2TjUF6VBh8Xu7@lists.infradead.org
X-Gm-Message-State: AOJu0YwO7UUOZHiC4JJAW6x4IVayAaJ8IZ/dhFZoy1Q0oFT9v+8jpLEW
	ADqsp6vtTlpuZ/JRtXHCDkln/FwPk9Ryg5sXAuwCPM3moZ4SiQravl2bDE5ftGingmXZox2SMbY
	revL3
X-Gm-Gg: ASbGncsvFQnpK2P+VTT+c75UNhYjkk05uGdNnUF1pFnOiTZQ87WSM39kmxttxYbithF
	KcA0eJ9W+AQRA/waWFazOaa73ZhNqgNKlS4YRXWo9h1cpAKeX4ZYdRHvxhdCZefiYwFl5PtORBZ
	NMzO/E9T/g7i8dvGvuupHQfemwaNRCMwMmMUAf/7h+klqctFh9aVeA3Sjg8F0+pSFS7EiL/avwo
	Ssy94mLoYDsUFo1MkvxBUw98upWTBuCP+uGvl9PexvNASMVsvxySFVHEpy2QJE1AcxsdZkB226a
	DORKe0fxskTI9Zo6EHsI
X-Google-Smtp-Source: AGHT+IHjBSrsCLJNUEOkfiVYiHCYTzGUsLY/h79HKTjBUBt6EgvWKNCpcRfTY+H/hbNpIfsKcLM12w==
X-Received: by 2002:a05:6512:4011:b0:540:1fec:f321 with SMTP id 2adb3069b0e04-54090595594mr1569839e87.41.1734137619440;
        Fri, 13 Dec 2024 16:53:39 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9b7asm65452e87.75.2024.12.13.16.53.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 16:53:37 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e3778bffdso2480408e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 16:53:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXjK9YtNj+712YFebFZaSoowVcBlXXjNyfp+vA1ai5kL307Lefd3zKiL7FjJBD/7jJmCJs1EGAJRcAHFPsbogvY@lists.infradead.org
X-Received: by 2002:a05:6512:3b90:b0:53e:3a73:d367 with SMTP id
 2adb3069b0e04-5409055de77mr1099342e87.25.1734137617142; Fri, 13 Dec 2024
 16:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid> <l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq>
In-Reply-To: <l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Dec 2024 16:53:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQf+ig21u316WvQh0DoKsdKAmZgqPn5LB-myDXsJtXig@mail.gmail.com>
X-Gm-Features: AbW1kvYMP3ofEliinmKmD5c4JW-mKQ4nNcdLo-yjvAZoISWzi-Wl91dy2zD3Sw4
Message-ID: <CAD=FV=WQf+ig21u316WvQh0DoKsdKAmZgqPn5LB-myDXsJtXig@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the spectre_bhb_k24_list
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Julius Werner <jwerner@chromium.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Roxana Bradescu <roxabee@google.com>, 
	bjorn.andersson@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_165343_989439_1D43D994 
X-CRM114-Status: GOOD (  17.26  )
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

On Mon, Dec 9, 2024 at 3:07=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Dec 09, 2024 at 09:43:15AM -0800, Douglas Anderson wrote:
> > Qualcomm Kryo 500-series Gold cores appear to have a derivative of an
> > ARM Cortex A77 in them. Since A77 needs Spectre mitigation then the
> > Kyro 500-series Gold cores also should need Spectre mitigation.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Yes. I know. This patch DOESN'T COMPILE because
> > MIDR_QCOM_KRYO_5XX_GOLD is not defined. That value needs to come from
> > Qualcomm or from testing on hardware, which I don't have. Qualcomm
> > needs to chime in to confirm that this Spectre mitigation is correct
> > anyway, though. I'm including this patch so it's obvious that I think
> > these cores also need the mitigation.
>
> Kryo 5xx (SM8250) identify themselves as 0x41/0xd0d (Gold, Prime) and
> 0x51/0x805 (Silver)

Interesting. So the Gold/Prime are actually IDing themselves as
straight Cortex A77. The Silver is IDing itself the same as
KRYO_4XX_SILVER. ...so in that sense there's nothing to do here for
those cores.


-Doug

