Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD71C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 09:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSPG/29HLPpTquYEWU6PYBjygo8k+R9iRTUXFr14dhg=; b=PHrG6QdBxLLsYvkXmRlIMt2aXp
	hk+s2yVSL7/mvEUAHoFoeduBHKI12JKht+K70biMMTCUtfOyFEYlmM/6KIO/e//9mmKCGeb+CCdqZ
	Wv9Ot6m4kr1q6nOodgxVWQ7DkyXDP2y0d65zRFtoridLVqmvMmQiGdThNxJ0mrLbXAPtrWrQQlNbp
	MK7Gq2mNoKhqrc9jPWvXqH+maavr83HyB7IMGBaBS6WG8w0gQqgbAxKcshMeDDyozkOwOO+THC6Zo
	4rYNZH+mIhH+S+lNhVbAe0wBUj1rwAFLwdkgy6CK9YnO83hrrwwNr2TXISt6ZVfl/fsMG9nqhQIOR
	61hrw9ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulORj-00000006y0K-0vxQ;
	Mon, 11 Aug 2025 09:03:59 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOC6-00000006trN-2n5V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 08:47:51 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3322fef6d72so33101081fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754902068; x=1755506868; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSPG/29HLPpTquYEWU6PYBjygo8k+R9iRTUXFr14dhg=;
        b=TiwusL73Ab+W9s39XB0PcYw/rGboF0+7LcI0CB7VtTFvq0fMGHgS25lFXmzbxB1OmL
         wLZ1Z3pa1LujLAFqKklk8cjFmHzh1utIQTAMmxDsXfLBgP5SKHn4Bg0MLgFuXBEREw8D
         SJNOENHpbNtfx3lCc8bIwE5tREZOBPFmNRtvp45Oi+UMmN9SJ78IQ9xZAWkZT6QAHkJ9
         FJ4LosNRKZENdLVucrw/nCzW9BWq+oV9j8vbT6mexe4mJbNRiVYlQSddwAwTXJIa1w04
         L5f41ph42d7vmmmlGk9D7wiYj5xi+SFITDlqqYLbRjz+F/kAaZTR795+TH41S0mMr4uP
         mpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754902068; x=1755506868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSPG/29HLPpTquYEWU6PYBjygo8k+R9iRTUXFr14dhg=;
        b=SJLQeF7RNIysm5zivyFyQbQy4FuBLHLK8lHj181B7Xlw7Yw7k5+ZfY+ff+qCDSTyFb
         8wWpJMaKnuoV7ueS6z5mSir+9I+wqxrAy5L2F3Dby4spEAgJMp4ke+PkmMXEshSUvXIh
         gkS54dI/BgzR8q9+C4ZayX5FqmlFFX7hWwHEun0edhoFfVzGh2rLZExSNNQ9K9IRS5Bs
         h5Se65xYY5hBxCZnUv4uiK7+EAySwb9OA0Fsr5mrN1M69GXpeo5MFsECLp76FhpjG9+Q
         v4UHnW4WaO0tyklC3WbDaDUYF+R8jrfxwFlnNZ9VRD2/bZ6c3N27tZSxiop/dtD5Fze+
         UhAA==
X-Forwarded-Encrypted: i=1; AJvYcCVa92S2GpVtoAP4fmx00sbKyPcqAMWBZDtp9b3Zg1bdQMWIEX7alxv4W6gSYkqfI9XH5f5IeP7iLYUKhW+AZ0ca@lists.infradead.org
X-Gm-Message-State: AOJu0YzREA35ITfowbd105d97aXbh6vSv33Vu0DcWXl2mO/3FW7ih3Zl
	n0pcBJIrAXV5Tr89kuupMQWQOwlzpMO4Mmzgyuc5JoimT4l8dhzA80mgqmvcuHDP2MWhnjPgcJb
	Wvh/YyqPqgD4AMh6MrfuleNvGgpj5Bw8OFnlB5P6jgQ==
X-Gm-Gg: ASbGncsxX2rpLuR2Ae84aM3sPyaMUlSk+ekKXHOfh8ZuLOKDYKwjcSPL5cqTu4V84l5
	1G1u4vQcYJSBdJLFBqFf9oUC3nRCDuMXd0u9qgk96+BBVNK7iK75BaXBoJGI2hafkV0T77z4ccM
	6jPFK70F8U8fMzWQubzCY83R0dIJdv0gVQhy6n64P69hfHEK4+UfRpPpKUdM0KeW21lPik2yRSy
	kUfBRRNITXMzMITxiC3IkOufxE1wvxVnrKD5cE=
X-Google-Smtp-Source: AGHT+IHQZ+Li30LXuVPBZfJzPpG13D46HKjbN25jcZH83z5JqqyWQ0KsRoIqrZmp1XcJkfaY59nLPEzi39QNSDtz0OE=
X-Received: by 2002:a2e:a581:0:b0:332:612b:6f49 with SMTP id
 38308e7fff4ca-333a221c4dfmr38476321fa.29.1754902068345; Mon, 11 Aug 2025
 01:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250730071443.8758-1-brgl@bgdev.pl> <7ff48289-f738-420e-ac69-de544833725b@kernel.org>
In-Reply-To: <7ff48289-f738-420e-ac69-de544833725b@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 10:47:37 +0200
X-Gm-Features: Ac12FXyVM43pAwwdhH2UZx7AIEJGJLKbhJiBmr-EDd8zuJ-4n2CsNR4nFxP1rYs
Message-ID: <CAMRc=MfYdHa_3=2Vv8Memv9_GUKTD7Z9U-aYGHqk4z=3eVoh3g@mail.gmail.com>
Subject: Re: [PATCH] ARM: s3c/gpio: complete the conversion to new GPIO value setters
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_014750_812201_A69B0C55 
X-CRM114-Status: GOOD (  19.15  )
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

On Mon, Aug 11, 2025 at 10:46=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 30/07/2025 09:14, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Commit fb52f3226cab ("ARM: s3c/gpio: use new line value setter
> > callbacks") correctly changed the assignment of the callback but missed
> > the check one liner higher. Change it now too to using the recommended
> > callback as the legacy one is going away soon.
> >
> > Fixes: fb52f3226cab ("ARM: s3c/gpio: use new line value setter callback=
s")
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > Autobuilders pointed out only now that I missed the other line that
> > needs changing in my previous patch. I'd like to still queue this for
> > v6.17. Either through the SoC tree if it's not too late or through the
> > GPIO tree together with my second PR for this merge window. Please
> > kindly ack it.
>
> This does not apply for current RC, so on top of v6.17-rc1.
>
> Best regards,
> Krzysztof

This is no longer needed with v6.17-rc1. The callbacks have been
renamed back globally to the original names.

Bart

