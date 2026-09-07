Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8EEC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 08:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toPH+1ZArk/DDhOFULiU+peDd7xkrEZ/LBY2wlar/aY=; b=iAT/e6lle/MkioTdtAZLBR97sF
	aRW+iB9LJ7fTkG3CMXpdxRKZZRF5H6ugqMmKYI2czo9xU849jhol/QPw4pkcjXdLVOvn5q1rbLcic
	USSQpIoJ9iTSZri0JOvQ2FccPkrLyj1eFkk2v4rJSJ6rxwSqL5DqIdv5nOJXjPL2pe3Qdu+qSCHeZ
	IvNSPCutQvHl7pjRd55teEXLgmuhh0Xqr6SHWVLGpL56dRu21JWthqKKiAXgr8eR8bbbZ8ItrDiqJ
	dMeYGsOT2/fO000EiWx7n1rJxUx+toqZPIvWaww8I9KxNV3VI/oAfFyCI2+UuU9Y0gVPaAIsFfovF
	TD6m5U1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Uds-00000006G10-2LBM;
	Mon, 07 Sep 2026 08:23:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Udp-00000006FzD-0r6J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 08:23:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49d05d51553so12737645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 01:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788769427; x=1789374227; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=toPH+1ZArk/DDhOFULiU+peDd7xkrEZ/LBY2wlar/aY=;
        b=AqcT6azw3NpV0M6LDthDjv71uXMUGp8u5NPdzZGQjsRrZnaejM6iDAFl+xdExk7sSV
         BRxRq5B7N3NE/49Am7ON9xl1rbzT5wIrLrsPNuzBFw/Rj5QEFIaCDZDs8rH25dj6AaGN
         0s6Kq36gy+LzV88UVjsyRZpPv0NlQ9LJaCsPdHAz4ttHcuT0WMIT69JHmnR6M7tkzaYG
         RREHGYtzZYOQzcrmBnkrx8EABPBJieCWQvrmPDP5mJH0FWrRmB5b7rYKAYXb+NGIjVaf
         xOdCIRtFy2xi1u/mFb5AcMwWNWDPWt8NYlO7MsbTmUsOh9Ql4iiBLfqCrjMvkMmj3Ji+
         SNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769427; x=1789374227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=toPH+1ZArk/DDhOFULiU+peDd7xkrEZ/LBY2wlar/aY=;
        b=kMMdP9f1T6Z0R7Dzw6R5hitgNzccQz8e+AstXmay6SE+BbZ2iVfS5fxpydOuqdaRJw
         RPNLut32YWTRVYZ0tQBj/8cjB2XlAQqG9PfUe6oLWkyJrd4j1Bu4dLketYrza6lk/XYE
         hJNDltMnjVMl/Pec5kRh3qpSKCE/owM/5HDvZepuzgmwBNfBf7J+haw7vZaQ5dkUArmM
         l7p77HmVoQhG0Dulnc4Bs4k3cbcrCe3BdZCcK9+yC7zLfy5fa7HfVQfK6moITZ3c8ebu
         CoE2UGI0udF5kMYfG6+QnFTxi6pZWal+tsZ4Q7svQZE6k7Fy7ieBDqh7fnnoRLuXmuo0
         fbrA==
X-Forwarded-Encrypted: i=1; AKwUvBwEgaRjeyvBuGsNVnlx9Jfudxin830ZY5PjcO7NB7V8I+vd8/anuz0iqpD8dqQby/SQ3tEfsO6DqcU8S0AE1Vv3@lists.infradead.org
X-Gm-Message-State: AFuF++mNdfVtnB1rHJVhilfBKDAGRwc1O0aVvEWSikCFnj0yojXRKZr4
	HQ3pdvOYVOEiKa8kpfhk7sdtXgi9ccGenmbVz7bvB2VVzxHlXKwbVgJmD81X3+tLYIg=
