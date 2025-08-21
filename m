Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4E0CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zuDXhUaVbI1o+IrkCJM4dgOmXoR3k3IRboJF1ey+iOo=; b=JMGdyGPOTEtcv6
	LTI0oiopC/O2Q+x/CKyb1icFK2cJXU77V0lUXWTB3eq1tF0gCblmucuYlaPmVQf4pjTGdvXzJh938
	ukUKGqPFpfdFSytA30FwZ7NecU+499TT5szIbIxWmC4HJ7j8EjvhYDH3NSUDp8CTk/UPBEfAFqYie
	Tx52TQUfTIDgavncy1prGKHkYIZHmziaFmAr3qFxHXQZVj3SxCF+uz4Nr1f6FOg+83rW/h0ZxUY4y
	8oZbgL2kGSO2ZhNir5uHKd6cAEyWLDbWrkGYiB5vQQkFap937UMFy8yz4CWgZHGVzeO8PoA+3Lwc/
	f7XiKWUhnsGgbmEPdjzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7F0-0000000HMTk-2TzP;
	Thu, 21 Aug 2025 15:30:14 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3KJ-0000000GjVN-1n5q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:19:30 +0000
DKIM-Signature: a=rsa-sha256; bh=zuDXhUaVbI1o+IrkCJM4dgOmXoR3k3IRboJF1ey+iOo=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1755775103; v=1; x=1756207103;
 b=LfGu6AX6zn3iHGQrTUMlYAzfuvKD9+w7FLpMrRhe+UpBuYg+uqjoyFw+mjHz5okN1A9i+N8e
 hYc2N2WdQBjQQ9hpylriRcHU4LOkyTGs+DMtM3c7/JXU/L9vOm1cYHPAr5A0iBXlziY/erduAUT
 Nn1e5icbR0XnrLVwaU7sf5uDW0cz4l3SEvIj056wXLcAlc2FTCjWVUHmN3E/eoI79kr5bcNRhlE
 qnnmWFi7YQEEnt0CIt+7UG1HW07AehFx3+1BQbPPP6ih6eothChCcOZj7cx0kxrqXiNhcnV8VrE
 /Q6zoB+ycVLDF4hTvFx0eb//6q5h7H45k/NZRtu6GEniA==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 4292832e; Thu, 21 Aug 2025 13:18:23 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Subject: [PATCH v2 0/4] Marvell PXA1908 power domains
Date: Thu, 21 Aug 2025 13:17:42 +0200
Message-Id: <20250821-pxa1908-genpd-v2-0-eba413edd526@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFYAp2gC/13OQQ6CMBCF4auQWVszLYKUlfcwLLAdYEykpNUGJ
 NzdSuLG5f+S+TIrBPJMAepsBU+RA7sxhTpkYIZ27EmwTQ0KVYEV5mKaW6mxEj2NkxWy0LKyt0K
 VaCDdTJ46nnfv2qQeODydX3Y+yu/6k8o/KUqBQpYn1DnqzpzVxb7u9OD0hItsjvPyhmbbtg+EU
 vYusgAAAA==
X-Change-ID: 20250803-pxa1908-genpd-15918db5260c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=QZBYqJR9GIOU0pjiUfjKPUr1zZosXiQty5puvKsrKBs=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBnLGerCXv1py7VieHLCO7a/P9lJIrJWStb+pPKuK9GVK
 m1CjBYdpSwMYlwMsmKKLLn/Ha/xfhbZuj17mQHMHFYmkCEMXJwCMJFVuxj+F/soLiya3nja7EVK
 oG3xCZ+Z0/PCZfq2l1b2LN1vy5knyfC/zlGj7nn3+ecyVTKffffWZi4y+ZBhlNVs3j6/t4z7wS1
 mAA==
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_041928_483174_50A61003 
X-CRM114-Status: UNSURE (   8.53  )
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

Hello,

This series implements support for the power domains found in Marvell's
PXA1908 SoC. The domains control power for the graphics, video and image
processors along with the DSI PHY.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Changes in v2:
- Move driver to clk subsystem (domains are instantiated by clock
  driver)
- Drop power controller schema
- Drop RFC prefix
- Rebase on v6.17-rc2
- Link to v1: https://lore.kernel.org/r/20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz

---
Duje Mihanović (4):
      dt-bindings: clock: marvell,pxa1908: Add syscon compatible to apmu
      dt-bindings: power: Add Marvell PXA1908 domains
      clk: mmp: Add PXA1908 power domain driver
      arm64: dts: marvell: pxa1908: Add power domains

 .../devicetree/bindings/clock/marvell,pxa1908.yaml |  30 ++-
 MAINTAINERS                                        |   5 +
 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts |   1 +
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       |   5 +-
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/mmp/Kconfig                            |  14 ++
 drivers/clk/mmp/Makefile                           |   5 +-
 drivers/clk/mmp/clk-pxa1908-apmu.c                 |   2 +-
 drivers/clk/mmp/clk.h                              |   2 +
 drivers/clk/mmp/pxa1908-power-domains.c            | 253 +++++++++++++++++++++
 include/dt-bindings/power/marvell,pxa1908-power.h  |  17 ++
 11 files changed, 326 insertions(+), 9 deletions(-)
---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250803-pxa1908-genpd-15918db5260c

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>


