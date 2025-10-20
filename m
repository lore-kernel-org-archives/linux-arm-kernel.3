Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C420CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yGmBP/PkMxgu2wwxaNLMOWwQSg0wFQ20D8HmohcvME=; b=L6SATpnus9BfhX23sCVLtkCZv1
	dy/iy/qxrfUy04vtt0zo+Vi2ANwbsHiQMi4y2bSdls8K8sZ2AmW3lRYhuDnAVQTaWYFWcb5Kpl7tZ
	Hr/DbfkgxZKxE6M7fp/MccMkhSCe3klq0YztBVvv7jAHt8bQvtjobUX9yB/qC1HVTNS0YDDNz2g+m
	3FAlhOCVdXagHFr9c6k7MuJ9vDd5D8L426u+YbK+2cFtioCytjDzUi00U5dVMo3C6yHwPH6hXHy+L
	8s8hAOWoUWRlT923K2s6TRxIeL8Gu7kupmsXGpLnPsaj/dv1KB6XeAovOL4NIdxHhRA7242YVokBT
	VR1Xjffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlbe-0000000CSju-1UK0;
	Mon, 20 Oct 2025 08:51:06 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlbZ-0000000CShp-3EHi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 08:51:05 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4283be7df63so921507f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 01:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760950260; x=1761555060; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2yGmBP/PkMxgu2wwxaNLMOWwQSg0wFQ20D8HmohcvME=;
        b=akoR3I5ydV+h0C/BgetzMaY1cQ0yoQPwOdg1dAMmiyE+kddqc3mlWA4e4DL8Yk+R5R
         yRseG2dxtAkR+tOzAnzIgL7MQ2k1nEmCa93e4LlPL83XMEikEIGSSzn4BsT+h1gpV0MV
         coZs2UXWkLtW8QNAKfhmm2VVEdsEsc2zq6bixIt7f8/W1Oy5eD0HdTIma5+dtpg4QlnX
         0OOSVnYg1vGS1a+7I+4QZxWEkIxGZnIgXPvb2G17WM9mzkfk8h5PQEvE3vW/wiFNfPt9
         d9bX9YUjkNeoJrmZM557U1TXbGCiqLHgy3fVa5enWnOdMqWeuwYNGalj/LDAaXu1MXtc
         Nsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760950260; x=1761555060;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2yGmBP/PkMxgu2wwxaNLMOWwQSg0wFQ20D8HmohcvME=;
        b=nvspbiQkIdAD0fr7YtePkmwhXqA7MfQCqSlZ+HdG6NeOBLAW3yt5675AoJrX+ww15b
         UVbbuvdndrWx5iyUm+RqxHmAbUJonGoia5zYEelKV6uijiP7FA42i2mWi3qthxoA4NqZ
         2D+dq0rhzuQ0zfC1B8c1wh/ID4c54YB/aTc09xBhwLGt5VIpLUNK4mj99y0Tubo0xWnG
         wTCY+h84yetfupZ8u6cGjsa/jXlC8Jko7a8YpGtYZJVvpqyczb0sqiMI9hgB/VXpx2IF
         7rqiTBwEqCidHJlyPvI1hoQvUSTm8NNM4h2Uh8hXOwrU1mru/VKowPwao2shE4kf4lAL
         Bc2A==
X-Forwarded-Encrypted: i=1; AJvYcCVKDMllVjZF4jrt2aQGMD/AIg89ljyjwdKz+HvkRbjfmHUZvhFaQIu3tajNNhp5hE6D3uahSjAmCVmCPoP0Idg3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8AprFq5DTwtZ6rB5sSxnzUacu3zoYd5JoAI5OadNT810tvQFG
	Y5xfdwWgkGQs03hohaLR9/UJxv6Pycm7j80kd9hubtFwL80o+BKGBCwPAvAVxJpYhX4=
X-Gm-Gg: ASbGnctUfrC6Y12w9ri8Hk9FvP4c7TSVgMsjRqgIQfEIugoS5NNNstPmDaOY1IpZRTh
	89KmAxSCqYt8MAjZ9qH+4yAcvEtrHoaeVEeXiCs5AlpcZCMYHhNU94b19vtcPs988JyZMwPCnEm
	QTARyv1sEeH388e8MEhwpjwCZofK/6uU6TQgVMAdyEnE2G4CUbAELGSa95Z0X/0oHJArjhHEwfs
	PwDybrOEk9y9MF+4spM/qHir/x/R69S6Y2K9NID1EoJw6fHMWXr5beAnbeZePTj/M9ZZtI5uO37
	cMn5SiKJBcFHGdIGeHxN/NSc1Z9O91SYatsG5Qreuu5sQbLD5ULt+/s808qweJC28avWYB5osOI
	vPNVHIRxvn+PTVBDO+y1aw2LxoBF3u6PpXW3Mbx5IVIhC+sNhPxojUpwF8tDNVLDyq/ld8Hbav+
	jS4HkLFt5fBsX+AhYjhaanlMWnSlMCJ6UwQ5yy4ifcNHheTg6zVg==
