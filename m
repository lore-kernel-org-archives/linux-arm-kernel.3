Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E244E67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ktfr7SJQpTbgMhZZT/6XJflt14sbq+igmEnRrXK6oIQ=; b=i+1uQDDm7PDDr633mUi2ACkWUv
	81qtpRvK14dvcJeGRAOa6wY3yR7Vc6XTNhI6BNGwAwCuOdkeObvTO0yFkNgdH7flR4g1AY1teLAIE
	OY0VZoj/AFF9FO4d/2bszp3Tzx6Tvf3IXPSXlEegFpuIoXQnASKlqqzALRj5h1OnDK06a51pClfRF
	N7+k63F9NyVAPd2Jt0ZrrMzu1B6nGGXoZPIKxk4lgxgXNmYIPuznfaN7/CcpnUv4nyypPijy4AnDx
	fM6kSnJfamZqoWU7dV4JTWjcOwM2Ir7lUKMKYI3af2mbdgq+DnB1E3+Rm6adbOJSqKYNqkktWoEC3
	IiPYa+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXLjq-0000000CYzL-2imw;
	Sun, 21 Dec 2025 15:52:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXLjp-0000000CYys-0T2r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 15:52:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so23942995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 07:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766332371; x=1766937171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ktfr7SJQpTbgMhZZT/6XJflt14sbq+igmEnRrXK6oIQ=;
        b=LhTI7t4AwTZUOyho3AzwIDhzCeKEqCBI9RUqMipiG4/wqvQxwcul45Q90cgDTddlQY
         u3NsDcBWwvV8+bl/p/misY2/nAovd3rlqrYlJWew91RIZjmE/3ZRZ2WrNLmzzGrkD3qL
         VcW4iJ+j8u/XZOByBFY0UhT5mBGk3zw9kg2TyWXn55405mMytiY66fDM5nwqy/zCqXlJ
         tQTx4iapFIMjvWUttqNZvTTiZ18rTYBd72DY2Shdiz6x4La0hlqL6WXuUhf4VSr/Yk96
         vNnZ0svCDIvkp5KuKr46NUybnINTR2PlwAbuqq3FRrNAadBmpJFmLfs3JlbCTI0s/8ec
         KXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766332371; x=1766937171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ktfr7SJQpTbgMhZZT/6XJflt14sbq+igmEnRrXK6oIQ=;
        b=bMTxKPDkysyuNye11S2ZiOphkJOGzbd2xRzzlg5lXSroWnEl7Ouby9SMnjAhBiiryu
         jrEMhxIvGf04MSlrkgFXSkEBAazICM4FJNol+lASgZH0oAPyodb07veNsQdfbFaa2ZyW
         HS2XcXufbHHAcHYHD2Eeu1mXVkyRIRkdaYmArBuXdfDkLaIiPwpQyXYf/XXQ6beJP4iS
         WwpFigt3UAy8CCb9oa9AbqkE9agt0WlkBBOKWT0OJ2Pd2S03CB2YGKZpoczhuz56TiTz
         unI01Hb/DWHGnaw+UpQK+OrJ4Yt6DX69lox29JKE5DV2PxdZEl5Gxo6c736omh6OHO1a
         KgoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfZxUDKgBENILEtV+83vDM7pE0Q8kHxQTNmvKJ1I5VL79HsLmC1hXbDZZ0LDrOFLOMn1PgOG7+8URfxBMbnGU/@lists.infradead.org
X-Gm-Message-State: AOJu0YxIk4L/GDwlbImG36Fp5l9BiHYN27IaABH0f4LeYUJwOaf/7M7Q
	8w4lbOGT/bdnJJfWsP7mzSsFe5Sq4E6IQH6QGlycna/F5Lkbj2q8nVTR
X-Gm-Gg: AY/fxX4lD0S0aQzrsyjBPoN70/oJ4//kJVHbhksEt7jgxqWRFvB7cL3YjC6asdX4V+2
	mZISg62NlLlbOlQEXSB0rGAfZ/FOFPqiTrAnAveKbak5dsxHexu+HHxOJZifRTtBuhx8YPCsHva
	Gj1v1D1Md7fMC/B4g72Z5LGhjPFza0M8OrYAEpy7+Jjh3XMFJX2Bb18nVqcpWZQWy3V745QeuvL
	e0I+L/nZ9MjW6HOXQFDTjM97U+mW3KTJn5HH21Gon/FiDbkXkpMaF0/7QJFattDVXruMEaGS4yL
	h8zUQCadEd4QgyKZe/GnvkxHlcI5hv93CeD511KKjH3+lp1z2JOcxROyo+ahV7wJwRevHgNnYbu
	Ho4SDqe6QShZ9v/0piVMqZAFbaFYMDCuJBRoSndcriESivxEWRQ/fhao7EQ82XTKaHQGWdgh20L
	qUNKRKN5qaP643+E2ZnxY3Wbnm5Tg/j+//YuXescRBbNZhlb5g7RZP5a13aYgGqWzsI0kb
X-Google-Smtp-Source: AGHT+IEbJh6QEEBqVoiA8uGAKHnpKaENlX2JGObti1D5zf3tJMVvd1glLOCkUq93fMJj0p1hdC0a4g==
X-Received: by 2002:a05:600c:45c8:b0:477:8a2a:1244 with SMTP id 5b1f17b1804b1-47d195558bemr85515255e9.11.1766332371058;
        Sun, 21 Dec 2025 07:52:51 -0800 (PST)
Received: from jernej-laptop.localnet (82-192-45-213.dynamic.telemach.net. [82.192.45.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a0fb9asm81695155e9.2.2025.12.21.07.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 07:52:50 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: t527: orangepi-4a: Enable SPI-NOR
 flash
Date: Sun, 21 Dec 2025 16:52:49 +0100
Message-ID: <13909614.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20251221110513.1850535-5-wens@kernel.org>
References: <20251221110513.1850535-1-wens@kernel.org>
 <20251221110513.1850535-5-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_075253_154327_88A8D8DE 
X-CRM114-Status: UNSURE (   8.92  )
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

Dne nedelja, 21. december 2025 ob 12:05:11 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> The Orangepi 4A has a SPI-NOR flash connected to spi0 on the PC pins.
> The HOLD and WP pins are not connected, and are instead pulled up by the
> supply rail.
>=20
> Enable spi0 and add a device node for the SPI-NOR flash.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



