Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7565DFC618A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 19:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ocYjoxF+BmL+4lAR0aruV6XJ3WNgsR/AMGWfp36r6k=; b=LkQr4Yj7HG1a/7WD9dsdLann/Q
	zAqolOJyc52k76aH7q+vi8MbOibwvwMrp2sthJIFe2qRHFZr2ahgZso6B/iX7xM8kAQIwrGpxTO0S
	/ae3kAuYSNkamhYkDydDJcHXUX+rY60/ZohXj40FKuMKroh7cNg/YqF5OI9pxRtL3z3KijFScSsLc
	f1w/3qMyg9OY7IaUuQ+Daj90B/+n20cwOxKP+zxP+w3l4jNTs24IRRBCGUvvmVrY6/7syVDiyq+Hh
	12VFc8Ks6TEoz+hFkfMWU6iE1m7eJNPRZhYyoAfWEIqRab+4mU4ffYzJXe4KnuW9WO152J/6NSZaP
	LRv38sHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc6vt-00000009hk5-0nTT;
	Sat, 03 Jan 2026 19:05:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc6vs-00000009hjT-0KZP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 19:05:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 283F360128
	for <linux-arm-kernel@lists.infradead.org>; Sat,  3 Jan 2026 19:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00F3C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Sat,  3 Jan 2026 19:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767467098;
	bh=1ocYjoxF+BmL+4lAR0aruV6XJ3WNgsR/AMGWfp36r6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=atupu6XDFP7652PVUmPfZud6aDwhqa/ShrQ05Y5wN5/LaENexfNbtOJpU21SLDuad
	 /JrplqpISURr8E0EFo//+aQfbu0WpIEwBnc//lv7Fk6eSisrxTDRuDyHClC57/KLhe
	 /PeqMO9Ar+QLK45G0k5H6a3Ht7wKy9LTSU5M2GIFfjkpUqRd03FbSazoqC5cxl5Uts
	 atpvL9HfSGux6SeoYUEWTVxQH/JAnmUVCSzk3JlV1e2aeGlSW3Za+5BPso5xXwwaiI
	 728xCJ9TWLDA6INS8x/bI26MpiCFM8uxprYdwhOvarojhbHJ9H3MaoLuaeZw8MBQUv
	 VllevLzEnt6Zg==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78fdb90b670so81690947b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 11:04:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSz8CLaQaxgnjENX9TtWnNd/hkdGJ2D+CEgyX0TE0wjyq5vgx0V2RrBKrWqneV0zpUTYD0VGo7wqaxMFYxgXGg@lists.infradead.org
X-Gm-Message-State: AOJu0YxXT/tK2kC0YUzGA+AWJ0C9NA7gxb3/CWSjFpxI2p67sCNBMgXX
	MnZNmE6bXTMj/zSk6qxh5XnRJDWTwC4qdqaF3uHY2JYVik7M1eolXhs5QlXfpyeU2mUmdEDMsdv
	1GYKsised18se/BtLiS0ITPl4uQwVA0A=
X-Google-Smtp-Source: AGHT+IHbZhHaHEdWDQjutRDr8SPOwbSZ030Zf28/79XflrWl5n95Y1lTs89sR/aKwmdnEx8TvadlNTwYTO0FXJaNx3U=
X-Received: by 2002:a05:690c:c93:b0:78f:a7aa:b67e with SMTP id
 00721157ae682-78fb3e6370amr383069257b3.0.1767467097982; Sat, 03 Jan 2026
 11:04:57 -0800 (PST)
MIME-Version: 1.0
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com> <20251223-i2c-adap-dev-config-v1-11-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-11-4829b1cf0834@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 3 Jan 2026 20:04:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLn+vWZ=BrHEcYLDVKkOjt8W7NcVziYgFkeyoC7ZBYHOWw@mail.gmail.com>
X-Gm-Features: AQt7F2o3USLd11IPN75yO0DWWTRzw0lHx5hiKCrp6xftEOAkEo84jaNFImuzgt4
Message-ID: <CAD++jLn+vWZ=BrHEcYLDVKkOjt8W7NcVziYgFkeyoC7ZBYHOWw@mail.gmail.com>
Subject: Re: [PATCH 11/12] i2c: nomadik: set device parent and of_node through
 the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Dec 23, 2025 at 11:05=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Provided the overall concept is deemed sound:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

