Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F02C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 04:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hRs1ILFVuPcRsq3x/ZGBZ8F4Diw0x07EEaf1JzdhoDY=; b=to7FHLIEL+yemx
	v9MLbEjxB9SKEGps3WFQ0/KnwBp31f23maLnxwr2kBAMbVIkLlBop4uoEz3cofXw1uPp06P46/ix4
	7jCZLUZvrFmVdqbItK50NYFhYktUNgycu8wCQitwqfBP3+0aZJjloCvkETrgL2QxPq2a73d3N1jeI
	SnFNsulohQ/3tZ6FW5IPLkawF0vw7xp0HCILehX1Ot2QNT+CogWXOsimQQ3KYgx7ClC4m8mz/26dz
	kv1cBJUb070RgeSbpNB9WstYROBKsR0Lv8umBhnR6Edw0/hPF+0vOqKgZi/EbFk1CK+PVxpblF6fw
	tFXBA7oerkXMk7KyXZ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCyt-00000001w9E-1wKr;
	Mon, 27 Jul 2026 04:30:23 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCyq-00000001w8K-3046
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 04:30:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cee9b74ee1so17493935ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 21:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785126619; x=1785731419; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hRs1ILFVuPcRsq3x/ZGBZ8F4Diw0x07EEaf1JzdhoDY=;
        b=sSikVYiyJDnJp8HLxTEBm6/9rBWwe001+JALMzTccKe7bkl+gnUGOpwaFv2b91C/KQ
         /gky7st+0y/2hV9l5XsC6k6UNzbIWS1H42xR86Pk7gIu0m4RUP4Yu66GuQi3BMTaBl0j
         5CfwYPBjiYyBjd8oOY1hzZGBIp+aEwqMVj1udgkHwERHAUI+9jAPyPBwvoCzlht6QyJb
         PzJj00vaZ3T2jK5C/Zpllly+vAwXjprDfdnsTzt3g2s/xHlevV3qc6Mxjg/2JttDiFIq
         8nD3S9tKOEELfk25Md+4+pJMk2HGMeYKmqsEAF0Qj2CHQIAlFF9GghlQN6S2uyxExrgY
         aAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785126619; x=1785731419;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hRs1ILFVuPcRsq3x/ZGBZ8F4Diw0x07EEaf1JzdhoDY=;
        b=tPb0pidgjGqeR4flX2OpVtWlB2Wrt7K59KKuke7SyiF4AlenxXtsu7QMd22X8WbRGs
         qg+lO3BGNiYsqwjNQge1wRchUiaU4U/3bNnXZ7Wbq8Dpy1UAwiTMGgNnvch2xs7ELUgM
         LMWmLq1RLyB+23T+sdJGurONNPho/loMzWnBI/R93qG2unnhqPBiI61UZt16Qqp9IhQw
         EDWSxqD7foghJfVfV0KyEzl0aNR7Fmwk7tAg/KUhr90uixVKrvYsmOCFZ1+4gdC1X8/n
         vVzKrsIqx1Muk7HzW2Kup+HGZ5BGRpdTXST65gFEnSW5Wv9gxqUtPIvSOtWs7w7UDfIn
         M/hg==
X-Forwarded-Encrypted: i=1; AHgh+RpUbxMvBTIUNZmho5BcH8l7VT7UH8UTX8pFFQFYqhZRinz3b/qzZolP4arJk8IzD+SejhNsTV34PgIGThQ4Ovqr@lists.infradead.org
X-Gm-Message-State: AOJu0YxfWwuLo+2vefQRfwtgxLCrzln/C6Fb4rTKnKgmC5/uVlC9ei0x
	DbblHjJWeRFirJEFaHOQGgF6VpDovUDfKRyjlIyEDeQ6XCVl4ej0tR6Uyh9erQ==
