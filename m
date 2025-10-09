Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC6CCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 07:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utVwjhO8Z9nfTT7T332+x9pXtf82IVN0SHJivYwFQFM=; b=uuwzcV0oERpNJGhZUGGGpkXWeL
	sd3KgFMnLVEoqVpFfIyvN77963rAfyQWWrfb7ilA4Y9mPS7ZcQnLOiTHB0kKfzM3g5FLh+/S2O1g4
	SW33bjVQa0fktv0WlUVBxb2YIDz04BwMQ6g8LxwqagNHvvO/hyVFthT2zN9/6d1om1eEpxQXO/BcP
	4vueyjDvADuW5zcbrtAzEqJYvteF48IJX+Gc9tedhbvMgv+MAdyTFY4uJyj/iuvsZNtAZH+p9LzLn
	50IAWpevH8lPlTTsh6soGXGfS+9ZvLf4UOAopgooVmkdQh+8h3UynmkEJYpI6Nl5Zb24HjvxCgcDV
	mJ6+6e8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lYe-00000005QMR-1PS6;
	Thu, 09 Oct 2025 07:59:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lYb-00000005QLQ-1Ve9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 07:59:27 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3fa528f127fso518401f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 00:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759996763; x=1760601563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utVwjhO8Z9nfTT7T332+x9pXtf82IVN0SHJivYwFQFM=;
        b=Fsb3ucN4fhG72Sodj6LcyXrihZiVsbpa12YhXd9r4sMb8wNsnKNDX+Ih0KIm3hkBTZ
         SeojKG89xF9TmyNGgs1tQqlxn+mTFndiH9ihJ9b0z6G4mwhfUrQ8LH/tcXtFIA90iGKI
         HJ71+Iv0PCwfJoTEhYiroi4BgN0gpnpEwJFy0poVpcZvxOHRkoCKuDRO0UXrmSFy043f
         88bGKh2pTRvSlv6fA4CanuwiAu4S3F022SoiUnaBofsS2oGbVUSYk1/R/ZYxkY+WMnjg
         teoXvWI59MbbVwEKprixVLJLP1/zgEc09reJLMHLWYTaKL2/uCLoQL6kWqRN2ZOm579j
         +DeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759996763; x=1760601563;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=utVwjhO8Z9nfTT7T332+x9pXtf82IVN0SHJivYwFQFM=;
        b=UUD6SJDc6doIQxD+IdMsIWkqF+ejT8KH17IjmlxWWuwVT/C+p9B260KlM9Q9VhugtB
         X8xJoWX1IiP4o+8GPoaSJ6QWzGoGI3mie/X6P41Rr4XT6sAablFN6Jk5JwBsFzOGcCXQ
         Q+djtMNfaFC3wfpAH94bblOJfvLFHwIQIFv8NIRJKBDRNDdIirDNJRuXzi2zr76kf012
         lDLYv3woNe0BhDY/iMPbDP0W/h3J5V+1QeYJ7vw3ggEPPKtFEEjK42CqirETTOPGZA9S
         uG3vL+i6CxB708oHv9tA2ljQMI+uTry6n6t0kZeE/cnLzGda5h4yy2X+SZ/Asx4KykY4
         ZpEw==
X-Forwarded-Encrypted: i=1; AJvYcCXmep3Ja62ir1MCAVEkqerntd30mDwo67Xe88cPjcVYrhah3b5Rjli1b7c1SQ04QBsPDxvg329vSbdvq9F922Ip@lists.infradead.org
X-Gm-Message-State: AOJu0YxIMUgbD5J02QHPj6mVtIEDrH043hyQnnJU+PocY4xGhNwON1DC
	T8cuXav6GP8dHTPFy4ZlccwwddFrCkIzLRZnB+yYlnIh/XuYMqatzgczeFu1kFmtZQ8=
