Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2203CCEDD92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gGA59MK9dVZM5lN1BpwAauPGxOjSxQZOCE1Zm+eAl04=; b=XnIvbMKgP446LE
	oxLfEer1FcVT4iWaV1t9j5xYoxrcslu6x1LZgvg86dhhvckG/4e6u2Kqmzlc3vGLpzLiZ5KoJcYW/
	C5+7Ex9IzhuK77DNCzgKnXSgr78OtWwqhVDdS0ilTaRF5OcWTCW1C3AnVEDm8Mvc1wHGFpcoRfcwk
	yFA8keB6aJaBnPGDcjha83w2Z1lw+btujnsPhMJAHaduu+iby0QjEOPQcQk2dVO0L19dicI7fdOA3
	P8JYiV8CjfmkZUYO/Ug6TgrWeXkU5cS42T4M1+4sesCc7rMqzYOit8x8Tsp0DIi809QpL1GOcQdVG
	SjAn0KcIyLfAgFHs58MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMC4-00000000VAG-18f8;
	Tue, 18 Nov 2025 13:56:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMBw-00000000V0W-1hwU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:56:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4774f41628bso35263225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 05:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474178; x=1764078978; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGA59MK9dVZM5lN1BpwAauPGxOjSxQZOCE1Zm+eAl04=;
        b=Gfc/DVL+RKy+5HHm9ss+SJj7hWy1zulDVlpY57RL+IPihvIHRTxmbMhZsaCz/lvWIQ
         9TXjK6vb9AdDxwLBvJVsvMoUKEIWUQdQsd2cdW2EvumZA33//gFPGXPOetpoh0el3OVc
         Z2ymHufte957eTbDPB0c0meEU3Lgq1RYh2MdhewRnVsOZrjucDduqkH1Y2NN/3wCDr66
         W5EiSN0dv4k39dMbPXgbIJfn9/chojMzbYvKHAj3UW9TTLtOOl8MfXUL5l910/9+RcNc
         vsc47bBAPvc6EwZxga2SEdaAxeqaf/iCYNyZRotk3wsQsb+MDn5GK35BwnwZ2oNHiDsa
         ke2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474178; x=1764078978;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGA59MK9dVZM5lN1BpwAauPGxOjSxQZOCE1Zm+eAl04=;
        b=udphcOKnIjgvn/WjvdY/unsjFhaTMm9WNw1MKnK+b857JwnzYjjuFt0DqW2+w4q9Xh
         bJmUWknu3+WYIRSDaaR642XHWw3HztTfEbx1ZZcPRbOCFpWREmYuQlrPVlo8l9VJypx/
         KFQyLLJ5dz/Dc95Ceg1KG4Gg1hJzXdSEwFUnMrBEnHaponfjeTwm3dkH729+lvTMGjkY
         T4EzJ/+SbwSEfyXrd13nk9rnXYaUexmCNn4c7VqBkoEYmTvwhnI2OBrvZkJbrr0MQFkR
         FmB/orXuqJL4iR2FPbnvzr1OW1V0/pnmIDkfeRBHyB0yvdXXPSHpaXExNlwr1q8ScRQi
         329g==
X-Forwarded-Encrypted: i=1; AJvYcCUTgByW7yExzSUfCxZqZ6iPMdC/oddJV9YsLQFWUknZEbHyquHkwyndB8S123z4TCjOvR5YGV95E1zebzq0ymTi@lists.infradead.org
X-Gm-Message-State: AOJu0YyIwdnLypAnVmD/04hZ7MSzCbyiYNzZc3Xik9QvJvgLJRNBvHrZ
	0DPOWtndT2+8BYCQXpPoG0FPl6vFGl/7xRxPfHh7Chxo+idok+dzm1Ss7kxmpUa3t5E=
