Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C02C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 18:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VRNRaSB4h1IZiSHti3Ff+SGGOCQ4KEN0BoYKYtSAbjk=; b=MKIT1MB/iW/+XusGhMZHslnqJV
	rl7xPMrjdxTz9ssfn1YpRZK5QsLAOqmpsJEZSQ/HqK086qpdZYLCFB3GVG4iFI91ZF4ND7a7y4AsM
	qY+Jj1zG7crcTgO2RPIBEAIPmX/lnJwu6ywICXj1xNMtJ1HsVs6gWH8Jb68v5Di9GMtSeol+R/1kG
	T2dmf0bJwsEQ+Dele23g2+wh+t9OG6JJtybD+ave2z3G6YbqrR0iKLnuGr0nhCrRzjLJfe9+XegKJ
	qXMYU/2By2lLpmabeJ51zAlooNcit0Kij9hkVFPGYxYHW2968Qjf839hE0CHR3BbTeEFTbPtGPxOS
	EaqHtBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkR3G-00000000Ps6-1eUB;
	Thu, 16 Jul 2026 18:43:18 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkR3D-00000000PqQ-3zF3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 18:43:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so15769575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 11:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784227394; x=1784832194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRNRaSB4h1IZiSHti3Ff+SGGOCQ4KEN0BoYKYtSAbjk=;
        b=TAxomSjLlxlp1IK1waXB+5VQPQqFmd0qUMiOtbYoeSAkd+CzQyNwoK7TExbMS1WDcU
         TAEHHfmCAOcpTi4TgGZNv5qvsmYXNB7dWVbByqpLlIoKhtytQ5N2g9BnpbQ8CyApGYTX
         MuOFa0Rtc3gjTQ6gFMZ/PujYw8YljfEyZeHodxzBsz36qcyOngoIvp0kv/PclTv985gQ
         8RbAo3aXSfH8Is7h7FGvb+v+G+upYfliugK2zD058sfQ7rR4YoObse6aUMRU8/tzW2+V
         S3/DP9yIHJXrtt8EoTsGNdROo7+zMTJ0wBhV99G6TCkiB9icM7FQDd0QRGY5R1W/75pZ
         5ONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784227394; x=1784832194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRNRaSB4h1IZiSHti3Ff+SGGOCQ4KEN0BoYKYtSAbjk=;
        b=HTEz1fn27XXSTl8FXQgYbgcDQ4oMdPbU2k8ZSu6U6HqV1xv4kgAibRJEN/jKGUNY53
         OvT//Ob7CqqdRAYRPhuMS10rW+3J3+QTlIc1evYt01xIONwwD6EvKU1J4QEnxnXINxI7
         9c0JiYlVkdATQytilGaNH/YjbV5nmImpPd/inxwY4P2cIjCjq8WHKOTuWo5UoCYDnXVu
         hUBIcSzucN/hI4D4bBIMRCgS3qUaAv20MXmkbULQseEpGDjGN1TRK5eqcbQ3n5f2E+DK
         OfJ3dH/OH8XAo8VVk8e/iLm59iKkYFcXKz7cqQ7uE1AWq+u/D9EARv03ovRCQdCBO4X4
         aI9w==
X-Forwarded-Encrypted: i=1; AHgh+RoyvIs12IPGa1eUtquFXAkbYt3j0KV3d4KqmCZAQE1ZX8TGP5sN73ikIfD/636zFP+FZRXd+rAuOk51M6W+Amzs@lists.infradead.org
X-Gm-Message-State: AOJu0YywNodS6rifG+zMAUFdyItPRMy4TRXSz4VFAlFG58mBOYoVhkdS
	vxDPTBRXp7Th0YStLnUK1rNE5eNW2/8BTIXijM3fJ2V39yQ4IGw8sGg8HMAhgg68
X-Gm-Gg: AfdE7cnLSKmhUsqVNgU21CN5DztvvnGmH+swWWcIhYSoOlrYPWvqmXBLOqbtiUFaaeH
	DxBniWbjE3to9o3hMpdHnj0hqCL5rHVL4yfZbE8S7MdzkFbXM+cwJoxdNqceoTlMwx8haYFlEXT
	VPlEK7nyQlqAojq25ANJJfkvGAhPmSIYgbIOkiZk3sSXF0ndumNplvVvN2RsMsvoAeU+DgMkrDh
	6OEoB8Q39JPXMoD9GXOxPM82CRY19OKHcAAooZhIgRpurvNdlMg+WWhrQJmTM7jQZLkuv5AiHqe
	hKieN+2Xm7ibjn5L7MkQcOsgD36Nx5Owag0HA3vqCTJO7sVdKkLPHpM2cgMFNnRw5amlKrtRjpN
	loMgFK7Iv5wUIh6+BXaDt26rP/oLPiKVzm/o07PCYcKh/GB8IXLGeddNknOZNVRmhub+OSg==
X-Received: by 2002:a05:600c:1f88:b0:495:50c:259c with SMTP id 5b1f17b1804b1-495483924b6mr7338445e9.7.1784227393689;
        Thu, 16 Jul 2026 11:43:13 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:b22c:3845:cef5:c42f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e7d799sm72404615e9.3.2026.07.16.11.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:43:13 -0700 (PDT)
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
Subject: [PATCH v2 0/3] arm64: dts: ti: k3-am62p-verdin: Add device tree overlays
Date: Thu, 16 Jul 2026 19:42:59 +0100
Message-ID: <20260716184300.85413-5-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_114316_005968_E9ED2E3C 
X-CRM114-Status: GOOD (  12.54  )
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

This series adds device tree overlays for the Toradex Verdin AM62P,
bringing it in line with the overlay support already present for the
Verdin AM62.

The first patch enables Bridge Tied Load (BTL) mode on the Nuvoton
NAU8822 audio codec present on the Verdin Development Board, combining
the two loudspeaker outputs for higher output power.

The second patch adds OV5640 CSI camera support on Verdin CSI_1 in two
variants: the current CSI Camera Set 5MP OV5640 with a 27 MHz oscillator
and the legacy CSI Camera Module 5MP OV5640 with a 24 MHz oscillator.

The third patch makes the MCU_UART0 (Verdin UART_4) reservation overlay
common to Verdin AM62 and Verdin AM62P. The shared overlay reserves the
UART for use by the MCU co-processor firmware as its debug UART.

Changes in v2:
 - Reworked the UART_4 MCU reservation overlay as a common AM62x Verdin
   overlay, moved it later in the series, and dropped Reviewed-by due to
   the patch rework.
 - Link to v1: https://lore.kernel.org/linux-devicetree/20260602141311.1366818-5-ivitro@gmail.com/

Vitor Soares (3):
  arm64: dts: ti: k3-am62p-verdin: Add NAU8822 Bridge Tied Load
  arm64: dts: ti: k3-am62p-verdin: Add Toradex OV5640 CSI Cameras
  arm64: dts: ti: k3-am62x-verdin: Share UART_4 MCU reservation overlay

 arch/arm64/boot/dts/ti/Makefile               | 21 +++++-
 .../ti/k3-am62p5-verdin-dev-nau8822-btl.dtso  | 14 ++++
 .../dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso | 17 +++++
 .../boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi  | 72 +++++++++++++++++++
 .../boot/dts/ti/k3-am62p5-verdin-ov5640.dtso  | 18 +++++
 ...cu.dtso => k3-am62x-verdin-uart4-mcu.dtso} |  2 +-
 6 files changed, 141 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-uart4-mcu.dtso => k3-am62x-verdin-uart4-mcu.dtso} (69%)

-- 
2.54.0


