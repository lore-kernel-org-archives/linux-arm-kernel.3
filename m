Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087D5D13582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l85KdlkTAz5xadASW0LnnSxWZp9LJjbJpdAW1AcAw8M=; b=m1IAWSac5F0P82tD7m1OkMNkK/
	rj44NF4dc1A47ezunu/ZhS371lR6WfYBe8RfKMDX+MKm2T6MOVNYVeQAwVrSntKH68tWcdkvV6GQK
	0vgJAk40U9lO3tFXRnH+aE6R6GYDBzQC0YuplfgaQUtEWwpgjkVPI1sqFMIcTMq6w4RGFicLdTEYD
	hmQihD3AIuamuaoB/PQAMEjvQnKJ4tMquZn3uL4nr9wf/GEaV/KTPsimyigs6lXHgTklZ9O2jlUW9
	CWJg4soMLyLl9sI2KdX/TdDg/HehMfEe+lVLkesM6omj193ZJGtrr5X0pwkLjVYD7hXOEqbVn8+e+
	BF5sYJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t59Z6-00000008nrZ-1wc7;
	Sun, 27 Oct 2024 20:08:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t59Qo-00000008mVD-3MHG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 20:00:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4314ff68358so4243185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 13:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730059209; x=1730664009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l85KdlkTAz5xadASW0LnnSxWZp9LJjbJpdAW1AcAw8M=;
        b=Kzq3EhCNb4fyBjDz0NSVWyjvn9sm3Q0KnTGP7RN7I3Hqsf78FqCMYSvU2Y70qcduIY
         Loa8X48ZhiYEY5VdWTGk/0LZ2bmSQAlFc76Ui9QOasd491FS+8jyNAW+OO5qrfCyQ9sW
         Zl/QaizaCoapjFVr8AW07VQBs64ehslxE6eQaFZ/SHhTE9jb/jS9XTDx00L/NL6vwV//
         2TZukuBb02/kKpg1YxXulvqRVCqnoPS1ZVQ6faTC5IVO49C83Jds9ksg1JIpj8PMu0xv
         iJx/Ur8kFzfYwexeZ63uc2Fb35GRhytima1kTqUmfbQOG+AkmHKXCiWLvEpIurhIR9qF
         1iFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059209; x=1730664009;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l85KdlkTAz5xadASW0LnnSxWZp9LJjbJpdAW1AcAw8M=;
        b=C6VN3HxPnswh+eJbzEMkoOoIaC37KkZnUZvsNXFpsLT8swrUPTOmapYlCaAWNKns0z
         sspGvmF+H444TQq9zxlV6YGiqTKczo5bNuQjLXowFQk7meFtIvSfus4giCUQ1k14nVwj
         mrQNsp6ZJsFnMRSGC9cSiV4dnzWbUczeGcWLnXRG8qS6nowpy8mI7bQZkUy8e1q6DX4o
         xka3rC/nEkVLS98IPYVLgW4iQ6a3l3F2ZrnP37FVsz9JS+jhLAvCuAM5gkS8hjXP87I1
         2CqykKP4TNpbBY/kF9RFMQzFdBPXJ8Pn1g4U/40pseChJSLdikrgzPiubq7E6k4P6FZQ
         shRg==
X-Forwarded-Encrypted: i=1; AJvYcCVEXy/57/7SdgWD+VGSdoi8nQICZ8oEQMFVqKaX+cSlcRe4kRNSBSAoD6DScmC+SKxmqF/tFuTGINi7vz9Mp+Ig@lists.infradead.org
X-Gm-Message-State: AOJu0YwYwL+PFMfGbBcHPm23u7zXAMuMKx3uSwbBIi7dEdBHJuJTLcLL
	w7jREbJacNDmJhZN7FUNPUXbk2Ms/0qeVezb4hg2MhpspZeMNisUlP05fG17048=
X-Google-Smtp-Source: AGHT+IEmbj/P9TPMmqqzemyzz2y/YY9lE9cW6lfA7r2y8ypUokN9JN2GK7tIgbwhXjQBFs+E/KDZDg==
X-Received: by 2002:adf:c081:0:b0:37e:dad9:8ebc with SMTP id ffacd0b85a97d-380611c3f49mr1617106f8f.2.1730059209345;
        Sun, 27 Oct 2024 13:00:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b6f838sm7506639f8f.83.2024.10.27.13.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 13:00:07 -0700 (PDT)
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
In-Reply-To: <20241026-exynos9810-v3-10-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-10-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 10/10] arm64: dts: exynos: Add initial
 support for Samsung Galaxy S9 (SM-G960F)
Message-Id: <173005920628.11546.8542073762216918711.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 21:00:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_130010_920201_79154C2D 
X-CRM114-Status: GOOD (  11.19  )
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


On Sat, 26 Oct 2024 23:32:41 +0300, Markuss Broks wrote:
> Samsung Galaxy S9 (SM-G960F), codenamed starlte, is a mobile phone
> released in 2017. It has 4GB of RAM, 64GB of UFS storage, Exynos9810
> SoC and 1440x2960 Super AMOLED display.
> 
> This initial device tree enables the framebuffer pre-initialised
> by bootloader and physical buttons of the device, with more support
> to come in the future.
> 
> [...]

Applied, thanks!

[10/10] arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-G960F)
        https://git.kernel.org/krzk/linux/c/229cf465b9f68db9af3f10b31d6a81b49a14f0e5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


