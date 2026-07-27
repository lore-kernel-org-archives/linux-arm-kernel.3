Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2FBC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpoUI0pXe24xXjZcPALea9gBO3auN5oFlq0lj4D/PZc=; b=wB8+xiiLYYsTNNX4sBzzn0RaLr
	HvVeoxGCTMpKVnQp7mRF6+0KQVTrmSg9cSfcUVBH4kCbBpDk/XilibZ8/a3FyZ0fRveNvo9k5T846
	bpBYNb4XeU3npF7LFcGmeLjgSwnCOay5QEsSEtOnVUp9ocJYQFEJ4C+KtOyBBa/LhziCwL14lIi2E
	rIzvZvSF1rLIr+IbPSXGLrQAe+hbxaV6bbMH2Fd1Z8/cDYh06fgN7SMUM5P5neXm3lnoL4PplxsZT
	k064zua1FWCGnGXK1hMEEGqgKmT2txNj3QZbM14QZAh6ipXDKXlT0H+UvfXhzqg121L5RZF2QfvvF
	fDDaAH7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJCH-00000002YEG-1vko;
	Mon, 27 Jul 2026 11:08:37 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJCE-00000002YDr-3eHF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 11:08:35 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-69c20ba892eso5433972a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 04:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150513; x=1785755313; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZpoUI0pXe24xXjZcPALea9gBO3auN5oFlq0lj4D/PZc=;
        b=yhkdp2R7yuVcMJ8pO6HJTjXysoA82pluJ7F20jsD4ilartXlpbt1TM0R0rTFx3l6OQ
         igcc+V6I1IVLPOwMiNuAFoCxF2KJwLkA//2apN/ijyjEcVkGodQVERkcdhecaB/7a9cg
         FnL/CuS+TGSFMROjk+EP0G7bpZoMfecd4q++4gJeQYfBwlAGlMqijnyQT8xTZ6wMLXVo
         bB4MlMo/71i5qnaWJGVTMWewWLpjnLwwwIUuDHiPpV9ACmSIqcdaFtM5pSXP62BTOs4D
         Zr05lifePXpqKiDk/nU2rRo6mrAdKUZW/G6OgYrjUsN2aUJaQiQYdb9LN/hBW+IhHGhn
         SXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150513; x=1785755313;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpoUI0pXe24xXjZcPALea9gBO3auN5oFlq0lj4D/PZc=;
        b=aSVgsTduSAvA2AVLEvet9PZAfWzHYWEaOXVOjUZSbs2A7rtv+55ks3dcBbKVGBr7Gr
         CBGziqHh/OkA70SFJdBiO+Z69/x/cjnTOrFG7LeQazbO6KYLdi0fQLZ2hHS8LnyApqzq
         GrwHXaa+wrG5dWczw0/veJ8VAXBamqUXSGkaJUx9x2NhUoBhUU6/9kd60/zKtZAIU0XU
         mPM0h5KKOHPfVyOqd0gtBov/G4vPUvB/fMXTHPSbIRKSEwA7VAItUtrREvs4RJXO3uqM
         R6JaerzwGEQ6cwykV8gLG7yVcmkR6VvHDQUjf/6mkpaAuOBc1aW9nDUxKFUBn+Y+zBqS
         CNeg==
X-Gm-Message-State: AOJu0Yw24bpJYl5RCnYkCPbDAQrkT/uRuH5Ec0qltKArd/1PqIeHVeh4
	1efXBgIHVRRTyuoP2QpYuAPlg+cyf0Q/xLes3D1wjfBrU8LDwJrJj+C11kLn++wtEvw=
X-Gm-Gg: AR+sD12QZurHnx+cvyF0R3aBuYqwyfwxOlZknYHuQMz9FYCVgrcVNm7I9fenI6GMyHb
	v9+lOKBVLZpNhnj1dnooAiCLFyACNbh933jFeXaAidgy9TPGcla7o6qJkkro9OEETleZOiL0S6E
	BxZBQ1KUW/DbZg0hi6MNvZY3apGFYdafl0B1HY6JLncyacn+C2eXH4NiMFvGB5SS5xcjq2ef8sH
	isojwG5hOnsBM0nawWzDUX2sk91RdGnlewBiBYRN66XzNW6hxb7A+ScaqbZYGDVFejdxGhEE87G
	13ersphQIjfOANucmQ6Jr4N5Jzn2Cfxpvg7cKhr7p+xNCcoR07NS48Ru+migLiiwEubMKxPPr8j
	gwQSoxcO7OyFCWLqybNx1U9MUnuZXes6dfh0cpuiOpED6uXcW1dKzM5TxGWw36aVd8TzyCVDNVv
	fo5gN9LRbP9X2hNaco
X-Received: by 2002:a17:907:72c5:b0:c16:6be0:77d4 with SMTP id a640c23a62f3a-c1f1fcaf96amr403599466b.14.1785150512826;
        Mon, 27 Jul 2026 04:08:32 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f13cb4sm634351066b.61.2026.07.27.04.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:08:32 -0700 (PDT)
Message-ID: <c66d9d55d0c00e7ae43b9c075dc046fec2397a9b.camel@linaro.org>
Subject: Re: [PATCH 5/8] arm64: dts: google: Move 'status' to the end to
 match coding style
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Ivaylo
 Ivanov	 <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski	 <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 12:08:40 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-5-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-5-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_040834_949313_CD5A2820 
X-CRM114-Status: GOOD (  11.00  )
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

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> 'status' property is special, thus DTS coding style expects it to be
> always the last property preceded with a blank line, as reported by
> dt-check-style:
>=20
> =C2=A0 [required-blank-lines] "status" must be preceded by a blank line
> =C2=A0 [property-order] property 'vcc-supply' out of canonical order (sho=
uld sort before 'status')
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |=C2=A0 2 +
> =C2=A0.../boot/dts/exynos/google/gs101-pixel-common.dtsi | 12 +++-
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101-raven.dts=C2=A0 |=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 70 ++++++++++++++++++++++
> =C2=A04 files changed, 85 insertions(+), 1 deletion(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>,

