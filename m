Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D745FC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 14:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8z5MFiFDbTCnPC8v5WpW94S0pfqFUuXgHt9s4lpS3Bw=; b=ds34M6+TdUzDIcMb+hNHfUTac7
	oYmgdjmGBNuxlpNF3D8ImP1y40dY5V5JMSsGMS2x0NYJziT1dVeQJVLn3SOFIB2KsYlmotug00ITt
	aac1FEvafRW2C3MoG2Qv4Lw9KiU6+hyN0C3J3CxYjQ8O/18Yu/9i3xKie3ZT5XHcnRyVInZv4jui/
	ECkBWAZ+G0Fv4P5xU0jT2aN3z66tRXqnV/8CMNqyR73tagt7zhVeptMGRTw7zLYidteL1siyLJceT
	+TFFwvZGGN4GON89te3C/7LW2+Na6MpHV642mCgR95WOjBKoP2RLc3tKc7HR+TO7Gz+4wCRhxQjAn
	VtsXNvXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKuq-0000000BfIL-3Tb5;
	Thu, 03 Jul 2025 14:27:56 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJJS-0000000BNAb-2pij
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 12:45:15 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso9436043e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751546713; x=1752151513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z5MFiFDbTCnPC8v5WpW94S0pfqFUuXgHt9s4lpS3Bw=;
        b=ZQWGXI+x7waq7HbYL+z+5xnuVynbGASYTYIGi+t+YGtLaZ+JES7kFF9F0QYQDHZJJI
         +p/EOvQTNRQPBuxfCzmP/vr9cTmE+Ro6InB0lNYFYmBdAutCWyxp/voFwv2zyIcAZtxB
         7c724kwBhKvp9OsAJ8kRKkhSbXq7K3BXlhgYeEqkT/rOjkgYIar8pMpjyn87QjDo8/mo
         D5VEi4FiTcTSq12rA1fPIJtZYZ6LdisY806fkEiy51MXgXAyGvnTk+JwSoYTVBysn6z4
         6BN/w/lnsBh1Pac/AKNi9hyKswmXRGBsBb33FOJo/mvk6qPUeAh+4asOQTGtLVEjliio
         wCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546713; x=1752151513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8z5MFiFDbTCnPC8v5WpW94S0pfqFUuXgHt9s4lpS3Bw=;
        b=kVpjzO1M8MT6VxuYr7kBD1g6aUs2hpTImsSIhDzK8l/gc0/XVZXzVTR2ty13UVxWNS
         aMhHFYnbbHIup4i/F4HCe0zXpUhl/tT0w//QK4MBeR37uPiwfmCQl9T7u7W1XrfUXnkE
         mAywYIY/hwbs6NTLYzBiL0A1Vljr85Ft4YC4kvhVQaMA/1Rb2IXDVQg3o1WKhuufGn82
         EkbqX4/rS0Fk/BSBqy8Ynmuc0Z/QsuCaXyxthpSb5KpVfKzWq5yQ2c4tIn6Ka+PWMzxI
         VOmOLvkEtksjDCAWgemgaVYQXcugryJ8+5x1oODL/so80eAjyPFHko/vFnp0fCXTQt48
         4AiA==
X-Gm-Message-State: AOJu0YzIC9KeLHyleNomI+Khksf64VZdYQFON9/oV9KnpIA8YdU5H654
	6WrGHtNdkoWsR+1S5wN9NfGRPLWq/c7rSikvMX1wQ/vUM4siuHVpQJ6DW+9vx3AwlnvVXHJtf1C
	MWMyFuSBoj8HwCr5qAifWuzjyyJIsAaU=
X-Gm-Gg: ASbGnctbMbYH8qOjKIHz4sFr6B3HLH5DlNqvjv8CZphY7ajnP+0dllgaXymBssuw3vj
	1j5uLJEDJ78nnhnkgGomzvSr9bQG5EbRcm1ip6p5pWCVB038EXBtdagHFqrwJD4yF8nfmG0yYft
	9lmheRJaZAoZZDkRs6vdXWeco9tNpvDtULPxEA2dEVQr9eQT1imzwTwZquI5hXEYyGZp5ZFlPJB
	aM=
X-Google-Smtp-Source: AGHT+IGBw3CxY2v8MLX/NDdGlfF8dyBndDt1tavZLG0gZzxse3LqUUJJxO/JX2QX8e47qkWrZL/3+lhdGSA9IhX3VqY=
X-Received: by 2002:a05:6512:1307:b0:553:354f:1fe2 with SMTP id
 2adb3069b0e04-5562836564cmr2772958e87.51.1751546712637; Thu, 03 Jul 2025
 05:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com> <20250620213447.56392-2-aford173@gmail.com>
In-Reply-To: <20250620213447.56392-2-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 3 Jul 2025 09:45:00 -0300
X-Gm-Features: Ac12FXwocCCVqSmjiOxSD4g8dn9narHxqeilAf-O-E6b2FW2Q8eELtrk0gCMDmA
Message-ID: <CAOMZO5BpbVg+sV0DXNSeJmsKjrZzjVy2Dr6W2Axd5tGT-U9tEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mn-beacon: Fix HS400 USDHC clock speed
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_054514_719059_DEFC1569 
X-CRM114-Status: GOOD (  10.96  )
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

On Fri, Jun 20, 2025 at 6:34=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The reference manual for the i.MX8MN states the clock rate in
> MMC mode is 1/2 of the input clock, therefore to properly run
> at HS400 rates, the input clock must be 400MHz to operate at
> 200MHz.  Currently the clock is set to 200MHz which is half the
> rate it should be, so the throughput is half of what it should be
> for HS400 operation.
>
> Fixes: 36ca3c8ccb53 ("arm64: dts: imx: Add Beacon i.MX8M Nano development=
 kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

