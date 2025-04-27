Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC101C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 05:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDi3xnZL6fsQsXT2rLh2TNElIcjVvgvD9LuKBrnF8Ww=; b=mpnPxPizMD6Dcw
	J+j/4gX4qRbbvxEbSEn+S5HL6kN8xgDta7AcB/XZ6VL3myrBEVzfMUnf/dXmbi1BZ4ieFPsWHV6V1
	uyfGdYLSRPJ9JcSF75sTZQ2j88FJSaVPDFmfK+zeJD2R7jv+1JhbrfqezLljImUeY9jdZooG3UikM
	6Juh/L4BBJ1Z++65TbLNe8JezmEC31UcsTM5gaLKqq+59PpywWoBsA395xb8zAk/yjhTUG3z7u2iv
	QorcReyWSW1dPa+yNRVKr0ERRqHwNHqpyTOm6EwjTPYS1NbOomxblkpZn2EKUHerD06VfcivWv64U
	4p33vkChgzRgmlSDzKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ubj-00000002vPy-1a8e;
	Sun, 27 Apr 2025 05:31:15 +0000
Received: from mail-lj1-f173.google.com ([209.85.208.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8uZm-00000002vJe-2e14
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 05:29:16 +0000
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30db1bc464dso37994661fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 22:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745731750; x=1746336550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fDi3xnZL6fsQsXT2rLh2TNElIcjVvgvD9LuKBrnF8Ww=;
        b=Szi4HbWicrvMfIXfmFU0jut/UkkA1GraAvS++v3kZWTKZHlhRAeGDSoCjmU+1Fw408
         xTzUbLEpOwPB9fPofbyNxlXoqwQfXjT5BdRKZrs6p/KJR7SIlpypFyr/LiY06EZViQHi
         oNhOyE7otKi6N1eXPdsLUca+P0O+Ak2YCDsujDYNtotilM+vi5B2sDw3MyU86RPRR1CU
         MqksId74hHkF+7rfpYlasTq01PdE7XuXiqWlJxP/2z1CrhvGXTLTxRPYZlj1XWhkGB4y
         G+v4nv/7OIl+DcUneygebbq4uZ6T10m/PNs2H0aO3RLRr12fc8udTziJ7FXLQQeP/kFT
         EmRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXJmbspe5KsD99g+z6DNpEvrOkdcy6f9+8a64BN0OHUvLGFdNEtjrmhf67zk7rUKRIEghtTX0Feop8/k6WPOS6@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk5jGv8xJdDnmTcED2v61BqGj5CBfDqz+DipKzcrkCk8V1Hoh/
	DxJu1bevH4IUTb4y/0zRd6HSuMRlVN/J6US9xBJc99QVn1zKbGbF7UAif/afYSQ=
X-Gm-Gg: ASbGncvkO7h11XIkXFMMts+BAcJq/FhJxl31c3GfvO7nQh7QnIcU+ADHMnA6qqMqK/k
	t56nsBdcBRMIDDlFCf/zsaRsP7DNvnHRntUsIQgYggZPoHGQdNczZ/xbYj+eqjkF64OHhg+ZwEr
	jtYiBJrPh+x5ScIrlbg16QYV6+J/cdBMu6/UvighLpYqnJp/z/lJrnpW/1tQqB2ZaIBG6MvVJ3T
	yvhRhxw47lWz6+/AkfbvfeczxjJl8VwUa6bWdSCKXAu22fJv1gYOdkpwjy5jwZLmm0b2ZAiAHCP
	Hse1i+zN/puhQf5/mVY3ufASQfdbqGaVEzBiaBKbuGkBkbTiAB2gSAcV6oe4bq+6EZsfnu3lnQ=
	=
X-Google-Smtp-Source: AGHT+IE8HNfDiQyfTgLb1d2y1j0o5hWlQ190cqXkSp+Lk/x17shkNwcbg5PwXXKJNXpsmWCylCGyog==
X-Received: by 2002:a2e:bc15:0:b0:30b:c328:3c9a with SMTP id 38308e7fff4ca-319081d9f33mr24545681fa.29.1745731750186;
        Sat, 26 Apr 2025 22:29:10 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cf659c12sm15763671fa.17.2025.04.26.22.29.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 22:29:10 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bef9b04adso36472451fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 22:29:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+f5xBAenMk5d56jcgdDAqemf2ULingc8ypkenOu38vTAbVlAb/TkFR/xI8GXOtfywauIEjFcVeTOl5QHzQdFN@lists.infradead.org
X-Received: by 2002:a2e:ad90:0:b0:30d:e104:b796 with SMTP id
 38308e7fff4ca-319087b0605mr23238281fa.40.1745731749733; Sat, 26 Apr 2025
 22:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net>
In-Reply-To: <20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 13:28:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v67-1tk0uAmYL-y6479itUxBJua76qhjn+0tTsN+Ni_a1w@mail.gmail.com>
X-Gm-Features: ATxdqUEYYTKOqIRqwitrJwW2PxZXei0_VhgNMizMN4MUT9WfXUWnAmdzTIPf0Jo
Message-ID: <CAGb2v67-1tk0uAmYL-y6479itUxBJua76qhjn+0tTsN+Ni_a1w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: allwinner: orangepi-zero: Enable audio codec
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_222914_669426_14C82853 
X-CRM114-Status: GOOD (  16.62  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Apr 18, 2025 at 7:32=E2=80=AFAM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
>
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> Line out playback and microphone capture work, after enabling the
> corresponding ALSA controls. Tested with the Orange Pi Zero interface
> board, which is a (mostly) passive adapter from the 13-pin header to
> standard connectors (2x USB A, 1x Audio/Video output, 1x built-in
> microphone).
>
>   https://orangepi.com/index.php?route=3Dproduct/product&product_id=3D871

What about the USB ports?

In any case, we don't enable peripherals on "headers" by default. That's
up to the end user. The description for the whole adapter board could be
an overlay that users can then apply directly.


ChenYu

> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> ---
>  arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts =
b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
> index 1b001f2ad0efd2e77218742efe6d8edfdd18a816..d65ede3dd6ed1206248a39c91=
e46065684e7ba29 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
> +++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
> @@ -112,6 +112,14 @@ wifi_pwrseq: pwrseq {
>         };
>  };
>
> +&codec {
> +       allwinner,audio-routing =3D
> +               "Line Out", "LINEOUT",
> +               "MIC1", "Mic",
> +               "Mic",  "MBIAS";
> +       status =3D "okay";
> +};
> +
>  &cpu0 {
>         cpu-supply =3D <&reg_vdd_cpux>;
>  };
>
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250417-opz-audio-890849c8bb2e
>
> Best regards,
> --
> J. Neusch=C3=A4fer <j.ne@posteo.net>
>
>
>

