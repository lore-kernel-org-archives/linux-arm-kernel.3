Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598BCCFA455
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/YO6Pe177O4zi05IsxsZHsEP5nWXUeem4INsgbYfTE8=; b=cC+43IL72UwQEdHkZMdUnry5dL
	24fwh5ZordEyfcj7P3zseAC7LGuxR5L5lM45XBNcyzHAYT84zrurCHUna61LWMDPm2/FMmw4KuB5T
	EXNoGnvo7OhGNiQjGtt0DstO4hFS91JnJVjd+heeslJYOoPHXlzl2ew9y7fUKpcuuTP96UWXjuL1X
	GKiXTKRtnGEfG16ywetWrnAlzYK/j6UaF/1PAwbJtTdkL0LFyOBkPApbs2I2dJDe/MZJb9TFYpxCa
	/WhQ5tfRVPajM5T7wpSuPqEvh05JC4wDA7CnmjxFYgRx9k/QO8A8AwquYn17lpS8wMksiBh4Kpsfi
	SsR486FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3f6I-0000000FMWz-0c8r;
	Wed, 23 Oct 2024 17:24:50 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ePp-0000000FCFL-0PGg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:40:59 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so3714935e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729701654; x=1730306454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YO6Pe177O4zi05IsxsZHsEP5nWXUeem4INsgbYfTE8=;
        b=iIePzzZ3QA3ztkwP7DLJSt7FjjSBYZZLrqavZyOSIb8PofCZrDQSU6L1JJ6yvPr9p+
         32UdJc0+dmhP8So/OgmlY7J8dIBpIX2IfAtuicpXpqsS7Nc7RXOtJhfugmckG69k1iyV
         uhtw6Z7hr2yYpdtMKtwFV7SLdLi1/JyUb/0RATWIpHHBh9TmERqGuRhKX295tS0NLaTG
         mRU+6geWZRuf//NY+yOAGGGqqGfq9kEQGrd4gPzTj3Am0B+pw473E4saYf2xkygdjTFI
         U6CzUYWD6QqOnzqu8edQEIY1wSjl0yr9o6ruGzJPJEorEJD4x6EQDkk992+tycG5fQUp
         oTow==
X-Forwarded-Encrypted: i=1; AJvYcCXPc0Vt+SLdLDUXhegLV49REYqZb+bvW1vSANPGbtiowDIOoMeQSQ7q9ak8Wisze8OuA3y44eqbVBNNTFl/Xhtc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0E03YGWVnJoy6Gi/8NwZswyLQmLF1Fz3c8c29Zls+yJi4/Bqp
	sQ9+uasLqYz7SLWNnfXk8+msUsGgQv3PuIxUtgSl05kERoF8TMaY9+anoQZoNNwYmw==
X-Google-Smtp-Source: AGHT+IHLq7AuuWIee1AKfa28ClQd1QcA7e9g9VcUwVl0QFcy0l9B4IUgfuscMNxiemL3PiGAKQemCw==
X-Received: by 2002:a05:6512:1292:b0:536:a4f1:d214 with SMTP id 2adb3069b0e04-53b1a33cca8mr2710068e87.19.1729701653565;
        Wed, 23 Oct 2024 09:40:53 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d660esm498368866b.34.2024.10.23.09.40.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 09:40:53 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4316cce103dso60151535e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:40:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNXUECyPkmx/wx1/xP14QRrJ5Tapfq3O48plf1N5eyptYKkrB0vWCbFu2g/To0MrAE1t3Gyi8JFqdT03sB0Ydj@lists.infradead.org
X-Received: by 2002:adf:f0cc:0:b0:37c:d2e3:1298 with SMTP id
 ffacd0b85a97d-37efcf91142mr2571245f8f.55.1729701652458; Wed, 23 Oct 2024
 09:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241023044423.18294-1-towinchenmi@gmail.com>
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 23 Oct 2024 12:40:15 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_anyiA-fRJOvYrbC1fMrsqZsYQoPWGDfc=_a1hCwy8-Q@mail.gmail.com>
Message-ID: <CAEg-Je_anyiA-fRJOvYrbC1fMrsqZsYQoPWGDfc=_a1hCwy8-Q@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 00/20] Initial device trees for A7-A11 based
 Apple devices
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_094057_170903_AA91DDE4 
X-CRM114-Status: GOOD (  42.64  )
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

