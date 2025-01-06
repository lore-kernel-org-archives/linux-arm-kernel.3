Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275A4E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh7y9ZL8IHaZKAw4Kx4QJ+0Dl9iHJaYj8tnVocIhEBI=; b=FWIZhpdTZpvf5QmTBLAdHuYfAv
	00AAcyFbLHSL+pv+1TubRSfoWKIiUjoRzDDhk/iOZnKOPRo+aILw5Mb3UZlNA8PvrcKhuZhjpWH44
	xSXvuiTVG2JocUo5uB8xpplGfKfJI1eYa/aC7O6Sa7QCFwxQWbFlyAPNnMVwpfBChXLHnjPGXRqO5
	acyIiLmQCEvQVGpoB1h0wEvbjMgygY/ZxdnAFAgynkR3MF5Y5fXb7SYeZG0v/f24njm7jr6OQqar1
	2XAZDHVaQLidK1vplNALGQOfXixkD3ulJRATyA8swQsjbMTj7H4qFd1zvLAEYF2EwZdMYuahhiPf6
	nSNaf5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUn7N-00000001Oni-22WI;
	Mon, 06 Jan 2025 13:26:05 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUn5e-00000001OL9-2Q1W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 13:24:20 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-436a39e4891so47322865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 05:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736169856; x=1736774656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wh7y9ZL8IHaZKAw4Kx4QJ+0Dl9iHJaYj8tnVocIhEBI=;
        b=Vsp2EK/rGA69PO48gKE1pxCnvYM/JS4YlIymi1sFI9tnN8fq21ufkA0RttRKHqUfbr
         CfzFoO0GerF1PtgaONUu74pxulR6DkS1xcJc2G6jtRTgkMo6Y0X9/IxPpn2Ibzm/erXg
         hY/+eFCn1rI3DVrz2pJQPk9FOdDtBaqqFR7fHZPGEtqVCwlApa71u1y+yuuxvxvGhtAT
         5+rTKu4n75z6v92awWBI2LzNJE+Gy4DP4z85GBDom/5iaoCWrrlf32EvQ2E++scUu+VN
         VQ7psVdn/znSJ2sPj1hs/mbHIl4CDiV2RgwIQ4asIy5f/7DVaGjCD/GUWiTgQDbJhpZ8
         ay/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736169856; x=1736774656;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wh7y9ZL8IHaZKAw4Kx4QJ+0Dl9iHJaYj8tnVocIhEBI=;
        b=Il0VnhXwkwt1DAjoD++BtheaTkeH4tfDz7lTZeIWSAS6oXUXfIhf7BYsmkwnYIE4Sd
         sX9M+uw1F0ZoxbS7yrWob50V5spmf7MWNxJmW/iwyL/UBbos/pFoCyeSmJxFg4/4xZRc
         woGWbG9/CfmcMvkd9ufpit5E4s+M1bI+7mo5WWzrJ0vvT8LVPps2Q6KvjE3meaObCRvJ
         djZ3H/sV4lCGWGSWFnr2kFQMlpMCsV5JaDc/JhhrgM383zDWD0/WR4oeKdtozIGprPT/
         VsMX0NxkptztRzeoRn9wyn/67XuiWUsdYBbbdP/Wlv27q9PHtcvFpjcok7JfEG3dkYQC
         TL0A==
X-Forwarded-Encrypted: i=1; AJvYcCXBb6Yc2rz79hr80nIk4IKc1HKdBZ7IQOYRpKAnOtButUhEIqty5RVDp9NibywEVF4gouRzCoQNftgN4si0Wn8q@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+8QlEO/ggPrI0Z4Zctj4S2I77dB5xz/QgnSEpdJBkX64nrG6P
	ndKFtHr83Y4+F2vkDx8FX6g8jszjRpT1gNfUIJs2j5Olerq7Nh1AYQl5YzH4KKo=
