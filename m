Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DD6CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjEUaWPd/Jj2ElIhymJE8eOmk6i+S46mwSJsA8AQ+EQ=; b=IZrOeO0LCMIOkux6bU+qRP/UYQ
	ZVtoS8wA1CvSlARVRCafICstGIxjHuN5z9cKuF6i9TI0FPFplVtgTQ7vVdrgIupcjFCYf/qTeeowS
	zp1WvuR5yKTd5fN9U978ih+k3VMhCPnyHQTokDxD3gvw/LyqlFqYxz1kC+mF/BHEwwWaL6kbM+cjU
	EtCNZA80WDTCnKs1GkVOJUl8Qy/cFRzJh8YtOu32yv5B6/Lyd1Jduk6E8KKL1KA66r1W3ONGRFVHL
	T0fD42l3WUVBJvRlLIMACIiPJZmCFK+lyoecalodvSxFRTcbsIwNAx5JWqBrbd2gLF6Mhenlt9EyJ
	Nxr1eQhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmP5-0000000CdSZ-10Bz;
	Mon, 20 Oct 2025 09:42:11 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmP2-0000000CdRA-2U9n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:42:09 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59054fc6a45so4666113e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 02:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760953326; x=1761558126; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjEUaWPd/Jj2ElIhymJE8eOmk6i+S46mwSJsA8AQ+EQ=;
        b=I7p7619ALOB2k1ohc4LaEnI2oXSEIyPozb6vJykdf46RkHW0aViAA+F1Y9Oi2sFqe3
         Sasv/UFlg/AqHcB0mD2eqZ1YZAwakbju8ABPLjmLPmSui5LrXsxs3RCdIOyItVEU+RNG
         rjbRuZcXFbHiLnbh8G1g6756gDw6RhHkUVBAzmbN3hu5UC2BH/yhASBuROYCHwSi19Yb
         75AUGpIO0MRObHZcGnaEtcFIwZ3lChxGV2VmEMtshGgV5Aqpkl3W3iRovzDl1JKVEFGW
         YVU2OaXfr0+Gt9TkAdUlt/B8ROtUbbI+fC3EW/CBNchpPlD9ZV5rgsCM3VFi4Jk+GSVE
         Vn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760953326; x=1761558126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjEUaWPd/Jj2ElIhymJE8eOmk6i+S46mwSJsA8AQ+EQ=;
        b=pnEt4KVmFPMw/Lmxyybafu7F0gN0+URgIGeGmbtu+J+a3CNFELqijlRp/FEN4E6UrD
         p5AFFA+cWZxnyTAg8plpzb9OdIV5uPCF/BAYF336E3MUDWs+0To6gecgTvPyOw6oazXD
         YkJyItMuwkndC3YoQKCkZ2YOskOqeUYCLtXNqYwMdDG73zUBpoTsUeRJ3bkJvSyo9HVI
         pUnxYpp6YQb2nddXXm3KGzZjI0Sw3MwUa24SbK8MqJ4WPeq8wYDUEynpU0I63iw8ry9D
         7+So79hD7dafCaXn4+i6hVn8yK489UaiQQp0v+Pz5kyAWu/vmqq1Z3FLP5eh461h4X9u
         STHg==
X-Forwarded-Encrypted: i=1; AJvYcCV5P60WFj3/uZbDNn3KUt1xMWawIH2Uo+yyGCSdbaXnafMMezOdyPzp3CTKtbDYppgtSexlv7WZBTPLXtKH92fJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywur4bNxD70fragc716/miTPkcBvHh3LCAB5FiSOiaodWP3I1MD
	cj8k5IWUmwId9NljBPZgVNr3lpyz0MOeA14oB64gzHyNjdBDszJ7u2D7gr5pcxJ7xGuWES2BbLN
	+CzTRxnozFmMJ8yEBo5d7eWl7GrUR66sw/aH5KH4C4gEVet/JglaL
X-Gm-Gg: ASbGncvAdSCa9za/yiuvKoz+g3p0wNgy9KE1hXvrHuS8Nt+SXdK/B2vzlAsSUZlL1Rb
	ZSLAg1v8YlRLN0NRcRuKW+b28oREA8ASvFs+RgdLFDlzFTnZMgnQkajbFOSPM/hZZb3cKzvX8D8
	+KKdr2nRCohEnAsiK+kUcRPajd8CDU1FanH2Z1ldLD086Tvr6bvqibIlOe/oAtJiCEhHhf1vDIP
	Wtt99hvMuVXoXuC3nW/2v7+YQDEBfnxXArLOxI/+nQXYLwan1sJM+DT8vLAbTX5X8P/9zSh4zQx
	X8se5IGJnfn2e2tO
X-Google-Smtp-Source: AGHT+IHY1EdCIXYngUyFFwGvzEW0znpDl77em9pEnOCmJRoroDyoIZB7DiA520ogK1u8lsISe3niq2HVycioLER4ci8=
X-Received: by 2002:a05:6512:1052:b0:578:ed03:7b70 with SMTP id
 2adb3069b0e04-591d8589aedmr3757333e87.28.1760953326040; Mon, 20 Oct 2025
 02:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <CAMRc=Me4Fh5pDOF8Z2XY4MG_DYqPRN+UJh_BzKvmULL96wciYw@mail.gmail.com> <81bda56c-f18b-4bd9-abf9-9da7c2251f42@sirena.org.uk>
In-Reply-To: <81bda56c-f18b-4bd9-abf9-9da7c2251f42@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 20 Oct 2025 11:41:52 +0200
X-Gm-Features: AS18NWCTv8z2cF08OaIclAyR6BuSf6xIu18qyroHsfySyW-sq8vo6xUHsWKQB4s
Message-ID: <CAMRc=MdOCHJEyPxN+-g71ux68=Mt_Q5P9611QO7Q8J9e8UJv_A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Mark Brown <broonie@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Catalin Marinas <catalin.marinas@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_024208_855065_4252E4DB 
X-CRM114-Status: GOOD (  15.81  )
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

On Fri, Oct 17, 2025 at 7:32=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Oct 17, 2025 at 07:26:51PM +0200, Bartosz Golaszewski wrote:
>
> > Upon a closer inspection it turns out that this is not the case - the
> > ENABLE/DISABLE events are emitted when the *logical* regulator is
> > enabled/disabled even if this does not involve a change in the state
> > of the shared pin.
>
> It really should be the actual physical state change that triggers the
> event.

I guess so, but this would require some non-trivial rework of the
regulator core. We'd need some list of deferred notifications stored
in memory for when the physical state actually changes.

Bartosz

