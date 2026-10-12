Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A401CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 20:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dDzxAe3v4K6bmvY5Sku2I2OCIIKOOmdO2oWSS/8r5Q=; b=3/Vj1Ohn2dgeHZs8Gb30/+uBvh
	nkdpFAOKgfFVLJUy8bdWnKsl30zRuhwsUWylKJhQ6A1uH/ZkyaQHEin194/d5FMf4nQIcC19MFkgH
	9l8WiCLo07nX2+zGqYHEBOdMMZqJVG2GSRyNDXECwQdJWX1SYaP1FpU3kmaoHMbXc0wVs3ODGLaJ+
	qnbV/A8ruVhHl8Z2Sntt58hYJnhzs7bo+ejdxs9qIGd6oS1WsCH35gR9hlwwHOk0uLn3jMKkdB71L
	VlaqImdG8Iufn7X+nB4Dfq+vhP4uvnPu01vNjju3x0KfUgc+g/uQ/yxcVfN791kMcNb1+qGwWZOgP
	tORoRX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGMhn-0000000BTfI-1d4M;
	Mon, 12 Oct 2026 20:33:07 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGMhj-0000000BTe9-2kNL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 20:33:05 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48b060ec084so1404159f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 13:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791837182; x=1792441982; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3dDzxAe3v4K6bmvY5Sku2I2OCIIKOOmdO2oWSS/8r5Q=;
        b=LSJvL9Lj6UgPWZSSoISinpGaA73oQlK1+/iKL53r18QdyKYx8qmMCSivJ9aThwoZYs
         odDGjVJeuWcUUIIQp0czU5R/GoIdO3kcuQzqiwDjbgfbeqy5OLuzU1atRLn+FpRKrXEa
         QELtFwth6LuByOWHmuhyoogfLBKGRlI064yGQwda5ifYp7MS8i8smIJZ4SP2iI4cJHgn
         g1Atubu8SpQn3R3YODb+VejHrhJJ18/iOX5LJ8EMNifXpOY7UId4kpxNOgvPP3Ljvoxi
         qzX3wvczNFB3d0X3XwjeRHbwLL8bnKhvR3jZ4QeAojaxkkggzVnzUD+K53UgC/ZjZeGz
         17oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791837182; x=1792441982;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dDzxAe3v4K6bmvY5Sku2I2OCIIKOOmdO2oWSS/8r5Q=;
        b=NENTLdHTDBcQ8T33024dM2VjQWRyBna3LrQbsIgG5Shw1ZL0kpvIOLV2SCsD5iyTTH
         Imo/Q6RHIZ/JceRq6c9qN5ueFB8I9AQP5IPFwvGPBezbQxjMFrFxRH/w6j+mMYSYSDLh
         lnjhfB+qxovyNVAW+KQMrLDR54uuZ1F+++BcbEm3ITIMIww1dikD8i9WQ9qad01BkUC3
         59LQfAsUijuwxps5hwMbMaI2QYldGkqS+4WNNHP7lfBvv6JkSlPKgtFR84rrHO1DJReU
         quvl7b0ReahDddanHZ25zmUATpnQZmxfw4lU3y6103YKHNCUleVgV+LVG4mo1CVBMKFU
         ruHg==
X-Forwarded-Encrypted: i=1; AKwUvBx8NWnW/Hw8FChf7T3JVFrAhvW8MS/be/+Tt6H6BbvgTP4iSUddZ9taIaGLNatrvDfqnWRLTF7ES51aCMmv1O1x@lists.infradead.org
X-Gm-Message-State: AFq9FYJWPsrZMK74e9mqjS7bTg3Wl3PyptCYMk8LY8L6szBLV7TluUQ6
	Fc14dWMUO/tqt7SnrvWLOMxTJ8Jc/rA5tx0+c1Tf8oHGr5iuBcGdlZBlr1bFZ+8DtDg=