X-Gm-Gg: AYBFou1LUKeP1+2mrqcQonoHHk1ZVZJpvZPHNVZdTsMhc/hw2RSxZZH0oWy3P2252XC
	q8+lwQdL1DoB5San1LkeRONlXX4uVnvlQpqfmSJZsHJEwSIA4bcb/fne6DqBsWmSV9czOFo1JXu
	0lURhEFZdej+O8z4XbKKQ/RN8gFEOpVEjYsD4h06MVI4/A4mVyrbPBULOcC1/LHLj3x5jsjrrpn
	OtMgaf8fM2ofjDIde/7GhKXvPFxJ9897eJMxZMw9YYjlGJtAfDc2N5zrsMpY4+arlFM+VKx/Slj
	rMpkuK4XHIdluoIn1vPARfX0MGe8DhigqB1nY2uMOaRqLxxTuOC8CzfMXAxDQasJw3raQJ46RYI
	d4UZdLvqxddgAudJVWRhOYneplo+W/g4CCDTz38eznwQz9r7efJbhdc1EgYeW+QpC10MGkjYLYN
	twtRd3JOzgtlZUCbj5opVfLpfWKUf5oCL1QmCJBesdx3umCm5hw4t7FXZK7seIynxb34pjibMll
	z2hx4UgQ1jO0jAHXlCyXt/ocWb29pj4+2GrJ1jRrXXpUzyBfEKzYcT/ItEXTQ==
X-Received: by 2002:a05:600c:348e:b0:49d:622:df25 with SMTP id 5b1f17b1804b1-49d0622dff1mr104970285e9.1.1788769427009;
        Mon, 07 Sep 2026 01:23:47 -0700 (PDT)
Received: from localhost (p200300f65f19a9047ae53bb37ada872a.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7ae5:3bb3:7ada:872a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-485883953cfsm22327326f8f.13.2026.09.07.01.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:23:46 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:23:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 11/19] soc: starfive: Add jh7110-hdmi-subsystem driver
Message-ID: <ap50F4QOw7jbcvI6@monoceros>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132729eucas1p1bd78eb90feaf90b6265c13fc7bf43ada@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-11-484f9ae72715@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dohx7bkeczkqrdqr"
Content-Disposition: inline
In-Reply-To: <20260904-jh7110-clean-send-v3-11-484f9ae72715@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_012349_544928_A08C6701 
X-CRM114-Status: GOOD (  12.11  )
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


--dohx7bkeczkqrdqr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 11/19] soc: starfive: Add jh7110-hdmi-subsystem driver
MIME-Version: 1.0

Hello Michael,

On Fri, Sep 04, 2026 at 03:27:12PM +0200, Michal Wilczynski wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't add includes for <linux/mod_devicetable.h> as it introduces
many unneeded build dependencies. Either rely on
<linux/platform_device.h> providing of_device_id (IMHO preferred), or
include <linux/device-id/of.h> directly.

The same applies to two more patches in this series.

Best regards
Uwe

--dohx7bkeczkqrdqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqedI8ACgkQj4D7WH0S
/k4SQAf+JxaOkTt0KXEdMeiFgnBOg/VvLQ2tgwyYbYV25ymCW6f+E/Oz3WAI4IDD
S5sDwYSMfEN2g+u3IdIzE3kZhVEAdkv+iyA6MExPzaVz9qaS/A5RwGIGRO8EtmbY
OnW/GTowIQWQH8Fs2w7pe+ITRAhjl+9OOwdM2Y5h4x+EZD4CUz4apRozxIz62mu0
rv5S6v/JdJiz/WNpikSdNzKKIKdq56RUI2KHXKfjqnvCkAHwAVnPfgCH+HNcpJSX
wljKv3FOemKlAJV4uNgIjZs2QqmcGZbZ0acdyNWZ++YujYR8wLjOkQ0loi8lNg/x
i6GGu8ylq1Jcpp7HF98D268WTb+1Fg==
=jV7I
-----END PGP SIGNATURE-----

--dohx7bkeczkqrdqr--

