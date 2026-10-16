Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C99BCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a+WpDzd7OYp8TJV8imDgncnEO+VG7E395HCXpXIMqtU=; b=qHsmwGPuA9+3tY
	WEkJIVIF7FQ3P4kqFncQbbFQzNZXzNuIhvLxRjyZZUqeL54RS17z5uHTdterZ1soPcMkdpjjc2kr6
	guZ1VrvmVS/S3udfBtCL0ptROhDCmWLStv0mYyy+dnLy2NFk/ngdbdu+8VPvo/pdY4pEPyO0ExkUl
	Hlh7A3yfDcYsHhfD7mz1gMo4Lf25MiWPNQzYQzpGaWRu8mqnduPdp8XwjY54JUfM70YXH94m+CcPt
	97Za0d6vFSYS6UU0X1/RldVLxaPVYuZN0S6wM3Bj7i3i9hnq0ZJ7niVC/fOl0jzi62VQsuhtSMOIT
	2y1kUt2STmWgjPUoEV8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfCx-00000002cjz-477w;
	Fri, 16 Oct 2026 10:30:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfCv-00000002chj-3lBC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 10:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=a+WpDzd7OYp8TJV8imDgncnEO+VG7E395HCXpXIMqtU=; b=fOgxHlV5MihCdglWYwdp7+USzs
	F2N1VUfvZCdYXdzjZGhOLG8+M4pwScKEel9jAum1Y793h2JPoWC4oCITAfXJJJigi99D4cosLx5Mp
	8w4znCb8xXWPbG8rYOYenBETycW/2cH1FKM0bETLrfB7y7DJj1Noyk/ISXOGJWUUmB6Brsn+UWWRP
	XlqnbG9HE7uVfCzyor11Ax6VQL5D1FmaRF+Wcr1o3kE4udnUmddXMd9mzy2Z+88IaM/LD1Me68kSC
	QRPAC3NMuaQRwcnrH3dV0bmMfHtBU7dbJOm7qJAXN5jHuJe7e2FkWjhRJQFj0vc2bxzDtvuAMtFf8
	+QM1WZPw==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHfCp-00000001Nkv-3cBF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:30:36 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso5781720a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146629; x=1792751429; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a+WpDzd7OYp8TJV8imDgncnEO+VG7E395HCXpXIMqtU=;
        b=AqMF6zfgPb07+FtQ/kgtGXB1cbCpV6zbrojlh9aOQUf7DX6+raHvQOh+kPTA9j5T0D
         lgXCCHW0gihs+OcCnssKhcRAMbyolvJo75eaxeK0g7OV+MgeLw/KMZHJcJFKZewLxBkB
         /9PE4WGSEmyVDDTMZcMz6Y2N70fXyihD+vsDehgeqCM5KZBg9QSOSp1ocJQP31bHfrVi
         gzdgdNl5/Y0Cq4SlzoonlX2/I5xbFtBEvZLtlPU4HQYJWP97I6gkWos6nDb8TlW+U7X6
         7y3VfB20DVzRj2EiGDb2veFGauIqhAJx6BbI0HCcZ5F0l4ReEs4Rf/qrkkZx/nG+n+CR
         SmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146629; x=1792751429;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a+WpDzd7OYp8TJV8imDgncnEO+VG7E395HCXpXIMqtU=;
        b=vswoami3qAqNEecsNRm4ZsrEs1uQyWqj6H0LKStfwIRKqRFvUlmKQYg0w7cpjNoQGk
         ee9b8ToQCmOiHT+eT7ke9XHYrec41i88EFekpYr5d8JWGDuxU6iRF0rc9ws8w0szM9wS
         FmGC8qizjo5Qg2x5Mj/ipwxVhMQ2kS37fjpmRSkMQxTHSErQbR5vhWJifPU732CJjw6p
         /phhFCt3TN/Yf83HWMMWhplnPH5wG2J3UzoecJKpiEAr17poYG5I3eyKQMleFr+idn5L
         47xJ2hhG/Fr06Ic4myHwreZ+rzM3H7IfZ6fNq6w5y13HMY++u8bcgw4+i3v9YtnjLY0N
         s7LQ==
X-Forwarded-Encrypted: i=1; AKwUvBwN17tiMvJsdm6K3KfOnF09rMeBJufnVor8UdbKnfHTUZpyJ3nkRtQnzwuIs7cJLAmHyKbBUITRP0bgcqdtgExQ@lists.infradead.org
X-Gm-Message-State: AFq9FYIIycXdZrzdG2aBjHZr95sf03ghrV0OWVevBCGgw31Twwej67bb
	gQ8hr5wgUC2tbUWbTBVGokZHA6o8Xz1DI/m/+S55S0tErcTt0euzbxEN