On Wed, Oct 23, 2024 at 12:44=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> =
wrote:
>
> Hi,
>
> This series adds device trees for all A7-A11 SoC based iPhones, iPads,
> iPod touches and Apple TVs.
>
> The following devices has been excluded from this series:
>   - All T2 devices (A10-based): bootloader does not work (yet)
>   - HomePod: Not tested, and it's also a different form factor
>
> To pass `make dtbs_check`, please install the latest dtschema from the ma=
in
> branch, for the `television` chassis type.
>
> This series supports the following on all devices:
> - SMP (spin-table)
> - UART
> - simple-framebuffer
> - watchdog
> - timer
> - pinctrl
> - AIC interrupts
>
> The following is supported on A7-A10:
> - Buttons and switches (with pinctrl)
> The buttons on A11 based devices like the iPhone X is a subdevice of the
> not yet supported SMC.
>
> Patch dependencies:
> - A patch to increase the reset delay in the watchdog driver[1] are
> needed on some SoCs to avoid the "Reboot Failed" message. (The
> system will reset regardless of the patch)
>
> Authorship information:
> - The commits to actually add the dts files are mostly made by Konrad,
> and Konrad's sign-off is added by me with permission. I also updated the
> Konrad's email in the actual dts files. Konrad can confirm this.
>
> - Everything else is entirely made by me.
>
> Changes since v5:
>  - Changed how device trees are split. {soc}.dtsi now only contain on-SoC
>    parts, and parts common to all devices using a soc is in
>    {soc}-common.dtsi. For A9 devices the common .dtsi is
>    "s800-0-3-common.dtsi". For A8 devices additonally there is
>    "t7000-handheld.dtsi" to group iPhones, iPad and iPod touches from
>    Apple TVs.
>  - For other SoCs, either all devices are handheld or there are only one
>    type of handheld devices using it, so no handheld .dtsi is needed.
>  - This is closer to how the existing device trees are split, and will
>    allow nodes likes power manager and battery to be added more easily.
>  - Fixed Apple TV HD serial debug console. It is serial6, not serial0.
>
> Changes since v4:
>   - Removed incorrect commit message about the order of CPU cores
>     in the commit adding Apple A7-A11 CPU cores.
>   - Update tags on commit added A8X device tree files, requested by
>     Markuss.
>
> Changes since v3:
>   - Properly seperate A10X dt-binding additions and dts additions.
>   - Apple CPU cores, including the existing ones are now ordered
>     alphabetically.
>
> Changes since v2:
>   - Removed A10 cpufreq. The loader may be missing some initialization
>     code that just happened to be performed by some versions of the
>     firmware as well, given the inconsistent behavior on different
>     devices. It is also possible that the driver needs to be modified,
>     I do not know and this needs more research first.
>
>   - Removed Ivaylo's tags on commit to add A8X device trees, seems he
>     does not want those anymore[2].
>   - Added Ivaylo's tags on commit to add A8 device tree, I have missed
>     the tag. See [3] for source of those tags.
>   - Added Conor's missing A-b on the commit to add A7 machine bindings.
>
> Changes since v1:
>   - Added /chassis-type property
>   - Added opp-microvolt in A10 cpufreq for documentation purposes
>   - Home button is now assigned KEY_HOMEPAGE
>   - Fixed t8010-n112.dts and do not remove it from Makefile in later
>     commits... (iPod touch 7)
>
> In order to be consistent with the Apple ARM Machines bindings,
> the order of dt-bindings did not change from v1.
>
> The sort order logic here is having SoC type families in release
> order, and SoCs within each family in release order:
>
> - t8xxx/t700x/s5l8960x (Apple HxxP/G series, "phone"/"tablet" chips)
>    - s5l8960x (Apple H6/A7)
>    - t7000 (Apple H7P/A8)
>    - t7001 (Apple H7G/A8X)
>    - s8000/3 (Apple H8P/A9)
>    - s8001 (Apple H8G/A9X)
>    - t8010 (Apple H9P/A10)
>    - t8011 (Apple H9G/A10X)
>    - t8015 (Apple H10/A11)
>    - t8103 (Apple H13G/M1)
>    - t8112 (Apple H14G/M2)
> - t6xxx (Apple HxxJ series, "desktop" chips)
>    - t6000 (Apple H13J(S)/M1 Pro)
>    - t6001 (Apple H13J(C)/M1 Max)
>    - t6002 (Apple H13J(D)/M1 Ultra)
>
> At this moment, it is expected that most hardware blocks will be 100%
> compatible between A-series and AX-series SoCs, though to a less extent
> than compatibility between desktop chips of the same generation.
>
> v1: https://lore.kernel.org/asahi/20240911084353.28888-2-towinchenmi@gmai=
l.com
> v2: https://lore.kernel.org/asahi/20240914052413.68177-1-towinchenmi@gmai=
l.com
> v3: https://lore.kernel.org/asahi/20240915080733.3565-1-towinchenmi@gmail=
.com
> v4: https://lore.kernel.org/asahi/20240919161443.10340-1-towinchenmi@gmai=
l.com
> v5: https://lore.kernel.org/asahi/20240925071939.6107-1-towinchenmi@gmail=
.com
>
> [1]: https://lore.kernel.org/asahi/20241001170018.20139-1-towinchenmi@gma=
il.com
> [2]: https://lore.kernel.org/asahi/34c748fe-89d2-d3a5-599d-52972c10f688@g=
mail.com
> [3]: https://github.com/konradybcio/linux-apple/commits/apple/v5.19-rc1
>
> Nick Chan
> ---
>
> Konrad Dybcio (8):
>   arm64: dts: apple: Add A7 devices
>   arm64: dts: apple: Add A8 devices
>   arm64: dts: apple: Add A8X devices
>   arm64: dts: apple: Add A9 devices
>   arm64: dts: apple: Add A9X devices
>   arm64: dts: apple: Add A10 devices
>   arm64: dts: apple: Add A10X devices
>   arm64: dts: apple: Add A11 devices
>
> Nick Chan (12):
>   dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
>   dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
>   dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
>   dt-bindings: arm: apple: Add A7 devices
>   dt-bindings: arm: apple: Add A8 devices
>   dt-bindings: arm: apple: Add A8X devices
>   dt-bindings: arm: apple: Add A9 devices
>   dt-bindings: arm: apple: Add A9X devices
>   dt-bindings: arm: apple: Add A10 devices
>   dt-bindings: arm: apple: Add A10X devices
>   dt-bindings: arm: apple: Add A11 devices
>   arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE
>
>  .../devicetree/bindings/arm/apple.yaml        | 160 +++++++++++-
>  .../devicetree/bindings/arm/cpus.yaml         |   8 +-
>  .../bindings/pinctrl/apple,pinctrl.yaml       |   5 +
>  .../bindings/watchdog/apple,wdt.yaml          |   5 +
>  arch/arm64/Kconfig.platforms                  |   4 +-
>  arch/arm64/boot/dts/apple/Makefile            |  53 ++++
>  arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |  51 ++++
>  arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |  51 ++++
>  .../arm64/boot/dts/apple/s5l8960x-common.dtsi |  48 ++++
>  arch/arm64/boot/dts/apple/s5l8960x-j71.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j72.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j73.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j85.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j85m.dts   |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j86.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j86m.dts   |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j87.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j87m.dts   |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |  51 ++++
>  arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-n51.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-n53.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi       | 113 +++++++++
>  .../arm64/boot/dts/apple/s800-0-3-common.dtsi |  48 ++++
>  arch/arm64/boot/dts/apple/s8000-j71s.dts      |  15 ++
>  arch/arm64/boot/dts/apple/s8000-j72s.dts      |  15 ++
>  arch/arm64/boot/dts/apple/s8000-n66.dts       |  15 ++
>  arch/arm64/boot/dts/apple/s8000-n69u.dts      |  15 ++
>  arch/arm64/boot/dts/apple/s8000-n71.dts       |  15 ++
>  arch/arm64/boot/dts/apple/s8000.dtsi          | 144 +++++++++++
>  arch/arm64/boot/dts/apple/s8001-common.dtsi   |  48 ++++
>  arch/arm64/boot/dts/apple/s8001-j127.dts      |  14 ++
>  arch/arm64/boot/dts/apple/s8001-j128.dts      |  14 ++
>  arch/arm64/boot/dts/apple/s8001-j98a.dts      |  14 ++
>  arch/arm64/boot/dts/apple/s8001-j99a.dts      |  14 ++
>  arch/arm64/boot/dts/apple/s8001-pro.dtsi      |  44 ++++
>  arch/arm64/boot/dts/apple/s8001.dtsi          | 133 ++++++++++
>  arch/arm64/boot/dts/apple/s8003-j71t.dts      |  15 ++
>  arch/arm64/boot/dts/apple/s8003-j72t.dts      |  15 ++
>  arch/arm64/boot/dts/apple/s8003-n66m.dts      |  15 ++
>  arch/arm64/boot/dts/apple/s8003-n69.dts       |  15 ++
>  arch/arm64/boot/dts/apple/s8003-n71m.dts      |  15 ++
>  arch/arm64/boot/dts/apple/s8003.dtsi          |  21 ++
>  arch/arm64/boot/dts/apple/s800x-6s.dtsi       |  49 ++++
>  arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |  43 ++++
>  arch/arm64/boot/dts/apple/s800x-se.dtsi       |  49 ++++
>  arch/arm64/boot/dts/apple/t7000-6.dtsi        |  50 ++++
>  arch/arm64/boot/dts/apple/t7000-common.dtsi   |  36 +++
>  arch/arm64/boot/dts/apple/t7000-handheld.dtsi |  27 ++
>  arch/arm64/boot/dts/apple/t7000-j42d.dts      |  31 +++
>  arch/arm64/boot/dts/apple/t7000-j96.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t7000-j97.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |  51 ++++
>  arch/arm64/boot/dts/apple/t7000-n102.dts      |  48 ++++
>  arch/arm64/boot/dts/apple/t7000-n56.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t7000-n61.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t7000.dtsi          | 125 ++++++++++
>  arch/arm64/boot/dts/apple/t7001-air2.dtsi     |  74 ++++++
>  arch/arm64/boot/dts/apple/t7001-j81.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t7001-j82.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t7001.dtsi          | 123 +++++++++
>  arch/arm64/boot/dts/apple/t8010-7.dtsi        |  43 ++++
>  arch/arm64/boot/dts/apple/t8010-common.dtsi   |  48 ++++
>  arch/arm64/boot/dts/apple/t8010-d10.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t8010-d101.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8010-d11.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t8010-d111.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |  44 ++++
>  arch/arm64/boot/dts/apple/t8010-ipad7.dtsi    |  14 ++
>  arch/arm64/boot/dts/apple/t8010-j171.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8010-j172.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8010-j71b.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8010-j72b.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8010-n112.dts      |  47 ++++
>  arch/arm64/boot/dts/apple/t8010.dtsi          | 133 ++++++++++
>  arch/arm64/boot/dts/apple/t8011-common.dtsi   |  46 ++++
>  arch/arm64/boot/dts/apple/t8011-j105a.dts     |  16 ++
>  arch/arm64/boot/dts/apple/t8011-j120.dts      |  16 ++
>  arch/arm64/boot/dts/apple/t8011-j121.dts      |  16 ++
>  arch/arm64/boot/dts/apple/t8011-j207.dts      |  16 ++
>  arch/arm64/boot/dts/apple/t8011-j208.dts      |  16 ++
>  arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |  42 ++++
>  arch/arm64/boot/dts/apple/t8011.dtsi          | 141 +++++++++++
>  arch/arm64/boot/dts/apple/t8015-8.dtsi        |  13 +
>  arch/arm64/boot/dts/apple/t8015-8plus.dtsi    |   9 +
>  arch/arm64/boot/dts/apple/t8015-common.dtsi   |  48 ++++
>  arch/arm64/boot/dts/apple/t8015-d20.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t8015-d201.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8015-d21.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t8015-d211.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8015-d22.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t8015-d221.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8015-x.dtsi        |  13 +
>  arch/arm64/boot/dts/apple/t8015.dtsi          | 234 ++++++++++++++++++
>  94 files changed, 3298 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j71.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j72.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j73.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j85.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j85m.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j86.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j86m.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j87.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j87m.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-n51.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-n53.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8000-j71s.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8000-j72s.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8000-n66.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8000-n69u.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8000-n71.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8000.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-j127.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-j128.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-j99a.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-pro.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8003-j71t.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8003-j72t.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8003-n66m.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8003-n69.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8003-n71m.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8003.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s800x-6s.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s800x-se.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-6.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-handheld.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-j42d.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-j96.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-j97.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-mini4.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-n102.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-n56.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-n61.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7000.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7001-air2.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7001-j81.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7001-j82.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7001.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-7.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-d10.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-d101.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-d11.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-d111.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-ipad7.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-j171.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-j172.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-j71b.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-j72b.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-n112.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-j105a.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-j120.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-j121.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-j207.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-j208.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-pro2.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8011.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-8.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-8plus.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-d20.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-d201.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-d21.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-d211.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-d22.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-d221.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-x.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015.dtsi
>
>
> base-commit: 7436324ebd147598f940dde1335b7979dbccc339
> --
> 2.47.0
>
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

