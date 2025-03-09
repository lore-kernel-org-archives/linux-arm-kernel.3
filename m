Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3629C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 06:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXrGeMKEDMltcTZOnuSwc6OZdvzBmHyoGR0fdEWW+BE=; b=xPnKnjCOLVTNdRzJ0OKTzQSnB8
	yX3SeIjVy5xEpTEkeCjQjZWMJtd7u8EHPz45D6/wzQm6t3F4PgyxbR9nLgEIIZNQRlZPFKogrC6Rn
	dyBpEInq1DGAQWFmITYM0H8lco5ur4OwLgA9GJJCulIXz390KEq2LlpbFJAKxWuAqGmS/FAiQMD+C
	yW36WCGDijbvMX0h1/h3QKkY4kI84ndo9K9OwOI6VU0tw/rtj8cIMfgJq/+WHnhaJ2Af03Pm1FPFp
	fCHOSPxMIHSuT7R5pr6bY7OZZBUE/Bz5zSzgxLAI9t3Y1I1YdwnD6hznzdWZs0AlC8lGWMvJblCvc
	eZnejQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAWz-000000004oR-34CP;
	Sun, 09 Mar 2025 06:53:01 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAUw-000000004cm-0351
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 06:50:55 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ab7430e27b2so563065866b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 22:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741503052; x=1742107852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXrGeMKEDMltcTZOnuSwc6OZdvzBmHyoGR0fdEWW+BE=;
        b=mAmMk1Y8kijF6EynkFPV/MwJucYtKCXxZ51zAlc9M5jyB7NT6aKpg9Mgtf0NFf0OfV
         fHiQt+far9q/C7VnK/mIgeDQ3EqKuuUV0GMnzuaLHrqt3R0iwYY62SubLb0ZPKT3PrgT
         WTv5cV0XEn29fozHOMgZNmaKK1Gcp/waOg7fT2ZPAdZda+bAlLr9MS9tFYwrAW7FxBgN
         pSLqf4Q6/svVo93OGV2q9Xr1sxqjgIRh4kAo5LiKIkjdMSgY2trA3Rv35Ckt6flpd7V6
         v4ORHLtlxBtOY95AwB3pPIGYFJwonTVmG0DJvCoziDoEhVSTdNnqkL6okuhHgceDVt16
         Uvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741503052; x=1742107852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXrGeMKEDMltcTZOnuSwc6OZdvzBmHyoGR0fdEWW+BE=;
        b=vEZceskXO2vdX5mH/7XoEqLL32XbnEK5rTIZ4tTDqhnNJyFM1seu+4PtjHDXj0Syxp
         0h6FPBNqsjtPORVLqcH//Ou+AFwsELNs3jhloYdEEjm0ExxxLw+9djxhKfutMVp1c+pL
         yCQD1AW1/lkOiI19+NvT/c/qVB6yKLBoXEiGcfpHLzmUj86NRjBvrrp3zKeBSIHpeBQJ
         /7yDJOV9ZggXIFOi3HrY00obBjNaggsRON4214p7CdoG9jygLy3ovuGVOf3uGckillgZ
         euY5XI+5jsZVwW7cgIn35DUmOyiRBRmy7Y7dEV85euOVn4otja1SdlXkmRf+mdPmkIWF
         BknQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnJ5cSmVNbyYEttxFrCrd0t/u6FMJnK5XBd6CYTmtJGaHSF8gyA8WoQV/c6hpibtQ2OXMHe3+9w2a/VYfNCI9r@lists.infradead.org
X-Gm-Message-State: AOJu0YzEBcmQzeCU2F7SaKKLnjKMS1zYhjg7Ih8RygPJwlUEQmztth/n
	6OhXS0pSqxKfjI3TbxxH4YvYtl0tPoJ39E2tLudqP3ZQXgu1q77n
X-Gm-Gg: ASbGncuogjxnbIHQXQ5/UdLLo6ZiuLZSPU00YaDRNlejGt+BwsD2txBDC6KgiDZP+76
	JbNKSEYwkbc7uiXK37pnzkAWtLaIHEkF9aTXCexX0za3uVvVsryJtrqa29DzxFK2mHzHg16+F9q
	gYx7UjlndKZS/gYMkk3kiAlt83j3qIn2LWdu4nqJ7kuqxSMIMTRIfNGR6isOvLUDpCllrHbKZc/
	Xv7lg0z8eFi2ZNrJAxdd5iBtoYs/Z3hXp0Awwe/LMrkcB1utAVLz9Ck7PuUL3AWsCLokS48mGeR
	mpiZjs09kIt3YwdqF1n2NwFgY0zy4I0Z+2PAqRd8P4r0RvY9yRqW4CkefjfS7pwbhw==
X-Google-Smtp-Source: AGHT+IFXyBjwKS8n+FEnVkJuV0T3jFruhFE2A6vtlJI4jqzFnqL4g16+EpSl4SMNWytxbOSvgcDIjA==
X-Received: by 2002:a17:907:9490:b0:ab7:9df1:e562 with SMTP id a640c23a62f3a-ac252fe7196mr919864166b.48.1741503052319;
        Sat, 08 Mar 2025 22:50:52 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23943c476sm544681966b.3.2025.03.08.22.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:50:51 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/14] clk: sunxi-ng: a523: add system mod clocks
Date: Sun, 09 Mar 2025 07:50:50 +0100
Message-ID: <2214425.irdbgypaU6@jernej-laptop>
In-Reply-To: <20250307002628.10684-9-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-9-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_225054_052276_73BB9AD1 
X-CRM114-Status: UNSURE (   7.82  )
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

Dne petek, 7. marec 2025 ob 01:26:22 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Add the clocks driving some core system related subsystems of the SoC:
> the "CE" crypto engine, the high speed timers, the DRAM and the associated
> MBUS clock, and the PCIe clock.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



