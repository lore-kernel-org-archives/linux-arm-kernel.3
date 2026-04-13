Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288B4F531C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 19:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bF/zvI2KpjlnALCVbm2BiZRYcKLJLbXhP543C6RUbg=; b=1U7sjOzycq17xSxmoniUi7fO2E
	1me7xEtCp5eDKuhcayzPM0+3LWlgpcqrwMmD7UZUadRGAd09rhyLI0QoFkv/bTS9qijvpCW/S1keE
	f2xrxKcyhO79c1iHPvJDRJ1M32hbq7sTgG2MPQUzc0E3lKG5qqbBC7Ewxr5Up/pALZYDy3DoLJDXm
	9zstqsertOgh8soNas52Fs9u57NoTLCsNZwq160YOCBIn/4AUvm3P1pf/jmh6TOR5Hx19wraHjp7J
	eW72UpK9Us3KQhh+RbU1OSGEiqoQu3nxxWee8gfbY/zlBZq5Vy8D4G2ZSjx2Oi8XYIJA1wrRY4kRy
	Uf5QtECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMxZ-0000000GIrg-0BKN;
	Mon, 13 Apr 2026 19:28:37 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMxW-0000000GIrI-3X7T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 19:28:36 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b9c603ec2dfso637827966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 12:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776108512; cv=none;
        d=google.com; s=arc-20240605;
        b=gCDNevKV1k56EZdANCYKL/ttZyUD2Ob/+W++ma1NLVu23YtrA9+tzGin8wVf4X8Z7e
         jvo6zEduWPyZ5mhl69ze1ZYOvYgre6Gi6Q8D8sNQst6vKFerq3JukMry1Mcj3BkmDTp/
         9YwVbqb/P7M/lMKnZGzI5nPxGI1xyUvkEY2wsFAT89fUmrkOleutGf6AIWfGW4QmmrSo
         sQ91HSDdL2bUIsS7UDw+FFxvwsqLXhBaypLRyAujeWAcb+/kH9TcTb+fvSd/dnIV3xlU
         iOzRBZNoligyvcaUuSGySDfA9KblU1ufK4+U/5H24LZXH+MTSE4ixzx6UGzp8RtNbf1S
         fPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9bF/zvI2KpjlnALCVbm2BiZRYcKLJLbXhP543C6RUbg=;
        fh=PovRblWwqgwHF54fHxdu1K/mlVMJFQMl72jfzMXSnkE=;
        b=M96EQ/2ThAWvA1rRJvkcJFxRmkecfWQlOsibXbF4LbvtEuYNnbTem5FRorFoRQ2IBa
         pPVXbT8XzXgSscr4uDsZSoygp40BKqNUr/YnzwfheadeyGbX3Rj+CpNyZj0BhW472h0n
         KUnwGW5Q/spIkNUgvd95QzNmBq0bsUF55kdCSSpgcG1TZgot8d/zJ29JFuEOs8tTuK4s
         FJK077DGloPv03kV7TF1nZNG3q+55Z8z1aHbRGHi6cC3VYpm1vlvZPJm1VEHm4O9VgeJ
         rUHY2dc8eQYDsnmfdtfvydIU8seimoLbUse2frEQ6mImfo6EEgQ25zrhuvejq7hpiN0y
         28PQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776108512; x=1776713312; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bF/zvI2KpjlnALCVbm2BiZRYcKLJLbXhP543C6RUbg=;
        b=DWaUZqpOAYRTM9Ix0BcWaSRbjH9YzSLJMBXyZYrZelffmOgGn5c6mqC61TMXtSxO4W
         vs/OQgVHFYedaTwVcg0t8NJBSIiaqjBl3eaZoJzCaUQllLqp9utdGbjzn+VfPHDQYbJc
         FaEler8i6PMU+JuSJI6/zHXRWBUVnnkCImqHDwsGMpOo/Us/tXSvTYM3VLirI9FJq+b1
         FIZXJQX26woVnJShUrP2aQGZ+TgXg+GjUu59iX8YWKVt6t23MB0MDC0RtZr761k1jF3d
         BbAC+Y/neYPk6Pqk/GgTDiuRyDO+02gjAR2bT2TYeBOxXQmz5mBg+pexhJwvF1Ukw+/M
         f3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776108512; x=1776713312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9bF/zvI2KpjlnALCVbm2BiZRYcKLJLbXhP543C6RUbg=;
        b=NNxeetleAKNgQ/kwxPTPBWbxrBVnWlToLcb6rB+V0xuhfKibe4+piCNnGPRziiqOyz
         ZBFUKA1AIy/ra5EpA8j8yIaAxGLdkdoxScjFtc1crPushLm6sKOOMyzKVpaoZOym6Zvy
         kc2fZu7NDfZSoMWx402qFaZ7taIjZEELoGqW4JnzoI6WIPZ380Q2fUGPdN5SN79+nopq
         DYv+usOWeOuL0c4597/B+kN0exMui624GqJFboWExynAc8MOFlUFUj4jkwSctz9lSAre
         9DPASwBsNmPBU7NMCurlnuQyFU0oNLtoTr7MJZdVQpNVYB1OtKmgEsfhbaFQTHw2GJZW
         FNPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Kw/qfHPjjuhPpIl29XpHnSI8XSxfY+H7wK5g85a/x1IqPrG2woqtEa/hyfjcccAWeCne7hFLTTVbUYIVwP8T3@lists.infradead.org
