Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6385C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfogaeDXFu8NsSm9XLGcZrTDHnRVDxhctoqJhgjWD2Y=; b=YcjUPf6+KDmdsGR7Y53Lx6uSHo
	QG51sP4nP9uwBr19mSYrXyMIsltZue67XMXLlgJ1ynFbfc/FyyKAdBnkG3WwxwIuOBTYg9oy1Pyxg
	ry7esutYqa78gNd9k9c3Oo26L7o73pclELH2nZeg6NtaM002xEOn4ThHvT8A/bVap4+h4FOEP4Xw+
	Jteny7W+ts328Bcev+RSrXMgTjIfIIfZca4c97jS5GVJ1A9OcLj0GjCwnWpNX05VzYfZUvDmaTLa0
	tTFOL0bZeRnuFFqeASI5Tl2I6S7GdLwgZhrBBh3gDxmkL5JCM2ikc4yibanIWtIihvD1qhRNQ75uP
	Am+uRfGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnqZ-0000000EIt9-4ATN;
	Thu, 12 Jun 2025 19:44:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjXk-0000000DjfR-0Jqe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:08:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso1492735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 08:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749740918; x=1750345718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfogaeDXFu8NsSm9XLGcZrTDHnRVDxhctoqJhgjWD2Y=;
        b=mEfyGQGAfJ+o9x2STc4yHuwQRnH+zLYm7BXoXbwaFkFu41k+pZGFgzXmEVZAkwdHfM
         ugkt8afFqbx5E0iVIGu+M7LCFne9GP1f/bK37dXuc9Ylf+G8hAOxfLviuYeo5kULcn/b
         icyySC53X/gCdJj0GGQ93WHt+b1/zaxE953D6gN7wMwKTc6yR2zTHIJq0CMksz+iTu8P
         82PYAhHlgWII6QnbGGcYh+m8CfIWNRCS+gaKoLhq2i+9RctlIpPk8LHsu+zbZG5oCLJm
         ZTN6dOnlbPCm3PZapXhMk9PQTvcAmgC/R3ZtCTs9D7TnqUtLBKcARLVnCkoFb/nPCbpi
         pKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740918; x=1750345718;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfogaeDXFu8NsSm9XLGcZrTDHnRVDxhctoqJhgjWD2Y=;
        b=tXvHF1NCENKfDm8nRDnYmD4CbwJKVfc/uCi/4kqjRGqKHNOPGI9zIDB49vSkG8tyTD
         6eGybPt8li7B6hCQt2ijL2AlRWnx6weH4fxsnbPngOQjknB4YL/pWcMAZ7PEYimteZeK
         EBhUMbETjqUH4N5dR5kFs761tqrbEkJDeEDadgBUm05/4iH96PYaKa3592Eh0WqCgSS0
         pVL9WxJkBnaS8yLvNO7EkKJ/qyNACf1jPdAaCNsgTsiFInk113vApWd4ziGI+Eu2Dqi9
         BbfUfDT85KE2rzpZ81tHFizBWJNgp8F/knxwZNBSu2tFwoZOQ/8k3VqM0I7UuvotyTrI
         pUGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQD/+e1eC8a5L5hMBtWokZx4lye63PuJNV1juzNFS63ULNkw8i+hjpR5AiU4+lty3qjVV2azGdjELYNMCX2TbE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5nSP2X46QAM45McTFhRSAEYZCapx4j36/RBXFnw9aW1i0jkrk
	/9Q1nwZx4X9igTtrMEJEOURq1mRfzbLTqLlHGojwOfurOeu2OV+nHrke3KNpemVRC5U=
X-Gm-Gg: ASbGnctvGi5VhwLtzsHgukROGD0l/O2VqlJVkMlYufJRYFXlKCiJU8qFFon9dx/bmvF
	4jKi996GxJHfY73SJOdM56K6qYpwQmmf/hCZor7oeXS1JLVaNauzRd1EPd7tEPx0QEMpL6g/vHt
	CPdkN+jwDHDg4HBCiQywta7qcZXLIeqfzRuW8U9H/ozZvAOdqO6xxewewGxTuPX8Z50JMF6AEy9
	HKB9a3VL3QsVWmaIuCcxDszfX0nIRo5RxKIQInwM/2I+VtXHCuX/eWRXJeC2D2sj5tnecHQ8qrr
	Og3ut5kV20mSTrKmb0XAi/ox1nJ4M9FJXWBbvR0PCXWFMPJzBNY5Lj+wP8A+uxV0G0A9PhmlnoJ
	AOVg+ky9oO9+ci8TSGA==
X-Google-Smtp-Source: AGHT+IGsHolW/1zgZsW15i4xzcpT6QiGNVGcfarQaCKUIeuKHVzXBnh/SKJKOYXQYnzFBUqMAybUug==
X-Received: by 2002:a05:600c:4e45:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-4532e8e40d2mr12583245e9.8.1749740916809;
        Thu, 12 Jun 2025 08:08:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1925sm24251255e9.12.2025.06.12.08.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:08:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: exynos: add initial support for
 Samsung Galaxy S22+
Message-Id: <174974091358.105902.6680955080416928440.b4-ty@linaro.org>
Date: Thu, 12 Jun 2025 17:08:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_080840_118531_8DD8599B 
X-CRM114-Status: UNSURE (   9.25  )
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


On Sun, 04 May 2025 17:59:03 +0300, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds device tree files for Exynos 2200 and Samsung
> Galaxy S22+.
> 
> [1] is a dependancy on the aforementioned series for the usb phy drivers
> and bindings.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: samsung: document g0s board binding
      https://git.kernel.org/krzk/linux/c/a67a28f59fbaeebbc37186d60a6c56e16b99829c
[2/4] arm64: dts: exynos: add initial support for exynos2200 SoC
      https://git.kernel.org/krzk/linux/c/11715fcf1ccab759d43ee1ad3b1b5bedd7559b48
[3/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
      https://git.kernel.org/krzk/linux/c/5430fd9e0794a21b08ccdc01ddc942b09830c1be
[4/4] MAINTAINERS: add entry for Samsung Exynos2200 SoC
      https://git.kernel.org/krzk/linux/c/6c1497a4bd72438360d977f37837d9638b702f33

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


