Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2BEC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 12:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0R0Hr4CE1RY0MwuVSGpjrdEwFEFKJYZxZJ8a7zSdbcY=; b=tUkVO4EZekanQZhqdXrAeLPQ7+
	wtlIqBhdXE4u7WWPfZiTugbkadoDi/+wgI1xtFOiWPIkCZw3wDyEfy7xNlUkmIVLRRrqgk8JemnO8
	XCRWtdCBrwHsh4mEMO35NJXJ6n9N8B+swrsyrXPEQpB2ZlYZYjVGQ7DXbepoAZpPvuRga18cAsp3+
	rz8Zk8XNAZ/Lvj9ndUEJiMiKt1LyNhQwdxF5C3U8BwdS5wMAKJJr3JCWdE3uATCoa6fqCRKgIsQ6M
	o4t9mZUjLw3E9YSTqdeiVwa3Soax9OvOUzoz6ZzdKuv7okcVNyBzgIQ/4g7Wp3Bu9c5rYkLHLH9AW
	hfIE5KSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZq3A-0000000Bij0-13M3;
	Thu, 10 Jul 2025 12:06:52 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZne4-0000000BM88-2CbU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 09:32:49 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so535992f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 02:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752139967; x=1752744767; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0R0Hr4CE1RY0MwuVSGpjrdEwFEFKJYZxZJ8a7zSdbcY=;
        b=vaciCoGuAYLKz4v6expMz7zzLrltMYOuMsfFBA723dUcSGer9xjakEwO4IWZFx0/4D
         fv88MvjxzGbY3pH152DY4r+1PNLk9WD5ZHz8b5hOlOy/OimmOaf4P6WU9yI3h/jNP86V
         6PgyN59eFDJsLr3ucTlvqdIRxKLBnEzRzTA6byr0wqzafYwxPOZyMIHc5StlQ7YzXdpG
         tK915+ry6lmBoT8vBn0UvagpU0tDJfeQR6m7NL048QwZCw3vO8OM8KxsqCJZqwZK/XPe
         UqrSaPBKMlzKhQsDhnkbOVZ/58eMDjVRRohrB0DcKUyVkU1bKLYLhSN4Y8goQS3ELv9c
         cFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139967; x=1752744767;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0R0Hr4CE1RY0MwuVSGpjrdEwFEFKJYZxZJ8a7zSdbcY=;
        b=BCjD8ZoFiVC3CHpY44dccOQ+5JpSJmxes7x/02yCpltLupZ0VDmHP6xwjqfesueCh4
         dhFPllFVY/Hpq/DzNb7pwXIDufjt30tAB0rV8QDTJYnK7+3SJtPIRZRAShn0Ig6/6/+5
         RuUKZ83mPYSyG9uUVzsDBOvgPKROJKqAGz8GNWQZDiY7gGUahizf+qjhOH+Rspo457O+
         FMADFJL5Fj/PAaSOpxOHExdGGRYMnwHmE+6znoS16suPz8KSBoURUilPFk2qR8k88eds
         8WtL6kRU7Pt2qIgjNVmLt8C/yBtRYls58gvoGLr0HfOfKbzf5EP1QJmu0wBFMGfJiVE8
         Vg6g==
X-Forwarded-Encrypted: i=1; AJvYcCUd60pUxeFDNIJfryno0ZKOXa1fv+YBhEcRjjwlHSWry3v1Ii8cYj9F3+v7+6CjSGkcYCEQELxYJK2J/Y+JKx5M@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/WV4GLklXFOcSNA+oSbijd35ItPbvbCpflRIijGhQTpayQkam
	pzsMn8yS2mgwSL4n0oIAeHEdwCnLugV+1konRK9LXCE39t3QYudMb7H4M340gL2/f34=
X-Gm-Gg: ASbGnctFULWMPgNYyJgzjo1wWREyHqB/sBhSKF8EHiyfG5a6e5xFhnit8H55XeHp2oR
	lLU1lhmgBXSI8oGJOyNviGfnwGmGPzIxpNgErCBX2m4uPhxYzv8vH6AxKqTW8XeSXSsIKytcsII
	tW26XkIedP6EsQmDnXMfXIP42BQno5yX77+QAkX58gBoSC+v0ucYQFSJlEgPrIOUUT/pg4SFpfY
	xO5DAR4X0Y2XYUvXM30gaRUy1D8MyOQM5+aLf1oKzD6N0MTUZzzS6ZRJczn//BmlpRA88aaMfX4
	9TfOCS8Ftn1dL6BaSqAvfcTnJxItZVM8G/+I+md1dy38ulbc0x/ki5+uSLXByA==
