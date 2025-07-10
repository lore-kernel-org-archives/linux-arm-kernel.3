Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F87C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 10:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUuAt9yoULAsrC8c3pYmkWi5uj4/OLlfz9YbcHuy4x0=; b=wbCcf4PTa2qeCfjGY/99cAkTCP
	Grg6DEcFwimV5/q39jOX62ff+JuV+Z6viGmDwjHYWGkB+X8Aef1QworuHDRce/i8rBNrWFJ5Kx06Y
	JccpW1xXFplMm27V9a+GrJne7gAWdiOeJsqVY7ye2/v9Zyo8hnAIj4fJmSF9u2n/Pp3WHiD5W1MMn
	p4ewR7Ac5N3qtiU782SQLM6KUx/vMVSaUWi4n5TOpRsKAyAQysvtW3Tl1C+BHHsdHOpxebiMVz7nJ
	SqyJLkx4JvPyUAMPoklwZ5XgL4TOGTmy+731o9aZ9G/nSGqYdl17rMGiTAmZEh9/0VGOawlM8b3kj
	XkAZUAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZold-0000000BWJh-3hlf;
	Thu, 10 Jul 2025 10:44:41 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnS0-0000000BKCF-1cu3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 09:20:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso438279f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 02:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752139219; x=1752744019; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUuAt9yoULAsrC8c3pYmkWi5uj4/OLlfz9YbcHuy4x0=;
        b=FW0t+Wdu+cLkCWoKaGy7nVlPna5ofopMcTRCeyU/5IMIz/3x6FnlKuuMLz/QnOMDiP
         kIta8bFx6foL2DAA0RGichRUyenQNfWULlD1TmIacZVaL/nyPL8M1kaCZsBU0OwCas6A
         Zjl3fmz0l4cB1Zw0Y8OSQASepfovnGC3snVVAy27WJbSsoxlinw3ObKQmHCVBl+7utFf
         y9HCFORH2jkK9jKMUZwTpD8bsIwyf27AUjzhZq2JAmtxwo5VYc7QQgO+JGTON5QelQ1F
         iBsClJujDKVHN+iijufMM9xBDOxk/05wXRiEwXEJ5Ygqtf+oyWahNt6FasUm7ZfiM/Lv
         ueKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139219; x=1752744019;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUuAt9yoULAsrC8c3pYmkWi5uj4/OLlfz9YbcHuy4x0=;
        b=MILZdxPliLaZOtxwru27/NwNVnsOq0CB3JfUByDzPvPa1MeSELt3Bi1Nq9ctHYeQG/
         KcsJv3Ky3jbwj32j00qT6OsgrgmdIr69ozVQXfiEc6LhoU+i59yIXAXcFRfoYl/Gl1ft
         17jBPt2uP5O2ToyrKqvsfrWOBcjh+oYbypOV/vE0SbO33tgKl4fFIloacncdMQeAmC1Z
         HPWAheuEUpj2N68AWxGV4Mu3BPrjdplSPRlsRT3wWq0hPXBWZ0niL6+30TRJEYPNE/1Z
         ElSCgVnDDdjO0Inc3UptRkQGvHOm6pkWdSJTYLQvOtC+xPdNZP8mfKE6MT8R4IiKWCqU
         H9dw==
X-Forwarded-Encrypted: i=1; AJvYcCUXWLAmpmrXx3mgI5NwVxvfdtGuPGWf2DqwRejmAneaYoJsSDs4mYYioo8yOqVUUgndDLgA68j0jl93+7L6EC2Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxpopKxYx95r14hvXp/IuBuui2fJZHH8QMYLTOf+/kU1J5xFp+r
	+W8nFYwBtZubQ85Ag7u7SlUv7RN/NiGNZqxU5pIDGjMkKZ8ObnAX2S0QwPhFvpZpvfc=
X-Gm-Gg: ASbGncsxm/lIXOEiEqvgsbqbLpI2bTdquBMpkTXCWUHt1ICpkNwdrpt5jCSDlHwMDgW
	QqW6V/HTk1OV16TZGOcQBY1pkHYvOLkM9Yxeap8tJyf+aT2Iev4AxkBcqZqzkvWA+FbKTNRsHAQ
	KFgG0rTURmOUwF+/0tKHHDTGshiXinLrAhgH/dUXkdxfxvyxIgu9Xp1oRD8hWzTsP5R/ZTl6qZi
	4+nQm91rFYAZFBqkHpV+Rgr0b2C5FzzO3P3j/Mubq8DnmPEiXiJmB8rEEGcobchUjFPVTvOq8nk
	ySL5dubs5qQjrYkhgFuMxGSmNmko5LsyAqMC+Qi7atvfyD6BYwWEPWU3LZEJarXNueeZLMHq
