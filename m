Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4AACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qCX9OHIqw+xdYsktQQqiE2IMYgIse2ihYLYopEmEHJc=; b=1dftm7s+T3EnUu
	MWwyW1w9e+vR95CY5G/IfAGnjyczVDbmV47hQ7ETW2jBnJRGjXqKpQuuMTluo2OXhaHWm/6jXWlA9
	/AwVUsMC41u6KpY719MjM1IChvtToawlNVHTLrnghnSzfjSAbY5t4ks8AYxweNC26AklHo27FosnZ
	G2zxzFPPMGCGcTjU7BY3aotapj6iNQk1DcyrYPeDgXvsbbKLekEvPGZPGJrEGmEUC4bXktpthoRUk
	kGNaa8g8ue2e1WOKFb0w8VWxaiKlzIduPXeUjf3YggKvlSTOe5rM4IlDqtv82IsI4Az92VoPRTNTv
	nV9yf0yPY49azsIZYfKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIRN-0000000G1iC-3iox;
	Wed, 27 Aug 2025 15:52:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFTm-0000000FSHr-0S7X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 12:42:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso36622695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 05:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756298536; x=1756903336; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qCX9OHIqw+xdYsktQQqiE2IMYgIse2ihYLYopEmEHJc=;
        b=i4w4qfLEVCs5mZcAEkOCwoj/WxVmMjPCNDbw2N+T3Rzpg31zB6GyrrTS/4IXEvl50e
         Fy7YFnDg84PntXxEiA0QW3wE/iYMISkivOFV2bCRzIV5EfGe/xuKQPD5ZwqS8YkAMLZr
         aXY3CoVLnvaFlexJPw8cWOzdEh7DNvGrlI9Hfs1PEbpmqPQo/5boaW9rdY98bFbiediS
         nYjijOxIViZ4VeoWCvE8iJQzT3cuUNGMMw4X9K8mxkUS7CWSWPV+KNkVJi4FtPpJjwCe
         N7728D1GD8NMha2vMucIRnQIuGGzfb71rmKE0W0ygJTvU2B37Ogh81wuuAx//ZMn6xSU
         /JMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756298536; x=1756903336;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCX9OHIqw+xdYsktQQqiE2IMYgIse2ihYLYopEmEHJc=;
        b=tPpQUlNhfXOJoW5daVsMPBjRrqRWP4fQQhODfGtnXb12+JFl+qNUOPA7YY0s3dAAtG
         WzOEeiNH9guLca1mlbm50E2ljilmvcMQzHVzor/k8MyztYr6Qc4Crut40K+tAOuSwAov
         pyNDuzCgJiK7xwCCUjIClY0ukyla+Hi2+RFgj6Pda3ZyPkGNhQ6RI63kg6TzcnKfBCUz
         z7fdJJDxLGmvpOtW+j6vb4yrYgbmrZzWb8+VgdxRgI1fsqIEZLyD40+Mhbc3i7e927oe
         lsSuQrDN6vF7mXLUVB9HyMcMYHPWq8+oLWUiZyYz8DUBDWz+LHQRFwFsbZYudM4bx8VT
         cq5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHvgOLrafQ3rUrbYXEeK5UCmxdt2d01XYUHYhSIK21aZosDhLJojwWcdx3zoo+TKpNiQ4XUfV5rdLDxm+pGl2q@lists.infradead.org
X-Gm-Message-State: AOJu0Yy83EKVFRF4Ch+Y59l+R1YCvcR7OnRpAsHoFQIsxfLZhhvGqoe9
	4yPm/yqmxMfFngD3FcAs1Veqcpf6HnBDKO1EiPhJQWfedgGg1Mqu4uwwTQhwxlEyKZI=
X-Gm-Gg: ASbGncuVHVeHwroTNfE4nEKxpR79DuDtqMHzsx3FF0Tr764KfU6D9HFfKb3kN8knmM5
	9+CZF0laE/3Z1V4jG2WiNB8WKKN5UmStharRaLr9lv8+1JygELvWbmDQ1HlPORAH6ESi8edfuYN
	Rl8aKBdxAehkkbOU8yzYGlB7pzcntWmS4PFNEx2uWCQWt4DrJmgEXyjSP4YmNFCzyQTTnctyjph
	tC6qt5dwkuXBPgcps3VBLIZ1QQsebU6Nwm8UtaY6czszIH3dwJC8em1DBYXWa6C2CkIOb66tw8A
	bcfqTnTQrXajsoCqxUGySoTcWADroaKhYOu4Js5N5Stmih4Jnmqy926Am3PsL6UengWBZYVeW5P
	FXx1EmvbkBtvuBbCYpXWG7JCg/F4pzfi1PSUSLEjjE8ciazn8T7jdDbbBoB5BNgjoBE0l0POJjZ
	8z4A==
