Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D694EE9B37F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l6VEiHbbXrSXnpEA233x9tN4NxHrbql59kNg3szndqg=; b=mOjwEOVge3o7nswhughr2hLeJm
	eiNjVnXMk5Kel/xSEZCw2KUpMZwVQTN6hoHZtbBoFPJS8ONL2EONuqByiYoE13I2//4N4rBCN8snE
	9JlzOHlsMB8l9O16eKQjHJ/EcpgsQBmye1iXvyHzl3zWRAiClzJUxN8QEMKsJ5yfhQoY9Z4cPUrR2
	fWBg7mIVpni0JsT9q71xTV5VtIPWZswXlCQ6qS2DlgNpdzfkgWEafXyyGz01dXCt/nZOwjukNpVCh
	xM3UlI+mNexiaQ43U7CrFr1QaviJqdktdDSRV36Ze0YjRULyH76NODno2TyTGkqDHlN0RRoa1tY0Q
	OVq/RKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3Lf-0000000D7Xw-0vVi;
	Mon, 02 Mar 2026 13:30:11 +0000
Received: from mx-relay36-hz2.antispameurope.com ([94.100.136.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3La-0000000D7WS-3zyT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:30:09 +0000
ARC-Authentication-Results: i=1; mx-gate36-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=l6VEiHbbXrSXnpEA233x9tN4NxHrbql59kNg3szndqg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772446581;
 b=p3pDtcP9e/KAow6xl8Sjai9n2HyqTBksYxt8Ws7KImju1HcCHX9PkAa+d2v+wqXjtFW8lDU1
 NAgZP0JR4DlOnJUDAQtsTbjuSZsbv2eF+U+PPXOrMY+1Y7eo7rdEOpqD5PP3t6/5NvKjc2S5LUM
 4ZE3EPZZlsnN+ubPiO8TexN35BbPA7LyZznNVxxe+3SHbeFGJREFHq+aCE8Xge+mlEyS+/YXcND
 LoirbI7ewYVekFkQW5P+UsZ/x3+5Q2lbQiTGlzRoVj3SqLJRm2GP6lgd3E5NITqKsLhPGdDmJvj
 6ubQsa6r8eeJzHVDoovebpLESqnb2WgVU/7DZQbrumI8w==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772446581;
 b=eF79PfEjtOVM5OR265zlHUQzkEFakYYRVzKOqu6lLzqkm87emJuueKG7vGhH6hsRuZf3nncP
 d/Zy2XIvfo1tYjhMzG5PfDMJTNmbf0r8pg18cyWtOZ1AwHiAIOWgPqk1Sa6Ku6TjiXwRs/BFutl
 SK5UWRvFUwFkT5jSmykQ/6g6uv2Diu5c2E/+I0sCMhQn/hkidvhb8c9YEHNN9NwFI4YEaOW8Uuq
 REvCQwc9HDWCwaE7PpLNW+7alMCgAsYBNbA9uGCIzzMZtVcAiK+9tjTvLBERV6Na+Jh0MxJeb7n
 /vP3M01ffq+zRRhuuw09hyhb1lz2VKpl6BwY/aC4s/eQA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay36-hz2.antispameurope.com;
 Mon, 02 Mar 2026 11:16:21 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: nora.schiffer@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 123A45A0951;
	Mon,  2 Mar 2026 11:16:10 +0100 (CET)
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v6 0/2] TQ-Systems TQMa62xx SoM and MBa62xx board
Date: Mon,  2 Mar 2026 11:14:57 +0100
Message-ID: <cover.1772443991.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: nora.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: nora.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay36-hz2.antispameurope.com with 4fPZZy6kLjz1S5RV
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 34f64186f7d5f0be3b0549b866decb73
X-cloud-security: scantime:1.753
DKIM-Signature: a=rsa-sha256;
 bh=l6VEiHbbXrSXnpEA233x9tN4NxHrbql59kNg3szndqg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772446581; v=1;
 b=jxpR+/sSLF+SBKPeGt9JzMZfJ7FlkQbgj4ZQnEPuXbtdy+Vrc50GyJjMUb4IH+k5rTfHS0RA
 o8IsH6adyuYYFI0P2Ngjm7wGZk0si6JLZ1Ze/PP+elVhmYv+MLkQj8ltlMRf3LuXe3xc4NgoGEW
 5djEYEDvfU7W3gsC6FNm7ltLgwMWdAKuZKoLNDX0BcZUlcbpm7a1/8iq/78wFNe0WhV9cpZljYG
 5gJ0OkQdfZlT3nZ9e7wKgQW+Bjr2B2hQwCIIHLByg4ezvWJ0AGRFtD3ZF2i5q5o3DM63jjmT0Oi
 gxIIAU0cAYcVOvIKX5XGbL2MJAOBrYEAYvfspn/BBQWgg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_053007_251813_07464CB5 
X-CRM114-Status: GOOD (  15.48  )
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

This adds Device Trees for our AM62x-based SoM TQMa62xx and its
reference carrier board MBa62xx.

Not yet included are overlays to enable LVDS display output and MIPI-CSI
camera input.

Changed in v6:
- Update author information following name change
- Rebase onto latest ti-k3-dts-next
- Disable incomplete panel node
- Add various comments to explain why nodes are disabled
- Extend comment explaining disabled 1400MHz OPP
- Use consistent comment style for pinmux

Changes in v5:
- Rebase onto latest ti-k3-dts-next

Changes in v4:
- Rebase onto latest ti-k3-dts-next
- Reorder boot phase tags after other standard DT properties
- Add missing supply regulators in SPI-NOR flash and USB hub
- Set status = "okay" in &cpsw3g, as it is disabled in k3-am62-main.dtsi
  now
- Add disabled 1400MHz OPP entry (will be enabled by bootloader if
  supported by PMIC configuration)
- Update copyright years in new files

Changes in v3:
- Rebased onto ti-k3-dt-for-v6.18
- 3 of the 5 patches in v2 have been applied already and are dropped
- Include k3-am62-ti-ipc-firmware.dtsi, drop now redundant configuration
- Change node name for MCU reserved memory to 'memory'
- Use rgmii-id PHY mode
- Drop now redundant ti,rx-internal-delay
- Update simple-audio-card,name to match other TQ SOMs with compatible
  configuration
- Reference dss_pins in dss node (actual display support will be added
  in a follow-up patch series)
- Consistently use GPIO_ACTIVE_HIGH define
- Drop unneeded usb0 quirk flags
- Add boot phase tags

Changes in v2:
- Collected acks and reviews
- Rebased onto v6.13-rc1


Nora Schiffer (2):
  dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM
    family and carrier board
  arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and MBa62xx carrier board
    Device Trees

 .../devicetree/bindings/arm/ti/k3.yaml        |    7 +
 arch/arm64/boot/dts/ti/Makefile               |    1 +
 .../boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts | 1034 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi |  360 ++++++
 4 files changed, 1402 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


