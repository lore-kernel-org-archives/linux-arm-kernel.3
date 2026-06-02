Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F766CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7im3CUG3zSzSawz5dX5Ezc+o8cBVuqZtJiTJ2Y8aJ68=; b=wQydPAJqGfHLb0LoRNWjgaRdj3
	MW1ySBT2+InXc/oB67UEz5/YFdKb1Vw1d7HBzC831U65L2wgJuAsStqCRwtKL3BDEEos+6ig3/BsE
	vhYtT76wSDljYKXhMMLpa3vt+Gib0LpSX57ZAqXGdgV3vkur8WZX1tsUuo6M2HKdBI58/tpMyF+jA
	A0B1sWVzm2dlA/eloAWUlPLLq0d8GgiRZxUZwmEkSxjE76oBpHg3DoeR0G44O1v/sIlZmDwItmplE
	R+4Entk4SZXbIKh2oUiSFrYajsQ7D7NDpJWxTJkeZOGsw8SqLdxNyB6ggc4eonb7znQTHM3FLaMDY
	nXNDLu3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNep-0000000Cump-01hA;
	Tue, 02 Jun 2026 11:51:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNem-0000000Culr-2AuX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:51:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490af320e2aso13448195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 04:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401098; x=1781005898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7im3CUG3zSzSawz5dX5Ezc+o8cBVuqZtJiTJ2Y8aJ68=;
        b=W9GE2XOCRyaqREowN6asKsM1JAEDiFmjZbflM4UxEXTpE9P72kMtTtQZD/KkM3DX7B
         Q+UsXsCJADXS0w9027BY3jom7cJbBv5XBfURqEbdY6RndP0H5sM1iMetIFxynEOAjL17
         a9BcMWyraY+FQ7x0UEPmrSR4qkqaY9LhtG5Cqj4X5M6AWsQ3b3IcR2KFrXDGtTLAWRu/
         00IrbCxKHOsqBGOAI0s2kfcENTyuPaDApkszpPh4NNm4fgDF/rr4sGHnMlwa5gRQUHmY
         A1EFBV5wACnmJj8vthpnt55X6B/jIVRduNFqNin9cqqi4wNeYhVcHOsN8nNDvTGFYv3d
         zLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401098; x=1781005898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7im3CUG3zSzSawz5dX5Ezc+o8cBVuqZtJiTJ2Y8aJ68=;
        b=laxZs2kN8tp58NFWTww5HCSGQSxtupZqzfc0wGpx5hSDRcEIHexcTtX0OtOlKf2eYe
         dMjlLq4V1yVhJM0R51b7K5VM7SOyFArVB9kjAbKP1M6/5uvaRUXuypn5Jadv+OTN+bDC
         NC/ftrAXQPQZQpPaAf7eMLw5ksVBnzk1BKAKu91xjNgACsf3lG10EIyVkeTMHW7CzD6k
         MNMWUb5JacG/OxACYYu5jPtfs5o0ZtGA8HLfhZRCoMXEA+alyaryrmyAM+JjYW8in7zz
         7LXsDMm7p2myAcr5WNBtkM3jebBPa8hgdp7qCJVRslvzL2La1JE5vmvZL2SBfceZE9G5
         KFhg==
X-Forwarded-Encrypted: i=1; AFNElJ/19BszDKcnowGhDpRDJ/L2R2LTf99Bsu3UV5R8YRXb94KV7xgolp0SfHAJI87/8bwpstYiSs2aiwQITUZPlFKQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxkDaAuogrddEFZptNoaKadDdM/mE4eslo4iIniM3ELSGD+L92a
	1JUEcJu3EoNKhb79+Whkwtqjw0BlwZF1cHd6stjUltZp15pq1DeSIvqP
