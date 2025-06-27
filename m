Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965D0C7EE3A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bnO/bwKwvz0W9dml3PFN0tff+1CpXP9/A1In0KM8MU=; b=vLrc5yQzuawf7P1LftxEyld2F1
	wdvdBg8zvg1Mn49iIdmvpTDxqWzYw7svDPqdMJF/y9CS8jIdu0RvbTsFHUvi1Oh7X+ZbEsybTR5zs
	+aWv2FwBgZfgaC0ima4oRhz8ittcoa5+Cmyga+MswbUL8dpAmq2Ts4PYf113KUwGAiy4Fr7BqVAMU
	3Uz/CrQvUEW3i8Ye+A1Y/poh7hJ4mOY5L6b++Qv4byeN2mCzRtIppuAkvcdrG1BSY3lzwCjNi7Lld
	w2nz7V0kfxVl7lWRYBHUjEQ54OFPSK53wsaMDSx34/1b3g1onobje5XV/4c9OzVKxB5GiBRrXzp/s
	hlQ+7jig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8g4-0000000Ei6J-1E6Y;
	Fri, 27 Jun 2025 12:59:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7zq-0000000EcM8-0xiT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:15:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso13208525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 05:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751026557; x=1751631357; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5bnO/bwKwvz0W9dml3PFN0tff+1CpXP9/A1In0KM8MU=;
        b=BtoY9CmKzOVW4Y/W/sFJfOl/ubsySf6scFulQkcANV4/2YDlFp378dEBQH2nA7/Xt1
         plg7puXQiqq3p8W1annbri4FoujU5iBsIDIN1FEOUxnalmrTYPy/3fCOc3rf37f9V6P0
         c4X/w/x4ZoLhQE2TUbVPYqMz1eiOjD6IQiwUU+afWj16wGZWZAx2dPXDolxY7q+pP9TN
         CQoOoLva3RfwxJm15OKqJO5B5r6cSRUpeyZ/3ntzLYKyVPgFd0ApX8l+OAc7xX79TdB0
         /ImmwNiKbKXo+NHtpc+V7PVEIbp9iYXHMXhwCwsdZtlXqK0kCd5HLE5zA+MOxokRwQR+
         yBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026557; x=1751631357;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5bnO/bwKwvz0W9dml3PFN0tff+1CpXP9/A1In0KM8MU=;
        b=bY+8zBTG8d5vJeLJ2cPagaZXrn9YJG1G8r+f0mXwUc+6OWaUTSuDTkwTYYaPScBxLA
         YPRqx6Vns24ASNZOxNK+SYNdALrTnfahPJvs2u5kt6fJ9uHrKithNvXgDFxq2Mmc8+ag
         MQiouZbS08z6ryMyMG4vHPss296765K0DxqbPR2qBunYPy3Gfbl5ylc3UnLJQB5pC/ar
         Sm19sl7QRVmgR8dvxSCnabN20O3zG48o4LdERMgpLGHfceououJm96U4d6F8hhjG51pO
         Fpk2Yyuw2DiFLq5MGVdWGVeV+vYOYTybCZTUrx+ieDEnyBtlVo460hi3n5x9ZWjr2K0o
         gNRA==
X-Forwarded-Encrypted: i=1; AJvYcCWKwrx+9+oMbW2eOAB7ZhwrVzLg7CqiY1/eg+AYpU/KavmVXpnOCT09hbe/oTDvZPQxgbFIV4iHK5bFiTGTdBrm@lists.infradead.org
X-Gm-Message-State: AOJu0YxYEIl+zK7Ho+GGaSytSoAuT9Bbrrl/4CHVrOb+BGI6PegknTmY
	0WJbTRyFVZ6XtZWKMRM74i3bASZLm7+XCos8wE4rtT2ll1SmsK4CK/r5WXucMMux6pA=
X-Gm-Gg: ASbGncsGOX0N3Gyxg3lMNWaq89Y4tTEgjO7KK2PMgfGcwj91J6NP278qOMiu7TfyqHW
	XC6TG/lIsLKJHCouyNeGcLE6/586dJTgCsttF28vTj7yxKnbWOy46OWUy7k3ujSfFKYkQJacZfO
	SInpOAGhXakTrn6al0nPBuG0AmEfC7O5DD4eHG02Btm8Ad0C14so37vS0y+HYVOQmoWpdn7GF17
	65R1S3xKdfM6bMty1sn0x+605tT7Mf8jcsijKiXI33dBg1v/uycnNQGPVNRfjT50JgntRh4L4Ru
	kD2r6z3FpCgH56KsewsvieN5dyIKojC14iUOlfBBz4gCOOMj9/ug52kuxqdeSTyvshw=
X-Google-Smtp-Source: AGHT+IEQFM3pQCiRU5lNSKxbqFCgvUVf7e/LcmOK+L4hhlaL9cMKkmMb9g/3CGCF3L4wxugIwNImYA==
X-Received: by 2002:a05:6000:40d9:b0:3a4:cec5:b59c with SMTP id ffacd0b85a97d-3a6f3162238mr7238080f8f.25.1751026556678;
        Fri, 27 Jun 2025 05:15:56 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4076ebsm48177435e9.31.2025.06.27.05.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 05:15:56 -0700 (PDT)
Message-ID: <ba42a719df8dfb74406336e8adb80b5286bd6fbc.camel@linaro.org>
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
Date: Fri, 27 Jun 2025 13:15:54 +0100
In-Reply-To: <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_051558_272720_EA48D250 
X-CRM114-Status: UNSURE (   9.06  )
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

Friendly ping.

Cheers,
Andre'

