Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DA0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 14:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOQ/XEh+IEpTSwG/pPspXvcZX55H6TJ74NlDqWEG6xw=; b=eDeCcZps/CnV4942kjzGCEoAfj
	MH+aQtmFLW1EhPV3gdgLM/qxBx6EcnamWX/ponftwpPP/UBwCjmF6+tIHqxOsqrvCGffgXJoj+lZs
	w8hE3EZSzwkTph2PJk9anHzualLPXpj0zqcR9NUbLXqn4vLW44aLT1Ur0117Swy7ocaxpEuIMmMss
	xMHhWHl7NRtleS3lcpumbA8ksX+9mYWY/NGJ94N/Yt9cVIAInLU+TH0PTbjlS+62+DZjMt8SYqj88
	l7mj0vTCKvhQL44msr6437/jkyUAZX65u0diWJYmkQCxeAT173vEspXikKHNslCRmYvHDhIotB+2v
	uwoq5XNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPNGn-00000008PUt-2kdi;
	Sun, 22 Dec 2024 14:49:25 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPNEl-00000008PCm-16RN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 14:47:20 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d0ac3be718so514278a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 06:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734878837; x=1735483637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOQ/XEh+IEpTSwG/pPspXvcZX55H6TJ74NlDqWEG6xw=;
        b=ERb4WXht68tNGZp/sDaOdcAbTCGs1BIRcA386pwhq+FPgsLtP5e5zUSIRgEWcLkPcW
         jn1I0bGSNImv+4o7ej3ZjBOFav3TR0hqYYdmXLA1UdCAZ0cm3VzWaxD9XzghWpaxZ4QR
         fE9c869S8DbPPVz18ppK5V6qLnHRj3llGWhlcu5V5mOvkcAuyVl3pYA5+h0kNXePDm8A
         obMnm1vCdCAkAY314AByYqTTfurkj+ZwCs2xrgT0sUuYWQSm+H7w7JCMG/5s6QbBrrbg
         Jhez3J3li6xmJS7LbyfobY9nJCwkMtQn4whRTwIC18sPIUnyaDoJrKv5MBjLQOIC/xbp
         zT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734878837; x=1735483637;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOQ/XEh+IEpTSwG/pPspXvcZX55H6TJ74NlDqWEG6xw=;
        b=jA7v2liJF25n3gcQDq4qLh4UFUeALGUo4bGgite64GpVq+w27RBH94QTv4lz8sC3xs
         sVuJfHwdIODHco6gcptgm+o69VKGn4jhOv3w2v51qoMKpOTdwCsiII0Euwh9kP5mI1LR
         pY4j6xGaAYWbHZcz31y31chW4lfmF7SBI0yHUuc1+xRrZ8Ukj3PEneciiO0F0+Bp0+rb
         yAsNC+0ohH+XSqU5n2i+RL26DTCYmQ/u+bvQ5/Swj8xjrmj+Rvl3qV7YOwRh8IXOldck
         LW85WMY6WJjRuRneK6H62SVbekRUTqUZM/vA6HfNoeazez98zx1KL8nInG/dh8t9eAtK
         PKRA==
X-Forwarded-Encrypted: i=1; AJvYcCW5AFZvdaqBD5E5gm3hMgrJ3VK5nZ19zUP5E7ni3gsqQh9Bx/0TgJkR+fkSlThnyItQKYUU2l96ou6zgW1XY97d@lists.infradead.org
X-Gm-Message-State: AOJu0YywUVX3ECSeAGxppSUpTeymgOL0tVZtDpaa1f5CJUDY1lUFYfxx
	ZBzYavFh8Xt5wLfb6jLwrD/HGPLjIDbJcQUD1NmsMjPFM2jSue/ph4aGTskckpA=
X-Gm-Gg: ASbGnctuvS3puc/M0cPoMaZp8BBVu/2iCDA5ODVb6jOJxYVezuAWrsZsgyzWMMjFyW9
	ggC0HlNyZQ7bz6b2igrDBdnvuAxzx1xrZI6M0ujGR7QseZXuzOEmWIjidK3g++fvBxyw26SWPpa
	cquQq1CETxHxrj+z9+tHpQTQBHfNiTm7xlKVMuB+SKNV6mKsL8i+NMTXBFb+7PSL2Iz5n5gL7F3
	BbH280GA7MnxEgYUJgGl5Iywf7lw0ZVBNKBdRbPvlXPWLDt9wzIJTPIRhbCutwk4m+oYxp+q8ju
	XZNcSveBq1dJy4t72gWsqDHT30VxRs0=
X-Google-Smtp-Source: AGHT+IHtQGYsCivCQdxdxbhIMcr1C6rTSuDeTm2poJaxHYzRC9Hx9uYNv/i6n4uQrNAoTdj6lsN2iQ==
X-Received: by 2002:a05:6402:3596:b0:5d0:8e70:cf86 with SMTP id 4fb4d7f45d1cf-5d81de05c1emr3525793a12.7.1734878837303;
        Sun, 22 Dec 2024 06:47:17 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae3b3dsm396496866b.82.2024.12.22.06.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 06:47:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Markuss Broks <markuss.broks@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
In-Reply-To: <20241214-exynos9810-v4-0-4e91fbbc2133@gmail.com>
References: <20241214-exynos9810-v4-0-4e91fbbc2133@gmail.com>
Subject: Re: [PATCH RESEND v4 0/2] Add support for Exynos9810 SoC and
 Samsung Galaxy S9 (SM-G960F)
Message-Id: <173487883501.18913.4157239259617984127.b4-ty@linaro.org>
Date: Sun, 22 Dec 2024 15:47:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_064719_354444_D5726308 
X-CRM114-Status: GOOD (  11.70  )
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


On Sat, 14 Dec 2024 16:56:45 +0200, Markuss Broks wrote:
> This series adds initial SoC support for the Samsung Exynos 9810
> SoC and initial board support for Samsung Galaxy S9 phone (SM-G960F),
> codenamed starlte.
> 
> The Exynos 9810 SoC is also used in S9 Plus (star2lte), Note 9 (crownlte),
> and perhaps more devices. Currently only Galaxy S9 DTS file is added but it
> should be fairly simple to add support for other devices based on this SoC,
> considering they're quite similar.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: exynos: Add Exynos9810 SoC support
      https://git.kernel.org/krzk/linux/c/698be6fe8f89b5edf533a85fba7258339c8b72d6
[2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-G960F)
      https://git.kernel.org/krzk/linux/c/63da297f0303c39025172cccafca7b55b169ec3c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


