Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E2CC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 11:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgviFgiTRKBQorySpqmLCZcfPI+S5PYXE7dN7JoWph0=; b=EB6OY1TgeBByQNBiazDkUK/XNM
	PF0B3OIcnx4AOuhDZLPa96stu/ju9A9T8UfySBqCp2j/hQfIuFhX+CiyouT8t1M4NsjBJArbrRSUG
	zcUWkEJfnj7GyHS4Hy+jblJKCR4ZRTC0HTQxcUPsXfsjMKA1fdHJGhYe1vI61guEeosOfLpYlIY3K
	pbqp9eoTEIwE8f7qTrAj3YQsUw8cVFwTjDoOGwxbEqei6c9w2q0GfEGsfvUMVZ3ShzRQf4RdGLDR4
	UhpJXmkb236BkcjHJmtZC3n9i3nI+jzpyU0fzEv5YpIy2QU41SnC+znjpBlaVgwfJLqbhYyFQWIbO
	QjS1UuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teBHb-0000000CCGV-3Ib6;
	Sat, 01 Feb 2025 11:03:27 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teBG3-0000000CBQQ-3rN9;
	Sat, 01 Feb 2025 11:01:53 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-216426b0865so50158705ad.0;
        Sat, 01 Feb 2025 03:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1738407710; x=1739012510; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgviFgiTRKBQorySpqmLCZcfPI+S5PYXE7dN7JoWph0=;
        b=F57ciNY0DBbW8hW1BfSBkEXBpci1oLA6xhPkl0rhTIkym83cHPfnr46lpvZ5jkwJYG
         +XuiqSFgqFHhBIIb2GnKOf+GQ6jgQrW47bFUfdNUjqqeW26CDLXb4JoLuZ4WKsvvsPPd
         3n9abOqfgD+tiHEKn6CoP+q9eONOIe1U+Si7DKfpMkd7m6YtIEcmw2Uq7KRhqdDtC0yo
         PJ1/I3qo2xtrXB0H+85JgUiVIy7/si+H4jD/YF8xE5P2cR789FWz9zLWaXV6D5ix3juY
         Ivq6bnavsvTZzj9aXEYtrj5tsfZ0rAB8ynastCAhGLp/EleMuPs/LwFdJj7HdMBRy1gx
         dRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738407710; x=1739012510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgviFgiTRKBQorySpqmLCZcfPI+S5PYXE7dN7JoWph0=;
        b=usOamlVn89aD/r+fXG1r9HSHDQDddgJ0o0lN3zZ9BL2Jifyy7sGunKEfDopTOFJgqa
         bGqddSx5RlcrmOm7ZQeKDnZBijLIItYe7mkXMRmXN9hSBUtSqicQx/ikcmWi0SidEk4w
         AIk6aA5p7/7MPCdBMgF13iI2n9w/WWWuFKDelkLYoAi1ablDBrPX3owJiuDRRVTMNpcM
         JFh+L/qXmQ3bHdEDK+sPjniixBUKhgXlDTf/K6HoHrOeHcVSiea8YtCrsTggYB3S0IWX
         RBv/mZYWNADfelKKL3Tzr/A75x+6RkHulGb71jvT8vlBfy0uPm63kIJXOkGVGDu4fQb4
         vxeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg5Ypc7gtmbEtOCVJ4hcWXU4Msi9MRkBelyovJWIxFwbyKJL79vAWvlG0mGIGg6C24D7hypwYXvbGNAYtz@lists.infradead.org, AJvYcCWLgtBdegPn5kkoGCqzbDFs+nGzmuRKNF8Nyq1pSQsVAvXqzf8HwIqWqAaUhNZxC5+tcokmKeVWqoazxTZ1nqtugQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbNm14FPKtsEl9f8eFbuZlct5gEhDPd+vmPtrW+HmiTTYgfW2K
	TIrozVN2YqnCcJg05Bf8dHGsqapPaHbqVBa7TL3CO1W+Y3KEVU/LfHzDngpwJKi5CRfIcaR4VNe
	8dQHLGeRwyXNhADTtsVwvkDyljMc=
