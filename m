Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16B110D14AF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+f86aptz6kGleDvD+k6/qwObYTMGXDubfN/1s0UBaG4=; b=yBOoCNnhFWUb/xEDdS1pndPdbG
	bnE1HgQIslwmTqHkVMW1a0ioeINAB4mDkcfEOLtqngRyjau0/eut6Ed9t4nmIdTKJp4ZCnXwtMTj4
	su0WVvSW78BPyGnMWe7ZN1c+6/hFXCXV+FBn7jvZ0YnTsNM1bW2GZEVcqhnbrN4gGr4p8n17/Spg9
	Y10o7qRj7+9N0toQPCnGqpp33kPVceNFvX2ww678RhtN1iKKUJRYATxYk7sKTR9+uEFhRKUfVHOTd
	mWrfWxdrQJO9fvlBlngiiNiBysWDlqiR/VhQmBN8U4odbsukIDl+TO1i4KgEYlwZ0MyncEK/BP/3r
	BM/izV1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Cht-0000000BM7z-06Aa;
	Mon, 30 Mar 2026 13:31:05 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Chp-0000000BM7c-3Au2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 13:31:03 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5a1443780c4so4530664e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 06:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774877459; cv=none;
        d=google.com; s=arc-20240605;
        b=TRblsp47HX3ez6Yt8RlDSGIvaAgHs/jYCEUJVus7Fd7n8O4Bu36r/cxwiaZ+uJKwfk
         bRD8f9EnU60UQAyvVQA57cBsJ5+IE8OPa1p5WtCKvLA5n0yLMye6o+wkXRPezHYb802I
         UtV8d1tB299ocBEeyNvBNgz8AUXvbyremTdZ30qYr1RgO0BgOHHxy8bmc/Ae379iRoGH
         mwXl3+HcHgii6TcrthWMgk1oYavJmKawSTURQOYI5Evnx7/QR+F5cc6570+EMOAaztEp
         58v0DqC95HASCwd/hyJ2W8lTGHrAUVd09DAQXrrt2XbuWLyyNew0Bdu+nhR7k7WS3d76
         MwBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+f86aptz6kGleDvD+k6/qwObYTMGXDubfN/1s0UBaG4=;
        fh=63iA/gC7VpXNeRHYExUAoeIsAxAuqzy9la/LIbugrY4=;
        b=BKa7kU4upeelSL5uUHlK6EmL+ZdbvfWRqA5cfp/zRIi6JUAg33Kra/6jUXZKzh0Hw4
         Sw2endc3JjavQR8O5kK9opDmjZGDIdkhMDbFeMOrr3glCFyrhLlP1DOJJWKjuUCj5qi2
         cz7JUHoYkwG+Gi2Y8spdSp2UJtBeNvhmFj0vxnDMkR2EuitZ92C4PZ8Jr99yDV4xU3mb
         uHzWg077VFgYEFGxPH/P23BWLLOwOJObY3JadQmvqSpnN8ySFW8Eg/YPCXdBpb0nnPHF
         a7ytue0jpuopzhIfN4VLAcoy2dfLLJX7Qw/HGLlaX+D4tDoZcskoGLD0OdGZ2BiSfIuE
         cZqQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774877459; x=1775482259; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+f86aptz6kGleDvD+k6/qwObYTMGXDubfN/1s0UBaG4=;
        b=f5rnA12ln/DUtKI2USzzcuzkyNm4cwSfiX2+uvM2Y/1CpD7h9WCNIjwCcIs+65fbGl
         KxGSP5QLyyejb8bw9ZDJ7z0DQHR1oiBDbxJHuufmR2G4TJBjbpIY97lob15Y5vH8jVr2
         ZOGQYuOvzSiSP+KwSKUgL11IyPAxnJ/ENls7FHLo+RfEgdoFRIFH7FCgKLy+PqRd5HAW
         2WbrgJlpC5Tgj3Mb+sG/9LMR3Ztn33QtfjhgWY0D864qZRDFIacfLrdK5jGSzyKe2Thc
         RO+JYv18+TpP+I3CqbR8/ZojHMuJmYGqQaC3J+4HO7+05ystgN+a/ZoG2CiJJK/t+qwb
         4k9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877459; x=1775482259;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+f86aptz6kGleDvD+k6/qwObYTMGXDubfN/1s0UBaG4=;
        b=iq6y0PQoOix6Tq9kfZGhr4zhtcEzRwaRADf0Up/a2XsODGbazrRt3EgFPkKhcV+ZcT
         V4kYsRtyP8itIOpS/Cg6cN4//JkSf6NsdHLEon5f01Nuc2nNFyMVeDIrkjun2g1pSHZG
         Uz6UpfTiiaH07yz6aTDP3UBa/Vm66QDnXJlWYMbWOEirfM0zO+GEATRGJvsFfxH5cnCd
         24l2C/XF7TSdz+UKmB13o0h0AOjoiIw26Y5M/un8iBId3X3YbegDbj3O95R4XJBqOFcZ
         W1tREPZSIB6RG4BLY3Uh68K159bU1zb9SIjUxEsevyiTLjqXEL9tGMYoP8Qc2UFw0Phf
         r/wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj02oZR37EuOeTBiI7Yg19EDIBHRJwVr8bfKCPdXAa4SU0ysa91emJdPC2Oc0tOdE7tK42AfAuRM8eAh8lBfVh@lists.infradead.org
