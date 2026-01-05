Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D09C79F90
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50xGHnyMAYMUW9mHIcf/4vlyevvh06h79/UItY38+Nk=; b=kI6nSndALxa95uJtv+TkbRU7WI
	wBupZkZhBBV9nWGDeCE6HEGev/HT4yBQGuuEACx6p6JbcOUbussR/bXOM6+ggadkodYPGnLtAkmT4
	RRC3Ou7/gxNwLA9wFLPfrTi7WZYGfeOfdmE9vvu+F84vr/i7lL/gY3eh//wDKv2tU27EhgaywGhC0
	xTSbdXGDdNLI8W4WuRWWQze1hVblDWrrArDroged31sx7wsZFFth+EM3mLPYAudVyagCz9r+75VW5
	XiimJrungW7gghix7QrgOxNq0qMBxN+tK5pUxFzFRvAgWIWsfS47jhwxvDdJFoG0eOy8tj1TPe6Dh
	CjIEB7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrBs-0000000C3AG-0S9x;
	Mon, 05 Jan 2026 20:28:36 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrBp-0000000C39W-3WRp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:28:34 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so64914966b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 12:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767644910; x=1768249710; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50xGHnyMAYMUW9mHIcf/4vlyevvh06h79/UItY38+Nk=;
        b=GfhV1zbEfPsOLF1N4BYzrboENyEOcT47PTxfoJdZ06aOZdBvPZsmEdZohbL4re16b+
         lMFcTpTCsay1nqSK2e3JsKBGuwDqfmq6g6n5+GbBSHxzvKzE1Gl8M8S7xx65c49wGzSl
         I7SFvwO0tfw8y6cwjGjsrYTGY4RzT0WPFotbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767644910; x=1768249710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=50xGHnyMAYMUW9mHIcf/4vlyevvh06h79/UItY38+Nk=;
        b=vHX6xonq11SL75SJBPgqaN/XPpYqXZpW2lpjWeH88fbvWWbN9/aYw8+saFAjpWKIX0
         oMOMoxuMYE+m1tz3kEeV2iLmqiOSvFWCw+wb5JG+gwsYSA+YV1lEl+xxWo/RTJEuBrOz
         6Vhs8Wq1xrNUOj3GuH7/8D7asie8/uI6G0pSgulgUAOFWJb3kMWjiNqfoyZVqw8kRVBa
         oapf/5/VLqXWu1iADA9wa4zUII/Z6xq8M0GVF5aADZfcemX0rfWqgD73rQikxfM+7/SR
         rFXBul04DpQbYwZXLSI5gx79iiUKtwm4jKGMCW0Euh8j1hnatqjsflIK6ihcKHv7OqZl
         zmNA==
X-Forwarded-Encrypted: i=1; AJvYcCW40b3yCrRCrJxcnAec0vU9VxA1kT8uESDLyI2EQME2YxkETatAvlJi2jbaivyEFuT7liwri33EZZDyk1li8C9/@lists.infradead.org
X-Gm-Message-State: AOJu0YyBw0qoYhtxrxZZj9Ycee+/j+goFHqk1ZZO1WxLWhy1VU4I7Axc
	78irwB1qogsG8qkTjVIjKD+eHZExMonkvnhPKFVJ99JPvGZYjtaZVuyztjs0P46InYVrcapEKZx
	64O6m2Q==
X-Gm-Gg: AY/fxX42lZjGhpUI7K14zRgxwcDPS3/Phu7iaZQ0e/+kZf9IGMjJ+o0o94Lb2H4vFQF
	pIvrE0KEAFU16HiNIoHRaQN72QvsAfEGWc3JJprBRnMx5GlmLG4mDoO7/QII+N9dh2cpA5Uv8l3
	t3uUulSw6J7H1I17SMzk+ykebhZWwe/jkGuHnfUlN5bwEXIFH8bQPG1fW6HIvVBPx2fTHJieyDo
	27G2SB/W06O7xIUrbeBx6BU90DCSyJwl7pJSEWefgugjAwnY6tmZTD7vYD5yTqqaofYRm5AuNos
	flRV3zgCaiai5qfrI1OKhmdB1xRxQrYR1E5YYu1GhDPqJjOwd05Fosn7Rih3039tPSYkp0efaZi
	nKmuJcXrVwxvoNUH9IQYYPYv+2tbTq7ncDVuKyERmc51PCx5ScvPuSeNP29CsauKqM9ZTv0B91n
	KKCXxprO86xv2PYDM0DvmlBXXOWv915I8hj5dK+gRadTjsVsyMRiSMavqzC/kZ