X-Gm-Gg: ASbGncvKk2lCjfWQpYzkvy1FWOuXGJK4gHOxPoesD0FEDobSXtE87yDamV7b0nczd3d
	lwuyFPcXcu1SCu7z13vtC/U/wFMDIJKQvOjfT3hm4uuTSRsjmzlYFPnbBHwwcLe0kY7gCRwM+ln
	7hyX1tMdL5stM=
X-Google-Smtp-Source: AGHT+IGrcFP3fi7nZj16nCl5OL6FPEPmSqptYgvrx04MREEDcnn7VynJHZBiOuPcwfy53f71XzvVP/oyU5M11jIaiKw=
X-Received: by 2002:a17:902:e84b:b0:215:b087:5d62 with SMTP id
 d9443c01a7336-21dd7deec73mr235159955ad.36.1738407710240; Sat, 01 Feb 2025
 03:01:50 -0800 (PST)
MIME-Version: 1.0
References: <20250131200319.19996-1-funderscore@postmarketos.org> <20250131200319.19996-3-funderscore@postmarketos.org>
In-Reply-To: <20250131200319.19996-3-funderscore@postmarketos.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 1 Feb 2025 12:01:39 +0100
X-Gm-Features: AWEUYZkXEqHyhsd8L6lSp8TYewHZzKYzaHWOXDWjpy_w3xCcDMFYNnIQJ6qrfB4
Message-ID: <CAFBinCA+=aqE_=eMFtwpHYVX+8CrtecvHexpHNe_7nh_dDhKYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
To: Ferass El Hafidi <funderscore@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Artur Weber <aweber.kernel@gmail.com>, 
	Karl Chan <exxxxkc@getgoogleoff.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_030151_979176_863DEDD3 
X-CRM114-Status: GOOD (  15.44  )
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

thanks for the patch - I have a few small comments below.

On Fri, Jan 31, 2025 at 9:05=E2=80=AFPM Ferass El Hafidi
<funderscore@postmarketos.org> wrote:
[...]
> +       cvbs-connector {
> +               /* No CVBS connector */
> +               status =3D "disabled";
> +       };
You're inheriting  "meson-gxl-s805x.dtsi" but I can't see that this -
or its parents - define a cvbs-connector node anywhere.
Can we just omit it completely

[...]
> +       vcc_5v: regulator-vcc-5v {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "VCC_5V";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +       };
> +
> +
nit-pick: since you're planning to send a v2 anyways, keep it at one
blank line here

[...]
> +&ethmac {
> +       /* No Ethernet connector */
> +       status =3D "disabled";
> +};
Similar to the cvbs-connector: status =3D "disabled" should be the default =
here

> +&internal_phy {
> +       pinctrl-0 =3D <&eth_link_led_pins>, <&eth_act_led_pins>;
> +       pinctrl-names =3D "default";
> +};
why are there Ethernet LED pins if there's no Ethernet connector?

> +&ir {
> +       /* No IR */
> +       status =3D "disabled";
> +};
This is also disabled by default

[...]
> +&pwm_ef {
> +       status =3D "okay";
> +       pinctrl-0 =3D <&pwm_e_pins>;
> +       pinctrl-names =3D "default";
> +       clocks =3D <&clkc CLKID_FCLK_DIV4>;
> +       clock-names =3D "clkin0";
> +};
Please drop clocks and clock-names to make this work with linux-next.
Background: [0] is queued for the next release and it means that the
PWM controller driver will now pick the "best" clock on it's own and
overriding here will likely result in your board not booting.

[...]
> +&usb {
> +       status =3D "okay";
> +       dr_mode =3D "host";
> +};
> +
> +&usb2_phy0 {
> +       phy-supply =3D <&vcc_5v>;
> +};
I'm guilty of this myself and I think you can be better here:
Use vbus-supply =3D <&vcc_5v>; in the &usb node to correctly describe
where the USB VBUS signal is coming from.
(I believe that the PHY is not internally powered by 5V as the SoC
doesn't take any 5V inputs)


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-martin.b=
lumenstingl@googlemail.com/

