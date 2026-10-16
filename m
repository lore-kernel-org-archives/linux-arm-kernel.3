Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2940FCCF2C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 17:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I/bUJRXrwcROotZImAsAyxE1zmJ9gOa6G0aV2N86QAU=; b=cN+lxGD8J/Na7yIOmu9T6RddUm
	gxkG1TFBKdnMPtq3sxRP+2OHFNWwYG9VY6WRjOwrlNgDDLe+1MDxPv7vNEsCIk7VVtd7O9TbPLe2W
	I72ROGj/N8ub0MzrKc8ca70mNTb7t8SyvzSnjxNyPFQ3Hl5lDVjNWLJO/Sb5zH5zrKjdcHTeGLeMF
	jj5/yA84fjvXovskbGg18+rloLh8gDV0xCyttZar+GYrHehjspFEhB1vK2iXtcAh2KAmgu89iggzf
	Bsl34NVErkPzi1C7Vc8FtYaIpNsBLK0zk/iLq2P9z687DXBrUsoDyssn7Kvo7dg8TKw6LlVRXcRWM
	8VF1YBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlY7-00000003XK5-2Pdj;
	Fri, 16 Oct 2026 17:16:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlY6-00000003XIF-2LEA;
	Fri, 16 Oct 2026 17:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECE3040546;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0938C2BCF4;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792171013;
	bh=kQZA6RQBnFlVuvXUdChzKc/fj05CNydeCaEx309sHac=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ESn5QEwURtvO0A6eGoD/yG+799ZsIyBFbQusAIAL4KL8gMdOGDwvKVtaXHxOH/nmC
	 wKAJmSrlYWzrNAQdOYuhcIEmZ/RpBANj0fBumuJ+xi0VTb1fXL2K9EDSq+pmrhTadF
	 qyecn2jyX8OChVZ3XunD/HzE7VucNhY6gqxZX3X5kz7ow6S1NbKy5P4oxCAmyvlfIA
	 Vbl7XeWTQh2ZXPLI8mGS5BoKe+sRpQcfoELPTKV7zlzh4sFo/F54fT2XX0bZpe9mO0
	 V0Kq7/vGyX2zHPMGZ2K3v3JsLi5ZRyBOK23Zu+N0CmoKSiolXNB7N8nGfn6FhM/dLo
	 I/yVb+C0IfnsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB97CC6B38;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH v7 0/4] arm64: amlogic: T7 thermal support
Date: Fri, 16 Oct 2026 19:16:06 +0200
Message-Id: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33Q22qEMBAG4FeRXDdlJgez7lXfo/QiJmMNeGhjK
 lsW373RhSJie/kH/m8mc2cTxUATuxZ3FmkOUxiHHMxTwVxrh3fiwefMBIgSFAK33vPUUuxtx5P
 hc+gVByBtsLbeOWS5+RGpCbdNfX175EifXxlPj0dW24m4G/s+pGsx0C3xdQACKrYW2jClMX5vW
 824Nf5dYEYOHKtG1BdvjfLmxXaBuucmbtws9oQ8J8RKAAhfgYUSxIGQO0LgOSEzYQUZgZo8gDw
 Qak/8sUU+JvfKoRYXr0GpA6H3hDondCYqUOCsLG1Dx4+Uv0Q+tz4nykxI49FVWskK3I5YluUH5
 Y3AmjUCAAA=
X-Change-ID: 20260410-add-thermal-t7-vim4-00e571badcc1
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3708;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=kQZA6RQBnFlVuvXUdChzKc/fj05CNydeCaEx309sHac=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9al6A9pp+x2B5wKqwgMuLz34XJlw4nsHevzjmlEdpvN7
 9Fk3Lm1o5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZiIRg4jw6PiQwlrQ+u97jZ5
 TNmU8abyRRXfr63HS406bQ9c3BrOZs/wP8+4lM86UHhyN2/c8mjnpBOTQ6yXMMWc8vzgu9zpymN
 lZgA=
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
Changes in v7:
- PATCH 3: Fix four hot thermal zone trip points declared as passive type instead of hot type.
- Link to v6: https://lore.kernel.org/r/20261015-add-thermal-t7-vim4-v6-0-37d1c954390c@aliel.fr

Changes in v6:
- Rebased on next-20261014 (patches 1/8 to 4/8 already applied, dropped from this series).
- PATCH 2: Add bus clocks and clock-names to all thermal sensor nodes.
- PATCH 4: Change cooling device map min and max values from 30-100 to 1-5.
           The driver maps (0,1,2,3,4,5) to (0,30,40,55,75,100)
- Link to v5: https://lore.kernel.org/r/20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr

Changes in v5:
- PATCH 4: Remove unnecessary variable and coding style alignment
           according to Neil's feedback.
- Link to v4: https://lore.kernel.org/r/20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr

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
Ronald Claveau (4):
      arm64: dts: amlogic: t7: Add cooling cells to all CPUs
      arm64: dts: amlogic: t7: Add thermal sensor nodes
      arm64: dts: amlogic: t7: Add thermal zones
      arm64: dts: amlogic: t7: khadas-vim4: Add fan cooling to thermal zones

 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 102 +++++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 253 +++++++++++++++++++++
 2 files changed, 355 insertions(+)
---
base-commit: ab8eada9868faeee95f25d81d3d6fed0d1c98b78
change-id: 20260410-add-thermal-t7-vim4-00e571badcc1

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>



