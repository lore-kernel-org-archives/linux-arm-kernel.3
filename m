Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF29DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 09:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oElNuHGnh2SndiJKSmzP3b2+Y0n7fF/o6Bw/SCWA8s=; b=AahiUUK8hgXGcvq7ot0SChVZ7l
	ALEjqYNeBLAG6I9tBG7h8mFzHEMC0JVdVoWpP7JueZPS+i2DrhIP6vkunRjcZcaqsp6ejcF6AQ8zN
	cRESTgssCY8+/1uEulAxABlfy6ZHTOU2ZildTF7OB8D8dVGrYeCsKPCY+G9DZhH7tyo0m+AE6mKPx
	FlwPKWB7j0P6TyTZz29LL91TeTD+Q/5dNlC0ydXvfgLE7V0c0vah1UvMEtzI7OETbbPvU3snKZgMM
	eAhKxbBDFkyjdQ1L0vjo/AwN1dT1dyuGm8WXmc3vjwpZZFyGRaSJwO0KzYeTsGy80tM8SMo7gNI/p
	puc3DU8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLu1-0000000EK4p-09yS;
	Thu, 16 Jan 2025 09:11:01 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLs9-0000000EJkk-2E9B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 09:09:07 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30613037309so6863461fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 01:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737018543; x=1737623343; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oElNuHGnh2SndiJKSmzP3b2+Y0n7fF/o6Bw/SCWA8s=;
        b=uz+fjU0dabGsk+/N6g4WQz2CQyA5/nDp7+Wgf6KuUrmfrk6R66UMenHE5N3AFcZqIY
         qbZHcuIkyvxUeMla11aNBeW803HI2U+QYW/u+4KI0yYg4hvULOIs8tc0RTY0wK104QEm
         HkHoRVisho2S8oK/u5FL9LkglMn1OGoGtF/aEqj+eUPt2HUCfXc1sIMUlxaARCc2SLDA
         t1vLS925ZcXHCjhdg37wrgXhSF3cr3rstREQcz4F7zxvo7enBrSMQmIprNSYIS1v7qRe
         81rVOlzQRiRhzPkRlF7UlgaVq/dDcgJXmCfUGFOXzTI0kOjPePcNsukNwzqsTXbPM3UG
         pMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737018543; x=1737623343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oElNuHGnh2SndiJKSmzP3b2+Y0n7fF/o6Bw/SCWA8s=;
        b=Fdgkg49JkVU9iqqJRjVTQt1zSHDnl8gRGOrhWX3AbAVUNTTV9bJJTDFnYmonE1Slrl
         S++2EpgLNCTIXYWD6gZwOwoAfHem4lAyCMeKQGlLTeVxdwv3Se3bx8g59jtJ7fwKAaIT
         bNhEDV7dKc18fAv05Kh5kF41IPpGHjoPaLdojED9SuWWvvrWDhuyafB7hbhQ6pNbbYLz
         3YmGeO/gRAuuZ8jdvzRuKg4aiEIh/sfxK950GwuY+03cu1V6NRA+IJwzo7zq2TAxJ6R6
         AkKVosmVsRh8N2F0RdyFCW87ZFSsixduqPcQeSCJoXgKpBNLD1xRQR5AWXH47OXVySxM
         DjIg==
X-Forwarded-Encrypted: i=1; AJvYcCU0v/c8erFCJaBPTaMqmtJ0i62okyU+PnmjVQi2aiqL0KhpSfH4vkQG5ErPvitBEUFzjzTLN41e2D3MeP7BCbrN@lists.infradead.org
X-Gm-Message-State: AOJu0YzX9jQKdMv4RMpMdxtXfiWGCU1UUThvcU7J+O3LbTnAXHz9aaka
	iKv2rb/yWwHnCH/coiH/T5lQpd6Hrj+GVONQ0b6H1CzhbmJrSNFVaofv2MNXQDgpgRI4HDouIvg
	ZfiocybQE+FNtYw1NiL2iR3pVsf4z8hYvX0dIyg==
X-Gm-Gg: ASbGncs77LHM2gCHI06i6kDJzIGDh6LFE8irfrAthEqY5/k4SSfYfZLvG7Lk4pW5tWT
	bav2pHgrXZ1n2rXmbwYaX4PZ/3FZCdJ3mi2QP
X-Google-Smtp-Source: AGHT+IGshDnah7yTVkge7frSzXP6u6YQ9EMlI5n0k71zbBXiVfkDniOTr0RXn5mT0CNZhOwwkIPYxH+G4Ml04S4rkI8=
X-Received: by 2002:a05:651c:221a:b0:302:1e65:f2ab with SMTP id
 38308e7fff4ca-305f45dcb78mr119399301fa.20.1737018543217; Thu, 16 Jan 2025
 01:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20250110123923.270626-1-szemzo.andras@gmail.com> <20250110123923.270626-3-szemzo.andras@gmail.com>
In-Reply-To: <20250110123923.270626-3-szemzo.andras@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jan 2025 10:08:52 +0100
X-Gm-Features: AbW1kvZEtDtDDV1b-JCy06VodlCu92OcKCF4KhRqyAArlBqTeeutEPgAkUkNoec
Message-ID: <CACRpkdZ6yNvtqjYHaWC6ynP4CdkGSdt5AH9ZrZDqYq=wTehu-g@mail.gmail.com>
Subject: Re: [PATCH 02/12] dt-bindings: pinctrl: sunxi: add compatible for V853
To: Andras Szemzo <szemzo.andras@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maxime Ripard <mripard@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_010905_582899_CCBA9635 
X-CRM114-Status: UNSURE (   7.75  )
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

On Fri, Jan 10, 2025 at 1:39=E2=80=AFPM Andras Szemzo <szemzo.andras@gmail.=
com> wrote:

> Add compatible strings for V853 family pinctrl.
>
> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>

Patch applied because stand-alone, clear cut and reviewed.

Yours,
Linus Walleij

