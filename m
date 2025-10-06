Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986F8CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAAmP6Vor3+frUWo9VM5DAgXz95oSL+3FrW7uk1ufUM=; b=ewA4gZjrxS7ktv0pH6CrK/jRJL
	fUx/eMLBN8c4pbAZU8ZC6gCalR9/uAzvjyIYdgXyx3e4zEjHmA0CMh2Ah41exkKd2PVrpg8ucJren
	89DHgtpFv88M4iyaHOVfuVYn6dbRqy8npd6QC4Gdh+V+U5eKEZyuxuRb6GF096uUOABFlJEdWVQBR
	0pJWmkKvElSRus536/Qmnmt3ZNG93dUjL/e8maePk1u2sUL2CinTrgDqthWaO3YKJBVKafb1d8lID
	6AdEiveu4E8rec91S1NIf3TZrBwjDMpS2hycCgucmEXkbKDZiksr52qlRnk5chncRvbDM2LTV6tmr
	7jp4dnEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nnv-00000000MCd-2ITv;
	Mon, 06 Oct 2025 16:11:15 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nnt-00000000MCB-0jqX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 16:11:14 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-33ca74c62acso44411681fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 09:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759767071; x=1760371871; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAAmP6Vor3+frUWo9VM5DAgXz95oSL+3FrW7uk1ufUM=;
        b=iYczpudRi57GiCMU3Q86KfXKBQ4WBMck8pajjPXxx0mWHgmMFAv1hUxt8XjjZqBxTw
         zE7JhXM9r+i7ZHCRyeF1JCmbrhs9mFLNZJ1SrTZ67b/RHVfswzeC2NkdjH6YEtW5vAAF
         pNksWKbg9Ze+DjyU2oS47LGk13EyBa8RkUyaDSnCIZQ7ZRYzeWrGSl0K8RlLHxRPvTl7
         hTBuBnGUEJO+w3V5DgjD5RL38nEtyBbXjwJY79HKdiVTgOdPHUYyXPRnGtTgeFubcRQa
         XA+stQYraGJW5eFTW053hWu2Eb3z4fuBP5QtIjJlTTbEh/yUQvaRf4jJdHF0rgpQHt6P
         CQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759767071; x=1760371871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAAmP6Vor3+frUWo9VM5DAgXz95oSL+3FrW7uk1ufUM=;
        b=lknUwtXFI7osGk9DudVjzyzQGWLy+u1rAHWdR0JTd/dem8+kPhLEOXFU+l10pgIDoa
         jpz4qnExtyMRpSJctCcG+KitXzGSnNSglTXl+7FROoWCFnUT+SZMsQtTuVhRTVHLMke2
         YEujszK4ouPXeiUubEf9Dn+oJXAubDOCntgGaFGnlZCojVmOqvDM1X87wD+SyoJq/6bM
         bUDJ+P1WJPnjmn+OdWDPmSXxXvqFSuQhyYdEQshjOBlfmXQ/fSAwvw/4DIPBcKMC3BIO
         ApcG43htED1uLDObGiPQHMvgv21Dby3pipEcChbPTyfQoysbC13DQRjKy8LXBe//S1FE
         PuSA==
X-Forwarded-Encrypted: i=1; AJvYcCVUXqn1MW4Tit2ns4ntdtXA6+bf7GftYjKS/TOE/Bw/SbAIVs3ylbgpvU3sPa/vo/J1fFL5mvoIT1k55vcpkpQC@lists.infradead.org
X-Gm-Message-State: AOJu0YwE8sCDJE7prEi3peuS+Q1sIxg1DjwaeBSAavtNwp3/ytp8ggTn
	sCONqinnuJLphtM9WfFU5LEcZqQO7ot8+R57e39JgJ2sBXekZv6HmQLLcDokSn7J9ZqctX68S2o
	Lma8DIl3f1RJJ/w8ltmR9retwIZYB8eKBcsBghKLO1w==
X-Gm-Gg: ASbGncvwVxv3Hqv5p1PR3bmhzsIsfHHJv4kEHYOhAIRnm81k+XyC/ofi4jEHTViqEbR
	WpqIGWw8njJUlnMwhbH8dPoGI/l4TkVtdXsbuCk4Dtk7Mbbo/C3wJjQwVo7j2qoGmcPVSXF1Bk1
	31c4YBHgEiQBx/FbKB9a90eL1bINTRw1uTdOAZ/kl51CNmewpywglYb6O7uWsdM5qClpO6a8i/+
	1cQSsm0I5etyOpfWQzjfzFMNqb8mmoU9xtS3sqODOxFOMNYpEnvYu7g3IKU/eI=
X-Google-Smtp-Source: AGHT+IHQni+hoN/f23d0O8IX74fUFomrJ9gkJXQ0jq6YVPXYNOJtNrLGQEvHZJ8/WlypXR2ARa7kU4bjK03qJXmCeP8=
X-Received: by 2002:a2e:bcc6:0:b0:36e:35c8:3dc4 with SMTP id
 38308e7fff4ca-374c37fc6f8mr39619951fa.21.1759767070653; Mon, 06 Oct 2025
 09:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e> <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
In-Reply-To: <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 Oct 2025 18:10:59 +0200
X-Gm-Features: AS18NWDSntYY-tS0LWjCm4WwdgxQdqQ5RgzeqJofTletfEADJXVbDbVNAU36cIY
Message-ID: <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_091113_337932_E9853C3F 
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

On Mon, Oct 6, 2025 at 5:43=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Wed, Sep 24, 2025 at 11:25:12AM -0700, Dmitry Torokhov wrote:
> > Hi Bartosz,
> >
> > >
> > > The practical use-case for this are the powerdown GPIOs shared by
> > > speakers on Qualcomm db845c platform, however I have also extensively
> > > tested it using gpio-virtuser on arm64 qemu with various DT
> > > configurations.
> >
> > How is this different from the existing gpio-backed regulator/supply?
> > IMO GPIOs are naturally exclusive-use resources (in cases when you need
> > to control them, not simply read their state), and when there is a need
> > to share them there are more appropriate abstractions that are built on
> > top of GPIOs...
> >
>
> Not always... For something like shared reset line, consumers request the=
 line
> as GPIO and expect gpiolib to do resource manangement.
>

They could use the reset API and it would implicitly create a virtual
device that requests the reset GPIO and controls its enable count.
Except that some devices also do a specific reset sequence with delays
etc. That would require some additional logic in reset-gpio.

Bart

