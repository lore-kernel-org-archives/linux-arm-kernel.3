Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E2DCDC17D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 12:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lu4UdpjKL0W6oqeLyvjU5YjPqjVIJexotO7ZxwODpnY=; b=CsgTcOCYJ7vJqcJoz5Dan01vW2
	21YLBCWKrGaVepN6QWjCUAgLWs5FoNOreky9fOyEdJBGHCrYOgYlwHAhESOToTPFreaRZaB2QZ1OA
	1hRhLzbxhCPmPQ6cRH9evqk6wv3sBcUD6RzIPKFddHpYUWjnY/vwSUHAtSW2nXpersabROptEVixw
	cdbC4V0Mt45gx5d0l8+TEawMpKTczJNVoKFbdnf1mo8P6sqD7R04CtMtyzuCVqQFmMf0PUKUnX4Lj
	u0jZ+5eOzSRiutMvF50czqPJtY6KDkN+Stlfj+HNXF4ISBhsITveZxEmhxoOaKaqWeKC0QNJDpjRy
	8TBWpA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5th-0000000Cy2X-43a0;
	Tue, 06 Jan 2026 12:10:49 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5tf-0000000Cy1x-1F1c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 12:10:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a07fac8aa1so10043305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 04:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767701446; x=1768306246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu4UdpjKL0W6oqeLyvjU5YjPqjVIJexotO7ZxwODpnY=;
        b=e8/VB7fhdcVacbhW1cWyyrRdmr0NHZH5gBfJTdSMyS41Way7GP7s7bqSnZ2Efzf9RU
         wfXFhHEkAVAZKkq6c08IIuKwbV2K7zzv9BrFjyGTBsAuuCSe5aRZzdcavIpfxHtYeivr
         YQr1PMpf8WWOyyWJ2zwu7OY7HU7TPgpy6D2mxZBFiwpa2K6dz3OBGbWsJzmqYVRLDCLT
         6GYglPvmZcm4U/77tLr6zFOV4KKKqQrhaBLGqlEA7joNwTd/RyGCGtrRhmnjdxjfm8Ji
         +VcE2ymZ4JP02r/9up0Y8IxTjU0KTrrxkz3sekdtWSg5VZoG425KkaO9FcEe/3hqpFbU
         MT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767701446; x=1768306246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lu4UdpjKL0W6oqeLyvjU5YjPqjVIJexotO7ZxwODpnY=;
        b=I1BNc8IDRVrcUBmUfRXOqxjaM7j/p3lNxAPdC8LL/dnKi28Q/x+98sZRLIjJHB8Gk4
         bjv26f4YRwLXrpUs4WG9I5IoO9sBXKgJAz1tAU3k7+K4y2Em53Z/K0+K18WdMq/r6X9H
         9FCK7FH5ubImrKRufXFfLZG5hGde1gvnvKCIncwsX3BSiTvJgH9u8qHqPw+93rcF6bnO
         +eOA/q0ryOXjHdqAZfTUoacvyEYQl3wYXPl/dR0HZxaf1gpuUm3c1f6jthZg8qXpGHLv
         PYo5yE6VS+t7g572sHSahjNc3qhsf3FWnSGFKsU+Wt+WCeqNw9weGvg6S/QpopVMxWfI
         Xjbw==
X-Forwarded-Encrypted: i=1; AJvYcCUGonweFlKk1qkFn29z1ILGSw+c4CKRpPOd9LHnwfzNAhpc2433sz/V/d9lKm1fqFcgIJmBreMN1RJ/Je2fD477@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3G/M+qSGC3BwTt/n4N6qLuuGSaxiBt43A6PdktyxnHfhN24J/
	lz1owHusLkw6eYYMM+4YrE25YmPA+/WcH2GRmgdPy4CbyOJsiJx1oV7OilcU6e/jJlKymUzNH0z
	wfWcKaRrLhKpkUPwBI1WE9OSHiVJA7KQ=
X-Gm-Gg: AY/fxX7KfzRV/o+QpFjxPad5RBxFfdUcUdV0mxy3VzusvjCXocH8xyOG2TIinEn1BsU
	2y5XMXrGAPz2PGZ4Lr9Q6JxmLV0SawiZx2YBnOKv60tN3Q6OC/Z9WZBV5VtfzPuCA5Az1fFhqYh
	1bWQT5iFmmunBH5i/H8TCdqzO51FTQcEFOVvDpsQDRsAPo1OUMnGXTll2yVjfj69d+3nD+cluYw
	sQh8AJb3gCbYtfTEsPHnviBi3Gabi1wXLDyWp7zYwJ7kd9+KixrcuLJ+/cGO04n0WdL3TG8MBfy
	Qi0U2cUjfVH2lAigGwoDRUZjo3g=
X-Google-Smtp-Source: AGHT+IERFxDvDyxM58p44igbMDmAinSOq4k8E/VpLs0ECbN/nL2j5w231U1e4IjWyRKHGXv8g0yfXLtUOkPrS0reals=
X-Received: by 2002:a17:903:1b0c:b0:2a0:92a6:955 with SMTP id
 d9443c01a7336-2a3e2ca5661mr29241295ad.23.1767701446433; Tue, 06 Jan 2026
 04:10:46 -0800 (PST)
MIME-Version: 1.0
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com> <1jfr8jdomn.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jfr8jdomn.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Jan 2026 13:10:35 +0100
X-Gm-Features: AQt7F2rhaIwEaER7uzhe61Gje-3tMQEv-Jz_Lw7J4PipXub8W6EZ-9ebNWcXzOY
Message-ID: <CAFBinCALRXSmYQEXWWfOhXWUEKC8sYC5vg2=G0K+P=UK+TJhgw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] clk: meson: small fixes for HDMI PLL OD
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jian.hu@amlogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_041048_515739_4C0C87C3 
X-CRM114-Status: GOOD (  14.10  )
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

Hi Jerome,

On Tue, Jan 6, 2026 at 11:25=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
[...]
> > Martin Blumenstingl (3):
> >   clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
> >   clk: meson: g12a: Limit the HDMI PLL OD to /4
> >   clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro
>
> Looks good.
>
> I'd like to add a comment like this in the code
>
> +/*
> + * GXL hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
> + * A divider value of 3 should map to /8 but instead map /4 so ignore it=
.
> + */
>
> (and a similar one for the G12). Is this Ok with you ?
Sure, I'm happy to either have you add the comment when applying or me
doing it and sending a v2 - whichever you prefer.

Best regards,
Martin

