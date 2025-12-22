Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CF9E677F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 16:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ctl7eWpJT4ia0HLtsWNeK1uZK5cygsJY/3exL4pUDw0=; b=MY62+/grjeOVtT
	TXYBNkW2DENM2xLbqy89XqFhSlyRiQMnp1KSMetcZ5ztrAM1HVvNQzSo1nM1Hd1VqlKTZMA8VC00x
	OXVq8SeH7uS345T7nWUBnNZb+C5SVwOf8YB9/YeQDOk5P9vP7X+wx+hR7/88eYg5sQAc0F8uBY0Sg
	pCMTcNdZMBL6XHmDi0wYXSbHqnvJoE9y2Ba86uOZQuQX1IugBiGX69L3odFPFS09p9omLSS2xAvxx
	ymSZZlHK6AdFCtJKL8iDTqtPBI/wPYXpIndruzwRWSJvBHhzfw1LXUeSJJRapvFcIcdhVQFDbHmzZ
	60paBpPwQHRiQ5ZLjX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXinu-0000000Dy8Q-2gOu;
	Mon, 22 Dec 2025 16:30:38 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXinr-0000000Dy6v-3MSW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 16:30:37 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-430f57cd471so2247325f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 08:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766421034; x=1767025834; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ctl7eWpJT4ia0HLtsWNeK1uZK5cygsJY/3exL4pUDw0=;
        b=nfgskcsbm1B8JeCiudBlpiewc0aD7S6x/7ycL4fFh8TNB+xNB0dUV+M2+WsIqEG0xo
         u8SD1i6LiQ59CJCwNlDwmysoQxBuB58qmY74I0fJy3kH2Y/12VaHXqhc94727p63IgAY
         mLrU+Vh2BZdz1HrT/AVjiMqHcxFoTLekDxyF0HifiZC/7pIvL1CJqVO+QdiaG4RAHoq7
         Ijff+Fv3c1dOcFTKvzsjARsy0uVYISaT0uu4tmC9KqLEv7wkf1E3ElKzZMcKOp3X6YwD
         w6FwrkBWHimc1nf9DUmAZEdNu+7EV4iywl6/LSsJhYRdhxZI5MWYXce0uP86SKtsSuFX
         ymtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421034; x=1767025834;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ctl7eWpJT4ia0HLtsWNeK1uZK5cygsJY/3exL4pUDw0=;
        b=ScZ45unjgXMMwW/fmodm1V/OiLXTJNpG6iPLy9HFxhMKF8SxUWwOqP7jUuR/ymd7G0
         3f8ye7dtQ7QgOkyzegmB/g0+Lxh+RmvKlJGeiYOInFy2HMzNPNiV055DpAd2kPNF9oHb
         YVDRAz6cOrA7BkqWEZU9uBcRbsRFOz5mkXBCwKGX+ZYNBSVJ5f+IB254DJkfXBHq3mYr
         0DP7kVZA+dZt6zxaza0U7vI8rBJh8y1ClY0ZunZ2hdjCnmdbd3Mz69HwqtjVlyPjZk+l
         2oOs4NgnsLBhd/IR0PseP985gManfu2thBJA4j5oWmhwEVJS2UsghWZL3LvM220XdH1+
         GCqA==
X-Forwarded-Encrypted: i=1; AJvYcCU1cwoi2H72GH+9U/U/lpkQc9vAI/8y/L4c0PJP0S+mObV0iJsAhsLOTLz27kIiy69TZbN58rRusCUBlJiJ8Yaz@lists.infradead.org
X-Gm-Message-State: AOJu0YyODmDCewdrQ+1EuypltpFH9adU2COe03ybwVLNSGvjOgiRq+n2
	t8WTR4JRskiGros+zgUgk8FArAWY7KjKr4TtBwfLhtCwk/dyXhEEuxUSVQlJWTQwVs0=
