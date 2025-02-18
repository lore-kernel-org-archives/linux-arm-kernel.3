Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDF3C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6PI1ISFHiZBUZu/Ii4bms63AR2LmdJCr+hKni92PDTo=; b=SKBXBlsw9Mlc4q
	LEAw3Sw6qjHigBQZl6qX2WIRYNgDyPnSm+kiBgBO98oFZ2/HERN3ABYRESNQc6pxjLLExybruF+/U
	LDN+OJ2mIfOosSuBrf5TUoxrflCCwqPyEpc8w6wkdUtiHQef8tIgtNtXn/rc6amfx5S15yqYnKwSS
	ZEUsGLy1MRSArYF/8SBnaHx9f5qvTWSXu7mxfkE3KtIdmumbK2yPCuw5IKcRX8yRHSTLOI3d7WkcE
	9qFeRgWp5yV1v8Cs+K0io3cDvLzy5fWAGPxRrNDs4YMYw1zmzq5i0Rw8JREcJraKv7Ri921tFy81U
	UOIqmeRnknDTImH/EnkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSuR-00000009UsN-0qDH;
	Tue, 18 Feb 2025 19:05:31 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSeo-00000009QZc-2tpO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:49:24 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7431825F75;
	Tue, 18 Feb 2025 19:49:21 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBDZ0cCM_kBQ; Tue, 18 Feb 2025 19:49:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904557; bh=mu4DL52dax5XNXsfxCOUhTgjTpU2ZBw1b0womh5uByM=;
	h=From:Subject:Date:To:Cc;
	b=Hv4RSM013Sz9Np6jahU4+eKmOsRGWTHAO3QNvIoS6wZg+ZwInOpG1cGZCdD+w5jwN
	 xpL4FyadDiFwJdv6TAOTbr1iKwy5yIJUpS0oYyOXlSvwqV60b24XEF3LYQYypgPVWm
	 hiv0pWleGiUBbJ74IXh7Lowe2IL1LPZYXHbm3bNRvtYlcumJU7I7eUcZ0QTXvzj3UP
	 H5SizG2B2nZIokOYOwXtFW6C9gEZim7LmnNOj7YOk8Hos7PT+0OnjR5PaHsVyxtBAM
	 UTFDEtxo1Fkr/i+CE78VlltbEpYEI2zRw38AFTk7p+UtBLwf9I9XVXYShZuhrNjquz
	 XAEK/2tj9iOqg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/3] Introduce pin controller support for Exynos7870
Date: Wed, 19 Feb 2025 00:18:56 +0530
Message-Id: <20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABjWtGcC/22NQQqDMBBFryKzbsokVUe76j2Ki6pRB0oikyCKe
 PemQnddvgf//R2CFbYB7tkOYhcO7F0Cc8mgm15utIr7xGDQFGjwpuy6OR+oIlQzuy7KWyGZshh
 I11hqSMNZ7MDrGX02iScO0ct2fiz6a3+5/F9u0QoVUVtXiJTXLT16DuJ9vHoZoTmO4wNsWGwLt
 gAAAA==
X-Change-ID: 20250203-exynos7870-pinctrl-07265f719061
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904552; l=1290;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=mu4DL52dax5XNXsfxCOUhTgjTpU2ZBw1b0womh5uByM=;
 b=PzYnIM2lWsCoLkGa3R8NJ+kI6BmF8pgCNCKA0dWf36zvs4RCqb0sv2q+AkgsNSQZ0eC6dF+lu
 OkC9Rpdsl2IDeRsyPVPJuDIV/cA6OEJ9nCsaYptnVqcbNJUXTEEt+cF
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_104922_866545_63D2CD12 
X-CRM114-Status: UNSURE (   8.50  )
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

Add support for exynos7870 in the pinctrl driver. Also, document the
ALIVE pin controller's wakeup interrupt compatible.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- Take over ownership of patches by the co-author, upon their request.
- Link to v1: https://lore.kernel.org/r/20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org

---
Kaustabh Chakraborty (3):
      dt-bindings: pinctrl: samsung: add exynos7870-pinctrl compatible
      dt-bindings: pinctrl: samsung: add exynos7870-wakeup-eint compatible
      pinctrl: samsung: add support for exynos7870 pinctrl

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 141 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h           |  29 +++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 6 files changed, 176 insertions(+)
---
base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
change-id: 20250203-exynos7870-pinctrl-07265f719061

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