X-Google-Smtp-Source: AGHT+IE1D9auCg4xgGpZ6zuosoUHXOAtKOoG+1ROyX+EBevhLJgYW2QgO4A9PEzjJQELPZ9swbZlmg==
X-Received: by 2002:a05:6000:4a12:b0:3a5:2f23:3783 with SMTP id ffacd0b85a97d-3b5e44ea414mr5599937f8f.24.1752139966897;
        Thu, 10 Jul 2025 02:32:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9fcc:5953:3d1a:6b41])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc3a54sm1402833f8f.39.2025.07.10.02.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:32:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  jiebing.chen@amlogic.com,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  jian.xu@amlogic.com,  shuai.li@amlogic.com,
  zhe.wang@amlogic.com
Subject: Re: [PATCH v5 0/6] Add support for S4 audio
In-Reply-To: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com> (jiebing
	chen via's message of "Thu, 10 Jul 2025 11:35:36 +0800")
References: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 10 Jul 2025 11:32:45 +0200
Message-ID: <1jo6tspf0i.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_023248_568769_7F7A1A81 
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

On Thu 10 Jul 2025 at 11:35, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> This series completes the end-to-end audio support
> for S4 SoC from hardware bindings to driver implementation
> and system integration.
>
> 1 Device Tree Bindings Updates 
> Added audio power domain support for S4 SoC.Defined mclk/sclk pad clock IDs in AXG audio bindings.
> Add S4 audio tocodec binding support.
>
> 2 Driver Implementation
> Implemented S4 tocodec driver for G12A architecture.
> Add mclk pad divider support for S4 in AXG audio clock.
>
> 3 Device Tree Integration
> Add Amlogic S4 audio subsystem support in arm64 DTS.

Several subsystem in a single patchset spams a lot of people.
It is not strictly necessary here.

Ideally, one patchset per subsystem please.

>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
> Changes in v5:
> - Fix warning Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yam when make dt_binding_check
> - The audio reg is mounted below the APB bus in dts file.
> - Deal with pad clock in a distinct controller.
> - Fix warning for sound/soc/meson/g12a-toacodec.c
> - Link to v4: https://lore.kernel.org/r/20250319-audio_drvier-v4-0-686867fad719@amlogic.com
>
> Changes in v4:
> - fix dtb check warning 
> - add maxItems of power domain for dt-bindings
> - fixed audio clock pads regmap base and reg offset 
> - use dapm widget to control tocodec bclk and mclk enable
> - Link to v3: https://lore.kernel.org/r/20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com
>
> Changes in v3:
> - remove g12a tocodec switch event
> - Modify the incorrect title for dt-bindings
> - Link to v2: https://lore.kernel.org/r/20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com
>
> Changes in v2:
> - remove tdm pad control and change tocodec base on g12a
> - change hifipll rate to support 24bit
> - add s4 audio clock
> - Link to v1: https://lore.kernel.org/r/20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com
>
> ---
> jiebing chen (6):
>       dt-bindings: clock: meson: Add audio power domain for s4 soc
>       dt-bindings: clock: axg-audio: Add mclk and sclk pad clock ids
>       dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
>       ASoC: meson: g12a-toacodec: Add s4 tocodec driver
>       clk: meson: axg-audio: Add the mclk pad div for s4 chip
>       arm64: dts: amlogic: Add Amlogic S4 Audio
>
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  55 ++-
>  .../bindings/sound/amlogic,g12a-toacodec.yaml      |   1 +
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 218 +++++++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 387 ++++++++++++++++++
>  drivers/clk/meson/axg-audio.c                      | 435 ++++++++++++++++++++-
>  drivers/clk/meson/axg-audio.h                      |   6 +
>  include/dt-bindings/clock/axg-audio-clkc.h         |  11 +
>  sound/soc/meson/g12a-toacodec.c                    |  42 ++
>  8 files changed, 1152 insertions(+), 3 deletions(-)
> ---
> base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
> change-id: 20250110-audio_drvier-07a5381c494b
>
> Best regards,

-- 
Jerome