X-Gm-Gg: ASbGncvx+ZVl6VeL+r8/Fvod/nxhLpOTfT2h2+071xrfS5sZ7lISQlSS04rxD88KM1E
	osNh0/GWkrdZn7FXGjxqw+EbLtaSqoPRQlCwwzG3VJY7h8Y/qJGhB7TvMRqTXyTBW2aojUS72Jy
	XblrZdKR9012ktWDgA3T3LySmsyHYRLoRUO2uAfEyivwkBaZR+FV4dQoXOsOGeO5nWM9ZeBWIOC
	MQLGmfsKCzWQ2ojQFNyWFQ6z0QvzXmixspgpCFSjZ4DPvouih0/bLBJlgbp5agyJy+1aCIqHAkX
	EWzxT3zKt2TF38wNfOUNiPUW32EcvvFoGFNutSr+flpqJ0LB0BYKAcUPQIiaoN8gh8eLX6qDHwe
	HAV3ub3xBS33DWLWm9RspMV/t6UXDstH+IRVCJFGHoXWG8qC8Vd6jMfgo
X-Google-Smtp-Source: AGHT+IG5pvNgDMJPTKAtRd4veVO0FFUkU2pJXXO+YNn1lCJbx4D7Y9oh8jCMqxVVxc+i8Y4GbC2AVA==
X-Received: by 2002:a05:6000:2c02:b0:401:ae97:a1ab with SMTP id ffacd0b85a97d-42666aa67f9mr4871037f8f.10.1759996763143;
        Thu, 09 Oct 2025 00:59:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1753:6135:be55:f8ab])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8ab8fdsm32990864f8f.15.2025.10.09.00.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 00:59:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 00/19] clk: amlogic: Add PLLs and peripheral clocks for
 A4 and A5 SoCs
In-Reply-To: <b8105d25-112c-4406-9f3a-8fbbd0754b26@amlogic.com> (Chuan Liu's
	message of "Thu, 9 Oct 2025 11:09:25 +0800")
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
	<1jv7kz3w1p.fsf@starbuckisacylon.baylibre.com>
	<b8105d25-112c-4406-9f3a-8fbbd0754b26@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 09 Oct 2025 09:59:22 +0200
Message-ID: <1jh5w84iat.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_005925_433626_7AAF1595 
X-CRM114-Status: GOOD (  29.43  )
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

On Thu 09 Oct 2025 at 11:09, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Jerome,
>
> =C2=A0 =C2=A0 Thanks for your review, because the national day holidays d=
id not
> timely feedback.
>
>
> On 10/1/2025 3:45 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Tue 30 Sep 2025 at 17:37, Chuan Liu via B4 Relay
>> <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>>
>>> This patch series includes changes related to the PLL and peripheral
>>> clocks for both the A4 and A5 SoCs.
>>>
>>> The patches for A5 were previously submitted up to V3 by Xianwei.
>>> https://lore.kernel.org/all/20250103-a5-clk-v3-0-a207ce83b9e9@amlogic.c=
om/
>>> After friendly coordination, I=E2=80=99ve taken over and continued the
>>> submission as part of this series. The dt-bindings patch retains Rob's
>>> original "Reviewed-by" tag, and I hope this hasn=E2=80=99t caused any
>>> additional confusion.
>> ... and yet you restart the versioning of the series making it harder
>> for people to follow that
>
>
> Sorry for the inconvenience caused. The main changes compared to the
> previous version by Xianwei are in the driver part.
>
> The dt-bindings part only has minor modifications in [PATCH 14/19].
>
> The driver part has relatively larger changes because it needs to be
> based on the code base you previously submitted.

I'm not seeing a justification for the mess introduced and I'm not
looking for one to be honest

>
>>> Both A4 and A5 belong to the Audio series. Judging by their names, one
>>> might assume that A5 is an upgrade to A4, but in fact, A5 was released
>>> a year earlier than A4.
>>>
>>> Since there are differences in the PLLs and peripheral clocks between
>>> the A4 and A5 SoCs (especially the PLL), and taking into account factors
>>> such as memory footprint and maintainability, this series does not
>>> attempt to merge the two into a shared driver as was done for
>>> G12A/G12B/SM1.
>> ... and we end up with 19 patches series while it could be splitted into
>> manageable series, for each controller of each SoC
>
>
> I'm not sure if I understood you correctly.
>
> Do you mean that I should split this series of 19 patches into multiple
> patch series and send them separately? For example:
> serie 1: A4 SCMI clock controller (dt-bindings)
> serie 2: A4 PLL clock controller (dt-bindings, driver, dts)
> serie 3: A4 peripherals clock controller (dt-bindings, driver, dts)
> ... A5 similarly?