X-Google-Smtp-Source: AGHT+IHt37j6LI8uNP0iBAJah2pqyimZMIMU1zgKSqocNIoMlPlz3HIKdSdVZSOFodLiybkW1k8Tbw==
X-Received: by 2002:a5d:5885:0:b0:3ca:43ce:8a72 with SMTP id ffacd0b85a97d-3ca43ce8f6amr6069633f8f.1.1756298535966;
        Wed, 27 Aug 2025 05:42:15 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cbab3ead0dsm6439420f8f.29.2025.08.27.05.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:42:15 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/5] exynos-acpm: add DVFS protocol and clock driver
Date: Wed, 27 Aug 2025 12:42:10 +0000
Message-Id: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACL9rmgC/23MQQ7CIBCF4as0sxYDWAt15T1MFxTGdmKFBgzRN
 Nxd7Nrl//LybZAwEia4NBtEzJQo+Bry0ICdjZ+QkasNkssz16Jnxq5PZpcHk9pJozTyE1dQ72v
 EO7136jbUnim9Qvzscha/9Q+SBeOsG0fXq1a1nRLXhbyJ4RjiBEMp5Qs65JL7oQAAAA==
X-Change-ID: 20250819-acpm-clk-28d2a78e0307
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756298535; l=2851;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=IapQAGw++5352d3xzeDl5P6o6TxheEyCzjaqOyMO4SQ=;
 b=O9xpUqQDN1LzCYV4GZ9rTx2Jek/bWnSZPIckwh8LaFDZ+hx8nuCwS2i9XjAkNMvh7TBz2VJGu
 4heJcreMWsKDOjMvCIPXZyNGqcFmMnKD8stlhDXXNdELEPn0qjS+XyD
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_054218_173062_0C0932FA 
X-CRM114-Status: GOOD (  17.30  )
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

The Alive CLock and Power Manager (ACPM) firmware exposes clocks that
are variable and index based. These clocks don't provide an entire range
of values between the limits but only discrete points within the range.
The firmware also manages the voltage scaling appropriately with the
clock scaling. Make the ACPM node a clock provider.

Add support for the ACPM DVFS protocol. It translates clock frequency
requests to messages that can be interpreted by the ACPM firmware.
Add an ACPM clock driver to model the clocks exposed by the ACPM firmware.

All patches can go through the samsung tree.

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v2:
- dt-bindings: clocks are not longer a child of ACPM protocol. Instead
  make Alive Clock and Power Manager (ACPM) node a clock provider.
  Update commit message.
- firmware: exynos-acpm: register by hand the ACPM clocks dev (new
  patch)
- firmware: exynos-acpm: use defines intead of enum
- acpm-clk:
  - switch to determine_rate
  - drop __init, __refdata, __initconst, this is a module, we need those
    methods and data, after boot as well.
  - fix the assumption that the clocks are defined by ID in ascending order.
    There's still an assumption that the clk_id < nr_clks, but this is
    now covered by a sanity check in the clock driver.
- arm64: defconfig: enable Exynos ACPM clocks (add patch together with
  this patch set) 
- Link to v1: https://lore.kernel.org/r/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org

---
Tudor Ambarus (5):
      dt-bindings: firmware: google,gs101-acpm-ipc: add #clock-cells
      firmware: exynos-acpm: add DVFS protocol
      clk: samsung: add Exynos ACPM clock driver
      firmware: exynos-acpm: register ACPM clocks dev
      arm64: defconfig: enable Exynos ACPM clocks

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  11 ++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/samsung/Kconfig                        |  10 ++
 drivers/clk/samsung/Makefile                       |   1 +
 drivers/clk/samsung/clk-acpm.c                     | 148 +++++++++++++++++++++
 drivers/firmware/samsung/Makefile                  |   4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  83 ++++++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |  21 +++
 drivers/firmware/samsung/exynos-acpm.c             |  69 +++++++++-
 include/dt-bindings/clock/google,gs101.h           |  15 +++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  10 ++
 include/linux/platform_data/clk-acpm.h             |  24 ++++
 12 files changed, 395 insertions(+), 2 deletions(-)
---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250819-acpm-clk-28d2a78e0307

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


