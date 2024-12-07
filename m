Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23580E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 22:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJBGA6D5vNEtEB/ib66h+psHOFDDtr3mhYyS0Z6TU5g=; b=ZrKrv/dQ4VoMPFbrEbcPQ9kXWQ
	3mEx1m3sMDSyCB3eQpXZYofntq8E14m0H9kIXOpj9QBiB8aKq5lnecodq7h2qcKDAku/mqHNNofrM
	U1kjGve5O7QSiV2+LfNU3BZJi2/azEBdW9ZbgNrQYPvkdgfFgFloIFS2BAsYJ9BFhZYH0/mKiqEyy
	HEjNnVwXdrUgDQSvfs3FqXd8BW3DjJOsdTi8xQfgTGnGsqZO2aei4MguDR1ez16Aw3kAiHuOrc9nK
	DOo7jGj3UUXppjzKr/TmlMGIZQ0RpBLUnvXV5hMN099W5sbT7AV2fmRTZ6va/5JGWiosywKJpx/FZ
	SKOEnXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK31h-00000004Ucc-19Pu;
	Sat, 07 Dec 2024 22:11:49 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK30d-00000004UWi-4ANz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 22:10:45 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3eb34620af9so261911b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 14:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733609443; x=1734214243; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJBGA6D5vNEtEB/ib66h+psHOFDDtr3mhYyS0Z6TU5g=;
        b=jNtz6EPFTpuitHJawPvtycMO8zUubdvhg78ZEdnA6ek6p5AoSb4u+F/tWJ9VHsIzws
         1/XjPSfLCOnhtuIFbgctWuEJ9sBCA3MSSbtz1luPsKpaK9UHaQ/ZNCvvPB28Zyx8Tm1u
         qkGk5vZZZPJUqixv9Iq5w8Lq1rYEHckcIYh+bl/vND+Lg8yCZECmucbhmuLHo5PVwTS5
         thN3Rh6oBXGVXTZq27bbL2MxiR/lK3agygD/+GWzVrd/GRj07yePzfdMGQSFYUgH6ZzY
         ZkAbyLDRNsMzYQd9zcX+BhMCdr0mt+FqBeNHZAqyXT3G5n4lyc/t1orD3XM2fwuCsjZK
         9pZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733609443; x=1734214243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJBGA6D5vNEtEB/ib66h+psHOFDDtr3mhYyS0Z6TU5g=;
        b=drm1MfePAj1JuYJboZ3wRTBLVOcNTswMymFPafpOCwVzQLFM7MM/kx06ASiLLRB32+
         Xgh5fWs4+l3HyTGyIG9BQHeMXn9sxuQHlk/TI5hppZATw0t0Vtf2dEfEz7E7prFHi1ij
         tidRMYIzJevSgfZYbuqY6nGD3E7oWAdY8x8HEbR2CX8BqLu8vLVwZgZBuW89s7oJJ63t
         l8HsI5fqXaw5Da/RJ4Bl0tghg21sNmzU9+OIGJH3WOe+uENh5OZa7tTHesDOVyu92Nvr
         VqJY6XS7pbJZ4ODose0pesTFvr2inSmppZGJLV15x8+znLq5WD633ONL8ukDypeRKcTn
         Znww==
X-Forwarded-Encrypted: i=1; AJvYcCW2W1QsL7H1MTgJDcw6lpFnJ7GuWDc7IuaV/PZvaBrwvfjN7novfwvtTEDthvtKZraBXfAE2Iz0SUqpo+l+zS4+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk6cCZXfheAxg4YBFNRn8CfDpBHElLtAMHFZqh6NuH7NU/TXm0
	aiwSbcs2URRkDaMuy2OSU34SjuWK+mRjwyd7Av01uX4m/walo5tuBtMxgLXxgNYhMWx0bBpQ+hG
	PS4QaNtXisyz3rjVgCQQ0pttW3Ornq8e0EgR9lA==
X-Gm-Gg: ASbGnctodagt4AyYq7qFwfU0hmVvb75bSYtsYr4ht8QCWRTmBuTUpahfJI0vSXfk/W/
	x3GlYataGx001wBQIzDUhkIb4y2jKjsc=
X-Google-Smtp-Source: AGHT+IEzfEqpnzeYKIfkF5R8fv702t9MqnWDdRkAxs3VAzNsDFAxfBBCyID+B7CHmUcn1Ieg9oCtaHwIu5Jv/QeLWcA=
X-Received: by 2002:a05:6870:f78a:b0:296:e88f:8f56 with SMTP id
 586e51a60fabf-29f7389c4e1mr8234677fac.26.1733609442837; Sat, 07 Dec 2024
 14:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
 <20241203-gs101-phy-lanes-orientation-dts-v2-3-1412783a6b01@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-3-1412783a6b01@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 7 Dec 2024 22:10:32 +0000
Message-ID: <CADrjBPpOj3E72SPAB65Zrbct-ny=ynZxKx+21foJdQ9qkPzC7w@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: exynos: gs101: allow stable USB phy
 Vbus detection
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_141044_845762_27AAC467 
X-CRM114-Status: GOOD (  12.62  )
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

On Tue, 3 Dec 2024 at 12:40, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> For the DWC3 core to reliably detect the connected phy's Vbus state, we
> need to disable phy suspend.
>
> Add
>     snps,dis_u2_susphy_quirk
>     snps,dis_u3_susphy_quirk
> to do that.
>
> While at it, also add
>     snps,has-lpm-erratum
> as this is set downstream which implies that the core was configured
> with LPM Erratum. We should do the same here.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Notes on testing:

Tested with a Pixel 6 device with 2 different USB hubs and also
directly into the laptop, plugging and unplugging from both ends of
the cable. With this set of snps quirks disconnect/reconnect always
seems to be robustly detected.

