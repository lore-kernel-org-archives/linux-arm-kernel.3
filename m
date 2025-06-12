Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B76C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HVKvRk5s7YqZIIU7nV5V0nJPuOy2Jc7veLLKo/mUO+A=; b=j/yOqCwnx83i22
	Hu/6qzKQZ8kmp7xTrnKJKrFEoptS91Wwpmo1dBfti7TrHpKJuUISUKjjdOHpuvcWxKG88brGTsE6o
	6y4MjmkhkluL7umWthcRdn77i+bdljs5e7v3lDLd7SsMk5b9sY/yWQ6uzkIbays/GgkdGtBRDVGAL
	+fQNPdy97kaq8JMDGkVvwFdBAlhEqJbxeOtHlBz32AXocrqrMpT62mT7/nLJ60ggDHjkdUUt90znC
	k+7fyWFZ+TBcpGOrZLekU4NliyshdUUGS2ybzx3yWmoU1sFw8/gIfgB0AdyYrUxPyK0jtRNF8iXpi
	CxT04ehUcrg1DLk51CWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq6w-0000000EjB2-2cia;
	Thu, 12 Jun 2025 22:09:27 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjZ3-0000000Djot-3PDY;
	Thu, 12 Jun 2025 15:10:03 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7075025C7B;
	Thu, 12 Jun 2025 17:10:00 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guWSlxOGple0; Thu, 12 Jun 2025 17:09:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749740999; bh=dSXo45mIJJx9bDeTqNn31sUJ/q0OnjYwLXEix43Xrw0=;
	h=From:Subject:Date:To:Cc;
	b=glwmPQ2CSMUg8fREOyygECG6WwXxlVb+wX16fBWBwWSdhrZZs3DDXfSGRf1pL2KUv
	 XBiaj0mtIneJeaSpdZBwbrM27QMAN5ZPKHsV6E94LVOqygMVnlh5SbVyRkjXFLO4Kh
	 ytQFo315OmRo8ozmC6/lB7Q0RrpIFYHfa2se+eG2hA5HyScrGNlNJvvSRDeIFcvn1W
	 SRIFgp8gVdxMjO6SzYVMTTg/2XS95cuhMeOTEwdKhMQAsVdFC7vCD4C9jI6ilIy39i
	 WktJloerb2WhF6VsYwM/vsSLNVk712C2IvKdBN+1o4EAHlSK2VtT7yr+3wYeDgOHXZ
	 H+wnu1ViQdNqg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Support for Exynos7870's MIPI PHY blocks
Date: Thu, 12 Jun 2025 20:39:28 +0530
Message-Id: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKjtSmgC/x3MTQqAIBBA4avErBswy4yuEi36GWsWmSiEIt09a
 fkt3ssQyDMFGKsMnh4OfNuCpq5gOxd7EPJeDFJIJZRskWKyd9CDFnixY3Rnwk41ZtDK9OsioZT
 Ok+H4X6f5fT+Xq/nrZQAAAA==
X-Change-ID: 20250523-exynos7870-mipi-phy-451f875f6ba2
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749740994; l=845;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=dSXo45mIJJx9bDeTqNn31sUJ/q0OnjYwLXEix43Xrw0=;
 b=8D4uqf1bHJF54i/+4jjJQo9pGHE9cAYBK0Au1T4+ogxwrDYvP9PPCEjq13Ru+GQKkhUc+0qcS
 IlkF/AAqxdhCI54z50n1Z7RsvpIJIcihHrGP2kSNOtGQtBp+xNwGE3C
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_081001_987061_56F363BE 
X-CRM114-Status: UNSURE (   6.49  )
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

This patch series adds support for Exynos7870's MIPI DSIM (for display)
and CSIS (for camera) PHY blocks. It contains a single DSIM and three
CSIS PHYs.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (2):
      dt-bindings: phy: samsung,mipi-video-phy: document exynos7870 MIPI phy
      phy: exynos-mipi-video: introduce support for exynos7870

 .../bindings/phy/samsung,mipi-video-phy.yaml       | 29 ++++++++++--
 drivers/phy/samsung/phy-exynos-mipi-video.c        | 52 ++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  5 +++
 3 files changed, 82 insertions(+), 4 deletions(-)
---
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20250523-exynos7870-mipi-phy-451f875f6ba2

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


