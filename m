Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03588CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 10:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o8iQzsybxThr4vBjL6O/h0dJfugpHWY8oKYxnchHSCA=; b=xwU/2v/M1EJ/duWSzTlK7kK2GX
	QqprIQ10iARqKwGhmtcZ+mc/IysQEHIbj9bN4tHcNjWaKqMnXg/0Npeeaen0iN5eXxjkulveT+6Z4
	TfZXhqt8ojWm1feecfLrQPT7CmzZypiWkPFXlHRwW3Wb5tgfUSPWqBRVyieSbRJL6A3SrFPahgx2O
	NqsTnhLL3zIjA3nkSq8gq9PuPf3BSJ/Dge6bzaOij/GqI8Pfm0Iwrn9+b3aWCcmMZ9ptu8HMq53Da
	9Zce0jxfdOWztW1Vl4h2JiD1RBW6q21rWxDgMYCefbDv5xytm+Mh7vFLpvYRPlJMQhX/6XEMrNk/4
	TdpwG9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV53w-0000000GYAQ-1v2z;
	Thu, 04 Jun 2026 10:12:32 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV53t-0000000GY9B-3Km8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 10:12:30 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso507610a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 03:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567948; x=1781172748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o8iQzsybxThr4vBjL6O/h0dJfugpHWY8oKYxnchHSCA=;
        b=c+OoHPpKczVY1AGpbE8fiZZVYBCwYSxk7G7yeC+xnsXb+94+cd0tBVASsx87B1lpHt
         2NCsf/uZBKlH5S8Jeqkr9vsKxn/zTBkGcgEZmd/5AhBYIOmInCXeLqvMBnfo0omorSFq
         rC0q/rShiI49Ec3LO9ibMkJ65EbMcqI6WPuptGIbirhgOKAs4HVOcA2NJ4pQirbB8u0X
         q0BBGa/zfv1NOwhADP2EV6uLl8Cf/rszCqRTteV4wnVDK0u4Dp3pHO+vGJNlBhNdNBTK
         wSZAdcf5cEJTTft+v1Epyptc9f014vX0cswPZI+UQFYIiz4pYDSJdFCeYCKPfj3Ycxbb
         DYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567948; x=1781172748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8iQzsybxThr4vBjL6O/h0dJfugpHWY8oKYxnchHSCA=;
        b=nu3pg5jxm7W4VQ37FlLZgB3w8aGYMFJj4pa6l2nsHe6DH606cibugd3c6SNuhnzueX
         73Ke2lybQ3OAOK0wtns6C2+/ewU4HOjI1IUIsISwKDhd6MpnhJoVQ567OOIM+wbqZMbQ
         TnSe7Fs+0LIRA3Ff4Hks2kA8bpB2jj1exq/poeOCz3J1r/RLAUTHVCjSmJOsKXmbUeHR
         QffZvbAiv51cs0Q6wgMybq66lmvogMx3H+rGKurCCBixKk6bBSuu0agnMI/JEyOVpaXP
         RX0laRPOupP3lwZ2Tz3Msc+wgtKN0eB5Am56UXYmKoS7ZF437Fl4Tp6N1/oiFezoMBD2
         8mfw==
X-Forwarded-Encrypted: i=1; AFNElJ9QLJU9MbdeLrdhULwtyGaMgij/R1EY0hFlusUZh32fIpu3/7isyW86RRnPiqnmzWfE4+99jTxEb60KNPm7HPJG@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa9m4Z7d/0sUZ/rte2KE3eqLIUUXc0ssWxG0UMtiHUj1V94If5
	14ssk5sFwNx8LBBDlrA86zfHU9mHWCNw5ae1IbNs8wh8jobxrT/ElY9yyEEFlA==
X-Gm-Gg: Acq92OHp4H0km9iAu9iUAKPSPtN0fXnjgFXagUvGG7DOMdvWF4bQu8RKBiCHHlSqL37
	rtu73dbfeEXb/4Of+ZVQ3MuBoU6jnWExcQIT21n77kPl+ScaqXtesQwzZWrGIxl3tqzrahhYpq5
	VdN2dgA6y8U2Ej+Wbx7UkGv1tdv81oVv4cNQAQru3on+oDPaRV7/KjS5gshxlzhUTZQ+q6hVWei
	ROl5RqxNZ8eG6FnDwUgHFxdPAYU8wyH7E7Xies/AyIWw9h/+1DDGnngwb3OfUAkU+pnxvLQHH1s
	Lev4tACkjfC82zb08a0JtFRh93vQWJ+7GRSWGZOsj0naqPsjox7N3kJmT1tBsdA/pvETR89lbyZ
	f/7Uhkf17v9wmwCog74i621OjjsjpEntECuuo041VmUyDmzFRVXTsIR6O8GLuQtwoWIgz0FCnXL
	ARwp60j58bDmkqN0vSrPfnIgeDeSapsPPQ9UNJpKYT91Xp8Zfoicq7VMfA56Q49TdxB+JtTZiTC
	TpGV3fPchNIArd5y8+PBB0=
X-Received: by 2002:a17:90b:3f90:b0:36b:71e6:3de8 with SMTP id 98e67ed59e1d1-36e34770907mr7588205a91.24.1780567948238;
        Thu, 04 Jun 2026 03:12:28 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a29cd6sm2483385a91.11.2026.06.04.03.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 03:12:27 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 0/2] phy: nuvoton: Add MA35D1 USB2 OTG PHY driver
Date: Thu,  4 Jun 2026 18:12:18 +0800
Message-ID: <20260604101220.1092822-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_031229_828515_916071ED 
X-CRM114-Status: GOOD (  11.09  )
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

The Nuvoton MA35D1 SoC has two USB 2.0 ports:

  USB0 is an OTG-capable port.  Its physical signals are routed by a
  hardware mux to either a DWC2 gadget controller or the EHCI0/OHCI0
  host controllers, depending on the USB ID pin state.  The DWC2 IP is
  device-only in hardware, so all host-mode operation on USB0 is
  handled by EHCI0/OHCI0.

  USB1 is a dedicated host-only port served by EHCI1/OHCI1.

About this driver:

  - Runs the PHY Power-On Reset sequence, with a guard that skips
    re-initialization if the PHY is already operational.

  - Supports optional resistor calibration trim (nuvoton,rcalcode) and
    over-current detect polarity configuration (nuvoton,oc-active-high).

  - For PHY0 (USB0) only: registers a USB role switch that reads the
    hardware ID pin state from PWRONOTP[16] on every query.

Joey Lu (2):
  dt-bindings: phy: nuvoton: Add MA35D1 USB2 OTG PHY  binding
  phy: nuvoton: Add MA35D1 USB2 OTG PHY driver

 .../phy/nuvoton,ma35d1-usb2-phy-otg.yaml      |  79 ++++++
 drivers/phy/nuvoton/Kconfig                   |  15 +
 drivers/phy/nuvoton/Makefile                  |   1 +
 drivers/phy/nuvoton/phy-ma35d1-otg.c          | 264 ++++++++++++++++++
 4 files changed, 359 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy-otg.yaml
 create mode 100644 drivers/phy/nuvoton/phy-ma35d1-otg.c

-- 
2.43.0