X-Gm-Gg: AR+sD12PLX+DWKUU4Ogco/MY+Rh22EZ8AJrnk4Z+ERpSgLN8Uk5loG8s47l/Xvm5pBs
	d9/TnHPCUZgB+7NQS5RmmzPe2S3H/BKiQk/PSjYzQzN5+W2MEDq7JD5c8ktw6+y6Enr+PVhvjYw
	b6V14gcpZz2CO2jSzRXCfRXlahYArtGobboJh/NijKmPqqVx7R9EzM6hA2Swc0+3RN7nbjxpvTW
	ii8YpUhBZ/sxPvygsSAAbDboWTdT/rqN3LsqnCtKrgeLmC2q4dls8Ta46cSr4/pgQ8dTNKUQ5hz
	D6k0FtSlvo2dfLoR0fWC4rRHLo/LVjB6X9MqNORkyYTWnMdou39cK9TKx3kUS+O7yOAJqR9K4oE
	TfniTuLpqZKIwLyAssFqe2JNkI0NkZaVdEtOuWMf6N7+DR/XyttH3BJvpY28YePJB8JpCT9p9nV
	t57NDX+bzk9m0ZTvtOLLjuJ2iWP1kzTatRvlTCSBh2+w==
X-Received: by 2002:a17:903:2385:b0:2be:3850:297e with SMTP id d9443c01a7336-2cfde866c11mr69743805ad.31.1785126618994;
        Sun, 26 Jul 2026 21:30:18 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde80f50asm27372145ad.77.2026.07.26.21.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 21:30:18 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v9 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Date: Mon, 27 Jul 2026 12:32:08 +0800
Message-Id: <20260727-ventura2_initial_dts-v9-0-504c0ec68039@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEjfZmoC/4XQ22rDMAwG4Fcpvl6G5INs72rvMUbxsTW06Uiys
 FH67nMLo1mK2eUv0PcLndmYhpJG9rI5syHNZSynvgb7tGFh7/pd6kqsmXHgCjnn3Zz66XNwfFv
 6MhV32MZp7CxYL7jWkUixuvoxpFy+buzbe837Mk6n4fvWMuN1+g84YwcdZiAkCto48bo7unJ4D
 qcju4IzXyKygfCKZLTCOxUl6AdE/CIEiKKBiIrw6HN05JSXeo3IOyKbl8iKGCAPkJwUKNeIuiM
 EpoGoigidkvIhK+NpjdACQWggdENUNMlGnXxeI3qJYAPRFXGE0VjgPqgHxCwR1UBMRYKx2fJgQ
 P597OVy+QFD1uYImwIAAA==
X-Change-ID: 20251222-ventura2_initial_dts-909b3277d665
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5157;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=ECDRQ+WrFbVZS+CZDLgpuXr0f49U0NwaVirTL3iNsYY=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqZt9OCSm1dOCGzSJG+/XAVlSwITAZ8teBCVRjk
 RqnKU2yX3KJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCambfTgAKCRClg0K3CVbE
 gSq/CACmfWJchkK2REQmVizNMc/5PAD1prTQWJl+KEK5rofWdDRC6CenSzKodSHaOiosooNQ8xY
 wpZuiTO8SCqBKKhc+Yx4CB4iidhIXfQYG48xpoDZuctrCXJ5c0C7AJyOapK0elrUhZNtURKeF6H
 Tl5lVXp+0+ns8eiQDudLuxb7z1TOgdeNRgMh/xIu1AsxzPZAVRtZOQYmJKscDdUO5vo2kTgDgg0
 hk29/s56q/jfONI2zraEkDRZIwTdU50Z3KySYMDP0C6gsXuzjF6EISPnNACStGp61dGSsVb+XCV
 ymJHdtqSrlkeey2fQDFpVJy9s2rusAx8Gja2BEv+Lqjd6rgB
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_213020_774915_A621608D 
X-CRM114-Status: GOOD (  14.58  )
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

Summary:
Add linux device tree entry related to Meta(Facebook) ventura2.
specific devices connected to BMC(AST2600) SoC.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v9:
- Rebased onto the `aspeed/arm/dt` branch of `bmc/linux.git` to resolve merge conflicts.
- Resolved all formatting issues flagged by `dt-check-style --mode strict`, including:
  - Fixed 'mixed-indent-chars' and 'continuation-alignment' issues.
  - Sorted properties and nodes into canonical order.
  - Removed unused labels. 
- Resolved DT schema binding warnings reported by `make CHECK_DTBS=y`:
  - Removed invalid `channel@X` subnodes from the `maxim,max31790` fan controller.
  - Dropped the deprecated `aspeed,hw-timeout-ms` property from the I2C bus.
  - Removed the incomplete `ti,ads1015` ADC and generic `pmbus` power monitor nodes to comply with upstream schemas.
