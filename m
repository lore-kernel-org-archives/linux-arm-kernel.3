Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFA4C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5HTGr7GEF+SN2hKf389lwu3UvCZneAxbLYQAzf70zQk=; b=SYVjLBOJe/Wbm2
	xGzJaQtckeo/kSUjepzzeKA95xFQfjktF2Xcpo2S77K4N3teJ1OKhgfq0rDdmsRpoUyW7fqfytOyO
	PjGQ2yAcvT18+l/vRmvzr7fOq0I5rhhqjN+szpPIsL87UDi6egMsoJwpQn960z1wtF4gQn6GEhM91
	2aUrb01CGuk6jY57TSKjCmRc5myB138SBJhI0vBzxKAsj/o9t8a8t3PD2qkM9lZk1jaoMCJgfk9TB
	k554WwpOAG8hwPxq0/YdUeY3PWDBQiZttm68UO59SqcFpBaIPNNUCdJckGFY+D+Y+Rvq5ANpxxNR2
	CO5sWdufzGWik+bnM+Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6CG-0000000CNtC-21yY;
	Fri, 28 Feb 2025 19:38:56 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to69C-0000000CNEM-2yck
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:35:48 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B5784258FD;
	Fri, 28 Feb 2025 20:35:41 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0E-YoFxkxdp; Fri, 28 Feb 2025 20:35:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740771337; bh=bp6gbMUp3288WL0ToRvNVxjxkQMxQTnl5A0aQxSywk4=;
	h=From:Subject:Date:To:Cc;
	b=MmyKNJi5Dhjy0uJHfh8yvLRtVRE44e109l5GnaIQQW/dHucAbIZDyuBTP72inZOfh
	 mX4QPOd6d0hpfGH6eAjq0WAwUk/VgnHte4DHsFj5OuY+zKny9NjlwIuKz7n9Hp6DII
	 w1SrSCt/SwoTSbyEE9hfC7LrRUpXWOvDntN9Dq5zfaha3+PpnDnDjlpbnSjpH/y2A8
	 CCnIjnlWpvX8zqLiVvXNmdriIj5Y2GFnte509d/v1zSNd3Gkp55h67hF5s/kxJE0sA
	 jPtEu0GObgMY/melpG8z7CqJM/iz8ZPzQ6k+WzxYK8pbGpqZR17KOTapcyH0nxGXSg
	 BDZptplsDf8wg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/3] Introduce pin controller support for Exynos7870
Date: Sat, 01 Mar 2025 01:05:16 +0530
Message-Id: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPQPwmcC/23NTQqDMBCG4atI1k2ZiT9juuo9SheNJhooRhIJi
 nj3RqHQgsv3g3lmZUF7qwO7ZSvzOtpg3ZAiv2Ss6V9Dp7ltUzMBogQBOdfzMrhANQEf7dBM/s2
 BRFUaQgkVsnQ4em3sfKCPZ+rehsn55fgRcV+/XHHGReTAiZSsAaiQiu6tDd656ep8x3Ywih8E5
 SkiEoLGSIWgjMT8H9m27QNpOlNe+wAAAA==
X-Change-ID: 20250203-exynos7870-pinctrl-07265f719061
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740771331; l=1455;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=bp6gbMUp3288WL0ToRvNVxjxkQMxQTnl5A0aQxSywk4=;
 b=tCe2GcdQ+1bzf4pENv8Xc7aJ42CXG+7QuHLbOCQmo6xlDriCKCb9GFMvRIcY6vvE51kZQMDqp
 ZUszi2MRbpUAslID4B/9HlVwGE1rcsBGtl2h+Tmm0rMkIPHiBvoUqU+
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_113547_155955_BEF6E253 
X-CRM114-Status: UNSURE (   8.67  )
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
Changes in v3:
- Reuse some structs and macros from exynos8895.
- Link to v2: https://lore.kernel.org/r/20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org

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
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 139 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h           |  19 +++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 6 files changed, 164 insertions(+)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250203-exynos7870-pinctrl-07265f719061

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


