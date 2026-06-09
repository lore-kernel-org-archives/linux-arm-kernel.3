Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F3ACD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 11:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVtKsScmZpYoItkBLWZrzYfhywAVGgLQpel9i66ubjc=; b=cwfuQjQlcZafAof1ztwzrFaxqU
	ICjdzBPv1cxvonBYyqJ1z3E/0wosAYBzorHzutB4Mds8SNPQFt9Js2nRcEBG307S+TPl173JYII0D
	XcPeOIjwhGw8J7LnuaQWTg5177LY2G5iOCg+EQhmaTTPKjLcdB/OUwlDj/LkS07XUBOJjN9SJeZD1
	x47cDssFfYqAYBmODCg57ZZHwxhjJ65CQ08TVZ6rbUM1Ld0n/Eyv6d1LpkEa4SGaBYJvHb9ZOlGNu
	jgT7KkHMEqmHBdZ3CNLlHKOeWX0QsIwX5pAPF/JUSUiGa6lbetRgww4QPbfLvJGCGWsupD5jzY18X
	6/UpWL7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWut5-00000005Skw-3bUu;
	Tue, 09 Jun 2026 11:44:55 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWut3-00000005SkL-18IS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 11:44:54 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-68b90fc6a1dso172197a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 04:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781005491; x=1781610291; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jVtKsScmZpYoItkBLWZrzYfhywAVGgLQpel9i66ubjc=;
        b=upzKty7ZlaPi8Rc0g6IWwuAJDNbNszLeUVA3EPn9Xsm7fRDUdStBPe7oO80sNgA8Bn
         vKiZxJsyVGvypm6XUPVZLmFt+WqtXr/PhKTARuD3cmJDfITM4RbXEwT8HACVEqGQAaDW
         qlFuBfrZZm3m0LX3QNPXeqpxQ/GQP864E4hhFSiWG2J844vgGJz8TFhkMdCR8TOr2V5c
         0R79K2w2hCKbijsMqukIu7xp102fsQgZvv8AzeiOE0hB2xT5NsI7FIJxgFXnFvak99iR
         UeCN+6rK2XkTPplqd5MV2kUvzT5HKV3MXVI98Eyu2WSNaQADDTQL6zFrTSp6llwgr4dP
         uYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005491; x=1781610291;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jVtKsScmZpYoItkBLWZrzYfhywAVGgLQpel9i66ubjc=;
        b=H/dZz+koNF5MEXqQ6HoUQtspS+cPnuQqfXBBcBtsQ8nfLP39s4oleBmnV3lxZMZoDi
         QHnv6X3t4+z0n9f1xzmLt1AcYniyCJRXrk4Nko1D3wei51K29SeAOwrvbjCbyQ0QqVkP
         MbREuZ/kbqWFlbWQypzOTVmljGqSnXm/s05F8plCcV9AAjOrrwy2QrBXeZs8yQyjFZAB
         KP6g+MNnFUE/z90fSxbLg37UeVXg3fsoQmvnB/npk11X+oCbkzhX1x4SFvB2CW+AbgDh
         roknEExq9OqrXh51LpfC3Wzdxuv7kxfta3O//+ejWbrT/Dm7k1fIveXay/aNMqRjgGky
         VQqw==
X-Forwarded-Encrypted: i=1; AFNElJ+IvS7vEJj4EItxoOWRxXV188nuCmrGoVx0yw7QlGx91nsqWYXJniGd6RPl+BowzPeSfAnFvm2hGRu21Bxfsrz9@lists.infradead.org
X-Gm-Message-State: AOJu0YwlytiEZcjjXB99c+mkA1sPbPOcPo/arrNEdt0EX9uROLFzikrQ
	u+rFz4uXz76Vv1VLEOvjyZzKduQimdY0mU6iwIVG9izfHUQYV8hvQ4rOztWrjB4BlTA=
X-Gm-Gg: Acq92OH8O5AyQ67P8qhywf5aO/iXVNQguFyPbHWNAMAAAflCYLomNQuna05T3ZWUpgF
	5pEM9uLvDSNwpnmf+BdTzN0PkPiOT2NKC3hG0yNx6sfatfYhUN6nTWcxO96PGI5N2nuEG34K89+
	Cyp/z4/nuGlYRNMiYYMoymlxqOduq486DNzfqtROH7a2t/hNvNUlcdJmAWh/VN75H9PwGoMIIF2
	FVJlufEva6YT2Mz0J88xOzgY6dlrg5UPovGB6uq29/aMMO1DrtSm9APxU8SaNV72CNl/F4/OSqA
	VbWDYYpqUG4tPDXVsmWnKCZidcr4fV98ZHBLyzGXEFDQ5SwsdiPVIPFdd39UcZ6u3Q+taBO/avj
	VpxWR4e8LEyCShGx1NTszmI4gLKNHNU9Nfw0F61fVU2NkTsk5a9CApJ5lYDC65V+88AACdsOS65
	YchP1Bve2V20c71VveqtOyzLI7MlfPyjmN/iwkfZJVs44RAh94fCU62SM=
X-Received: by 2002:a05:6402:4250:10b0:68c:3439:945f with SMTP id 4fb4d7f45d1cf-68ff217a53dmr5586490a12.12.1781005490656;
        Tue, 09 Jun 2026 04:44:50 -0700 (PDT)
Received: from [192.168.107.26] ([80.233.69.159])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6914f3b583bsm4516495a12.29.2026.06.09.04.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:44:49 -0700 (PDT)
Message-ID: <08d7299968e14e5fc07fa4791479abd9a2b11c2d.camel@linaro.org>
Subject: Re: [PATCH v8 4/5] arm64: dts: exynos: gs101: Add thermal
 management unit
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"	
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui	
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski	 <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva"	 <gustavoars@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 09 Jun 2026 12:44:47 +0100
In-Reply-To: <20260603-acpm-tmu-v8-4-0f1810a356e6@linaro.org>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
	 <20260603-acpm-tmu-v8-4-0f1810a356e6@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_044453_335617_64400900 
X-CRM114-Status: GOOD (  10.38  )
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

Hi Tudor,

On Wed, 2026-06-03 at 13:00 +0000, Tudor Ambarus wrote:

>=20
> [...]
>=20
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index 86933f22647b..b6866ef99fb3 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>=20
> [...]
>=20
> @@ -639,6 +647,15 @@ watchdog_cl1: watchdog@10070000 {
> =C2=A0			status =3D "disabled";
> =C2=A0		};
> =C2=A0
> +		tmu_top: thermal-sensor@100a0000 {
> +			compatible =3D "google,gs101-tmu-top";
> +			reg =3D <0x100a0000 0x800>;
> +			clocks =3D <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
> +			interrupts =3D <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
> +			samsung,acpm-ipc =3D <&acpm_ipc>;
> +			#thermal-sensor-cells =3D <1>;

Vendor-specific properties should always come after generic ones
(samsung,... to move to end here).

Cheers,
Andre'

