Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03DECFA758
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 09:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcWFlcuSs7Y0eO4oq2DsaroJj7DisvwmuRZnugA2UKI=; b=ezrah44YiemZLBPZP6FbVvSfaD
	W6BMVmy7+iOc+sCLmLYbrofb5z7DftrPDGuhHjxnjX+tNiZIWIrnxAFAfkUk7SkcGBY8VyDm7Xh7n
	V8at6f6sUID2vO70coQvZsOK3V78BYcb9VYNss0oWcPoF0myWcpYq5PdCOouRlg50b1Zme6kkWfXA
	8TPjQtwLYTQAt3RCGFFa/kIMw8jlCCFrNxH7aLWtR7gynC25IJb13ViLAH7ZQtLgCCXGUxPraJFst
	MryI45NxswDDb0mKuIfZKOvUc3+4qdh5dWyUaIsziNiOtM0ClC9SCLnqryVTNM9y2tCao2sVl/zOl
	qoOa8SZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMN3e-000000087Qr-1M6B;
	Fri, 21 Nov 2025 09:03:58 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMN3b-000000087Q2-250w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 09:03:56 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5959b2f3fc9so1739214e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 01:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763715833; x=1764320633; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcWFlcuSs7Y0eO4oq2DsaroJj7DisvwmuRZnugA2UKI=;
        b=p0NzS16/L0HImRYWDoPCYSj5qkhwDLbdrgVBmBOoGvVW/LoFBtQbqbYCH4kTFDBlS3
         mM6ZTLZHdBTXZiwg1QlN++kA5qRn8Yuo0zh66hamGG2m1tOdGpYfkeAbGXMQ31CCXmf9
         IwRwWO4jnWiqah8OJMTgb+/LSxRMxyBQmZ1y8ZkNLhtCggbkZ3sBOyYxjJ8Viwdvxy0U
         2O2M8Kfdd2tXkgPMgpwCLHIONfir6kUWM3U8Jz/xBBE9Dyekht+yAK/mhwFsILqmQozg
         1deKR98rN0OHnughSuikk++wscAyLCAuYrkzigjvUKtUN5TyJoDCmYnKtmXyOl2GZVhP
         LPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763715833; x=1764320633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qcWFlcuSs7Y0eO4oq2DsaroJj7DisvwmuRZnugA2UKI=;
        b=hZbFxx2O3vaARzJZSzbLVD8bwPdp9ClghBik6FHNG45PHKo5++MF4HUJMVIwJPrayG
         ovEbA+9QpAiVQrV7xX7hOFHp6euDhGVjTtB/FU08z2AXBrf5Oq61G0av7S5kxsurztm8
         Liga4Ii1NWtUfX4s/T5rap8xr69Z1ii9r4Z4TqmntiYrxI9itqIvh+z/v+2sYAKYBdRx
         lRSTWgr/qsQayYD8o0DhfSDZp0JbkniU/XMn8OVK6fGjBhRTy8QIqYHVdtqBL+h3JYn6
         F1IqjMJLjPh1iAfG3UNY9l8kzsQ/fR6Yjk16eUum+dyKK/1rvyCObG38oStnRAu2fyWH
         Bcxg==
X-Forwarded-Encrypted: i=1; AJvYcCXK2XUmMDoCnxjt/FMr0dXoDWPebgHi/Ha9/ygnWrZlbzx/OU0gUCTlmrFlfpR7ny3cZgJygphcTldJGMqVZ5xf@lists.infradead.org
X-Gm-Message-State: AOJu0YyW6GQ2+dtQmP3qy3V6mHcfn0l++0Nhmy/fUiwrV4Q4Aimthc02
	BYFgAoNVU4OJdUnNm9SHBk0o9KzrjnLL2M+tP2kKwpEDzAn68EiFnYSW4tYTWZjbhue8p9sN6vy
	929ArqrK/Ap4bfIFojX21+PrT4mcV5HmhQjh7W1Ezng==
X-Gm-Gg: ASbGnctCJniXJpQOTbFJMInl0oM4KURkiWh9QZ2y+ZRiTeVLhirceraEHeCyNcCpnOt
	bnCUAiagQQ4PH9w0IQlmMlwIye2aniACYT+XAefou3cYbjpMlowj6UiDj9477lRiIkRWg3tzNlY
	zSxNOl4md0kWbMxDqaHml/bJZtepKPFbk2cbGmvBdv/qf1uozlGZXDAfU3tKvwbIxAAJ+RDetBx
	LxY0Lzb6AHNFk2EfAzhLLXDsM0VbtlcOm7jv26Ju/oXLjT83cHMtMfan7N4CVKLXI8ft+ORRNri
	oUtqZq7We0ajJy99zRP/ur0MsyE=
