Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7CCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9deTj6/vvguCX59Rp5CA9tK97aPiY1BmdFL+MDFSKko=; b=0ImS7LHOjkUFSatxbBQv85ZiZO
	/Epth2qPVoQbRzxMLdaIPyEKhSVPE46Zb0eH3EHHx3druK5RwjPZnr7NA9NI2EX0SeKgtcKYMDWR2
	lvoaGZnJ3IeMFHk87rwlyJ56Gu8NdEPZckzS+Kd5Mrs7G4pR1I4bUXnTUAkdWKk3Tl/Xi7WKbwQfx
	C2Hw6vbaaXYFIADtJ06uKtYUaT7327KBKZ0Ht4SrHwpymloUn9tSmNcXoLd58jPqd2r05zCbXdB/d
	srdF0DhDFjzjrHB4lhs83ieN7NJzOdNovEgU6eaEOTRtbr49nG61KRqVeYYKGxAVTB1pV8wUdrT6P
	kuDPghkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSrQ-00000007tZ5-0ucI;
	Wed, 08 Jan 2025 10:00:24 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSgo-00000007rYF-0RCE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 09:49:29 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3ebc678b5c9so70466b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 01:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736329765; x=1736934565; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9deTj6/vvguCX59Rp5CA9tK97aPiY1BmdFL+MDFSKko=;
        b=yG0/pyIJkFjExS+Oo+gwtLHK9WbwiSbi4dMfs02bm/Nti3eFfZg5eo8UkXQHOFnBR2
         vRt7A1iiY2nOMI3dRZ+6xVws/UdyJzdQcpP05pblK86h/TxYkN8UcdEzcMTJWfHGol4n
         EetKhiFmsiqox1C7jzx8pgrGdFtHWevZFOv7qkQfP5WObYIcDfYwLc7a9+FA67Bkgmv+
         qxRdzdzzxU47Fm2vEoCeDBXQL4VXhGiILVv+hY93NBR0meWzaWCVvn8LpqSfk94UZSq4
         rci3enL2jmwSVzFPQSuRhddT1e+TLkaAqDAOvKXoxqxJMOC4dkxx0ZnCLEm3oZMKkWO0
         NpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329765; x=1736934565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9deTj6/vvguCX59Rp5CA9tK97aPiY1BmdFL+MDFSKko=;
        b=ZoaGhp2Kq6D/hr6n1mtikKXrsxFxzV5MBtCXYjRHOE87/wiAqKNTZuieGFFegnrbEX
         R2IF/EowjzmZfCoFOqU1vaOLAmeiCxXdtuAcUJVJqwqdr6YfL5EYTqJMjJcyKue5mT4m
         RQPNGBwfQj2O/Bt1+yaccAbdHzPSWGxmvPKVELceEdBfji1RjbQ8GNjEuC9pSK69QUBY
         gpB5UwDfuajDEUV1LG0zdxurGYSJEB0fc1Y0NqYElZWKiFTxsHLjP7Z/bll/LzUjCeOm
         S8ivZIRD/iXLbLpZ+Z8f6nvIn/SQoMLMvswDLsyTvleRZORll7PBEl+hofTTZjlFm1Fd
         hYSA==
X-Forwarded-Encrypted: i=1; AJvYcCVTYfoTby2OflWs+PoF+pn3emGu0V4Mw3bvfE0UTdbGHoxciT4oKUrSdXu3LYbL0NXyiXorUqQiZC9d6dc0xala@lists.infradead.org
X-Gm-Message-State: AOJu0YwAVXO+2KXUB/ijbjpUF0v8VwxLnIO10JPnnIfM5dnCfoKOa4Qs
	udOOEvcTR9y0zYMEgnk8TIxWLfmwFGG0M0t3HwGsBgzS1UkAlBuvr/QfJCLOAxOQH3WOpTzJE12
	0Uu4cV1GrwWG+0gxg2qk9EH2UTfaDsHi832OkWQ==
X-Gm-Gg: ASbGncud9DQNiJI4RmiXYPjIGss77fcjm3m/trTueoctw1/xXRQ8gnmtd3i6UXEaax4
	BEwZoAPkOesOoWblQO5qJPa249JWxadRkiKA8qeQ=
X-Google-Smtp-Source: AGHT+IHZ2qa5v003ct1VSkNjp4+W849xZ86hZNQfh08NEbSUCMyVnvNz0IJm/V2fxZ6p4xrdj0xHIGvA99BCjD8jKng=
X-Received: by 2002:a05:6808:10ce:b0:3eb:6044:5a8c with SMTP id
 5614622812f47-3ef2ec96526mr1173978b6e.20.1736329764752; Wed, 08 Jan 2025
 01:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be> <20250102-b4-gs101_max77759_fg-v2-1-87959abeb7ff@uclouvain.be>
In-Reply-To: <20250102-b4-gs101_max77759_fg-v2-1-87959abeb7ff@uclouvain.be>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 8 Jan 2025 09:49:13 +0000
X-Gm-Features: AbW1kvYKpkuMkeIC0jLCwnzruoE9AbHyOFZse_X-2P5ly2F0MUO4jvDNj5kUorY
Message-ID: <CADrjBPpkiNvxGjw_iLG3tw2MNy62trao+igaMMX_zjL44+w1EQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] power: supply: add support for max77759 fuel gauge
To: t.antoine@uclouvain.be
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_014926_964477_19AEA76D 
X-CRM114-Status: GOOD (  20.26  )
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

Hi Thomas,

On Thu, 2 Jan 2025 at 11:16, Thomas Antoine via B4 Relay
<devnull+t.antoine.uclouvain.be@kernel.org> wrote:
>
> From: Thomas Antoine <t.antoine@uclouvain.be>
>
> The interface of the Maxim max77759 fuel gauge has a lot of common with t=
he
> Maxim max1720x. The major difference is the lack of non-volatile memory
> slave address. No slave is available at address 0xb of the i2c bus, which
> is coherent with the following driver from google: line 5836 disables
> non-volatile memory for m5 gauge.
>
> Link: https://android.googlesource.com/kernel/google-modules/bms/+/1a68c3=
6bef474573cc8629cc1d121eb6a81ab68c/max1720x_battery.c
>
> Other differences include the lack of V_BATT register to read the battery
> level and a difference in the way to identify the chip (the same register
> is used but not the same mask).
>
> Add support for the max77759 by allowing to use the non-volatile
> memory or not based on the chip. Also add the V_CELL regsister as a
> fallback to read voltage value in the case where read of V_BATT fails.
>
> The cast is necessary to avoid an overflow when the value of the register
> is above 54975 (equivalent to a voltage around 4.29 V).
>
> The regmap of the max77759 will lead the read to fail for V_BATT and to
> correctly use V_CELL instead. This regmap was proposed by Andr=C3=A9 Dras=
zik in
>
> Link: https://lore.kernel.org/all/d1bade77b5281c1de6b2ddcb4dbbd033e455a11=
6.camel@linaro.org/

Firstly thanks for working on this :) Fuel gauge is a great addition
to the Pixel 6 upstream support.

It would be good if you can document what you consider "working" with
this series applied. I think it's fine for support to come
incrementally (say feature additions to the driver to support x,y,z).
But anything that is now reported in sysfs with this series applied
should be accurate (or alternatively not exposed for MAX77759 variant
if it's not accurate and it's unclear from checking the downstream
driver how to fix it).

Thanks,

Peter

