Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54101CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kH6m3q9Go+WlNJw/7g8dG1h/aaEJpSAxzZprEUvs9Nc=; b=QwGWI2At207ta+4fAYw5TiEPJ7
	Pch9Uvea0WnPSPZwmn9gbVA4GWNjY56VsP116fd0MgUDuZMNAz/XXEwbPf/blyu7IN0rCyRIPpwfr
	nqJUzHE3hglJc+hAjsbmZ7btIieHJGsaSK1bBz25lV0GSA/O5UeXoI8XDzcL5oFurf2eE7+6X1DHg
	+CrXWt52F8Ma49jrtZyxNDU0npXmCo9SXxy8Xyu5uxwPx3WY25c5BdNDjmE9dcM4ep4mazabrh7AK
	8Li18aKg7D/j1CcU6lA9oZCmWcG0G50DI6kiTPvoKbJ9+7eVCHES5k25sTWOglWCzJAUpZoP8c5hw
	40L7lbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Wi6-0000000A1iw-1lsl;
	Sat, 11 Oct 2025 10:20:22 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Wi2-0000000A1i9-4BPq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 10:20:20 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb78ead12so448244866b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760178017; x=1760782817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kH6m3q9Go+WlNJw/7g8dG1h/aaEJpSAxzZprEUvs9Nc=;
        b=PMIdiWh4D/Xoamtjog82BbmuFpeIP/Cr6SjngkyvVFju5tm9zFVLYBjATysxkYegzl
         2unMkp7p39PlnIIjlPgDxOnf1ixTKg6MBm/F3pXeUjZBiwKl4evl6JiEY4VSTqmbkB4Z
         lHKq+mk9A4q+avZeG4ync+gKxkeJgFMzUykbRsrRqqjfj/xuJJx4bmByo7MaJXlrC6Aj
         nY6t/RmEB7FN57aaUWL4thuCtXo+Tjy7OLYz8cpGPMA6Q2/cLqcnZlult4H79tzq34ZS
         x32tON/LpR7+fdzIgWg1gfHAF3x/6aT2HsyQRG8cZJHUfTUQB+enXFbiyDH+WVAvaXQd
         o+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760178017; x=1760782817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kH6m3q9Go+WlNJw/7g8dG1h/aaEJpSAxzZprEUvs9Nc=;
        b=oPDtHYn1zlrydxKseTDrZEycznF5SgCk5Ll+6y6rFprDMaYnWPLT0NbA5mcL3DasJG
         UyAFmfMMuUyXDvpfGrj5vhIQ0onhVGqBFKtuH6e1XCoV5ZmlQ2SleIuvIjV/BMZkpmMU
         AknwjXdFXWch43B3ONcN2LzGWmQmiRLVbiCvI5aTaqgJavAmE6AK80jGYl1IAaJ6Ou37
         GdEmknDY8tyUpkK1gGb1jMGKnIwgbgRo10+Pnuxobq1yHNU+kJLJSaJH6OSvbCLwQocq
         EjgqCzRX5henMmdJz9Q+fz+acHkd4RHZx7mPPPhOQeucY2sRskDvwPalvSJoT0GPeOQO
         vECw==
X-Forwarded-Encrypted: i=1; AJvYcCURPpcH36UdixJyA4VftPsiv1umC7t/x+tCRSd3cXDoN6WFMEZfY1ZCeH6DQnL7y3gM+58tfP2XujeCIB60aTwY@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzdi4EH7gDDD0h94J9KKsYG3UNeYEF2aDXYqlqZXKmJ+Mxhv/x
	KRkfTqFISik57AhJ8jkzQAtAglwbDwJs7l27iui0wVBBV20ZKoJ38r6z
X-Gm-Gg: ASbGnctxQAvou34ejIMimCtwJowcvFAC4P3xsZ3YMA4Ehf5jQCRNtBdkCa5Nhb1ImyF
	DBv1H/FrDN9Z9qMjeQXwShTguMrq8xmyCItnwGkzF0dhlgrgx5q2HhvDcAqXrqQYxEdLPWo/kqG
	dTrO7Fqu2s7ex/Nt6PGWG5kXGEwUrpneAyZXuT0URRrsMooScmbD/VZKN6GAz7isY4F8mQfsSDp
	/PofxwXg73awHlvtALcs/xfgn6+NXQD4gvk4Ud+4pgH3tHecrkgiyPkpkQT91NTffS7DBnOOuHh
	Iql5NN0Hx5Yu6B5EXeKHvHK24erM/Jf30j9L6FEdHfnwx/qvjo4P8NVIR8KHQXFFdeIp/v2DVeG
	HbcHNCa3pW+bXG7EhM5w9V52nHSpM2Kz9t1pEzcjSnH4YfqM3txylH/t/RscTzEU=
X-Google-Smtp-Source: AGHT+IHolFmrbsPL01Gij9mDgcL6wtIFQuNZ62CxZG1hurbWV+WEoYmcgYDEtNQjTwVOdmXwqzHL9A==
X-Received: by 2002:a17:907:6d25:b0:b40:52:19c2 with SMTP id a640c23a62f3a-b50aaa9c937mr1500673066b.20.1760178016637;
        Sat, 11 Oct 2025 03:20:16 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12a8esm454077866b.42.2025.10.11.03.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 03:20:16 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 01/15] mtd: rawnand: sunxi: Remove superfluous register readings
Date: Sat, 11 Oct 2025 12:15:03 +0200
Message-ID: <12756386.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20251010084042.341224-2-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-2-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_032019_048144_2DE87FCC 
X-CRM114-Status: UNSURE (   7.52  )
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

Dne petek, 10. oktober 2025 ob 10:40:28 Srednjeevropski poletni =C4=8Das je=
 Richard Genoud napisal(a):
> The register NFC_REG_ECC_CTL was read twice and the result was not used,
> then a third time with a mask applied.
> Removing those calls didn't change the behavior.
>=20
> Tested on H616 SoC, scrambling enabled.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