X-Gm-Gg: ASbGncsJ2k4NNKbv3ZKNm1CKYLxNVKXsAJuuVtqwxRGlUFs+c06FJUgZU6mcU24GhXl
	Vr8fxEhkC0hGaIFpJJMncFBs42HA9CB1aie9PijC7e02gJRuhFFotVO5FeoAxuEOMei7GXjv41x
	paIe1DCYOIZJBsLVm/E/7OXx17yxE3Y5889sN7KUiglVATeQCEoI3CF4W5Wyq9BcKleQUjHsEdJ
	sVPNVH17YGdibzYtyyWVjTKg10IYps411Lfcc+FmvG0jQvnN1uKX9tsHhzKMxgOUAq+G28wJ54Q
	O6iHv514QQ7RJcb4vGz9prSdWaAajTzFmwHuIFhCrVqdIlXBLxSfthd0oH+p8EB8dyF5UnGSz+N
	K+Hv9wBgjK7l2pH1e2LuZi4hXmT9Rsyr5PC+6pz/WHesggHfI5B4Ej8TPRZyozBHBpLWgtViYQY
	J/ocxU+Sn7RsK3PnOH7r5JOW44ocaA+jn4xmWE0gvyDAiinipHKIaY6s6608WvGToxNww=
X-Google-Smtp-Source: AGHT+IGZgxXdUzTGsmQijkdGDIfr7wMhee9CfrwEzDd8qB6n/m1q35GD6+YFJI552JcqQZiyv9YzDA==
X-Received: by 2002:a05:6000:186d:b0:429:d3c9:b8af with SMTP id ffacd0b85a97d-42ca8cd0d7bmr3671679f8f.25.1763474178264;
        Tue, 18 Nov 2025 05:56:18 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:17 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/7] soc: samsung: exynos-chipid: add gs101 support
Date: Tue, 18 Nov 2025 13:56:07 +0000
Message-Id: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPd6HGkC/3XMywrCMBCF4Vcps3YkEy8Nrvoe0kVsbgOSlESCU
 vLuxu5d/gfOt0GxmW2B27BBtpULp9hDHgZYgo7eIpveIIW8kDgR+kKCcAm8skFn1NlopZ2WDvp
 lzdbxe+fuc+/A5ZXyZ9cr/dY/UCUUaEZlSIzXhyQxPTnqnI4pe5hba1+rSZ+4qQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=2844;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Kr8mEMg8GUIR0ES8nTKUQqU7gngQ/9e8fD/J6xaVWA8=;
 b=LVRWlNp4X7IcullcpPaadgDLyqzRT2qebSKjsvSfkZjCX4eK3g7QnnM3DOTUjINKB9zjC3vfk
 wNdkuEWFaYFAUAUWVq3uOk+QcZszuFH+ip5x5/d7jyRSJQU4A9nA01Z
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_055620_502325_14A008FA 
X-CRM114-Status: GOOD (  14.42  )
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
Changes in v2:
- complete rework, treat it as a new patch set please.
- bindings were reviewed at:
  - Link: https://lore.kernel.org/linux-samsung-soc/27a5521cd7ddbed0e870ac416dc829722f1b36a5.camel@linaro.org/T/#me139353334db535806ca6462ae1e86b01ff032a7
  - addressed Andre's s/if of/is of
- part of the cleaning patches are from this trivial series:
  - Link: https://lore.kernel.org/linux-samsung-soc/20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org/
- Link to v1: https://lore.kernel.org/r/20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org

---
Tudor Ambarus (7):
      dt-bindings: nvmem: add google,gs101-otp
      soc: samsung: exynos-chipid: add google,gs101-otp support
      soc: samsung: exynos-chipid: use devm action to unregister soc device
      soc: samsung: exynos-chipid: use dev_err_probe where appropiate
      soc: samsung: exynos-chipid: rename method
      soc: samsung: exynos-chipid: downgrade dev_info to dev_dbg for soc info
      arm64: dts: exynos: gs101: add OTP node

 .../bindings/nvmem/google,gs101-otp.yaml           |  56 ++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   7 +
 drivers/soc/samsung/exynos-chipid.c                | 148 +++++++++++++++------
 3 files changed, 168 insertions(+), 43 deletions(-)
---
base-commit: 4b67e4c65c1e0740ac12bd0d790eb5a9d0091aaa
change-id: 20251031-gs101-chipid-fd84da8afa2f

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


