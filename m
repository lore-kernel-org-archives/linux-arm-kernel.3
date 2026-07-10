Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A04EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 07:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWU0v4sjJbD2CQ9MCYUXZFpGOf/MY7CyUDjnbwNep8k=; b=k6zbpxYMwhs6by8XtGIvYm9xP4
	IFIzluRiv4bkE6tegvYZ1+9oYYAm7NTKmagweo0Iu28EyKk/waFuKbr9TmrWn+AzeR6bk4hngfW61
	RZ/QTvhAavuM0CQc0lTYL3BTPBMG4wopuJxYiBb0LaDpwHxq4g71EMEdVKJDoBiqx4xIhDde0IQbd
	zR3Kq48v1bQfaRpp/U65192+Egpc3fQSYWD4QapsqPW+lqMA1z3QPQnfgb+1kehXuJLUyWYjQmtXG
	MELnVTxR/9HZGm5Zm3gV2rqgn8R2a+CJE0YSzX0lFTNnZn25S5N9N70WbWJAt+P0+80BzMduMFHXG
	zwbZnjaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5pf-00000004MIR-3oHn;
	Fri, 10 Jul 2026 07:39:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5pc-00000004MHZ-40lw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 07:39:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so3547165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 00:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783669171; x=1784273971; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWU0v4sjJbD2CQ9MCYUXZFpGOf/MY7CyUDjnbwNep8k=;
        b=gskHSTdGqGqX3eP6iUbJ9heG7LajKq14AetjRZpvWueTErdkVGvtTNBHFs5sCdksyT
         jVzDP8yl+B7TPmKMkhrhMByQwOrH/JuPwkVCtEcfBTlko9aLd71vXpjzBJmDu2tQCTWD
         dFo/1OqTno5N03IE2dZVFi4WlTIGpbyZbJeAn5Ho2b1VdOw6tH4GOHHZU/vrYKqQQ7vl
         th90urRsiNKrZQKD7ySamCZRcfAcOh5I63HrdkGjKdlGURuvx0yiAONELmvulNpZK2tH
         oQYqscRX0DK17pdqz3Jsbg1f837o/09O+R/N3sFWOGi3bhGxrwpjc2tyO1w5SwXhmgzQ
         S3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669171; x=1784273971;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWU0v4sjJbD2CQ9MCYUXZFpGOf/MY7CyUDjnbwNep8k=;
        b=SFcXCuZCQFmIziDvvmfv0x5OPi9CGihmx8HwIXE7cBfxh9FDkhhs4/XnydmDCP3Q3G
         GuJoMGoigqPqUBAbnHM0MtP6mt9v8l5tbKraFrVGx+9GoBVwnVSIu7vkRlY0Eh9EachB
         kpcuRCK3KPiAgxsCdLToykBmLAA3mKd2Vm6R63pd/1i1Tis5KYQBjMOSYTw4wvr6ZVsl
         NLrjgoZIPFo2mJ0Kl+AOt6dcXfPAUhx9mvnMvCTdFYEieqSfCHKHaizLvolx67lncDkv
         l9T7jV53cGyzzc28fA52TTu7H+CU8v32pbsK7a+gr1gXRRem6oiXaAyn+Z91KFUl5Zd4
         T95w==
X-Forwarded-Encrypted: i=1; AHgh+RrPXJI00yFdK0kK2ZTdaMC8VpSzCoCNMxNU/bIkB5WnFdOApsXLrgletC/cPZpjGc/05ShCk4E+jrtRFzNq6ywX@lists.infradead.org
X-Gm-Message-State: AOJu0YzBY/a1UolEj5ivWwu2H+bkpC7+M1fM3IVbyEX2I86WoPAoKkyK
	ezh+o83QkVvdmOb7KwAK6RGoVevd1DbWzih0MYMN3vTKOMQhOmucmJZwUzssK35mEaI=
X-Gm-Gg: AfdE7cl1Lm7pcSmnn9mrtWmwuWU39pw6Odnq9gVI9cPcTYD5dZRRXEqc5nIyAOfdFmO
	QnaSPTM2QU0hpynR1WhzjJqOSVBqLbgdOK6Plg2DXrZcE1pqCQP2NJJXGBhynT2dtZ6NdUVXycT
	bTFMEg+8rrBBSpBtWAC/PhjxJuRvdSyi30Xzf3K+BKEANnrV/u3KN3hoyppXuZnluMpxuddJgoj
	bFcNbjSaE9lpeiw+q4IL+ul9/ToprmKGQYECK9IPk01wb5OmsNfajZr7wAnJ6jDApV85AaS43RY
	TW2uzOfMNf5ut1VA3J7967DlT4Y2jflLQ9ME+LoP2/0KkdimP0PCgn9K7RIGp9vrbK9ylNP0ndM
	gRrj4SxkVnboZxzaAlcBnqTpxtaWtN2nhYKYjHL1b2c9+NMLh+mFd0XNq39gQ5k1cuvacFKixnH
	z3ph4RyLaTaQJZe2Y0+xKpXEnqtYv3g608g+UZcHW2IP3T/ADxhK+NBMX8cuugmuj2CEiyTtC7A
	d6W
X-Received: by 2002:a05:600c:638d:b0:493:df5d:6ca6 with SMTP id 5b1f17b1804b1-493e68c41d7mr93044945e9.25.1783669171165;
        Fri, 10 Jul 2026 00:39:31 -0700 (PDT)
Received: from localhost (p200300f65f47db04fbea22a44ee9ba38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fbea:22a4:4ee9:ba38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493f4f09f89sm33853675e9.10.2026.07.10.00.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:39:30 -0700 (PDT)
Date: Fri, 10 Jul 2026 09:39:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Ben Grisdale <bengris32@protonmail.ch>, Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v5 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
Message-ID: <alChi9oG0-2XUFXK@monoceros>
References: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
 <20260709-mt6323-adc-v5-2-d11b8332a735@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w5zvd5vp4pqaarjf"
Content-Disposition: inline
In-Reply-To: <20260709-mt6323-adc-v5-2-d11b8332a735@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_003933_012785_D579CB94 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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


--w5zvd5vp4pqaarjf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
MIME-Version: 1.0

Hello,

On Thu, Jul 09, 2026 at 01:52:48PM +0300, Roman Vivchar via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--w5zvd5vp4pqaarjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQoa4ACgkQj4D7WH0S
/k4pDwf+MvHDR2NtPifHQ1UsidnZd5iG/SkGcVotUqLFeN2Q4NzZWdluwEBDlqYP
3AALM8XUIbkGVP7dg/LDiffqfsK4fE1kUa3Tmzp3lYrTzMlgZwuu4FxN6V4FTDqt
ljrJFdNgUMcs20mDR6iIwDq5KUqFbuBOTeLF/8HHcoScvTb8j+3rfp9D+k8iVIWF
begEnYaOM//SpubNhltzxmf0rcnRnm8+hlR6A3vcLOkP10KQBxk3OAK4oZjiN4dz
AhMCwZu8VjRctocECGQE6ZTH1aKUSzuGcFX1QrXDPRnhyzHjoMoBZZien0jrGL0J
A8nk7InQ4UXOD6YjGdppmL36xpQKsQ==
=N5IU
-----END PGP SIGNATURE-----

--w5zvd5vp4pqaarjf--

