Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A621FCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 02:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fQuGdM2CJQXaRNDTIGDSfZydcbPeUd8rTAur9l3mo3A=; b=h5XxAOfUljz2Qd
	OV1x8d3SnVv7drns19LWocGvDhFKAO3jTpBkQ3GE4tj7Xgh05PBgHI9CnpSgCAUBnXlOR2xiUwrev
	9qZbbHCEO+MzpptkQUNjTsWoTNh20gqQNnlYY673C0LrVsXVecY2LEjJfraHTgeJ75LBeYNCMijny
	YienWcTGujAv4oH9LeK38Zr+DffXoYXWcmQjq6xifNZe/FaHiXiBtEzOxsBJqNSGk3veqTNbgTvaT
	YZD0njEGXAsHCS6/CmZu4BXG0qc1Q8ARz9ionaddGSsOANoZoUO8HdcvYulUT5M3FK8Q5s7DDJ4Mw
	Rij03VJsGZc3OkBvjXEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYxJM-0000000DU19-0gPt;
	Mon, 15 Jun 2026 02:44:28 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYxJI-0000000DU0b-4Aqc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 02:44:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2bf18c30bb2so20827065ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 19:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781491463; x=1782096263; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQuGdM2CJQXaRNDTIGDSfZydcbPeUd8rTAur9l3mo3A=;
        b=n2TcM0+rw8vCTggoC9oTzkL/z4Am1BMrPgMkGevFSHTpr/eLAVZRl5htlxvCcSAYtL
         tD5xtEgkotLAV/LCLLSvY92EXQwk4Je8co4wVOa8Eta/R9qWyrLMqJcKrrFw8FzQHjPX
         V1Z00f8yCY9OYCS9bB0qw9uMRJt60WRj3AZEnEljl2KcS/Vy/ORPD8w6lZ4tGG7AK2KR
         SW27zOx90C8HwUSF5M7wUlVuoREaQw/HisIYZHcT4ux3GmpjVzd1gPP3r96ipIsv7feM
         QXv0Xaoh+ANvgP+zfTrlMaE2s90NuP9t76oeTeGzOcj3eyao5drGzK13owOyJ98q8jtl
         gQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781491463; x=1782096263;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQuGdM2CJQXaRNDTIGDSfZydcbPeUd8rTAur9l3mo3A=;
        b=L7i4WzoE15ra2mhVATz4R/mEaS6mw7rkiUTEKsf355x9oRVTZ41UdkQdEZmsqVC0hP
         549dWLsk0uHvVa8OfiuPZWsKfc0zOu52D/Wa8to9ifsPWBGk/yLBd1853znF0FUihMWb
         6JRtSd2B1wuJZU/+gUtiqIzifLXGehXURmCQxwb+2gKCRYGZM6oHPB4N3+SLtPr2Idsh
         L37es8wZLrGJkKbxSkOPEO9O9O5YTS+mS2hKqhpazJ33GtqIOh6FdREVH4feiMsi7AUM
         wxwP88wxb091rEQNg8ABKejtkzTp3vcuVTpUef/B3hWixEX7noELMDngNTHjpAnNPSKd
         FKDw==
X-Forwarded-Encrypted: i=1; AFNElJ9GDxO7yWl0zr5/4peKq7SwjAc0yDODUyP9x9efYUOO0DIpAlcAhPaacFcAGa6OYsJtg4s0umwopcSFUlO0WzGI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2NBeSauir1TDUu39kxw+0BJbhAYPrDsHTAeIB1e8QSuB1vMWn
	KHUpG0JyMXhnoaZIvneRgZdE4ZwKI5sHmnabOUdfqP+QkDa0QwaiegRjILctcg==
X-Gm-Gg: Acq92OE1K8AnLI0ZdW2lno+lywHsV6i7d/JOHaVNbfcoaiOHIX10rLg+iAlglLYjPsG
	aTauIlPmzwI0CdaDro1ps6JMq2atwPT6AfVe/4zKryeDlEZK7Hb00AtnuYm0LETm4dNb0QAC2CW
	M51D5xchnyDIEOCy++I1v1p6Jce+k7xgDjcLeoByrPv3SHNyKBhV4nAmY3pqgAVTWnygHcFYL9w
	+9AX+2kQTZZhpOIqbdQGg0HA46EjK/iearE0wYE5woxD+J1vNGUe6aLhcx6IM9zBiygzmWqAgwt
	8LKl7pdcX+KknSkO5lLNfPWYV8+hrSlfNAKYQq0nnQKYH6MabYOsydNxBog0KeALJiD8KD42UuK
	5Xb83aWdDsb0mAwjl9NWBXFDlCnQK2POonrKL3jNTvxiCod3hmhtGHbSai6+9peIejeNgZCN8hc
	9mXYSNDpqAQNfgp0CyV0HtRkDibjhNq6jBG2lPxl2y0yFRmR4pwPSlBTCUcarWqBg=
X-Received: by 2002:a17:903:98d:b0:2bd:2de3:5181 with SMTP id d9443c01a7336-2c6641ef6a8mr105720065ad.9.1781491463515;
        Sun, 14 Jun 2026 19:44:23 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm7138676a12.11.2026.06.14.19.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 19:44:23 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v8 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Date: Mon, 15 Jun 2026 10:46:01 +0800
Message-Id: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGlnL2oC/4XO22rDMAyA4Vcpvl6G5IPs9GrvMUqxY7s1tMlIs
 tBR8u5zA6NZhtnlL9An3dkQ+hQGtt/dWR+mNKSuzWFedqw52/YUquRzMw5cIee8mkI7fvaWH1O
 bxmQvRz8OVQ21E1xrT6RYXv3oQ0y3hX0/5D6nYez6r+XKhI/pP+CEFVQYgZCo0caKt9PVpstr0
 13ZA5z4GpEFhGckYi2cVV6C/oOIH4QAURQQkRHuXfSWrHJSbxH5RGTxE5kRA+QAgpUC5RZRT4T
 AFBCVEaFDUK6JyjjaIrRCEAoILYjyJtReBxe3iF4jWEB0RiyhNzVw16hfyDzP34jjJyNWAgAA
X-Change-ID: 20251222-ventura2_initial_dts-909b3277d665
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4257;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=3h3qFVrVCHwqA/9jJB20RsTtPzwqAaPlxKs6hDrBMFE=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqL2drhFWW9Ip8dlj2f14cILevLO2MTyU/2m3Ei
 PIkuV427ZyJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCai9nawAKCRClg0K3CVbE
 gTMUB/9x5bCCP2AyO20NPdO+gjy6d7sGgdpp5kUBZUx308VpT6TYKOLoou1dllpA+RlDeokdUau
 XP0gXKvPjTBdA5aSgBc8SZOhIaDlL+s2LS+iTf05I/445Y5v1qF5jhRBt9Sk+bGO9bWiwlZn2we
 Ucge/Q6UdVqwYQlLI061q6artDZhH+u2Vt+AJKBCqqQpU9eY7zM3bK2gb5V2CG6bQXATIRFN29A
 fUxmaK6R/7Ze9qpq3kUcvzkxiWFHOoS/zF1aWYf0u7IsQ8Un/CqUY0ZD+6OP1wQ7fKBJryWPXHh
 FjvV3AydxMHniehH2Wdu7Nj3BigOeiR/z8QXaZn7HNv0vjgf
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_194425_068309_1B7D5977 
X-CRM114-Status: GOOD (  13.45  )
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
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2903 ++++++++++++++++++++
 3 files changed, 2905 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-ventura2_initial_dts-909b3277d665

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>


