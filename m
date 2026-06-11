Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5C4CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 16:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXXzo4vROWpZwVJN1pIQILOm2VIbpgsaN8smw0A/DuA=; b=Fsk+0HdR4oAvFYqVh4b5+0nO/w
	nHljNMigX1xFpYPeRn3lsMo8X6/mz7rcTYcAJAPo6dno/zETU0S+heW+dDC/f8FzCWx2Pv1PJ5/SP
	X9GO6xRNxWHhom8T+BPVqo+l4jBMTZ0h/YOtHrTfLC6hy20T7SfH40uDrH3Tgbm3iZQ0UfBH8do3t
	Hfk3p6Ggic/WifNtaGmFEPSBJQWrDqKn3BzpcEjZ7HFNNkGwufBfsObnB0FL0+6JkcCNdshb0mO9D
	rUOuWwOlBaAiiSsiyNNYahdnLg/L1NwkmaTN6KqUDVqoAc9ggW/UOiQvNpf09tj5xjAuep+kRIQNX
	wPQWgZ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhwP-00000009jZX-0Lpz;
	Thu, 11 Jun 2026 16:07:37 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhwM-00000009jZ9-3hY0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 16:07:36 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-7e2fd65f968so78834267b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 09:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781194053; cv=none;
        d=google.com; s=arc-20240605;
        b=F/EaUfNgXhr6ZAmWRgx+Bl20Ztlj2MPBR5SnRthQBESmh0LPSi/+gkOBJPiEA+Y4Z3
         yE53NbWCWYIQM8PIvDGojOtEAiAEC8C6ydLMMyGHSDo/NhDPUFyUd8uxkRBYL/04qLKw
         wjanL5aZxN3OgpkAxUbK4+MrcTZi0vPX987/sv2VrDinPt7sYL1dzfe5SCqxlN7YDv1K
         iyNkpq4zVbdW26MnCTvjpF63OYfQPsFao0dDlk91LyGQaOqDFKBjIkgS0XW5ML0OvHmW
         qjeVWUn7GdA9YNjH9F9MwqNPhRTFXQ8TJ5wb289cAdskJ1hkc28o5g9sutOsZF2DwafT
         ve8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qXXzo4vROWpZwVJN1pIQILOm2VIbpgsaN8smw0A/DuA=;
        fh=lwau0umqn609a91l/gVc9SjyJ49NtoUDK5cL+Q9cBRE=;
        b=SHRgKElXtwJRopj0wwrWIdq0vbdvpA9hzz9ShClP+hhp5olPklDHe00FBF7nLI2p/v
         1FesplreYo31RJOlv9h3D2rbmwOhJG7zo6Zi9zESMexgVbvSrHZJhi6FgH2imVmuBVl4
         N2fVCDuvsiJkQVLOvtLoklvvPdROlC2VsvhgZVsb8H+nG1lPAlHmyRcgNsD7/IFgMhgD
         Hgn1h6AqH4ANTHxi8bbzf+gjYmLVGlJkYlXmDBmsyNYd4hNl0U+ML74KAKF96sE+PSyd
         /b3mYJBL7KXkfLS2cUFBNklgyBeDc/SN6NHRmBo+SWr0uKW5dXGkTFYsQRJJHgEIt2/n
         YgLw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194053; x=1781798853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXXzo4vROWpZwVJN1pIQILOm2VIbpgsaN8smw0A/DuA=;
        b=Ep6CG7eaeoiZPEMszhISlo3hXHNOhKLiQ4kTwBEibJ1NscwLwJ3RWRwfZHERfYlDit
         EeQyI68WMO2ptSlk43CWRb/X8I/sNA605jmHk/kvHwiIwKfCZDaP65YyiT4be/n8QMoT
         bETr2rQFQtJY3n5IO94OnrtK+/DHbgHxLujqffBcjwjDkbi+5Rq509gcKBR+nwabWJl3
         iHnUCF00SxSK6odMayX3ImzHsPmGukyi4mPk1eX08BIopeui0I3DTzeSI6mb1kdzhmsO
         zDzXVjVkalr8e8uayDfYHM5XWcv5Hn3su1xptOV5uHty8d8D3zJJpOnFeqdIaa0ZQ0ve
         TaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194053; x=1781798853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qXXzo4vROWpZwVJN1pIQILOm2VIbpgsaN8smw0A/DuA=;
        b=ofkAPPdjsX67w1siuhceHq9Y0kz5s6Q1XlRsIYkL81tP6sBBNr8U/flTuy56ZkcpF3
         n8chIO1fDLjPAA6/p2DRj0kPNlfaXK5OHTdhbHv044B5Babhrv9XIS8xuyUP872/FHgj
         HNuxeCjrOxrGR8KGckXWLGovvIxJISaBBqLxUhbkHPPz7I0LFXq30YzoylS3yRLc58CE
         bCeNrw+NdJPdp+vV4aamIg/Wj+X1a/MVJZkX4iBPCBnU37EfIrLQQXAVB9zM8UJgJiRe
         HVn0XeO5/otuboiKBx5ANs4XkW+oy6dt9x2f7/A6vAG/R3iw10XJgNx0z12C5CV35aSQ
         Ht+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8hcyP/EHgErES3HiS/VccNqoecQuw3r4YrpnkLZDmHw+7PXCNUScJu1sCs760PsbbP6n/krF0PZK7T3nLHoSNV@lists.infradead.org
