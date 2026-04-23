Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E34FDEE22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 16:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kFw0GPsvRGZYVSfGB+UymE67Jr5o0riFr60H2OmXjpc=; b=Co4XHFwj9ybXFlRVZLBF+cDF4g
	FXuLWsG5CXn/96CnOjd+yPRurz7d8dN4unNf/pB/dFVwSsKYXcKXA+ol4bHHRDYbtpr3FYlatiNfV
	oJqOK/242IQSxk4yZZzIgLRwJiHew+mDiQcHDGNKrCaOBPrE9gavrmV/4n3FYdeZ9V8ZCCnIQizOU
	8UA/BoCOZ0X+iQCl7w30KhnqHYAycEFZB+cnjRZECU9QPVdVNgzb0gwgXJ9LKISosx1aA1TBTJXyo
	SI7eOAwqOoXrdMYEpqheYwp1EqtSof1/func1C9DJg6QVArgprtcRuTLPGnMWCe5sM/J4tHPTQ7Mg
	REBcyc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFwb8-0000000BvW9-1K85;
	Thu, 23 Apr 2026 16:08:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFwb6-0000000BvUW-1NJs;
	Thu, 23 Apr 2026 16:08:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A6EE60180;
	Thu, 23 Apr 2026 16:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C313EC2BCAF;
	Thu, 23 Apr 2026 16:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776960490;
	bh=evFYZUqurWsY+SH49jUQpkBFYz0aayx+5fnBjYWn4t0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Hfo0x0WEr/KQ8HakJKOTr1bcOaYDdBE7wTlmuWXQMopirAcuWHjRk3Nik9j2EeOlA
	 Ii/zhjmIuJDAB50bq2msYizORxa3Bs5WNBI9hTar5xPBoR1vWoSIyv8VYep1VvMFTn
	 4qxxPJtfH/O8Ovg8+paqztcIlc5h8LBIt/jRKp+50RLSj7IEPLsUefCHnTd6q9gRjX
	 CMxYDQ2y4I+gMz3K6czsrXVVvwZ2v9uNIlvZHAKWFNuQETQYIujLd2niOzuQQfQRHA
	 IrcKLERrtwM2ILGwAbQ3cSI5BDZoTPwWX0qE9wRkEq5WrvJJm7AkHifaoCQheOiEGE
	 qBA73FW0kjVBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9778FC037F;
	Thu, 23 Apr 2026 16:08:10 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH v4 0/8] arm64: amlogic: T7 thermal support
Date: Thu, 23 Apr 2026 18:07:15 +0200
Message-Id: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32SzY7bMAyEXyXwuQqof8soin2PogdKpDZqbSe1H
 WMXi7x7FWcPSRv0oAMFzDeYIT+amafCc9PtPpqJ1zKX41gH82XXpAOOrywK1blRoBwYCQKJxHL
 gacBeLF6sZTACgK2XESkl2VTlaeJc3jbq9x+3eeLf5wpfbp/NwPOMG7zbfd3Yur6gnLF7CbYOU
 kjxs+C4P5xfcOiPryXt03H4tvFxSYdN6yxa8i5niilEjRi1bm2MzqYIygOYpIE9P6qU9sqFFmS
 rHJFG8jlKx9GQJ0eGMVowyrePKus5RGgxuBaZsjWaNAFZl7JMaCgqiAqla+67q2af6bbmYhqM9
 laJGqWSS+xZcE2NJvvgNXarejSNXkO2bFRkSW0gGTQ7jZVpTbCJYlbJk49PTTWIugdRxhX7QuI
 0HU88Le8iRraGgtbZy0/Hf7Vy09bqr2sez30vJp55ESo6aDnmQGi6VT4TG1Bb2iGdRcZR/Dog4
 Xy7FUwyVXur67661VzlEWe+FjKUpduN/FY9bp355no9hzIvx+l9O9Hqdz2f/17jKgUIGbKKLaG
 vO32p6bnf52nD1bx3CP0coa4IAEUBEByovxD6DqHkc4SuCFTslbRMAPoOcblc/gBAfmIZeQMAA
 A==
