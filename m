Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA53C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 08:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s5pkXftlXvhRdYHlKz/EuVjelxkUjgRyLILtgCBbsH4=; b=1wLraE5VjheXXa/IvcZd2dV+Ox
	mcSv8OxulhNdDW2C9XGD5cQjKgrGpBth/Wyjl4U3qY4TmYhxKXH4qElxzXBQfNK/w3OJXmFAnN099
	Qcdlwv5T6j3abmJFYM7r7ZRK5lK11M9cQcpRJeFBdkQKuZfivTSD8cETzPXp6C9mznsfqoBW/FkzO
	1uWp6W26tab1YGC4VjatZg9I8wOiA9Dpq+xZYNJRWELZs6innmTWNb7FAcJ0AtCqPBTJNrTjJDDKw
	6VfqlAA14hwr7FR0PFGj4m6jth5l6S1TC1MwOLKp5FUaSILh4nFDux6R425pp90qHyEyNnmKcCsG/
	tFjKN+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTWY-0000000Dd8u-1dte;
	Fri, 07 Mar 2025 08:57:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTOX-0000000DbrO-2e2l;
	Fri, 07 Mar 2025 08:49:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D5BB7A455A9;
	Fri,  7 Mar 2025 08:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F275C4CEE2;
	Fri,  7 Mar 2025 08:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741337364;
	bh=MqtpD5D8ho7ZkuHg72dZuTrsPAosUYbPrhtFmWLF0Xo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=RPwsIyEKTASpZtHU13LSfVb2jq09Pt6tF0Pm9N1Od9wP2ifPD+fT6F1sBy5OiRAMj
	 xNK+S0QIQ3Xg8a0gkG7M6kEqJp+/gWzALLUTZXx0E/ay2ktqkcqLcL7TNNxqIpuwjN
	 ERX4el/4ZApEa5VFPpTwTA6slUk0KzRAoELdVReP7AENvAY4GzcXoAIXj8Pc01yZ+Q
	 OLDyxpHW1iiVnjd+TcZba5w5dRZ0gm9osEm8Faw8e0zbzO0igihPwMrKfquf18PeuO
	 DHlD01rSo4KZJF6RvzYFi7uHoPac+EiHt2Wp6wWfuYp2OJBrq1yPPtauA8bw4pDEw3
	 aQ/giQuJTr8wA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D5AC19F32;
	Fri,  7 Mar 2025 08:49:23 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v4 0/4] Add GPIO interrupt support for Amlogic A4 and A5
 SoCs
Date: Fri, 07 Mar 2025 16:49:21 +0800
Message-Id: <20250307-irqchip-gpio-a4-a5-v4-0-d03a9424151b@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABGzymcC/23NwW6DMAzG8VdBOS+T48SM7bT3qHYIxoCltWFhQ
 p0q3r2BSzeN4/+T/PPNzJJVZvNW3UyWRWdNlxLhqTI8xssgVrvSBgGDQ+et5i8edbLDpMnGYCP
 ZBpggukA1B1MOpyy9Xnf09FF61Pk75Z/9x+K2deMI0L0ecYuzYD03EkKUgF3/Hs+faVB+5nQ2G
 7jgLwTrQwQLwkStAwJuif4j/oF4oEPEF8SJ8At4wl7iX2Rd1zvpttjbQAEAAA==
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741337362; l=1730;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=MqtpD5D8ho7ZkuHg72dZuTrsPAosUYbPrhtFmWLF0Xo=;
 b=jf2kjl2+fTJLAmql/JkT3VEHpbqntitDldAJPUz8QyCqBKYCjLRpFruPnhKEmVBw/RGfgz/SO
 wgJC8IuFyvcDp1wUcSQe8szaZvVptqOy7GprHofvxVqwwE/1tW7l5SH
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_004925_849009_87CE8AB4 
X-CRM114-Status: UNSURE (   9.06  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch adds GPIO interrupt support for Amlogic A4 and A5 SoCs

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v4:
- Make minor changes for bindings as Conor and Rob suggest.
- Format adjustment of source code according to Thomas's suggestion.
- Link to v3: https://lore.kernel.org/r/20250305-irqchip-gpio-a4-a5-v3-0-1eec70352fea@amlogic.com

Changes in v3:
- Fix warning when run 'make ARCH=arm64 dtbs_check'.
- Fix warning when run 'make ARCH=arm64 Image W=1'.
- Rebase file amlogic-a4.dtsi.
- Link to v2: https://lore.kernel.org/r/20250226-irqchip-gpio-a4-a5-v2-0-c55b1050cb55@amlogic.com

Changes in v2:
- Use if/then instead of direct modification minimum value for property 'amlogic,channel-interrupts'.
- Add register offsets to the parameter structure to reduce definition of a function.
- Link to v1: https://lore.kernel.org/r/20250219-irqchip-gpio-a4-a5-v1-0-3c8e44ae42df@amlogic.com

---
Xianwei Zhao (4):
      dt-bindings: interrupt-controller: Add support for Amlogic A4 and A5 SoCs
      irqchip: Add support for Amlogic A4 and A5 SoCs
      arm64: dts: Add gpio_intc node for Amlogic A4 SoCs
      arm64: dts: Add gpio_intc node for Amlogic A5 SoCs

 .../amlogic,meson-gpio-intc.yaml                   | 19 ++++++++-
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 19 +++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 12 ++++++
 drivers/irqchip/irq-meson-gpio.c                   | 45 +++++++++++++++++-----
 4 files changed, 85 insertions(+), 10 deletions(-)
---
base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
change-id: 20241213-irqchip-gpio-a4-a5-80c50a1456c4

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



