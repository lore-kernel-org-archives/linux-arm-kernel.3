Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D261FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ign5Rvn1nrFDYbDVfbmxV7M+H+jM3AW8cIlkron9MVw=; b=oRuwCsre8pYblL
	L0balogsyatlmn/qV7WQ6DQpumFwN4EEjCq8lMBpo8fIlEJTuZskcq+chVYTPmq0+KeogkdeBVlEY
	gJWQ0LdkqeOSeQ8A6jAPyPWYi3BxcSFCDBdjhHq8LeZkVZTgOeLTQnZJHBIl1kvpn00iDVjQ+bZpm
	+79dAGrIbq0r5ikSUkEcfLwa78px5N+sUzYvKNtzc6vE4w+mE4uD5JA3iFt/iaVkLkFe7HAVLlCcR
	20jVVxaXcSzZN8r7B51EQTV0WwMqnWBHveZ194NK7WfvL+JNZLsXG6oEN/DdPn8fU3SjMzy+Cfe75
	/cK4LZbwQjADX4pJTtGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3D8-000000017ei-4BQJ;
	Wed, 30 Jul 2025 09:34:59 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3A7-0000000174b-2PvW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 09:31:52 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-61568fbed16so3013167a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 02:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753867910; x=1754472710; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ign5Rvn1nrFDYbDVfbmxV7M+H+jM3AW8cIlkron9MVw=;
        b=lnqaRj1AVnmZYSEjkvD/QGzFgLoozRFSHiYHBw64S6IkB5Uw33dADWgg2oY18wvo5K
         w7U5Tb+/K97GzA/40jP7VbVu13Woj+RbjdWyB1MVxo5MFtq1n/QNEN32TEN4WSzzp+Rr
         X4kxIUbIi4QrzSUr24Et5DAseyhny3ltuNH2RHhPg5YsV550K88Zz5l1dPv+XsAMICww
         /Rhz3sfbEMA50MifeC8x3frGmDGroE/cjuS9/yB8yJIOJ1Whts7PprkmiD7wBkISmRn0
         FyWBLP17ciOqXP1+pVYgU4T7tCaDv9oW/sBbBz+DWurJlz14B1vTLtb5uQuO1e5ta0dY
         zsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753867910; x=1754472710;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ign5Rvn1nrFDYbDVfbmxV7M+H+jM3AW8cIlkron9MVw=;
        b=ZtiHvxlxE70SRhiU7jVbMNZX/Z/pCb6y7HeJYWqt4QpRmZ0ntWYcUPR/DciJ0fy6dY
         DQNsxDX7pNPd+tvSlrKF2EhvzqwUmYXGM0hPJ0INX6DBrrdUmUNuUijvM3vqRy6VBaph
         6nWn5+w39IXcVb6tJzE9LF/xGWtUw3k47aGjvWK/TeG1mc+/bOeFX+8Lf68mDX+Vzp9l
         dDLV+WC0KcxoRu9kwbRCt88X7eiCE7N/AA8hyICDi42YLPU/KkL9ytpkqA7kj4oHbB2e
         wYlsIQp+rv/x4YzHsuwPC7T71Q+jAaiprWyqmGR1inxLs5/T2HyPDG0H9fuaU9wAVzb5
         cV8g==
X-Forwarded-Encrypted: i=1; AJvYcCUDPaqGmAxeME1AAvB1Kl/Y0YrBPoqGQEHKhnyCiuAFjHdgShY685mVgAiA6WAj1y5EZtYGXSD60muNzAFL2y/z@lists.infradead.org
X-Gm-Message-State: AOJu0YxKwAqaKsdoev+CgEkPAZYYqKrUxPybhdwJCB9kiBoX29c1DbTh
	yh/sNNe9790GjvDbf5Uaoi94tcjEXG7dDTPUrBmHC668h76a3XHhsu/DE0AhyUHm74Y=
X-Gm-Gg: ASbGnctAokqkhHz9YVT65UjLkCoA1Fwwryhpi3tGQmB0BSEw90rSTWY9MlRRg+5iwsO
	6Ri3gNQR06Xc12fy+uR/0K0PBrKrIdYb06t5GC9i3uQOYHkp5UYxQ6fDMNmYbzC6Z8aAg5XKqfI
	mj5dLtm/s7eml2923HfJFnqAONIlwBOcIx5WQ3vV1ki9BLrwTX8LLg88omstKEvVRE4hHVsgZ3p
	KVEdVL57u/FGNmDaHKs5eszop5sATKa5DpsY4+OlBq9ispvVACtBD3yk0xgDTJBYDALVNddmZoX
	kfxnQ/x+cHxpADvEsVlSzhoAkz2EDBaILPJ7CIIrg60oo9MakE8pPQk8gW8YubiRwvSmP/TeoQ6
	pwQJh3BjfK0NprJJkOretjCYb8M8wHWRf0pbCVrDafF9+xkKNHRgQIbQpl+D8rp/3iPJU2O63Ff
	QwzcMn1A==
X-Google-Smtp-Source: AGHT+IHblx3Qz+7RLXy0BsXAU+JhtlCfvSdqO2qWeJIEcuKpggfXj3qv90ALBrzdmml33C0iVYKiqQ==
X-Received: by 2002:a05:6402:35c3:b0:615:79b9:28ba with SMTP id 4fb4d7f45d1cf-61586eef0e9mr2633422a12.6.1753867909762;
        Wed, 30 Jul 2025 02:31:49 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61536916dbasm4090424a12.43.2025.07.30.02.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 02:31:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v5 0/2] Samsung S2MPG10 PMIC MFD-based drivers
