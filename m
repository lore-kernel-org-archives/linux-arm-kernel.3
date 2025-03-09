Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D988DC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 06:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fz6Jf36xcTh8dqFosjtzLD6W+gVvPK4QQTcyeflwbf0=; b=u/xQycoaOXld8KZMxkpDgrdlvv
	c95ZkTe1+NencttYWqAD2rv5HVWgfssJ7w3PNsoGS076QRSoAGb8ywK95x2AC8B8MFyYVjEzp6Z00
	Uk5meJ72aIYFl7sfo9xXRn9p1LIfTbTUNh81cBCjqw/Gdw4t0WbSD12YCJkxktlIxZcPg5OUa8HHJ
	ODyvqT7cTYlxyj49BwzA4hsUcYaHdyIetOgQCNJ3fSjs5XdOmIwYoZfuJHH1sICMJTa/gSJoJwjn1
	MtE3nHnIp3JB/I0SbvBmrH7RciU9LQ1OBvqKxq5p7sHJkoC/RdJkcizBU33ieGLmFGiY9ILtOThxF
	6x5RlhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAL8-000000003iY-0a5b;
	Sun, 09 Mar 2025 06:40:46 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAIa-000000003Tr-2j6R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 06:38:09 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-abbb12bea54so595569966b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 22:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741502286; x=1742107086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fz6Jf36xcTh8dqFosjtzLD6W+gVvPK4QQTcyeflwbf0=;
        b=jqIjDv+vP0eNChdR8/DcT/ohcBqMHY0kIkTWtcO+dRUzdYZ0HTIFgVzXE90h4TWg8A
         GMKfGB2X+80dbVOV9qk0UAoo9eVno2sHsYYfTJXZ80T+j5COQh1TMoNho5WUoLttdmID
         o8o25vGTnAILTbK+Hq7muxSUbqeYPhfulhy7HrJ4UVWTfSc/2oB0sOOkFDXSE6kOx5iq
         J+v7ZL//SDfXFUA1dkTYBRpDPWbAS65OerJFJzv5lWUOgsId9esitO+jjMchfvP9e8W0
         3CgKqm3R11ivQOjOaKb3b9QpzhAVnRUJEaPM7FXzg1u0a5LmIEgUOGOgA3VYcz+GATVY
         6prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741502286; x=1742107086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fz6Jf36xcTh8dqFosjtzLD6W+gVvPK4QQTcyeflwbf0=;
        b=GvmvYdSWwRwtSFCmeywq70gZq6EW96NAZIzYH6VFojylazlRuIuQcyqVoJyn0PDoTV
         DWNuCX+7YIBb2MZEVjw+ssdJ7C99JnhHthLm4ps3CP8w4UCfl9faqPuSVCHVchxgds+F
         fnc26CR7UfonOXye94MyOcB9DGcaqxMu8KwTrhwN9pQbP3yHJVSbegMqB6Pf/0KOHY5F
         R8tMujRa5He9b+gZjaBdqTzqwJynaeMV8MiCdiwOkciYemk47Bb93uP5gpR+eRBJsh4Z
         6ya2yR/eh4c7go7g0E35W4TJPuJZBE02Fgexz7Tz5iuhEMQwekZrAFtBrnumRNA2sALR
         rDbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmMg8K9KoROwRZPjUAVwhOSFzYUwt2puzLa5iFeONLUT1TUKFZ1iBH3vrccPbGV93dM7scUPy4Gc4V/c3G78ED@lists.infradead.org
X-Gm-Message-State: AOJu0YwszSC8Wh1etkprsbdzVNUbCCZZyD6BGZDh22mshOkilAv1cWy9
	Rd+EVTftmxgEZrvzBaeA42C+ZsZMUZTvvKl4H6TFR4sZfVWw2X6r
X-Gm-Gg: ASbGncsGwVFBRRlYXFb45bPqKsP4OAqGIj8kBawQmUpQdZyEDP4Z6oEKccz9aF7F8s2
	njWHdGm8sxqztp9mvyh5VURkcmSQ2qVHfimgwrOaHBgL++nr4X9/grXRqmKZPQt7HdjnB06ATx7
	uZuehjLeCOP8WboQS4yOrxZxdcS8D/htU//3qQaIxuL5gKmtTi7EK2cFH6vd3lyUrwkZmjuP7xP
	l/eiLeSlqj6ZpGPrQo/AhtGpYD22Irq7EQ+X2ZYVMgeD54fWNjfzk4qhEXlwmxtHlMkEZc/IGaM
	zA/Ew99SxdWdanU9iRgKkCb/svDiC/KUviw3VNeYhbnUb1HqJ2/BGi6i8HOfepv6Iw==
X-Google-Smtp-Source: AGHT+IHhG0nyJSWhRdWZlqSDCjjx4E4luGYWfPo00aAv/HBDZfhIYjAS5k26NpukDfuKeycSfkBWmw==
X-Received: by 2002:a17:907:97c6:b0:abf:4c82:22b1 with SMTP id a640c23a62f3a-ac252738126mr1024070266b.32.1741502285623;
        Sat, 08 Mar 2025 22:38:05 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23943945asm538979266b.22.2025.03.08.22.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:38:05 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/14] clk: sunxi-ng: mp: provide wrappers for setting feature
 flags
Date: Sun, 09 Mar 2025 07:38:04 +0100
Message-ID: <5865232.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20250307002628.10684-3-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_223808_687400_CDC302FA 
X-CRM114-Status: UNSURE (   8.60  )
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

Dne petek, 7. marec 2025 ob 01:26:16 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> So far our sunxi clock instantiation macros set the required clock
> features depending on the clock type, but the new "dual divider MP
> clock" requires us to pass that piece of information in by the user.
>=20
> Add new wrapper macros that allow to specify a "features" field, to
> allow marking those dual-divider clocks accordingly. Also add two
> convenience macros that deal with the most common cases.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



