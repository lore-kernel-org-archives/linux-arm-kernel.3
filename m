Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF15F36C5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 11:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yy1f14lmtsS17PLFEqESTQtJLvboBHB8ikGJY9krqS4=; b=zoAaV6B6IhDD8m
	tNch4CTrZBm8u4poLvqKXfb85xR6s1bozC7tNrR1yAs/0rSiJlGVSXCgl+RJ0rldQX9poiWSvvlXI
	/u5NFpZ6lC4qpNjZWl8mrtgb3SC/XzvvBUKlwD9dCHB+mNPoQZxaszVeRJBB/lgBRNncjM04pr48H
	s0TRNyT8hA3XLoLOe1NQ2o0CjnyOSO1tSglxzkNcrj8QUjNTsbclgjRnldljEZGfzQfttqpVMkXUQ
	/E85JDf157gv84nM6PLMm0CxCiuRaknkAfksb0AUWKQ7Gv5pioP3rauyY4W0DDMNE5FJ9pE0iLCB9
	30YFLpXCmSiqoPsZlBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnH5-00000006prz-3vGI;
	Mon, 20 Apr 2026 11:58:49 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnGq-00000006pis-1eYW;
	Mon, 20 Apr 2026 11:58:35 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776686307;
	bh=YtSJSMn/IVKEwUmUG4/Nu1r030hOOMaWchctzjmW4vw=;
	h=From:Subject:Date:To:Cc;
	b=hxhLqbZGw4d6dABN6qxYWcIr3qosAEMECxozQ233TNyYNx1vYB8FGe5KBEDVQOt6o
	 0bmxQKWXFbcNjC4PW6ULjof9aUUPeBnGF2c3JgbKvai4olyd7f7KPICsgoT34FC17O
	 zyCN9O6hnEeUSKSQGOdg7Ogex7tt0fjYc1yQF0vQ=
Subject: [PATCH v3 0/4] arm64: dts: amlogic: t7: Add UART support and
 enable Bluetooth on VIM4
Date: Mon, 20 Apr 2026 13:58:08 +0200
Message-Id: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOQY7CMAwF0KtUWY+Rk6btwGruMWKRJi611DaQh
 AiEevfJFBZsWH5b/9kPESkwRXGoHiJQ5sh+KaH+qoQdzXIiYFeyUKha1FKDcQ766UrJ+zRC6iD
 zrGFASVhbTVYZUbrnQAPfNvf3+MyBLtfCp+dQ9CYSWD/PnA7VQrcErxO1+C+MHJMP9+2vLLfGa
 998eCFLQMDeYKdba6Vrf8zENO2GsIFZvSPtJ0QVZG+aDvffg8OmeUPWdf0D+67dBC8BAAA=
X-Change-ID: 20260414-add-bluetooth-t7-vim4-f01e03c4ec2a
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776686305; l=2335;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=YtSJSMn/IVKEwUmUG4/Nu1r030hOOMaWchctzjmW4vw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMVITgx/HfScbL1Srfe5GskALW2NMprSDwVR2qsijtxvzfCVq5EmFrj9ncYljRcCnFx4mhhj3B0
 21h1LTwIScgA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_045832_865311_9CD2DF45 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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

This series adds all UART controllers for the Amlogic T7 SoC and enables
the Bluetooth controller on the Khadas VIM4 board.

The T7 SoC ships with six UART controllers (A through F), but only
uart_a was previously described in the device tree.

  - Patch 1 adds the pinctrl group for UART C, which is needed to route
    its four signals (TX, RX, CTS, RTS) through the correct pads.

  - Patch 2 completes the uart_a node (peripheral clock) and
    repositions it to respect the ascending reg address order required
    by the DT specification. It then adds nodes for UART B through F,
    each with their respective peripheral clock.

  - Patch 3 removes redundant clocks and clock-names for UART A on
    Khadas VIM4 DT. It then uses those defined from DTSI.

  - Patch 4 enables UART C on the Khadas VIM4 board and attaches the
    on-board BCM43438 Bluetooth controller to it, with hardware flow
    control, wakeup GPIOs, LPO clock and power supplies.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v3:
- Patches 3-4: split into two separate patches:
               3. remove redundant clocks from UART A
               4. add UART C node according to Neil's feedback.
- Link to v2: https://lore.kernel.org/r/20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr

Changes in v2:
- PATCH 1: change underscore to dash in pin node name,
           according to Xianwei's feedback.
- PATCH 3: remove clocks and clock-names as already defined in DTSI,
           according to Xianwei's feedback.
- Link to v1: https://lore.kernel.org/r/20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr

---
Ronald Claveau (4):
      arm64: dts: amlogic: t7: Add uart_c pinctrl pins group
      arm64: dts: amlogic: t7: Add UART controllers nodes
      arm64: dts: amlogic: t7: khadas-vim4: Remove redundant clocks from UART A
      arm64: dts: amlogic: t7: khadas-vim4: Enable Bluetooth

 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 21 ++++++-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 73 +++++++++++++++++++---
 2 files changed, 85 insertions(+), 9 deletions(-)
---
base-commit: 6aa9edb4f8266cfb913ee74f5e55116550b5574d
change-id: 20260414-add-bluetooth-t7-vim4-f01e03c4ec2a

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>