Date: Wed, 30 Jul 2025 10:31:33 +0100
Message-Id: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHXmiWgC/2XOTQ7CIBAF4KsY1mIGBvrjynsYFyJDJdHSgGk0T
 e8u1WhrXL7JfG9mYImip8S2q4FF6n3yoc1Br1fsdD62DXFvc2YSpAaUgid57RoBnJy2goxFUMj
 ydhfJ+furaX/I+ezTLcTHq7gX0/TTgd+OXnDgFqpaYQmyhHJ38e0xhk2IDZtKermE1QxlhkYrS
 4ToTGH+IM5QweIivqE0qEFTUf1BtYT1DNX0alFY7bDOB90PHMfxCcaAvPNKAQAA
X-Change-ID: 20250321-s2mpg10-ef5d1ebd3043
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_023151_617129_1D8B04D1 
X-CRM114-Status: GOOD (  26.22  )
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

Original cover letter further down.

This is a resend of two patches from the original series that haven't
been merged yet. That series was merged except for the attached two
patches here. Other than rebasing against next-20250729 there are no
changes to them.

Lee, I think Stephen's intention was to get these two merged via the
MFD tree please.

Original cover letter:
----------------------

This series adds initial support for the Samsung S2MPG10 PMIC using the
MFD framework. This is a PMIC for mobile applications and is used on
the Google Pixel 6 and 6 Pro (oriole / raven).

*** dependency note ***

To compile, this depends on the Samsung ACPM driver in Linux next with
the following additional patches:
https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org/
https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org/
https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org/

*** dependency note end ***

+++ Kconfig update +++

There is a Kconfig symbol update in this series, because the existing
Samsung S2M driver has been split into core and transport (I2C & ACPM)
parts. CONFIG_MFD_SEC_CORE is now truly a core driver, and
the I2C code that was part of it is now enabled via CONFIG_MFD_SEC_I2C.

This was necessary because unlike the other S2M PMICs, S2MPG10 doesn't
talk via I2C, but via the Samsung ACPM firmware.

+++ Kconfig update end +++

This series must be applied in-order, due to interdependencies of some
of the patches. There are also various cleanup patches to the S2M
drivers. I've kept them ordered as:
  * DT bindings (patches 1 ... 3)
  * s2m mfd prep for adding S2MPG10 support (patches 4 ... 7)
  * split S2M mfd driver into s2m-core and s2m-i2c, including the
    kconfig symbol update (patch 8)
  * S2MPG10 core driver (patch 9)
  * s2m mfd driver cleanup patches (patches 10 ... 23)
  * S2MPG10 clock driver (patch 24)
  * s2m RTC prep for adding S2MPG10 (patch 25 ... 26)
  * S2MPG10 RTC driver (patch 27)
  * s2m RTC cleanup patches (patches 28 ... 31)

I realise these are many, but since some prep-work was required to be
able to add S2MPG anyway, I wanted to get the cleanup patches in as
well :-) Let me know if I should postpone them to a later date instead.

The S2MPG10 includes buck converters, various LDOs, power meters, RTC,
clock outputs, and additional GPIOs interfaces.

This series adds support in the top-level device driver, and for the
RTC and clock. Importantly, having the RTC driver allows to do a proper
reset of the system. Drivers or driver updates for the other components
will be added in future patches.

This will need a DT update for Oriole / Raven to enable this device. I
will send that out separately.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v5:
- just a rebase & resend of the last two remaining patches
- no other changes
- Link to v4: https://lore.kernel.org/r/20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org

Changes in v4:
- various updates to sec-acpm (patch 9, Lee)
- cache enum type in patch 25 (Krzysztof)
- collect tags
- Link to v3: https://lore.kernel.org/r/20250403-s2mpg10-v3-0-b542b3505e68@linaro.org

Changes in v3:
- Krzysztof:
  - keep 'regulators' subnode required even for s2mpg10
  - drop '$ref' and 'unevaluatedProperties' from pmic subnode, use
    'additionalProperties' instead
  - add some regulators to examples since s2mpg10 requires them as of
    v3
- sec-acpm:
  - use an enum for struct sec_acpm_bus_context::type
  - consistent name space for all functions sec_pmic_acpm_... to be
    similar to i2c and consistent in this file
- Link to v2: https://lore.kernel.org/r/20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org

Changes in v2:
- Rob:
  - make PMIC node a child of ACPM, and all related changes (binding,
    driver)
- Krzysztof:
  - merge defconfig updates into patch changing the symbols (patch 8)
  - split MODULE_AUTHOR update into a separate patch
  - better alignment fix (patch 11)
  - merge two s2dos05/s2mpu05 related patches into one (patch 14)
- myself:
  - keep PMIC DT parsing in core, not in transport driver
  - several updates in sec-acpm.c, see separate entries in patch 9
  - fix typo in patch 17
  - collect tags
- Link to v1: https://lore.kernel.org/r/20250323-s2mpg10-v1-0-d08943702707@linaro.org

---
André Draszik (2):
      dt-bindings: clock: samsung,s2mps11: add s2mpg10
      clk: s2mps11: add support for S2MPG10 PMIC clock

 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 drivers/clk/clk-s2mps11.c                                    | 8 ++++++++
 2 files changed, 9 insertions(+)
---
base-commit: 54efec8782214652b331c50646013f8526570e8d
change-id: 20250321-s2mpg10-ef5d1ebd3043

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