X-Gm-Gg: AYBFou14eZ+4zH6xsanOtWCxOkwzT2hxHh/V4zRIo35di+7AJAWUuoUETjQwJKMnFSs
	Z7V9dOkvdd6eoyBSBKxxT1C7uS9F/B/Xx9wp6IAIoRuWUFfO+9g6ibHf2c+LBSlgKghZzr9MYFP
	m5A3nIHbLh4P5fbDKSQSMGPIsvMTUuj1VwY0HUnpqCFTelbfbj9Bbv/g+ncfaCyHsaVkaZi4AGc
	j9rVfrwo1822MUrih+oMVec0Nab8PJa8Wf8rVo+HDDVgjRSzatqbmaDa486eVPIPnUYy3zimiiy
	dnT3giH/X+W3YFkpEEv+v+0mD4lz+vIu2QegbxjXmYkoeaBYHtQPM1wxrYW+rapEMaVVf/wjTqK
	KUsDh8NMK4KbOFoEe3rS2vFcwVCkDNGTfWKawa0oZZOesANl6tU8Y7lX1OBQuwu2bj457/rs1Lz
	r7PuVED15AUIEX8KohBM197LrCzo7hp/SyG0JPLK/FaftEmE5/4lgpmCEnmAWgU3IX2VqJUYQq9
	CIioXdKD/gQ
X-Received: by 2002:a17:906:ef0e:b0:c3f:c878:7c1d with SMTP id a640c23a62f3a-c3fc887c5f8mr325847366b.9.1792146629272;
        Fri, 16 Oct 2026 03:30:29 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce133sm60613866b.31.2026.10.16.03.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:30:28 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH v2 0/5] arm64: dts: rockchip: add Forlinx OK3568-C
Date: Fri, 16 Oct 2026 15:29:32 +0500
Message-Id: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIz80WoC/22NQQ6CMBBFr0JmbU0pGWJdeQ/DAsoURoWaFomG9
 O62uHX5kvff3yCQZwpwLjbwtHJgNydQhwLM2M4DCe4Tg5KqlrqSwt0rrE/CCCM1aoVdSaqGpD8
 9WX7vqWvz4/DqbmSWvM/GyGFx/rN/rWX2/mTXUkjRSmt7RItG42WYWn4cjZugiTF+Ae77i1qyA
 AAA
X-Change-ID: 20260930-ok3568-c-c095925b1e26
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Dmitry Yashin <dmt.yashin@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146625; l=2792;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=Ege0/EoNxjOYq/JSHXKRjvnL6FEhr0EiMU8LIrSzUr8=;
 b=gQMaPTFI9gCYRJTK2Gs8mv2HzZL8Bu9hcZ52inWpJiLiEgR03jDdpuRHrtWBGfnPpScKzLCtG
 VKmL8wHlDVMCtYsn7sviLOi6bVj8Ske/TfJX84rqBsFp1J7gmTO7CYI
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_113032_003424_EED497F9 
X-CRM114-Status: GOOD (  15.37  )
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

This series add support for Forlinx OK3568-C board based on FET3568-C
SoM (rk3568).

Patch 1 adds missing reset-gpios property to rfkill-gpio binding.
Patches 2-4 add .dtsi for FET3568-C and .dts for OK3568-C (depends on
 patch 1 to suppress dt warnings).
Patch 5 adds .dtso for FIT-PCIE-SATA adapter that allows to connect
 SATA drives to the board.

Note: tested on v1.1 board. On v1.2 RTL8211F phys use dedicated
crystal oscillator instead of 25 MHz reference clock from SoC. Patch
should be compatible with both revisions, as in [1] solution.

[1] https://lore.kernel.org/all/20250704-rk3576-rock4d-phy-handling-fixes-v1-1-1d64130c4139@kernel.org/

---
Changes in v2:
- added patch for rfkill-gpio's dt-binding with reset-gpios property to
  suppress dt warnings
- removed mmc-pwrseq. AW-CM358SM has only power management PDn pin
  for both wifi and bt. Using shared wifi_bt_reg_on regulator fixes
  bluetooth failure on cold boots
- added bluetooth wakein/wakeout pins
- moved leds/common.h to the SoM dtsi
- switched gmac's phy-mode to rgmii-id
- added rfkill-gpio for modem reset
- dropped unused wifi and bt pinctrl's
- Link to v1: https://patch.msgid.link/20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com

To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org

---
Dmitry Yashin (5):
      dt-bindings: net: rfkill-gpio: document reset-gpios property
      dt-bindings: arm: rockchip: add Forlinx FET3568-C
      arm64: dts: rockchip: add Forlinx FET3568-C
      arm64: dts: rockchip: add Forlinx OK3568-C
      arm64: dts: rockchip: add FIT-PCIE-SATA overlay

 .../devicetree/bindings/arm/rockchip.yaml          |   7 +
 .../devicetree/bindings/net/rfkill-gpio.yaml       |  23 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   6 +
 arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi | 332 ++++++++++++
 .../rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso    |  16 +
 arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts   | 579 +++++++++++++++++++++
 6 files changed, 962 insertions(+), 1 deletion(-)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-ok3568-c-c095925b1e26

Best regards,
--  
Dmitry Yashin <dmt.yashin@gmail.com>


