Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB3AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 19:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ROm2hqqBj4GdHIRS4cap5cywveSuJBdWyJrDf52474Y=; b=NTcBxzUpwg8N/f
	o8d7HBm5emADKPEIxFXNKwKgL6WKk+U0I59uqp5c8SsKzBsRiUPLtSmpZZKEnL3VZ6T+YYb+U5F+y
	pj2+SuXhLOZi3hme1XutxpqW9BL24e6iO9Q2joYqIKwwBd7NXqc5LSSxNWfeKbc1z/+WHp/gQcoyy
	1qUdG+qA1RWf3L5m5fnIpbl6np7XjEVx4HEk92lTW6fxl9uzp46WbuuIpUsXPofJ8BIkjnO/tkVBT
	tayHfJLQIBevj/bhd+rnZcybkIaxk48kFUaHhpQu6ejfnO9ozUhFUC4KwNMjCSIJQBie8blB+W/4g
	9LdOEfDKJ1OvGafNBYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvf3-0000000DKr3-2gdH;
	Sun, 28 Jun 2026 19:59:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvf0-0000000DKqT-381X
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 19:59:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493a54b80a5so12089815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 12:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676760; x=1783281560; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ROm2hqqBj4GdHIRS4cap5cywveSuJBdWyJrDf52474Y=;
        b=lI8flLhLoLXNllyZL3MyNc4GEYCpWQidFV1x/jhabx9MhWK6EB5O6rMdixRxKz/qQT
         Z9nCvmLGPj+qbmV6mRPSl133EEqBABKdzMqEwBP3b8hK9Ik1yp19aQlktaAMz8Mg7JjS
         /juDoTqsTZZBANWcvRYDnvGQn13y9CfWUAVTf7Z2cqslk2Elli2pi5xgNzQ4PJ2pOHas
         tE4GUBwNUB+mwpjFqi8k8svOTNaMOOzTlo3WCCrjnhpT0hyQnrEPrkxSwMF1dIVVkn9F
         TzWnF9rrjagaF6ZC2PLD0OieZpzAz0XNt5dIu9hPwcfkuN4JT1158ELgc/69OLrnjMSf
         oKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676760; x=1783281560;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROm2hqqBj4GdHIRS4cap5cywveSuJBdWyJrDf52474Y=;
        b=LR9gUL27lCZGBrlfzsjsJk9iVToc+g6Q1Ju08Zugvu24jgeqd4vmYOOiAV3+Bcm/su
         93O/KfH37cbJ1KQq08uNRnPffPUOvqgAQQ+69P+eFwE2GEdWzMsfxza5Yd4p6wxVPi0m
         Hc9V6y6MW98ebTwpSjyMuwGVkekpHtHGxwRZ1FOzQ/hkK+LKg358Uxfu7ACr34HmeXgJ
         adm/BROY2zhWqCcdqi7SGm32ACVrJew//OVUDX8ZZgGazaTclHc4uTY0F14dgnatIW2R
         3wQTx9RZRIazvuNlYb+RzKrIJdTFsDvcZaisM2HbdRsrHF96rxOx/7P9Qe1hYrhHAn9D
         pPqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hU3hQwW61Y1p7QyDESlUr16We98iELJpgCs56oktlrVxs5yePkF5CWxuTzkX5Fe4qts81i20awJclmoMmFUAw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0oZY6xdNq7+HG9Xx5UuOF2SbEl+CZXX3bT33dOWAYK6awBJ2R
	W2+QGQuhGrGXdp1az3okfa6le8HoEuWGya0cYcv6ufxSXLA0rltcVmMT
X-Gm-Gg: AfdE7ckSxJS0wzSukUsrUb04jDOaU6gWhKzW3PBueVfCah/Tc+qA0jp4+07OBFnJNk4
	tFK6vovLswIBC4uDrmbJqMD1Ac0na2ITdwogu5cG4SoTTEqqj7MNlRdyGVv9JU2dzYvGnZk4Lyn
	pPBYYZ1xUDwfXlFNWM84XOnWTU/rKOmZ5/xlblyLIOYPCPi4zy+TMYx84XH2Md7J7BiYJJVz3yO
	yidHX7B++o6b2tVNHiUhYQpmHpGX4InSEFUv18937jBzTwSpM/zKd3BFRS6YGbwm16lXCcasekd
	Vsy8yRFRSYcsJsHtitBSAAvpsjzgihpQiZdUmL880Nb2bpzlo55tGAnsoBD4Tt7GkX+ldHxXK7k
	5vJ4zxAhRumiHPsDi1nKGlXKiqJK+PZeM9YdL98r7V8UEhhzjIVGTa3kXNaCYt6k1eb2yHrt8Qr
	QGpWoVCkdV8E0HgmCYK9hOgDrxQy2NnflN1g==
X-Received: by 2002:a05:600c:8718:b0:493:a8ff:d7af with SMTP id 5b1f17b1804b1-493a8ffda72mr43293915e9.4.1782676760055;
        Sun, 28 Jun 2026 12:59:20 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ae96c85fsm15133505e9.5.2026.06.28.12.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:59:19 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH RFC v5 00/12] ZTE zx297520v3 clock bindings and driver
