Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED4ACD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 12:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ulq7zD4ctN0+5WRFW+oZ1/qxY6rbHFNEsFrgeGiPH/c=; b=vnGxAfuWb+sOajJgZ6uzkAzuYi
	6mkAr+9CIfkcWNuz7XTvrrgYTlxe6I+Ib1t9LvBlHdx3acCvcmmdHeB8uvsqPviPLEBb5FwR8Nxic
	XVKy8FEoq9zzHxWHqOiqbWSWDscZTRKcjLWHejERSDVYJ1IcJKNHfW/gxTXihYLXkWUqG8SuL40fD
	Kt7xlmMKANDJMhice4T4YMNaxIAugWgr95GfhQ0eSb7OlvBlayucI0/OXeImdbL4SX+bvDQizFT3m
	8luGcJdAD1V8D9IAZORR8p4exQjz+PNIqLR/O+qONq5lgNaKPmSD76eVVb4NnIgB+SoEv77Kk4UU1
	GSa8KueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1sa-0000000B94V-0lE4;
	Mon, 01 Jun 2026 12:36:28 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1sX-0000000B943-3TlE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 12:36:26 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8423f53332aso422326b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 05:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780317384; x=1780922184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ulq7zD4ctN0+5WRFW+oZ1/qxY6rbHFNEsFrgeGiPH/c=;
        b=VL235ipEAdyoamaxmOMItG24hzmYhrGqZDa31yzQrZU8jXBOslqODFp0CaTwaEgn56
         8eFt4wOa7C2LbMQtinE13TBElwu1efHFammIJWblZA8uSq4L8WSN++d11aSPikhEhr06
         og00vLx7P+AEnEYnkyP5CsGgRk9VMNF75N30skSs6JEG7VcTx4wKsrM2D5plaauiD/JY
         3D7ocuLdp0rj51e4AgfqCox4rAbGwg1kcRO1btr/cplMUqekvvjp1ttnpG8WBFcNc3He
         i5cMuAnEHg0ioTDRwuTGl4cqXXd5KnOF6ep9akTaYLqGpmbJBRqu3IYXZvZC8c8Q6x38
         lC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780317384; x=1780922184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulq7zD4ctN0+5WRFW+oZ1/qxY6rbHFNEsFrgeGiPH/c=;
        b=bjIhjNmQp4egb0SpyyKTzTG57CYKuCJZL6EjnNA2j/iq2tuKxMiu0gXle32WGlcb6q
         Jeds4erMKcywh3jIQgZK2n9uHwdcx+buGHqioJLmCkDT5XLwa5OLtEauPvSu2+XxInoy
         +T5T/ybNa4lXCc17BMGIYbucQ8wNSq+04hVb5lO1gmdyAyy+OsY50Ga7fNJQE/nOuWmZ
         4ZG/kdybUrYhcoMYWzhGuXrPqiv9mKp3ViwPyyqHXf9t9PAjIwezPCcJilUEvVnRXgRb
         CjOJLFwktOaOSQw9hw0HZ81Vyb5KsipeRDzDuGFJdzVmTfCELJayIYoLXxM94IK56nM3
         STzA==
X-Forwarded-Encrypted: i=1; AFNElJ/4CcmPeV0qfl5J1uku1v+EejgqogsXeI1lPw4/re20ePNbqsDTmU2xZ/6paVz8yFptDi1fyG5v7/7cSjk+8pdx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3R8iEdQj1Wtr412JTPNaWJ08dNC+rCOLkcmhQ59jUfj6BOUZn
	yduruzNR0m/vQCUvBVIN4K+CtvqSsYKWeO5+lpnEmSEODd5BJ1uVoQvt
X-Gm-Gg: Acq92OEx8A/GD9VnYeqBfD9MedKA97tbWLfGphdYI4/otk3BuO1SuxbcwdreHPKmIaR
	HqVH3w6UGSPg6ZT7lfRz+6m8sRDD5nDCehfI+zqRxr7sZxkFk/h/60JSap82WClLClcNzoVgmwN
	Q7g+l1Z5cnWfqrIEPIq074t5FbZO2AVJtnu0b0hyFFOnwFSHCxy51xsceILfc5op3RvjnX3Tvt+
	Z7zou50hHpiCYALvUCl/ZwiGJAoEUu9OwPtwxaEAUakyKQObZs6jJaZgI0/c0FJjmxv0qR8sSul
	Z5msgI8Jn4/im1M9LiaNHqiUT9fd+mvuAp5710O/FqfHjY8w3SIVR1RVHfWlxR4wEObSxJAqTYQ
	2quvyp8ADD7k6dC34kNyw/AmsW92BqGbgoC5VtkZoO2StpXzkHCyBd21bnQuwxIaHzl9SDYFEEK
	eKwRat5RQfP41i+I5O6Gd5HZdldL35zEhQcd9e6vACBE7xbnzoSS0=
X-Received: by 2002:a05:6a00:4296:b0:82f:5726:be23 with SMTP id d2e1a72fcca58-8422575fed2mr10037266b3a.49.1780317384389;
        Mon, 01 Jun 2026 05:36:24 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8424defc024sm3765997b3a.47.2026.06.01.05.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:36:21 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 0/1] arm64: dts: rockchip: add Vicharak Axon board support
Date: Mon,  1 Jun 2026 18:06:02 +0530
Message-ID: <20260601123603.129679-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_053625_869080_CBD232F1 
X-CRM114-Status: GOOD (  11.69  )
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

This series adds initial device tree support for the Vicharak Axon
single-board computer, which is based on the Rockchip RK3588 SoC.

The Vicharak Axon is a feature-rich SBC targeting developer and embedded
use cases. It ships with:

  - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
  - RK806 PMIC providing all SoC power domains
  - eMMC 5.1 (on-board) and microSD slot
  - Gigabit Ethernet via RGMII (RTL8211F)
  - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
  - PCIe 3.0 x4 and two PCIe 2.0 slots
  - SATA 3.0
  - SDIO Wi-Fi
  - USB 2.0 host ports (EHCI/OHCI)
  - NXP PCA9554 I/O expander for status LEDs
  - Haoyu HYM8563 RTC

This patch adds the DTS file and wires it into the Makefile. Binding
documentation for the vendor prefix "vicharak" and the compatible string
"vicharak,axon" will be submitted as a follow-up to this series.

Hrushiraj Gandhi (1):
  arm64: dts: rockchip: add Vicharak Axon board

 arch/arm64/boot/dts/rockchip/Makefile        |    1 +
 arch/arm64/boot/dts/rockchip/rk3588-axon.dts | 1069 ++++++++++++++++++
 2 files changed, 1070 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-axon.dts

-- 
2.47.3


