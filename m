Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E37F436BC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 05:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqIGWzZtvPAAeCWKpwkY2/edDBYVB2pJE2Twv+s/yFw=; b=FYYCo53OK9tWbpug57pVN8pjs3
	MRjLWr5bawvIEpPG1CVsqcJGhPFFt0gGuLuge3kHhUvG6BWV/RnMvn2ehMQZbAjn+AS9rDp7NWfRT
	zKcYyQXYwGtkM9bOtcIg9kzEkQHVXKNLwHlcSZ57ZMnysD/2dz7rXFg0R++bG2qDQps56Q6JVTaFY
	EEuuC3x/ncFPPFF6+KzuePa5vhE/fhGh+Yc2PUUj+0horZdL96Ks5hey9MHo2CpVVuJHaWgojbNRm
	aXjNkXQotEfQbSpkdQzpnjJ69arsQHFJapTOUF5b0zusQgVlaZc5P0+zlSqC36kj0ZipFfSEfn5OK
	rXUOn52Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDyFW-00000004l2v-1ubw;
	Sat, 18 Apr 2026 05:29:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDyFU-00000004l2W-3O5q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 05:29:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso16530855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 22:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776490183; x=1777094983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqIGWzZtvPAAeCWKpwkY2/edDBYVB2pJE2Twv+s/yFw=;
        b=YZ/GLF/UcQs+gyjjZhiTNMGiCA1Ptnh3UuXot0794zNtnP41y8lQ08frK8WY9UPxPC
         aBLSpmC+w2bCnmhv3O37o1pHSYMCaYY56f+08ZOMQFTpGy4oV2jfD/It2JFlgND8iB/q
         r11Ge2fVpBlI3Ufyy254mlYqQvBRipB12lG7c/T6E0SWVVNStqTFLhYnafjFd6UB2HEH
         us0AoBaqVSSuF3P2Kpm2pQBYfzdSweGhTviq5/lw5gmR1JBSxnpu58C92GpxkXbU3e3T
         E+xzgxAwUEDMCkklKcTJX4kjI50zMnFbC1+sCUoCx3fyrb2fT5mjLg04MnX/NcknfcvT
         /XBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776490183; x=1777094983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OqIGWzZtvPAAeCWKpwkY2/edDBYVB2pJE2Twv+s/yFw=;
        b=sh92C/FyNZs3gUwsqTbjoONRr3HZR1nfdOadO83ZqqjncX9LEn+Q3iW0twKDuBrrsi
         dGiPRLtB0x4E9Usf5QZh+AADK4l7xBhTNXta6spiMGEz9XamP9ZLOvwaIaMw10lQrmXO
         pSWh7jnleb1Q6vcRj+zeny08NQ7d4GjsyVLEt3avOHdzHFPXA0FQhg/wyO6KprcWf4fe
         cleYEoEEsNYyc6vEY/nhGiDe1ECNsHru5pDPwZqWu0yvGcj5YXoUu4Ft5okq24B8IG7v
         bKVuzfLJHW0igPcy8AIT9S4XEzrOUxCWYEEc7Gz/uu29XCHHfJCw459m03tWdtx407KR
         Blog==
X-Forwarded-Encrypted: i=1; AFNElJ/xI6H2xGlZtlXEO7aMDVkYE3bFwUqe+AQEQd7gacir3xgjG1UC9ZCMlzBSos2c0fTiQnyq6xV5dOKyCqWSuw9G@lists.infradead.org
X-Gm-Message-State: AOJu0YxvuWkEz1a0AppZLgUeTJKREWLNmd8HaGbrAC4WmcEpG9lxyHnq
	eO/AQ5p/Xc84SzR7ebe26h25PZgC5Td2JFiCP0jY+WScqbj5l8LhSepXrQ7vnDe3
X-Gm-Gg: AeBDiesda0PAIRv4hmsyPMiYIYFo8MJgU2hlkwaM/UTRpLrqcvV6XTy9zOaApAFx24/
	fx4+HX96KNlgTcKMcE6Vp3/oERdWLGN2gB6kTfldj4fbnZvTADXDUBeGEUmAlBDRlBx91Yg3xgx
	sW++Qq/5Qmr5B7yh4AgLDh2mySBvh12GxURSHgLoJgk8u8Dufbk68wqKmewYPzW9h5Jq9B17dA1
	xSoF0BdD7umH2u0SeXnJ3AAv++2L8YJdUEhAIQ8pDfltDYb60bbXZVMRajRbovTPsxcZll+PJMY
	+ZvoUnwvbIuUh+tocw7SXgyKZH63QYsKMLQRPNCOEpqpKxZ+YSerpfoliNzQsbNAPUwJ4ds3CUE
	FD6J3/L8Giwn/PRJPCJSIoRTdjEuH/AOBHZ3gh2c3xVFsVfesCIOPrv4MSRbRROJT4K0H1o3iwJ
	aUGLfyLemLS45YLiSyA9tqUTHV83cXY2Wb21VZczHJE23LRUoUYb0dftU=
X-Received: by 2002:a05:600c:3110:b0:488:8c89:cfaa with SMTP id 5b1f17b1804b1-488fb73841dmr76103025e9.3.1776490182315;
        Fri, 17 Apr 2026 22:29:42 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75ab25sm33521165e9.11.2026.04.17.22.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 22:29:41 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: Re: [PATCH] arm: dts: allwinner: t113s mangopi: enable watchdog for reboot
Date: Fri, 17 Apr 2026 20:19:20 +0200
Message-ID: <2825865.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260412-t113-mangopi-reboot-hang-v1-1-5002cfa6e0cc@mmpsystems.pl>
References: <20260412-t113-mangopi-reboot-hang-v1-1-5002cfa6e0cc@mmpsystems.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_222944_851164_4527411A 
X-CRM114-Status: GOOD (  12.65  )
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

Dne nedelja, 12. april 2026 ob 19:42:10 Srednjeevropski poletni =C4=8Das je=
 Michal Piekos napisal(a):
> Reboot hangs on MangoPi MQ-R T113s because no restart handler is
> available.
>=20
> Enable the SoC watchdog whose driver registers a restart handler.
>=20
> Tested on MangoPi MQ-R T113s.
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dt=
s b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> index 8b3a75383816..f0232a5e903b 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> @@ -33,3 +33,7 @@ rtl8189ftv: wifi@1 {
>  		interrupt-names =3D "host-wake";
>  	};
>  };
> +
> +&wdt {
> +	status =3D "okay";
> +};

Move this to sun8i-t113s.dtsi. All t113 boards have the same issue.
Watchdog should be always enabled on ARM.

Best regards,
Jernej




