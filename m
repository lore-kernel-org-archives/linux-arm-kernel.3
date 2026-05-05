Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FD3FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApEyVbHibMfUXEFKd8vG2mJSusEJJaisfPMffm8l//c=; b=u2iqDWBWeJIXQ6ZVGLk28wv9+Z
	FrrBS4ffPAa5BECy14hY8fygK0G+VoCcyqyBwuPuCJzqZcmOQBmjO3J/qAJ6fM20b1aQ1megLkNFd
	wpgNTYebu5wDvES2v6bYoiCEtmaoA8QF4w0m2E+eB61XYdTvlXr+ujHpElnNdQo07sq4n958TeUXc
	AmfWkF4waToVJGWjK7inu7KVK8UsPyZ/PqbEkuyV70EvWIICwzVXMBUiZqUfZ29JFUap8lsJSQPlG
	0BeoPQXt9/uyI1COAkGfNmwZGygY42xS5K1EjzaaSUoPu8Fe1Lp8gn/NnfCVqBLgMK+NQ+cRGjFJF
	b6QcXF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIYg-0000000GrkG-0SwR;
	Tue, 05 May 2026 16:23:42 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIYc-0000000Grjh-2lZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:23:39 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-44a14580111so3478785f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777998217; x=1778603017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApEyVbHibMfUXEFKd8vG2mJSusEJJaisfPMffm8l//c=;
        b=VeBy8lNylY88t0ZnJk1nG4q/nDVAfKSZVtLD5Jx3adTxsvVWphYpdJNzNE7pynvcfo
         faWu+rLeGBTeo5gyfF0ca8GwMmE5JfzFWp4v4cXpSPV8ZeKJ//Ox+s8PbPsx7RJkyquJ
         zn6FpumuLC6aT3AdDflNzK4yLy9Yl7vXhhCDYDYzsN5MDa4Js7dy5C0IMAKdscEYz794
         5z57K2JkkFJATSZIT98lkL7qAo5RdZt801HMZ/ESTr2WRbx9ZQd0TfsB7oqiTYVCcYeK
         Pz0QU0pvs6cZBzeHLtJ5oTZpp9+bRHwrqhCqNCSTJY6+t6ULAlhinn4Pkdy/kroYpmpm
         LrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998217; x=1778603017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ApEyVbHibMfUXEFKd8vG2mJSusEJJaisfPMffm8l//c=;
        b=CZd01gm8SrwYxI8I8qwtYuNMJvwVg7vM6MYU1h12yxyPD0LtT5HEKANNvCFMhIviOT
         et/SpGrE35gd3gkeeLV6a0zNfTy1ZqnYO6ssKEzYTp+3KgfF9mKncVyQvsBMdz3BfILS
         +HLFfdt0q+rf6EkeaoHAv0yhknQjkZ3EoRRxBS1FXbqfHvOxWxHNnkhCJeTIZkGclRnn
         u18sMNv/U8jfaWO1fQZjHP/Dk2P7spJiA5heHEVflMQ8cMfLuJEt9fqmAzk/TBbNz+AE
         kwDdmrvA55yhqc0G7EUHii19wMUPGhuO63l9PtItKdJXWb3VY31r56nBXM3H3h8T3pz4
         eL2g==
X-Forwarded-Encrypted: i=1; AFNElJ/hZyjOgYVZb34rPXTII71DP22Nk/1puUPBuiJRb8C9CWMxyMG9UKD95NWU4CUs+nxdCL5KLBaRv/TTlnjriuJw@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi4msyByL1NTVjY8G1BVQ9m/InU15RjYLfJLj+8Z1nTdot5Y3m
	/s7JrBYOVPXnn8upfRAO/bPSiK1TGBgDRDonKvGQ6gQDzutMDf9Hn1xBmlzY9W24
X-Gm-Gg: AeBDiesU0TLRV/A3z1WmR/rrPaoxB2FIll4QMnMfhZRNbe9x4H/P9y410NpBkElx0SW
	AI509ej5XDIHOJGiNCASDGElmhoIovrWb1gZymGIKZvRostJ0nlKGe4vfE4Eqsbafz3ArYDB1vK
	47Sx9FyAji4xbh3+1OUnqzeobrW+28PsLH/N1ARgCHXYecBTOJlXLeX7p9Yd1Yv+kHd3xUHVxZ9
	ziirw1LgN0JnpwLQT2vV5zQo9/fekPhEMOvwX0oK2c8PqmuG69F0Rx+XD2mZ6gOIx3P7pC2H20Z
	2ZaQrZNQZnLEPei180efxugAa9t2fRrMMZNZat34QrpVYoDlWlWWAultzLUnnFik/quF5UEnaQ7
	DfyXVqrdAgx4lomkVmE41Ij+PRxt0iM1IEv9LIuPeUzE2KjsalRhAAZwGKkx9ziQ1gzKXIGu+va
	zhG9Jsv0lxZgHV1aeCJq+8SC0wbcX/hAy/h+xqsoe75rn9lXgh1VECOq5EH4Npd00Dk5WX1zIgL
	wXXtDWe0kBth9k0KnP7G5n8C1/I
X-Received: by 2002:a5d:5d8a:0:b0:44a:2555:f8a9 with SMTP id ffacd0b85a97d-44bb3c94c11mr24734377f8f.10.1777998216446;
        Tue, 05 May 2026 09:23:36 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03e04sm5934939f8f.21.2026.05.05.09.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:23:35 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: Re: [PATCH v2] arm: dts: allwinner: t113s: enable watchdog for reboot
Date: Tue, 05 May 2026 18:23:33 +0200
Message-ID: <sv5CLRHyTX2Cm45r4DQahA@gmail.com>
In-Reply-To: <20260425-t113-mangopi-reboot-hang-v2-1-fd343207a4be@mmpsystems.pl>
References: <20260425-t113-mangopi-reboot-hang-v2-1-fd343207a4be@mmpsystems.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_092338_737988_F543A1BE 
X-CRM114-Status: GOOD (  15.33  )
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

Dne sobota, 25. april 2026 ob 10:19:40 Srednjeevropski poletni =C4=8Das je =
Michal Piekos napisal(a):
> Reboot hangs on T113s boards because no restart handler is
> available.
>=20
> Enable the SoC watchdog whose driver registers a restart handler.
>=20
> Tested on MangoPi MQ-R T113s.
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
> Changes in v2:
> - Moved watchdog enablement to SoC level dts following Jernej's
>   suggestion
> - Link to v1: https://lore.kernel.org/r/20260412-t113-mangopi-reboot-hang=
=2Dv1-1-5002cfa6e0cc@mmpsystems.pl
> ---
>  arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi b/arch/arm/boot=
/dts/allwinner/sun8i-t113s.dtsi
> index 424f4a2487e2..d3bbed84eedb 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
> @@ -34,6 +34,12 @@ cpu1: cpu@1 {
>  		};
>  	};
> =20
> +	soc {
> +		wdt {
> +			status =3D "okay";
> +		};
> +	};
> +
>  	gic: interrupt-controller@1c81000 {
>  		compatible =3D "arm,gic-400";
>  		reg =3D <0x03021000 0x1000>,
>

=46ollowing, at the end of the file should work:

&wdt {
	status =3D "okay";
};

Best regards,
Jernej



