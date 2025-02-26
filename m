Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4FEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 05:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X/r4DGPGp9EXGFP7w++mYXSKv3H1csntkRDRDVUiTp8=; b=GBhYwSK+m9PrLN0V07EZhbPKd0
	MPhRzLpfT9z+w6hFLvEgJD1Ad+3SV1uAIHIEggX1ASR/lH2WmC1AgQXZ1H6q3gK89HlU4fUoPuxKF
	+NxemxX3MoLXpWvktXBujyTluXW8i+nU6iIb4yTMeriAhfFrmdLTViASZq27nG3M8/kqbP7RjoQ+u
	cu5pze+5nzsLmESK0rq3nJ0KCUZGDFvgoWCLIOkhPB8JU4nS95cSqHlOqiKURColD6NFhgjeoTf5p
	wt0RPDSwTkm8hJIk5OkYomhb2KX53tysxzMMmsTczgYtAWmLvH+7L7De8GHQY1OBvH4U+NKX4l5KZ
	hITDCxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnALt-00000002T0s-2Fca;
	Wed, 26 Feb 2025 05:53:01 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAHP-00000002SAj-3QWO;
	Wed, 26 Feb 2025 05:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7696A61217;
	Wed, 26 Feb 2025 05:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C527C4CED6;
	Wed, 26 Feb 2025 05:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740548893;
	bh=W4cG0I6SC0UXlixxjcHeRMiMZh89LfPef6m5P4FVaKM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mzLk/Bc4GavyLp3fZELxMVE13UA5Xk/wVt2hPA2sPZgv0ePh3XGSDugTaBSzZ16Uc
	 lxStqO75MlaRKCm0FRVkVtc3GqhsqgGk3TEDhf3FSlxGM3wyi5ih0ASijPEwpRYe5M
	 qAnbTCJTmvmoc26lhCSoWI5j/hBHruq8PNzRIwTWIn2M0WJVEWVpPuGn56OVWOSgE9
	 4mSlGJgZ3UhGVh7naicQpdPVz/kMiHYwU3kE8ON61Fvsvrwlfs2UwKMZe3D+N1NhjM
	 WEER+s68Gy1fpSvYi0IiF9Dq6/kp+2pAFh22GIZrOvhtdk3AoXE5hIIW8sZVFTDnXU
	 wgwJ/r2VKL8ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242A2C021A4;
	Wed, 26 Feb 2025 05:48:13 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/4] Add GPIO interrupt support for Amlogic A4 and A5
 SoCs
Date: Wed, 26 Feb 2025 13:47:51 +0800
Message-Id: <20250226-irqchip-gpio-a4-a5-v2-0-c55b1050cb55@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAervmcC/22NQQ6CMBBFr0K6dkxbpgZdeQ/DohkGmEQotoZoS
 O9uYe3yveS/v6nEUTipW7WpyKskCXMBe6oUjX4eGKQrrKy2aKypQeKLRllgWCSAR/AOGk1Oe4P
 uQqjKcIncy+eIPtrCo6R3iN/jYzW73XNOW3P9l1sNaKipYUTPaLv+7qdnGITOFCbV5px/BpKph
 bYAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740548891; l=1226;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=W4cG0I6SC0UXlixxjcHeRMiMZh89LfPef6m5P4FVaKM=;
 b=21MSP023vePsJIFViASdvu1jq/DZsq1/wWCZpFg1Gjyj6vbfksgiXFJtl7pyPUeCZ+NDXhfSe
 J9bXHNvSBO/CUOfVCpktz6AZhXdGcPn3xnCRxnAf7AywRA8IazHiP7h
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

 .../amlogic,meson-gpio-intc.yaml                   | 13 +++++++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 21 +++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 12 +++++++
 drivers/irqchip/irq-meson-gpio.c                   | 42 +++++++++++++++++++---
 4 files changed, 83 insertions(+), 5 deletions(-)
---
base-commit: 953913df9c3ab6f496c6facd5aa7fc9f2f847ac2
change-id: 20241213-irqchip-gpio-a4-a5-80c50a1456c4

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



