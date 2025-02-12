Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646F8C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 00:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wr7k0IHaHpwdUMHUz8Ci6MZfiR8HqsaiWGJUMuypOjo=; b=el7jNs/9LJKf0wmdTHYm9bfmPG
	Z3sfbC97b/cJuBOlbIDTHeFvZkJVlTpCKFpUstC+5IshQV/0eRCcYN0yMiKJqJXOau8AuY/Fib9gu
	JWBX5gouesCNs6ICW1x7OBqPZEYnxPMMBRmMC62hkBpRfHzlK92LGbHPrFGErzmLBm/q81RhHnCJn
	NjoG3pmHkGKLNCRwOZ6XA7NKCkU4EQE6N4gVVDswiYgwSv+PH3LlaDOOn4LXm6gr7fZ5R8ho1qlI+
	VLP4iwlP8oJgkr+29suX2mNSyexmrEfM9feo6FNUZfBdXT3BS7VHzYTKdaHLruNeUUrHeJ7/sM98O
	H2TA/M/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0yC-00000005l7n-0cgm;
	Wed, 12 Feb 2025 00:51:16 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0vi-00000005kVV-0JR3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 00:48:43 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-86718c2c3b9so837190241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 16:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739321320; x=1739926120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wr7k0IHaHpwdUMHUz8Ci6MZfiR8HqsaiWGJUMuypOjo=;
        b=jiNIhxkyiGvRgTnkV1mQonJ+i6/O+Zw9/E6U5K+XuTnE/P9pEPhEVzIxTnEJkKzYts
         Cxo6cZBCox7d761DM9Um4udefjHmTZ1Vq9y9f1JzhQ30uh3c0iesg9/t3TyMJ6AhDZPK
         T2xOkylB9hrIvZgOFqyR68f+n22g6hBlNeaiqnycEP4rFafFnCzhHb1XuI/7DEhfotC7
         bOm6wYRkREvBUfSjZtGWumbWZiJ3v7Iv/vFh+xOuHUXIks2Pe6Pz0vJz4rTcU1C0tC6C
         vDcfIMk+08DriQNGnKtiAlyCjj1DUDrStIWh2w78FGkvPzVWzEntOV82dnm8e5Xf1jAr
         KmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739321320; x=1739926120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wr7k0IHaHpwdUMHUz8Ci6MZfiR8HqsaiWGJUMuypOjo=;
        b=t4snh5ZQoEg65/pv7B1W6fyCOjt36qxuODamNH34dVGxYY8KERiWERQU1D2bzFSH6b
         Ioil6HFNFtxjG0vggrJlnfqCZRS1Iq3DEEQn/qmDdpqIc7Y7rh/CYKTRVatRMVOvAHFB
         HKVD/Q09ZURrd3fQImplb0jIvpw1S6yJVtlSnVkVHOYBsrHCh/5/ubLfLB/daT92vQ1V
         3uv/YGrSsNn57+YlDiPpSvquRDPjKTrwBPQ7Wh5TROulMFDuhmaA7Po1cUuedl/t3xFf
         JSo6IMjcJ0heIl6O6hhq/t7wNQirsf57Hj1ElNW2H7YTOl+YQuzCF/6lW4IyMVy6sDKa
         XUmg==
X-Forwarded-Encrypted: i=1; AJvYcCVw8p7I3xMmpN/1HUuJq59NbKyLRDjF6dhThIGxw/j0McFjtnraM1rHVhInHnbwayhbG/NUTBoZCzrbEqVGCRsn@lists.infradead.org
X-Gm-Message-State: AOJu0YxUqKVxIYmkprmtUufZHcm2i9HOcMaObhp3nm46jIv2Uu22H2E1
	3U0HZ2nZzyWfyz3F+V/yUZKnjnJMnCmW7zr01f8xOcGv548yRVxg
X-Gm-Gg: ASbGncvcJR61qkH2R5hy1oQuoGmf/IUroZKvcKFBdyuw8tsgSirm4hT1xHKIcgk4mmJ
	X81c3qfXwML1/y6usn9/pYQsa88zau+lCEvU5s7pWVwsaRDNQR3uBtkf18Ake+3IzlzekMEzqBY
	JEDIWbUeF5SU1sgAX748IuFwCXniCHpKnyqwsSv8O5rPyAMEYwQT5lTMzWKUoJD3DhWX5RK1rTQ
	sDE/LsQr1AszHNkhfuhmKvrCG4Uz7xHYss0G7sURdIPdIRht0x6w6KRifWczFe2VHovxqfdlpDU
	euNmXWmdePI8j/w+Qk6B2R9y9Bg59YeCCh8xLVabVaOwUa2TQ1o/uUoSP0/3gVW1UauvaJ9y0Vs
	QPw==
X-Google-Smtp-Source: AGHT+IF8umUXWJxzA7jwMoQFHJEnI99UvjDxrLCD+9RYrpwz/h5a76AK44gMco+fgsKHyYP6Hw7zgg==
X-Received: by 2002:a05:6102:3f46:b0:4b6:5e0f:6ddc with SMTP id ada2fe7eead31-4bbf556ea52mr389873137.14.1739321320485;
        Tue, 11 Feb 2025 16:48:40 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbce4c6fcfsm823832137.23.2025.02.11.16.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:48:39 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	igor.belwon@mentallysanemainliners.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 0/4] Add PERIC0/1 support for Exynos 990 and hsi2c compatible
Date: Wed, 12 Feb 2025 00:48:20 +0000
Message-Id: <20250212004824.1011-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_164842_112513_B41A3C31 
X-CRM114-Status: GOOD (  10.63  )
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

This patch series enables the PERIC0/1 (Peripheral Connectivity)
and compatible hsi2 for Exynos990:

- PERIC0/1 feeds HSI2C, SPI and UART

This part tests one by one to see which clock hangs without
the CLK_IGNORE_UNUSED flag.

Changes v2:
 - Remove other unnecessary patches which is nothing related
   to linux shipping style.

Denzeel Oliva (4):
  dt-bindings: clock: samsung,exynos990-clock: add PERIC0/1 clock
    management unit
  dt-bindings: i2c: exynos5: add samsung,exynos990-hsi2c compatible
  clk: samsung: exynos990: add support for CMU_PERIC0/1
  arm64: dts: exyno990: enable cmu-peric0/1 clock controller

 .../clock/samsung,exynos990-clock.yaml        |   24 +
 .../devicetree/bindings/i2c/i2c-exynos5.yaml  |    1 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi     |   22 +
 drivers/clk/samsung/clk-exynos990.c           | 1148 +++++++++++++++++
 include/dt-bindings/clock/samsung,exynos990.h |  176 +++
 5 files changed, 1371 insertions(+)

-- 
2.48.1


