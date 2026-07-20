Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F5CC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XAmw1oHNGHlX7bZ3goPBDmA/lFIhJInhwupNS3Y8tnY=; b=yz74vOQZwRrNl0jScDNhMYhMIx
	rDbAWuGQuL19b1uJhqvBCgrXebKyLA2FhaCguN+g9BP2wQnnfxi1C8ep9zLjFMzGQrt9ZsMHp0UA2
	RcEYiEgkJu0eR4vniTA2cT2fOdrZozjT+nXly1q9K0VnrCyoWHeGgE0yr8CF4ixsk4nuvb+A/hA+k
	9J6GYdxz9NuugSNVE6EglT096grV2Rrvz1Wg8K+Y5kZ0VtroQEWHb9IWzLNQ+0j3Hjsos5fKZZNdu
	/SnBdLgm1jEeK6edmEtx1Mc6oqa3EsHESyQyVeMRt18mXv55ALEGk+sfvG05mUo2UGPb40bWSbojZ
	EQfssUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wll8r-00000006TWS-0q5Y;
	Mon, 20 Jul 2026 10:22:33 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wll8o-00000006TVY-2ZsE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:22:31 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so9296627a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 03:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784542949; x=1785147749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAmw1oHNGHlX7bZ3goPBDmA/lFIhJInhwupNS3Y8tnY=;
        b=ZW862zf2W7SUQ//W7Ii13NXQBO9jXSKGr6t94PSlSHYuIYZo3qCmshim5qSAFzaipA
         5zdcSAn2z/OmOWIT5PGqF/K/3dSxQ+kNb/wmlw4TE8UcGEMwq5wSfeILPp6k57Oa4fI/
         gNYHZo0HUApw+H4ok/iJ7XOrweWGbV6QV6YL0ikgqWmZ5i0c1VAA4srGWt+xsd9loMrt
         eIPnfEfSIp4OZMuN3fCcMZhVh2U2kHJi9/nHwRGFpOIH91NRXP8Fm6nQQvtCpGxg3Hb3
         C3Ltwhvc4d7Dx1ERAP6POEdz8Hnkbqa5+4j57rIh2GDco75oBWaS6UaB1ViIg/dvjTIk
         yANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542949; x=1785147749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAmw1oHNGHlX7bZ3goPBDmA/lFIhJInhwupNS3Y8tnY=;
        b=h/9RXHUFEDU5eAltq2piOw+ntSwrHAmdJJAxlonpvKyAT+sSinLXVeMusDuFRATtSL
         bTJ8ngXMBOBKeSKdDFlzdtUoPWFNDNf31zOdMtcYVu5qDfRoRBkDbU4+7Gry9ZYVnGpp
         bKPUF5JfgQHE+ClzUy1bhSC2kiqmBOJGiqom+8tAa9iodaD1JGfdhi+STU8+xbniuOKX
         d3D+ICoxQ/8U0jizyIPEkDbaxUgJeE+c3z3zD8+gklQ2pPolwE9rSn1t/eAcWjxhN4IH
         t6up9OFUw7u+bSx2anRDvXqGzULDQt25D2Z2ECEBSfxTcvm7WkfpUwc4rpMwx9fhucuf
         Hvlg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3PrLwlXeboZHOulqDV70B4mCNa1yZnSKM4uKjpYOx960DhLCySwf7VSbKgavUO8SEOl4N9ErdtZLCDWiTrj8e@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv7/GaYq8BR5Z6sVWqeg0cD07O8DVN3c/G+oyqTNnErH0RVAz0
	/9orxB6M6l8xU5xoYcQ6WKk0o9IAh3mStdjB3YxDzCdm6sEtPED2kbbDOtKvbQ==
X-Gm-Gg: AfdE7clWPu8aCAQ6pGCpf2wvlMIVNLogH/SkrhOfzi5PVXvxFjU5uieXSilL/I6C6iL
	hXiGiwUD2jyoolALamWVRVRw4RLppbwoqzzN4TsTFnCfnMhQViNbIdNTlmU0T2huDJfSjqjLh+0
	tifYtOXWHfwblHrZcgzfdVOuj2Sz7Diwl4PSrGnYKOuEzXuzyohjE0fxjAvsEPAsEcjYPnCWtMA
	QCfcJHP8DMIjMf83pr7lW0e9Fx7nyP5TxRGlN1h2pk0PMeRr/bJWqWa2vYsE2dwY4CSfFVncHut
	E4Kgf6J+oN2i4ijQuthq3KPYomrbniU3xDCPkWyTnC8YxDXscdQZ5l0gwCLKn72cU3fuVvEpY0J
	Nkz44x3RNvlQnBeftdPmeoMaH4rP89rrggsLQFpKl+v6pRwk9Z7A/0fi79NJHPq7ZqulwW/bHnr
	u6Qg8uJwGgOpQrYAfQXOJOHICRLo7/WndPPQ7lrWA34sHKHlkCzLXAlnJcnUkaWzU=
X-Received: by 2002:a17:90b:1d52:b0:38e:dc4:3f64 with SMTP id 98e67ed59e1d1-38e4b5860f9mr14233192a91.38.1784542949254;
        Mon, 20 Jul 2026 03:22:29 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b20df7esm5616125a91.13.2026.07.20.03.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:22:28 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v4 0/3] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Mon, 20 Jul 2026 18:22:19 +0800
Message-ID: <20260720102222.251179-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_032230_658103_C737DF28 
X-CRM114-Status: GOOD (  11.02  )
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

The MA35D1 SoC has two USB PHY ports managed by a shared hardware block:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller and
    the EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    USB0 signals to the correct controller based on the USB ID pin state.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

This series extends the existing phy-ma35d1-usb2.c driver and its binding
to cover both ports and add OTG role-switch support, while keeping full
backward compatibility with existing device trees.

Changes since v3:

  - dt-bindings: add nuvoton,rcalcode = <7 7> example to illustrate the
    optional resistor calibration property; revert redundant clock example
    change (back to USBD_GATE as in the original binding).

  - driver: handle -ENODEV from usb_role_switch_register() gracefully so
    that probe succeeds when CONFIG_USB_ROLE_SWITCH is not enabled.

Joey Lu (3):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  44 ++-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++++
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 284 +++++++++++++-----
 5 files changed, 389 insertions(+), 76 deletions(-)

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.43.0


