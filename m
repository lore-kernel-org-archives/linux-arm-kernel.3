Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5A2CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcWG0c7Ap4vHQVKjcGsS3wLPIyj8+cOECPrxfy8qqX8=; b=rbhzCxi7l0Mu7RhcYfsyYOXDrd
	JOXFmRaYNj9z0j1Co9fH0RySQIKKwhthUj/HQgBjiC0ZeZJpx4EBWRRxIDTgyBnie82IouxzqzCnb
	58GSdI4HatERy0Ab9ujNf+tg4vAXYBHcfiEqD4H0zCzCloIdYblYOqc2yKJKbpy9Z8nyBVGc99r6c
	x9k447oZIprxc8jPDKXhMHWTRihWvqK0CTA0sRacBGkAdYGz2eUwoISpWU39SLLo6WIskjPsAt9Jq
	zQcSiEOzscHlmiCTUggus53Ku3A0lnhDQIHfKDfArvOzk1B+5zXJYdMIYboIpAlGONJR74eUP76TY
	4+OyGi1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKfUd-0000000Epve-0PdC;
	Sun, 16 Nov 2025 16:20:47 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKfUY-0000000EpvF-3JAb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 16:20:44 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b737c6c13e1so212376066b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 08:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763310039; x=1763914839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcWG0c7Ap4vHQVKjcGsS3wLPIyj8+cOECPrxfy8qqX8=;
        b=AvVdgby1cMhAZZjc2e6sQAMYyCWLq4KKQVO411mOCSFbBI+GS5mhXZFK9sdbUanai1
         XWbFSz9xWtTZDuUVEjLpcZnmj8tYuBDZzw7Ik4YErjGLGlitRbuz7hXfV0Cv/NrquX/E
         Frin+yrrlWfWi3YI3F37fiEjWmSA5CmQsloxNhiRANgOi6UtL3f/9X54dqbeZcL3WG00
         vXbpD+g20moIlKGU6FcIjP4Ik9VvjD2w+vOPbIgXHZY617J7jfjTgXyFdpV0Bp7/0Cz2
         w2ckwHGjRKbi8NO9pHeMR3IPDrqAP0955zkC8iapchf4GZlNAYqMYax0cCJKubg3HaJ0
         bAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763310039; x=1763914839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IcWG0c7Ap4vHQVKjcGsS3wLPIyj8+cOECPrxfy8qqX8=;
        b=ujtB7sB7SlGbruAeCEwdTlGOu/C5dbgcihJI8O5uOtJkm63Tf7kzNY+iTB7PrVM8Y7
         akXu2mDCQ3859iviUQDQLHxt3kkNZ91MwlUZFqELezlugPUK+e0zWEzT6ycLz8KB+7Mz
         SAw8wxf33VxMzVkJ+dQaS1UAQpvwjj/Kq8l8adz7bwG7cMfnIS4hfwSoOIr7co7S5UsL
         Zl8vwOwI8SCA5zAKCYFKvCsBaQ41jxCQZ/0YoauCYQ1DOLZku2d8CiTh6T2h4XeqGTcH
         +PIQt+8/+MHBBFLtmo7XWi6rutthRyC7q21xF8WQ6oPfbPodsarG6OoAuLeB9e/6WooJ
         Xcdw==
X-Forwarded-Encrypted: i=1; AJvYcCUbFsPQUGYmmfNzcIvAGTY8SJTrZxUwX6PXsqBrbEwqX3ve6BiyDroXQdq06ZkZoWznKeLHZrhcN1xA54Rr/Ltr@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq3ykfF9r1WnqWl7r89gJ8IBq22lVmdoi5ejhQyooLWkQRxOFk
	qKFSpjyChjGVDZfy2i055PuVgkD2wceeX9hs/aQ/cdYq3cOm8TGUdGJI
X-Gm-Gg: ASbGncvewMx7ROEj2GK2MG/3UyHoKNyFn/7Es6IR2oKNvUxDB+KGVxtkaPG969zAdPg
	7ABH5ukMZ+dxDd8wsF/Ppcbzg4Kdcb0i6baTFgKIUiGhRLfMp+C4k3JCdfS43bapS0vnS32rt3n
	NinI4/hQiyyUVQo3b72pyacDKsMM7LKH5Hy2sh6fB5Vm+ufuAoJlONeVOyStnCx2G0XQoPrw0t3
	dcexG7G3q3MU7FLnTChM9dwe89K2ghWfSRm5qvArREq5iVkxBljtIkp09m+D3YYRo7J9qhxtLjH
	Tmn7VsWFg/+eUzW1YXKbgCAUh3ZH6z93Zxg+4Odv5d6JzJ5dSkyxAwobIL1ga26YKxnuIme8m7Y
	2ZdX3PRUbIatrmTPA3bdYoWHJpCwYeztomd9jhMAgOK8kkgk4tG7okTtoMrtptdtqbejeqQbI/d
	3sVb/oR44k59oS42HE5j6jg9/0nOkrZJ7zqL8L/hQzM788SvDs+RTPyalrti6w6Pf4xWREsv9V8
	PxLnQ==
X-Google-Smtp-Source: AGHT+IGimZSxkgoIOpfCKAWCHgTmcdkmEWm6/VMebPbmR8mxODGAMWNDh5ErsjYw3DRmDL/5wQcxSw==
X-Received: by 2002:a17:907:1c81:b0:b71:2145:dfc8 with SMTP id a640c23a62f3a-b7367962422mr1083057166b.39.1763310038731;
        Sun, 16 Nov 2025 08:20:38 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdae69fsm852257866b.51.2025.11.16.08.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 08:20:38 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vincent Mailhol <mailhol@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Gerhard Bertelsmann <info@gerhard-bertelsmann.de>,
 Maxime Ripard <mripard@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>
Cc: kernel@pengutronix.de, linux-can@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Thomas =?UTF-8?B?TcO8aGxiYWNoZXI=?= <tmuehlbacher@posteo.net>,
 Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH can] can: sun4i_can: sun4i_can_interrupt(): fix max irq loop
 handling
Date: Sun, 16 Nov 2025 17:20:37 +0100
Message-ID: <2804881.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20251116-sun4i-fix-loop-v1-1-3d76d3f81950@pengutronix.de>
References: <20251116-sun4i-fix-loop-v1-1-3d76d3f81950@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_082043_462944_786C0E9D 
X-CRM114-Status: GOOD (  10.42  )
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

Dne nedelja, 16. november 2025 ob 16:55:26 Srednjeevropski standardni =C4=
=8Das je Marc Kleine-Budde napisal(a):
> Reading the interrupt register `SUN4I_REG_INT_ADDR` causes all of its bits
> to be reset. If we ever reach the condition of handling more than
> `SUN4I_CAN_MAX_IRQ` IRQs, we will have read the register and reset all its
> bits but without actually handling the interrupt inside of the loop body.
>=20
> This may, among other issues, cause us to never `netif_wake_queue()` again
> after a transmission interrupt.
>=20
> Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support - Ker=
nel module")
> Cc: stable@vger.kernel.org
> Co-developed-by: Thomas M=C3=BChlbacher <tmuehlbacher@posteo.net>
> Signed-off-by: Thomas M=C3=BChlbacher <tmuehlbacher@posteo.net>
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
> I've ported the fix from the sja1000 driver to the sun4i_can, which based
> on the sja1000 driver.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



