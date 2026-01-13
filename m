Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F45AD29DEC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 08:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMKyGWxNAwt+GdnajQbomOj6BjeEvvPWy5yBEpV57ns=; b=QEWzI4wFe8ZcHaVmvXCVxAy8dN
	Lym1Q7cr/7ZbwFn5vZWno90mJ12fkXEbXcs9Tq+2edjgWrvu6cfwBlhdWFs4GSHFYpr0vGCZ0Nspp
	tR9EkdIkWNCTQGXwEK26OjafUF4QnbPItmHmhzQuohgDsZm2ILPbW6Y3YXv9NtGYVbAx16kCnOePv
	6hymkoJhpU+8nG7DLbbyHv79Vebd3OYIHkBupwcQujZ06tHCUTd93gskICrZuyuov7CZm6LR/Kfo1
	m6ybjzmCLli69mJziBVLZfpxBrW8Q7nnYzfEaD8c/3X4lRRQy3dumxSbyWZ8ngXEHFUkYtzpMpzKn
	yknyPDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaDd-00000006mmS-3zUF;
	Tue, 13 Jan 2026 08:57:41 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaDa-00000006ml9-2Ber
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 08:57:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so3688134f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 00:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768294656; x=1768899456; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMKyGWxNAwt+GdnajQbomOj6BjeEvvPWy5yBEpV57ns=;
        b=DdN2vAMn8WMGY39mo7LTSNAbrb5bdZ3UsAtRKvdzHD5AekVdtjQkIQMvQupTxUoJsR
         9Siw15jSI++31LDUcq5cOqQwsHeqXG7ceJvd80/1fopk8q27riLeU7/qSUBeSs/TSDZb
         TKFJJkZIiBOa8WHx9tG+5RmB45ocdlbmg/QlMMaWXYz3fBANbo5nsprGX+0aDpHlSu+n
         b+8FJh5TWVX38snjeBy0+Xbm7A+VsAKg7na54ZZhU6qeMOBDL2HhLeAn08iW+9PPO86X
         +1G0nwE5X2fg+CeKK+zsfhfyRThKZth9q0yiGjoF0heYtdzkG7fO+L+PigqFFXRmHmLn
         ud7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294656; x=1768899456;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZMKyGWxNAwt+GdnajQbomOj6BjeEvvPWy5yBEpV57ns=;
        b=ZIS4KIio0KMLR7GIF6XCpdM2Hbc4YVdqfTj7ziiZJdH5W5L6/wGs9/2aNLDi2gTZ6O
         C6vWdvgctDJlsWNphKjzz7Fhwb3kZYaVI1xXyO5Ss6CrbwG0wRADi39L8AvcOS7oPpJ0
         FXsDgHD3RR2GssxtKegg1hKfKiYPGfNOIhUvcXDyN7ud5xcVGv4iJj3MZDJVCDlAQFPl
         QMt9f4qOXq7TKDZPNvOfWor67zq1HO+mFBMDvyaxQotEsWVq/wxOSUlxLXEsUT12tbNv
         uQPu8uARuk1YoWKRUN3bWBuNtURbtXsuyAHwvCK5RBToYLqdN9FRF3WOrcPfQPInOcL4
         YZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdzzBsceAT577UQQhjeAwdCNmu/Jzr5xFkBAkZbTGsINR4sCc1sud5crfxqzi6+dXUzDWk46n21O34YaQAo6i7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6x6EgNqa8O2nYy7NZMNwZBeEy0+7uipeAUhF/1HkOqr+nGBJM
	0cVSL7m0lOt9UCfe1uqiw8XcFl3QhzhLjEfNDfLa/FcjH6W1qzufFWE7q7aDojAPdfM=
X-Gm-Gg: AY/fxX6p329kcRfvClHIuoSgTP/PpsVFiAJN6GUgm4IE3hOrAxQEiVTF8Lx+8kkfeV2
	FKhud2DdFVenK8t8tJUIPMKRjJgEEH/M9Ah3t5bqFCaO7ltUcs0nLQyFJbTDRlcuoYbH2gqTmr0
	URUmy//bKVBmDC4jrM8/SoZX0mkxVMBiBHwMi6Z4x83bYZwbnL9ssMf4AWhIlcAq6gcGhyc54tO
	vmhoR/pfsdW6WU0HXbpqkpc2c2l+vtC7QwE7BsEDsVPpA6OHCBYhV7yjDKCwynIMSI7X09/vkY6
	riSAosBFTmmOfGLvhfs4sMicEDRQW3Ns67eMdho+Deqh9xWlm5Mt4JEHISjRdZMBog1aAMcwKvq
	xjYsoguEKD8jhAHK4RzcLmFVXMr8nq39q1qt9F/D7MDKLlubwe2uJbYyhUav72rOcPSEQBkJ7Gj
	f8ViStH+9Dmt5wdSu5AE0=
