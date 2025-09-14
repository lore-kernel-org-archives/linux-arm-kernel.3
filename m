Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC259CAC594
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 14:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5qapOJtKxyY0MNaqH7qXtB8qqR3nlxKXEctWyb1YrfM=; b=rqEGEXUJD2ZnHVb/TSi1ANvmCL
	7+2DJ5qyxda3Cc9J7Lebdvg2io0DYhDHolH7oT+ttcXFJdZNCwVOcyxTqVOZT19094IatAyWdRuUJ
	E3kWqCNqtehc4n2FPeFD3yvG0/3yBJT0hqspftGF/M9XrTAYbn7N/I5Yg/MR1+654w7zek2Z/1HDB
	0eB+YM+bhSrR+V11bNCjGwse2Ve8D2IeRGmfgiNqcgB/g0/PGQgEX1zuHbnu8Qo6iOAMrHHSZ8Q/X
	TMoA+rK5FaKQF+m6FYSm4zFrP0P6WU6CICmVWFbsczCfESZscuZZQYS5D4HV02rxelfRUM9ziKhS+
	NjhZRHww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxo9D-00000001bCm-2s1Y;
	Sun, 14 Sep 2025 14:56:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxo99-00000001b7u-1x8U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 14:56:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3ea7af25f8aso86549f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 07:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757861765; x=1758466565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5qapOJtKxyY0MNaqH7qXtB8qqR3nlxKXEctWyb1YrfM=;
        b=EIrtnopByv+ymYdxZ0/C1oxCkFO6NZcSYSjKNCamKRNioOVbT4Z8hXwy8iCKl+84A5
         GKZXigoOXNtnUwWyzONyUtpVIP2C8GhWdC3avv77djfdDMcSzUBhtDmp/8btVpA/5CmE
         zg6s5yB+nZsEsrtsUVze3Xe8G/S5URsp4XkwU47vbOYpdFUhKJmnomyG2QC8s3p9SWoc
         GeN42HF6rbxD4ebGy+jvtJKyxkKHcZNij397UIcTgJ1sCKyW2nYTEg+RnljNxPpF/lOK
         wqiZoL+iAbVIOeGgbh4YPEkA3+L7mEVy0bP86Hq4DoAaGinNlkI6V9NFK0oM4muXnXhb
         3yPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757861765; x=1758466565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qapOJtKxyY0MNaqH7qXtB8qqR3nlxKXEctWyb1YrfM=;
        b=J4Fn2iQVQsB0zacC1fpzsdWgAN+sxR0erJqc6g+Pkj/kXrfh3+FRsxtHT15922tKgN
         EQXr9H7DD7N9MrQqwK2Wav6t+l+0ltMkkCDbWWYdPtxANFIM6KQ/rGx8Y8j72gwA61dH
         RSkYziv01wi8Uar0Eaq0lW6bzoCyHvBRnNUF+NNSmligl0riDvFYMvpkS7PUt0VMwXSZ
         e5XSn66WkNB61DPpfopb2CdbudmotuVSjMgLCZ9HLzyBfle/g8wVHkFb6vVdKHGxU98x
         ERB9qH3JhmhnmVa9UoKpHRJy9kBXipPPafiIFKo1iDMfxJJ4qzdJs3+sQoIIOlLjWDtk
         zABA==
X-Forwarded-Encrypted: i=1; AJvYcCW4U38Pnkk0ZC7lrQ7Lm80pmMFKYy6qfcOJO0YVCabSBZP0RLUwcbds0h1+oQ1bxKODSszSqx7hhO8EFSvi91yt@lists.infradead.org
X-Gm-Message-State: AOJu0YwTAkOIj5MXhExLxKkqbsntVDKMc+q1uImXDicWYPdiQPbrxpNc
	Ax1R0A05zx9lHsmcsJi3Uz7Vl0yb0W4+xb0NPM63YpS4kHQYAIw2mRaJB1lFcA==
X-Gm-Gg: ASbGncvYwJWtjq4ZRD9TRh5B0wK+SnKUt23lqeUu/Mx1i+3vAGOhPBldOFgeghdnfeX
	1ScxpCkkCna63IRPmi75TgVc7T5fNHLMq2toZM0g3Ml1hkrVgj6b5AN5HGyIHS99oJ2erdU336e
	c04g/Slc4g3gDJef3jl8PeD0IUnqBtghCXDscashXeVF+isTzsqlsH7Y7bEb3KxovRnwpE0W5bN
	mTuuIo3C2AmMGYRtCKy+YlpbsXZ6uVDLph5edw6W/0tFgHyo2bSLBfPMqJcvZepVFWHcfOq+T1T
	wLeHBN4TevrkomXbbET5pj75LcMyhL8QTfnJSf3c11+jnrl8uRz0ACDD8qhNgiiSuoYKw5Fgdtl
	OyjdtWznJ4fesLiQKdhR2cJQ4NFsgluE7bPtiPLT4K0G/xSJmLsSm7Vc5VTvsijSONgwnrx3PCA
	==
X-Google-Smtp-Source: AGHT+IFV/3JZpFtVZv9IijfdfagkrdK3hCy/JcOZd8MWso5BvseWKVtiecc8/LFjzi/kNn1nTtuUIw==
X-Received: by 2002:a05:6000:2486:b0:3e7:404f:685 with SMTP id ffacd0b85a97d-3e765a197ebmr8559306f8f.44.1757861765516;
        Sun, 14 Sep 2025 07:56:05 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037d62besm136303475e9.21.2025.09.14.07.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 07:56:05 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] phy: exynos5-usbdrd: support the exynos8890 USBDRD
Date: Sun, 14 Sep 2025 17:55:53 +0300
Message-ID: <20250914145555.2631595-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_075607_538110_C5E93C11 
X-CRM114-Status: GOOD (  11.51  )
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

Hey folks,

This patchset adds support for the usbdrd phy for exynos8890. The SoC
features 2 dwc3 controllers and 2 usb phy controllers. One of the USBs
is used for DRD, whereas the second - for host. The host one seems to
only be used on the MV8890 SBC, which... I don't think anyone has,
really.

Code from this patchset can and will be reused for 8895 (I actually based
it on my old 8895 work but decided to upstream it)

Best regards,
Ivaylo

Changes in v2:
- fix up the messed series (a patch from another subsystem was accidentally
  sent)

Ivaylo Ivanov (2):
  dt-bindings: phy: samsung,usb3-drd-phy: add exynos8890 support
  phy: exynos5-usbdrd: support the exynos8890 USBDRD controller

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  25 +++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 210 ++++++++++++++++++
 2 files changed, 235 insertions(+)

-- 
2.43.0


