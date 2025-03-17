Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A7FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 19:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wPAOC+w3Lk3IO27buD8tzQ7nFxGTpb44iIOvoPy+Uiw=; b=hgEgouj/xkP5lw
	e5AArTBF0VAdS+GM75UYxI2gIsVCTltSX2GbOBlP241OrRQPsohQgmWkODWBKbXWtnUycbSdVf0tU
	hvL5crNvotC2DzyMYib5uvaXT0dWSXT5QFZgGfP9G22xpg1mLHlb5m41Vc/qRLiUiBHyOhNsHhXmh
	Uej1adaR1r/6H9edahLs6CUpri0pNajNe7Fd+XunDlQvg/tlv7wLN602OW786FF52Gy3Jrf6iBoNu
	w4FbNhKo4Rh6lJWLzbi7rRFUGIV8VXd3APsoomh9jL76fHOI/c6LOrRWZIZtCpnol5PZ+JqWCcoN/
	rbDKsWRwF1iW4vGSFkhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGFg-00000003pGm-3dHI;
	Mon, 17 Mar 2025 19:35:56 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGCP-00000003out-1RN9;
	Mon, 17 Mar 2025 19:32:34 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8C0F425989;
	Mon, 17 Mar 2025 20:32:28 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 482UUYVCRaQc; Mon, 17 Mar 2025 20:32:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1742239933; bh=lGmY4p1VRzYFACIa5FUQnatEVrtfwJ9hMuMP3qnvkpg=;
	h=From:Subject:Date:To:Cc;
	b=R9OWoe6FSuBqgImq7TpfMos4ZiBRprbQSPoH9ytSiEWfUGwwNu33LDwACZitBNYdj
	 QNSV+DqD/PP0rtmhNGMuP+3w9WoWZbL2dwrIzSFh9Twk2HJKPEl9OcP4RJew8Dqfem
	 1aMUv/zrBnxSCQmi5/Af6mQgkVKXNhFDrDBxa7OLkCAa2jD8cXFPAHJphsyF6YITA3
	 UkyXrBB0lL3Nq6ZMqFtN+ooLOuGaIiJRugo2zbbcZIdlF8hr1F/sNJS1EggD4D3t7X
	 qg1BTpuLhQQnEK/qBDueU/Tjpna3qencXeqmhK4Kw6LZR1c1WX20SlYnHzI38MYsDf
	 gxtLwIEu/nT9g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH RESEND v2 0/3] Introduce USBDRD-PHY support for Exynos7870
 SoC
Date: Tue, 18 Mar 2025 01:01:40 +0530
Message-Id: <20250318-exynos7870-usbphy-v2-0-551433b1b27c@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742239924; l=1208;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=lGmY4p1VRzYFACIa5FUQnatEVrtfwJ9hMuMP3qnvkpg=;
 b=Ioi0x7v/fqX26/WW74A2LJdQiVqOJ1v8TZ6YsZJgFaFkZPIGr6fDansoFn24pLSjnf1SkeZ38
 ck6U6cOTkWkBolOYnuWHVca94vJiFhhJgdE8cjBdR4wJQkqNF1a+RCW
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_123233_519851_6FEA1BDD 
X-CRM114-Status: UNSURE (   7.36  )
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

Apart from introducing driver support and documentation, this patch series
also introduces a masking fix and non-functional changes.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- Do away with [PATCH 1/4] from v1 as it was sent separately.
- Take over ownership of patches by the co-author, upon their request.
- Link to v1: https://lore.kernel.org/r/20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org

---
Kaustabh Chakraborty (3):
      phy: exynos5-usbdrd: use GENMASK and FIELD_PREP for Exynos5 PHY registers
      dt-bindings: phy: samsung,usb3-drd-phy: add exynos7870-usbdrd-phy compatible
      phy: exynos5-usbdrd: add exynos7870 USBDRD support

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |   2 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 407 +++++++++++++++++----
 include/linux/soc/samsung/exynos-regs-pmu.h        |   2 +
 3 files changed, 339 insertions(+), 72 deletions(-)
---
base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
change-id: 20250203-exynos7870-usbphy-6b98936f441d

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


