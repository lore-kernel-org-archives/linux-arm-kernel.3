Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE666E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 11:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rWpW7afdP6kA7HxL0T8y7xuvgGWUAI5NAoNUPzS1Gw=; b=HfeB3lPaXVlsNkZ6eo/eZwDkJK
	aj+YGtOF93OuXTZF/G6i9DSSQU9cLItPwbB5RTRXi3WMhR5SStPNDPdmPgdLLWXsFzfwognh5y7Tl
	Kv7aFd/Ar6hgOXChWtmclfqhUFzw/8BVxJbNcQR8mPQvoTGO0KVUDBuw39MXVg2FgRhK2h4QLi7H9
	LK1fGVyLG6sTxMD8ODfQF+eCaNsJk088Xb67eRdttibrJ6kwUrYA2PkbYLAsOPQmJqbv1OBEg1/+H
	MhhCi/I1NRnMGc7CJvEHhwZh1h3QheA+RiOH2b11i6lnMALvLxbN2/0nmkxlKjjvYESC83VEmYbyV
	q6Z0GDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXevq-00000008E6W-2gu8;
	Tue, 14 Jan 2025 11:18:02 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeuZ-00000008Du8-0xaE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 11:16:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43635796b48so32994605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 03:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736853401; x=1737458201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rWpW7afdP6kA7HxL0T8y7xuvgGWUAI5NAoNUPzS1Gw=;
        b=2EtLqglPfjdHT28HO2ALeJ7oXIb0QxC7Pep5QeuItioO+GH1AoaCPcCf+hwkJHO+gS
         JevNosOF5SrkFwoXIa0kCL6H2eeIwpMuNg9uN4TL00EyluWCHvmvQxGeT9O59x37CJep
         WbqSQCk08p6jsFunPyfY8uwXNrTO8w4Pp1pM6FFLYBEZ7vpR8xigITyxptnIwwU2XxBS
         5gpxDUGFpdgVoJ3bQa/2crUu+qoFRvx8eYGph2xUXJ+BN3FUgr6Ogc2wS7oKycBLzeSU
         6EbEuONzroi/1SUGpmcGz1atppCxZo3sHksMLUF4GiT/TX3AHn54wPSNF2yKgufYCQF1
         7zNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736853401; x=1737458201;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4rWpW7afdP6kA7HxL0T8y7xuvgGWUAI5NAoNUPzS1Gw=;
        b=r4DW7lCoCfgXfMKJ2HRWd/plfrmSh0r0V73JwMcM7wgHdbP+AaU2zxu/JGGHmdTtvG
         OdwhkUrRAA/Funnlnle8CETP14A17dm6FJT09+OMRDHH1JZnjCHilIWX4JMHawxfBcYW
         +v3S6Lp3yHlv/HqGnRWLme5TRa389HHc/9SGFcsy0a93WL83sFV4eAACq1CdEtbY3VWG
         rhMcBugN3rpBtndgOJUYiTx7TuWSnAdF8RbWUBG7OScJ10LTyEdo+OvmMsXpNfex0gd+
         C8e3BT0LVvDLSYiDMUxtSww3E9SUpyRgAb4Pyw9lhUEAH1H/TTsit6BOis/pfLkvs4h0
         umoA==
X-Forwarded-Encrypted: i=1; AJvYcCXdrl5OTgV1rQXlnm7kLH2QQh1WiD42SwszSRfj5h3qCMYOaJoUrDK23fr4WDp6n0bZwjm2YKhMLAyqrRROV0ha@lists.infradead.org
X-Gm-Message-State: AOJu0YyAypwnWi6Bndggdac5V+yHg+/85sSGxWc3wEv2+eRacW3Ux8BL
	AqcHzOycKg/Us3UDuGMVzu/8aDRVZQrHumpddesGWEQsaFExt+le1/LXdy5KMTA=
X-Gm-Gg: ASbGncuTawJC5YeDdw97G/3zZ2w5d3h5Mz1lBTDwZUTfwFR1vNBPBd0No3rgKBR4ig/
	XcsJW2YqeTIJNUckxlOF15OIhxAdgX9x5t/Nh4DSgQE50meBGI3LWY4e8QxQ9g9M/8ClP2gGv7l
	n9OIuPh/tUyy2Tb1eAgw6z48hYZPqxwCdCr5PpiwevAYBz+QeqVXF7VTpaNtflN3lm96VHiY6SD
	+B6clQZQCb/9SlniBpZGKQoYrJpwKdNgvuz2UwPeobfNmIK2KOWo0ZB
X-Google-Smtp-Source: AGHT+IHLRn1recYcjel2xFHuhyArfGR+H7/7Uz8y4LDnPl/zwW3c00VR6BRi94sqmifx2Saq6CpNfw==
X-Received: by 2002:a05:600c:3b86:b0:434:f3d8:62db with SMTP id 5b1f17b1804b1-436e9d6963amr164049635e9.2.1736853401362;
        Tue, 14 Jan 2025 03:16:41 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:317c:3d93:b7d4:96cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89dfesm207607585e9.32.2025.01.14.03.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 03:16:40 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-sound@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: Add Amlogic S4 Audio
