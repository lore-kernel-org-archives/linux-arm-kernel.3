Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CD4C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 20:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ub+G0Ff6hsiwxt6UoJCvVXER5yXovtTMeMwmgc6K8J8=; b=nZyIEL/srHO46mKX17KlsMDFQC
	/kg465s/M99LwHMiqVPY0UjHtma3L+eLbF78bBz5A0gIuTmYySjSr8zb+TX2nEhHfhckUrue9c+Hd
	PYk8DAKl8tjjToqM11cBxrHUKrsVVFPobu2i/3kXqdmPKKCaphg8A/T6hcjcNogG4jVQYtwjeYabG
	DQTsQ/auPt5O0J8yUXbNv0bH5YLXDaxKaWvw7Vk+StmxDGaIitAheGyY1hhyVgMfouD9NjwV/Kkve
	Pedmk89v0Q2n+oKLiIYDxzELLeZSji+QwWdhiM9VtFc9hJ1o2V8k6gAET6pTFEDeVbt5OhFlEToas
	rU/KWDhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsReB-00000008k4V-0EOc;
	Fri, 07 Aug 2026 20:58:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsRe7-00000008k3Y-1Zv9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 20:58:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4957eefd361so28741345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 13:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786136305; x=1786741105; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ub+G0Ff6hsiwxt6UoJCvVXER5yXovtTMeMwmgc6K8J8=;
        b=b4NNPdIt3qSm9y45Q6/07QE7Nay5QwyP4IR4fA//tRGBjzkboA2hTDjOKgTgyGawqb
         XrrUgEBrrsR8gpTUj1tCvi5DKjI5MiwujeDZxofuqKe6JendpXv0Ilg9cAQL8lmijCYP
         wbsjBDl7RCwesa+oGU7WlyVBWXlhC2PkYWPiQltdPPt73+8F1hkYdmw25YxYnBCbJBUR
         5Z0MllNgnysIiGXud6NmBDU5vxVYj6sd6hr53Rs8DgRwQFboQzqqeyUF3cMEPRgqySOZ
         p5b3iMj3qH/qSqCinXqgemz03sJ4Bre/UDv4sFtJy/VOL2vLO+STKqGzWCP/ppmdqTsy
         j06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786136305; x=1786741105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ub+G0Ff6hsiwxt6UoJCvVXER5yXovtTMeMwmgc6K8J8=;
        b=MWfp7g2x0s/OCvacEeJL+bYf/gxJtKssWi03uLmUUzBjde70W08V2ueUoYKLJRgbzH
         O63ZuT3YURiTUZ0AmiBhYpp7npdUAvN+P1hqEUs8xhjqDpJxgukmb1SZC390WUJ1rjoi
         BvBMZypZ0mutm4JPosX8MQyU0jT3l0UCbQAbqHZ8lVd3TMPW6HtQKnQJ7f6pcBcJHp1Z
         O6cQ8/sS3BAZJZNISitqy9P1/BQpcNlosUD+kvYILs/eZBvZhfgSdRFTiXPBFriw1tm3
         5ZIw3QftCkUAEpX5IMKbUoMu6EwZmIPr7TLX/byOx32N/mlTTuPQ+aNmYD4wIIR3N7KZ
         l3Cw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0vH1DvvCjlvf3DCff2Ehvv/Lf5f0fm6wXZQpSSYlaPx2ZoJ2pOiDg0TpojD/1fhvSQs7uMurmEqQfHKxkE/Gf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/pB/nJtEgWeVYuqYMcSiGZPSPDB1qRSphlkXCIwP1hOGNLi3j
	MUSQMLGNJwlGqjAKJcUByqSjrABbfF28TQkhgXDn0SPMnp9938UnE8JItjw3ZHpuaFc=