X-Gm-Gg: AY/fxX6JzVR/JQ8YDlCyEVoE4vKTBW19laKerAG7eOeXownX4pGiU4TeklWdsu0vCOO
	AjBjFJKhuDrxvD+FcrcnNL3Kj5OOp4MG+WdmEaGkAP9cmmms+eMej3lusl+iXLU7M7FCPNe6Ln7
	wpv+5hpAT8H3RLCa8M4f1uMN4YVaJ73hJKHVtnO3aneEdH3xnlnL66lthqTS1++z2ylXCTrEUD+
	5tIedAV6QCyhderbX18ro9mt2qgt+gfTj32cVmJ8BGEQZnvKNzPPi6no8OhfFsEUmgKpCODuZam
	Iyr5pzMaCDSJz4tohewvEGFso7bElRUoFGemzk7QAE/GVDA5kY/0mn/iYJl4Qe9p+OcXwto81Ja
	76z4Zs+PtajYCjHBjrsuUctXubt3fkaGzFRWEih7VYc7Cc8zCgybpokqvB1tTc3XL0H8reY3TRR
	2RZO7qDgMenO43U5nRruQR8ARJeBZ+B5NbYOWAc1O5jZh/8B+vJrI9J2v/Iw7Wis5q
X-Google-Smtp-Source: AGHT+IHP3TVcHJUO6fEEaJiZ3KZ9Y0M56GH02vB1nVQlN5qa+5+n8klBqzUFF9EIfIkkGQdDQHD3Lg==
X-Received: by 2002:a5d:4a11:0:b0:431:67d:5390 with SMTP id ffacd0b85a97d-4324e50d055mr12000428f8f.54.1766421033515;
        Mon, 22 Dec 2025 08:30:33 -0800 (PST)
Received: from ta2.c.googlers.com (62.221.76.34.bc.googleusercontent.com. [34.76.221.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm23071258f8f.37.2025.12.22.08.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:30:33 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 0/5] soc: samsung: exynos-chipid: add gs101 support
Date: Mon, 22 Dec 2025 16:30:04 +0000
Message-Id: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAxySWkC/3XMQQ6CMBCF4auQrq3ptECrK+9hXBQ6hUkMkNY0G
 sLdLWw0GJfvJd8/s4iBMLJzMbOAiSKNQx7loWBtb4cOObm8mRSyAqGAdxEE8LaniRz3zpTOGuu
 t9CyTKaCn55a73vLuKT7G8NrqCdb3TygBF9xp40DoupEgLncabBiPY+jYWkryowHMTsus8eQBd
 VkLVNWPVl9aip1WWYNFa02j/V4vy/IG2eUcTCUBAAA=
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
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766421032; l=3493;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=EK9FzpxfbOefeY4KXr9jO4jSMDYcEmASpCx7jpsgjTw=;
 b=7fNbpMRJGUwHd8n+eAjn9vpyQZsPG/Icp4tZm2ppyf+yB2A+3OGHvARhy6aXGA9g40Erat6l+
 3nSaRJ08bNZD39nbNV4/+5fUA6ssUv61fQut8fteDzn3gZ1lO4izqVl
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_083035_878961_CAB08C43 
X-CRM114-Status: GOOD (  15.50  )
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
Changes in v4:
- bindings were not sent in v3, human error. Add them back. Compared to
  v2, add clock-names property as it's needed for
  devm_regmap_init_mmio_clk()
- driver: use devm_regmap_init_mmio_clk() to deal with clock aquisition
  and enable/disable as needed.
- dt: add clock-names prop
- Rebase and collect R-b tags
- Link to v3: https://lore.kernel.org/r/20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org

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
Tudor Ambarus (5):
      dt-bindings: nvmem: add google,gs101-otp
      soc: samsung: exynos-chipid: rename method
      soc: samsung: exynos-chipid: downgrade dev_info to dev_dbg for soc info
      soc: samsung: exynos-chipid: add google,gs101-otp support
      arm64: dts: exynos: gs101: add OTP node

 .../bindings/nvmem/google,gs101-otp.yaml           | 61 +++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  8 +++
 drivers/soc/samsung/exynos-chipid.c                | 79 ++++++++++++++++++----
 3 files changed, 135 insertions(+), 13 deletions(-)
---
base-commit: 0825f376d02e58e8ee4179569e0a386e1cd0eb76
change-id: 20251031-gs101-chipid-fd84da8afa2f

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


