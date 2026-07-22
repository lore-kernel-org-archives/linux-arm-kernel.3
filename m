Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE59C4453D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e9aAGd8HBtSs0CyHVA1cqr8BBW3AKtLoj7xoH2q/MK0=; b=HNTHfnAfRGAShzM4KYt9WPi2JW
	86GdtwTVQT9SI/q8P5pGpYq0oT7gVe0JkZ6GTChCGD9CPUMe1Gs+2lqPlRmlfT+uXy6lr3ehfE0Sy
	CoIUtY+Z5saiTVKjq6dCd9XRGKivNzif/RrllA5/n+ndI9IPznfizeGslqrys2GrOYhFboBwAbIkX
	+f/jOLPJbiMivmjYu98glDqtLdLMq+WRmwXzNs6V22sv0nEkBMQt2E3ygnJj9PRIFGYj301SZFdWl
	kgzuU2rAMAHGwdq58fYfnrSalvE1n322kM5al3Vh8h6dGOWMnXsCQCCysyELGDujptjzB6r3WiRxA
	Fp2lJwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSUL-0000000BHQT-2Y6i;
	Wed, 22 Jul 2026 08:39:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSUL-0000000BHPs-0L40;
	Wed, 22 Jul 2026 08:39:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93F1A43272;
	Wed, 22 Jul 2026 08:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 691D8C2BCC7;
	Wed, 22 Jul 2026 08:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784709576;
	bh=QQCi8joyIQJkB/7W6FFWGEeP6YN+mclhm8poIQ026HY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jcW/b/cIFCOrDCNQFMdgN0r8V5wQB4EfkdIp6CaIsRNV1hO9xl2l4LlQDcmbxTSop
	 xnz0aw9HdjUJQbXo5dKpv5pBUsbr0Zb1ZYUQYhK9HqAghw+m8VWTfgPNOb7bBk7/UV
	 ZD1eWHzyp8Ln/YmKhmoF9DtSGFWjAaeJvoCqzsa7y+b5ScCDmF3L1K4UG1JMmH1PyC
	 E4caJATseBQop5g+pTcieeQkaVKbKPYNC5FDS3mCJe8LfZDM72dWS53wQhbbKAQXax
	 l5u+k8huQMhSA7ZZPmO9rVQJjBaTDxXwUbBXYAUkznZiTUC/NkFBFzH2Uc1xMvY6XP
	 QiLhkV+pU50Jw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53711C4451C;
	Wed, 22 Jul 2026 08:39:36 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] Power: Add power domain for A9
Date: Wed, 22 Jul 2026 08:39:30 +0000
Message-Id: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMKBYGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMj3URL3YJcXePUtCTjNKNEkxRzIyWg2oKi1LTMCrA50bG1tQDAyC7
 HVwAAAA==
X-Change-ID: 20260722-a9-pm-3efb3f2a4d72
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784709572; l=814;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=QQCi8joyIQJkB/7W6FFWGEeP6YN+mclhm8poIQ026HY=;
 b=WLQ47soAxbaZK576/tY+iiZaJ+qwcSMeFxILfLIWBKgQ9gUpoJkMTVFTUiaU9RzgZsL9M+dAC
 J6phS4teZz6CL993sARjLs4UT/eYb9BYbCni9oX3A4iZJRMwX2xfUXU
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
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

Add power controller driver support for Amlogic A9 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (3):
      dt-bindings: power: Add Amlogic A9 power domains
      pmdomain: amlogic: Add support for A9 power domains controller
      arm64: dts: amlogic: a9: Add power domain controller node

 .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  1 +
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        | 10 ++++
 drivers/pmdomain/amlogic/meson-secure-pwrc.c       | 69 ++++++++++++++++++++++
 include/dt-bindings/power/amlogic,a9-pwrc.h        | 61 +++++++++++++++++++
 4 files changed, 141 insertions(+)
---
base-commit: 544455a3a844edd6107b15cd0ab0b657399f2d49
change-id: 20260722-a9-pm-3efb3f2a4d72

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



