Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1531C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxV/xJXYWKCtENMVxUm3wS9i0eN0MZ3pOU2llzz4bL0=; b=MrLQwxb1o0k5QaTxU5mkF5+2Nq
	Ia6gcLmNwd0utjugBD74f6UMZCN3mB39HCSLp6WyNo/XQUtG2CMAvtO9IUtSBToCIENowTdNS9Y3B
	KoWXJjoHuBNH5ZwplfR+oIglJWpAj7ziM9K4+AuhOJ++17oha6mQwXvZjAR9gBAyP2Qp2BjO5C5C7
	BmH0/rbxZOgpNyIBGrWxy3bmGeS0TLT1HRDdk5eXPI1k0bYMeyDma+4ph7RrAGNTOpbD11KM1VuOO
	x8QT/ebjclnpE5cnORrKlOiJvpN3F/Ouik4egCHmpZsac2P1g4Jq4brjJEZzxn8WAw5N7CiA8zj+7
	LMhFWQ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv24M-0000000AJDw-3yBd;
	Wed, 19 Mar 2025 22:39:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv21S-0000000AIxO-0W3E;
	Wed, 19 Mar 2025 22:36:27 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-225e3002dffso938955ad.1;
        Wed, 19 Mar 2025 15:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1742423785; x=1743028585; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxV/xJXYWKCtENMVxUm3wS9i0eN0MZ3pOU2llzz4bL0=;
        b=gNcOHMBJh3oLrZwhkUsBrJhzd/S27Yfvpolz1dU18Wop1ojqjKK8cKw6MkI7Balb7F
         sGKea5UZfFUpYXoS6shHuOEGWUP9Hj9TpCR2lKivjBDNejuMhO0ac0Ehl84DgPJQOiRF
         knuLGdw0mmWi3HPC8fMxCVSsq6ki6KdjGQ7SeAgHdWN8mBVvDfadyT6vFoGrOIBOi69h
         hRfhRlNLlJw8N/EQem8qzdgOXKXWK8swffhmi3mK2tRH6ObpbUSJphu9ZKyH29Dg02RQ
         wjF8IHQZ1hgxfln3L4JM6qiIGX3gpQF90JV+VPo/oorsNCk77ngVoJZzZ7OqAORi2ukI
         5jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742423785; x=1743028585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxV/xJXYWKCtENMVxUm3wS9i0eN0MZ3pOU2llzz4bL0=;
        b=nvvXodIvYT1SJqxGgQCO/Z3NsSOTFwzmkmhRGVfVTWGpcZcuoBB0mXUk/VQdVHG0Td
         8tJedZtstgJPfXTA7GGvuQBFCFMKjMrbhN0taurNBnrxRCRmFeG/f83VHNqp3CcvdsEN
         yRGX0Qw2yV66aRWecQiuRqu+ajIvKnnDDbprobcxENkvZbzde/uTRHDHMqbCf5r3ajCV
         qYAxf/DzUVMSq1oqcg0xU8N2t+6Dv7vwu4njCsZI9pFk1SA1wCcw1W2en+ELPK+cv+sj
         xkxnEapOopKg3YNE/A8KOdAKu7CF8/ZGLA1DWtTCF+RLWeG6QhPZmFWPR5vMM74EeZf2
         Lu/g==
X-Forwarded-Encrypted: i=1; AJvYcCUC7M33nPuZAF0NSjib3Zve9AehblJw1CQCTLhVJvYAP2g0IHsSgettDTpAVlxIC+KJxNidsRqjfmhx8wKi@lists.infradead.org, AJvYcCVBxGyZ1QRVmsNii++XA/LqPolSHSvorFBA2eZ7rt6ZDSPHbVPZr2AcEEmkRtMb3vKo4X5tu26pIa7eUYE2Bex+CA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm2NGvdUS76ZdPttWM/MeKBINZuSaL7p2L2KMIjbAjDt7o2uYw
	OFmrzhuVQ2rMjeFSpoC4WSwS5T18/3wZdOmKEk39v8iztkwHm9UNmBJPV3xiPxoyhJwgQIeUc5R
	vJAhGkdPj+IAVG0TZP7cgC9bWzTU=
X-Gm-Gg: ASbGnct9Cm2S+aeYyiBYtGNHxzXuPIkE/AaOi5Jnm0VciXe9jC1T1pGnKf9csyWcbJP
	rAiNUOVh+0WjDz8lTRMwzcId0A/olQRYyg173TIb1dEaEY3QB14lGPSuM21dqX6NNia14sdWTWF
	M0NZZAj8rVt7/+w/ZH9rXiDJHUKdEQioSxI/yccn7FcuZ4d4HWpEay29c7Sk4=
X-Google-Smtp-Source: AGHT+IG/YIc6tBx54GZTNVesuUZ+0/SBrY5cBP76NGT3Y8BVMBK0uT7Wgcmqazmw2tp0JyM9BJP74tIXaQ45IJ2dJyM=
X-Received: by 2002:a17:902:ea07:b0:223:325c:89f6 with SMTP id
 d9443c01a7336-226497fffc5mr90923125ad.10.1742423785134; Wed, 19 Mar 2025
 15:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250319190150.31529-2-funderscore@postmarketos.org> <20250319190150.31529-4-funderscore@postmarketos.org>
In-Reply-To: <20250319190150.31529-4-funderscore@postmarketos.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 19 Mar 2025 23:36:14 +0100
X-Gm-Features: AQ5f1JpXkKwFQfXcHg1AOK80prLkwU3fTrKPn2VwdZF1QFdP8C6Judb0z-mEhaY
Message-ID: <CAFBinCArRO-F59tOv9m27f+DV+qhy69OGUunGOAbDdfOdd5_Xg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
To: Ferass El Hafidi <funderscore@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Artur Weber <aweber.kernel@gmail.com>, 
	Karl Chan <exxxxkc@getgoogleoff.me>, Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_153626_160562_349D9663 
X-CRM114-Status: GOOD (  11.59  )
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

Hello,

thanks for your contribution and sorry for the late reply!

On Wed, Mar 19, 2025 at 8:02=E2=80=AFPM Ferass El Hafidi
<funderscore@postmarketos.org> wrote:
[...]
> +       au2: analog-amplifier {
> +               compatible =3D "simple-audio-amplifier";
> +               sound-name-prefix =3D "AU2";
> +               VCC-supply =3D <&vcc_5v>;
> +               enable-gpios =3D <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
> +       };
I couldn't find any pictures online that show an analog audio output
(typically a 3.5mm socket).
Can you confirm that this is really present?

[...]
> +       sound {
> +               compatible =3D "amlogic,gx-sound-card";
> +               model =3D "XIAOMI-AQUAMAN";
> +               audio-aux-devs =3D <&au2>;
> +               audio-widgets =3D "Line", "Lineout";
> +               audio-routing =3D "AU2 INL", "ACODEC LOLN",
> +                               "AU2 INR", "ACODEC LORN",
> +                               "Lineout", "AU2 OUTL",
> +                               "Lineout", "AU2 OUTR";
If there's no analog audio in/out then this section can be cleaned up
as well - together with the references to acodec in the dai-links
below.

[...]
> +/* Wireless SDIO Module (Amlogic W155S1 / Realtek RTL8821CS) */
> +&sd_emmc_b {
question to Neil: since we know that there's two board variants out
there (with different wifi chipsets) - are dt overlays down the road
enough (to enable Bluetooth / wifi - depending on the chipset or board
revision) or do we need to split the whole .dts?


Best regards,
Martin

