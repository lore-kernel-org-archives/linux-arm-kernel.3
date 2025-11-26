Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9860FD10F28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6F02K/URUOBsb5sh+E+wRc/rv7WAgmGziAPvy9s7qhI=; b=3hfnCnRFF8hK17G/A0FsUY3Zg+
	opGlYkpuEhre4NQn5PNxiLEqiqkkOJ8qy+kZlkJrHs6xOu/T9sYLpqhKkxhnUF66w0pOU07Vbn+rF
	qd2npnv9cE+AeSiNyHmaDNGuLcNasERe2MFch4iOHL/E+p/KWGjn8jcfLddJAVRUP3sTbAjizdauh
	uWhLLqzsHnDy3YPIxXGRoLYhEMwNwpBGAgL3M5pz+GxtO5/ZptlUetBWoBW2bUSCRrsxrTN5dlD14
	F6gUSQ4PhKPYlkuPwtm2mCcLO1HEp8ZCN3U3l2sO9/7SW69FpMPX6nTiWvR9wLHcKCWhlmspNGJoa
	HKt1Rn7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIif-0000000FKcx-0NrY;
	Wed, 26 Nov 2025 16:50:17 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIic-0000000FKcL-18hI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:50:15 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-596ba05aaecso7035e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 08:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764175812; x=1764780612; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6F02K/URUOBsb5sh+E+wRc/rv7WAgmGziAPvy9s7qhI=;
        b=nQhZa3SzYZyyBPYDBmuZMRhnyMUyOf98kTJeIM8RgNo14cgd2LjPT32BgCG1A9UbZc
         6W3zkRXJm1BTtI9nLOXnjotqDRt6e2zUhAQvBdrEMkiF6nTCcY1fuZs9ild6aHMrVLh0
         AGcOj94xeEEoKCaEi+5CX7PtrwGy1XtnGgokEZ8hvIc/UW8txZ/FW/5tLpf+lZ+kugl/
         Z5C7VR1oAtSmSkgYBnXp6l7GxKZAvKms3bRarCkbSIVyrkzIbVSxp5jTNw9UZWh+ckeO
         x0fHl/vCEYvsM5zw7EjkZk7OOc8XsLMCBvT7i1CmUGVay/8/ldaaVOKB6gRF83fslWQL
         9blQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764175812; x=1764780612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6F02K/URUOBsb5sh+E+wRc/rv7WAgmGziAPvy9s7qhI=;
        b=dYbs1yqfb+9glr9IR4hI9WoHw2/Hx8CPzlDzVjjA5J1XKwpZBn68K/y/PvhZUXG0z9
         6qXeyM6A1p2yk70D3AViqbFVAh8+ERhMgNFs/pm8+3WibPEF+/G0F4ppi8mtyrm2AeZa
         JrJjAhe0hsVL9bTBtV13ljni3lUX9imbDYiwxRSCMeLu8UrHuBc5z6qBXDIiBLSELOiM
         CoOoOIbTV1i0BeQy1j2K2NwOa9oCtnG/2VP8+slLcRRHL9yTsx1dpZon3rUVb9nh8ets
         uHSIq9TuxwvSewk8LzfqiSSojxIEzffq03iQn8QA7hKpbPG6XCwbW40QO4585y29tjU5
         RskQ==
X-Forwarded-Encrypted: i=1; AJvYcCX05xnw8A6EW2MTI+HPFX3P/eZK3gaI6dY1AGIQXQXqReQ7WKfVMuWfHDoJDyfyaS6w6buJRjwFwC37/z9uJ1fH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz/QQfHUfaqSEOubUH7QQ4Ul8GdRqbwa+hlPdW/PYc0Kfbd6ir
	oHRO43atk2ASrR5oIFFHaklTzlfIFB2Tnl50uY/WT34zXhb0HwetS+izj32N0pH0gGhOiKtgD87
	z39z9znzBzASWNzE9yqiMXFVOHeg3JxAu/7PLjN+IXQ==
X-Gm-Gg: ASbGnct+rk5fjCiwkEX4qXoYjnJ7SkL7gzgr9HmvT9XSMB1AHTXgvXDP/1Ui3mR7l5M
	ohIbHnor3BVh1oajlZfjn6vUPBUGL2jEaai8oK2VrDbxqZr6Any4JuLIgF9xU5j+xdOHvg5u+hA
	TT5R2UlyX9ySxyAKnnls6AmDptN16LlhZj0MH7fLXx/j5aI+ISo3Ll9y7/Zsd5j5KfW4AHV10S3
	ZCdD/PdKG4AM4YQlpmLdox23RSsSlM62bw8Wc+LhE781Hra3Qxyx0QphHeJJ1H/rejqVssF5Gff
	2M+l2DKqXr2uki8UP56xAhGcmzM=
X-Google-Smtp-Source: AGHT+IFmVOdXXIAfnH7OC0VYGQGrZQJtsjkxwvYAqGhWrhZnCIKHENs3MU+gqzGwCeIaQSSJl6QMFA/gNMYKQ2YbWdk=
X-Received: by 2002:a05:6512:1150:b0:595:7daf:9418 with SMTP id
 2adb3069b0e04-596a3ee117dmr7310449e87.45.1764175811444; Wed, 26 Nov 2025
 08:50:11 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org> <fimuvblfy2cmn7o4wzcxjzrux5mwhvlvyxfsgeqs6ore2xg75i@ax46d3sfmdux>
In-Reply-To: <fimuvblfy2cmn7o4wzcxjzrux5mwhvlvyxfsgeqs6ore2xg75i@ax46d3sfmdux>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 17:49:59 +0100
X-Gm-Features: AWmQ_blaGCzwiPKb7zOiqvjnxj57Tgzboa7X8YkuhYoHnlFeuOY1PuXL7i92b9Q
Message-ID: <CAMRc=Me8KUGD7Lmdr7iecXWG4JD2cS8i37P+oMxQYdSZ4zAUEA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_085014_336737_F3180E81 
X-CRM114-Status: GOOD (  15.29  )
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

On Wed, Nov 26, 2025 at 5:27=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> I'm sorry if this was already reported and fixed. On Qualcomm RB5
> platform with this patchset in place I'm getting the following backtrace
> (and then a lockup):
>
> [    4.298346] gpiolib_shared: GPIO 130 owned by f100000.pinctrl is share=
d by multiple consumers
> [    4.307157] gpiolib_shared: Setting up a shared GPIO entry for speaker=
@0,3
> [    4.314604]
> [    4.316146] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    4.321600] WARNING: possible recursive locking detected
> [    4.327054] 6.18.0-rc7-next-20251125-g3f300d0674f6-dirty #3887 Not tai=
nted
> [    4.334115] --------------------------------------------
> [    4.339566] kworker/u32:3/71 is trying to acquire lock:
> [    4.344931] ffffda019ba71850 (gpio_shared_lock){+.+.}-{4:4}, at: devm_=
gpiod_shared_get+0x34/0x2e0
> [    4.354057]
> [    4.354057] but task is already holding lock:
> [    4.360041] ffffda019ba71850 (gpio_shared_lock){+.+.}-{4:4}, at: gpio_=
device_setup_shared+0x30/0x268
> [    4.369421]

Ah, I missed the use-case where the auxiliary device is bound right
after it gets added and we're still holding the shared_gpio_lock. I
think we should prepare the proxy devices but only add them after
releasing the lock. I will fix it first thing tomorrow morning.

Bartosz