X-Gm-Message-State: AOJu0YzfcKBVSn+6lwIzRddNC6xv/mllHbm1DRfGwPPIfyVr2ivuYifz
	0JTADCggYd5y6eiwgrkGVCkfR1MOdPXNjtQE50OrFG8lvgv67uGwqkTVvmVc0hvlJRB8q3simLD
	OfTAPcTdDIcBsKOaxm5VjSRogvHWljL7xhGjCuuYfmQ==
X-Gm-Gg: ATEYQzze0b0C0bVe7rBmOxoIdikEjHRYKo7wbCc06NS1ne/MgSP/JY3GkLcnFHAcbGu
	M1j0ntVXJy3reoeAkV6/XmrZ6LGQrYJb35hHRyOLN272xuqjpX6YSUfl6ou+o7gs4EprDA2niry
	U+edhIE2uNQggYxu+T9q/GOnT9JdhZCJM10WMwjmag+cx7ExmtU2v/8ec/+iONyhVReHPlgmOy9
	nwkf08Ww+rdxyGknA8t8gH8eOzGCGNSnriQKksZCknD07e/gmdDqX3YBFZpiN03RRvl9ND9LuNg
	CY+t9Pti
X-Received: by 2002:a05:6512:3c9d:b0:5a1:334a:dd62 with SMTP id
 2adb3069b0e04-5a2a507d3d1mr3968354e87.13.1774877459019; Mon, 30 Mar 2026
 06:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
 <177409907930.268981.5882592990447577348.b4-ty@b4> <CAPDyKFoz-sm0pfvn5iSYFY0mrW38vaGRZsFvrVPqsv7BsYxeWQ@mail.gmail.com>
 <1fbf5c54-8793-4585-be33-ded77019adb2@kernel.org> <CAPDyKFrK3NLwaii-9FEmyaTzUAuVkMkLL3rWBQwQvT-M+PzEHA@mail.gmail.com>
 <3bb6b71e-947b-4248-95ba-79852f743c1d@kernel.org> <CAPDyKFpOPC2stAJ262jdap-=ByY09AeQ0kj6p_9FTGJBx+Tu-Q@mail.gmail.com>
 <a417e45b-1632-4b14-9e3c-f7110db53190@kernel.org>
In-Reply-To: <a417e45b-1632-4b14-9e3c-f7110db53190@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 30 Mar 2026 15:30:22 +0200
X-Gm-Features: AQROBzA5SAYARTKyaLHNnERZZZYbnz3WOu73801Fy7BgMdtg8e2xQDHWAeoVpQw
Message-ID: <CAPDyKFomzokuF+UL8d0+Syk1FCG3jnUfy7rVr+3iC1GPZmH1UQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v8 00/10] pmdomain: samsung: add support for
 Google GS101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_063101_985431_96E1FD81 
X-CRM114-Status: GOOD (  20.63  )
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

On Mon, 30 Mar 2026 at 13:24, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/03/2026 13:12, Ulf Hansson wrote:
> >
> >>
> >>>
> >>> Although, as I said, if you think it's best to funnel them through
> >>> your tree, please do and then share them via an immutable branch, so I
> >>> can apply the pmdomain driver changes.
> >>
> >> soc must go via my tree, but there is no reason to take the pmdomain
> >> binding patch. So I did not take.
> >
> > Yes, they belong to soc/platform, which is common for most
> > power-domain providers.
>
> What does belong to soc/platform? pmdomain changes? No, they do not...

I think you may have misunderstood me here. I was referring to the DT
bindings that describe power domain providers.

Generally speaking, these are often provided via some
SOC/platform-specific hardware (like a PMU for example).

>
> >
> > To allow us to merge/maintain power-domain provider *driver* changes
> > separately, we needed a way to manage the corresponding DT bindings.
>
> Nothing stops that, there is no dependency. For a week I am saying there
> are no dependencies. If there are, please provide any sort of
> argument/proof, otherwise there is nothing to do here.
>
> > That's why I am hosting the immutable "dt" branch for these, which
> > soc/platform maintainers can pull-in when they need it.
> >
> > Of course, doing it the other way around is also possible. Just let me
> > know what you prefer.
>
> Nothing like that is necessary.

Usually we want bindings to go along with their respective drivers on
a subsystem basis.

Both patch2 and patch4 updates DT bindings for the power-domain providers.

Why shouldn't the bindings go along with the driver changes here?

Kind regards
Uffe