X-Gm-Gg: AYBFou0H5JkSLL0z/YegvmHTlx31rvV9XlhPc9SkpEQ4IfE0KdjJALR3xlgmN5FwoxN
	d8wmbDMpaqVmugPJWlpV7JNIb6XzccR0V+6zSTuAEcCsD17W1QpeEgkMN3W/VpLf88vDwvhgtE7
	AePDojiJ/e+0EuzJ/+/LqpRBq+gREXtUJnpu4R+kptl3kHr9Hww3aXxPNtvtYUlALULfDjAnUZl
	Drs+MZ1mC+iJ7IvDx5EgDvcjBdXEuJbK7qiguqx/NbcN80FK09EZLUIpXNrOkMBxncaDo/07Smi
	z0R4QRmbZh64s+1IpYnCSSlfXgC0ipM64n8EslLdxzgnAOXrSgiHFI9zqgm9r9Qr5L1iXvMzA6a
	d3BX17dF9RQnVMoyIBX8lkDoDJ7UZXlAE0NO2d5JYpvFIv5zlnUng0st9rQJZALWaUYDOYgj+9C
	4vKHj7b2uRV/TAn2/STxAXSvWJpdI/6mQ1YJH/AINd4GBWWrsfgDtEzBX3dcgclTtFLW/XwS9LA
	0E=
X-Received: by 2002:a05:6000:2610:b0:48b:60a:760c with SMTP id ffacd0b85a97d-48dbacdbca4mr19746116f8f.31.1791837181259;
        Mon, 12 Oct 2026 13:33:01 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48de0967bf5sm1211973f8f.5.2026.10.12.13.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:33:00 -0700 (PDT)
Date: Mon, 12 Oct 2026 22:32:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 04/11] gpio: Add Cortina Systems CS75xx GPIO driver
Message-ID: <as1Dl08DwxOu-boF@monoceros>
References: <20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com>
 <20261012-b4-cs75xx-s2-v1-4-8a7641b7b79c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rf3tmjyx6r53tpru"
Content-Disposition: inline
In-Reply-To: <20261012-b4-cs75xx-s2-v1-4-8a7641b7b79c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_133303_715690_412522E4 
X-CRM114-Status: GOOD (  12.51  )
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


--rf3tmjyx6r53tpru
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 04/11] gpio: Add Cortina Systems CS75xx GPIO driver
MIME-Version: 1.0

Hello,

On Mon, Oct 12, 2026 at 08:32:59PM +0300, Fil Dunsky wrote:
> +#include <linux/mod_devicetable.h>

Please don't include this file. It contains a plethora of defines for
subsystems not in use here.

> [...]
> +#include <linux/platform_device.h>

You can rely on <linux/platform_device.h> to yield definitions for
of_device_id and so drop <linux/mod_devicetable.h> without a
replacement.

The same applies to patches 6 and 7.

Best regards
Uwe

--rf3tmjyx6r53tpru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrNQ/cACgkQj4D7WH0S
/k6KYQgAgMQZQqqATk7u8/7+zLh1eyfjz96I/KQyBnZbLC753ncNp95vppbzeXYB
/6Xnb+1PMj4yifoVS9rR2GPW2P4F2cVCiv4ys86vtgjDRRS9qfpvIqAGD5bdkjpR
AfIu4ZintCl+3dtuqg2yWsp/Njn0OkGzE115dAhtJMsZGrpiAbpkStIsB8lUqPSl
H5jFp9iVNDnb+9rZe0ckSQeZwDR5JuTFUJq72G71eY2jfDyzjH02v8EejbZDDjqp
vF/L57mOl847cYmA78hOqMnQrXpBaqqNs+uY6m8YLPt5Jgq+OkWhvGGit0ts5Mlt
rdJZC0MMQbclAkv16e9nS/twKH5mPQ==
=4pay
-----END PGP SIGNATURE-----

--rf3tmjyx6r53tpru--

