Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F4DD10BF6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 12:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/M8UQSVOYdwgbj5CZajVmfuAcuFVgOKdwDSIzZcGcQ=; b=xOAWHsBsf3tzlF5KFHuGZe68Mx
	OqAO6W+VFutVK131aLGG/AIGh5S+Ph6BBNKPOSo+jCdp++Ps+CZXvkGczp/xjqQ98DG16KeVZPtrX
	lXULBnJd4bnSxefCv0cK3g90IhwqnBIlv8E3K7KrkT93qiYuY/vQ3uIsiEVTLp0bwBjWQRLNMlIN4
	4f/ITAWX9YupkHmmXUnb//cEiunrUManlkDSpkOcKxNvZs1bgMZSuQVWDLao3DTds74MLqscfMYXk
	cXDCPFMi0goJ+5rbVO8t07QMPeYiYMXc4JyC86ZMwtvng3hs1ViR3d2j+t9Ydt45/5yOs2YlljDrc
	8Xg6vzQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ffu-00000006aFR-3XDc;
	Sat, 26 Oct 2024 12:13:46 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4feK-00000006aAQ-1lQy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 12:12:10 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a9a1b8d45fcso31212766b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 05:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729944726; x=1730549526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/M8UQSVOYdwgbj5CZajVmfuAcuFVgOKdwDSIzZcGcQ=;
        b=Qh4VsroRLpr41tWiqjzmodJPXvI0eFmAocGKmt/ltvaC+AWImnTrx4ydoWgFoFdSp6
         Yo+R4EIvaroF8ZFpcj8+KrIklcw01CYbvlXVkqQGuvevj7JZvrJKaiwzlRkjr4UaeA3+
         rreAq7cUr7BwgFqSI5bHZHdAgrmFhSzrlA/Ee/oRM74vhcVQHtxYmFsQOsm6CRiLnEKC
         JjEZyAEzcC+PoKUPTHNv5Ps6YpDGPm+AtbtSzmEWP0XI9BgZUcyG6s57TH5wdT9h4QMi
         VxmPRVg3iIfR9v3J7fpPZKUwCfYzGFIvKBvBEy0z2X8RJsQAJ5EwAi0DTJFz7wgQniti
         /QYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729944726; x=1730549526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/M8UQSVOYdwgbj5CZajVmfuAcuFVgOKdwDSIzZcGcQ=;
        b=axdxIQ+JMx8BYxiY7OfB3maUf8fJtoV1JNSvmArDqasty6eIobaar/xWqDgZVt40MI
         gV1nFxKE3FIm6rcVPIQl105VhyKYrtv1XzthDuK6K5/z7k3++aBbZPzfEPOHxKvpNLht
         jUHGCgWfMUonVhM1AFuaru77OJmcCC9nlJgmk5ubi+08VRW1D+HJPQ5tft6U+K9z2R5+
         yR4FoSxDgofJyp8QSXulM9XErUDVKQayka/GlFwxxQaJHEemxZEGoSGDih+HeVQWhPXK
         2TCGfRLU5hq4/yhFF3vx1qY0pOjKpersZP1DSddYty0gy8Kdb+I6Fg+ZuwoQ4BPYKHMn
         WrPg==
X-Forwarded-Encrypted: i=1; AJvYcCVCHrMjPlGaiODEkoHyddaZ8N284RoSYL1I8Dj+WIK3+ads4L6V6R3TvgI85I5o3Psccbbv5QdJtyP/0k4q5GAY@lists.infradead.org
X-Gm-Message-State: AOJu0YzZG72bvFconAQsE1GHWQXRUYsq51RY8grvMVPK2MMW4royxUVZ
	k6mdF3+DB5GpE2+efnOMoqbko3fHFAzZB4fxEGkbrKeuPl0S8m1GfGZXCGyQfSw=
X-Google-Smtp-Source: AGHT+IEUleyfh0n6tWnMCBjtlyAZ3mGKhEds91T7wra0PT/A5QLxjmifUACEHGa/AYzNQ3vXhOB/7w==
X-Received: by 2002:a17:907:86a0:b0:a9a:2a56:139a with SMTP id a640c23a62f3a-a9de5d2a83emr74680166b.4.1729944726111;
        Sat, 26 Oct 2024 05:12:06 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a089168sm166821066b.208.2024.10.26.05.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 05:12:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos8895: Add cmu, mct, serial_0/1 and spi_0/1
Date: Sat, 26 Oct 2024 14:12:02 +0200
Message-ID: <172994467264.24870.11860096857422265131.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_051208_483700_B9883FBB 
X-CRM114-Status: GOOD (  12.01  )
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


On Wed, 23 Oct 2024 12:17:29 +0300, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds device tree nodes for multiple clock management unit
> blocks, MCT, SPI and UART for Exynos8895.
> 
> Exynos8895 uses USIv1 for most of its serial buses, except a few that
> have been implemented in this series. Support for USIv1 and HSI2C will
> be added in the future.
> 
> [...]

NOT applied patch 4/5 - I wait for bindings to be accepted by Greg.

Applied, thanks!

[1/5] dt-bindings: timer: exynos4210-mct: Add samsung,exynos8895-mct compatible
      https://git.kernel.org/krzk/linux/c/e54eb0465e548a7c6115e336ec5cfec04bbe8747
[2/5] arm64: dts: exynos8895: Add clock management unit nodes
      https://git.kernel.org/krzk/linux/c/fa986d1073805154888a788eda38d46a796346e8
[3/5] arm64: dts: exynos8895: Add Multi Core Timer (MCT) node
      https://git.kernel.org/krzk/linux/c/9ad6c3bd1bcbb73e2a5723e13b9d06e2296b07e4
[5/5] arm64: dts: exynos8895: Add spi_0/1 nodes
      https://git.kernel.org/krzk/linux/c/a5541d737c8de71948bcdaee912bcb6b0781af7e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

