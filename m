Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A9CC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 20:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X9ESZFhDEX/I0bAVwl6NkW9BqW6x4/98rA7nS506J2M=; b=A/NfdFxaoOiKxG
	wYIhk3iTZaYX1+wi2kppksa0eSEyOX/PKQYYU+TITyBVhdO1xPXDFNohTCPbNfTnLFR1goSWHUZoK
	R61vxltTac3Zyia6Yntwy+XiIndNm8ZTEybvT97kZO5ouXIvLcyn/vezsxJsTEPNsjZAfz6zmHWQn
	8wE9qXguO2Yg/8hxShh+LxnWgfah5FbNclfY8g0ChUxd8Vv43nPOVhYPzZ+9RR9gICUYh38thBjQp
	D18ifW1JJZZY6LgLVXN/Bjl8rK//+NNxA9lH5jaAd/TjbdxmVDsVARAQ2sAn+sFb6sV6yLlSpvt3g
	vaAHC8bKWGuEnkzGLwMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Lp-0000000Ga7u-3ErA;
	Mon, 03 Feb 2025 20:47:25 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Ao-0000000GXwR-1f8U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:36:03 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2014425A8D;
	Mon,  3 Feb 2025 21:35:57 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ege8AFfLagUn; Mon,  3 Feb 2025 21:35:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614956; bh=wyQCBq9DjeAid6FvobzALCpOnFonfXuOOwKS2EAE/Qk=;
	h=From:Subject:Date:To:Cc;
	b=CN+kqb9tPKDRZWtxkgdMx6XSyBV6f+WroWtfmeAlGUZ1lC2PZ0HmzlJZ3jdb99IGz
	 E0iGSXvCaWGOgECbssScIVvaTzZqQd3NytYqUom+G/kgwSQc28BxSYBYUGTATdZRFT
	 QtZaDpOucFvXHwCUN3rU0j5JJLkS11Z7ng0LhlHtFQLasEvEGHkUGkfWPpoZGZxwwi
	 J14cgqLPaZSxEf1nwO8LF0bkLnc/z/l7b39eCb0kDOPBGh5276GuSA91HR+b850tNN
	 e1H1qmJQucTa41zvNloQdL1ENnsnQUaHydtxYHv841RMKgxXxUupY57AjIHRGCCqAw
	 0ziorugmFaD8g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/3] Introduce pin controller support for Exynos7870
Date: Tue, 04 Feb 2025 02:05:42 +0530
Message-Id: <20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ4ooWcC/x3MQQqAIBBA0avErBNGI62uEi2ixhoIDY0wwrsnL
 d/i/xciBaYIQ/VCoJsje1cg6wqWfXYbCV6LQaFqUWEjKD3OR9MZFCe75QqHQKN0a43sUUso4Rn
 Icvqn45TzBzmdo95kAAAA
X-Change-ID: 20250203-exynos7870-pinctrl-07265f719061
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614951; l=1117;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=wyQCBq9DjeAid6FvobzALCpOnFonfXuOOwKS2EAE/Qk=;
 b=HXBcv69E5BIZnhQpyh7eiIErbwYj9N+jx6T9eEqdpuivBxypbOnA6ZyH8wZEkmm4fNO4kwY5q
 j0tu3Kb/F4wCgqfa+nX73xopN2AL5wlOqqATIWWaY9eONf4785Eez8c
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123602_568492_271FA0EA 
X-CRM114-Status: UNSURE (   8.06  )
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
Kaustabh Chakraborty (2):
      dt-bindings: pinctrl: samsung: add exynos7870-pinctrl compatible
      dt-bindings: pinctrl: samsung: add exynos7870-wakeup-eint compatible

Sergey Lisov (1):
      pinctrl: samsung: add support for exynos7870 pinctrl

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 141 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h           |  29 +++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 6 files changed, 176 insertions(+)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-pinctrl-07265f719061

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