Date: Sun, 28 Jun 2026 22:58:55 +0300
Message-Id: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XOS07DMBCA4atEXmNkjx/JdIWExAHYIhZ+jFurT
 QNJiApV7o4JSInKcmx/v+fKBuozDWxXXVlPUx5ydy6DuatYOLjznniOZWYgwAojBf+6AIbTkQP
 pqJCUhCaw8vqtp5QvS+mFPT89stffw57eP0p1/LvxbiAeurbN464KkoIHhckpbawBdArAGGUwh
 brxFsljbHS9tA55GLv+c9l0kkvs31KT5IKT9C6klAht/bBvXT7dlw+XxgRbJ1cHxQEmQTEoIZK
 5dWrjAFenigt1IqPJqaZJt06vzkq7Ov3jHKL2EYAwbt08z98K38fElwEAAA==
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4364;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=Fv1CihNl9nmAyXfMSXLSZWM2RerBZiZvUFY655DxTaA=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqQX0LRjTo6T3x3wVeb3a8ft8qqPCkjlBZn8emn
 HcKM3ftiPKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakF9CxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI2vBAAgTDypEPB6CLnSUXtURRjTeqZln9elDM
 4O2OfUxAWlPB95gweEa9sf4WmLFSinn7RWVGUEXmDKzDHhwqxM4rMArAMZAAVrnnziYUdLm82ie
 bxDgqkdLmokL1gH5wJ5JNPC+Gt6vgjGcxuf6jIzPJxA9+F+H8W/ar3aBr92yY+pOuLWvJQ3gpEz
 ylsSwIXonEXdStYdVVuXVV1VlK1DfW+I9ENZWgBpK55nfCxGo7tIpcqjHlQx5hqSDe/Cq9+Uckq
 0tbC1+gxwXiv6cRf/P6SDEqCyBaS3Dh2BQ5aqh5MA5KBgFKVRuZ9o+0AQxsq5VgMBtfOY3EH/I8
 yskxVynm10iJtDuN4z7efn9vWTbWAdFYc4Kn7hqMcq1HnEy/ADvMH2rup3qD9VmiX2WeQzeiTR3
 +gfSFW3q7bBn9W0+ZdkXUpnHruhkppiVcehXu0zwxU31Bqo5T4nGR8mCSopX28vEpNM3D1d/Bvl
 euaIpBWE3NfN1C7x93BoHmEwix9mv88JbTmSnlnD6Hbuzfd7+TBHFt8191MUn0xjGQ4dZENlh4y
 rmS+1J8YGTIDFD9Zet1MkcDHYrizJPf5s91y0FEZqsXrAh2CPirEWnEHb40gW1ofTqWh2h65AuI
 ZYQakUvg7u0d2nVkRljhPVx+l1mkoBiF8/8Md5s/g7KE0BOcoUZ0=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_125922_814410_12AE1B4C 
X-CRM114-Status: GOOD (  15.27  )
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

I am sending version 5 of my zx297520v3 clock patch. The major change is 
using regmaps rather than raw mmio to access the clocks and moving reset 
handling into its own mfd/aux bus driver.

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. Afaiu adding 
clocks is not an issue, but removing or reordering them is an ABI break.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v5:
*) Use MFD instead of aux bus for top and matrix clocks
*) Move top and matrix bindings to soc/zte
*) Give USB PHY its own resets
*) Other localized changes are noted in the individual patches
- Link to v4: https://lore.kernel.org/r/20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com

Changes in v4:
*) Use syscon and regmap instead of raw IO
*) Move reset to its own driver on the aux bus, but keep reset and clk 
in the same binding as it matches the way the hardware works
*) Go back to having matrixclk in its own device because syscon deals 
poorly with multi io reg devices. List all PLL outputs from topclk as 
inputs to matrixclk
*) Some more hardware research: Figure out the parents of the 4 possible
GPIO clock outputs and declare them in the driver. They are unused on 
the hardware I have, but they show that all PLLs can be used.

- Link to v3: https://lore.kernel.org/r/20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com

Changes in v3:
Model top and matrix clocks as one device
Add PLL driver
Fixed a few issues found by Sashiko: register lock, some missing devm_, 
error handling

v2: Fix build issues introduced by checkpatch.pl fixes that I didn't 
spot earlier.

---
Stefan Dösinger (12):
      dt-bindings: soc: zte: Add zx297520v3 top clock and reset bindings
      dt-bindings: soc: zte: Add zx297520v3 matrix clock and reset bindings
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset bindings
      mfd: zx297520v3: Add a clock and reset MFD driver.
      clk: zte: Add Clock registration infrastructure.
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Add regmap based clocks
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks and resets
      reset: zte: Add a zx297520v3 reset driver
      ARM: dts: zte: Declare zx297520v3 CRM device nodes

 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      |  96 +++
 .../bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml | 177 +++++
 .../bindings/soc/zte/zte,zx297520v3-topcrm.yaml    |  85 +++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |  97 ++-
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/zte/Kconfig                            |  28 +
 drivers/clk/zte/Makefile                           |   6 +
 drivers/clk/zte/clk-regmap.c                       | 245 ++++++
 drivers/clk/zte/clk-zx.c                           | 192 +++++
 drivers/clk/zte/clk-zx.h                           |  81 ++
 drivers/clk/zte/clk-zx297520v3.c                   | 848 +++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                           | 485 ++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-zte-zx297520v3.c               | 274 +++++++
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/zte/Kconfig                            |  20 +
 drivers/soc/zte/Makefile                           |   3 +
 drivers/soc/zte/zx297520v3-crm.c                   |  76 ++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 171 +++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  61 ++
 24 files changed, 2960 insertions(+), 8 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>


