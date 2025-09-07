Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649E9CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 22:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Im1JmmLYtcCw8AcGDb4EvZIp3UT3ZDSThZ6eBWeytEc=; b=OOhHdMIPHCVaXx
	z5wV2znZPW/v27Ekb/2ylrqAEeFO48/QIIyT5MA2NwnvSZWA+x0MPyYwtBgyV/vXsl2nB9GRf5xH8
	SgaqxZneZenYKahgG6bS5S79FaLeLB42YC5Wq5OcN3cSqlYew/SgQlqMVwbkhx6AveDi/oEUccJFP
	6v3G/mN2PDxAvyne2jiDSpP3JVPyY4K4V3Hll+fiEDrfXjaZCOwhYvHQPpkeArQhEsQwuwJHlWqZy
	N5V/0dyMh+YpR0RUSIryLz3nKf/PLH8Jv7exO8un5tUQn+9wXmdHBcWYI8c8ZiGjchk92EYKG1gQ9
	Y7ELOhDrzIfIHa00/42A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNgT-0000000D6Of-249J;
	Sun, 07 Sep 2025 22:16:29 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNdf-0000000D5e5-0E78
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 22:13:36 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7e8704e9687so432948385a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 15:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757283214; x=1757888014; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Im1JmmLYtcCw8AcGDb4EvZIp3UT3ZDSThZ6eBWeytEc=;
        b=IXXy02R69hO+BH2JhM389TgWZ4GmJL854pOPGo0ueErQzs/j3sa2b8rEHIn5iT1sVn
         mDf+Tqveo/p2vLqtbvJsysYlNjb4Q1G59ecPQ8Fo8VPSF+tXOsqTbcbHSNZt9k2rTLyR
         heIwMsNO5cfxiayQZpErS5PIe/P9zkBgW+l093Lp7o6SoDDLO3S0YFL2aFd9IWL0cjuF
         +88zmMz/+rJbbfqC9elpO91hSvMFTX01jsUhdXOYbH4m4zB51tir06Kn8J8flpaaYbe/
         4yOyN1cZrJiu4IL/NaVukZqndYFVSV1bQlvjP09tFWjTfqLpaqZd9kjFEWuUT+RBhMOS
         hKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757283214; x=1757888014;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Im1JmmLYtcCw8AcGDb4EvZIp3UT3ZDSThZ6eBWeytEc=;
        b=Q0MEsU13YKHnOue4tinQ4z+LNsykltAjtqB6HcwX5yKUTDOCGVnsfJVCwa4JrB4Rs/
         e/UwqIqIqP0wA1pllLP7TxR0b2Hkrpw8LspAmn30klrFh36LiZWSgrl5ehxtFenqw5Yf
         Im1uPzR0HfbU9qhJJi8niOk6Qm/gGJWFBEsc9ikkFsR1rYetdFDXpa+GZi8YY1cSWkPu
         hisKs7tCJGhxcjIbbZDNpxKXKTiA1+x5gO42ibwjMC5RWcg52qdLEDdzjlK99EUu8p/+
         tc375v7DSzOjTyRKjV3EsVLx1rSXBVnt9bFJzj6A9S8+Nw/RSTOhHBpxDp2f9CrMNXOJ
         mTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHnS+bDpKQfnT2nnFp5UWcEaaMqcFcIZmnfhBuyckjDNQ91aHlwua/ZDPfKY8s28MIGtTpx0Qq2ni6cBqggqmC@lists.infradead.org
X-Gm-Message-State: AOJu0YzyFIY5n4zn2Z9/2Mr5igsOWlgnSfij4lVZl2dqBk+idJ472Voc
	WqAF5eN8Gu/mXNLNM1uG3Xq1G2fgz+ocRBBMyabx29CSRB5xzecJOtqm
