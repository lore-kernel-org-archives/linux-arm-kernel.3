Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B838BCF8845
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5jsja9fjYhb+NStCyKVmqy2iqD9br8b7PE34hFfWl3s=; b=y72Zw0Sy16I86f
	NVllaY0d63ULzf9C1NpPGpnnzCf0fokovifyVT1jFbu/QXNOLUi/4Bd0FsIzbFu31nMamwZLn+EUB
	BWJSUkUkP4NmoIq8pEaMqndhV8v/6Pqvyi0ZX9ns4qD44oTlLo/8hpkblfCYikTynDPg8Wrso73u3
	3e2oFhBZmNK1d7OxwVPJpIc3cpYYhc8ogAgPsezFw27M1LKhqlKYZy9RdI/4Z3XPbbODOMn6nJveN
	/eMkrq8p08xvRPsv2vdhYT7ZOcvcSXceGE1i2M8JP7ORKw5Mk3guMPiqXlpJ6FDw0UYG1XJdFTRWw
	m86M4D0dfZ99H5/tv0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2r7-00000006a57-44iF;
	Thu, 20 Nov 2025 11:29:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2r5-00000006a42-2HXA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:29:40 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso3412105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 03:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763638178; x=1764242978; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5jsja9fjYhb+NStCyKVmqy2iqD9br8b7PE34hFfWl3s=;
        b=g9jjYSm7lw9r9ffnBj3aeUC9AN6BFksme/UVK6ahr8hLVgy49+oXHML3mLRBlPNwwq
         46Sw+ThOA7Mqm/affFqB5QjCZcOyC2MT9QoKTTcxHDzwxCtBPMVktqflJKv1XI5Tw9wy
         ZW+Ui2h4WFxt/lsQZIZB0x5vDaydMOU0v+7IYCOeBebbQzX+YdAWDgxXPjFMeByvTf8g
         V3p3a9s2auLbKPiO+Ko2X6BmuphmRvBFTQfoVZRzTasV3bikPkBchvAfWTzcYrWJ3lLp
         0RVwm7lMbcNqTj2LwTzUL9XCu9quH8nxSyBvPzEPlP/0QweYbs6iW/PYI0j9MqdJ8Jw/
         Di/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638178; x=1764242978;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jsja9fjYhb+NStCyKVmqy2iqD9br8b7PE34hFfWl3s=;
        b=goU6ayNK2TwQc4V0HLnB6bLGI1oQA+utm/0/QP5alrybcR0v7m9WUM4oWjD8PO6J0I
         gh02BphB3tXqQRP11vWbq18EHRa6VgPsTVfu/tcqFMZYswz32Ej2IBqFWANDT73Yj3ec
         VlFyEQo5gAD86eM35V59hBleC9L9mwfJkEwDm/WCc0ybaraz7fCKBbFOdlEA7Lbd7IUk
         4neSvEvsasTdLZEgjZDDmldjYo2FxMycJ1bPnq8Su10K+EPGnacZ+NVN/ob5s/Hd7YFi
         OD3ny1iknVKNZ8TPogA/uo4TeWseqmaRfG2KltmIQaHNlLL9LtAOJMcWGrkMKeZVtJKU
         U2qw==
X-Forwarded-Encrypted: i=1; AJvYcCVTu4dGCTzKnkiT1AOFafp8ErFQ45oGU0D42ZQuK5ezh5clxufsPlYxsYDJUAmfoxkUgbAp/B4rqUi6MQ33wTRO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0GHfZRDdMfVEecBexG0WnbbsEQG51K/l4t7kBO16tbbr4GTIp
	z/07zM1CG4UKqEExm+izv2BxGIUP3FYztiEJMcBW9aP4qTIwWgRxya47lFrnxc80rxI=
X-Gm-Gg: ASbGncscxT+/jLBldWDiM3OWvpMm30PRssRYzZzbiXS4RDgT5L89eU4RuflBCkLPRK5
	bBRKGPJm2xy+1ixpyDSRdJXllidUtL1Ui4S/yTflkocY0tYee+6DDnM1CkBmObdB+poR+VIcqtO
	G7q5yW4O18oQAqH8WOqIO0wdcFOHfAZAiRBDSZo5tVJwalL/mQsGpZ9kPLffZkgb5fU7oi+paTe
	00MwwK2/OK6iX4Tx2MZ0c3ecKBuGZsPN4BYoRQTWY5iiqGgpA20v7g32sLbuiRebTQDS3XBYgLL
	yZ6Q4SUWBjBm4ySzaK5wl/aSrcADkPRMOWtVj1VWbeQjQ0c9FnC7ohg1Uw1wz8ibUDypRqlUu3c
	oV6pHdV+4+iylw0wkQgZ/2YgrFodic5kJWEICikFqXgqPeVt487k7h71b3EhWqK7K0DUYEBHu8j
	fmsGRZpb+jO0+rTTCOhxJf6Z3qUU3vMw7F95Hb6AI3Hk4if2G3toEinZaJzQ5HmGyz01g=
