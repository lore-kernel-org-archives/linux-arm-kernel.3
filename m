Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CDFC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 07:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/qs3Uwkfo+ukkyY7y6RUTEw3elPT4tc7TjK0JH5xRw=; b=qRmAOndFOxsiG5bDTvl7mh0BtF
	iVCBoxGzXX3flTUPh21fUSNsZL2i5xhI/xZrVw0dCsq1okeDeD1IT0P7xiWb1klW8nxYA/UTyRCVT
	o46ijQOu9EPPCqzxWrM4qgDCqU0CXMjVUyx4Jx7fuIqwClFnL11GClqO2/QSS0O/KgXFFQh9hhGqK
	H329OL8V/IsRs0v1zfvIVZeRaAc38cv6GhI4DPgDP3ZWXkgupCCflkCi94z9iqpj9ctETATIs8Gd3
	2IbjZSe+/NJ8+WGP8fHszIYnUbqdMfn44XYRfqiMLpG9cDU55TJrVuOOM2/6LlSpIsWSVOmTu8njN
	zhoh8SEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAiy-000000005xt-0edZ;
	Sun, 09 Mar 2025 07:05:24 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAhK-000000005n5-0Xt6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 07:03:43 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e4d50ed90aso3977124a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 23:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741503821; x=1742108621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/qs3Uwkfo+ukkyY7y6RUTEw3elPT4tc7TjK0JH5xRw=;
        b=OiYFjJvxVMpPbPvmw2BgRKj9yKJVidzpCYfkN1KjV32fQiDGpkRedYlU0f+fAh23D4
         Fzk/miHofVWHcWC7KOQ09Tfdh1pnrTASv7sVbvh4lYZN748Uq09l4lb6jlLbC226yBc1
         dp5ug5Lh9H6KDveHGJo3U2AJ0C6F3TdPm45+HSRRDBAyzH9RKf2RRnFZatGK4rT671rd
         MV/i4hsgrlItIHJduQAXdKvH65VvvEUXA7XfOEO2h1zuDoUSb5BBVI9PAN8KaKvTajWj
         kYLr8CJwg5vVUivMR5MXeDl0CUM4NPheQgDS/la1NGKTB15hbjNdwmKckMh0Twb7UzqF
         q8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741503821; x=1742108621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/qs3Uwkfo+ukkyY7y6RUTEw3elPT4tc7TjK0JH5xRw=;
        b=azz/AqGdg3yKYeMJBaOw3oIMKLL5elyL5eV0OYvHrzsw0Tcfd4LfvmO/RE+Ouc9Zmv
         DHgXM4npaoa5dy9XwLgAmhprdpG2QOE/cUte6Ru/XY3svnEZx0RCp3lEh6kVGbqsbELo
         oA8TdFi36qFBZb7HGl9NSK+rrWl7HfbLNwV1E4CxsWxMGj9C01NCKBiZFfU/Cig0tc9C
         BB+J4IlEEB0EVDUiYotrQ+hYGh7f0lHTZAgCtsRLaU5iqL2Lq5IAHg+YXx9MKT8tdqh1
         KH7PORhI2L8mFqIuL+eoFNe34j+ApycwIiGbQZcA9KDkg8UXoPcsnEahlu9jgk0Yf6i0
         jcvg==
X-Forwarded-Encrypted: i=1; AJvYcCV4KohH6dBbIqEcVwEE7RRb294V797HvUEd46NJsNRIR5OHW1ElU3r1YKD5SJMO/IXpJUV+XHbY911j8s5Pukve@lists.infradead.org
X-Gm-Message-State: AOJu0YzNJzApRBGzeSQJ0SClNUGZTvtYJzeNi99WtD4shI36upKFHB9I
	WpqZFVvbakzju63GlJJm3ojHyqpccOOtqa3X1h+J+IVtPFzBsuvK
X-Gm-Gg: ASbGncsikjXCGzfSiMN4aySy/bCqorX0bAyxDR+de0FwGOCvAR2XBNRiGSdKU13GeTq
	ILNlPbs+pkWxsMbdMIOsnRKRqpLh88f/T3csehOVliLOTT+cMgvMj+7m1qjoZCHck7lb66W8j5B
	T1oPanIP6FU3SZRBW+3h6uyL7ceai7ZKGtA+zMSUSyUEWOFbIAfQvBHHaEQd3zty18feKMq8f6o
	iDXmJUpEhq2od27nMjoKwLBCs9KLeK7RWPsTZujoT1lvbbiqOSYKuBkQv/Nyzc/yL9DgAXqT3jn
	shdgG01m3loLhnPYXOLwy7p1PB4Q8Mo9C06joLFPNHQf79+7GajGplJQF3ezz8ZGqKIJq0EV++b
	9
X-Google-Smtp-Source: AGHT+IGMCqfgtOksXCU2D5pV4LcZbxKnKSmq361rjbRlUZqwxHJQeerhBdOB3YccYo/fjODMlK3Onw==
X-Received: by 2002:a17:907:26c9:b0:ac2:166f:42fc with SMTP id a640c23a62f3a-ac2530200bdmr963517966b.52.1741503820537;
        Sat, 08 Mar 2025 23:03:40 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac298412a9asm21402166b.156.2025.03.08.23.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 23:03:40 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 14/14] clk: sunxi-ng: add support for the A523/T527 PRCM CCU
Date: Sun, 09 Mar 2025 08:03:38 +0100
Message-ID: <7776158.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <20250307002628.10684-15-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-15-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_230342_170957_34D1828C 
X-CRM114-Status: GOOD (  10.31  )
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

Dne petek, 7. marec 2025 ob 01:26:28 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> The A523/T527 SoCs have clock/reset controls in the PRCM part, like many
> previous SoCs. For a change, the whole PRCM is documented in the A523
> manual, including the system bus tree, so we can describe all those
> clocks correctly based on that. There layout seems to be derived from
> the H6 and H616 PRCM CCUs, though there are more clocks, and many clocks
> have subtly changed.
>=20
> Describe all the mod and gate clocks, including the three bus clocks
> (R_AHB, R_APB0, and R_APB1).
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



