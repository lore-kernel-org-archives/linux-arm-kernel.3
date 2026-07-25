Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E99C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 07:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JP/wbNLQSrW5qwWjE+qQUBSSCP+5d3b6gjSj9x/s0bc=; b=nYr1fZ81A3fu2ehCfGoHSNLpSP
	+KvlSUoqBuRk9YzWsILsVs3DHc4KEI8Yuxtwf/cEGV+HKeoAshjj0jdVbPelpLB7lKnFo5uGXnbtT
	UvyLn+Vp3sfEzVcwwD5ymLXiFJseqyj7/o0dcFnnqDw714BqMng+Z00MQeGeuy4vEQFy1TMOdNHq0
	FSNu7TC3ZlHk4QYtsxCUGblF9tnAmhuRSsw3nNt8swJA8QVyxoUnxwHLsEsBi2w3WmFrf4zOJLA56
	rAY4H6GLdEW5iRyxFLJtYdazRPWsdrFc6uqtArtAvI1HWbiNY44tBQFahEtyMZUbriOis7ej54tG0
	rA4vYNZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnWaJ-000000008yW-3oL4;
	Sat, 25 Jul 2026 07:14:11 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnWaH-000000008xd-2h1S
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 07:14:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so1619167a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 00:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784963647; x=1785568447; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JP/wbNLQSrW5qwWjE+qQUBSSCP+5d3b6gjSj9x/s0bc=;
        b=qNuY4WaF0LOaaCbvkp386R7N7FHlxLfqeteRr852i4Bc9vmSDdimAeirjfCtCR4i8j
         l5+oPfr8EzkxtgBUdzRP+aLszPw5ZjZ8MuTjxsmAnMXrESB54PvV0fad2JcCdcpPM2/5
         hOwzs0yttxQOTnNWTi8tjfFJqTgeK/N0RooGjA4B8g5VNH2MdaxJZ/57e9PiIrooZRwT
         ABtEDS47pdOhl5JBMeINJzda94Ji30iViRntu78AahXebqEHjizO0WkBtr3pFZbySssU
         uT6lKPcaXBMvMYWFFKgwqOPtY3Bt0zGAUAsT2aGTQWPVLejDlcK0rDofYd6s2E9g1o5K
         DXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784963647; x=1785568447;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JP/wbNLQSrW5qwWjE+qQUBSSCP+5d3b6gjSj9x/s0bc=;
        b=IM43zLlmqWX2uPa98qGWiZ5wVUkDJrkbBHagT0PVmuIWCrCAnmePwFztMshtHbuqc9
         dJJnQWM4LNgCp7L/yo0M6HaIvHSn+Eo6o1ohe2hojxZVwkzRQCIlQnC8Z1n2sHKiXHZa
         MZkMOk6876SywosHPENyK6JpAzCr5S8c9o5NwjtHNNbY3swoVUbug8UP+5c01ixc5Gos
         ARK5JdS/wrHc9L40x8GxVVDanp8+0shwOrtJkCmgQU3uZ0XBi8LHghQljdsGxNXj3Hpn
         SM2q4PYjQlY/OGoXxLyeNxHjH46zCf89A/qirCKmd/PWWayP9yB8xXW/KkhXJuLdtX2S
         TkXw==
X-Forwarded-Encrypted: i=1; AHgh+RqAQe8HlmHs7ia5uu7bgZ55MnWzJ+xrlXpHG3uCzMaSxwddysqcblKVzzAh/OGTANz89eLbj5PDB4cHTwfVrvWd@lists.infradead.org
X-Gm-Message-State: AOJu0YwnGiR5oywF34IBF9FZWG5deunhNxvgDm7/9Dq7R7qFcfo9Jo9Z
	MhAsOY5AVa+eI8792nwOdCCvFjLU+HCpar+QrxyWGPRrbEgfbdeD+3it
X-Gm-Gg: AR+sD13wwM4lwIiF9PJpVaznHEQAX+x4ycEu7OXvHPxWdytBjAM4uSuGGDufFGw5G4E
	rWzaawz/uzwG99iBgflN+2cuhok/t/Qzjh/FetADbeARrF5KsoLhwsqkAOTz3w5L7AjLq1ObJDK
	N5iMCAKcfQjWYbEa+p0nBb4AsLz0bEEgW4KrLwE4EE+M17uXdcJLOsEivEkMCg6SSlhfV7katx6
	SvxS7VZoDfKi6U03JiF5ZKlTkEzZq+/Xx6EKxU/WBWY9SRyhsI/UZsYHrh5NlzveT8buneR/Tfo
	hg2Zu2sCE/Z3U+XZMeLQuf790N54TyPYLtawlOtExjqtC3nkAbjwX6frDDgQcb/y6su2iYbosKu
	S5940yqUptITnXayFHvKB9GDLyb/3e9MUl8GI8QFkT4Sfgjj/MsFZcAci4Uyqho38wBmpvo/pia
	j8JcDlfUHIEIohcRLTUM2eLFwUdP5WcPbEUax5wk1KaLr9xz2fChc3v20SjBfuVWts8ivQYC4=
X-Received: by 2002:a05:6402:2692:b0:698:f7d:4e11 with SMTP id 4fb4d7f45d1cf-69fc0fed1bfmr434261a12.1.1784963647447;
        Sat, 25 Jul 2026 00:14:07 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb4e11519sm658390a12.0.2026.07.25.00.14.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Jul 2026 00:14:05 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v6 1/6] firmware: meson: sm: Add video firmware loading
 SMC call
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-1-6072a7ee7428@amlogic.com>
Date: Sat, 25 Jul 2026 09:13:53 +0200
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <49F34481-918C-42ED-92E9-DFC336526BAD@gmail.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-1-6072a7ee7428@amlogic.com>
To: zhentao.guo@amlogic.com
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_001409_737258_D0B42BA4 
X-CRM114-Status: GOOD (  15.55  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Zhentao Guo via B4 Relay =
<devnull+zhentao.guo.amlogic.com@kernel.org> w dniu 24 lip 2026, o godz. =
09:04:
>=20
> From: Zhentao Guo <zhentao.guo@amlogic.com>
>=20
> Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
> table to load video firmware.
>=20
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
> drivers/firmware/meson/meson_sm.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/firmware/meson/meson_sm.c =
b/drivers/firmware/meson/meson_sm.c
> index ab9751a59b55..887caa5c625d 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -48,6 +48,7 @@ static const struct meson_sm_chip gxbb_chip =3D {
> CMD(SM_THERMAL_CALIB_READ, 0x82000047),
> CMD(SM_A1_PWRC_SET, 0x82000093),
> CMD(SM_A1_PWRC_GET, 0x82000095),
> + CMD(SM_LOAD_VIDEO_FW, 0xb200000f),
> { /* sentinel */ },
> },
> };
>=20
> --=20
> 2.42.0
>=20

Zhentao,

What is req. baseline for this patch?
(or what extra patches are needed to test it on 7.1 mainline)

Asking as applying on mainline 7.1.5 I=E2=80=99m getting:

patching file drivers/firmware/meson/meson_sm.c
Hunk #1 FAILED at 48.
1 out of 1 hunk FAILED -- saving rejects to file =
drivers/firmware/meson/meson_sm.c.rej =20



