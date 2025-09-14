Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A29DCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1lIRCb0Ss5Rfvrp/H0UgF1zFEFWzkJIihax3RDmNWDM=; b=3/SGSZX+/ZhqP+OlzAHyhYiNCe
	pQV2btnoCCxbJU8vJdmmQiNnKOF+fm+sI+DZglHHF6upA3hCgmGKrJ/70h+sPYwvJmZ6H9MloKkml
	n9OrTSaSpmlIe6Fmzn1RNZcYWQDGknRJX8YCqhYHQ9hsDlE6DjSCtq2L5Ff4ea/JrfUsho9umt2l5
	3hw4+rHiBGyAQuqNuEdtdax6sUlBPukCFYA9oOgqNDmb8vsoxO5oaQoHii1RlwR3fAK6Dn0TNn9rR
	f9+MRlTTXL5RZynr4t1Nn4H3sPqESXG8QILY0mozu/h3FRGIBQqlcT9Ei5hy2q7y1Xs8C7eUl0efI
	0u/RQeDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxoGS-00000001cyk-0lnP;
	Sun, 14 Sep 2025 15:03:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxoGQ-00000001cxc-0vHH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 15:03:39 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45dec026c78so33919595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 08:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757862216; x=1758467016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1lIRCb0Ss5Rfvrp/H0UgF1zFEFWzkJIihax3RDmNWDM=;
        b=WoYbvIv2cXoIKYEWKbEjNWesTTZe3N7AdJHG5aw+oxBvgSRnNV3YNGf/RlJQ0v3dqL
         dWjhp9aPZ8r12hs9K7OlKgR8Tjl5dflNWGEpL6m30aQzg+5dicYfbPnGTFHEfGauz64G
         +zq2928ER+4ZmlLjhh42c5tS0x9afG8RCbO0QJo0sDVCAG94i2RxIbXC9WMFuPom80W7
         E4pBmhlHtb0sulhu0SxjMkN46agZprM0s3GOmA7ov6id/oMTSMDF7I+Dr9b6JR1GMRnb
         vQGQEF08Xrc8TqfvidlU1dAnYZJUxKgUP6e53poOxPbX+clTNaR+kCwKYhiQPQDnEnte
         UYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757862216; x=1758467016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lIRCb0Ss5Rfvrp/H0UgF1zFEFWzkJIihax3RDmNWDM=;
        b=Gyj/kAC0IESJAUsNsyUqcu17g6jaTewBv9XlSOdijmrytuaJy5EfJBp/rIx+o9tbO9
         tXlOeOb75KiK6T633bWnpS3W0PLUaA8Wnl0IBck93Qb/DnWBfY1yRI+BVGfQUqQjYAS5
         Vhgwg8oCkyKKmyGyv5wCANk5DJwobVG9OlK5kwpX5ndhwkbE5bGUsXKq5wbUX+5n8Y6J
         m9dDSC0Mlx+SdbhiCZNNVoRwK4/wBl1ja2ta9XUpnNo0VSb0l94AojPuoUFyY1MMjpgL
         pjDpuwC6mNknLcFQqP9d/6Fw69TNLV+aMPtYIs1yg0TNiHkxC/NLCyay+j5XdSBYo6Zs
         gvUg==
X-Forwarded-Encrypted: i=1; AJvYcCXqToAnmmSP4Dlo4amREejSc9C3FBDypXLQblHiK+wRb4gl8a+rCTR2VUFRIl2LIA0F/4Rj3y2fKbpf1D9mqJt+@lists.infradead.org
X-Gm-Message-State: AOJu0YyaLpVK8H4ruk665nVAbVdWIXQhN/wZD1AxeHediqPEEih6jLet
	xE/PQ/IxR2OoQblsMWgerF/t0rQiQz0Uj3YtZG974SFth1ujv6p3HGJCBN/K+Q==
