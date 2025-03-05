Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDE9C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i9viZYqeMX/aeCk2MVnU/RK+AW7R5iqtLpSVqk7yiGU=; b=fC6pjep4DPwdC4bR+yOUnQD3Cq
	I1lL0wQrggA+5fUSft9q4tTCuktNXeuzsB9yWLFF/udB6a/YQN6S+kUBjzQbN6v/3IfZ0n/okkUXg
	NmHCU5P0t9v8KHvBT0N0qNOMnKkzVvqoP+hNe+2X/ONQZ4D6fiGQiJn8v9LFpQNvbRQkfKHL4Cn9U
	E9HnKMfYotVx316QLZJ9XUi/RiO+2OEOqwW8gOP0MvdtLAW1onrs4Uu1wttHao8LuzkpnPCRh8XhW
	3vmnSfpiiGmCkLUrYvPgg7eBjAfS1URWBEMCcfaqdnLtCPMoj7NobBPNQI7WEFZFeU+mY7l2ACFii
	K0IPgp8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoAy-000000084K8-14wr;
	Wed, 05 Mar 2025 12:48:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplam-00000007bXz-0xut;
	Wed, 05 Mar 2025 10:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Reply-To:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Sender:Content-ID:Content-Description:In-Reply-To:References;
	bh=i9viZYqeMX/aeCk2MVnU/RK+AW7R5iqtLpSVqk7yiGU=; b=wYxm8pL5QCXGYJ3wnzWXDVLhbs
	CkB2587WdUm/2XqlyVMpXeLpOeW4UGtruBT8TqHGc6HAC2icsSdZreZ+ucW34EmDe3j0T+tykNh8q
	ygujUw4Jpao3Jr3vybAgkBG9qE+epMRbWsj4e39W6kpmWO5KWzD3mse/7Q0U/KbskLWYfvvyrU2u2
	2xh7K4mVSN/OVPzXKMwcMlVm4X3kmr8YkW2XmmGHz4o4dXOQ+SZ7JwPG1OE/TF9+oOx/7NTRZR3x9
	PwA5SgXrO8EWkK2lw5BkizlaVkOPPlANWHAS6/uqlcA2K0pEW9OSiazk97e/b3ww3JnwiOdAGW2mg
	b7anRjXQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplah-00000005Fk8-2Yhb;
	Wed, 05 Mar 2025 10:03:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF5A65C674D;
	Wed,  5 Mar 2025 10:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EAC5C4CEE8;
	Wed,  5 Mar 2025 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741168979;
	bh=1g440IuVdvferMaa49XKcEufmSsf3xpIra5Mss3ih/M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LaDPFs9wiyXd+cQgs4520fdnBGhhAjV20d6LnUj+PqKEniG1pw4GarBt2FldqrVQJ
	 +lYJPOEccq9GFKKadnvVMW87DwwQUPRnyko2hzfautgdcM6tLp3ZdJbEVAMKb/D1/f
	 aa6Yem9sqmNQGSZZ1DCQB5Qj5XUYjare8q+lfKv/QqktC1fxnw3/X3iPuSXk3EP/Lz
	 hAGJ1C2jsqJCkx40nqjzgfBnqfUkqnl8cJfuiX+qbXHXFzAweh/19tMd76k+89DGgE
	 0DiWy3DKpLMJSVdSFqVLSO22IDRPoayv0WWi6Y0xFimC4JmSa35fYx2UePIB4dNp2n
	 iAj8ZMXneFh+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05484C282DC;
	Wed,  5 Mar 2025 10:02:59 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/4] Add GPIO interrupt support for Amlogic A4 and A5
 SoCs
Date: Wed, 05 Mar 2025 18:02:55 +0800
Message-Id: <20250305-irqchip-gpio-a4-a5-v3-0-1eec70352fea@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFAhyGcC/23NQQ6CMBCF4auQrh3Tlg5BV97DuChDgUnEYmsaD
 eHuFlaasPxfMt/MIrrALopzMYvgEkf2jxzloRA02EfvgNvcQkttlFYlcHjSwBP0E3uwBixCLQm
 lVQYrMiIfTsF1/N7Q6y33wPHlw2f7kdS6rhxKrU57XFIgoaTaGWOd0W13sePd90xH8qNYwaR/E
 F3tIjojhNgoiZIaxH9kWZYvB3S4ZfsAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741168977; l=1486;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=1g440IuVdvferMaa49XKcEufmSsf3xpIra5Mss3ih/M=;
 b=v148/pWMVfxrubeqy83sCyRkyelbM2gzK8tehnIW/gbWJObeuEoCq0Zbc/PIJGm6f6FC/EJx/
 AAG597zMpDNCrYpX6lGmZxdULCQv8lP/YooM/tKmazoT/14nKoPXuVZ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_100303_905011_7010DC17 
X-CRM114-Status: UNSURE (   8.78  )
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

 .../amlogic,meson-gpio-intc.yaml                   | 21 ++++++++++--
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 19 ++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 12 +++++++
 drivers/irqchip/irq-meson-gpio.c                   | 40 +++++++++++++++++++---
 4 files changed, 85 insertions(+), 7 deletions(-)
---
base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
change-id: 20241213-irqchip-gpio-a4-a5-80c50a1456c4

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



