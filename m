Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF347C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mhub1WX6NRFjMXtQbcreIaC8K21PQR5uxWQxNvn/uQ=; b=qF/2P+Acy2a5KoV9UUvGBkb3SR
	meL0HpPopJqtw7HdPljsJVJzrTU93n7ZHY3CCmXKXccY+qEcfqNZsCzoudMt9lKvI8sxZfm0vCphn
	/ypu9QYiGXJthA57MaeVCvWQTJncIOuwxvycUs1XCBBQA9f0OiyxVbGHRGHYfAY849GhBcCkckIxI
	l8iooatl6u2fy7qQPWT2MKRlhhSNjQyqco5hnvV43fi01V6idVOh/1BK+g7ipC6wXsyEsLEfFQE8h
	GKoZcW1T5ZCsNwLMCQ16sC7nQMg6yzVRXUpoUWAx9A2YXRFJ6D37+W78PVRD98fNW4ECo9DGLdRkJ
	69ebiXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1V4-0000000BfJK-08Mx;
	Wed, 15 Jan 2025 11:23:54 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1TV-0000000Bewj-0faH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 11:22:18 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3003e203acaso49784851fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 03:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736940135; x=1737544935; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mhub1WX6NRFjMXtQbcreIaC8K21PQR5uxWQxNvn/uQ=;
        b=trH8aVuRT38BeVO7vv8r90WL3tW47Tt79Sg3RdmGawzz5JcHQQ6hLiBugzSsFCqcJa
         8bOr5BQuGo7YiGBKVA3qDfMm3wvsdXvV5CjSfoDqgz64/d+2QDuHbSLqLby8F8I41wfk
         KjHD7C9icBiRmUCa93XcvCWlof92Sj74FlhaeQKbrXfhGc5lTOX4Sk9B72DHJwM9+o/X
         XJCzWEtQLjaR1vxk+uJW/F4QI/mSkY2sWGqAc5+1py67jXa6WY0ocn99PutNMoriGvFF
         f7RBKvrx45AdUCYQpCSSK7kJfUJ8cwJ0lRo7ccnXke5yPgZQRfqzmzboXjxREYyeChAZ
         oR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940135; x=1737544935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mhub1WX6NRFjMXtQbcreIaC8K21PQR5uxWQxNvn/uQ=;
        b=K/plmUftrXQYUTs1XGgJjgRfk0Clo08xYSvVYP4NNQfpA60y13+bD4/J3IPcIhvIkA
         36n3xD/cKnb118xGBbAEyh+fGn9g3JPd4pykGczK+mtWm49Qb5Zb9btYF8qoEWBseDlv
         hjtliTKT+hTZO/ses2+SV9xHmd1/CpVm9Tbnj0JiIn7xJXAIi9jL/DRULdCmSoUPeXeo
         EvVtQS6miPREkINluHzgh/JrGlP+/xgy7WEFJBmcVyNJzLfbfPgVj0wCrZ4k/LIRhlUB
         4sdpl5cQDW9KYermvyWtToTEIZmOusajExiWuVSGOSthoMnKDCWUnN94D8HEfUyfnuSn
         zmzA==
X-Forwarded-Encrypted: i=1; AJvYcCUopzmeDbimsd6Nb605UsXD7otfY5ZXxy/EbIh4QynpKOQk7Q+CNce0VHu5+WR8WAFBzqceqeYaNcmEpibaV3QO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9nFJxqTLtEWCN2Icp7CpxCha6zCGNRwrifgwtuPxD7aBFjWRC
	ZAQbZWmO5iV6NDQUexbhifHTFElIUbtM+hKUoqgAUN/919+oel6j59QmLiNdO1jaDNGVfT0hddR
	cGyEio5lX9X0MlOGN18k6CIiHAeuljGoScbgXxA==
X-Gm-Gg: ASbGncvL1evzbEqnWz4+HXJRqkJuNHwRKR/I0i0BZOzSZwmbUZMId7DNM6fC1Rbzhl6
	K3uWkPysztO6BVwSL2sZKsArwJhFtp2VF1L2DLw==
X-Google-Smtp-Source: AGHT+IFi9OUFsDG/HwAOWZDy5wxB1IFMes6uWrSDrSs8fqZfUq6g94ydbqgtsgXawPRPPFqiHwnnVYJjpekX/j3mPrc=
X-Received: by 2002:a05:651c:2124:b0:300:15f1:cd5c with SMTP id
 38308e7fff4ca-305f45cccbfmr89843831fa.17.1736940135230; Wed, 15 Jan 2025
 03:22:15 -0800 (PST)
MIME-Version: 1.0
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
 <20241227-a133-display-support-v1-10-abad35b3579c@linumiz.com> <20250114160045.2baacdaa@donnerap.manchester.arm.com>
In-Reply-To: <20250114160045.2baacdaa@donnerap.manchester.arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 12:22:03 +0100
X-Gm-Features: AbW1kvZR9tBuaRtZ7bNclb8qOifwSWdiMNHG0XPYW6GVaemjAImZEkZB8O3eBOg
Message-ID: <CACRpkdbZYFaTHoOAy7DYpaV77Tf31H4bF179OrperU6UGys2ew@mail.gmail.com>
Subject: Re: [PATCH RESEND 10/22] pinctrl: sunxi: add missed lvds pins for a100/a133
To: Andre Przywara <andre.przywara@arm.com>
Cc: Parthiban Nallathambi <parthiban@linumiz.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_032217_197437_E0D0F338 
X-CRM114-Status: GOOD (  10.10  )
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

On Tue, Jan 14, 2025 at 5:00=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:

> Linus, in contrast to what I originally thought, this patch *is* fine, so
> feel free to keep it in your tree.
> Sorry for the noise!

Phew thanks Andre, I would have pulled it out otherwise so it's no
big deal, I'm just happy about active maintainers!

Yours,
Linus Walleij

