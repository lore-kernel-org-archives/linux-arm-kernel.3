Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE0CC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPXPkObct2Bs3tFQz0c3H79KmxSoBx9liY5wCkk/izg=; b=JcoAIVfCGW2vabnfTNZfykaDJj
	p8UuV7DAFKNfjL4aOl+MLoMpgRucROONuLA0WDMIgTrD81ge6spF5nklj2WS/TDk5Ih/Imn3NZExO
	uya/noyh4oc/74q1w+OX5zYdX0kd0EnMmaiLnhUKkDFvm33mTHoUqVRFCgrHyJwgBTJM5m85Ac2rG
	P3peaEdUVckCL/5KW5uOFSkLumYjs/N256gH0FBoF1L1J24oYz/mKmFLiC7wgNdDdqCsle+POm/yG
	Tnsy2quUZ4w4Go3PNTbFsekvMty4QKtytC7HHRaFt45L2NlaiZ/eOPkApLgr4+U3C6V9BqpAKqwaN
	UxxsZcqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEDo-0000000EMoJ-27mB;
	Wed, 13 Aug 2025 16:21:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDO2-0000000EBTZ-31VC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:27:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-459d4d7c745so61462755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 08:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098853; x=1755703653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPXPkObct2Bs3tFQz0c3H79KmxSoBx9liY5wCkk/izg=;
        b=gTBW+zy9EpBa+vRIb+1drJO7pxOUu9jAxxcT7bwe7FC8Vfnk+JquSUX2YpZnJbS39p
         4ymYfw0REDeZYFyQtNw0AvA/AxEOJEir1AhR33qqlXUvKW1XmzAM5WZErJdQB+VgGbJu
         1uDw1X7Rk+KRmhDSI6rsEREi6h+u4AlfAubcXfT2vVZWWbPipVutKa05JGDAaXU3ZiWe
         cxhpdtN0z5CfbHdt4Bg4eD+fc18e34t8JRskIpR3OgfkzkhhK7vRFYRN3D0bsQu21zcy
         EM3Fy0YhP48IBLNjxzjU4eReNRn/H6c+sv7ThPmG64qb5jm5mWW5jbveHFQXPAdXut/Q
         3K0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098853; x=1755703653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPXPkObct2Bs3tFQz0c3H79KmxSoBx9liY5wCkk/izg=;
        b=n9CN1MH/X9xw0AZmA5w9hwZCIDF+G+Sd5+YheYcWOqwJ21GJA/YKpJhwA+A3Xz0XO0
         HTqVoBlQqXIK4SSZJ4JoHd3LHiowis+ndrlUggAkJE1OfuGOieygMCPbJKihjNJqZ09R
         JHY9cf7HTSaFerh3irziI9WrF4iAJ0hc6ovh+lgH6e4MOkWrmc7BdGmPbPN+YY2oz9PY
         BYxs/kruZrAiTGsM5Fzfli5zf3MoHma98fojLYZw4pJPkR+OyXMoqEKtUeysc1n2p++3
         2QuZA7NMuu/mGztLm3ZnYrMOYwGtd8v1ilRyUnFKcuYEOl42Q1u295M5zuTRkunxksV1
         Cq3A==
X-Forwarded-Encrypted: i=1; AJvYcCV/Fgc2cjNKdq4rVUYDM1sDm9qMVfq6dqQ5Qt9zkmVqKPphvE7AfWjxqpRhK9+py+q9qCUmdezFyyFMm/WRU4vi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+0PFW6Vatn8R0Umn6Tv9Db4J69KX+5SeKjhIR+X4FcZ+pYRx3
	aeKjygiIqMUZsOO7+0K9IpdRBrx4bZl4fW6IkB39DnXas8pojXTGZQ82
X-Gm-Gg: ASbGnctb+PUhJH2jbHETlN87oE6cooB7QpEkrP/uVYScMqQE2RQhg0F/p+qWratEK7q
	d2h2ETGLC6ktRWCEdpiwIN8IKuCT6Iw6MdOPM1/LV7k/oscgB8T8a8DHrehCVRu/GDixvSj2XKg
	PAh92q0sElE/UR2Z8UHOglvSn5ADe0oFddKhep2M0K3MoYX5HkTr3Tl9ZOk5WUJGOj6rZzY2ZZZ
	pmj9UEVTXxT6qKaVLMkzm11noPDyOJa4aeVrc7vchJbNYpbG+pg2DVEezmcTL3TS0XsuzYYyOds
	0K0dhVSfrkgvwkFyz9yv71Dp+nBLLYXwMPEEAPptnMzc/UBx+nKZgV19sPz9kvF/aPOQepCiQu9
	n63oE4dEV4V46UPNo/3xdCR14LvFVcQYL4JwekWQgODeKye81p1KhjK8iCz/qcIXtvyK0AdhzbF
	2fpzrP6swgQ0ocbkDJ8A==
X-Google-Smtp-Source: AGHT+IFGLxAAuIuAWtxyOeZe/1vszbnNDC/nHj+B9y42HewYnwzUn1i2VqNgC/DnOaT+IjRwn6AcUA==
X-Received: by 2002:a5d:5f8c:0:b0:3b3:c4b1:a212 with SMTP id ffacd0b85a97d-3b917d1d646mr2962333f8f.7.1755098853098;
        Wed, 13 Aug 2025 08:27:33 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469582sm46991138f8f.52.2025.08.13.08.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:27:32 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v2 08/10] arm64: dts: allwinner: t527: avaota-a1: Add
 ethernet PHY reset setting
Date: Wed, 13 Aug 2025 17:27:30 +0200
Message-ID: <1928131.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20250813145540.2577789-9-wens@kernel.org>
References: <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-9-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_082734_758669_40205ED7 
X-CRM114-Status: GOOD (  15.39  )
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

Dne sreda, 13. avgust 2025 ob 16:55:38 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The external Ethernet PHY has a reset pin that is connected to the SoC.
> It is missing from the original submission.
>=20
> Add it to complete the description.
>=20
> Fixes: c6800f15998b ("arm64: dts: allwinner: t527: add EMAC0 to Avaota-A1=
 board")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> index b9eeb6753e9e..e7713678208d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> @@ -85,6 +85,9 @@ &mdio0 {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible =3D "ethernet-phy-ieee802.3-c22";
>  		reg =3D <1>;
> +		reset-gpios =3D <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
> +		reset-assert-us =3D <10000>;
> +		reset-deassert-us =3D <150000>;
>  	};
>  };
> =20
>=20