X-Gm-Gg: ASbGncuU8RJnkzFzFrJcpTl9KUgJmnprF7kfx4FGcuB2m3/7Z1CXKBOmYOZVeqEOGSW
	zKGTIQyz4mP/gbgX/0abFFvX3Za3jPXxIoKJwnGTGGPIBNroEze5QbEBRLIoaDzbIlqhkKIQcJg
	SG332zmeLGv6tVe9YZt99g0tJibhJSJHX2OidLsS9bVK7isOwKCzivqnN5gkAntR80fOJXsY3Wz
	F8dScrMZu5YwlEkexRRAsTnd3XYgTRl3/eZ2IOZzFYkiPcCB2CcjutMwotZMBQgzdhWsExKDlnJ
	nj3BAsYMukQ0Zol4YgZ7oWLUm0KwqG1Jz3LEVssYvrKIuTYXbz+mIHQRsQArAiJlsjN+IBpL+nt
	j+UwM8IoQvFm8gjr7hKnUJ2Dw4kKs8l1yCafvaApXww==
X-Google-Smtp-Source: AGHT+IEiM7eS5nfrbME2jcoMbIuxMdQDQ+5QJZ8z8QZo15S2tz80rEoTS3DMD/i+1xW2u3NOJaleig==
X-Received: by 2002:a05:620a:4115:b0:80a:beb4:7761 with SMTP id af79cd13be357-813c3d781c4mr592039185a.76.1757283213734;
        Sun, 07 Sep 2025 15:13:33 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4914csm930935285a.16.2025.09.07.15.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 15:13:33 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 0/8] arm64: dts: exynos990: Add PERIC0/1 USI, UART and
 HSI2C support
Date: Sun, 07 Sep 2025 22:13:31 +0000
Message-Id: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIsDvmgC/32NQQ6CMBBFr0Jm7ZhpBQmuuIdh0dABJhFKOko0p
 He3cgCX7+f/93dQjsIKt2KHyJuohCWDPRXQT24ZGcVnBku2ooZqXHO/V3Te40tlCZ4VK2ZbNSW
 Vhi+Ql2vkQd6H9d5lnkSfIX6Ok8380v++zSCh4/pKVDbG1UM7zk4e5z7M0KWUvlc9Lhi2AAAA
X-Change-ID: 20250907-perics-add-usinodes-5ee2594041e3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757283213; l=1553;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=tLVqjY14UAePc4noRTuUWPb5LwslyhZKVli64rzmXlg=;
 b=NAGmpZhkTIQxAL8Qd0JITLUSY9I0k45wB3RHfLZGE4xYSnldnuff8aEV24yJVwPolIBVU3Uu0
 PheQBaWeS1qCAI1+T4FBvM/Z3Gcy/8G+pr1hUabWIl/xf7WE6AGAbLj
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_151335_102177_6E8161EC 
X-CRM114-Status: UNSURE (   9.51  )
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

Hi,

This series adds device tree support for PERIC0/1 blocks:

- Add sysreg nodes required for peripheral configuration
- Add USI, UART and HSI2C controller nodes
- Update bindings with Exynos990 compatibles

These changes enable serial communication interfaces
(I2C, UART) for Exynos990 SoC.

Changes in v2:
- Remove unnecessary blank lines in HSI2C nodes.

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (8):
      dt-bindings: soc: samsung: exynos-sysreg: Add Exynos990 PERIC0/1 compatibles
      arm64: dts: exynos990: Add sysreg nodes for PERIC0 and PERIC1
      dt-bindings: soc: samsung: Add Exynos990 USI compatible
      arm64: dts: exynos990: Add USI nodes for PERIC0 and PERIC1
      dt-bindings: serial: samsung: Add Exynos990 UART compatible
      arm64: dts: exynos990: Add UART nodes for PERIC0/1
      dt-bindings: i2c: exynos5: Add exynos990-hsi2c compatible
      arm64: dts: exynos990: Add HSI2C nodes for PERIC0/1

 .../devicetree/bindings/i2c/i2c-exynos5.yaml       |    1 +
 .../devicetree/bindings/serial/samsung_uart.yaml   |    1 +
 .../bindings/soc/samsung/exynos-usi.yaml           |    1 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |    4 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          | 1419 ++++++++++++++++++++
 5 files changed, 1426 insertions(+)
---
base-commit: 98ee0e036cfedf543c4728a604fd7870d0000efd
change-id: 20250907-perics-add-usinodes-5ee2594041e3

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>


