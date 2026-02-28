Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E606FEE4F7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 19:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vHUIFMe6aqv8rNlp8GpXSth7AdqP3Jvt63LGxY7hZA=; b=P6jOHCkJe8NwysMIv2cMJwmx4u
	Ns9c3I0hSmxOBtcmiHoXTFFg53Qbs0NS/eMl+fXSFytz0CtQZJIXlAs6Gn9qN+/yhKk2vmO4jJpba
	jZjGpxTtgRJSIiGJtf/lYDkih1YP5iYzbJfOPPRoH8j8aYmpjjNjijQx5AoiZbKXNXtvZa+bA8MSh
	Ks5erYxGyyMbjLeVC97VtTN2DZtuh2+i9tuRfkkaIaF2gcP0VyIZJEFZ7WPHfBckqMtxEucBbo0SK
	XmVjSyDSxPxfiOGPdfKsooBnHrBdfUFLCJg3M17iCtTxUmArRpnjCnzibc+7UInZoPu8fxT3pAoay
	r4UJGrBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwPkJ-0000000ABaz-3ava;
	Sat, 28 Feb 2026 19:12:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwPkF-0000000ABZi-3JOj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 19:12:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48374014a77so36976315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 11:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772305974; x=1772910774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vHUIFMe6aqv8rNlp8GpXSth7AdqP3Jvt63LGxY7hZA=;
        b=dx2UCfLDALSPEkEvCsryr7edCpspJoY9pwCnUb4QcqBvYDhiiS00hkRn5GdH8GwDJg
         RQFQoTaX6EtsJgJLX7ca3v0xZdGy5IP1Q2lg4J6ewQCt54Lq4ZEcntRzc0YklwZj6LUo
         XoWkV0bwK9AMAzYudps+YNPkUIpL8Dj+n6AnUf3j9aYZg1TEtF9/h3EKJUULdaO530qK
         LduwfLUkDC2pKg1z/PmVJWBbf0vdqcZmuxaXhTe1Y74udSmG1dqieUPeZHxEIzZz3PxQ
         f/+iaCeX8A3n8suXnRe5KUH8+SNA6+SdrftfSAfe/jCsaqBFHauz5nFQNkyfZrfGJVOW
         pn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772305974; x=1772910774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7vHUIFMe6aqv8rNlp8GpXSth7AdqP3Jvt63LGxY7hZA=;
        b=AxF7cTIUYZJtN8WWFDeWiErtwopIK9XzHNLDK98eHWC8HO8IjqgXPP9x5QKiG97LEI
         5m41Fg0bQFEcHdXzOH4xMqnlgMF15zsM4dh/Pe5EEe3WrFFZeqnABexhKfW1iKCNmebP
         +96HYtIt+HOv/E3CL34JYdYDk85RHGRumyCG2lchiGuvfA1rpXM9i9OFcACwkRMs1fga
         Wcp3zPZuUhXNDSZJtgiS/flWYEwxta+J5SYIUSXdWYkFkA638MsQOyF10SdxdkfF7i2L
         3l2HqeNO4Jz5epHTJACtEIL5O4gIc31AVG1RvMc2P0SKAB+SI3XwbLqV37D6DEyLmABu
         4HGw==
X-Forwarded-Encrypted: i=1; AJvYcCWHorrnNwibHaHcvi1CZxVwbaQXKne/lQ+nzM/fBBWBZwKhFjU4FfWJwTM8/k968wpqaCwpSgQfQC35cqoGJyTd@lists.infradead.org
X-Gm-Message-State: AOJu0YxF1zdttpIOQp9tqRuLgKGmyEu00/wVD0lnDs3jUvcUfvGXq63v
	YmuPgx54jExyKPefD6lSJiqgKA1SqIss8q1YIPDWnoKPVHjBY4+DubBw
X-Gm-Gg: ATEYQzz5C7BsEFC405vp7qtSd3JH7bMSphodfffUBjD8qZoE6iRtHNLFVxG0QRQwgTe
	Mee84k0daLsmivC+UrrEtuHbYDAo77/ZpmgJq6/59ca2pXYXZN7h180x30eRxKkodGYLou29+Zv
	GNXqtS1/5eJLY7/4+Np3+pn0Jt86Z7ZDPPJYOj9J0ID4Kt7XKYH3Vex+Gj41Wunruegn+nrO9zj
	nEOe7nownqq+VhrH+JD5Gxs1ZwOMIe8fvcBB+2eFtv5UE7EAxDw83SkZalERsZkQwiHlmYYyc4N
	xyM9H9Md33S1LxqOQF6MZJShmUc/fYFjj4eYADs10zOtOWgld+lMgwdXmcwm2o3SSv+Uo56XAX2
	cEY+rgaxC0FisfUWiNrYqT80oTLjIm1ZF055Y2PdgTeV7eNK2t38x228exctoqyENke/iqsskCs
	K3lVI1cCYedOJkgskBq5LuHeBe09Lt3byRRC/6ZdT8KZRM
X-Received: by 2002:a05:600c:8106:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-483c9bb6573mr114108805e9.3.1772305973660;
        Sat, 28 Feb 2026 11:12:53 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb318fsm141401095e9.6.2026.02.28.11.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 11:12:52 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Add SPI NAND
Date: Sat, 28 Feb 2026 20:12:49 +0100
Message-ID: <5079872.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20260227175157.2339758-4-wens@kernel.org>
References: <20260227175157.2339758-1-wens@kernel.org>
 <20260227175157.2339758-4-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_111255_836244_BCE216C8 
X-CRM114-Status: UNSURE (   9.29  )
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

Dne petek, 27. februar 2026 ob 18:51:55 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> The Avaota A1 board has a SPI NAND chip connected to spi0 on the PJ
> pins with support for QSPI.
>=20
> Enable spi0 and add a device node for the SPI NAND chip.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>


Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