X-Google-Smtp-Source: AGHT+IGwcIbZu7Reu6gEUybQVWJyifVkO6dMnAxR2TOj6PLpVKDznQPy9IHHIvvCvTuBaNu+Iuy9RA==
X-Received: by 2002:a05:6000:2f82:b0:431:8f8:7f2f with SMTP id ffacd0b85a97d-432c3795323mr23143317f8f.34.1768294656128;
        Tue, 13 Jan 2026 00:57:36 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:982f:38af:1a7a:b10])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd5fe67csm42950056f8f.40.2026.01.13.00.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 00:57:35 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Nick Xie <xieqinick@gmail.com>
Cc: neil.armstrong@linaro.org,  khilman@baylibre.com,
  martin.blumenstingl@googlemail.com,  xianwei.zhao@amlogic.com,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  robh@kernel.org,
  nick@khadas.com
Subject: Re: [PATCH] arm64: dts: amlogic: S4: fix SD card initialization
 failure
In-Reply-To: <20260113011931.40424-1-nick@khadas.com> (Nick Xie's message of
	"Tue, 13 Jan 2026 09:19:31 +0800")
References: <20260113011931.40424-1-nick@khadas.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 13 Jan 2026 09:57:34 +0100
Message-ID: <1jsec9ritd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_005738_747280_C7DD2771 
X-CRM114-Status: GOOD (  22.75  )
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

On mar. 13 janv. 2026 at 09:19, Nick Xie <xieqinick@gmail.com> wrote:

> The SD controller (sd@fe08a000) requires a clock source capable of
> generating a 400kHz frequency for the identification phase.
>
> Currently, the sd node uses CLKID_SD_EMMC_B as clkin0 and CLKID_FCLK_DIV2
> as clkin1. Both of these are high-frequency clocks (e.g., ~1GHz).

The reason you are having this problem is because CLKID_SD_EMMC_B does
not provide 400kHz by default on this platform. We have been operating
with this (weak) assumption so far ... and it was OK until now.

> The internal divider of the SD controller is limited to a maximum value
> of 64 (2^6). With input frequencies significantly higher than 25.6MHz
> (400kHz * 64), the driver is unable to generate the required 400kHz
> clock, causing the probe to fail with -EINVAL.
>
> Fix this by reparenting clkin0 to the 24MHz XTAL clock, consistent with
> the configuration of the sdio and emmc nodes. This allows the divider
> to successfully generate 400kHz (24MHz / 60).
>

DT generally describe what the HW is, not how you wish to configure it.

What you are doing here does not reparent anything. You are actually
mis-representing the clock tree, making the MMC device believe it has
24MHz on its clkin0, even-though what it is really has still is
CLKID_SD_EMMC_B (presumably running a 1GHz)

So if my understanding is correct, you are indeed setting the divider to
60 instead of 64, but you are still dividing 1GHz so what you actually
get it 16,6MHz

If you want to get 24MHz the clkin0, we need to assign the rate,
something we probably should have done before.

I'll send something for this

> Verified on Khadas VIM1S with SoC S4 S905Y4.
>
> Fixes: 3ab9d54b5d847 ("arm64: dts: amlogic: enable some device nodes for S4")
>
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 9d99ed2994dfa..b87bc83b5a9bb 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -833,7 +833,7 @@ sd: mmc@fe08a000 {
>  			reg = <0x0 0xfe08a000 0x0 0x800>;
>  			interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
>  			clocks = <&clkc_periphs CLKID_SDEMMC_B>,
> -				 <&clkc_periphs CLKID_SD_EMMC_B>,
> +				 <&xtal>,
>  				 <&clkc_pll CLKID_FCLK_DIV2>;
>  			clock-names = "core", "clkin0", "clkin1";
>  			resets = <&reset RESET_SD_EMMC_B>;

-- 
Jerome

