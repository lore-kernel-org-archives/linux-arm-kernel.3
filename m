Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688EECD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SKGdr913915Q8iQDefSdWS5k8DqM6G/9jSiJiAAdPAE=; b=ip21ozaVashos2eeiOt2gYS+yH
	Oplko+u3V3FYMI3tHKyYkSlrFcjshhaa28yRPLwmAIngF5dmpd3kD6Di7Hb1mkgDhytdJq8hQZ677
	35oSuVKIBF5e+oxoA8h2nLXLqy2Z1IudtgcYh7mgyLmOoG+MhYx3Je1yrOaYOZLfSaRgoid7juJdU
	7LKO0VyADbTh1CXwJwfOUZc6vE35LCSXmI+xQR5piBBn5zLC9mgS7CUtGNmRvlmefXJJV7cSoT7UP
	Lg0HAKkQxnreDMlYtrk1hXvIivHL4ogv7NCUZtRQDsb2A0jV1XG7XBoNuSaGYrUxeFe/xTQki7hC+
	xm0Y19AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74n-00000002EQd-11Vx;
	Wed, 13 May 2026 10:44:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74l-00000002EOm-0TaA;
	Wed, 13 May 2026 10:44:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6577360123;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A701C2BCB7;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778669066;
	bh=EftnxsZQyEGBjcaWoej2Qgq8pVFT9h/4EhbAduCDQPA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BF+vaZGYadI2fPGJPtYMlf209EsaXq6w5mcIw1WGQU/BvyoaDtOiee7IPm8VvaqU1
	 VvlBHOQIrZj/mXcsRASxPtl1CWncE19kzdr0Y34BlJdX90WcAePp8TUVxrv9hLPcAA
	 rtbnMudpsbLzLFuMGBofMF6x4B7cK8uaHJbFYMueYP590CX51HZlUVy0t81OWsuVxT
	 g2Ew+HIZrhxriKrzfmoucSkLxfqdELkSgADy0pqMnwGHfEReVYBmC1qX5m0BPOPU1a
	 viuM/OeqNC3cwPworG0/niTY/GxoghI2RRuzANQ20tp6UbAcVis+gXyB2lrPI4O6S+
	 beNiO5mbJKU7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC87CD4851;
	Wed, 13 May 2026 10:44:25 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH v2 0/3] Khadas VIM4 PWM status LED support
Date: Wed, 13 May 2026 12:43:52 +0200
Message-Id: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOyw6CMBBFf4XM2jG0lufK/zAsahlkIg9tawMh/
 LsIa5dnknPuLODIMjkoowUsBXY8DhvIUwSm1cODkOuNQcYyjRMhUdc1PgP3Ct3sOqoxN0YkRSJ
 VkgrYtJelhqc9easOtvT+bGV/HOGuHaEZ+559GQ00edzrSir4CS07P9p5fymI3fi/HgTGmIksz
 0Sh1YWyq+6YunNjoVrX9QvcaMf24AAAAA==
X-Change-ID: 20260512-add-kvim4-sysled-8cc159524561
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=EftnxsZQyEGBjcaWoej2Qgq8pVFT9h/4EhbAduCDQPA=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQxZL6E+Dmm8zlZKebY8/e8GTM21JA3vlTlZPRlXWWr5v5
 +tCFLM7SlkYxLgYZMUUWfrnWp54d/noma971FNg5rAygQxh4OIUgIm8MmJkOMXlvmlW2mKd7Z0v
 f8wz3P5e/LXY3C+rtn60nrN99pLjD9YzMvQuX+H+e2K514Oo+ley2y7ysJjHqkrFHdIt3ztJ4MO
 FA4wA
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

This series adds support for the PWM-driven status LED on the Khadas
VIM4 board (Amlogic T7).

The VIM4 exposes a heartbeat LED wired to the PWM_AO_C output, routed
through pin group pwm_ao_c_d. Before wiring it up in the board DTS,
the SoC pinmux definitions had to be corrected: the original
pwm_ao_c node was conflating two distinct pin groups (pwm_ao_c_d and
pwm_ao_c_e) into a single ambiguous entry.

Patch 1 fixes the pwm_ao_c pinmux entries in the T7 DTSI by splitting
them into two properly named nodes. Neither alternate is in use yet,
so there is no functional impact on existing boards.

Patch 2 moves the xtal-clk node to restore alphabetical ordering among
root node children.

Patch 3 enables the pwm_ao_cd controller on the VIM4 and adds a
pwm-leds node with a heartbeat trigger.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v2:
- PATCH 2-3: Create a new patch specific to the reordering action.
             According to Neil's review.
- Link to v1: https://lore.kernel.org/r/20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr

---
Ronald Claveau (3):
      arm64: dts: amlogic: t7: Fix pwm_ao_c pinmux definitions
      arm64: dts: amlogic: t7: khadas-vim4: reorder root node
      arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven status LED

 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 30 +++++++++++++++++-----
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 12 +++++++--
 2 files changed, 33 insertions(+), 9 deletions(-)
---
base-commit: 31f32e8cdf59291e467250dfc57d1a8c718f63d2
change-id: 20260512-add-kvim4-sysled-8cc159524561

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>