X-Gm-Message-State: AOJu0Yx16oD+h90keDUJIrTULrKPBWZl21wU/koaNB0wlrIBI1jtCfRx
	lFw0QqOgmeGleBROoalN+f6RvcL9XOC/oVbPArMsRRxF8reSQy5o0BVwm1I9krTVY/JdX2LxI98
	+ZtHqwvrk3ccrrVk4YybDD319gpDIpFg=
X-Gm-Gg: AeBDiet6cuRistIT45QY6HcpRkCB9j8UAoI2CZN3LnZwnhImoPXeD35mtZFF/oBasat
	CB2yc6o61/jkjiDjZQ+GoJefj/FwURRafmDuT462hh46V/MED7aeY15O3xNa4BeoBdGmimPMUQB
	Nwf4prVS++KFtAEV7nvSOfPhHndGIYdbrGr5y/PxAQIuGSEKTjS3sFZXfJwuehwCm5prft+zCI7
	5XeYLmfGnX2e74vocAC2H7ctlV0/e0jfzIs+1woWx9nVgXaNn8WVCWuxTMhTUMtQGtp6JLWlx2q
	dvTmDKnbEjXJuEPDmzg/cdu6cAeFdqBUBH/sk8QxLcNf2se6ycD7dKyMDNU3TDY01IOgFzrShuu
	OlEfJWw==
X-Received: by 2002:a17:907:6c0f:b0:b97:e32f:7ee8 with SMTP id
 a640c23a62f3a-b9d7298ffe1mr758494466b.37.1776108511829; Mon, 13 Apr 2026
 12:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260413092148.3870746-1-arnd@kernel.org>
In-Reply-To: <20260413092148.3870746-1-arnd@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 13 Apr 2026 12:28:19 -0700
X-Gm-Features: AQROBzDRhEA53Q6D19izUguGZUF4CJzwH_A7MqptLtlQ6pim0lENIBLGjdUpTss
Message-ID: <CAKxU2N9iBwbt2frA5v3=BgAdUgQm6zSdVU01ZVV2AqOJb-ntRw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: bcm4709: fix bus range assignment
To: Arnd Bergmann <arnd@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_122834_908290_FBAC8B0A 
X-CRM114-Status: GOOD (  24.10  )
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

On Mon, Apr 13, 2026 at 2:21=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The netgear r8000 dts file limits the bus range for the first host
> bridge to exclude bus 0, but the two devices on the first bus are
> explicitly assigned to bus 0, causing a build time warning:
>
> /home/arnd/arm-soc/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:1=
42.3-27: Warning (pci_device_bus_num): /axi@18000000/pcie@13000/pcie@0/pcie=
@0,0/pcie@1,0:bus-range: PCI bus number 0 out of range, expected (1 - 255)
> /home/arnd/arm-soc/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:1=
42.3-27: Warning (pci_device_bus_num): /axi@18000000/pcie@13000/pcie@0/pcie=
@0,0/pcie@2,0:bus-range: PCI bus number 0 out of range, expected (1 - 255)
>
> I could not find any reason why this is done in the first place, but
> this can be easily addressed by reassigning the two devices to
> bus 1, or by dropping the bus-range property in order to allow
> secondary bus 0 to be assigned.
>
> Assuming the bus-range is intentional, fix this by moving the
> devices to the first valid secondary bus number.
No, bus-range is not intentional. It should be removed instead.
>
> Fixes: 893faf67438c ("ARM: dts: BCM5301X: add root pcie bridges")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/=
arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
> index d170c71cbd76..355be5014943 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
> @@ -147,7 +147,7 @@ pcie@0,0 {
>
>                 pcie@1,0 {
>                         device_type =3D "pci";
> -                       reg =3D <0x800 0 0 0 0>;
> +                       reg =3D <0x10800 0 0 0 0>;
>
>                         #address-cells =3D <3>;
>                         #size-cells =3D <2>;
> @@ -162,7 +162,7 @@ wifi@0,0 {
>
>                 pcie@2,0 {
>                         device_type =3D "pci";
> -                       reg =3D <0x1000 0 0 0 0>;
> +                       reg =3D <0x11000 0 0 0 0>;
>
>                         #address-cells =3D <3>;
>                         #size-cells =3D <2>;
> --
> 2.39.5
>

