Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FADCAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 11:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zl9epDnVBDf5FGwQnol7WPxPj6t42uf2hUNcw7PBwX4=; b=HYl/xO6r+Gn6QGXESdkldg8IUz
	iY9K4L0XZcaj8wzuS7cRNjet5DxGSywjdDB4O3qKXIP748DG7AoP0I6fwi9H4KLSzziCenUXE35Ti
	Kb5cTj6BLP6gWGisCxcixaau1Mzwwrstjw3j8m6xd1embBGvNqHLfiaI4gL3yW95IYifUo0RZlsYH
	0Q9xBag46PYqiO2vw/MX1aQUpwdcRHR3CzgcQvyumvp2XGCzY/IERAJnCwlwu4FmL5euOTJ0y87Ut
	ebEgKB4Ybi0wWgQUK9Mb4aP/BdE17DsbtsfgS8ROUtWUaouZYSPPjYG0yc6NsUJDcbdy8gwPWyddY
	5KNK2o3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlAI-00000000znQ-0V7g;
	Sun, 14 Sep 2025 11:45:06 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlAF-00000000zmO-1YfJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 11:45:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3e7428c4cbdso2217803f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757850301; x=1758455101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zl9epDnVBDf5FGwQnol7WPxPj6t42uf2hUNcw7PBwX4=;
        b=TlsEOU+hpbyg1Mc7YKeqA0lbIazUJwGsKYBAdv7NZLHWpgp/V99f6QctDL1Hy2YqT/
         vG0LXEXIAgC31TTleZncJKsoEfanFgTdTOVG1oP2FaXM0HAEtLDFevmCSPlKkfy0JMzr
         1X21I7+LGhED1ddbZ0Afz9a6pIaOm1xuOa4wbnsmhiwG7DK+0y9oeipkno5GHNPM/YLC
         heE6DltVrJ0eVmX1wEQovdf/Ib7mS+tkjxQPVNWOy2miV/AAr02itPrZfKcPzTk1lY32
         V8PtaSdfjjEkmVSTu13G738Ov9uZ7g1uduv8l4AHdBu6EhhUChOngvttoRBND067tLK8
         MlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850301; x=1758455101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zl9epDnVBDf5FGwQnol7WPxPj6t42uf2hUNcw7PBwX4=;
        b=uTNib05JaoxT0jg9H1ykacwyj7U3TGmREjOp3lFqYX4SXUqFzf33v/wayRjnCHZfWX
         xLe94rZ4M58pcV4hCXicSeSRErrY+vvcKM8O4UybXtoMB10UR5i4A14hyc2vbCqcF21g
         StJckblLjKbOQ3pHItGWTfBAbAg9wxIvVjckTL77rADCM9E7yhJ2mNykEaHrNN5jQMn1
         A53J1EFYhZ3V2AOlnco7k32MzOI3i6xeEmFM0LidXJxzFqjsW9Zz+TX+6+gzAaBuWPwj
         UYOUIXKATcsl7vH9/8y8lDXfTvmUxt+WQKS9frnSQlUNKQRE9Hhp1O2MuTX2RlS9llL1
         KxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/iUaB229OWInpexI3sW/ZuWozch5HDDiWW8YQC3nYihwfMVXfDnJjCqdiKa0/X33RNWCa57b6n2D3ABUw+DcL@lists.infradead.org
X-Gm-Message-State: AOJu0YwoAH0mr3uLGL3UGODEiFS3O/sOlcppz/5vXdjertcO5Vgu+ryb
	ma3Hbq/L8uk+3PtmcvshG7pJpyezZ+13WwOf0z3MkQehNjKVG6JPEP6B
X-Gm-Gg: ASbGnctMce8padTOBeccmtYuKuoWp28oinuzofjR8c1IFfR6mjkJGy3gjEBIo6NRaUw
	GlAvPtcjI4/lw/wuXGeyWBm2INBqGtMFZbCgXMNOrl1PSPbGHzEml6msxbDGP5T+N7oNaPOeyRL
	6Fbeb+LFqE77uxkr78MDYLBJhNA2cwAe/4KnRxRDRhuX3PuY22/zRFulIbijloUDesXsOHCx1ds
	izwfmijaRUdSSJFKT/zQZX2AQ/DdBwA7J7rocf/m0jKs22I9YwuraCvt3j5mCEWQYwzVDOhL2nY
	ixWZjN85RJDcLVm+Z/xFc2onJRPcx5y0+ug/Lo+pVFON5vMfHaHWFTXSIrbwkT2aQsRmhRg6IWh
	Cbv5LCC6SCNVmz8tSRo/IhSc8IJy7XK3DrV8P5LmVa604X1/tqR0QcQxJRU8D+E/C0mp07MpZqt
	sOZ2z11mjP
X-Google-Smtp-Source: AGHT+IEKZoR43PuG4u0ovxcf8LSqoSkXytpnNXieBus8x9zq/gDUlem4pul2S/1lpLAukbDJ5yAyag==
X-Received: by 2002:a5d:5f53:0:b0:3e2:a287:2cf2 with SMTP id ffacd0b85a97d-3e765a0915amr6836384f8f.23.1757850301352;
        Sun, 14 Sep 2025 04:45:01 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea21a6e4basm1503252f8f.11.2025.09.14.04.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:45:00 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] pinctrl: samsung: add exynos8890 SoC pinctrl
Date: Sun, 14 Sep 2025 14:44:54 +0300
Message-ID: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_044503_422119_BB3F8EF9 
X-CRM114-Status: UNSURE (   9.76  )
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

Hey folks,

This patchset adds pinctrl support for the exynos8890 SoC.

Best regards,
Ivaylo

Ivaylo Ivanov (3):
  dt-bindings: pinctrl: samsung: add exynos8890 compatible
  dt-bindings: pinctrl: samsung: add exynos8890-wakeup-eint compatible
  pinctrl: samsung: add exynos8890 SoC pinctrl configuration

 .../samsung,pinctrl-wakeup-interrupt.yaml     |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |   5 +-
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 157 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 5 files changed, 165 insertions(+), 1 deletion(-)

-- 
2.43.0