X-Gm-Gg: AR+sD12weFicBzIIkzYRLwTTiOBt+f0IR9nQ/9Jdk+usPqq9DXLjT+0BvXrQ1W1sTwu
	IVBGcpLgXkA2qoC8avQ9cLitS+4xyxx7KRL4AgFfECOqDcmhgQjx6xf+FpD7v1yKbRsyNn/hWg4
	XhUulxB9bxAp9cTNbO4GOUlMShaWvTMZtD5Clf98ymQW7R68TjjcxsR1ICWHFVNVLwJqZlMENaB
	MEAQ/X+QPgoZEPDgWImTlrFlUX7XezLNjTv6O9mKwrt5vY0fFfrDuzv4uvgCeBgx3PgRCMARp3r
	mBDPkVG8wgo92QBwUFyaS2kotpGuTRmFqdUBf0s+QC5ZKB9zZnpIKwwfeV7ZoLe39opv85B2Xh1
	26JqiaBKSPiV1R1jDaaa/VrpZv6el5w1W+5lpqK2tIvRrl20pd/f6NJJzZBcI3MnC0ETIKnrc39
	W6pVO7J2Vlkn11KspyuqX893yckUMcE5eKwsA2iYVyotQDdyRnNLpWusz9QqZz4BjAiA==
X-Received: by 2002:a05:600c:6612:b0:495:4811:7998 with SMTP id 5b1f17b1804b1-4995e0ebf84mr102518595e9.17.1786136305361;
        Fri, 07 Aug 2026 13:58:25 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4800215078asm8418961f8f.12.2026.08.07.13.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:58:24 -0700 (PDT)
Date: Fri, 7 Aug 2026 22:58:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
Cc: Srinivas Neeli <srinivas.neeli@amd.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, git-dev@amd.com
Subject: Re: [PATCH 02/20] net: xilinx: tsn: add TSN endpoint wrapper driver
Message-ID: <anZGPKSopP9GLKJt@monoceros>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-3-nagadheeraj.rottela@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yneap3wk5hqcchh7"
Content-Disposition: inline
In-Reply-To: <20260807104431.157230-3-nagadheeraj.rottela@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_135827_449078_3EBBECEA 
X-CRM114-Status: GOOD (  17.83  )
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


--yneap3wk5hqcchh7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 02/20] net: xilinx: tsn: add TSN endpoint wrapper driver
MIME-Version: 1.0

Hello,

On Fri, Aug 07, 2026 at 04:14:13PM +0530, Nagadheeraj Rottela wrote:
> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_main.c b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_main.c
> new file mode 100644
> index 000000000000..1ef1b0c2ee6e
> --- /dev/null
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_main.c
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Time Sensitive Networking (TSN) Ethernet MAC wrapper driver.
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>

Please drop <linux/mod_devicetable.h>. This header is planned to go away
soon and you can rely on <linux/platform_device.h> to provide
of_device_id.

> [...]
> +static struct platform_driver * const tsn_drivers[] = {
> +	&tsn_driver,
> +};
> +
> +static int __init xlnx_tsn_init(void)
> +{
> +	return platform_register_drivers(tsn_drivers, ARRAY_SIZE(tsn_drivers));
> +}
> +module_init(xlnx_tsn_init);
> +
> +static void __exit xlnx_tsn_exit(void)
> +{
> +	platform_unregister_drivers(tsn_drivers, ARRAY_SIZE(tsn_drivers));
> +}
> +module_exit(xlnx_tsn_exit);

I assume you expect tsn_drivers[] to grow? If not, use
module_platform_driver() to reduce boilerplate.

--yneap3wk5hqcchh7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp2RusACgkQj4D7WH0S
/k5magf9GDZifuMmMgVgWbOijgerh1NAUQiervav2kcbQ650bgaya6orUyAqUnnd
eGe7DyhyOOdkl3qnsTwH9/e4Xn739LEnnjAwWIBrFn56ErYRhl/Dd+vuD/9U0LPd
bGwI5ss9L6itgtlzGpZRsi4KhSiWG0asI7Ll3WFkUrhOdMd5a2+L22Vd47E3gXAo
lVQ7ntvXRliL54xVe1tVbSbz/JrN89nHRR7sI/FWjUEknfpTbVVldBt95gevSOc9
pVoI5wtCOSAMPQTzSAHFoj1qZcrOofeK49hvnUiasTy8OWa5oJiuCzHknYyPXcOS
JWFSEfqueZ+Xqyq+Y71krOsj8b+cYw==
=pHZr
-----END PGP SIGNATURE-----

--yneap3wk5hqcchh7--