X-Gm-Message-State: AOJu0YysiZ8LdBevTRL+57IOw8EnrFruh0CynE7kdsz0Ozbuxe96r1VT
	vrzBmopw2y0BXfXF3Mf1yXNQV7bG8l8lKvb2xMVao5DDuy6AuBftIehVSfjx8L2EFRevUpRhJ+g
	NozkatwWTvntvqRqPio005qRGPapIVk0=
X-Gm-Gg: Acq92OEam07sqpxrcIzN6Io+tt52I0mP89JhCSDDSbwkxO7sjX843OFesnQuMTQoLCo
	pAn1j77q9ix9UlUS2p1jymGmg85U/dEGeKdCLmjMZgPV5MO3qtcecmYxT0hZwbaCt14E5N+HLac
	Lt5udv1YJXYHTHK1HFCziAYXuQ3AyZj/cWAfJIoPRHwr/ARxDg9aYMpb/iOCbPfscqw9uY4bhcZ
	xHoS91fosNnw09m+HjJmghmITLelmMs9sUkKZahRN4pykH75k1eYcK4FS4UgX5qdqn7bHVv2SGQ
	tR3d
X-Received: by 2002:a05:690c:4c09:b0:7f5:69b8:4287 with SMTP id
 00721157ae682-7f6553f7899mr38398427b3.9.1781194053316; Thu, 11 Jun 2026
 09:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260610115700.774689-1-jjy600901@snu.ac.kr>
In-Reply-To: <20260610115700.774689-1-jjy600901@snu.ac.kr>
From: Maxwell Doose <m32285159@gmail.com>
Date: Thu, 11 Jun 2026 11:07:21 -0500
X-Gm-Features: AVVi8CeHf7uwhPM76_RfCblG7fJdBhGq4QR16eMi2j2amXBgrgzWYA0X7OPgM7k
Message-ID: <CAKqfh0GVDpfP=TJZPQ2UYkUj=pe1KGn4j1zqbaz_19xawekdnw@mail.gmail.com>
Subject: Re: iio: adc: KASAN wild-memory-access in complete() on early IRQ
To: Jaeyoung Chung <jjy600901@snu.ac.kr>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sangyun Kim <sangyun.kim@snu.ac.kr>, Kyungwook Boo <bookyungwook@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_090734_945660_E663E092 
X-CRM114-Status: GOOD (  15.99  )
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

On Wed, Jun 10, 2026 at 7:04=E2=80=AFAM Jaeyoung Chung <jjy600901@snu.ac.kr=
> wrote:
>
> Hi,
>
> lpc32xx_adc_probe() in drivers/iio/adc/lpc32xx_adc.c and
> spear_adc_probe() in drivers/iio/adc/spear_adc.c register their
> interrupt handler with devm_request_irq() before they initialize
> st->completion with init_completion(). If an interrupt arrives after
> devm_request_irq() and before init_completion(), the handler calls
> complete() on an uninitialized completion, causing a kernel panic.
>
> The probe path, in lpc32xx_adc_probe():
>
>     iodev =3D devm_iio_device_alloc(&pdev->dev, sizeof(*st)); /* st kzall=
oc-zeroed */
>     ...
>     retval =3D devm_request_irq(&pdev->dev, irq, lpc32xx_adc_isr, 0,
>                               LPC32XXAD_NAME, st);           /* register =
handler */
>     ...
>     init_completion(&st->completion);                       /* initialize=
 completion */
>
> spear_adc_probe() has the same ordering: devm_request_irq() for
> spear_adc_isr() before init_completion(&st->completion).
>
> Both interrupt handlers, lpc32xx_adc_isr() and spear_adc_isr(), call
> complete():
>
>     complete(&st->completion);
>
> If the device raises an interrupt before init_completion() runs,
> complete() acquires the uninitialized wait.lock and walks the zeroed
> task_list in swake_up_locked(). The zeroed task_list makes list_empty()
> return false, so swake_up_locked() dereferences a NULL list entry,
> triggering a KASAN wild-memory-access.
>
> Suggested fix: move init_completion(&st->completion) above
> devm_request_irq(), so the completion is valid before the handler can run=
.
>
> Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
> Reported-by: Kyungwook Boo <bookyungwook@gmail.com>
>

Thanks for reporting this; I can start working on a fix shortly
(assuming nobody else is already working on it).


--
best regards,
max