X-Google-Smtp-Source: AGHT+IEZuzT5Fi6RwZkG3ZCBMeU/nFGgDtAhgLPA7LKZMuxVJQUCCBR14TWol1dcQMMPKI5tWNEmrQ==
X-Received: by 2002:a05:6000:1848:b0:428:4354:aa27 with SMTP id ffacd0b85a97d-4284354abc4mr2871879f8f.46.1760950259658;
        Mon, 20 Oct 2025 01:50:59 -0700 (PDT)
Received: from ?IPV6:2001:8f8:183b:9829:50b9:dafe:ddca:3ba4? ([2001:8f8:183b:9829:50b9:dafe:ddca:3ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710f29b559sm104370685e9.8.2025.10.20.01.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 01:50:59 -0700 (PDT)
Message-ID: <748fd61a-31fb-436f-b028-b47807a4860c@gmail.com>
Date: Mon, 20 Oct 2025 12:50:58 +0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alexey Charkov <alchark@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add DSI LCD display on rk3576-evb1
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250925-rk3576-evb1-dsi-v1-1-c76fc3740abc@gmail.com>
 <CABjd4YwVfrzxYKM4cAG=-fMbw9OcQGZD20CVCG8FvC8phDsw+Q@mail.gmail.com>
 <5143458.iZASKD2KPV@phil>
Content-Language: en-US
In-Reply-To: <5143458.iZASKD2KPV@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_015101_827223_3C231C6A 
X-CRM114-Status: GOOD (  28.56  )
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



On Mon, Oct 20, 2025 at 12:31 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Montag, 20. Oktober 2025, 10:19:51 Mitteleuropäische Sommerzeit schrieb Alexey Charkov:
> > On Thu, Sep 25, 2025 at 12:38 AM Alexey Charkov <alchark@gmail.com> wrote:
> > >
> > > Add support for the Rockchip W552793DBA-V10 LCD+touchscreen assembly which
> > > comes physically attached to Rockchip RK3576 EVB1 boards.
> > >
> > > The display part is driven by the on-chip MIPI DSI controller, and the
> > > touchscreen is connected over I2C.
> > >
> > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > ---
> > > Note that backlight support is left out for now, as it depends on PWM
> > > support [0] which has not yet been merged.
> > >
> > > A workaround is simply `gpioset -c 0 13=1` to set the respective GPIO
> > > pin high and thus to light up the display unconditionally.
> > >
> > > [0] https://lore.kernel.org/lkml/20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com/
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 89 ++++++++++++++++++++++++
> > >  1 file changed, 89 insertions(+)
> >
> > Hi Heiko,
> >
> > Any thoughts about this one? Can we perhaps get it merged for -next?
>
> Does the gpio-backlight work on that device?
> That would make the gpioset hack unnecessary.

I've got a local patch using pwm-gpio and pwm-backlight as a stop-gap 
solution, but I don't think it's worth merging upstream, because the 
backlight is supposed to be driven by the hardware PWM on the same pin 
(not bit-banging the GPIO line). After all, Nicolas has been working on 
adding a proper hardware PWM driver for RK3576.

The display itself works without PWM support, and so does the touchscreen.

My temp patch goes like this:

---
  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 15 +++++++++++++++
  1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts 
b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index f20cd6f2c079..5c27fff03569 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -58,6 +58,14 @@ button-vol-up {
  		};
  	};

+	backlight: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <20 220>;
+		default-brightness-level = <100>;
+		num-interpolated-steps = <200>;
+		pwms = <&lcd_bl_pwm 0 25000 0>;
+	};
+
  	hdmi-con {
  		compatible = "hdmi-connector";
  		type = "a";
@@ -78,6 +86,12 @@ work_led: led-0 {
  		};
  	};

+	lcd_bl_pwm: pwm {
+		#pwm-cells = <3>;
+		compatible = "pwm-gpio";
+		gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
+	};
+
  	vbus5v0_typec: regulator-vbus5v0-typec {
  		compatible = "regulator-fixed";
  		regulator-name = "vbus5v0_typec";
@@ -277,6 +291,7 @@ panel@0 {
  		compatible = "wanchanglong,w552793baa", "raydium,rm67200";
  		reg = <0>;

+		backlight = <&backlight>;
  		iovcc-supply = <&vcc3v3_lcd_n>;
  		reset-gpios = <&gpio3 RK_PB5 GPIO_ACTIVE_LOW>;
  		vdd-supply = <&vcc3v3_lcd_n>;
-- 

Best regards,
Alexey