X-Google-Smtp-Source: AGHT+IEmfrrc+VZePGcNvDt3z0XXv8GayPlG0nlqzIjE/RCfR9+l3tJTJDjEUaztRpus8e1BADVgGg==
X-Received: by 2002:a17:907:7ba2:b0:b7a:6f9d:8661 with SMTP id a640c23a62f3a-b8426c2266dmr105912866b.12.1767644909967;
        Mon, 05 Jan 2026 12:28:29 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a51577bsm19667366b.56.2026.01.05.12.28.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 12:28:28 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47755de027eso2121625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 12:28:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUyEBD4ziKGJx6Q9s3iv1tSr73qU9HWA/YZEDjeO2zZU4F4Hi18NIle1qv3h4qL8hvPmmNyi3kMMPHQvFtlDYqA@lists.infradead.org
X-Received: by 2002:a05:600c:3115:b0:47a:80f8:82ab with SMTP id
 5b1f17b1804b1-47d7f0988c5mr8202775e9.24.1767644908290; Mon, 05 Jan 2026
 12:28:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1767111804.git.robin.murphy@arm.com> <bc54c6c700a4be244bd4f81cb846cf628313a6ee.1767111810.git.robin.murphy@arm.com>
 <CAD=FV=VB9XOm33VvsTN4cd22rBf9A-7ie4hN80TAByciQropfg@mail.gmail.com> <c76ae679-d05a-4192-8ffe-189649799ee4@arm.com>
In-Reply-To: <c76ae679-d05a-4192-8ffe-189649799ee4@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Jan 2026 12:28:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WKxCj6Wix0rvRpfuDMyM63oxgOZT1eVpphqtprr96_wg@mail.gmail.com>
X-Gm-Features: AQt7F2pkJeH8zNGpw_MUiT4YReeWLIU1tcbaA-2NAGp7RJZED21e57oHRAgpJJQ
Message-ID: <CAD=FV=WKxCj6Wix0rvRpfuDMyM63oxgOZT1eVpphqtprr96_wg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: Add overlay for FriendlyElec HD702E
To: Robin Murphy <robin.murphy@arm.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, thierry.reding@gmail.com, 
	sam@ravnborg.org, jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_122833_910112_EEF2E95C 
X-CRM114-Status: GOOD (  44.84  )
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

Hi,

