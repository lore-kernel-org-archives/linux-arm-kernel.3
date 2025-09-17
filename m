Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F7FCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ign5Rvn1nrFDYbDVfbmxV7M+H+jM3AW8cIlkron9MVw=; b=tFuirwILtK5E1G
	F22pxZ145JXqsnhzBgKIV2P9hFVvZnZWPF34Nm894kX8nLF8Y3yJnJuCZV2DhkwD6HD32j99sgEL/
	s/OAZwy/sN2d2jHme+M45YZIpL5p/rQSpogaRe6zzc/ppYlFwcK8mSW6e29oh5i7tv8J5jMzeD06N
	rIVgCmFRwDt8Ad3g9FgFDnRM2p4iSejrTqhE5RtflxV1mwSaRXisJVCZCYHbN6uVDKFH5/vG+nIm+
	cOxR1Jox4tPyFYrHpBbjOV0iLwXBEbnPjmBOhDtgQcEcuPn/+vHo4Q+IL3lEgFrW1E/xoG9wta+tT
	K7AKSZv75L2BFdyd2kUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytJx-0000000CJIA-09hp;
	Wed, 17 Sep 2025 14:39:45 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytJu-0000000CJGZ-15Ba
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:39:43 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-62f7bcde405so2066940a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758119980; x=1758724780; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ign5Rvn1nrFDYbDVfbmxV7M+H+jM3AW8cIlkron9MVw=;
        b=ZJRy6qcN7X1aSF2ufrRDesMeSL89hlhDDCOV0bhHdyRsgjxsOOUWaAE+Ueh9FRqTNY
         AD3U/30TJCJMmURKDyIDX/tRBVTL+PjEP5pIKjv9g1IAI0spyFPbFEUTcEq26MjqlFiz
         QcGlcDx8/ojJHh9T2d8xhvhgnE7gF4QOyDnsFOPvWrTWs69kbhnF9uT9W8DWFBwZ4O4/
         IQkmEMvzL9s1BWe27l5kXjLFgjY1RQJEFktwCc68EJPFrCakBbQb20BnyPh4mal31Ofy
         1cSURwCKRPgvT0hzP2Vk96Sd/zEGmDkCEk1mNXVu7uThMob+YzSqAzL8Vn5gV4Toha+b
         sipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119980; x=1758724780;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ign5Rvn1nrFDYbDVfbmxV7M+H+jM3AW8cIlkron9MVw=;
        b=ZmQ4PXJUPGp98pTC8FxWZ3VKXO+tbFMegvqYtWSMmqgr3yKxDaJa2gxfX8eJKTCXo3
         LHaL8t/z6+Z4DG7Rxy+aWO0IKjXBLSGItOH9NdDePdgRmXMg50AVcRR4A8l6sPm6JyF/
         DVuVnIPHhBCuxdJZtCJLRJE8HTBlVYic94GfOdCIQaqP0nV42nnWnP7nxhOqgb9NiFZz
         LenQjiH94yIjfEjChtnVBhpab7w/gBpIQwXzXw+LtpXfmv0bD5AftdMqS7ozrItvS9ac
         7y0suBj0Hgm40tYGm3PbR626zWHo2cOrRUyonDjxui7RfsovI5XjpuY1mZ3i0ijMJZ+P
         qwsA==
X-Forwarded-Encrypted: i=1; AJvYcCWLm7JthDzfDUHSZK9cZxEXAOmUnlzKcM/3GWMnQcjJQHMTffbfopJUjIS2w8wGyyHSSVNlOY3/Pteb+rbP9YuW@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk/h9fJEKd7Dg2EA1tFE4KBlC3KdCTRIZZ/IOafwqo7y+ivQRI
	Oqw34Tc9YR3LcxjBgQusHBzA0tWLzX1Mwx+Am8fKCaOgUMB+X+KP2Upvv8YEhIPKd3Y=
X-Gm-Gg: ASbGncsPE3jlqULWymmRwwHwXQL3ov8x315pny/LySUAOHi3x4OiuNQZ/e3J5yLlAbI
	kWpg+KscAYrJlyULfhflKmjnjSNdzzOnYumXOQ2+rBidd33iUhDOZ8bpBOV2GqEHKkd99mOla+u
	FYIOmG9CuVBGdi3/Yt5MsYgcKR0tbPmpJ/FvWVMGR55CiQbNCse22NrRbuUUQAVDun5FKbNPGdU
	hUhZPxGTrInRa5jEUueUdiFUJR4ZdZ8Z/PG6JvNQPP0KPhNcWyKlQSkH2Tuoz9uX/xQZovxpy2i
	rtnSn4W4NZgFltjyycAaEoKsW1vAOYAwZYGjpLoYw7CvYoYksCPuMSZPTXrmS87dH5kbkTWc3dB
	B53PmXTClRDILES6TTnvzfnKpjCo/uYQhrhA3O0zg1CB0KHJVEiidMIeeShdb7UZPJmgszBVPvI
	aB4htF6I2GoSV1
X-Google-Smtp-Source: AGHT+IFF8kxUes3UFZ/iPcURSxsxpGZGbUCV4rgSf6BC8Nw9XulL9xf8WQpD9qjmrn6KbrUO3AOgrw==
X-Received: by 2002:a05:6402:23c2:b0:62a:91d5:8844 with SMTP id 4fb4d7f45d1cf-62f84231fcamr2655601a12.21.1758119979856;
        Wed, 17 Sep 2025 07:39:39 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f317bf9f0sm7112464a12.49.2025.09.17.07.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:39:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH RESEND v5 0/2] Samsung S2MPG10 PMIC MFD-based drivers
Date: Wed, 17 Sep 2025 15:39:31 +0100
Message-Id: <20250917-s2mpg10-v5-0-9f9c9c4a44d9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-CRM114-CacheID: sfid-20250917_073942_336243_47EEA707 
X-CRM114-Status: GOOD (  26.23  )
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