X-Gm-Gg: ASbGncsaQl+0ibs/WVlV1HKcmOTRPpXNVoeA2xGprhrGMsSXzHQTxNaGf360sf+lHmu
	0ziqZ+TTZcxpAUcDk02A8Bcfv3c28A1LfUbz/JZIJhQNfzOlgRwncQ0QbogVhDk4l5ea2If6+wP
	tzb3VTA5W1ZnGrKxqjsuUIizmS3XLe+W6c2gbuZU9rXzaT1uplKVoyZSVV2vf/gi7jla0BuEDwi
	lejQqZxQcumSt4Xu1VQWUVHbCJGcCNjjC/feyIrWVTwHT6yjr4VWejFwULehIMEpVXlnSeYWNan
	1p1ORCLahAiyAC3Ae/nvWrxo9AfEin50Cbm+fBE7ZvDWw3YSmzqrAKfxzg8mV/Z+bY1JI28RWHg
	0UpEoEYBhmXCfLvgtjJrCGIeMnBluzyhHRc8Hln5eF8Bf5Wjm0EXlHMtETCx4d3Pe6hkxT0dZ2D
	T0DAhMoJQ0
X-Google-Smtp-Source: AGHT+IGX+t8bHaJsVFUW55Nu1/GECO/8bMja6DNHy/GlXV5xfnZ/WFPTaKZBY0dv6uJ4UMHLFZgm8Q==
X-Received: by 2002:a05:600c:6d45:b0:45b:47e1:ef6a with SMTP id 5b1f17b1804b1-45f21208baemr59109745e9.37.1757862216245;
        Sun, 14 Sep 2025 08:03:36 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f2acbeee0sm32780385e9.0.2025.09.14.08.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 08:03:35 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] arm64: dts: exynos: add initial support for exynos8890
Date: Sun, 14 Sep 2025 18:03:18 +0300
Message-ID: <20250914150321.2632019-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_080338_279289_BB5B5272 
X-CRM114-Status: GOOD (  11.67  )
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

Before anything, this patchset depends on the following ones being merged,
either for dt-bindings for compatibles, and/or device drivers:
[1] https://lore.kernel.org/all/20250914112942.2604194-2-ivo.ivanov.ivanov1@gmail.com/
[2] https://lore.kernel.org/all/20250914114457.2610013-2-ivo.ivanov.ivanov1@gmail.com/
[3] https://lore.kernel.org/all/20250914122116.2616801-2-ivo.ivanov.ivanov1@gmail.com/
[4] https://lore.kernel.org/all/20250914124227.2619925-2-ivo.ivanov.ivanov1@gmail.com/
[11] https://lore.kernel.org/all/20250914134458.2624176-2-ivo.ivanov.ivanov1@gmail.com/
[13] https://lore.kernel.org/all/20250914145555.2631595-2-ivo.ivanov.ivanov1@gmail.com/
bindings only:
[5] https://lore.kernel.org/all/20250914131452.2622609-1-ivo.ivanov.ivanov1@gmail.com/
[6] https://lore.kernel.org/all/20250914131620.2622667-1-ivo.ivanov.ivanov1@gmail.com/
[7] https://lore.kernel.org/all/20250914131848.2622817-1-ivo.ivanov.ivanov1@gmail.com/
[8] https://lore.kernel.org/all/20250914132033.2622886-1-ivo.ivanov.ivanov1@gmail.com/
[9] https://lore.kernel.org/all/20250914132201.2622955-1-ivo.ivanov.ivanov1@gmail.com/
[10] https://lore.kernel.org/all/20250914132339.2623006-1-ivo.ivanov.ivanov1@gmail.com/
[12] https://lore.kernel.org/all/20250914135652.2626066-1-ivo.ivanov.ivanov1@gmail.com/

This patchset adds device trees for exynos8890 and Galaxy S7. The primary
method to boot mainline is via uniLoader (at github.com/ivoszbg/uniLoader),
however support for using Barebox as a bootloader after s-boot will be
available soon.

Best regards,
Ivaylo

Ivaylo Ivanov (3):
  dt-bindings: arm: samsung: document herolte board binding
  arm64: dts: exynos: add initial support for exynos8890 SoC
  arm64: dts: exynos: add initial support for Samsung Galaxy S7

 .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
 arch/arm64/boot/dts/exynos/Makefile           |    1 +
 .../boot/dts/exynos/exynos8890-herolte.dts    |  573 ++++++++++
 .../boot/dts/exynos/exynos8890-pinctrl.dtsi   |  703 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos8890.dtsi    | 1009 +++++++++++++++++
 5 files changed, 2292 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8890-herolte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8890-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8890.dtsi

-- 
2.43.0