X-Google-Smtp-Source: AGHT+IHE+l5HsIigBRRfPfTgTns2urZyrt30XqV4zwL6M7ZPA9e1/JP7tH+iQOimE4Sm0ipCDkqCZQ==
X-Received: by 2002:a05:600c:4f53:b0:477:af07:dd17 with SMTP id 5b1f17b1804b1-477b9e377e5mr21242825e9.24.1763638177719;
        Thu, 20 Nov 2025 03:29:37 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm4961040f8f.11.2025.11.20.03.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:29:37 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/6] soc: samsung: exynos-chipid: add gs101 support
Date: Thu, 20 Nov 2025 11:29:34 +0000
Message-Id: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ77HmkC/3XMywrCMBCF4VcpWRuZSW+xK99DXMRm0g5IUxIJS
 um7m3YjCi7Pge9fRKTAFEVXLCJQ4sh+yqM8FKIfzTSQZJu3UKBqhBLlEBFQ9iPPbKWzurJGG2e
 UE5nMgRw/99zlmvfI8eHDa68n3N4/oYQSpG21RWibm0I433kywR99GMRWSuqjEfWPVlnTySG1V
 QNU1l96Xdc3l/x5mucAAAA=
X-Change-ID: 20251031-gs101-chipid-fd84da8afa2f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763638176; l=3081;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ivjSzEx+CxHtG09V2L9ly4PVIffolvcnC0we/k+cPGc=;
 b=ma6axIDODKlP5/fIDbimwj6oH2uwR8BQHYAE8OXcROykBzYDRDaDArsO6/veko/kQ86svfaYU
 Raxm7ROZFqeDPtkHufUH41CBp+bKkWdVzyvCcQ3e+aJ7zFZ7BVlyeeo
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_032939_634830_29C4063B 
X-CRM114-Status: GOOD (  15.04  )
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

Dependency
==========
Typical dependency of the DT patch depending on the bindings patch,
thus the bindings patch could go via the Samsung SoC tree with
Srinivas's ack.

Description
===========
GS101 is different (but also e850 and autov9 I assume) from the SoCs
that are currently handled by the exynos-chipid driver because the
chip ID info is part of the OTP registers. GS101 OTP has a clock, an
interrupt line, a register space (that contains product and chip ID,
TMU data, ASV, etc) and a 32Kbit memory space that can be
read/program/locked with specific commands. On GS101 the "ChipID block"
is just an abstraction, it's not a physical device. When the power-on
sequence progresses, the OTP chipid values are loaded to the OTP
registers.

Add the GS101 chip ID support. The support is intentionally added in the
exynos-chipid driver, and not in a dedicated Exynos OTP driver, because
we estimate that there will not be any OTP consumers in the kernel other
than the chip ID/SoC interface. The downstream GS101 drivers confirm
this supposition.

Testing
=======
root@google-gs:~# cat /sys/devices/soc0/family
Samsung Exynos
root@google-gs:~# cat /sys/devices/soc0/machine
Oriole
root@google-gs:~# cat /sys/devices/soc0/revision
11
root@google-gs:~# cat /sys/devices/soc0/soc_id
GS101

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v3:
- rebase so that cleanups come before the gs101 support. The inclusion
  of linux/device/devres.h is now done in the devm action patch, as it's
  first needed there.
- update error message: s/failed to read sub revision/failed to read revision
- Link to v2: https://lore.kernel.org/r/20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org

Changes in v2:
- complete rework, treat it as a new patch set please.
- bindings were reviewed at:
  - Link: https://lore.kernel.org/linux-samsung-soc/27a5521cd7ddbed0e870ac416dc829722f1b36a5.camel@linaro.org/T/#me139353334db535806ca6462ae1e86b01ff032a7
  - addressed Andre's s/if of/is of
- part of the cleaning patches are from this trivial series:
  - Link: https://lore.kernel.org/linux-samsung-soc/20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org/
- Link to v1: https://lore.kernel.org/r/20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org

---
Tudor Ambarus (6):
      soc: samsung: exynos-chipid: use devm action to unregister soc device
      soc: samsung: exynos-chipid: use dev_err_probe where appropiate
      soc: samsung: exynos-chipid: rename method
      soc: samsung: exynos-chipid: downgrade dev_info to dev_dbg for soc info
      soc: samsung: exynos-chipid: add google,gs101-otp support
      arm64: dts: exynos: gs101: add OTP node

 arch/arm64/boot/dts/exynos/google/gs101.dtsi |   7 ++
 drivers/soc/samsung/exynos-chipid.c          | 148 +++++++++++++++++++--------
 2 files changed, 112 insertions(+), 43 deletions(-)
---
base-commit: 303dc6bfcd269f141c3de92aad7e25e2afd1dd47
change-id: 20251031-gs101-chipid-fd84da8afa2f

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