Things that do not actually depends on each other or which are not
merged through the same tree should not be sent together. There is
nothing new here. Same basic reminders on each submission.

>
>
>>> This patch series includes all related dt-bindings, driver, and dts
>>> changes for the PLLs and peripheral clocks. Following our past conventi=
on
>>> for clock-related submissions, the dts changes are placed at the end
>>> and submitted separately. If this ordering makes it harder for
>>> maintainers to review or pick patches, please feel free to point it out.
>>>
>>> Co-developed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>> ---
>>> Chuan Liu (19):
>>>        dt-bindings: clock: Add Amlogic A4 SCMI clock controller
>>>        dt-bindings: clock: Add Amlogic A4 PLL clock controller
>>>        dt-bindings: clock: Add Amlogic A4 peripherals clock controller
>>>        clk: amlogic: Optimize PLL enable timing
>>>        clk: amlogic: Correct l_detect bit control
>>>        clk: amlogic: Fix out-of-range PLL frequency setting
>>>        clk: amlogic: Add A4 PLL clock controller driver
>>>        clk: amlogic: Add A4 clock peripherals controller driver
>>>        arm64: dts: amlogic: A4: Add scmi-clk node
>>>        arm64: dts: amlogic: A4: Add PLL controller node
>>>        arm64: dts: amlogic: A4: Add peripherals clock controller node
>>>        dt-bindings: clock: Add Amlogic A5 SCMI clock controller support
>>>        dt-bindings: clock: Add Amlogic A5 PLL clock controller
>>>        dt-bindings: clock: Add Amlogic A5 peripherals clock controller
>>>        clk: amlogic: Add A5 PLL clock controller driver
>>>        clk: amlogic: Add A5 clock peripherals controller driver
>>>        arm64: dts: amlogic: A5: Add scmi-clk node
>>>        arm64: dts: amlogic: A5: Add PLL controller node
>>>        arm64: dts: amlogic: A5: Add peripheral clock controller node
>>>
>>>   .../clock/amlogic,a4-peripherals-clkc.yaml         | 122 +++
>>>   .../bindings/clock/amlogic,a4-pll-clkc.yaml        |  61 ++
>>>   .../clock/amlogic,a5-peripherals-clkc.yaml         | 134 ++++
>>>   .../bindings/clock/amlogic,a5-pll-clkc.yaml        |  63 ++
>>>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  80 ++
>>>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  87 ++
>>>   drivers/clk/meson/Kconfig                          |  53 ++
>>>   drivers/clk/meson/Makefile                         |   4 +
>>>   drivers/clk/meson/a1-pll.c                         |   1 +
>>>   drivers/clk/meson/a4-peripherals.c                 | 764 ++++++++++++=
++++++
>>>   drivers/clk/meson/a4-pll.c                         | 242 ++++++
>>>   drivers/clk/meson/a5-peripherals.c                 | 883 ++++++++++++=
+++++++++
>>>   drivers/clk/meson/a5-pll.c                         | 476 +++++++++++
>>>   drivers/clk/meson/clk-pll.c                        |  76 +-
>>>   drivers/clk/meson/clk-pll.h                        |   2 +
>>>   .../clock/amlogic,a4-peripherals-clkc.h            | 129 +++
>>>   include/dt-bindings/clock/amlogic,a4-pll-clkc.h    |  15 +
>>>   include/dt-bindings/clock/amlogic,a4-scmi-clkc.h   |  42 +
>>>   .../clock/amlogic,a5-peripherals-clkc.h            | 132 +++
>>>   include/dt-bindings/clock/amlogic,a5-pll-clkc.h    |  24 +
>>>   include/dt-bindings/clock/amlogic,a5-scmi-clkc.h   |  44 +
>>>   21 files changed, 3406 insertions(+), 28 deletions(-)
>>> ---
>>> base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
>>> change-id: 20250928-a4_a5_add_clock_driver-2b7c9d695633
>>>
>>> Best regards,
>> --
>> Jerome

--=20
Jerome