X-Google-Smtp-Source: AGHT+IG0xMLdX41Lvo7vBm08ZV8ZEpQ5JhaXD6X3/W4zoN34NhHz8H25fTpuCQYyNb+ut5xnYF/JFxp9/xuV++nbU+8=
X-Received: by 2002:a05:6512:e8c:b0:594:2f72:2f7b with SMTP id
 2adb3069b0e04-596a3e9fd96mr603564e87.6.1763715833160; Fri, 21 Nov 2025
 01:03:53 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org> <3b5d9df5-934d-4591-8827-6c9573a6f7ba@packett.cool>
In-Reply-To: <3b5d9df5-934d-4591-8827-6c9573a6f7ba@packett.cool>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Nov 2025 10:03:40 +0100
X-Gm-Features: AWmQ_bkRtfIm-ZUN8rNvHIz8drG7ooSNLpBN4-3cE0G66VIlgSyBd_sHX8YgQAA
Message-ID: <CAMRc=McHCG8N0zeVUUvYF+rHqBrBKe52o+pf+Hjp5dnG3+NmjA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Val Packett <val@packett.cool>
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
X-CRM114-CacheID: sfid-20251121_010355_680544_1E6A7B7E 
X-CRM114-Status: GOOD (  19.37  )
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

On Fri, Nov 21, 2025 at 1:28=E2=80=AFAM Val Packett <val@packett.cool> wrot=
e:
>
> Hi,
>
> On 11/12/25 10:55 AM, Bartosz Golaszewski wrote:
> > ---
> > Bartosz Golaszewski (10):
> >        string: provide strends()
> >        gpiolib: define GPIOD_FLAG_SHARED
> >        gpiolib: implement low-level, shared GPIO support
> >        gpio: shared-proxy: implement the shared GPIO proxy driver
> >        gpiolib: support shared GPIOs in core subsystem code
> >        gpio: provide gpiod_is_shared()
> >        arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
> >        ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO =
lookup
> >        ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO =
lookup
> >        regulator: make the subsystem aware of shared GPIOs
>
> this seems to actually have caused a regression for me, audio does not
> initialize anymore on hamoa due to EBUSY since upgrading
> from next-20251114 to next-20251118 or next-20251120:
>

Thanks for the heads-up.

> [   11.748781] platform
> 6800000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 3=
0
> [   11.785864] wsa_macro 6aa0000.codec: using zero-initialized flat
> cache, this may cause unexpected behavior
> [   11.796964] reset-gpio reset-gpio.0: error -EBUSY: Could not get
> reset gpios
> [   11.796984] reset-gpio reset-gpio.0: probe with driver reset-gpio
> failed with error -16
> [   11.894662] reset-gpio reset-gpio.1: error -EBUSY: Could not get
> reset gpios
> [   11.894676] reset-gpio reset-gpio.1: probe with driver reset-gpio
> failed with error -16

It seems like it's the reset-gpio driver, not shared GPIOLIB path?
This driver has never used the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag.

> [   12.006938] wcd938x_codec audio-codec: bound sdw:2:0:0217:010d:00:4
> (ops wcd_sdw_component_ops [snd_soc_wcd_common])
> [   12.006964] wcd938x_codec audio-codec: bound sdw:3:0:0217:010d:00:3
> (ops wcd_sdw_component_ops [snd_soc_wcd_common])
> [   15.424657] qcom-soundwire 6ab0000.soundwire: qcom_swrm_irq_handler:
> SWR CMD error, fifo status 0x4e00c00f, flushing fifo
> [   21.994354] qcom-soundwire 6ab0000.soundwire: qcom_swrm_irq_handler:
> SWR CMD error, fifo status 0xe00c000, flushing fifo
> [   21.996001] qcom-soundwire 6b10000.soundwire: qcom_swrm_irq_handler:
> SWR CMD error, fifo status 0x4e00c00f, flushing fifo
> [   21.996239] platform sound: deferred probe pending: snd-x1e80100: WSA
> Playback: codec dai not found
> [   21.996248] soundwire sdw:4:0:0217:0204:00:0: deferred probe pending:
> wsa884x-codec: Failed to get reset
> [   21.996250] soundwire sdw:4:0:0217:0204:00:1: deferred probe pending:
> wsa884x-codec: Failed to get reset
> [   21.996251] soundwire sdw:1:0:0217:0204:00:0: deferred probe pending:
> wsa884x-codec: Failed to get reset
> [   21.996253] soundwire sdw:1:0:0217:0204:00:1: deferred probe pending:
> wsa884x-codec: Failed to get reset
>
> gpio_shared_proxy, reset_gpio, pinctrl_sm8550_lpass_lpi are all built as
> modules and were autoloaded fine.
>
> This is wsa884x (not wsa881x nor wsa883x), failing in
> devm_reset_control_get_optional_shared..
>

Can you enable DEBUG_GPIO in menuconfig and post the entire kernel log
somewhere as well as the output of gpiodetect and gpioinfo after
booting?

Bartosz

