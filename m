Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5581EC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1DciAVRokxPcn1L9HDos7COkh0/2iR9jLvBMrYvTQJw=; b=Q5sMJzLnGR1645mgUVD8PVTsKb
	8Rudplp1v0i2GXAklfvmSET4KVuOdJfv+hGQV6TlQbEZ3/6CFz5LdAMeg49LhaYjGMGNdP2R7Y5kD
	aPnNMm52FG1D4keMVMm9+cM9bz8gEG8TiM2+6E43Rl+Z1sy7fpQASwTK2+LGhKQT0fs+k8MNz1OF1
	3F5DfDL9T4LmDZ/6sw6XsD02d9Doe5CU91WFHNdLj9eU/XF/1LX6dqL897t8ReM+aXyVo/10NR7Z6
	z2U5daJ/SsO+xswlFRc1+D98D2vWn045tPHLxbUREhp0yagEY7NwyDf12b7+mSUwgD//8qYh639gE
	fgrexZ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSXI-00000000Rla-28Z7;
	Thu, 13 Aug 2026 10:19:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSXH-00000000Rjw-15HI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 10:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82105600AD;
	Thu, 13 Aug 2026 10:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C91DC19425;
	Thu, 13 Aug 2026 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786616382;
	bh=SJDE1Y6wyBQ85Y66UA/dDM+xt1Anlk6x3sBOuqBhgZU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EiSsLd2yA+kZfYusxLpQSuXVZQgSnq1Qs6w4wzJYMDqnMQ4PaFxgJyAvNiNr4W7yI
	 5oPQYyWqzOZvcBYb9yhRj1I3LsvLObqAe2qPatd12EcnKD2v9q9DueJGruqsp1EhnH
	 NPX4tEUbJ0Ui5M1YbET5+67CDbbjsQUI8IUbzdF8bGZ5e67b4CDRyE3EcZ5mcH0hZP
	 jGS48rHI1ZrxOtJMN4QzbOvsdWjzeDfOPYggCrLWc2rC9qBA+EDbZ5CGttZC6mrrEN
	 PDdbABDxYBhDEi/2UYKRw18pYl1GOX8cruaUUZrQGjEtyw1mV6ONCxsSoaSvDAPhWm
	 GKtwi7Mf+tB7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0899EC5CFEB;
	Thu, 13 Aug 2026 10:19:42 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Subject: [PATCH v3 0/3] Ambarella CV75: pinctrl and PL061 GPIO
Date: Thu, 13 Aug 2026 18:19:35 +0800
Message-Id: <20260813-cv75-v3-b-v3-0-1d82e18da09b@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADiafWoC/yXMQQ5AMBBA0avIrE1CJ0pcRSy0BmOBtDQScXfF8
 iU//wLPTthDnVzgOIiXdYmgNAE7dcvIKH00qEzprMoJbSgLDIQGq0LlWlNHWjHEfnM8yPm9mva
 3P8zMdn8HcN8PipT8HG0AAAA=
X-Change-ID: 20260813-cv75-v3-b-8521663a362e
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786616380; l=1753;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=SJDE1Y6wyBQ85Y66UA/dDM+xt1Anlk6x3sBOuqBhgZU=;
 b=7wMvdXyZV5AuuFfYWy35sAWu8p8pkJOi8yy9vOlUwmaSxl+eTcRezkGRSI91D4KoReHb5Hd/s
 Yk4w3TsxwQnCXpY+avWuyCTi1JdsMGpIFPBU8ryO9QYyUJgNPswJstu
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This is part B of a 3-part CV75 v3 split:

  A: bindings + RCT/CCU clocks + SoC/EVK DT + MAINTAINERS
  B: pinctrl + PL061 GPIO variant  (this series)
  C: 8250_dw UART quirks

Depends on series A:
https://lore.kernel.org/r/20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com

Link to v2:
https://lore.kernel.org/r/20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com

Summary:
- CV75 pinctrl binding and driver
- Ambarella register-layout variant for gpio-pl061

Changes since v2 (B scope):
- reuse PL061 with Ambarella register-layout variant (Linus)
- model each GPIO bank as a separate DT/AMBA primecell node (Linus)
- complete function/groups enums in the pinctrl binding (Krzysztof)

Verified on CV75 with A+B+C.

Signed-off-by: Long Zhao <longzhao@ambarella.com>

---
Long Zhao (3):
      dt-bindings: pinctrl: add Ambarella CV75 pinctrl
      gpio: pl061: add Ambarella CV75 register layout variant
      pinctrl: ambarella: add CV75 pin controller

 .../devicetree/bindings/gpio/pl061-gpio.yaml       |  35 +-
 .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   | 240 ++++++
 drivers/gpio/gpio-pl061.c                          | 280 +++++--
 drivers/pinctrl/Kconfig                            |  13 +
 drivers/pinctrl/Makefile                           |   2 +
 drivers/pinctrl/pinctrl-ambarella-cv75.c           | 561 ++++++++++++++
 drivers/pinctrl/pinctrl-ambarella.c                | 839 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-ambarella.h                |  50 ++
 8 files changed, 1949 insertions(+), 71 deletions(-)
---
base-commit: 18bf29fba8d0bdd0db5a0497ecf06f404bc740d1
change-id: 20260813-cv75-v3-b-8521663a362e

Best regards,
--  
Long Zhao <longzhao@ambarella.com>