In-Reply-To: <813e2564-8c4c-4adb-8184-ab88156e3e4c@amlogic.com> (Jiebing
	Chen's message of "Tue, 14 Jan 2025 16:52:30 +0800")
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
	<20250113-audio_drvier-v1-3-8c14770f38a0@amlogic.com>
	<1jldve939f.fsf@starbuckisacylon.baylibre.com>
	<813e2564-8c4c-4adb-8184-ab88156e3e4c@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 14 Jan 2025 12:16:40 +0100
Message-ID: <1jmsft7ihz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_031643_501779_B9F7B435 
X-CRM114-Status: GOOD (  23.21  )
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

On Tue 14 Jan 2025 at 16:52, Jiebing Chen <jiebing.chen@amlogic.com> wrote:

> =E5=9C=A8 2025/1/13 22:50, Jerome Brunet =E5=86=99=E9=81=93:
>> [ EXTERNAL EMAIL ]
>>
>> On Mon 13 Jan 2025 at 14:35, jiebing chen via B4 Relay <devnull+jiebing.=
chen.amlogic.com@kernel.org> wrote:
>>
>>> From: jiebing chen <jiebing.chen@amlogic.com>
>>>
>>> Add basic audio driver support for the Amlogic S4 based Amlogic
>>> AQ222 board.
>>>
>>> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
>>> ---
>>>   .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 226 ++++++++++++
>>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 385 ++++++++++++=
++++++++-
>>>   2 files changed, 610 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/ar=
ch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>> index 6730c44642d2910d42ec0c4adf49fefc3514dbec..32f50a5b860435d50d9c552=
8b43422b705b20130 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>> @@ -75,6 +75,19 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>>>               regulator-always-on;
>>>        };
>>>
>>> +     vcc5v_reg: regulator-vcc-5v {
>>> +             compatible =3D "regulator-fixed";
>>> +             vin-supply =3D <&main_12v>;
>>> +             regulator-name =3D "VCC5V";
>>> +             regulator-min-microvolt =3D <5000000>;
>>> +             regulator-max-microvolt =3D <5000000>;
>>> +             gpio =3D <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
>>> +             startup-delay-us =3D <7000>;
>>> +             enable-active-high;
>>> +             regulator-boot-on;
>>> +             regulator-always-on;
>>> +     };
>>> +
>>>        /* SY8120B1ABC DC/DC Regulator. */
>>>        vddcpu: regulator-vddcpu {
>>>                compatible =3D "pwm-regulator";
>>> @@ -129,6 +142,219 @@ vddcpu: regulator-vddcpu {
>>>                                <699000 98>,
>>>                                <689000 100>;
>>>        };
>>> +     dmics: audio-codec-1 {
>>> +             compatible =3D "dmic-codec";
>>> +             #sound-dai-cells =3D <0>;
>>> +             num-channels =3D <2>;
>>> +             wakeup-delay-ms =3D <50>;
>>> +             sound-name-prefix =3D "MIC";
>>> +     };
>>> +
>>> +     dioo2133: audio-amplifier-0 {
>>> +             compatible =3D "simple-audio-amplifier";
>>> +             enable-gpios =3D <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
>>> +             VCC-supply =3D <&vcc5v_reg>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "10U2";
>>> +     };
>>> +
>>> +     spdif_dir: audio-spdif-in {
>>> +             compatible =3D "linux,spdif-dir";
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "DIR";
>>> +     };
>>> +
>>> +     spdif_dit: audio-spdif-out {
>>> +             compatible =3D "linux,spdif-dit";
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "DIT";
>>> +     };
>>> +
>>> +     sound {
>>> +             compatible =3D "amlogic,axg-sound-card";
>>> +             model =3D "aq222";
>>> +             audio-widgets =3D "Line", "Lineout";
>>> +             audio-aux-devs =3D <&tdmout_a>, <&tdmout_b>, <&tdmout_c>,
>>> +                              <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
>>> +                              <&tdmin_lb>, <&dioo2133>, <&tdmout_pad>,=
 <&toacodec>;
>>> +             audio-routing =3D "TDMOUT_A IN 0", "FRDDR_A OUT 0",
>>> +                             "TDMOUT_A IN 1", "FRDDR_B OUT 0",
>>> +                             "TDMOUT_A IN 2", "FRDDR_C OUT 0",
>>> +                             "TDM_A Playback", "TDMOUT_A OUT",
>>> +                             "TDMA_OUT SEL",   "TDM_A Playback",
>>> +                             "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>>> +                             "TDMOUT_B IN 1", "FRDDR_B OUT 1",
>>> +                             "TDMOUT_B IN 2", "FRDDR_C OUT 1",
>>> +                             "TDM_B Playback", "TDMOUT_B OUT",
>>> +                             "TDMB_OUT SEL",   "TDM_B Playback",
>>> +                             "TDMOUT_C IN 0", "FRDDR_A OUT 2",
>>> +                             "TDMOUT_C IN 1", "FRDDR_B OUT 2",
>>> +                             "TDMOUT_C IN 2", "FRDDR_C OUT 2",
>>> +                             "TDM_C Playback", "TDMOUT_C OUT",
>>> +                             "TDMC_OUT SEL",   "TDM_C Playback",
>>> +                             "TOACODEC TDMA", "TDM_A Playback",
>>> +                             "TOACODEC TDMB", "TDM_B Playback",
>>> +                             "TOACODEC TDMC", "TDM_C Playback",
>>> +                             "SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
>>> +                             "SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>>> +                             "SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
>>> +                             "SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
>>> +                             "SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
>>> +                             "SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
>>> +                             "TDMIN_A IN 0", "TDM_A Capture",
>>> +                             "TDMIN_A IN 1", "TDM_B Capture",
>>> +                             "TDMIN_A IN 2", "TDM_C Capture",
>>> +                             "TDMIN_A IN 3", "TDM_A Loopback",
>>> +                             "TDMIN_A IN 4", "TDM_B Loopback",
>>> +                             "TDMIN_A IN 5", "TDM_C Loopback",
>>> +                             "TDMIN_B IN 0", "TDM_A Capture",
>>> +                             "TDMIN_B IN 1", "TDM_B Capture",
>>> +                             "TDMIN_B IN 2", "TDM_C Capture",
>>> +                             "TDMIN_B IN 3", "TDM_A Loopback",
>>> +                             "TDMIN_B IN 4", "TDM_B Loopback",
>>> +                             "TDMIN_B IN 5", "TDM_C Loopback",
>>> +                             "TDMIN_C IN 0", "TDM_A Capture",
>>> +                             "TDMIN_C IN 1", "TDM_B Capture",
>>> +                             "TDMIN_C IN 2", "TDM_C Capture",
>>> +                             "TDMIN_C IN 3", "TDM_A Loopback",
>>> +                             "TDMIN_C IN 4", "TDM_B Loopback",
>>> +                             "TDMIN_C IN 5", "TDM_C Loopback",
>>> +                             "TDMIN_LB IN 3", "TDM_A Capture",
>>> +                             "TDMIN_LB IN 4", "TDM_B Capture",
>>> +                             "TDMIN_LB IN 5", "TDM_C Capture",
>>> +                             "TDMIN_LB IN 0", "TDM_A Loopback",
>>> +                             "TDMIN_LB IN 1", "TDM_B Loopback",
>>> +                             "TDMIN_LB IN 2", "TDM_C Loopback",
>>> +                             "TODDR_A IN 0", "TDMIN_A OUT",
>>> +                             "TODDR_B IN 0", "TDMIN_A OUT",
>>> +                             "TODDR_C IN 0", "TDMIN_A OUT",
>>> +                             "TODDR_A IN 1", "TDMIN_B OUT",
>>> +                             "TODDR_B IN 1", "TDMIN_B OUT",
>>> +                             "TODDR_C IN 1", "TDMIN_B OUT",
>>> +                             "TODDR_A IN 2", "TDMIN_C OUT",
>>> +                             "TODDR_B IN 2", "TDMIN_C OUT",
>>> +                             "TODDR_C IN 2", "TDMIN_C OUT",
>>> +                             "TODDR_A IN 3", "SPDIFIN Capture",
>>> +                             "TODDR_B IN 3", "SPDIFIN Capture",
>>> +                             "TODDR_C IN 3", "SPDIFIN Capture",
>>> +                             "TODDR_A IN 6", "TDMIN_LB OUT",
>>> +                             "TODDR_B IN 6", "TDMIN_LB OUT",
>>> +                             "TODDR_C IN 6", "TDMIN_LB OUT",
>>> +                             "10U2 INL", "ACODEC LOLP",
>>> +                             "10U2 INR", "ACODEC LORP",
>>> +                             "Lineout", "10U2 OUTL",
>>> +                             "Lineout", "10U2 OUTR";
>>> +             assigned-clocks =3D <&clkc_pll CLKID_HIFI_PLL>,
>>> +                               <&clkc_pll CLKID_MPLL2>,
>>> +                               <&clkc_pll CLKID_MPLL0>,
>>> +                               <&clkc_pll CLKID_MPLL1>;
>>> +             assigned-clock-rates =3D <491520000>,
>>> +                                    <294912000>,
>>> +                                    <270950400>,
>>> +                                    <393216000>;
>> Why do you need 4 base rates ? Which rate family does each provide ?
>
> hifipll 49152000, mpll2 294912000 mpll0 270950400, mpll1 393216000, the
> accuracy of hifipll
>
> is relatively high, for tdm/pdm/spdif 16/48/96/192k we can use it. if the
> tdm and spdif work on

It is fine to use the HiFi. I'm glad this clock finally got fixed

>
> the same time, for example ,tdm 48k. spdif 44.1k, we can't use the same
> pll, so spdif need use the mpll 0
>
> other pll , only set a default value, at the latest chip, we remove all
> mpll for hardware, only two hifipll

I'm not sure you understand how this works.
There is 3 families of audio rate: 48kHz, 44.1kHz and 32kHz

Each family needs a PLL assigned, so you need 3, not 4, unless there is
another specific rate family you want to support. If that's the case,
document it.

Setting the rate of the PLL should follow this principle:
* Family rate
  - multiplied by (32 x 24): to accomodate different sample sizes
  - multiplied by 2 until you reach the maximum rate of selected PLLs
    This allows to support rates such 192k or even 768k

491520000 is not dividable by 3, it won't allow 24 bits words. It is a
poor choice.

Have a look at the s400 for an example using the HiFi PLL. The axg was
restricted to a 68 PLL multiplier but the S4 is not so you should be
able to use a higher base rate (4 718 592 000 Hz), providing better
accuracy in the end

>
>>> +
>>> +             dai-link-0 {
>>> +                     sound-dai =3D <&frddr_a>;
>>> +             };
>>> +
>>> +             dai-link-1 {
>>> +                     sound-dai =3D <&frddr_b>;
>>> +             };
>>> +
>>> +             dai-link-2 {
>>> +                     sound-dai =3D <&frddr_c>;
>>> +             };
>>> +
>>> +             dai-link-3 {
>>> +                     sound-dai =3D <&toddr_a>;
>>> +             };
>>> +
>>> +             dai-link-4 {
>>> +                     sound-dai =3D <&toddr_b>;
>>> +             };
>>> +
>>> +             dai-link-5 {
>>> +                     sound-dai =3D <&toddr_c>;
>>> +             };
>>> +
>>> +             /* Connected to the WIFI/BT chip */
>>> +             dai-link-6 {
>>> +                     sound-dai =3D <&tdmif_a>;
>>> +                     dai-format =3D "dsp_a";
>>> +                     dai-tdm-slot-tx-mask-0 =3D <1 1>;
>>> +                     mclk-fs =3D <256>;
>>> +                     codec-0 {
>>> +                             sound-dai =3D <&tohdmitx TOHDMITX_I2S_IN_=
A>;
>>> +                     };
>>> +             };
>>> +
>>> +             /* Connected to the onboard AD82584F DAC */
>>> +             dai-link-7 {
>>> +                     sound-dai =3D <&tdmif_b>;
>>> +                     dai-format =3D "i2s";
>>> +                     dai-tdm-slot-tx-mask-0 =3D <1 1>;
>>> +                     mclk-fs =3D <256>;
>>> +
>>> +                     codec-0 {
>>> +                             sound-dai =3D <&acodec>;
>>> +                     };
>>> +
>>> +                     codec-1 {
>>> +                             sound-dai =3D <&tohdmitx TOHDMITX_I2S_IN_=
B>;
>>> +                     };
>>> +             };
>>> +
>>> +             /* 8ch HDMI interface */
>>> +             dai-link-8 {
>>> +                     sound-dai =3D <&tdmif_c>;
>>> +                     dai-format =3D "i2s";
>>> +                     dai-tdm-slot-tx-mask-0 =3D <1 1>;
>>> +                     dai-tdm-slot-tx-mask-1 =3D <1 1>;
>>> +                     dai-tdm-slot-tx-mask-2 =3D <1 1>;
>>> +                     dai-tdm-slot-tx-mask-3 =3D <1 1>;
>>> +                     mclk-fs =3D <256>;
>>> +
>>> +                     codec-0 {
>>> +                             sound-dai =3D <&acodec>;
>>> +                     };
>>> +
>>> +                     codec-1 {
>>> +                             sound-dai =3D <&tohdmitx TOHDMITX_I2S_IN_=
C>;
>>> +                     };
>>> +             };
>>> +
>>> +             /* spdif hdmi and coax output */
>>> +             dai-link-9 {
>>> +                     sound-dai =3D <&spdifout_a>;
>>> +
>>> +                     codec-0 {
>>> +                             sound-dai =3D <&spdif_dit>;
>>> +                     };
>>> +
>>> +                     codec-1 {
>>> +                             sound-dai =3D <&tohdmitx TOHDMITX_SPDIF_I=
N_A>;
>>> +                     };
>>> +             };
>>> +
>>> +             /* spdif hdmi interface */
>>> +             dai-link-10 {
>>> +                     sound-dai =3D <&spdifout_b>;
>>> +
>>> +                     codec {
>>> +                             sound-dai =3D <&tohdmitx TOHDMITX_SPDIF_I=
N_B>;
>>> +                     };
>>> +             };
>>> +
>>> +             /* spdif coax input */
>>> +             dai-link-11 {
>>> +                     sound-dai =3D <&spdifin>;
>>> +
>>> +                     codec {
>>> +                             sound-dai =3D <&spdif_dir>;
>>> +                     };
>>> +             };
>>> +     };
>>> +
>>>   };
>>>
>>>   &pwm_ef {
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boo=
t/dts/amlogic/meson-s4.dtsi
>>> index 957577d986c0675a503115e1ccbc4387c2051620..87a00ace23131e31822bb43=
fbe956b8abcbaef40 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>> @@ -11,7 +11,11 @@
>>>   #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>>   #include <dt-bindings/power/meson-s4-power.h>
>>>   #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
>>> -
>>> +#include <dt-bindings/clock/axg-audio-clkc.h>
>>> +#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
>>> +#include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
>>> +#include <dt-bindings/sound/meson-g12a-toacodec.h>
>>> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>>>   / {
>>>        cpus {
>>>                #address-cells =3D <2>;
>>> @@ -46,6 +50,42 @@ cpu3: cpu@3 {
>>>                };
>>>        };
>>>
>>> +     tdmif_a: audio-controller-0 {
>>> +             compatible =3D "amlogic,axg-tdm-iface";
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "TDM_A";
>>> +             clocks =3D <&clkc_audio AUD_CLKID_MST_A_MCLK>,
>>> +                      <&clkc_audio AUD_CLKID_MST_A_SCLK>,
>>> +                      <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
>>> +             clock-names =3D "mclk", "sclk", "lrclk";
>>> +             assigned-clocks =3D <&clkc_audio AUD_CLKID_MST_A_MCLK_SEL=
>;
>>> +             assigned-clock-parents =3D <&clkc_pll CLKID_HIFI_PLL>;
>> Based on clock provider used, I doubt this is of any use.
>
> if not set the mclk parent. we dump clk_summary, the default parent is mp=
ll
> 0
>
> we tend=C2=A0 to use hifipll

Have you really tested this ? Master clocks do reparent to the appropriate =
PLL
depending on the rate required, this is how it has always worked.

>>
>>> +     };
>>> +
>>> +     tdmif_b: audio-controller-1 {
>>> +             compatible =3D "amlogic,axg-tdm-iface";
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "TDM_B";
>>> +             clocks =3D <&clkc_audio AUD_CLKID_MST_B_MCLK>,
>>> +                      <&clkc_audio AUD_CLKID_MST_B_SCLK>,
>>> +                      <&clkc_audio AUD_CLKID_MST_B_LRCLK>;
>>> +             clock-names =3D "mclk", "sclk", "lrclk";
>>> +             assigned-clocks =3D <&clkc_audio AUD_CLKID_MST_B_MCLK_SEL=
>;
>>> +             assigned-clock-parents =3D <&clkc_pll CLKID_HIFI_PLL>;
>>> +     };
>>> +
>>> +     tdmif_c: audio-controller-2 {
>>> +             compatible =3D "amlogic,axg-tdm-iface";
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "TDM_C";
>>> +             clocks =3D <&clkc_audio AUD_CLKID_MST_C_MCLK>,
>>> +                      <&clkc_audio AUD_CLKID_MST_C_SCLK>,
>>> +                      <&clkc_audio AUD_CLKID_MST_C_LRCLK>;
>>> +             clock-names =3D "mclk", "sclk", "lrclk";
>>> +             assigned-clocks =3D <&clkc_audio AUD_CLKID_MST_C_MCLK_SEL=
>;
>>> +             assigned-clock-parents =3D <&clkc_pll CLKID_HIFI_PLL>;
>>> +     };
>>> +
>>>        timer {
>>>                compatible =3D "arm,armv8-timer";
>>>                interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ=
_TYPE_LEVEL_LOW)>,
>>> @@ -850,3 +890,346 @@ emmc: mmc@fe08c000 {
>>>                };
>>>        };
>>>   };
>>> +
>>> +&apb4 {
>>> +     audio: bus@330000 {
>>> +             compatible =3D "simple-bus";
>>> +             reg =3D <0x0 0x330000 0x0 0x1000>;
>>> +             #address-cells =3D <2>;
>>> +             #size-cells =3D <2>;
>>> +             ranges =3D <0x0 0x0 0x0 0x330000 0x0 0x1000>;
>>> +
>>> +             clkc_audio: clock-controller@0 {
>>> +                     compatible =3D "amlogic,sm1-audio-clkc";
>> I suspect the DT folks would like having SoC specific compatible in
>> addition to the fall back. In that case, I think that would be wise. I
>> doubt the compatibility will hold in the long run.
>>
>> Same goes for the other HW components.
>
> you are right, for s4 , some clock is different, we will add the
> "amlogic,s4-audio-clkc"
>
> this is a base clk for tdm
>
>>
>>> +                     reg =3D <0x0 0x0 0x0 0xb4>;
>>> +                     #clock-cells =3D <1>;
>>> +                     #reset-cells =3D <1>;
>>> +                     power-domains =3D <&pwrc PWRC_S4_AUDIO_ID>;
>>> +                     clocks =3D <&clkc_periphs CLKID_AUDIO>,
>>> +                              <&clkc_pll CLKID_MPLL0>,
>>> +                              <&clkc_pll CLKID_MPLL1>,
>>> +                              <&clkc_pll CLKID_MPLL2>,
>>> +                              <&clkc_pll CLKID_MPLL3>,
>>> +                              <&clkc_pll CLKID_HIFI_PLL>,
>>> +                              <&clkc_pll CLKID_FCLK_DIV3>,
>>> +                              <&clkc_pll CLKID_FCLK_DIV4>,
>>> +                              <&clkc_pll CLKID_FCLK_DIV5>;
>>> +                     clock-names =3D "pclk",
>>> +                                   "mst_in0",
>>> +                                   "mst_in1",
>>> +                                   "mst_in2",
>>> +                                   "mst_in3",
>>> +                                   "mst_in4",
>>> +                                   "mst_in5",
>>> +                                   "mst_in6",
>>> +                                   "mst_in7";
>>> +
>>> +                     resets =3D <&reset RESET_AUDIO>;
>>> +             };
>>> +
>>> +             toddr_a: audio-controller@100 {
>>> +                     compatible =3D "amlogic,sm1-toddr",
>>> +                                  "amlogic,axg-toddr";
>>> +                     reg =3D <0x0 0x100 0x0 0x2c>;
>>> +                     #sound-dai-cells =3D <0>;
>>> +                     sound-name-prefix =3D "TODDR_A";
>>> +                     interrupts =3D <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_TODDR_A>;
>>> +                     resets =3D <&arb AXG_ARB_TODDR_A>,
>>> +                              <&clkc_audio AUD_RESET_TODDR_A>;
>>> +                     reset-names =3D "arb", "rst";
>>> +                     amlogic,fifo-depth =3D <8192>;
>>> +             };
>>> +
>>> +             toddr_b: audio-controller@140 {
>>> +                     compatible =3D "amlogic,sm1-toddr",
>>> +                                  "amlogic,axg-toddr";
>>> +                     reg =3D <0x0 0x140 0x0 0x2c>;
>>> +                     #sound-dai-cells =3D <0>;
>>> +                     sound-name-prefix =3D "TODDR_B";
>>> +                     interrupts =3D <GIC_SPI 33 IRQ_TYPE_EDGE_RISING>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_TODDR_B>;
>>> +                     resets =3D <&arb AXG_ARB_TODDR_B>,
>>> +                              <&clkc_audio AUD_RESET_TODDR_B>;
>>> +                     reset-names =3D "arb", "rst";
>>> +                     amlogic,fifo-depth =3D <256>;
>>> +             };
>>> +
>>> +             toddr_c: audio-controller@180 {
>>> +                     compatible =3D "amlogic,sm1-toddr",
>>> +                                  "amlogic,axg-toddr";
>>> +                     reg =3D <0x0 0x180 0x0 0x2c>;
>>> +                     #sound-dai-cells =3D <0>;
>>> +                     sound-name-prefix =3D "TODDR_C";
>>> +                     interrupts =3D <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_TODDR_C>;
>>> +                     resets =3D <&arb AXG_ARB_TODDR_C>,
>>> +                              <&clkc_audio AUD_RESET_TODDR_C>;
>>> +                     reset-names =3D "arb", "rst";
>>> +                     amlogic,fifo-depth =3D <256>;
>>> +             };
>>> +
>>> +             frddr_a: audio-controller@1c0 {
>>> +                     compatible =3D "amlogic,sm1-frddr",
>>> +                                  "amlogic,axg-frddr";
>>> +                     reg =3D <0x0 0x1c0 0x0 0x2c>;
>>> +                     #sound-dai-cells =3D <0>;
>>> +                     sound-name-prefix =3D "FRDDR_A";
>>> +                     interrupts =3D <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_FRDDR_A>;
>>> +                     resets =3D <&arb AXG_ARB_FRDDR_A>,
>>> +                              <&clkc_audio AUD_RESET_FRDDR_A>;
>>> +                     reset-names =3D "arb", "rst";
>>> +                     amlogic,fifo-depth =3D <512>;
>>> +             };
>>> +
>>> +             frddr_b: audio-controller@200 {
>>> +                     compatible =3D "amlogic,sm1-frddr",
>>> +                                  "amlogic,axg-frddr";
>>> +                     reg =3D <0x0 0x200 0x0 0x2c>;
>>> +                     #sound-dai-cells =3D <0>;
>>> +                     sound-name-prefix =3D "FRDDR_B";
>>> +                     interrupts =3D <GIC_SPI 37 IRQ_TYPE_EDGE_RISING>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_FRDDR_B>;
>>> +                     resets =3D <&arb AXG_ARB_FRDDR_B>,
>>> +                              <&clkc_audio AUD_RESET_FRDDR_B>;
>>> +                     reset-names =3D "arb", "rst";
>>> +                     amlogic,fifo-depth =3D <256>;
>>> +             };
>>> +
>>> +             frddr_c: audio-controller@240 {
>>> +                     compatible =3D "amlogic,sm1-frddr",
>>> +                                  "amlogic,axg-frddr";
>>> +                     reg =3D <0x0 0x240 0x0 0x2c>;
>>> +                     #sound-dai-cells =3D <0>;
>>> +                     sound-name-prefix =3D "FRDDR_C";
>>> +                     interrupts =3D <GIC_SPI 38 IRQ_TYPE_EDGE_RISING>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_FRDDR_C>;
>>> +                     resets =3D <&arb AXG_ARB_FRDDR_C>,
>>> +                              <&clkc_audio AUD_RESET_FRDDR_C>;
>>> +                     reset-names =3D "arb", "rst";
>>> +                     amlogic,fifo-depth =3D <256>;
>>> +             };
>>> +
>>> +             arb: reset-controller@280 {
>>> +                     compatible =3D "amlogic,meson-sm1-audio-arb";
>>> +                     reg =3D <0x0 0x280 0x0 0x4>;
>>> +                     #reset-cells =3D <1>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_DDR_ARB>;
>>> +             };
>>> +
>>> +             tdmin_a: audio-controller@300 {
>>> +                     compatible =3D "amlogic,sm1-tdmin",
>>> +                                  "amlogic,axg-tdmin";
>>> +                     reg =3D <0x0 0x300 0x0 0x40>;
>>> +                     sound-name-prefix =3D "TDMIN_A";
>>> +                     resets =3D <&clkc_audio AUD_RESET_TDMIN_A>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_TDMIN_A>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_A_SCLK>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_A_SCLK_SEL>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>;
>>> +                     clock-names =3D "pclk", "sclk", "sclk_sel",
>>> +                                   "lrclk", "lrclk_sel";
>>> +             };
>>> +
>>> +             tdmin_b: audio-controller@340 {
>>> +                     compatible =3D "amlogic,sm1-tdmin",
>>> +                                  "amlogic,axg-tdmin";
>>> +                     reg =3D <0x0 0x340 0x0 0x40>;
>>> +                     sound-name-prefix =3D "TDMIN_B";
>>> +                     resets =3D <&clkc_audio AUD_RESET_TDMIN_B>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_TDMIN_B>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_B_SCLK>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_B_SCLK_SEL>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>;
>>> +                     clock-names =3D "pclk", "sclk", "sclk_sel",
>>> +                                   "lrclk", "lrclk_sel";
>>> +             };
>>> +
>>> +             tdmin_c: audio-controller@380 {
>>> +                     compatible =3D "amlogic,sm1-tdmin",
>>> +                                  "amlogic,axg-tdmin";
>>> +                     reg =3D <0x0 0x380 0x0 0x40>;
>>> +                     sound-name-prefix =3D "TDMIN_C";
>>> +                     resets =3D <&clkc_audio AUD_RESET_TDMIN_C>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_TDMIN_C>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_C_SCLK>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_C_SCLK_SEL>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>;
>>> +                     clock-names =3D "pclk", "sclk", "sclk_sel",
>>> +                                   "lrclk", "lrclk_sel";
>>> +             };
>>> +
>>> +             tdmin_lb: audio-controller@3c0 {
>>> +                     compatible =3D "amlogic,sm1-tdmin",
>>> +                                  "amlogic,axg-tdmin";
>>> +                     reg =3D <0x0 0x3c0 0x0 0x40>;
>>> +                     sound-name-prefix =3D "TDMIN_LB";
>>> +                     resets =3D <&clkc_audio AUD_RESET_TDMIN_LB>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_TDMIN_LB>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK_SEL=
>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>,
>>> +                              <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>;
>>> +                     clock-names =3D "pclk", "sclk", "sclk_sel",
>>> +                                   "lrclk", "lrclk_sel";
>>> +             };
>>> +
>>> +             spdifin: audio-controller@400 {
>>> +                     compatible =3D "amlogic,g12a-spdifin",
>>> +                                  "amlogic,axg-spdifin";
>>> +                     reg =3D <0x0 0x400 0x0 0x30>;
>>> +                     #sound-dai-cells =3D <0>;
>>> +                     sound-name-prefix =3D "SPDIFIN";
>>> +                     interrupts =3D <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_SPDIFIN>,
>>> +                     <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
>>> +                     clock-names =3D "pclk", "refclk";
>>> +                     resets =3D <&clkc_audio AUD_RESET_SPDIFIN>;
>>> +             };
>>> +
>>> +             spdifout_a: audio-controller@480 {
>>> +                     compatible =3D "amlogic,g12a-spdifout",
>>> +                                  "amlogic,axg-spdifout";
>>> +                     reg =3D <0x0 0x480 0x0 0x50>;
>>> +                     #sound-dai-cells =3D <0>;
>>> +                     sound-name-prefix =3D "SPDIFOUT_A";
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_SPDIFOUT>,
>>> +                     <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
>>> +                     clock-names =3D "pclk", "mclk";
>>> +                     resets =3D <&clkc_audio AUD_RESET_SPDIFOUT>;
>>> +             };
>>> +
>>> +             tdmout_a: audio-controller@500 {
>>> +                     compatible =3D "amlogic,sm1-tdmout";
>>> +                     reg =3D <0x0 0x500 0x0 0x40>;
>>> +                     sound-name-prefix =3D "TDMOUT_A";
>>> +                     resets =3D <&clkc_audio AUD_RESET_TDMOUT_A>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_TDMOUT_A>,
>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL=
>,
>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
>>> +                     clock-names =3D "pclk", "sclk", "sclk_sel",
>>> +                                   "lrclk", "lrclk_sel";
>>> +             };
>>> +
>>> +             tdmout_b: audio-controller@540 {
>>> +                     compatible =3D "amlogic,sm1-tdmout";
>>> +                     reg =3D <0x0 0x540 0x0 0x40>;
>>> +                     sound-name-prefix =3D "TDMOUT_B";
>>> +                     resets =3D <&clkc_audio AUD_RESET_TDMOUT_B>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_TDMOUT_B>,
>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK>,
>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK_SEL=
>,
>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>,
>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>;
>>> +                     clock-names =3D "pclk", "sclk", "sclk_sel",
>>> +                                   "lrclk", "lrclk_sel";
>>> +             };
>>> +
>>> +             tdmout_c: audio-controller@580 {
>>> +                     compatible =3D "amlogic,sm1-tdmout";
>>> +                     reg =3D <0x0 0x580 0x0 0x40>;
>>> +                     sound-name-prefix =3D "TDMOUT_C";
>>> +                     resets =3D <&clkc_audio AUD_RESET_TDMOUT_C>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_TDMOUT_C>,
>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK>,
>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK_SEL=
>,
>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>,
>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>;
>>> +                     clock-names =3D "pclk", "sclk", "sclk_sel",
>>> +                                   "lrclk", "lrclk_sel";
>>> +             };
>>> +
>>> +             spdifout_b: audio-controller@680 {
>>> +                     compatible =3D "amlogic,g12a-spdifout",
>>> +                                  "amlogic,axg-spdifout";
>>> +                     reg =3D <0x0 0x680 0x0 0x50>;
>>> +                     #sound-dai-cells =3D <0>;
>>> +                     sound-name-prefix =3D "SPDIFOUT_B";
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
>>> +                              <&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
>>> +                     clock-names =3D "pclk", "mclk";
>>> +                     resets =3D <&clkc_audio AUD_RESET_SPDIFOUT_B>;
>>> +             };
>>> +
>>> +             toacodec: audio-controller@740 {
>>> +                     compatible =3D "amlogic,s4-tocodec";
>>> +                     reg =3D <0x0 0x740 0x0 0x4>;
>>> +                     sound-name-prefix =3D "TOACODEC";
>>> +                     resets =3D <&clkc_audio AUD_RESET_TOACODEC>;
>>> +             };
>>> +
>>> +             tohdmitx: audio-controller@744 {
>>> +                     compatible =3D "amlogic,sm1-tohdmitx",
>>> +                                  "amlogic,g12a-tohdmitx";
>>> +                     reg =3D <0x0 0x744 0x0 0x4>;
>>> +                     #sound-dai-cells =3D <1>;
>>> +                     sound-name-prefix =3D "TOHDMITX";
>>> +                     resets =3D <&clkc_audio AUD_RESET_TOHDMITX>;
>>> +             };
>>> +
>>> +             toddr_d: audio-controller@840 {
>>> +                     compatible =3D "amlogic,sm1-toddr",
>>> +                                  "amlogic,axg-toddr";
>>> +                     reg =3D <0x0 0x840 0x0 0x2c>;
>>> +                     #sound-dai-cells =3D <0>;
>>> +                     sound-name-prefix =3D "TODDR_D";
>>> +                     interrupts =3D <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_TODDR_D>;
>>> +                     resets =3D <&arb AXG_ARB_TODDR_D>,
>>> +                              <&clkc_audio AUD_RESET_TODDR_D>;
>>> +                     reset-names =3D "arb", "rst";
>>> +                     amlogic,fifo-depth =3D <256>;
>>> +             };
>>> +
>>> +             frddr_d: audio-controller@880 {
>>> +                      compatible =3D "amlogic,sm1-frddr",
>>> +                                   "amlogic,axg-frddr";
>>> +                     reg =3D <0x0 0x880 0x0 0x2c>;
>>> +                     #sound-dai-cells =3D <0>;
>>> +                     sound-name-prefix =3D "FRDDR_D";
>>> +                     interrupts =3D <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
>>> +                     clocks =3D <&clkc_audio AUD_CLKID_FRDDR_D>;
>>> +                     resets =3D <&arb AXG_ARB_FRDDR_D>,
>>> +                              <&clkc_audio AUD_RESET_FRDDR_D>;
>>> +                     reset-names =3D "arb", "rst";
>>> +                     amlogic,fifo-depth =3D <256>;
>>> +             };
>>> +
>>> +             tdmout_pad: audio-controller@E58 {
>>> +                     compatible =3D "amlogic,s4-tdmout-pad";
>>> +                     reg =3D <0x0 0xe58 0x0 0x28>;
>>> +             };
>>> +     };
>>> +
>>> +     pdm: audio-controller@331000 {
>>> +             compatible =3D "amlogic,sm1-pdm",
>>> +                          "amlogic,axg-pdm";
>>> +             reg =3D <0x0 0x331000 0x0 0x34>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "PDM";
>>> +             clocks =3D <&clkc_audio AUD_CLKID_PDM>,
>>> +                      <&clkc_audio AUD_CLKID_PDM_DCLK>,
>>> +                      <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
>>> +             clock-names =3D "pclk", "dclk", "sysclk";
>>> +             resets =3D <&clkc_audio AUD_RESET_PDM>;
>>> +             assigned-clocks =3D <&clkc_audio AUD_CLKID_PDM_DCLK_SEL>,
>>> +                               <&clkc_audio AUD_CLKID_PDM_SYSCLK_SEL>;
>>> +             assigned-clock-parents =3D <&clkc_pll CLKID_HIFI_PLL>,<&c=
lkc_pll CLKID_HIFI_PLL>;
>>> +     };
>>> +      acodec: audio-controller@1A000 {
>>> +             compatible =3D "amlogic,t9015";
>>> +             reg =3D <0x0 0x1A000 0x0 0x14>;
>>> +             #sound-dai-cells =3D <0>;
>>> +             sound-name-prefix =3D "ACODEC";
>>> +             clocks =3D <&clkc_periphs CLKID_ACODEC>;
>>> +             clock-names =3D "pclk";
>>> +             resets =3D <&reset RESET_ACODEC>;
>>> +     };
>>> +
>>> +};
>> --
>> Jerome

--=20
Jerome