X-Gm-Gg: Acq92OHaPNEiHvdRtedc0a65WisFo1ehP/8fwvyjXYMrtPNECxZ/Z5lGJJiuQgsvDsv
	/ZganLFpT5qDkYHgZOSIcvDuPw4oOFQ1FMfmfScC5LFLdMAVjbAtDFkxnUun+LOR/IfowMg+t/3
	hAx4HF5CuXdQ6KJosdbQ10LNXvRzZGQXVPH6QzxbpSMOqRMdD3uDgqfLT7ESsi1pWw9iEu/xvb/
	/h/dZYYEeHbVFov+2B9vUJbnUrtMpV/i9DhnR54+9rsMGFtHTaTtjsvcnC7B8N22mqdC0IItYUl
	Xe0y3v0e0C+6dCvtZ9pBrC4Zp809U0tuuhImn0+Jq9yi0cPPZ0cdw9ENweuuM3h57x4FFBh4x4J
	IvpHL1YpHugF8SJ5V96BNolgw7uKnkQFPGSs8YwTk3XTVFCDVQmBSHlQrvxeiGKMjcnFGrd6VYW
	xIooyo1yL82orDqrZOlLxGVaGZ5U67/JpJHEoV
X-Received: by 2002:a05:600c:3b10:b0:490:b0df:9eac with SMTP id 5b1f17b1804b1-490b0dfa72bmr59783675e9.3.1780401097928;
        Tue, 02 Jun 2026 04:51:37 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm139480015e9.9.2026.06.02.04.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:51:37 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] arm64: dts: ti: k3-am69-aquila: Add display and peripheral overlays
Date: Tue,  2 Jun 2026 12:51:23 +0100
Message-ID: <20260602115123.1324474-9-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_045140_581739_1B464BC2 
X-CRM114-Status: GOOD (  12.18  )
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

From: Vitor Soares <vitor.soares@toradex.com>

This series adds device tree overlays for the Toradex Aquila AM69
platform. The overlays cover display adapters, DSI displays, and OV5640
CSI camera modules available through the Toradex accessory ecosystem.

Display additions cover three configurations:
- DSI-to-HDMI adapter based on the LT8912B
- DSI-to-LVDS adapter based on the SN65DSI84 with the Toradex Capacitive
  Touch Display 10.1" LVDS
- DSI driving the Toradex Capacitive Touch Display 7" and 10.1" DSI

For the OV5640 camera overlays, both the current Toradex CSI Camera Set
5MP OV5640 with a 27 MHz oscillator and the legacy CSI Module 5MP OV5640
with a 24 MHz oscillator are supported.

This series depends on the Riverdi vendor prefix and panel-lvds binding
patches, which have been applied to drm-misc-next:

https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3764568dd2e621850c8c2a34dd8a88096ae73e72
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3c3c5fb9b36836d279ebe370189d68a0a3387362

---
Changes in v2:
- Fix missing main_ehrpwm5 enable in Capacitive Touch Display 10.1" and
  7" DSI overlays for the Clover board.
- Reorder remote-endpoint property in DSI-to-LVDS bridge endpoint.
- Reorder supply properties in OV5640 CSI camera nodes and rename clock
  node to match binding preferred node name pattern.
- Link v1: https://lore.kernel.org/all/20260529120853.636015-9-ivitro@gmail.com/

Vitor Soares (7):
  arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to HDMI Adapter
  arm64: dts: ti: k3-am69-aquila: Add DSI to LVDS adapter with 10.1"
    display
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    10.1" DSI with adapter
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    7" DSI with adapter
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    10.1" DSI
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    7" DSI
  arm64: dts: ti: k3-am69-aquila: Add Toradex OV5640 CSI cameras

 arch/arm64/boot/dts/ti/Makefile               |  43 +++++
 ...la-adapter-panel-cap-touch-10inch-dsi.dtso | 155 +++++++++++++++++
 ...ila-adapter-panel-cap-touch-7inch-dsi.dtso | 155 +++++++++++++++++
 .../ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso  |  18 ++
 .../dts/ti/k3-am69-aquila-csi1-ov5640.dtsi    |  76 +++++++++
 .../dts/ti/k3-am69-aquila-csi1-ov5640.dtso    |  19 +++
 .../ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso  |  18 ++
 .../dts/ti/k3-am69-aquila-csi2-ov5640.dtsi    |  76 +++++++++
 .../dts/ti/k3-am69-aquila-csi2-ov5640.dtso    |  19 +++
 .../dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso    | 115 +++++++++++++
 ...la-dsi-to-lvds-panel-cap-touch-10inch.dtso | 142 ++++++++++++++++
 ...m69-aquila-panel-cap-touch-10inch-dsi.dtso | 158 ++++++++++++++++++
 ...am69-aquila-panel-cap-touch-7inch-dsi.dtso | 158 ++++++++++++++++++
 13 files changed, 1152 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso

-- 
2.54.0


