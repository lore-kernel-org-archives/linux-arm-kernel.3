Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28A3C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 18:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uvbtjOUnjjWAIKZo3fLcqxmPStvjKL0DwwWNfs13Bag=; b=xGbCdO0zSbXVfu
	AA4N41ZjW+FUyrz1I+QVrsbuKjofkyIzKA7JyGAhuAosM9sU8zrB/CRx4zic2PsqTwycVITG52RIE
	CRkwYrVlwXNiBf5+uzdw2fOW51adayMVMJkqRjdENLDrlSLdbzA1v19cwJaK2aim3YVGolaacbENK
	wf9D5i8L+5Ct5DQfJ55Vd+RervN2iBDCFFjJlDnbReqImyc7SHRM82OWkozGOQJ57EUVM5g1lukXe
	WtS+y2pCLOG9IxHajyjXBhJSuZwmnYBE+0e7vq5hFQPQyAlF7JKVmYJQNmpfvORLt3OmwQQxRZyWD
	Nc2JGYeaHwHp2t+I6geA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSm0-00000009SgV-1VxB;
	Tue, 18 Feb 2025 18:56:48 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSe5-00000009QPi-3hIG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:48:39 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4A15B25B65;
	Tue, 18 Feb 2025 19:48:33 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTEc64bV_CrT; Tue, 18 Feb 2025 19:48:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904512; bh=YMTJWxXHh330br82br0etxC3kz7eh2nyIwBII22BIRg=;
	h=From:Subject:Date:To:Cc;
	b=T0CsyKyQz5J0X18a0h/L2r9JpQBQ9dSb3Buwpn/I2t+BHgx/HbyiIBHNRaC0uyLCW
	 eLtM7XxUZ+6H0dwkZv1D0VbEM3YWMMdU/lioM7PzaEzPm26nyMrGwbYtvVQD0RBV1Y
	 j4R7q2jmQ4RqmI+GlKklaj3viHSTzYYmZehubCAwram4QPjAcggyufwv3nQywn3cq0
	 ma4BQlasjNdpgdwGOYLcpiD2QDpQnYnrRFAhDJ4OGu8u2igCRxNM2JuZjSTbL5T5/d
	 M7jDvs2rHfzPErekjpqqTDT9Ub9CaF0E2OdA0fOjJluf0IWM91hxXVe7jpp67di0iY
	 IhbDt5IIhpnmw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/3] Introduce DW MMC support for Exynos7870
Date: Wed, 19 Feb 2025 00:17:46 +0530
Message-Id: <20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPVtGcC/13MQQqDMBCF4avIrJsSY2xCV96juNBx1FmYlESCI
 t69qdBNl/+D9x0QKTBFeBYHBEoc2bsc6lYAzp2bSPCQG5RUtVSyErTtzkdjjRTLgsLUfYe1rdA
 +NOTTO9DI2wW+2twzx9WH/fJT+V1/lP6nUimkQGtwRKN60l0zcAzer3cfJmjP8/wAsEEUxa4AA
 AA=
X-Change-ID: 20250203-exynos7870-mmc-75bac583c864
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Jaehoon Chung <jh80.chung@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904507; l=1253;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=YMTJWxXHh330br82br0etxC3kz7eh2nyIwBII22BIRg=;
 b=LZPho8AvHLw3wEQKSAqT37sfbjzg/HU7eUsKTXf8nEcvsTjTTnCilhT8CRmn1576PNG64Mnco
 jJWN2rpJhc1Aa8CzVfZUXxM57Y7EhyZiteNSLIeS/o74LQuhm3lGYre
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_104838_347001_A4A32B65 
X-CRM114-Status: GOOD (  10.00  )
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

This series adds support for SMU and non-SMU variants of Exynos7870 DW
MMC controllers.

Some DW MMC controllers require two 32-bit r/w from a 64-bit FIFO,
the series implements that feature as well.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- Take over ownership of patches by the co-author, upon their request.
- Link to v1: https://lore.kernel.org/r/20250204-exynos7870-mmc-v1-0-c87cfc72be4a@disroot.org

---
Kaustabh Chakraborty (3):
      dt-bindings: mmc: samsung,exynos-dw-mshc: add exynos7870 support
      mmc: dw_mmc: add a quirk for accessing 64-bit FIFOs in two halves
      mmc: dw_mmc: add exynos7870 DW MMC support

 .../bindings/mmc/samsung,exynos-dw-mshc.yaml       |  2 +
 drivers/mmc/host/dw_mmc-exynos.c                   | 41 +++++++++-
 drivers/mmc/host/dw_mmc.c                          | 94 +++++++++++++++++++++-
 drivers/mmc/host/dw_mmc.h                          | 27 +++++++
 4 files changed, 161 insertions(+), 3 deletions(-)
---
base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
change-id: 20250203-exynos7870-mmc-75bac583c864

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


