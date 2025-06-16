Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9677C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlYsr4bUuL71I/0B1fBuLT5I1PNAUlvY0T0xSXsIL6g=; b=cXdfPe+JxiD9Q+MjzgXJKI8cX2
	DnF+vTCHwTLigqnGYxUww2v9djCVs34zjf/qBazLDEmjWcFvMv18nMinvnrY+OBS8lTrXfuWY2weN
	+uFAt4HxOKdDRDGopakG751nmsYyN8frsDPf/NIDn6LeGhtQrG44Z3Sl5m509J/o24ihIWCLLAHl6
	tsndc8SU5bkmpbzRTgYa/MyjiG0RLRiOsNUNCHLSoq2c8iCRbPlr2A1MSJMZ13vPMM8/ic2OaIVHm
	gLRCd7Zwc2TcI4TrqbNTUTBC1EuIk2ylQ/5ExibXsw2r5csglZ0xw1EamqhqnVCRdTAag4zDFWyRY
	hJV9aLUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9Kb-00000004RIw-2WOZ;
	Mon, 16 Jun 2025 12:52:57 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8Ez-00000004EaZ-15wU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:43:06 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a54700a46eso2897267f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 04:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750074184; x=1750678984; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SlYsr4bUuL71I/0B1fBuLT5I1PNAUlvY0T0xSXsIL6g=;
        b=P4Th3+vi4B56+P1UwDCyaR19Cx8oij5GFd0ffl87cvR1g2KqzNS+VfVFQYCB1SiOZ5
         17bzmmPgBRoSdtAlJz6u2RAAWdYKDXiQ2basp72j52kccI2ycqWT5YtQau2SlyBJVNlH
         8JlYcnXgrjfgwS1Vu1vcFbNA/pJZ60f7bGYsxABjF+MqX8T7bP3ESZ1bje+bWsf/LbYA
         NqcO/0X9K2J6FCUXZSS27M1BRpXCdzCehsgFsLS3IuQT7ZH/c78Q4b8kRHKxCAiTsEwF
         Yyy59n2sjejoXpO7ztV1Pmh4uQd8mCXYlZFljMr7GK43EcAoqD9AgqiRTJROYxidBSI4
         +MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074184; x=1750678984;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SlYsr4bUuL71I/0B1fBuLT5I1PNAUlvY0T0xSXsIL6g=;
        b=XOiZ9U5CbxaUgi+7mRUnx10T1I6BIN4cSltDARTwNoXlMMFNtxrRUPq2XtxT/8MA3t
         qbffrdAyr3Xgdp2KYcD65DSxBUpImciuUf7rFRdLv2hPAZtWvGCfDJLznbfa6th5Ig4V
         TJOCihpTE0ANeyK339v8mo2/Inw5YuJBonch7OIjRKM9Q2LWtQiy0ZLJ99rsZItfpmdn
         bY5A6jv69+94lfZDbkBMPBJ+Ct+3F3NQ/99s60qxrxV+q77J9o/QvQbkIQHhi6AdI1XG
         bXJboOobOrDG0HgvOOQS5OXmyFXluwLI/N67uxs7ZhLGhGPA0BZEEMKyZjhBrekQRgVh
         uLKw==
X-Forwarded-Encrypted: i=1; AJvYcCWnx8xzOYmgPxR1DrdL7J1rox/tu11OKA2orkJrS9rMpzM6ir4lEQdCSkj+dKeZYBR3BG+zDLYImA4eVEkZl3H3@lists.infradead.org
X-Gm-Message-State: AOJu0YxNgw4sfyiP1cQl3waCKxGBpCivZ0w8rbFSKQuuY9RTSHLYI+ZN
	8DWhRL34sLU1mj/NhEG89JsJom4O5QU2563HmCQdT8h0OrH+jZtkVYS0Qr51Ca6ZPb8=
X-Gm-Gg: ASbGncuLVpgNADvW2S8BFe8IL2MycUqz5PHFERiqS5ub/OyeV2SY1UkAighL4VnvGbd
	uVNfVQdPcq5JVHqS/1alZqTaSjH2VPx5fKbwHMgywVXaqpZNjwFCnb6IAHgi6YH7igSmYKmG/XJ
	cJbMXjE7MSDGghCE+seGkSL+eaybxjtQDFRdm+IpFQ8VdXno/Yex06q6U98RIfAiuj6nm8khjxV
	VUzLmHWvp2vkuWdAWdd+w21JPxm1LtAha39OTiP9U66YlLIFLc9/pJTG1ghJacj+vaJkA4WHHxK
	M66NIEXGMc3AZG4mLrdDD5+wLKFFZrxftSzgdpLSUt3c4Gy3G598tuwoeLVsz8Mf9ec=
X-Google-Smtp-Source: AGHT+IGzR3ZuLPqrDClmDT14/rcbBa024Df4uvC1J4VfbxZQZgOlZKKu8R1O8lRTFylZ0ymEYgXL0w==
X-Received: by 2002:a05:6000:1ac8:b0:3a5:2b75:56b3 with SMTP id ffacd0b85a97d-3a57237c7femr7023655f8f.24.1750074183744;
        Mon, 16 Jun 2025 04:43:03 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b70d77sm10962182f8f.94.2025.06.16.04.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:43:03 -0700 (PDT)
Message-ID: <85513da45f564347185d1f5a6bdac242df022071.camel@linaro.org>
Subject: Re: [PATCH v4 02/32] dt-bindings: clock: samsung,s2mps11: add
 s2mpg10
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Mon, 16 Jun 2025 12:43:02 +0100
In-Reply-To: <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_044305_303184_66C6864F 
X-CRM114-Status: UNSURE (   9.11  )
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

On Wed, 2025-04-09 at 21:37 +0100, Andr=C3=A9 Draszik wrote:
> The Samsung S2MPG10 clock controller is similar to the existing clock
> controllers supported by this binding. Register offsets / layout are
> slightly different, so it needs its own compatible.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Friendly ping - can this one be merged please?


Cheers,
Andre'

