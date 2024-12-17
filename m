Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060FAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPR0mR7aHib3t7qCGRZcUALodb3tIV3uQt3h3CFnSp8=; b=UaQsRIvQ4yPG3gml/l4+aGZkAf
	kBiyLB5MzQF/O/P/J0h+qYzKaWvGnN6I1m09EDDdWwaWueZdQ1B76+RI1BPw10UqT6GXWcPrsB4FV
	Myu/pzEmYVi+Jm9yY5cG0Okry5TY0WDWO8Eg99GNHpRGtVqIkiEko0XJrcmoKDbA7+/5jN+cTUaMa
	xhEyvZoChtIcyJ3sIucUkDNG2vT+Xd9znyXGf97ea9gnSUNdULKIy6CWvcOAKAHrDZ/0L7hXz0giW
	sKBPSkCBdl6GZqAHOkm8acMt+aJNokfqHyE6ce94rqWdN8RCH63wS5giorulrkGM2EZZtPUzsHlxp
	HEwnP0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZc9-0000000DykM-2tOJ;
	Tue, 17 Dec 2024 15:36:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZLe-0000000DvXx-0c7t;
	Tue, 17 Dec 2024 15:18:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43616bf3358so6223695e9.3;
        Tue, 17 Dec 2024 07:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734448736; x=1735053536; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RPR0mR7aHib3t7qCGRZcUALodb3tIV3uQt3h3CFnSp8=;
        b=C8bD6L6Z9EF2SwDe6UwmnUVPM13rRabo6BhrHvHmwCFASBC66Uz26VxuJpn1deumRO
         SOhEJ91sgKbz4GlneiXnHqutHsxAJZPZgnW0tq4Ojqv9zxzSgg99+Kg+Uz91PJpScOsp
         A6AGx2q9LammBvp6Ou6T/dI0wo7y9uQERj81sWyVlRKMjFXuM4ONw2dldii5gNy05Y9T
         9z3caFSnzaZFed7GwkaCM6PAS0SaCR4H1kEYQYaz+GJrDd5+TUFxJX38t5NOw9ByCM88
         XBxHug1oTu19npV6vswEhU+n+wf/Kuh9TYBGYjg3SG5bohXDFGvuKquDIW/v/7sHFKUD
         HeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734448736; x=1735053536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPR0mR7aHib3t7qCGRZcUALodb3tIV3uQt3h3CFnSp8=;
        b=R4F1Yo76yWhMSzeQjgMHdQktPKiMksXsWxp/1Xp2iArXlzDJWn1ANT4U4M+dRKF5kz
         I7jKdOTPAvc6uaL/WUR4T0gpsNfNHSojyFuDmIFKourw3z68z7A7rN1YBpFk65zNpD/e
         U7Q1PlaXSlP7ehaj7SS2FWnJQ8Wr0tuZ9JFs8gCGxoOcgZOxw4aNux7QulOFDqaLJvit
         kFB2RnkS4zSGriVHXlfF63RSTBtDCwf1d4itJxGhwdHGIWsao8GaBXc7IvTpUdgE0PfD
         AgLVDm0VYLhM36To1UYjQfSN49jsNZoTB049kSAcMUqtX4ohqEGPRAyX5bxU5j0lA5sS
         bMzA==
X-Forwarded-Encrypted: i=1; AJvYcCVXCseOaymBcFJWV5/Vy8zxOoKbsJKfRKU+FiwuQp/SGXDjPJlLdxTKSBioPJWldPGhxEjFfrlE5LTEc8kxYao=@lists.infradead.org, AJvYcCWmw28mAwu0pe7azhzSOkDGOrN1eKN561opI0kUTaZeHKO0U9Js57WgxGbaF/F6l4vPweQO6bnNDiPE5Jd2xLU3@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+LGKh+/UHrGDxN3g1e3eu/J81JrB7Ca6gaKl68AoY6MDLhZgk
	Hpz0aXatGXDwC4m8IsEoxHG45i5khJoucaAErhpTOLqPJlT2lxzI
X-Gm-Gg: ASbGnctYHnIdaxemk68Ukw1vwNACcQKROU17pZ6Odd3oG4hqUNf3NliuU4ZNUyAfepi
	SwTg+099riDKTHKS31/VZcSpYKW0LaDHHGrANcEruxrvYkXqoaQWds8fgwOtLFKBKkswSrRrUJ6
	ch4u8Gopr9KpIskW3SHXLmb1Xd/xAiIveF2k/ciRvgXstc4NWOekMREDZfvOBFFNgfLVWNOm0oG
	PXeLwDgU2EFM/cVBy6rV9gEk1Zkn+EqpIzpCGNeW5Ih
X-Google-Smtp-Source: AGHT+IFXeyI9vAcAH6rAgJBjbYUandXoU43FysAiQnCTh92fN6p46Oyvs6lJ8SZSBx0Mc3K8abX/NQ==
X-Received: by 2002:a05:600c:1c82:b0:434:f537:f9c1 with SMTP id 5b1f17b1804b1-4362aab668emr57089055e9.9.1734448735652;
        Tue, 17 Dec 2024 07:18:55 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4363601569csm120060805e9.4.2024.12.17.07.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 07:18:55 -0800 (PST)
Date: Tue, 17 Dec 2024 17:18:52 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 5/9] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <20241217151852.wj2cbrisv6v4sdl6@skbuf>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241210211529.osgzd54flq646bcr@skbuf>
 <6758c174.050a0220.52a35.06bc@mx.google.com>
 <20241210234803.pzm7fxrve4dastth@skbuf>
 <675da041.050a0220.a8e65.af0e@mx.google.com>
 <20241217151339.gjpdkfbechdjohza@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217151339.gjpdkfbechdjohza@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_071858_181929_2CF4DBC5 
X-CRM114-Status: GOOD (  16.84  )
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

On Tue, Dec 17, 2024 at 05:13:39PM +0200, Vladimir Oltean wrote:
> On Sat, Dec 14, 2024 at 04:11:54PM +0100, Christian Marangi wrote:
> > We can see that:
> > - as suggested regmap doesn't cause any performance penality. It does
> >   even produce better result.
> > - the read/set/restore implementation gives worse performance.
> > 
> > So I guess I will follow the path of regmap + cache page. What do you
> > think?
> 
> I'm not seeing results with the "times" variable changed, but in
> general, I guess the "switch regmap + page" and "switch regmap + phy
> regmap" will remain neck and neck in terms of performance, surpassing
> the "switch regmap restore" techniques more and more as "times"
> increases. So going with a PHY regmap probably sounds good.

Could you find a way to reuse Maxime's mdio-regmap.c driver? Either
create separate regmaps for each PHY address, or make that driver
accept a configuration which isn't limited to a single ctx->valid_addr?

