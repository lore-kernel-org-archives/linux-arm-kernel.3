Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDD1C2A088
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 10:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87+FuFMoLYug0z7gqUq5Z8pX0X/7AkUpO+9WJeqmtao=; b=p82zlkADe8zPUxhy8FgRl6QbMI
	dQP29YFRDJSgmdNP20Qxy4sBBsgjJj3cHYSAYLtBFp3hTIY1FD3/tb2hTQYmX7MxpXtZxZ7Gktacv
	Vpfnw8ebtZkQL+oSRrdXLolfM3HHFMq5d4g/hEn73hNaKuOaGq1q3TctEbxgERnHM45l/AYHPeCDs
	YO0isj5diH1WXiehL6Y14Bdfw1/UPd4LobsstHZarTW30qH6KjySelbkh4wBo1iC8FygLhUT9jI8b
	Chfg1A52ZZPKjBNcgzj/hGCD7Gz8C3gS6iCKwkEBe7rchQnVJdkF0fkXrkBE+qt6LSW8pnowfJHP2
	YiI8f3DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchu6-0000000B765-3P6h;
	Mon, 05 Jan 2026 10:33:38 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchu2-0000000B75R-1Lbo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 10:33:36 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so11182967f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 02:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767609212; x=1768214012; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=87+FuFMoLYug0z7gqUq5Z8pX0X/7AkUpO+9WJeqmtao=;
        b=sedozrj83r/kn9R4N/F45atBT62TGLl2SaRIsDotrtdOUT8Tb1FpVcc/k/AonZRnk2
         wG8D3qkn9JI200F0nE944NKiDddyxQhngvBFByyEVwIOIQ3Z8CzH0fLymIvLlhgI86a3
         aTbGEDwo4+4DlyKtz0CT1hSq3I7LbFv7q9BeViw0gfw7vNrhVTUA0IBPqvKeR898U+dx
         nhjnoTE07e3LybKjcqn8CICmbrL3mP0VD20x8fJZmizUimexB9uQTMkK94dtSH9KmVU4
         l9T2GCIQbu6NrTdxuBfwlsg4WRDj9g4GZ8G1yuLKuqlWmNFO4W06gTREPIaSQ95vkanZ
         RufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767609212; x=1768214012;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87+FuFMoLYug0z7gqUq5Z8pX0X/7AkUpO+9WJeqmtao=;
        b=Npes8FbNkT1GEK0Civ9+MAkjuZy1LMF0TlNXjg30Pthb8mZY/vy1Cd60bwfaL+buHN
         YFn5Hh1uVn6uR+NKF15HTasJSzA5oZR/v2EPPNPg1t2wnNLgvTrChNN4TcGTPrfUEnnW
         Td45z2nGn1ZCsmDvwRAvg/a+lg5kaJrONiN5hdHoTzaQ2L7X+ce74LKU73ZCTT26iEW5
         b7wa5l5CcmsrXOJsG6uHNbTUdlKA7VBJ5jEIceQ/1Pq6GLNu4IYoufUj2Wll5fpMBkc/
         yeDOJtz8I+PfziZMAQ4xmnddi6YKD1GzDJrd+dVzODJfvMzaoDkokUilGxxlFzboWfKk
         F4ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV90qDtTXxQ1uEF1kpSZ/6FaHFIFXYZgwPPluZK65AHjK6Air2axNbsN9K+MSyoGL2MyJ7iydZECBSeADV5YsJq@lists.infradead.org
X-Gm-Message-State: AOJu0YyT+ekGEy2dtHKrTpMmgmreH4foijtWT9PhXb5MIk1Sy8B78sb7
	AysMpkw+35ikSmUmrnFHOi8cCMELCIkmO9qUnR++C51mUT9HNWYDYbcglu0MY3676X4=
X-Gm-Gg: AY/fxX4VeWg2SHiS8FYn9I2qHvPTkbF1yiljY5nNhyA7RGvy7GOnbf3nPcOEhSBN2CG
	HxcAbotFHIV5K+qPKvw6dHA4grT3fEY/j66svbf6U+cCGy6NAKssMKpKrkBv8msMzMRlZiScnvM
	xmYKB3q3zF4m23cRBGihJAF0csQPtKhMaZhxBe3cpZhTj+OusImcDqhcNSsQB0U8OI/wJzqw0dk
	q9Q8EJka4YVPFRnQt7RilTCpmS+vzvqmnRER6aEyIM8Vzmiy/G0gH+fAhbzJ4JrNtZa/qA8bwlc
	0Fg3HujOI9GM3+08/kQ9xk8aFM9mauv/00hFNmHI/VjglcwiFBuBXpJZ2PjaNP+UGjhYCNHmBWO
	gZ0cVCBHz8gyyTRKrC0DjWb6jXbvqikyXVB1aNduUJBnIs4f5m4OGqtTYQsaXk0224fzXsOXPiK
	LSONYF
X-Google-Smtp-Source: AGHT+IF5w2X/mECN9ZuV3JAcY3/jRJaPTYNcLs1xlZ4DkVwaHx1/DlQVheIQWCeAyX3a9MMJxgLOAg==
X-Received: by 2002:a05:6000:4202:b0:430:f5ab:dc8e with SMTP id ffacd0b85a97d-4324e4c6338mr65493674f8f.13.1767609211878;
        Mon, 05 Jan 2026 02:33:31 -0800 (PST)
Received: from localhost ([195.52.160.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43277b0efefsm67215868f8f.25.2026.01.05.02.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:33:30 -0800 (PST)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=4e65c143e89b164e7daa8cca0ebf34813a0d86c08fe8a1a41299070c2a1e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 05 Jan 2026 11:33:21 +0100
Message-Id: <DFGL60RQ7MV5.Z6I2EWG19UZQ@baylibre.com>
Cc: <d-gole@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
 <msp@baylibre.com>, <khilman@baylibre.com>, <a-kaur@ti.com>,
 <s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] arm64: dts: ti: k3-am62: Support Main UART
 wakeup
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, "Nishanth Menon" <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251230-b4-uart-daisy-chain-dts-v2-0-fa5257ec54bb@ti.com>
In-Reply-To: <20251230-b4-uart-daisy-chain-dts-v2-0-fa5257ec54bb@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_023334_656037_55973766 
X-CRM114-Status: GOOD (  11.37  )
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

--4e65c143e89b164e7daa8cca0ebf34813a0d86c08fe8a1a41299070c2a1e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Dec 31, 2025 at 3:38 AM CET, Kendall Willis wrote:
> This series adds wakeup support for the Main UART in the device tree of
> the TI AM62 family of devices. It defines the specific pins and pinctrl
> states needed to wakeup the system from the Main UART via I/O
> daisy-chaining. The wakeup-source property is configured to describe the
> low power modes the system can wakeup from using the Main UART.

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best
Markus

--4e65c143e89b164e7daa8cca0ebf34813a0d86c08fe8a1a41299070c2a1e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaVuTcRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlN0
cAEAsymWEGyn3zumRS4qBP2frRfRk/M0ptrcMeU2m2GEl3EA/jw/uSKEntBvWLh7
+3vrcNWot2uGtEQlf/nbvxYohiAP
=CCHc
-----END PGP SIGNATURE-----

--4e65c143e89b164e7daa8cca0ebf34813a0d86c08fe8a1a41299070c2a1e--

