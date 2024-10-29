Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A70DD74943
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 22:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pAo8yXwp7EZT+YMqcaITNqvg6hNd8KJ9Uj2bnSqyIs=; b=jXdGi6wyxUuhs/+N3CLyTypuRY
	VHpilG9hBhROFrlR+k5IR6IzqNMc6SsKoeZQ58kr6AP9dYO26Ey3R5+LmBRTArSBPLXe4yagCgT+s
	sg3ZJzTmaehtIc5gprSnCk19VokarYxlvl3Hnh/+o7u30jeen/KXxHF/COXZRazXtjbALwutVnETO
	gY8XRMc8Nm826gEqiScz4+tbPp+wRy0/TFzttAuUViudU6DW5uo75SHFzPKuA5geQFOX1qXqRb/30
	AjUoiKq06mn2Ga1oJhU46uZ5E7EGPn9XW+VMsQOAGTAf74kGtFqi6QhdEvx2LBdmw/KG2hfKLJt3B
	/tcUdhcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5uKr-0000000G0mU-2JLt;
	Tue, 29 Oct 2024 22:05:09 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5uJE-0000000G0eY-360v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 22:03:30 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso57373841fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 15:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730239407; x=1730844207; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pAo8yXwp7EZT+YMqcaITNqvg6hNd8KJ9Uj2bnSqyIs=;
        b=F6U3BYxNi22oGIlyHXlXE2r0jXQvxiRz7sqAS8ksm6mJ2HRSgm020Unrit70bGHtWs
         hU5O6F1E5B9ElpgeYnV0boIr/plLBOqhq45eSuQBBQSRwhVZjmqsMCRX523LAQt3I30J
         gPKXgSrIJm4/uX61u3ftTX4H/gxrhR/w8OIwbAdpbj1uOLXL8AtmdwfZHmJFiyeWeNmf
         Fp+wS+yFxcOfSn6hVE+mTr/Mq7dIlfZltgVpMiWi1/Rqio7zi5hiD23DJevwrKHYZqAK
         xxSYHtbSfuT8ilI8WV61uLZ1RR08Mlrc2Rst1UWSpWKnaQek8i6lSVPNhKa/A/2Vh/Wt
         FgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730239407; x=1730844207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pAo8yXwp7EZT+YMqcaITNqvg6hNd8KJ9Uj2bnSqyIs=;
        b=n12sKOb4829g3gznK/D3k05tWldaXXsF8CoI2F33fYbR6aKZGtpRhF2+B9uDKadvcO
         ID4JOv4GmCSxvxJMC+fOEuCEgRd0ZZxLntb7lP4Jz0AsrN6i6E6D1Ws2+x/mZxF0VCd1
         USP0/8C8FGbcPhfh+pVqoi0Qkyp84PUbPWThBhMNqBLzGEu4q0oS/b11MB7RglubBdA3
         p3rGU7018pgJx0LgeAf3+izAUcolzcWYBiuJswSIlix4J34rvXmlhTQ7ATA589ru7Ow7
         d8LZwLNKuc0KoYrXs/hu3MLZ55+2nYneoG/PLmusEcdSJBA7lAOYohOrOo169Hun4xQo
         s1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUQjvFdBeWuZLboDaA640SDSGcEvaQXbIXUUtQaYf4uyNI2V+3ZZJiYKo2VFN6yZz51eL0Xh8dlDfccMjxvTUvx@lists.infradead.org
X-Gm-Message-State: AOJu0YzxS9Let6NYaRcqo7iWgYn6J0aLjXr0U8yRLmTM1M+Ly5fjHNQh
	KqWWake7JPQm/+IIk8bI17KmZXmZloMieu86kwXyA002nO62vN3y1Repe7Rs177kThHg79tPypL
	RbyTnNlzn6KOh01dRch38G3jkEllbEGbFYLq9eQ==
X-Google-Smtp-Source: AGHT+IGcZQz6tTz7pENhFcPJcjvryEeZRAirjIXuUi7C7dPCymNJLcuzkHhPfZv22aI+RYtsi5iRg8Bn14ptPLiFVos=
X-Received: by 2002:a2e:be9f:0:b0:2fb:3bef:6233 with SMTP id
 38308e7fff4ca-2fcbe08cf3bmr61215001fa.33.1730239406513; Tue, 29 Oct 2024
 15:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
In-Reply-To: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 23:03:14 +0100
Message-ID: <CACRpkdaEQYBim8TuDCCw15QDUWhHC-VqhGq1Le7eOd76k56zwQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] Add mfd, pinctrl and pwm support to EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_150328_822854_5601D577 
X-CRM114-Status: GOOD (  11.90  )
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

On Wed, Oct 23, 2024 at 1:21=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:

> Introduce airoha-mfd driver in order to load pinctrl and pwm drivers for
> EN7581 SoC. airoha-mfd is needed since both pinctrl and pwm drivers
> needs to access the same memory block (gpio memory region) to configure
> {gio,irq}_chip and pwm functionalities respectively, so model them as
> childs of a parent mfd driver.

OK someone has to merge this and I suggest that I merge patches 1-5
(all bindings and the pinctrl driver) since the different bindings have
dependencies between them.

Then Uwe can merge patch 6/6 (the pwm driver).

Anyone against?

Yours,
Linus Walleij

