Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4DCE784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 18:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oaUC9LI3elKfK3dSHnAIr/04lkVLw5nLjwexGRodyx0=; b=XZF7iPRhKOzlcLNQ5R3W63LaRk
	9mzJ9Gn5JHftajkN779Lvj0Bn7578ErFN9rGUAaaPhKNlFTGXbr1myo03oi2tVQ8CSsqTCeXrqF7D
	qYNQaPL7rPJV2uXvYFh1n/MWlIssz5yJV1P4a+WT9lXUMVq4p8bgaPtXDzKLAT+I02FjoZJi7JwGL
	ZtYrC8j4ikQ0QWXYAZU6B2ShhGhKU2/DkVveZt3jOfrqmU7aQWXhwdAXfds8gObM1R4C4rl4b2LZv
	x1c18+L72xy9YMoh+1+zwolm/45ZfdK2REbcdkEfMMJSLaLCXqLVzI8mwRkJJOvD44diSogIL+PgA
	modL/9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZv9L-00000002wfB-15Ev;
	Sun, 28 Dec 2025 18:05:51 +0000
Received: from mail-4398.protonmail.ch ([185.70.43.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZv9I-00000002weq-1X7E
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 18:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail2; t=1766945142; x=1767204342;
	bh=oaUC9LI3elKfK3dSHnAIr/04lkVLw5nLjwexGRodyx0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Yey80o5cRU02yCd6jBEfTCDJhi4okVdB8KtrhHxCDFV/4PPXpSqFCU7aAKwVuveQU
	 jayNfPWmjiUAIC5tcmdwhhcKiQPXuwR79lTzBz8YCNd9i2Au3WX+vbRDQJNGwlfNEI
	 yMKLf7RKFO6QeYwkOQqDiIUAE6IhfGpLZe8rCsyK9HUA4MIuuKnLi4D5ZmH49iXRv7
	 JhXeWDt6CgDTcW42kHaVcrodSwJUtZQWqfQXbBov039jK1W2ADqtV47EaWqGbJe4+x
	 vxGUm7G2DnOnEtApOTCZmkd9W4ORgBqS4s/mw36ZOdVQvH4s6sYRSSBYJR188iKtze
	 mFAZyMFuJKzVA==
Date: Sun, 28 Dec 2025 18:05:39 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH v2 0/3] pinctrl: samsung: add Exynos9610 pinctrl support
Message-ID: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 03372dea5be5ce295a5aa4e421e99660dc2dfff6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_100549_231083_B3C63E0C 
X-CRM114-Status: UNSURE (   5.49  )
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

This patchset adds support for the pin controller found on Exynos9610.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
v2:
- Set proper FLTCON offsets for ALIVE, FSYS, DISPAUD, TOP pin banks
- Define samsung_pin_bank_data structures as initialization constants
---
Alexandru Chimac (3):
      dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
      pinctrl: samsung: Add Exynos9610 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 109 +++++++++++++++++=
++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 5 files changed, 115 insertions(+)
---
base-commit: 48c4c0b684f394721b7db809e1cc282fccdb33da
change-id: 20250914-exynos9610-pinctrl-b44cdfaeeed1

Best regards,
--
Alexandru Chimac <alex@chimac.ro>

---
Alexandru Chimac (3):
      dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
      pinctrl: samsung: Add Exynos9610 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 117 +++++++++++++++++=
++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 5 files changed, 123 insertions(+)
---
base-commit: 3e7f562e20ee87a25e104ef4fce557d39d62fa85
change-id: 20251228-exynos9610-pinctrl-7d7988fd50a1

Best regards,
--=20
Alexandru Chimac <alex@chimac.ro>



