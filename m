Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CBDC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 03:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bAXdyGbjDVJehrX6WsDIa22AaTBT8kUD01xMGbeNz/M=; b=TvSaLbAbXgE8jaSIUpij9LpXOc
	6LCTInDCNWJGI0+YvawoV8qLdPfTIneQkr/YYoYH1YBiZQo8YqHUhUAO2Ecdzg0YTbjD7azWul8dO
	mtYzHgsVjndtnYhpS3EFHOPhbLH8mGJXw7v4X02cloTKA4qQfIX6VUukDomcgvG3CJ+ibOxKTyeU0
	pIHOqf8JQvrCsusZW4lFUCCzBp/p0s4pi+YgxVtED1GsRoDt3n/m/qEeZaWJZxXisOD1djHi1uylv
	uOLSZaNpS1gLUTPzPSoKaOABkAFS7BXcWKo2RGOYH94qoHWB0wPG+x0CR5tR/aPM988oMFj6vCERp
	vjFfgVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHa40-0000000Eg0u-0bjY;
	Wed, 21 May 2025 03:24:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHZzq-0000000EfKL-3tZN;
	Wed, 21 May 2025 03:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E091740C0D;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6314C4CEE4;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747797597;
	bh=FilmMjWVjeFbgPQ1/VIsUxcruvgzblwEpDc5cmgZlVY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ahkxs39Rg4dUQir30EiFH3sSbqIY0xZQAMd+KG8QGFeDfT2dHCrf7sHtXEnJ3BKw/
	 DyPcYaTfcGiiCxy0eFo0pDuJ7dZp3XN2xbnThyN88K+gqVOrFjgSGXxVcDALL9eJFc
	 wG/wDMBJG4imZ7lVZx4tP7xEbUQL9otvEm8AQyQBM2amfl7OaqPOxeP4elrVSDCDR1
	 jJrLtNRjnOEAvMyrRyQqGpGljKIYf7IuDzk6wp1e/13kQG04M4dJKzmQ+guiM8DB7C
	 jQKSYSrIzqCt+ZupDHpRdfnbzyCCJsiqbjZHcoxNTdPr//PjQSDVlupuuYl+zSuDms
	 /IPm15z3CpuMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7ECC2D0CD;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/8] Add support for Amlogic S7/S7D/S6 pinctrl
Date: Wed, 21 May 2025 11:19:54 +0800
Message-Id: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFtGLWgC/3WMyw6CMBBFf4XM2jG0PERW/odhUdsBJoGWtKTRk
 P67lb3Lc3PPOSCQZwrQFwd4ihzY2QzyUoCelZ0I2WQGWcqmbESNocVww42t3v2CahT0MqrrVE2
 Qnc3TyO+z9xwyzxx25z9nPorf+q8UBZZY3U3VdlqZfHmodXET66t2KwwppS+CZbg7rAAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747797595; l=2128;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=FilmMjWVjeFbgPQ1/VIsUxcruvgzblwEpDc5cmgZlVY=;
 b=U1eTjmPOftcb7iYltC3UH46ARev+gM0/KW5ZTeoQ/qiPrvdj/r6c6PBMe9+aR35Bzk4OhXzRq
 JEx4RuXCa7cAoIPVyO0iXifLoJGKdUy2fFud6Pfi8GnF6FyuVYtWSRE
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_201959_014749_A6DAFD84 
X-CRM114-Status: GOOD (  10.84  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

In some Amlogic SoCs, to save register space or due to some
abnormal arrangements, two sets of pins share one mux register.
A group starting from pin0 is the main pin group, which acquires
the register address through DTS and has management permissions,
but the register bit offset is undetermined.
Another GPIO group as a subordinate group. Some pins mux use share
register and bit offset from bit0 . But this group do not have
register management permissions.

In SoC S7 and S7D, GPIOX(16~19) mux share with GPIOCC mux register.

In SoC S6, GPIOX(16~19) mux share with GPIOCC mux register, and GPIOD(6)
mux share with GPIOF mux register.

Add S7/S7D/S6 pinctrl compatible string and device node.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Add a unit address for pinctrl node.
- Use pointer instead of flexible array to solve the problem tested by kernel test robot.
- Link to v1: https://lore.kernel.org/r/20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com

---
Xianwei Zhao (8):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S7
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S7D
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S6
      pinctrl: meson: a4: remove special data processing
      pinctrl: meson: support amlogic S6/S7/S7D SoC
      dts: arm64: amlogic: add S7 pinctrl node
      dts: arm64: amlogic: add S7D pinctrl node
      dts: arm64: amlogic: add S6 pinctrl node

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |   9 +-
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |  97 +++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |  81 ++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |  90 ++++++++++++++++
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 118 ++++++++++++++++-----
 5 files changed, 370 insertions(+), 25 deletions(-)
---
base-commit: aa94665adc28f3fdc3de2979ac1e98bae961d6ca
change-id: 20250514-s6-s7-pinctrl-af1ebda88a4e

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



