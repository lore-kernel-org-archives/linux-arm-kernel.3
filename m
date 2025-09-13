Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A467BCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 11:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbaWkghAVJNKzBV/Fp3pj0pkQCQlDE9HrxdJcUrmDgM=; b=UMIwuHnxjduSHU3WLgOU4Cnxrw
	Wo9BZuCsoYDoKBdNNtauXjThABylP1E2Fjy1bflLp16H5t4s8sM+DAUzKCbh3YPYp2GxicffenHcp
	dCt6a0PFnVwpKmyb1pUxTc/pAYBStFSvBjNao5GsMUXQvNDmyh8fbfG+Ff5aBDugqm4tJiNWzfNLR
	ZtgAI9gC+/HKdDIW/WXKxei76NM9/+qo2ZjAEaZFgoGViP5wGtyLDfk0tfq7cic2vRVY0Bwl2xqvs
	DXpOUMP11oDudlx9cwiyFPL5+ms7kV+rFjIV4eKv3926yaCfnqFf3p0z59ld/4NbwBwy5iZvSMDlt
	LzZpnaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxOTM-0000000EVLG-1bZb;
	Sat, 13 Sep 2025 11:31:16 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxOTJ-0000000EVK7-4B59
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 11:31:15 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso4911190a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 04:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757763072; x=1758367872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbaWkghAVJNKzBV/Fp3pj0pkQCQlDE9HrxdJcUrmDgM=;
        b=HE2t+QrYtze0LAndEwYql7iJ5v2RFtPyoS5ULkxWIcvPCleQIdK4LC1ZfZ4RErLobS
         zVGxuoW64o1Fk6C+KJ204p9oYH8i7evtzl3bkvLjDPfQe+dzURLXATlo9DfRiHeDU2OK
         K7YJKnWlstY1B9TACfrdzkORZFp9e2FL7ZTI3lRcFwvfmPdX2DUd7e871Qkz0eKsou8e
         WdVmRKVdMEaUIqsKNBopQAhSJMndPwcZvclyk3wZn365Esg+8/UD5Lem9oi9spQCDrPR
         oTNseE6tVPNLzVCxPhA5rLUKYprODy2UulFMrGGIE99FOt2sGjBhW5MlNJkfQowCstQu
         xUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757763072; x=1758367872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbaWkghAVJNKzBV/Fp3pj0pkQCQlDE9HrxdJcUrmDgM=;
        b=lYKuj4OmmXSJV0hbIhqHatbjFF1qvWBufEUjrCJL3mcCMOP863bQA6DBkf4BnyY+w9
         Na+BzZJ6zX8Fx/8ETBUs9lbUAvOVebF0AUgENku8VrxfWjrF6MNsQ67HXta9bdgi/Unh
         g8B+gjuc7sij1nXIvDjTS8cPpsb50m6XPvrCxok5+YnVnROcFt0JnL5n7AtdilnVAeJf
         0CCw5Zgbvq+FknNuXW42po5vkYU9NS4L2WbgdhC/ruQvryF+ekMlS5+XjT3YxkwuL7xP
         G9nDhJR0akcHApiD3Zi9dOQUh27AeQ/VOHY6paYBJ31xMzBjmn65g5d7i/kPOdQb4x6B
         fWVA==
X-Forwarded-Encrypted: i=1; AJvYcCUhvWPE7iMlMNx+X92pGgRA/GzgcHXRpT3loNtwBK/U6+KKGGMC4vpg1XDqEDn8s3vJVQ809IDIU1EL9oa+vf+6@lists.infradead.org
X-Gm-Message-State: AOJu0YxCvQtMR2CcqjgCIPgALTUDaU/CLu7wNJyAMEgqtEzbeYFw2PlY
	fXw2u/6q/fXxj4iEeAK9eNB7+fOMDB4xv/uSkHgdAcjQ0EzucEEX7SKu
X-Gm-Gg: ASbGncv1ql5UatvePMmm5ZNtL3ye8dy04k+jWqZ/brkC1qwsnTEEXhcm/jUlX6bInce
	07/jpp+9pIFzlUqVTuS27MtDdC6uVDSlyLnlkUf9LW1x6NfYks7M82OA8GakstOTNRxV4VszRYO
	Y0Y86bBjYLdd1lMy6tTR2IGSeFNrfA1wAG6W8XTImZq6jTpavLtUQxvF1/H69yXPVStvYfTGr/I
	NDGH7RrWy2DIBzPzb2oRjczhBXUFirmLcYpKFfgfntKgPleVGruMN8ZSoBbePt4hv6pCr3Q9BoN
	Zj754QfUtXKCOAPIackTh6SEMpu6wa/+nJTh72vn+HW0hfgV0wwalLkqEPECcK41di3jMMxdEj0
	6ZE3OBlGkQwrKE0RmFY9ztJEgaQKipP6QKpAKOq8qyHqyp5grGiOqfZU=
X-Google-Smtp-Source: AGHT+IGo8CziTZlFFDXaGrQNSM6imSKcLrT5E0r4aNs8WHUFIZfpN9rTwSz+1wD/ImFHnj2/i6E30Q==
X-Received: by 2002:a17:906:ca56:b0:b07:cd08:ff34 with SMTP id a640c23a62f3a-b07cd08ffe4mr358053766b.51.1757763072002;
        Sat, 13 Sep 2025 04:31:12 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da327sm560756966b.11.2025.09.13.04.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 04:31:11 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: allwinner: t527: avaota-a1: hook up external 32k
 crystal
Date: Sat, 13 Sep 2025 13:31:09 +0200
Message-ID: <4676490.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20250913102450.3935943-2-wens@kernel.org>
References: <20250913102450.3935943-1-wens@kernel.org>
 <20250913102450.3935943-2-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_043114_049894_0EC43987 
X-CRM114-Status: GOOD (  15.75  )
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

Dne sobota, 13. september 2025 ob 12:24:49 Srednjeevropski poletni =C4=8Das=
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
> Fixes: dbe54efa32af ("arm64: dts: allwinner: a523: add Avaota-A1 router s=
upport")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> index 535387912d9b..054d0357c139 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> @@ -354,6 +354,14 @@ &r_pio {
>  	vcc-pm-supply =3D <&reg_aldo3>;
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