X-Change-ID: 20260410-add-thermal-t7-vim4-00e571badcc1
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6292;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=evFYZUqurWsY+SH49jUQpkBFYz0aayx+5fnBjYWn4t0=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ+Yr57O6UpGrKtPs/SWtZ9nXss42vjyj/MSs5W845f1fa
 lZu4tLqKGVhEONikBVTZOmfa3ni3eWjZ77uUU+BmcPKBDKEgYtTACYiZ83IcGDZwZ8vDtxSsnjS
 MJFbKav73EZB3kzOp3HmB5L9vnkcX8nwz96MvbkkSmK70te+Byt6G09/jZ6ZHHtrrRnXUoXEkzW
 lDAA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds thermal monitoring support for the Amlogic T7 SoC,
used on the Khadas VIM4 board.

The T7 exposes six thermal sensors (a53, a73, gpu, nna, vpu, hevc),
each accessible through the secure monitor firmware interface rather
than a directly mapped eFuse register as on older SoCs.

The series is organized as follows:

- Patch 1 extends the amlogic,t7-thermal DT binding to describe the
  new amlogic,secure-monitor property.
- Patches 2-3 extend the Meson secure monitor driver to expose a
  thermal calibration read command (SMC ID 0x82000047).
- Patch 4 adds the secure monitor readout path to the amlogic thermal
  driver and introduces the amlogic,t7-thermal compatible.
- Patches 5-7 wire up the T7 DTSI with CPU cooling cells, sensor
  nodes, and thermal zones.
- Patch 8 extends the Khadas VIM4 DTS to map all thermal zones to the
  on-board MCU fan controller (states 30–100, corresponding to the
  FAN_CTRL register range 0x1E–0x64).

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v4:
- PATCH 4: Extract SM and syscon setup into amlogic_thermal_probe_sm() and
           amlogic_thermal_probe_syscon() removing amlogic_thermal_initialize()
           from Daniel's feedback.
           Also fix pre-existing bug: move calibration readout before
           devm_thermal_of_zone_register() to avoid reading uninitialized
           trim_info, according to Daniel's feedback.
- Link to v3: https://lore.kernel.org/r/20260421-add-thermal-t7-vim4-v3-0-a2e7215ed003@aliel.fr

Changes in v3:
- PATCH 1: Replace second if check by an else statement.
  Remove unnecessary label in example according to Conor's feedback
- Link to v2: https://lore.kernel.org/r/20260413-add-thermal-t7-vim4-v2-0-1002d90a0602@aliel.fr

Changes in v2:
- PATCH 1: change two const entries to enum, explain why sensor index is needed
  reorder conditional compatible for required, and fallback only according to
  Krzysztof's feedback.
- PATCH 3: Add kerneldoc for meson_sm_get_thermal_calib exported function
  according to Krzysztof's feedback.
- Link to v1: https://lore.kernel.org/r/20260410-add-thermal-t7-vim4-v1-0-19f2b8da74d7@aliel.fr

---
Ronald Claveau (8):
      dt-bindings: thermal: amlogic: Add support for T7
      firmware: meson: sm: Thermal calibration read via secure monitor
      firmware: meson: sm: Add thermal calibration SMC call
      thermal: amlogic: Add support for secure monitor calibration readout
      arm64: dts: amlogic: t7: Add cooling cells to all CPUs
      arm64: dts: amlogic: t7: Add thermal sensor nodes
      arm64: dts: amlogic: t7: Add thermal zones
      arm64: dts: amlogic: t7: khadas-vim4: Add fan cooling to thermal zones

 .../bindings/thermal/amlogic,thermal.yaml          |  37 +++-
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 102 +++++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 245 +++++++++++++++++++++
 drivers/firmware/meson/meson_sm.c                  |  29 ++-
 drivers/thermal/amlogic_thermal.c                  | 115 +++++++---
 include/linux/firmware/meson/meson_sm.h            |   3 +
 6 files changed, 494 insertions(+), 37 deletions(-)