- Corrected the compatible string for the 40-bit I/O expanders from `nxp,pca9698` to `nxp,pca9505`.
- Link to v8: https://lore.kernel.org/r/20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com

Changes in v8:
- Addressed review comments from Andrew Lunn:
  * Added a detailed comment to the Marvell 88E6393X EEPROM node to clarify its hardware I2C multiplexer isolation and out-of-band firmware update mechanism, explaining why there is no concurrent access or multi-master scenario.
- Link to v7: https://lore.kernel.org/r/20260611-ventura2_initial_dts-v7-0-a61d8902bc5f@gmail.com

Changes in v7:
- Updated the commit message to include a detailed description of the Ventura2 platform's purpose and its key hardware features.
- Fix comments from Andrew Jeffery:
  * Ensured consistent blank lines to separate child nodes from parent properties and from each other throughout the DTS.
  * Sorted fan nodes in ascending order.
  * Replaced '//' comments with '/* */' block comments.
- Fix feedback from Sashiko AI:
  * Added 'idle-state = <6>;' to the PCA9548 mux on i2c4.
- Link to v6: https://lore.kernel.org/r/20260610-ventura2_initial_dts-v6-0-375d8e9d7ebf@gmail.com

Changes in v6:
- Addressed automated feedback from Sashiko bot:
  * Clarified comments that io_expander0 and io_expander8 physically share the same interrupt line (Wired-OR) by hardware design.
  * Removed leading zeros from unit addresses in DAC nodes (dac@c, dac@e, dac@f).
  * Removed unused properties from the adc@48 node.
- Link to v5: https://lore.kernel.org/r/20260608-ventura2_initial_dts-v5-0-37ee5bcf58b6@gmail.com

Changes in v5:
- Addressed review comments:
  * Added comments explaining the necessity of 'legacy_' prefixes (hardware label collision), pre-allocated I2C aliases (future expansions), and the 'ledd1' naming convention (schematic alignment).
  * Removed the empty `&mdio0` node to comply with upstream networking subsystem guidelines.
  * Removed the redundant `&peci0` node.
  * Sorted `&kcs3` and `&lpc_ctrl` nodes in strict alphabetical order.
- Hardware/DT alignment updates:
  * Removed unpopulated sensors (adi,adt7461, infineon,tda38640, ti,ina230, ti,ina238) to accurately reflect the current board population.
  * Added the secondary flash node (flash@1 labeled "e810") under the &spi2 bus.
- Link to v4: https://lore.kernel.org/r/20260424-ventura2_initial_dts-v4-0-806b00ea4314@gmail.com

Changes in v4:
- Fixed capitalization: "ventura2" -> "Ventura2".
- Reordered I2C child nodes in ascending order of unit addresses.
- Enable PECI, LPC control, and KCS3 interfaces for host communication.
- Configure MCTP controller on I2C4 and enable MCTP support for specific mux channels.
- Add Infineon TDA38640 and TI INA230 power monitor nodes.
- GPIO and Pinmux cleanup for PVT:
    - Aligned gpio-line-names as requested.
    - Remove unused or non-existent GPIO line names to align with Ventura2 PVT.
    - Update specific GPIO pins to empty strings where signals were removed or consolidated.
- Adjust SGPIOM frequency to 200kHz and update signal line names.
- Enable UART3 and add serial2 alias.
- Link to v3: https://lore.kernel.org/r/20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com

Changes in v3:
- Add annotation for marvel 88e6393x
- Modify the gpio-line-name
- Modify the node order alphabetically
- Modify dt-bindings document for rmc instead of bmc
- Move the gpio-line-names to original node
- Link to v2: https://lore.kernel.org/r/20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com

Changes in v2:
- Remove unused mdio
- Link to v1: https://lore.kernel.org/r/20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com

---
Kyle Hsieh (2):
      dt-bindings: arm: aspeed: add Meta ventura2 board
      ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 3005 ++++++++++++++++++++
 3 files changed, 3007 insertions(+)
---
base-commit: 749c34389679f8d56cb200a69b62f9a64670034f
change-id: 20251222-ventura2_initial_dts-909b3277d665

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>