X-Google-Smtp-Source: AGHT+IE16GuOL1cK5fdl7Mr+ZvhesNcygvCIn3ibXh5yxUYyDaGsn57tDGrfSvUMLHrhy1OqBFoJJw==
X-Received: by 2002:a05:6000:25c1:b0:3a3:67bb:8f3f with SMTP id ffacd0b85a97d-3b5e453e795mr5404777f8f.53.1752139218654;
        Thu, 10 Jul 2025 02:20:18 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9fcc:5953:3d1a:6b41])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454d5103082sm51043555e9.29.2025.07.10.02.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:20:18 -0700 (PDT)
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
Subject: Re: [PATCH v5 6/6] arm64: dts: amlogic: Add Amlogic S4 Audio
In-Reply-To: <20250710-audio_drvier-v5-6-d4155f1e7464@amlogic.com> (jiebing
	chen via's message of "Thu, 10 Jul 2025 11:35:42 +0800")
References: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
	<20250710-audio_drvier-v5-6-d4155f1e7464@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 10 Jul 2025 11:20:17 +0200
Message-ID: <1jzfdcpfla.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_022020_450344_B9BAFFE8 
X-CRM114-Status: GOOD (  16.07  )
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

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> Add basic audio driver support for the Amlogic S4 based
> Amlogic AQ222 board.
>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 218 ++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 387 +++++++++++++++++++++
>  2 files changed, 605 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index 6730c44642d2910d42ec0c4adf49fefc3514dbec..47c6b8d63fdfca01281f0935f3dc419af6d86a25 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -75,6 +75,19 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>  	       regulator-always-on;
>  	};
>  
> +	vcc5v_reg: regulator-vcc-5v {
> +		compatible = "regulator-fixed";
> +		vin-supply = <&main_12v>;
> +		regulator-name = "VCC5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us = <7000>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>  	/* SY8120B1ABC DC/DC Regulator. */
>  	vddcpu: regulator-vddcpu {
>  		compatible = "pwm-regulator";
> @@ -129,6 +142,211 @@ vddcpu: regulator-vddcpu {
>  				<699000 98>,
>  				<689000 100>;
>  	};
> +	dmics: audio-codec-1 {
> +		compatible = "dmic-codec";
> +		#sound-dai-cells = <0>;
> +		num-channels = <2>;
> +		wakeup-delay-ms = <50>;
> +		sound-name-prefix = "MIC";
> +	};
> +
> +	dioo2133: audio-amplifier-0 {
> +		compatible = "simple-audio-amplifier";
> +		enable-gpios = <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
> +		VCC-supply = <&vcc5v_reg>;
> +		sound-name-prefix = "10U2";
> +	};
> +
> +	spdif_dir: audio-spdif-in {
> +		compatible = "linux,spdif-dir";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "DIR";
> +	};
> +
> +	spdif_dit: audio-spdif-out {
> +		compatible = "linux,spdif-dit";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "DIT";
> +	};
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "aq222";
> +		audio-widgets = "Line", "Lineout";
> +		audio-aux-devs = <&tdmout_a>, <&tdmout_b>, <&tdmout_c>,
> +				 <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
> +				 <&tdmin_lb>, <&dioo2133>;
> +		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
> +				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
> +				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
> +				"TDM_A Playback", "TDMOUT_A OUT",
> +				"TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT",
> +				"TDMOUT_C IN 0", "FRDDR_A OUT 2",
> +				"TDMOUT_C IN 1", "FRDDR_B OUT 2",
> +				"TDMOUT_C IN 2", "FRDDR_C OUT 2",
> +				"TDM_C Playback", "TDMOUT_C OUT",
> +				"SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
> +				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
> +				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
> +				"SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
> +				"SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
> +				"SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
> +				"TDMIN_A IN 0", "TDM_A Capture",
> +				"TDMIN_A IN 1", "TDM_B Capture",
> +				"TDMIN_A IN 2", "TDM_C Capture",
> +				"TDMIN_A IN 3", "TDM_A Loopback",
> +				"TDMIN_A IN 4", "TDM_B Loopback",
> +				"TDMIN_A IN 5", "TDM_C Loopback",
> +				"TDMIN_B IN 0", "TDM_A Capture",
> +				"TDMIN_B IN 1", "TDM_B Capture",
> +				"TDMIN_B IN 2", "TDM_C Capture",
> +				"TDMIN_B IN 3", "TDM_A Loopback",
> +				"TDMIN_B IN 4", "TDM_B Loopback",
> +				"TDMIN_B IN 5", "TDM_C Loopback",
> +				"TDMIN_C IN 0", "TDM_A Capture",
> +				"TDMIN_C IN 1", "TDM_B Capture",
> +				"TDMIN_C IN 2", "TDM_C Capture",
> +				"TDMIN_C IN 3", "TDM_A Loopback",
> +				"TDMIN_C IN 4", "TDM_B Loopback",
> +				"TDMIN_C IN 5", "TDM_C Loopback",
> +				"TDMIN_LB IN 3", "TDM_A Capture",
> +				"TDMIN_LB IN 4", "TDM_B Capture",
> +				"TDMIN_LB IN 5", "TDM_C Capture",
> +				"TDMIN_LB IN 0", "TDM_A Loopback",
> +				"TDMIN_LB IN 1", "TDM_B Loopback",
> +				"TDMIN_LB IN 2", "TDM_C Loopback",
> +				"TODDR_A IN 0", "TDMIN_A OUT",
> +				"TODDR_B IN 0", "TDMIN_A OUT",
> +				"TODDR_C IN 0", "TDMIN_A OUT",
> +				"TODDR_A IN 1", "TDMIN_B OUT",
> +				"TODDR_B IN 1", "TDMIN_B OUT",
> +				"TODDR_C IN 1", "TDMIN_B OUT",
> +				"TODDR_A IN 2", "TDMIN_C OUT",
> +				"TODDR_B IN 2", "TDMIN_C OUT",
> +				"TODDR_C IN 2", "TDMIN_C OUT",
> +				"TODDR_A IN 3", "SPDIFIN Capture",
> +				"TODDR_B IN 3", "SPDIFIN Capture",
> +				"TODDR_C IN 3", "SPDIFIN Capture",
> +				"TODDR_A IN 6", "TDMIN_LB OUT",
> +				"TODDR_B IN 6", "TDMIN_LB OUT",
> +				"TODDR_C IN 6", "TDMIN_LB OUT",
> +				"10U2 INL", "ACODEC LOLP",
> +				"10U2 INR", "ACODEC LORP",
> +				"Lineout", "10U2 OUTL",
> +				"Lineout", "10U2 OUTR";
> +		assigned-clocks = <&clkc_pll CLKID_HIFI_PLL>,
> +				  <&clkc_pll CLKID_MPLL0>,
> +				  <&clkc_pll CLKID_MPLL1>;
> +		assigned-clock-rates = <1179648000>,
> +				       <270950400>,
> +				       <338688000>;
> +
> +		dai-link-0 {
> +			sound-dai = <&frddr_a>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&frddr_b>;
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&frddr_c>;
> +		};
> +
> +		dai-link-3 {
> +			sound-dai = <&toddr_a>;
> +		};
> +
> +		dai-link-4 {
> +			sound-dai = <&toddr_b>;
> +		};
> +
> +		dai-link-5 {
> +			sound-dai = <&toddr_c>;
> +		};
> +
> +		dai-link-6 {
> +			sound-dai = <&tdmif_a>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			mclk-fs = <256>;
> +			codec-0 {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
> +			};
> +			codec-1 {
> +				sound-dai = <&toacodec TOACODEC_IN_A>;
> +			};
> +		};
> +
> +		dai-link-7 {
> +			sound-dai = <&tdmif_b>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			mclk-fs = <256>;
> +			codec-0 {
> +				sound-dai = <&toacodec TOACODEC_IN_B>;
> +			};
> +			codec-1 {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> +			};
> +		};
> +
> +		/* 8ch HDMI interface */
> +		dai-link-8 {
> +			sound-dai = <&tdmif_c>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			dai-tdm-slot-tx-mask-1 = <1 1>;
> +			dai-tdm-slot-tx-mask-2 = <1 1>;
> +			dai-tdm-slot-tx-mask-3 = <1 1>;
> +			mclk-fs = <256>;
> +			codec-0 {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
> +			};
> +		};
> +
> +		/* spdif hdmi and coax output */
> +		dai-link-9 {
> +			sound-dai = <&spdifout_a>;
> +
> +			codec-0 {
> +				sound-dai = <&spdif_dit>;
> +			};
> +
> +			codec-1 {
> +				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
> +			};
> +		};
> +
> +		/* spdif hdmi interface */
> +		dai-link-10 {
> +			sound-dai = <&spdifout_b>;
> +
> +			codec {
> +				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
> +			};
> +		};
> +
> +		/* spdif coax input */
> +		dai-link-11 {
> +			sound-dai = <&spdifin>;
> +
> +			codec {
> +				sound-dai = <&spdif_dir>;
> +			};
> +		};
> +
> +		dai-link-12 {
> +			sound-dai = <&toacodec TOACODEC_OUT>;
> +
> +			codec {
> +				sound-dai = <&acodec>;
> +			};
> +		};
> +	};
>  };
>  
>  &pwm_ef {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 957577d986c0675a503115e1ccbc4387c2051620..3af2fb333cf7b1ca35f1ff7ad8479bcd859e608a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -11,6 +11,11 @@
>  #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>  #include <dt-bindings/power/meson-s4-power.h>
>  #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
> +#include <dt-bindings/clock/axg-audio-clkc.h>
> +#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
> +#include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
> +#include <dt-bindings/sound/meson-g12a-toacodec.h>
> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>  
>  / {
>  	cpus {
> @@ -849,4 +854,386 @@ emmc: mmc@fe08c000 {
>  			status = "disabled";
>  		};
>  	};
> +
> +	tdmif_a: audio-controller-0 {
> +		compatible = "amlogic,axg-tdm-iface";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "TDM_A";
> +		clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_A_MCLK>;
> +		clock-names = "sclk", "lrclk","mclk";
> +	};
> +
> +	tdmif_b: audio-controller-1 {
> +		compatible = "amlogic,axg-tdm-iface";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "TDM_B";
> +		clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_B_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_B_MCLK>;
> +		clock-names = "sclk", "lrclk","mclk";
> +	};
> +
> +	tdmif_c: audio-controller-2 {
> +		compatible = "amlogic,axg-tdm-iface";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "TDM_C";
> +		clocks = <&clkc_audio AUD_CLKID_MST_C_SCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_C_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_C_MCLK>;
> +		clock-names = "sclk", "lrclk","mclk";
> +	};
> +};
> +
> +&apb4 {
> +	acodec: audio-controller@1a000 {
> +		compatible = "amlogic,t9015";
> +		reg = <0x0 0x1A000 0x0 0x14>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "ACODEC";
> +		clocks = <&clkc_periphs CLKID_ACODEC>;
> +		clock-names = "pclk";
> +		resets = <&reset RESET_ACODEC>;
> +		AVDD-supply = <&vddio_ao1v8>;
> +	};
> +
> +	clkc_audio: clock-controller@330000 {
> +		compatible = "amlogic,s4-audio-clkc";
> +		reg = <0x0 0x330000 0x0 0xd8>,
> +			  <0x0 0x330e80 0x0 0x10>;
> +		#clock-cells = <1>;
> +		#reset-cells = <1>;
> +		power-domains = <&pwrc PWRC_S4_AUDIO_ID>;
> +		clocks = <&clkc_periphs CLKID_AUDIO>,
> +			 <&clkc_pll CLKID_MPLL0>,
> +			 <&clkc_pll CLKID_MPLL1>,
> +			 <&clkc_pll CLKID_MPLL2>,
> +			 <&clkc_pll CLKID_MPLL3>,
> +			 <&clkc_pll CLKID_HIFI_PLL>,
> +			 <&clkc_pll CLKID_FCLK_DIV3>,
> +			 <&clkc_pll CLKID_FCLK_DIV4>,
> +			 <&clkc_pll CLKID_FCLK_DIV5>;
> +		clock-names = "pclk",
> +				  "mst_in0",
> +				  "mst_in1",
> +				  "mst_in2",
> +				  "mst_in3",
> +				  "mst_in4",
> +				  "mst_in5",
> +				  "mst_in6",
> +				  "mst_in7";
> +
> +		resets = <&reset RESET_AUDIO>;
> +	};
> +
> +	clock-controller@330e80 {
> +		compatible = "amlogic,clock-pads-clkc";
> +		reg = <0x0 0x330e80 0x0 0x10>;
> +		#clock-cells = <1>;
> +		power-domains = <&pwrc PWRC_S4_AUDIO_ID>;
> +		clocks = <&clkc_periphs CLKID_AUDIO>,
> +			 <&clkc_pll CLKID_MPLL0>,
> +			 <&clkc_pll CLKID_MPLL1>,
> +			 <&clkc_pll CLKID_MPLL2>,
> +			 <&clkc_pll CLKID_MPLL3>,
> +			 <&clkc_pll CLKID_HIFI_PLL>,
> +			 <&clkc_pll CLKID_FCLK_DIV3>,
> +			 <&clkc_pll CLKID_FCLK_DIV4>,
> +			 <&clkc_pll CLKID_FCLK_DIV5>;
> +		clock-names = "pclk",
> +				  "mst_in0",
> +				  "mst_in1",
> +				  "mst_in2",
> +				  "mst_in3",
> +				  "mst_in4",
> +				  "mst_in5",
> +				  "mst_in6",
> +				  "mst_in7";

Assuming I understood where you are tyring to go with this, those are
not the input in of this clock controller. The only reason *may* have
worked is because you referenced the clock by names instead of fwname

> +	};
> +
> +	toddr_a: audio-controller@330100 {
> +		compatible = "amlogic,sm1-toddr",
> +				 "amlogic,axg-toddr";
> +		reg = <0x0 0x330100 0x0 0x2c>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "TODDR_A";
> +		interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
> +		resets = <&arb AXG_ARB_TODDR_A>,
> +			 <&clkc_audio AUD_RESET_TODDR_A>;
> +		reset-names = "arb", "rst";
> +		amlogic,fifo-depth = <8192>;
> +	};
> +
> +	toddr_b: audio-controller@330140 {
> +		compatible = "amlogic,sm1-toddr",
> +				 "amlogic,axg-toddr";
> +		reg = <0x0 0x330140 0x0 0x2c>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "TODDR_B";
> +		interrupts = <GIC_SPI 33 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
> +		resets = <&arb AXG_ARB_TODDR_B>,
> +			 <&clkc_audio AUD_RESET_TODDR_B>;
> +		reset-names = "arb", "rst";
> +		amlogic,fifo-depth = <256>;
> +	};
> +
> +	toddr_c: audio-controller@330180 {
> +		compatible = "amlogic,sm1-toddr",
> +				 "amlogic,axg-toddr";
> +		reg = <0x0 0x330180 0x0 0x2c>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "TODDR_C";
> +		interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&clkc_audio AUD_CLKID_TODDR_C>;
> +		resets = <&arb AXG_ARB_TODDR_C>,
> +			 <&clkc_audio AUD_RESET_TODDR_C>;
> +		reset-names = "arb", "rst";
> +		amlogic,fifo-depth = <256>;
> +	};
> +
> +	frddr_a: audio-controller@3301c0 {
> +		compatible = "amlogic,sm1-frddr",
> +				 "amlogic,axg-frddr";
> +		reg = <0x0 0x3301c0 0x0 0x2c>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "FRDDR_A";
> +		interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
> +		resets = <&arb AXG_ARB_FRDDR_A>,
> +			 <&clkc_audio AUD_RESET_FRDDR_A>;
> +		reset-names = "arb", "rst";
> +		amlogic,fifo-depth = <512>;
> +	};
> +
> +	frddr_b: audio-controller@330200 {
> +		compatible = "amlogic,sm1-frddr",
> +				 "amlogic,axg-frddr";
> +		reg = <0x0 0x330200 0x0 0x2c>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "FRDDR_B";
> +		interrupts = <GIC_SPI 37 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
> +		resets = <&arb AXG_ARB_FRDDR_B>,
> +			 <&clkc_audio AUD_RESET_FRDDR_B>;
> +		reset-names = "arb", "rst";
> +		amlogic,fifo-depth = <256>;
> +	};
> +
> +	frddr_c: audio-controller@330240 {
> +		compatible = "amlogic,sm1-frddr",
> +				 "amlogic,axg-frddr";
> +		reg = <0x0 0x330240 0x0 0x2c>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "FRDDR_C";
> +		interrupts = <GIC_SPI 38 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&clkc_audio AUD_CLKID_FRDDR_C>;
> +		resets = <&arb AXG_ARB_FRDDR_C>,
> +			 <&clkc_audio AUD_RESET_FRDDR_C>;
> +		reset-names = "arb", "rst";
> +		amlogic,fifo-depth = <256>;
> +	};
> +
> +	arb: reset-controller@330280 {
> +		compatible = "amlogic,meson-sm1-audio-arb";
> +		reg = <0x0 0x330280 0x0 0x4>;
> +		#reset-cells = <1>;
> +		clocks = <&clkc_audio AUD_CLKID_DDR_ARB>;
> +	};
> +
> +	tdmin_a: audio-controller@330300 {
> +		compatible = "amlogic,sm1-tdmin";
> +		reg = <0x0 0x330300 0x0 0x40>;
> +		sound-name-prefix = "TDMIN_A";
> +		resets = <&clkc_audio AUD_RESET_TDMIN_A>;
> +		clocks = <&clkc_audio AUD_CLKID_TDMIN_A>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_A_SCLK>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_A_SCLK_SEL>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>;
> +		clock-names = "pclk", "sclk", "sclk_sel",
> +				  "lrclk", "lrclk_sel";
> +	};
> +
> +	tdmin_b: audio-controller@330340 {
> +		compatible = "amlogic,sm1-tdmin";
> +		reg = <0x0 0x330340 0x0 0x40>;
> +		sound-name-prefix = "TDMIN_B";
> +		resets = <&clkc_audio AUD_RESET_TDMIN_B>;
> +		clocks = <&clkc_audio AUD_CLKID_TDMIN_B>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_B_SCLK>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_B_SCLK_SEL>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>;
> +		clock-names = "pclk", "sclk", "sclk_sel",
> +				  "lrclk", "lrclk_sel";
> +	};
> +
> +	tdmin_c: audio-controller@330380 {
> +		compatible = "amlogic,sm1-tdmin";
> +		reg = <0x0 0x330380 0x0 0x40>;
> +		sound-name-prefix = "TDMIN_C";
> +		resets = <&clkc_audio AUD_RESET_TDMIN_C>;
> +		clocks = <&clkc_audio AUD_CLKID_TDMIN_C>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_C_SCLK>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_C_SCLK_SEL>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>;
> +		clock-names = "pclk", "sclk", "sclk_sel",
> +				  "lrclk", "lrclk_sel";
> +	};
> +
> +	tdmin_lb: audio-controller@3303c0 {
> +		compatible = "amlogic,sm1-tdmin";
> +		reg = <0x0 0x3303c0 0x0 0x40>;
> +		sound-name-prefix = "TDMIN_LB";
> +		resets = <&clkc_audio AUD_RESET_TDMIN_LB>;
> +		clocks = <&clkc_audio AUD_CLKID_TDMIN_LB>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK_SEL>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>;
> +		clock-names = "pclk", "sclk", "sclk_sel",
> +				  "lrclk", "lrclk_sel";
> +	};
> +
> +	spdifin: audio-controller@330400 {
> +		compatible = "amlogic,g12a-spdifin",
> +				 "amlogic,axg-spdifin";
> +		reg = <0x0 0x330400 0x0 0x30>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "SPDIFIN";
> +		interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
> +		<&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
> +		clock-names = "pclk", "refclk";
> +		resets = <&clkc_audio AUD_RESET_SPDIFIN>;
> +	};
> +
> +	spdifout_a: audio-controller@330480 {
> +		compatible = "amlogic,g12a-spdifout",
> +				 "amlogic,axg-spdifout";
> +		reg = <0x0 0x330480 0x0 0x50>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "SPDIFOUT_A";
> +		clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
> +		<&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
> +		clock-names = "pclk", "mclk";
> +		resets = <&clkc_audio AUD_RESET_SPDIFOUT>;
> +	};
> +
> +	tdmout_a: audio-controller@330500 {
> +		compatible = "amlogic,sm1-tdmout";
> +		reg = <0x0 0x330500 0x0 0x40>;
> +		sound-name-prefix = "TDMOUT_A";
> +		resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
> +		clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
> +			 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
> +			 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
> +			 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
> +		clock-names = "pclk", "sclk", "sclk_sel",
> +				  "lrclk", "lrclk_sel";
> +	};
> +
> +	tdmout_b: audio-controller@330540 {
> +		compatible = "amlogic,sm1-tdmout";
> +		reg = <0x0 0x330540 0x0 0x40>;
> +		sound-name-prefix = "TDMOUT_B";
> +		resets = <&clkc_audio AUD_RESET_TDMOUT_B>;
> +		clocks = <&clkc_audio AUD_CLKID_TDMOUT_B>,
> +			 <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK>,
> +			 <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK_SEL>,
> +			 <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>;
> +		clock-names = "pclk", "sclk", "sclk_sel",
> +				  "lrclk", "lrclk_sel";
> +	};
> +
> +	tdmout_c: audio-controller@330580 {
> +		compatible = "amlogic,sm1-tdmout";
> +		reg = <0x0 0x330580 0x0 0x40>;
> +		sound-name-prefix = "TDMOUT_C";
> +		resets = <&clkc_audio AUD_RESET_TDMOUT_C>;
> +		clocks = <&clkc_audio AUD_CLKID_TDMOUT_C>,
> +			 <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK>,
> +			 <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK_SEL>,
> +			 <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>;
> +		clock-names = "pclk", "sclk", "sclk_sel",
> +				  "lrclk", "lrclk_sel";
> +	};
> +
> +	spdifout_b: audio-controller@330680 {
> +		compatible = "amlogic,g12a-spdifout",
> +				 "amlogic,axg-spdifout";
> +		reg = <0x0 0x330680 0x0 0x50>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "SPDIFOUT_B";
> +		clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
> +			 <&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
> +		clock-names = "pclk", "mclk";
> +		resets = <&clkc_audio AUD_RESET_SPDIFOUT_B>;
> +	};
> +
> +	toacodec: audio-controller@330740 {
> +		compatible = "amlogic,s4-toacodec",
> +				 "amlogic,g12a-toacodec";
> +		reg = <0x0 0x330740 0x0 0x4>;
> +		sound-name-prefix = "TOACODEC";
> +		#sound-dai-cells = <1>;
> +		resets = <&clkc_audio AUD_RESET_TOACODEC>;
> +	};
> +
> +	tohdmitx: audio-controller@330744 {
> +		compatible = "amlogic,sm1-tohdmitx",
> +				 "amlogic,g12a-tohdmitx";
> +		reg = <0x0 0x330744 0x0 0x4>;
> +		#sound-dai-cells = <1>;
> +		sound-name-prefix = "TOHDMITX";
> +		resets = <&clkc_audio AUD_RESET_TOHDMITX>;
> +	};
> +
> +	toddr_d: audio-controller@330840 {
> +		compatible = "amlogic,sm1-toddr",
> +				 "amlogic,axg-toddr";
> +		reg = <0x0 0x330840 0x0 0x2c>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "TODDR_D";
> +		interrupts = <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&clkc_audio AUD_CLKID_TODDR_D>;
> +		resets = <&arb AXG_ARB_TODDR_D>,
> +			 <&clkc_audio AUD_RESET_TODDR_D>;
> +		reset-names = "arb", "rst";
> +		amlogic,fifo-depth = <256>;
> +	};
> +
> +	frddr_d: audio-controller@330880 {
> +		 compatible = "amlogic,sm1-frddr",
> +				  "amlogic,axg-frddr";
> +		reg = <0x0 0x330880 0x0 0x2c>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "FRDDR_D";
> +		interrupts = <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&clkc_audio AUD_CLKID_FRDDR_D>;
> +		resets = <&arb AXG_ARB_FRDDR_D>,
> +			 <&clkc_audio AUD_RESET_FRDDR_D>;
> +		reset-names = "arb", "rst";
> +		amlogic,fifo-depth = <256>;
> +	};
> +
> +	pdm: audio-controller@331000 {
> +		compatible = "amlogic,sm1-pdm",
> +			     "amlogic,axg-pdm";
> +		reg = <0x0 0x331000 0x0 0x34>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "PDM";
> +		clocks = <&clkc_audio AUD_CLKID_PDM>,
> +			 <&clkc_audio AUD_CLKID_PDM_DCLK>,
> +			 <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
> +		clock-names = "pclk", "dclk", "sysclk";
> +		resets = <&clkc_audio AUD_RESET_PDM>;
> +	};
>  };

-- 
Jerome

