Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2B6C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unJG9v9Xn31cbuzCRYaN/tyt9UiLmNc7cj8xNAf2V7g=; b=BQxdEWDbBgMHejAv0+aX5HPE5+
	KLN6HXlFtclI0zwZoTwgVar5nTVXGShJbpFndWpXVpPE6f8wMjVv0NUCNNviPqDDFf1efUMZ8TiWR
	374gXIfHCuk67vjwtaLLwREzJM5vWtTn7MR0BwSCXUPTMj12pc7YQUKK4gOhR/hXdT6a49XKAxhEG
	7kekwDkvRjev9Bj4us+pNYUtSc4quBgf4pyOvEqhstgLHxWkEm/R3v/T+zuRmXI4nkOBgW6/dhmLR
	ByFgxqzojrwH8cr6kU/ubwJXBQJFa0lL1lN4S17qJjoj5SzYu/mSKHzoxaG6K7LqvltyfIq4FvjOV
	jEB8nntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESfw-00000009S9y-3afC;
	Mon, 12 May 2025 12:54:32 +0000
Received: from mail-ed1-f51.google.com ([209.85.208.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESEI-00000009NOO-4BKQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:26:00 +0000
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5fbdf6973e7so5526777a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747052755; x=1747657555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unJG9v9Xn31cbuzCRYaN/tyt9UiLmNc7cj8xNAf2V7g=;
        b=HfXw7SjIhuK+3cjsImhIM8s4CL6F9NfVtxvVlKxPOd+z9EaYF1c7IISzXALNVQdyEM
         fOF+xspQNe+TD4DmPApe/PdsqGm18S6CF0zJlX4rho0KNFMJv6Xzvo5PJiYP1XMZi0dL
         C9DtvK5R4GB2H6K+l9BrbttIzYidCLtn9IWPElB2yu1SRBTXn7ItTN5ZQ6sQmxZfHvy6
         U2OR5do0cDrTR32bN/abS2EuyWs1dXDFm1beACF16iu/Gi2+jzHMra83uzaO/SNDgsni
         aB8k4Mm7qusQ4uPDZEjEH9/BTIO3AwgRFymzQMot7e3lsrcl1thgt7jJ+5B/mCoZqYj5
         4IlA==
X-Forwarded-Encrypted: i=1; AJvYcCVZtrFcx9A61PDiAdtD+g5SFVkxIcBSqrKm4yQXMMBGjF1mIYu74ftJEi7I4FyyItV9xApy7hsz9E1nlx5tXcJX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv875p4zp6yImthmK+c59OtuMzso02ludRBCvYHBIhY5NkUK+A
	JSiuAsGv04cfMyokUHN73pluFA9Keoa643HAv1fpT7ZKDT4Ozt6J7jYjK1o1vQs=
X-Gm-Gg: ASbGncvK0KypUsyurbjd/ug8Yl4gdiJIXvoWz646zAm/B1hK4w2O3RTTE4nz+fpIaSU
	S6SpgjlUcjapZDIzmPUg1TiBT8Y15CTUXUK6yNBy8708g1mTbKgBrbQVMDSdQqW2cFrPVpARIB2
	nT1B4GuZ8DL9XoDMf5CxJRZzk9/Tl02Z3eOh0pq/vNyufKuhVHnrG52kMZ2uDQrh7je+uEeByU1
	uF+gUPOms7F1Lidi8vfDWZ80dAxoyOGctZJPKKt5+pp/ccrkGNVe0Xn2pqv8n/h9eKiiC74yBSO
	nAgoZYRIpj6kvpoRDEy7lH87rv//IAqZxkKUQAMNFjq5flfgbw8wYp5IYu62FSLz74wfA0JjygE
	WBDVDCw==
X-Google-Smtp-Source: AGHT+IFleBNiI307s4P6ghg4lOcUmB8zsrHrWRI4bkQESw+2961z9DjqYoA9WVk4TOhtghMGwhkT6g==
X-Received: by 2002:a05:6402:210a:b0:5fd:d62b:6dc5 with SMTP id 4fb4d7f45d1cf-5fdd62b7050mr3147696a12.29.1747052755236;
        Mon, 12 May 2025 05:25:55 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9bf9d4c4sm5661593a12.0.2025.05.12.05.25.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 05:25:54 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so7376061a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:25:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQxMp1AqZPM5Tl8/njldPx2FR3tnbc0xVHSpZDeN0ZxYaDpZp0F7/kptWDmYx6q4FKrPeOQTsedg0OEfojbtu4@lists.infradead.org
X-Received: by 2002:a17:907:c243:b0:ad2:5198:d711 with SMTP id
 a640c23a62f3a-ad25198d88amr381917366b.10.1747052753743; Mon, 12 May 2025
 05:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
In-Reply-To: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 12 May 2025 08:25:16 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_5t2VuOyhU-xziG_DNVLb5aSMFQ_XiMMboiVokuDB4cw@mail.gmail.com>
X-Gm-Features: AX0GCFshW8pkFO5zWRP_MYEJ_yTJ-TXto5fm5rHE3tApvoCDGWwD2lMg8o2TzQg
Message-ID: <CAEg-Je_5t2VuOyhU-xziG_DNVLb5aSMFQ_XiMMboiVokuDB4cw@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] Apple Mac System Management Controller
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_052559_039098_BBA42BE7 
X-CRM114-Status: GOOD (  42.08  )
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

On Sun, May 11, 2025 at 4:19=E2=80=AFAM Sven Peter via B4 Relay
<devnull+sven.svenpeter.dev@kernel.org> wrote:
>
> Hi,
>
> This series adds support for the System Management Controller found in
> Apple Silicon devices which we model as a mfd. It also includes support
> for the GPIO block and the power/reset block as sub-devices.
>
> Changes between v4 and v5:
>   - Alyssa's comments:
>     - Made the WARN_ON in the reboot driver more obvious
>     - Added missing brackets around a for loop in the reboot driver
>     - Used min instead of open-coded variant inside the gpio driver
>     - Reoder struct memebers to prevent padding inside the mfd driver
>   - Lee's comments:
>     - All comments now start with an uppercase letter
>     - Removed apple_smc_read_ioft_scaled and apple_smc_read_f32_scaled
>       since these are not yet used and likely don't belong into
>       drivers/mfd
>     - Relaced if (ret !=3D 0) with if (ret) when possible
>     - Used devm_platform_get_and_ioremap_resource to get and map the
>       SRAM resource
>     - Used reverse Christmas-tree formating when declaring variables
>     - Dropped _platform left-overs from probe and remove functions
>     - Removed dev_dbg prints which are no long required after
>       development
>     - Reworked is_alive/is_initialized so that it's obvious how errors
>       during boot are propagated from the callback to the probe function
>     - Used dev_warn instead of dev_err in a few places
>     - Removed no-op apple_smc_rtkit_shmem_destroy; this required an
>       additional change in rtkit.c because we had a check there that's a
>       bit too strict
>     - Removed struct resource in apple_smc_rtkit_shmem_setup and
>       open-coded resource_contains instead
>     - Unwrapped lines with less than 100 chars
>     - Made sure to compile with W=3D1 and ran scripts/kernel-doc -v
>       on macsmc.h once and fixed any fallout
>   - Removed first_key/last_key from struct smc and moved
>     apple_smc_find_first_key_index to the gpio driver since it's only
>     used there anyway to find the index of the first GPIO key (gP00)
>   - Return -EIO when a command fails instead of whatever SMC returns
>     which does not map to Linux errnos on errors
>
> Changes between v3 and v4:
>   - Added documentation for all functions and structs
>   - Fixed dt-bindings and re-ordered commits so that the mfd one comes
>     last and can include the gpio subdevice
>   - Added the reset driver and corresponding bindings
>   - Reworked the atomic mode inside SMC since the previous implementation
>     called mutex_lock from atomic context
>   - Removed the backend split for now which lead to a quite intense discu=
ssion
>     for the previous versions which hadn't been solved as far as I could =
tell
>     from the old threads.
>     It's also been 2+ years and I haven't heard of any backend implementa=
tion
>     for T2 or even older macs. It's also unclear to me which sub-devices
>     are actually useful there because at least GPIO and shutdown/reboot
>     from this series will not work as-is there.
>     I'd rather have this initial version which only supports M1+ macs ups=
tream
>     and then iterate there if any other backend is developed.
>     I'll gladly help to re-introduce backend support if it's ever require=
d.
>
> Dependencies:
> The code and dt-bindings themselves apply cleanly to 6.15-rc1 but
> the device tree changes require the already merged SPMI controller
> and SPMI NVMEM series which will be part of 6.16.
> The series is also using the printf format specifiers which will
> land in 6.16 via the drm-misc tree.
> A tree with all dependencies for testing is available at
> https://github.com/AsahiLinux/linux/commits/sven/smc-v5/.
>
> Merging:
> The dt-binding patches all depend on each other such that they all
> should probably go together with the mfd device itself.
> The following commits also depend on mfd due to the new header file and
> will either have to go through the mfd tree as well or we'll need an
> immutable branch there or we just wait one kernel release and I'll
> re-submit the rest then.
> I'll take the device tree updates through our tree which also has the
> previous device tree updates these depend on.
>
> v4: https://lore.kernel.org/asahi/20250503-smc-6-15-v4-0-500b9b6546fc@sve=
npeter.dev/
> v3: https://lore.kernel.org/asahi/Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk/
> v2: https://lore.kernel.org/asahi/YxdInl2qzQWM+3bs@shell.armlinux.org.uk/
> v1: https://lore.kernel.org/asahi/YxC5eZjGgd8xguDr@shell.armlinux.org.uk/
>
> Best,
>
> Sven
>
> ---
> Hector Martin (5):
>       gpio: Add new gpio-macsmc driver for Apple Macs
>       power: reset: macsmc-reboot: Add driver for rebooting via Apple SMC
>       arm64: dts: apple: t8103: Add SMC node
>       arm64: dts: apple: t8112: Add SMC node
>       arm64: dts: apple: t600x: Add SMC node
>
> Russell King (Oracle) (2):
>       dt-bindings: gpio: Add Apple Mac SMC GPIO block
>       dt-bindings: mfd: Add Apple Mac System Management Controller
>
> Sven Peter (3):
>       dt-bindings: power: reboot: Add Apple Mac SMC Reboot Controller
>       soc: apple: rtkit: Make shmem_destroy optional
>       mfd: Add Apple Silicon System Management Controller
>
>  .../devicetree/bindings/gpio/apple,smc-gpio.yaml   |  37 ++
>  .../devicetree/bindings/mfd/apple,smc.yaml         |  71 +++
>  .../bindings/power/reset/apple,smc-reboot.yaml     |  52 +++
>  MAINTAINERS                                        |   7 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi          |  35 ++
>  arch/arm64/boot/dts/apple/t8103.dtsi               |  35 ++
>  arch/arm64/boot/dts/apple/t8112.dtsi               |  35 ++
>  drivers/gpio/Kconfig                               |  10 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-macsmc.c                         | 293 ++++++++++++
>  drivers/mfd/Kconfig                                |  15 +
>  drivers/mfd/Makefile                               |   1 +
>  drivers/mfd/macsmc.c                               | 506 +++++++++++++++=
++++++
>  drivers/power/reset/Kconfig                        |  11 +
>  drivers/power/reset/Makefile                       |   1 +
>  drivers/power/reset/macsmc-reboot.c                | 363 +++++++++++++++
>  drivers/soc/apple/rtkit.c                          |   3 +-
>  include/linux/mfd/macsmc.h                         | 277 +++++++++++
>  18 files changed, 1751 insertions(+), 2 deletions(-)
> ---
> base-commit: 5abab6ab4ebacfff5857b63bd349902a6568d2e8
> change-id: 20250304-smc-6-15-f0ed619e31d4
>

Series overall looks good to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