X-Gm-Gg: ASbGnctPcPM7Lm5sYBuxKt72ECH7TKDS93+gI6AM0b1O2Iq4kA2hYZ/Oa/i9c+TJS9M
	rACtT6SX6kAbhZSKakz7WlsuF7SS7CpHoCUgJxZJ37iDAxSUQ+wvUgdrHX36nZe8CDg3hDD0aIx
	pn43sDp5VWLjQCCTDTHInt5VSO43HTTWu/vsv8wh96PE2Z4WJsuJsW4MEIjdI05YSU0lyxhj32/
	hnwKH0sSzWYjbKj34u/oTW/18EYyqdhBj0jhEn5kpQNlPeR6ciVy2fv
X-Google-Smtp-Source: AGHT+IEYX2sk1R9ukeY4XWDMmDErFBY6fzPWeg/ypRYwHmYveU89A+VrD/4Ey7f29RphiwDzBZmMKg==
X-Received: by 2002:a05:6000:178b:b0:385:e303:8dd8 with SMTP id ffacd0b85a97d-38a221ffda0mr51262438f8f.26.1736169856421;
        Mon, 06 Jan 2025 05:24:16 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:2a4a:e041:e2ff:6b41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8330e0sm47133587f8f.34.2025.01.06.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:24:16 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  dmitry.baryshkov@linaro.org
Subject: Re: meson-aiu: HDMI codec .prepare() callback not called
In-Reply-To: <CAFBinCCAAZHqrKHyfwHPqk9Ki9nDeGFFQfj34ZF58wj+6AjH-g@mail.gmail.com>
	(Martin Blumenstingl's message of "Mon, 6 Jan 2025 13:49:44 +0100")
References: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
	<1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com>
	<CAFBinCCAAZHqrKHyfwHPqk9Ki9nDeGFFQfj34ZF58wj+6AjH-g@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 06 Jan 2025 14:24:15 +0100
Message-ID: <1j4j2caxds.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_052418_878797_5017843E 
X-CRM114-Status: GOOD (  23.42  )
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

On Mon 06 Jan 2025 at 13:49, Martin Blumenstingl <martin.blumenstingl@googl=
email.com> wrote:

> Hi Jerome,
>
> On Mon, Jan 6, 2025 at 11:44=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.c=
om> wrote:
> [...]
>> > I have further verified that the gx-card parsing does find the HDMi
>> > controller and links it correctly.
>> > To me it's odd that only the .prepare() callback is not called, all
>> > others (as mentioned above: .hw_params, .startup, ...) are working
>> > fine.
>>
>> I think the problem you are seeing comes from the quirk of
>> codec-to-codec links. The hdmi codec link is such a link on Amlogic
>> because further digital routing is required after the backend.
>>
>> Those type of links are not used much beside some
>> CPU offloading on Samsung and Amlogic, as far as I know.
>> It is possible, even likely, that things are still missing there.
>>
>> So those C2C links are operated by the DAPM events, not the regualar
>> ASoC code. You can start here:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
sound/soc/soc-dapm.c#n3995
> Thank you - that is indeed the root cause!
>
>> You'll see that .prepare() is not called, same as .trigger()
>> That should propably be fixed :/
> Since I'm still very much clueless about all of this I just came up
> with an experimental patch. Any feedback on it is welcome (I can send
> it as RFC patch - but prepare for me needing support).

It is probably a good idea to send it to get more feedback, yes.

> With the attached patch I now see hdmi-codec's .prepare callback being ca=
lled:

Looks like a good start :)

Couples of nitpicks:

You might want to check the stream validity in
the function you've introduced, like in soc_dai_trigger()

It may also be nice to update snd_soc_pcm_dai_prepare() with the
introduced function.

> $ speaker-test -c2
>
> speaker-test 1.2.13
>
> Playback device is default
> Stream parameters are 48000Hz, S16_LE, 2 channels
> Using 16 octaves of pink noise
> Rate set to 48000Hz (requested 48000Hz)
> Buffer size range from 128 to 262144
> Period size range from 64 to 131072
> Periods =3D 4
> [   42.043413] hdmi-audio-codec hdmi-audio-codec.0.auto:
> hdmi_codec_hw_params() width 16 rate 48000 channels 2
> [   42.047916] hdmi-audio-codec hdmi-audio-codec.0.auto:
> hdmi_codec_prepare() width 16 rate 48000 channels 2
>
>
>
> Best regards,
> Martin
>
> [2. text/x-patch; soc-damp-call-prepare.diff]...

--=20
Jerome

