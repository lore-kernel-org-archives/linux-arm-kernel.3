Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B307DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tekmdgu4SmGOyXOMrvYH8AEv488OvXUmZd+ZMk/jzkg=; b=pk4+0CPJoPz7U3ARSa4Jo1MInJ
	W0Uuet9uv3YQAd5dTmvFgXR+AhDOQxEqD/uPzVR2tinfRB9BLwQDvkOf30HyW3DzDXUIwps4ox3Jz
	EuTlI2sYBoYM5mgUx/w4JrVp22BRhrLuhbp14zduOJ9RYQ/FZRYyGO/OczkXK4jOxfyZN818MxAHB
	wsbDJB2SChQOoeoPA0LR++uoHZsxTsRU85sR8iD+PyNdwqtuiwUyMwlXwTicFD64rxYG4HfB08gdv
	oz44BhntGWja7Zj/NTtVN0M4QXJDmKzpLsaWaDeeFr7P95dbsfCkA0FfpjxNIe3f6ZqtBdhLZu03b
	KXNv9V2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z99-0000000Eh1Q-03lt;
	Thu, 24 Apr 2025 16:09:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yAH-0000000ES4B-3hzG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 15:07:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so5897725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745507220; x=1746112020; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tekmdgu4SmGOyXOMrvYH8AEv488OvXUmZd+ZMk/jzkg=;
        b=Er65n8I4RPXLzY19wr4ZzMW9my3VmrP1j4RsUVCtsMfTZh3pxHwPP92UNl9+dUwzXo
         zZU1hnQWetvTT0QHLOwjY7fc3UvacCZiKFonXSpZt3Wpxjeas5UC1bGd9wla2jka0a+P
         90BvH+4KB0X9BcOJ+qGweOD9lcLIIn5VZYhg38Ah+xM84Q7Bp1urNAkHXZDkmupz4oym
         3HIj9GIfjbWmCwEToKzSVcWRw+YUJO1QYhZpnkf6DnsaD8bO3NJuHg6TSncftYjt6fok
         Jz/ahPv7bw+aEJVW91VTK4VAtStcTmIa/ou4KzUPiTqGcnXsJYQ1Yr8/kTTEi8LbqoI9
         KgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745507220; x=1746112020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tekmdgu4SmGOyXOMrvYH8AEv488OvXUmZd+ZMk/jzkg=;
        b=wQ0oVX3ilmBdVj+Hg0AlcFcNNLxx9Df5un6p2DecK4qY0lOzsRF4YgRSCvdSz4zWB3
         hvP3B060TvYn4rzryIKB4rd1ssQ7IJS4+UhOxHdrgSXr/YpnwBPUT481+tmYQWqx8GTy
         nWY9L3a+aeHeiDBsBY9Q0UOFn6d8ahJown7rtEZxwd9kWVWpktBklcgpeyuEeHnH319m
         eq40M7Q7VacbeYDu/zCSDAuZDoceVcKKyCVkRXszROGRTX63TePdDq9gBcXG6h0SYusj
         1/pTNKkM+bCiVZecXr5kbHiKddgrThebvmuMyhVy+1kd3g6TIKj2jCgRtKVFZ1jswb/n
         NuQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOA7apZng6i6trSlUKby9ThuQM5BiTS8lyWdPAHDwjqoW5xsowvq0Mll0yJsMzDhOblRri83kQAGHHbVIHK5Vy@lists.infradead.org
X-Gm-Message-State: AOJu0YyynFL6rbPYJUaGC88YbzFvAmB8T5j1O71EOnOOUbz3sev5mNJR
	tA/Wm9LrnaL3rl8oBu/JmGkYEopYQi4B/YKgeh9x7XaTOUo4BK/ZfCxZ6bBWdoc=
X-Gm-Gg: ASbGnctcoj7tfDCdMtybifRWU3iFKE9fkvan/otFRf7SfcH6sJXzuhHy8uDMVYxDnJ5
	HWoGfA0JJh2j6+sQdEAMhPttqE2pkg9kPwgV9ZgehHijT1NDFWKsvis7vyz4f+eXBtqzLp4F0Tu
	CLJ46xxPm9wC7KQM6iYKUCHpZxyQhS+Hmb8XYS+zwc3+OSUac7B3QolQ/q+iT8d5e7WpxVsmePY
	9GFk3W+dGi0avA+ibDAEz2TntVMV3E5pYgyToV8oIfxsrXsKMJjdZGxzSe+L1F3tY2rT3K6b6aR
	ZsglbYsSoXbrSQWQBz/yjUD0gvPjNZ07Pu6GXE/XREl1+0oKq/pMZd4/DtMP+31EBUZEakl1S1T
	MlxSdsv0=
X-Google-Smtp-Source: AGHT+IFyIihiWZtzqCaT0+c5gR5qS0i6N2HGB8bIr4D+Ljl1JMZ+cLPlHv9drJDs1OWf2iLRUT3wng==
X-Received: by 2002:a05:600c:4e48:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-4409bd21f8fmr30871065e9.11.1745507220162;
        Thu, 24 Apr 2025 08:07:00 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4409d2bfaf4sm24338135e9.36.2025.04.24.08.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:06:59 -0700 (PDT)
Date: Thu, 24 Apr 2025 17:06:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH] ARM: dts: stm32: Add nvmem-cells to ethernet nodes for
 constant mac-addresses
Message-ID: <xvhstvgs5bpfebeolozdbxh2empviijqq6hg2k2kuav5xykpqw@a3jgkrqzj4xm>
References: <20250328171406.3307778-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jf4746uwztvxbhk3"
Content-Disposition: inline
In-Reply-To: <20250328171406.3307778-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_080701_923930_5514C3FA 
X-CRM114-Status: GOOD (  12.69  )
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


--jf4746uwztvxbhk3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: dts: stm32: Add nvmem-cells to ethernet nodes for
 constant mac-addresses
MIME-Version: 1.0

Hello,

On Fri, Mar 28, 2025 at 06:14:05PM +0100, Uwe Kleine-K=F6nig wrote:
> The efuse device tree description already has the two labels pointing to
> the efuse nodes that specify the mac-addresses to be used. Wire them up
> to the ethernet nodes. This is enough to make barebox pick the right
> mac-addresses and pass them to Linux.
>=20
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

I wonder if this patch is on someone's radar?!

Best regards
Uwe

--jf4746uwztvxbhk3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgKU48ACgkQj4D7WH0S
/k4KqQgAh+AwCxuJsOtZS4t76OvBR42DI7PxQQ1v6/IsFyAA8afEf+7e9zgLaGZu
DJlNzT2e74nbDdcbaCDOLOM6VKrJ082DI+Sk5TfSuz8/KQeC5ljjKfoS4Srem16C
QDRhMNzYgTUC1GCxXE8CY46syIHB07mA6uuNndjxI2MFUG8jA0tO//dGkfWzzxUi
17RqErahedYndDxyopbtce05CvZHvNoZ+zcmxJItvijX1JWpUW5utouFgFsO40Xj
6H/hmScaWYagqW9CMyoUcgmnvDoWDx+aq2XRmWXIG5USJzc48wUynpZAHd/rvpRS
dYA59U3ESpZ/3M+zMWEjDvaKnGw27A==
=DXp2
-----END PGP SIGNATURE-----

--jf4746uwztvxbhk3--