---
base-commit: f7b64ed948718290209074a50bb0df17e5944873
change-id: 20260410-add-thermal-t7-vim4-00e571badcc1
prerequisite-message-id: <20260326092645.1053261-1-jian.hu@amlogic.com>
prerequisite-patch-id: f03a086b4137158412b2d47b3de793b858de8dde
prerequisite-patch-id: 123970c9b29c2090440f2fd71c85d3c6fd8e36de
prerequisite-patch-id: 3e2e56b0926ba327b520f935df4ced5089bbe503
prerequisite-patch-id: 65a5d76ffdbc9b3aab3385bb65cb027004c30e7e
prerequisite-patch-id: 237269801826dd3ad7fb16eb4d7d6d4eab504278
prerequisite-patch-id: 57e9b08a968aedf543d3d0d56cf1ca4db20b2a16
prerequisite-change-id: 20260326-add-bcm43752-compatible-e264a4f7973a:v2
prerequisite-patch-id: cd98b74fa56af72af2553f391c400981d83cd4f4
prerequisite-patch-id: b730f5e42be1d89d193e63a0265495cdbf2c7d7b
prerequisite-change-id: 20260330-fix-invalid-property-bbe54d933f71:v2
prerequisite-patch-id: 8d675e7a239985c762843515b241f0a2f45f9c92
prerequisite-change-id: 20260331-fix-aml-t7-null-reset-2b608ebf9da4:v1
prerequisite-patch-id: 5b5de77af11747ce964404fb827d2ee2bff47ea5
prerequisite-patch-id: 1e37fc75fed1e533adee0f3e7e6ead1f8ff3c55c
prerequisite-patch-id: 65a5d76ffdbc9b3aab3385bb65cb027004c30e7e
prerequisite-patch-id: 2daf583fb5e7449a02bd217d8aca330171b598aa
prerequisite-patch-id: 237269801826dd3ad7fb16eb4d7d6d4eab504278
prerequisite-patch-id: d1ddf9b7710e91f8062de83bd7ba55afb2c4c112
prerequisite-patch-id: 57e9b08a968aedf543d3d0d56cf1ca4db20b2a16
prerequisite-patch-id: cd98b74fa56af72af2553f391c400981d83cd4f4
prerequisite-patch-id: b730f5e42be1d89d193e63a0265495cdbf2c7d7b
prerequisite-patch-id: 9debd88fa60febed9cd7208f86603b4c2d270520
prerequisite-patch-id: 314ef9ff0c4d1d15dab1dea9d92aa065f1eac3e9
prerequisite-change-id: 20260402-add-mcu-fan-khadas-vim4-ac1cbe553c9b:v4
prerequisite-patch-id: f03a086b4137158412b2d47b3de793b858de8dde
prerequisite-patch-id: 123970c9b29c2090440f2fd71c85d3c6fd8e36de
prerequisite-patch-id: 3e2e56b0926ba327b520f935df4ced5089bbe503
prerequisite-patch-id: 65a5d76ffdbc9b3aab3385bb65cb027004c30e7e
prerequisite-patch-id: 237269801826dd3ad7fb16eb4d7d6d4eab504278
prerequisite-patch-id: 57e9b08a968aedf543d3d0d56cf1ca4db20b2a16
prerequisite-patch-id: cd98b74fa56af72af2553f391c400981d83cd4f4
prerequisite-patch-id: b730f5e42be1d89d193e63a0265495cdbf2c7d7b
prerequisite-patch-id: 8d675e7a239985c762843515b241f0a2f45f9c92
prerequisite-patch-id: 9debd88fa60febed9cd7208f86603b4c2d270520
prerequisite-patch-id: 314ef9ff0c4d1d15dab1dea9d92aa065f1eac3e9
prerequisite-patch-id: e6a1b58b91a877504a12ae68bee71eb4e496c33b
prerequisite-patch-id: 406f88d7dabd3a870b358fb53c21686f29eb32b7
prerequisite-patch-id: d7a75ae3be0f54e0a7e81ccb0043a2f05423c9d0
prerequisite-patch-id: 5e19dc5ace12b532284246f5c2ff3f214d8a9c4f
prerequisite-patch-id: d6a87ebcf5246eb67b94ca0908afa3df9f9383fe
prerequisite-patch-id: 4809bbedf79f59e1abc52c17cffc0b1bbb43d365
prerequisite-patch-id: c050e8bac4b5491f6c7008a5ccb26f20fad38b46
prerequisite-patch-id: 30677db8fc57270787245103c0d5acf8791307b0

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>



