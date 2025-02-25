Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FF7C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qR2JNB0YtgaNbh5AVqlZ4RITAUXIBdixqpacE0N/jLk=; b=ylBWRxWo00Rs3yd/b3/fdJWXar
	RjW97+o/GVzCFKb/KmegC4J6rMtayn4f1IdQKcCcEvw5rd9ayNSJNLV3dF1A7Wzy/CrWpoXgAR244
	hyW3fWG1Agiq4eURkndhzbbtqDkit193lETEuVIiPGtSlgFHpbyC80MnLj4muQMmi1RsKyGCDFXyb
	/+l3aVnI7ZZk5u0h2nMlJutoH0lsP4fhWgPzMn1g7eXg255lDCee1wyDfvuCUS4KVq0tvCk3ys19x
	nyGJ/dcA2MtYHWlFMqkB5rNT3eq3bIuRk5XCV0X7xYtvByZVXIQzi7nZIVmXukJPk8UKbIQKZLOfs
	WVHjIE7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy3I-00000000P97-2NUC;
	Tue, 25 Feb 2025 16:45:00 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxPO-000000009J9-2Mp0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:03:47 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30a303a656aso60676011fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 08:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740499424; x=1741104224; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qR2JNB0YtgaNbh5AVqlZ4RITAUXIBdixqpacE0N/jLk=;
        b=RvpjThdCYvhpdMvgb3v7Eh/7cCWofiaHgqbvf6Bm9Sz+7UiKyZXahR2C/Ow9/q8bW6
         3KQoInBMb39H0+KAOVsAogxruEz/7RiWu5D7XMkE+aeiIHVieyWJDPykxFT2wfnndFjM
         8okZN+WTpQ1NGBQqtAmlMYcLRoOWz7aK8wkc2N2RfRHvar2dXUl0QpUseElM28d6VrM6
         E9usKtXIGrO+lNztJqw2rWXADCEuNiZfTrabMBQki9mv9nibu07XeoQTNbkTBcF/2kbh
         WS+Po0V+sISHOQK8J8OXPE79leKyvIHxl3xbksSR7nAtiKTHhafbpJwhLUvIHFa0OSKx
         5Xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499424; x=1741104224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qR2JNB0YtgaNbh5AVqlZ4RITAUXIBdixqpacE0N/jLk=;
        b=EjA3U3Y0ZwDUsIvkiiPlIMr45XTYqHWXUYeTjaSsDFaYKfYfaa1ZPIqEx6M+5++dSC
         jsmg3aedipk4by2EJpwvSkpvbCppN1Lf655tgbHb6p31PSlBfsE3CyxcnyVAi9EtyzMJ
         Yy8S7Z2Da+GkYiSqSOc1aeY6kLq1AaRA7R59ATgovcGIsEat6MOwOmK6E3QyVxPq6vbR
         /BCr2kxWmbFp+5BfXwZp+ICOgDgbcXPkaniFkkg+mzCv3WgeSWWxTT5NGstCB953r3L0
         o6QC8slPURBsnbsmjhK2HKSDUo7lKRdmH+kwRV1Hs4qvQY5oDOjqq4YWh6Lhb8J62bPn
         okdA==
X-Forwarded-Encrypted: i=1; AJvYcCWrFTGDbVkk0yE3E7sxPrw1Sv2DyfIV8qYyC1nZi7kUUM0+ZBs9Tbj8ivH5x7BReiv8z6cF5KHu1VExTDzpaHe/@lists.infradead.org
X-Gm-Message-State: AOJu0YwJXLk5j6Q70AwzsMI7fKX8ijIC0DDbSeIVHESODhHgc3vZZWR0
	T7gQKcAAFcOU9vlAGBncE0T2LSGgnkY0D3HXkuZTONqWp1P/TOIJqrSo7sRAJELBk4MFwpYLelz
	REh2/PHvYxPps2WXkSWAFxgL1y2RrIhM9RAkttQ==
X-Gm-Gg: ASbGncvmpSFEx5w4fFHne14w28I9V7GnyyWdDpZjf37Z9afxiBQ6lHpcBo9kzXTLWOO
	Jy9H01KfxsawKMZXfkgDMeeNZsllm+cRpdcetB2LPphji3g1lkxU/Q7cH8wjCibtz9ywvO0ftE8
	7dH5pHgg4=
X-Google-Smtp-Source: AGHT+IFk/m7lVF7R7K4H5m7+dbhSnktSBcDmdUKKqlVUrI9Kn7thAe5jkuemGc5E1zKqYjYWf17ZEngP8oaLfuPEGKw=
X-Received: by 2002:a2e:7218:0:b0:308:e956:662 with SMTP id
 38308e7fff4ca-30a5b1a08d3mr64411471fa.17.1740499423031; Tue, 25 Feb 2025
 08:03:43 -0800 (PST)
MIME-Version: 1.0
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com> <20250221180349.1413089-8-vincenzo.frascino@arm.com>
In-Reply-To: <20250221180349.1413089-8-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 17:03:31 +0100
X-Gm-Features: AWEUYZnIWuR60Y1CICJ6IBniRC28YSjUf8IJsjOxper9yUD4oZSXk7ZrSbIe5X0
Message-ID: <CACRpkda0o=xGBsZkL+jLH=sGyZ-vHiuS3OTmOHhjMdezkUH77Q@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] arm64: dts: morello: Add support for common functionalities
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_080346_604782_9411F4A4 
X-CRM114-Status: GOOD (  11.86  )
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

On Fri, Feb 21, 2025 at 7:04=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> The Morello architecture is an experimental extension to Armv8.2-A,
> which extends the AArch64 state with the principles proposed in
> version 7 of the Capability Hardware Enhanced RISC Instructions
> (CHERI) ISA.
>
> The Morello Platform (soc) and the Fixed Virtual Platfom (fvp) share
> some functionalities that have conveniently been included in
> morello.dtsi to avoid duplication.
>
> Introduce morello.dtsi.
>
> Note: Morello fvp will be introduced with a future patch series.
>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

