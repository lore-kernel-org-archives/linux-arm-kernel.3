Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D76CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 08:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8+rq+xZPmi2I8g0y9aIjmTjbWxMyaupeqzQVgZxcEI=; b=foW3ZE2jkTw9KHJ9scPRUPQbPL
	LtxfFvytGswCEM9YeNs1AxwKyODh8i8BdhZHHbGFAWsOq9iQYQERBtLTxRsIpGnxNJeWnRXcX8B1Q
	+RBubFSHaXHVWu/VbkTSJrYB+EJ984QSwfjwEbb2mdwSriOTIyxIukf1f6q6gERPipjIChroVwG6U
	5tyeiaeWGbkI6OuWO4VXy/zXZq5Ck2Bhk4ODqVKuKTrEsIqAuBmPth2oj/Pj3Ay9XkYQym3ktTpLE
	qurqtpDgiGiuKlgC3Xfbqk8+C90aZaMvQZC19MMTzrmQcyhyEA4F93EsnEQjchi3AQmxnvPUUk4x2
	PSspcjTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1KJ-00000000F1V-2Uoy;
	Wed, 29 Oct 2025 08:14:39 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1KF-00000000Ezr-1LWc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 08:14:38 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so6948647f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 01:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761725673; x=1762330473; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N8+rq+xZPmi2I8g0y9aIjmTjbWxMyaupeqzQVgZxcEI=;
        b=PnpunHPJVta/GdI9fEX9w6+29Nx+L0vXRlynw9qXn7swR/zgbofu3w8SWn60hqkBz9
         P2a8VZJ5Y5c/sR+FezJOmi/TPg5gFJ71V1bACOXovcB23YHuZEkOOLtMWFUf/bSTrtBG
         6Vw4GeghZc68OLu7NnLwkNOT4dbyCx2kj6ALIYHQjikxtSlgCmFZnP46K1l5+QP3Nakj
         GCi2rvAYavLFdyxsvM17X/wZ/L4n6mVLxZngH+TILYnMVgo+8HnlznRKC4q2Gf9U2p9x
         GjAx6de+G524MuZPmx0J/AIVNnomoDACb81cSH6TPrAHONc1I8n64jr+ij3jtBcGVM46
         HIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725673; x=1762330473;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8+rq+xZPmi2I8g0y9aIjmTjbWxMyaupeqzQVgZxcEI=;
        b=bBuBr0G4CXoaw+Q8eIRWNX3ArWjCFr8oEEMIgjHSmsQs65/73QsjACzOMr4sLxrNsN
         JW9mzDHAejsHgg8qzNGARX9vV+8Samr/NO9sZdUNUprL0eX8pIwIEIO2kekXf2Fd2pG0
         mEqCWWsJ/3MqI3jY5touFd5res4ptCcKFfxzcvZbWlupJddkp/1BPYcuQMV/UqIErcPU
         d4OiakSgHjQEM39g2S5+hmpATZKIJxazGPybfZHPXrf6hhU+Z/Ix5An73jD8u+T2ewgi
         RGTJcBLXB/QW691xx7PVjtBWxdqjkdY1kaKH/kAeQzBt3XW8YT8pd8yVli4mXAMz0SUC
         btGA==
X-Forwarded-Encrypted: i=1; AJvYcCW1GhWlWdVDfKXhvq0Q7g/bC7DBzEsjZylTh6D+YSk22JbgX7ZkJRuow7Oov+mXbXEJfhdKlIQYsYrFYDhqNUW8@lists.infradead.org
X-Gm-Message-State: AOJu0YyyOjKJUZrTq0Z8riKbQp5JrbXBJ85i4L99h0cgVbqfeIvnxuc6
	QSW7T3+OWjpgdM7RJJGJ1KmLD3X28PYnmx/hLc37Xw8x8aiKMcCQLb0lSPZbFRrOtE8=
X-Gm-Gg: ASbGncshEyzogCLTmPgzVes0T1inre+Yg9tlPXE+JyrTKGI/KaIj8oXZFVFj8DZ/Fhr
	gfEB9UKSCJF7/SeA8D0OyNVMcovGUvf4a/LR3I2WHO7Y5nfaNq/gkqMY3IlyVK2IRVJUZ8+lN2G
	WofMPYgBqQ03hm4NzkH8ztjPMsxMcNkzUdiCcRU2B+SD0W6k1Y2BMO3sFDXwJHITQi73qfHB/q/
	22tL0xT7ck4kom/Om6GTPpe7rUwedGFfRTpEn73GlBPkoYqoDnGXSqTKGENmSy00GhIB6qUXbI3
	VCX8C+SRhbNPqOJIAWjnQGlC+8qfH/+8hI0EGBHafngoSfuYWqMoEYw2sBcggF2CtRqn7IxQEeU
	jG+U4JPxTZIQdb1Rg64YQ0IJGEeGpwTK3CarLfqQRUahHuHuNkNA2Zr9b5A+XcSc5CV2cWUmGn/
	F194k=
X-Google-Smtp-Source: AGHT+IEwzzvxzDwy2hXfDTMyKk2u3q3b4WDeoC3Cd1r42aF64N8QkWqyq5rTqATRPlQPagJ+AbKIrw==
X-Received: by 2002:a05:6000:240f:b0:428:52d1:73ab with SMTP id ffacd0b85a97d-429aefcd0f0mr1311537f8f.58.1761725672718;
        Wed, 29 Oct 2025 01:14:32 -0700 (PDT)
Received: from localhost ([195.52.63.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df6b9sm25774340f8f.44.2025.10.29.01.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:14:31 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=47d5f61bca1ab14c9eafcd8930ddd77eb5a3992e8bb0bd44140ee03f8bb9;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 29 Oct 2025 09:14:23 +0100
Message-Id: <DDUNMKXD4HRX.DXUT67S354TJ@baylibre.com>
To: "Miaoqian Lin" <linmq006@gmail.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Markus Schneider-Pargmann"
 <msp@baylibre.com>, "CK Hu" <ck.hu@mediatek.com>, "Dmitry Osipenko"
 <dmitry.osipenko@collabora.com>, "Guillaume Ranquet"
 <granquet@baylibre.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Cc: <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/mediatek: Fix device node reference leak in
 mtk_dp_dt_parse()
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
X-Mailer: aerc 0.21.0
References: <20251029072307.10955-1-linmq006@gmail.com>
In-Reply-To: <20251029072307.10955-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_011435_613396_8FB9BD91 
X-CRM114-Status: GOOD (  12.30  )
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

--47d5f61bca1ab14c9eafcd8930ddd77eb5a3992e8bb0bd44140ee03f8bb9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Oct 29, 2025 at 8:23 AM CET, Miaoqian Lin wrote:
> The function mtk_dp_dt_parse() calls of_graph_get_endpoint_by_regs()
> to get the endpoint device node, but fails to call of_node_put() to relea=
se
> the reference when the function returns. This results in a device node
> reference leak.
>
> Fix this by adding the missing of_node_put() call before returning from
> the function.
>
> Found via static analysis and code review.
>
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort drive=
r")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best
Markus

--47d5f61bca1ab14c9eafcd8930ddd77eb5a3992e8bb0bd44140ee03f8bb9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaQHM3xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMY
BQEAuHoHmQztjd0qDVochaQgMwU/UDAYYFg9Pt2qLtKUZoIA/RVh2U8TuEbNs/4U
K3J+cqEkOl1LVK9aUjFYUv90UyQJ
=nF+A
-----END PGP SIGNATURE-----

--47d5f61bca1ab14c9eafcd8930ddd77eb5a3992e8bb0bd44140ee03f8bb9--

