Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52842C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 03:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F3RDuq40CM86/a2ouvm5WwtAnj9GQo8qbeNAjb3DpHs=; b=lGsFWsL94GGoLwjufYG1zNsdgd
	IeEPr4V6kJGbcdMMCa3eIdQKazkSMzNdJXQFq+6OvQ+klLDpBrEqWOyv5qK4bMUjylXDAqnxjfRj6
	ccJku5pTWLhNeXdC/YnP3G0x4F1W6B6gB0kHDz+bC9EZy5v+wf6GuKHJaJ0ZCX2uNUHPq2Kpol7/V
	0KC3wkPmUuMPQWiamUmkE3UUyvwOSiTkKgxSe8eWYB/or+C5N3dkQTZ7CGuNRasBnR1VdLdK/93eX
	84cFxsZK4r1mdZ0u8n8eYfRWzKXd7u3wUcDunOjfoAqSFGzA/usE8jNuAfuSQ5Nkhd9eNgPPHmwti
	AIb5cMXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taRV5-00000009KDp-3Fsm;
	Wed, 22 Jan 2025 03:33:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taRNW-00000009JAj-3yqY;
	Wed, 22 Jan 2025 03:26:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 03EF2A400E8;
	Wed, 22 Jan 2025 03:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 242BFC4CED6;
	Wed, 22 Jan 2025 03:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737516365;
	bh=t2wfr4/PkO9Lh3Bw0KccXsVOWadq4npkK7mf3G0pXFk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HsAuuP8MbMZBzLK/VV8ifd69BBHYv/kuC4reZIhYDpm9sSnmKcOZIbh6e4r+AbL3D
	 HAeywFOcRtzLPEGoAevNJLJk0ozZnAmqB8XLhR6iAt0KuaicfLFZMD9NM1X0L9e8sB
	 Akn7t9JgI/TIVwrAbAyn10XDbhmLMFcPkELPKlNMWZprmKBLYvRxcNPz6WiDOWf7gA
	 33Vjqsb606YiRb/n16A5BKygCbks81pL9fVZtRwNO5eEtkhM4RnCdyjAyX8hms3awX
	 ka4qnfL5DOIhm/rBOgFD8ZcNbAo0sMzhUL+8QInlqMzNl1VulJucc3KhI1pGFbUpFd
	 r4b3G7l6Rex3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B61AC02181;
	Wed, 22 Jan 2025 03:26:05 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v4 0/5] Pinctrl: Add Amlogic pinctrl driver
Date: Wed, 22 Jan 2025 11:25:58 +0800
Message-Id: <20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEdlkGcC/3XNSw6CMBCA4auQrq3pTF/oynsYF6VUaAKUFEI0h
 LtbiCYa4vKfzHwzk8FF7wZyzmYS3eQHH7oU4pARW5uuctSXqQkyFIAA1LRNqLylve/sGBuK6Iy
 CHFnJSpKu+uju/rGJ11vq2g9jiM/twQTr9L81AWVUANOoOZcAp8t742hDS1Ztwi8B1V7AJNjSO
 IFG6UKrvcA/gmQAci/wJGCRS66E1KYwv8KyLC8v+5EfNAEAAA==
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737516363; l=3484;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=t2wfr4/PkO9Lh3Bw0KccXsVOWadq4npkK7mf3G0pXFk=;
 b=oql750cdOMuzojijnhNz0Mv/peGMkD6Mlq6I4ChVZCwrxxDIfpOtbXRbXrKWxuoD6LDqlG86u
 VkI6c1lxlToC+jYdnFNEdKNOjhV244OzNscoE/5FuxvVv5N8JwDFEur
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_192607_138863_D65C60CD 
X-CRM114-Status: GOOD (  14.32  )
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

Add pinctrl driver support for Amloigc SoCs

Base on the previous discussion,
https://lore.kernel.org/r/20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com
The existed meson driver failed to meet the requirement of the current dt-binding.
So we start this new pinctrl driver to solve problem.

The advantage of this version: Once the source file and binding document
are added, adding dts node will be only operation for subsequent Amlogic SoCs
(such as A4, A5).

The code in DTS file is also readable when using GPIO, as below:
reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v4:
- Drop bank-number property, and get information from gpio-ranges property.
- Keep required of pinctrol after patternProperties, and add missing "ranges" for required.
- Add required(pinmux) of function.
- Keep address-cells and size-cells property values, because:
  Previously only represented a register address offset value, now directly represents a register, through 'ranges" which to represent.
- Some little modifications were made to bindings and dts according to Krzysztof's suggestions.
- Link to v3: https://lore.kernel.org/r/20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com

Changes in v3:
- Move reg and reg-name from pin controller node into gpio-controller node and drop mask property.
- Use gpio-range instead of ngpios property.
- Some little modifications were made to bindings according to Rob's suggestions.
- Fix bug reported by kernel test robot.
- Two pin controller node compressed into one because of register address defined in gpio-controller.
- Link to v2: https://lore.kernel.org/r/20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com

Changes in v2:
- Some modifications and optimizations were made to bindings according to Rob's suggestions.
- Refined some details on functions node for bindings. 
- Some source code optimizations were made according to Linus's suggestions.
- Add stand API to generic to deal pinmux propertity.
- Add private reg data to deal with for future SoCs.
- Simplified some unused processing (previously used for extension).
- Sync add to MAINTAINERS files.
- Link to v1: https://lore.kernel.org/r/20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com

---
Xianwei Zhao (5):
      dt-bindings: pinctrl: Add support for Amlogic SoCs
      pinctrl: pinconf-generic: Add API for pinmux propertity in DTS file
      pinctrl: Add driver support for Amlogic SoCs
      arm64: dts: amlogic: a4: add pinctrl node
      MAINTAINERS: Add an entry for Amlogic pinctrl driver

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  127 +++
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  120 +++
 drivers/pinctrl/Kconfig                            |   18 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinconf-generic.c                  |  130 +++
 drivers/pinctrl/pinconf.h                          |    4 +
 drivers/pinctrl/pinctrl-amlogic.c                  | 1053 ++++++++++++++++++++
 include/dt-bindings/pinctrl/amlogic,pinctrl.h      |   46 +
 include/linux/pinctrl/pinconf-generic.h            |    4 +
 10 files changed, 1511 insertions(+)
---
base-commit: 4de5110762b94b9978fb8182a568572fb2194f8b
change-id: 20241211-amlogic-pinctrl-22ea61820d0d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



