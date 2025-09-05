Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657BECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zs5lBTGy/yS1ggSU34qVv6o4t9wLKCiyHdoPZSLF9sk=; b=2rRTNd5UPmhKBfegnT3z2ecBE6
	fy7Qn4gxo7IutuhyOI6zJZyn1eCmwh77SmnNMyBTnfz88c3IlCyOirV4JjVCZWWgbtW6mQr8jKb8+
	KY3LtJFdwKgNCHfxmwg7KUn5FR0AA07kahiaYzSI6X8BROIue3hBjlCnsmZKB9RRwDcj0wzHSLxTJ
	qw832gslNloKkqh1LrW+wvwvEAT1si+Ek32h9pLXojyczAh6hiDgkpR/ObLXcdaUt1YqUrkj57/S7
	l1pB62nA/vUepiotcymFJTDL0+tvcuiwZr42WGNu82z0Wk+1Zb84sjKG7E7y4u2WcFYQXbZN28rUY
	Tr9NsmzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSqQ-00000000mAV-1jWU;
	Fri, 05 Sep 2025 09:34:58 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRbq-00000000HtS-2EFC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:15:52 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-61e266ab733so1857934eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 01:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757060149; x=1757664949; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zs5lBTGy/yS1ggSU34qVv6o4t9wLKCiyHdoPZSLF9sk=;
        b=EqpC+OQt3nNyq7H8XXTTI1LTUi3fVkSDI1DXcwIN/XvVB3tZ4WH4puniGXmOQl+XfE
         NAFY/orIllQPALKvBptO7XJSDh0oN+gLKn6CS89+2sh+Nlf3Mcl1vPZ8by1BLXRUYvR0
         kZspOWfyu1CnJR4zstop3VAdlWhXnafq+YoUV9rXURIw9KvkBRsVuqn6tYfpJn217YeU
         W/kOgwiidelVFZUwDfkAYuph8NkFzC4rKcY62qfBGgWD2uDP7DajTuIqWSbUg85Zwh9J
         qx9N/IYd5eA+OXTGOjLZm5/Cbe6eiLWN1Pxew/WPUUZDDTGiaCqA68JTLAt8MT4PJa2P
         mahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757060149; x=1757664949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zs5lBTGy/yS1ggSU34qVv6o4t9wLKCiyHdoPZSLF9sk=;
        b=ikLp6gJG62GByPXShpap9Z5II11j6DICNRSo7xP08TT2YwE89NSfHXFgsSZlf0hFbE
         +1zBiI2sM5tcAWBwoAZ8MIzoWCSxtwUvuTP52SiNXZkgWq5bd9CP5jaIujkVLCVQRCKx
         HrWPMlVBF2tgVEkU/pjwJXYPHNWQ6xovFfvdmoLscnziV+yPSUUhcCIr/9hPolzvA/CW
         9ZipNoA6rD4YkTAo9mBMB2mnYIxXBu9JnvbU5viOU/Bv/PGTLotNEMGE92+KkaBibJ7i
         2uT0rzqKIRO6i6mRVCT2x5V3jBTuUzMxutPE1XGWgPQDsatjJhIwZY6IEfr7vdvS7H1N
         NzNA==
X-Forwarded-Encrypted: i=1; AJvYcCXpvq/pgCt12MkMSvHPUQKDG94Lkgcil049NMfM4/UpQKZdtgrWct8110X+J4mo3QNXHrFDBwXXUNVC1dg/GoJT@lists.infradead.org
X-Gm-Message-State: AOJu0YzTVDYpUKabGQHAz7ngPCfWm/TU1k/pXkhQ4J9iLlowAjwkN50O
	in7l0YZWImqsISAQz5JcLAR4Fbpi65X3GCmXudShf/CFlBUl6exIViiUTzhTEy3FgCddeysiNYB
	0Sz/su2DzhYLo8DOSI/zbitw9VUa+kIMEi4XK5lVg7Q==
X-Gm-Gg: ASbGncukpWOgRvN6FqC6xPbyj6mZFmQy4UAu+beDjKEils3d2uKKdlRxIhKPVM9GD2q
	+ddOf9sR+V7J6Tj1oQcQjKoY93CoMTZQY+qE3UpnsaIUyiSXvlndpIh7JwQW8OOqgNCcFJAw6wV
	M6i5jlpjLy6o/D5t24LVs7wv5CiYqPof1E08JZANJV/QlfLSqvilVZO6RXE4GSMOuqniKUGANDs
	y7cIhg9
X-Google-Smtp-Source: AGHT+IHQj7XWIg+aHFhxE5wA0mBU6jl6RILB2uf8bPMyU1ck849cJn5VIU0gR4I4BwUtKnrjZoeB3FBwyczpBjhB1PU=
X-Received: by 2002:a05:6808:6d8d:b0:438:384b:be51 with SMTP id
 5614622812f47-439ae5b57d0mr1719731b6e.14.1757060149490; Fri, 05 Sep 2025
 01:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250904153242eucas1p12841f999bf68861f7386b0c9f3f4f60f@eucas1p1.samsung.com>
 <20250904-exynos-mct-arm32-cpuhp-regression-v1-1-5d9e4dd356ab@linaro.org> <28a9be50-2432-49b5-b10c-bf8b4f9ebd8b@samsung.com>
In-Reply-To: <28a9be50-2432-49b5-b10c-bf8b4f9ebd8b@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 5 Sep 2025 09:15:37 +0100
X-Gm-Features: Ac12FXzCRgR8yHlathKqigOEKqZV5Lvkwxo4wgJo10cx69pMLAPLfx34mAd5JLQ
Message-ID: <CADrjBPqjw82MuxctT5oxHWX7J4D0yghtO6Md8WkJHz5-6LkP3g@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: only use IRQF_PERCPU flag
 on ARM64 SoCs
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Ingo Molnar <mingo@kernel.org>, Will McVicker <willmcvicker@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	John Stultz <jstultz@google.com>, kernel-team@android.com, youngmin.nam@samsung.com, 
	hoony.yu@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_011550_610306_40F00A3C 
X-CRM114-Status: GOOD (  21.95  )
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

Hi Marek,

On Thu, 4 Sept 2025 at 18:49, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> On 04.09.2025 17:32, Peter Griffin wrote:
> > This patch addresses a regression reported in [1] whereby CPU hotplug now
> > fails on little CPUs (for reasons that aren't fully understood) for Arm
> > 32bit platforms such as Exynos 5422 used in OdroidXU3/XU4 boards.
> >
> > Note: This patch makes an assumption that the exynos_mct driver is only
> > used on Arm 32/64 bit SoCs.
> >
> > Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
> > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Closes: https://lore.kernel.org/lkml/8c861182-7e90-4bbf-ac04-173d59f5af69@samsung.com/
> > Link: https://lore.kernel.org/lkml/8c861182-7e90-4bbf-ac04-173d59f5af69@samsung.com/ [1]
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > Hi Marek & Krzysztof,
> >
> > Can you test this patch on your Exynos5422 based boards and see if it
> > resolves the issue Marek reported of CPU hot plug failing on the little
> > cores of Exynos 5422 based boards?
> >
> > Unfortunately I only have gs101 based Exynos hardware (which is Arm 64 bit
> > SoC) to test on. I can confirm CPU hotplug is functional on the little
> > cluster CPUs with IRQF_PERCPU flag on Pixel6/gs101 though.
>
> This is a duplicate of
> https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprowski@samsung.com/
>
> and yes, it fixes the reported issue.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Sorry I hadn't noticed your patch for this. Let's go with your fix
then as it seems more succinct.

Thanks,

Peter

