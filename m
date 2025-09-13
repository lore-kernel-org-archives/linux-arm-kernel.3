Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAABFCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 11:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhiOMZzJmlK07q9Yx4eHe//JB/+U6zF5S8d+vjc7i3g=; b=jz8EGQoyiuCKleS1UzR8tHj/D0
	jO0i6Zr+cpGa6KT/TchTksWzoosaR/P+HLQ0cJ0S+nvNXOYmxUicaLlzocABVMHaDrS3LZi2sst2E
	cFnN7P4btwaAjPvdWfvEtH/82IMou2g/X1Zx9oxCiWYWehScD/eMAY1CoNyZ96ojInd0nryiZp+GG
	luFNTpJNd+U+ssJyZCeOmfAL3JXqpwADBoTCS+JqTZ6ThJE7tUbHwXg4EzP4uR47o/dSiksp0nCE3
	u42orHMZlmZ68im9aj50rjkxIhNba6/8gsnRzJytKTt9prFCYVX8czuYy1sTgtE7pFw7c8iFsr44M
	YCWuDyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxOTr-0000000EVVI-0koC;
	Sat, 13 Sep 2025 11:31:47 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxOTo-0000000EVUO-2b1x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 11:31:45 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-623720201fdso5471034a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 04:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757763103; x=1758367903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhiOMZzJmlK07q9Yx4eHe//JB/+U6zF5S8d+vjc7i3g=;
        b=EnbIZ4mYj/flL4aDIojGWIvEDvK2l4PPKoEMfycxn3073Qn5JffNipyZvtSUhLPOeq
         LTjRKcHNYhwD2rNPAL5QoXThZhODQjSErAhHwtoOZ4DXCTEEZr10IJk+a1QhJOZHV3pZ
         dPlFKlJzGzxXIAq5wQrLO9yWoD8es05CAE3pSA/Sjxy9KcoovQrARHGl8KCcIIzHQkfa
         fSlDIsHhCSn2aHd4I/o9B70iCIgF3xLk2dCKs4oq40NsQ9IaHhzu6hLQJ5EtwW4zQbug
         QHc4qNTH40YEEuacsF3eJhMPDqFtzc8ty/YeHavTXuzSDfY9YbBnsqu24KCX7Uichd3X
         docw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757763103; x=1758367903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhiOMZzJmlK07q9Yx4eHe//JB/+U6zF5S8d+vjc7i3g=;
        b=XXkMfmENY/fzahkRuRguRFnpEm9aIeEIoBf5+DeiHVSm8NghD4U/Z1N4kCkCMffeXM
         RXRJwkdNdXNNoHJc4aAHMZGWWyHcG9sYQOcZ0DfYidUwP8Qt5mgAAqyvFJYOPK3cZjen
         HDpu9Izw88IMrXbjhp5pPw06F+gRfVkab0s0Y/fAkIUfRy0SexaHi6sxGFsG4XWToFc8
         5oQ9m3DBobi1rZ35A8RiHKaXFxqTv8SeG2ecqGOJ1mYg/2pAbv43htPcBHVE2AjtZzo+
         +X0xeH/AJcdbo0laeceF5UvVXMPGAkn79AUSAut2m65DjEEoQg19J9aQhiQrAvh4UbTQ
         GkNA==
X-Forwarded-Encrypted: i=1; AJvYcCVkvFnLadNlyxIxuk7XAbgXc+q5a/sJosywnZPbTyfX7AD6aDN+4WV3ILvALo8NZdpMLIlhienOugOnb3iZ8HFV@lists.infradead.org
X-Gm-Message-State: AOJu0YxyMqoZWruIfPZMbosqCEGM03SNbTx5ktlDPgRvhDZUqPvQ9/iS
	xDuhS/l5LopUf0Zq30No8e5ICmvlGgAsDd1XbedNMd0jusdL2HUxGKt9
X-Gm-Gg: ASbGncuHhWSNz8AtltYpVaqiOPKyUsLKmu9lMiX+ItRO5kjBqtynuJ2z+XYvl7/d/pq
	vwUZr5UeL3QfcTcZch8eBooVmKkwtHvkFWgSkPZ4HQTFYGGqa+T1L/ValrrU+RNpopHO+HBwDX0
	rU5NRceDkh3ST+WMiPpw0m5AQVDzlJNG9xWKBEa7FrJHVBavLKnBPzvWjv+sX37wPmhohJZ6QIR
	fRe0S4l19eWKZ2Wqr5TN+Gv8VQb6zUr+E0fXYUcpgNLBiUSJuBcHcnamyNb7dFc42xdwzhjDsZS
	0yjejOIyb79F6ZV0sZsJVp8s0+G+WEnDmFhSjUOKVaOLwItVqvGuzntjlbC+lBMkfHrABdBwLO/
	Y3+CL3zqWnQlPzvik0sbs3GYO9jVMPjs4T7V8t/5g9jSUbAdbspzfq04fG2dU1gXaLQ==
X-Google-Smtp-Source: AGHT+IHykb2wro/3EPEKGFRhfZdxz0R+s5067Brp4xRx1L5hET4V9Jhz88T1kD9l7Nn6Y1hOSTS1Sw==
X-Received: by 2002:a05:6402:5204:b0:62d:b1c9:f0ca with SMTP id 4fb4d7f45d1cf-62ed80c9f05mr6124659a12.3.1757763102637;
        Sat, 13 Sep 2025 04:31:42 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f136cead7sm825431a12.36.2025.09.13.04.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 04:31:42 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: t527: orangepi-4a: hook up external
 32k crystal
Date: Sat, 13 Sep 2025 13:31:40 +0200
Message-ID: <5009461.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20250913102450.3935943-3-wens@kernel.org>
References: <20250913102450.3935943-1-wens@kernel.org>
 <20250913102450.3935943-3-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_043144_670867_C0A262DD 
X-CRM114-Status: GOOD (  15.95  )
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

Dne sobota, 13. september 2025 ob 12:24:50 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> When the board was added, its external 32.768 KHz crystal was described
> but not hooked up correctly. This meant the device had to fall back to
> the SoC's internal oscillator or divide a 32 KHz clock from the main
> oscillator, neither of which are accurate for the RTC. As a result the
> RTC clock will drift badly.
>=20
> Hook the crystal up to the RTC block and request the correct clock rate.
>=20
> Fixes: de713ccb9934 ("arm64: dts: allwinner: t527: Add OrangePi 4A board")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/=
arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> index fb5311a46c2e..f71860db83d3 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> @@ -393,6 +393,14 @@ &r_pio {
>  	vcc-pm-supply =3D <&reg_bldo2>;
>  };
> =20
> +&rtc {
> +	clocks =3D <&r_ccu CLK_BUS_R_RTC>, <&osc24M>,
> +		 <&r_ccu CLK_R_AHB>, <&ext_osc32k>;
> +	clock-names =3D "bus", "hosc", "ahb", "ext-osc32k";
> +	assigned-clocks =3D <&rtc CLK_OSC32K>;
> +	assigned-clock-rates =3D <32768>;
> +};
> +
>  &uart0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart0_pb_pins>;
>=20





