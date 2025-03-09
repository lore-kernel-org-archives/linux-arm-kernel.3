Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEACC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 06:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FLOytRST1b7cBgnwTPUTHSCubeWY65ELvAASAoo8K8=; b=UulPkfqZf1U638qkF1a96a7KoK
	mOttApRpeth+k2f3s54XEZ/KQ2enTdWox433GY7HoAFv24m6bmgGaVijzvY1F6rBuOS5caYcGjbOP
	Eznk03KXysKmhseDKW4ws2rP0GZBxFWyITItxHiktu7D1FVrG9qJfJX0nV6P4gJTBfwkgbO4PN1H6
	E9qrtfoZ69g9Vjecsj/wi8QtWawQBWur0Kd5gOqe7qzqTA9mvucx/kI9m/D0LAvuu5gLXQaSRfVbC
	E/xjyJ35lg1XqoFbfvHrv7ksoBNW48nhb+GRoEqFQ82RyYnljAkAyeFLlpzSCDux4Q7bgUborz3P5
	m8pEgcrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAaC-0000000056v-1Y7b;
	Sun, 09 Mar 2025 06:56:20 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAX7-000000004pO-0oZM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 06:53:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso5249585a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 22:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741503187; x=1742107987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FLOytRST1b7cBgnwTPUTHSCubeWY65ELvAASAoo8K8=;
        b=cvaM8HCBBS9BkbdmUFsCelp3N55657b1A840YHtRv5CNmFLXj8qpdtAT2RfHPWqtZA
         QK+oV1vt/m391EZJCDERUO5jzXjQtUsR1ZBdfmkOS7WwBPsyUHzdByS6ApivLak1Ly4j
         t4IYWh907+m7GqU1OsN6J1f5WZQLYsGTF0eg360vY8I2af3xvS1VO8ykDeHPWepke7YV
         pPoBGsVo6OrP0GKJXu7v+0Tp1xbY41THDUeh4ijMXekusCuhTW3604B9vln3hSTE2wPx
         IareXm2QfrHgexkEqKWYjh2cfraI4vx5BiCaSWkxdY0VH2EjxdU7d+3B+YqbQ6qmafB+
         JpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741503187; x=1742107987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FLOytRST1b7cBgnwTPUTHSCubeWY65ELvAASAoo8K8=;
        b=aR0szLIqOpZ5aQ1j6qB6uyhj6runpQI9fZyGoMO7+pisF6QK3asOAXNcxhx95fbzlQ
         92FWPjK+FDs7sm2aOlgA9/dGjhdC0GH9uh6fWTG5inNneN3mZbelaoAKykauWTg8fHE/
         jAe/gZ0qiY6lIuUStK3qHAuukE9tTPX8nb1KXT+BKGdoGvc75QiTyEY7kr0U6gZH6ifX
         E8HqXTT1A1mLsXHdehxQknD6NAPBEE74EgoBJ2zn4kRXVP2tlb66U29DjpCUQ6FAFbOe
         ALxekBHJXhm8Fp8V37iTclbJ5C3KFqbFBZb/+9dRha00CnyxK9ckl+Dc6sz+imx/IvA1
         yYoQ==
X-Forwarded-Encrypted: i=1; AJvYcCULf1U4Bqw+2KsMddAyz4Ubxrq9iS6X2F2aUHNgspTLesNsuocEh0pkWBH/asVwq8+Q5QADnlpAUGnIORjMKJqZ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq6b0f6kqsMnz9AQXPth/OAG1z/jZBKwFxNUl9gEx5igIimKq9
	KhAT4filBDLWn6PaA8AYY1KWkS7P0nlsQLqOkgkg4omYT8b1R75q
X-Gm-Gg: ASbGncsiiSwFwRmGKskQyPiNLKYiqXJgtFddRNBBcmUHnZuGAIj6rRob8McuRoAQOd/
	oEog2RRzaqI5HBXFwebQlJwLCFscd6ohtYeApTBXbdVC7SKzB1Vt6anBP385AAy5ym78Tbruolk
	o0HLE6Ob8asp821kFlw/lgaRGwhcJOnrOyKoUE29S2xpP3G3hEvcoQb6xKWwoXIjOU7jfX0Rueq
	rZs8Sj7620Wr/PLVU+wO9ES4xf2f9WIdMyunPvzFbZxEuQZwXc2LwLGfswY40ujE8DKygsFjuRq
	tQUVb/EOr3M6OdLIYU0tpC4Gn0v9KkJhAOK0wCMC1+p7thYG0jRz6j9aFKirYi6nyg==
X-Google-Smtp-Source: AGHT+IEozQjXyjRcOAbnbhkCB/GeONnnBAob1GnncFL/WgIvYzJGUOAd/PvSRjZxlM/Y0ifrf89/uw==
X-Received: by 2002:a05:6402:5387:b0:5e0:9254:c10e with SMTP id 4fb4d7f45d1cf-5e5e22dbbf6mr10635788a12.11.1741503187497;
        Sat, 08 Mar 2025 22:53:07 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a7176sm4845027a12.35.2025.03.08.22.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:53:06 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/14] clk: sunxi-ng: a523: add interface mod clocks
Date: Sun, 09 Mar 2025 07:53:05 +0100
Message-ID: <2978516.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20250307002628.10684-10-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-10-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_225309_241368_77460A55 
X-CRM114-Status: UNSURE (   7.30  )
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

Dne petek, 7. marec 2025 ob 01:26:23 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Add the clocks driving what the user manual summarises under "interface"
> devices: raw NAND flash, MMC, SPI, EMAC, "IR" infrared, and the "GPADC"
> general purpose analogue/digital converter.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