On Mon, Jan 5, 2026 at 11:39=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> >> +&{/} {
> >> +       pwm_bl: backlight {
> >
> > nit: up to you, but I happened to notice that other rk3399 boards just
> > use the label "backlight:" instead of "pwm_bl:"
>
> Sure, if you prefer.

Totally up to you--I was just comparing what you had to what other
rk3399 boards had and the fact that this was different made it take 15
seconds longer to find the PWM backlight on the bother boards. :-P


> >> +               compatible =3D "pwm-backlight";
> >> +               pwms =3D <&pwm0 0 25000 0>;
> >
> > 40kHz is awfully fast for a PWM backlight. Are you sure you need it tha=
t fast?
>
> I guess I just copied this from somewhere without too much thought, but
> double-checking the schematic[1] now, the backlight driver where this
> signal ends up is apparently a SY7200A, whose datasheet says "And the
> recommend dimming frequency range is 20kHz~1MHz." So relative to that
> range it doesn't seem too bad!

OK, cool! I just know in the past that I've seen cases where people
copied the PWM values from elsewhere and ended up wildly out of spec
without really noticing. :-) Sounds like you're good.


> >> +&edp {
> >> +       force-hpd;
> >> +       status =3D "okay";
> >> +
> >> +       aux-bus {
> >> +               edp-panel {
> >> +                       compatible =3D "friendlyarm,hd702e";
> >
> > As per my response in your driver patch, any chance this can just be
> > "edp-panel"?
>
> Per the cover letter, I did try...
>
> >> +                       backlight =3D <&pwm_bl>;
> >> +                       no-hpd;
> >> +                       power-supply =3D <&vcc12v0_sys>;
> >
> > While not strictly required, it seems highly likely that you want
> > "hpd-absent-delay-ms". It's highly unlikely that you would have
> > "no-hpd" plus a "power-supply" but no hardcoded delay to wait here. I
> > haven't seen panels that turn on and respond instantly.
>
> ...but even with both delays bumped up and up and up to a ridiculous
> 2000ms it still didn't work. It reads the EDID as all-zeros then fails
> to probe due to a lack of modes. Whereas with the hard-coded mode, the
> display lights up immediately upon probe, so I don't think it's a timing
> issue. My working theory is that there's some fundamental ordering issue
> based on the comments in analogix_dp_detect_hpd() about aux not working
> until HPD is forced at the controller end, and from a brief skim of the
> history, quite possibly related to f2600d08d4e8 ("drm/bridge:
> analogix_dp: Improve panel on time") which maybe prevents that happening?
>
> By that point it's well beyond my expertise, hence my conclusion that
> since I'm not *adding* the legacy panel data, just rearranging what's
> already upstream to finally put it to proper use, that's just about
> acceptable :)

OK. It's unfortunate, but fair enough. :-) It would certainly be
interesting to know what eventually makes the EDID read correctly, but
I agree that it's a bit much to ask you to debug that.

FWIW, I took a _quick_ gander at the schematics you sent, and I
actually wonder if it's the "backlight" enable signal that you need.
Depending on the stuffing options, maybe that connects to the PWRDN
pin? If I trust the stuffing options in the schematic that GPIO
doesn't connect to anything at all, but I know stuffing options on
schematics aren't always right... In any case, it's also OK to just do
what you're doing...


> The power-supply entry is really just for cleanliness, to avoid a "dummy
> regulator" message - the screen module has all its own regulation on
> board, which didn't seem worth modelling in detail as it's all fixed and
> always-on, but the source is the board's main 12V input, so that much
> *is* true.

Fair enough.


> >> +&i2c4 {
> >> +       #address-cells =3D <1>;
> >> +       #size-cells =3D <0>;
> >
> > The base dts already specifies #address-cells and #size-cells, right?
>
> Indeed, but dtc doesn't know that when compiling the .dtbo in isolation.

Oh, right.


> >> +       touchscreen@5d {
> >> +               compatible =3D "goodix,gt9271";
> >> +               reg =3D <0x5d>;
> >> +               interrupt-parent =3D <&gpio1>;
> >> +               interrupts =3D <RK_PC4 IRQ_TYPE_EDGE_FALLING>;
> >> +               irq-gpios =3D <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
> >> +               reset-gpios =3D <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
> >
> > There's no power supply here, so I'll assume it follows the power
> > supply of the panel? You probably want to be a "panel-follower" then,
> > right? AKA you'd want to add a "panel =3D " node here to refer to your
> > edp-panel.
> >
> > Oh, except that the goodix driver you're using doesn't support
> > panel-follower. That's annoying. I guess you'd have to add support for
> > that (see history around "is_panel_follower" in "i2c-hid-core.c")?
> > Without it then I assume you'll just be lucky that things work? ...or
> > you'd need to mark the power supply as always-on?
>
> Yeah, as above it is in fact always-on anyway - somehow I missed that
> the goodix driver is getting regulators too. The 12V input is stepped
> down to a main VDD_3.3V rail from which everything else is derived, so
> if I add a fixed-regulator node for that which is sufficiently close to
> the truth for both these and the panel supply, would that be clear enough=
?

Sure, it's fine from my point of view. Really pretty much all of the
dts is up to Heiko. I'm mostly here because of the eDP-panel stuff.
;-)

