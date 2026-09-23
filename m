Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A2AC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=15qVhrpX9D4feOFrpC+t5KKDUrFwJlP6iei7fLifk0c=; b=lSJWa3QcEl5UE94uR5MZ1p8S0v
	w7ceOgdS/1BUcueVG8H81WqYBO7jyjOgNh2EY9yQXV5b2YkCZwrmJ+e0IXt6YhvgSHbIdOj784T6+
	LeK4fpMfgzeqeVdp0dV1b9FNsaoR+gGpv5RDKEiJEZ3BziTwmrPq6TqvkbnPE8kOzGiSHX4g1KuFF
	cmXeqvniDqRNKLtp7m/WXnRQVL7bq2euPJkOgoz1Hrgn8VTyn4K+bDFlaSbQxTOXlNpb3fdk7ateE
	RqCkMGFTp4F3zF5eiGEu48TqAC8cN4rOfAY9314H76Nl+1I074u7ASSYdg1CCHDy1xHJBFTy8/MpG
	FY7iUmhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KxF-000000081aY-2oSi;
	Wed, 23 Sep 2026 11:16:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kx0-000000081Oq-1zS6;
	Wed, 23 Sep 2026 11:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF5A660200;
	Wed, 23 Sep 2026 11:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52392C2BCB8;
	Wed, 23 Sep 2026 11:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790162145;
	bh=HRSub+QE/8D3AF670B+wnGCu13xlGmfbVGSfPKurvgI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=U1Brx+dIs/rBOG68GdLQVFs34oyrCQfA+VCmiI0y2UP+0mNrIvkAk+GelnloSJbb2
	 XtttRHED30bJW6YeCchI4c6SvIxsXhMxMk2imVl9TB2Eka4MN62qXyS2xzTE2WGcAz
	 /MNxxgBeLxRmo7eZ6+r32SclvBJoxkFhdpaG0NjMt5LT1s0TmVL2V9v4iFsJJK1ArG
	 J5LzMQFwmoOZF7WzuB3n6g2uWxhbKF+3bzsOpLenaWkdJGr6VP838tTJRJJBxg4IqS
	 TfHQw78fZjJ9nBlRiC/EwXzAsjA2QZxBrhfqGZNEEiqzTCKmT1cbydFPgsaG3p+n21
	 3RGSofjz9ctbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24286C982EA;
	Wed, 23 Sep 2026 11:15:45 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH RFC 0/3] clk: meson: Refactor PLL pre-divider as a divider
 clock
Date: Wed, 23 Sep 2026 19:14:46 +0800
Message-Id: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKa0s2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNj3dzU4vy8+KLUtMTkkvyi+DzdVPM0I1NLA5NUU2MzJaC2AqBcZgX
 YyGilIDdnpdjaWgDD1C+zZwAAAA==
X-Change-ID: 20260923-meson_refactor_n-e7f25904e536
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790162143; l=2037;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=HRSub+QE/8D3AF670B+wnGCu13xlGmfbVGSfPKurvgI=;
 b=qmDP/SwmQ069y+a6xgYtXYhqff3EX/JqLT+8cgk6vr/IkknbC3kUvbzBiRxk5cunM2tXxSIMv
 CjmByR+ELneCRuqA5hTYSvE1SKb6yGQPrMwT8FtnqnIASFrSeV1OIXM
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
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
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series refactors the Meson PLL framework to remove the dedicated
PLL pre-divider (N) parameter from the PLL implementation and model it
as a separate divider clock.

Currently, the Meson PLL framework models the PLL pre-divider using a
dedicated n field in struct meson_clk_pll_data. This makes the
pre-divider part of the PLL-specific implementation, although the
Common Clock Framework already provides a generic divider clock.

This series separates the pre-divider from the PLL and makes the PLL
DCO take the pre-divider clock as its parent. This allows the
pre-divider to be modeled using the standard CCF divider implementation
and simplifies the PLL framework.

The series currently covers T7 as an RFC to get feedback on the
framework design before applying the same approach to other SoCs.

Series:
clk: meson: pll: Remove the dedicated n parameter
dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
clk: meson: t7: Model PLL pre-divider as a divider clock

The other Meson SoCs will be converted separately after the T7 PLL
framework refactoring has been reviewed and the overall approach is
agreed upon.

Any feedback on the proposed clock hierarchy and the separation of the
PLL pre-divider from the PLL itself would be appreciated.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Jian Hu (3):
      clk: meson: pll: Remove the dedicated n parameter
      dt-bindings: clock: amlogic: Add T7 pre-divider clock IDs
      clk: meson: t7: Model PLL pre-divider as a divider clock

 drivers/clk/meson/clk-pll.c                     | 178 +++++------------------
 drivers/clk/meson/clk-pll.h                     |  13 --
 drivers/clk/meson/t7-pll.c                      | 183 ++++++++++++++++++------
 include/dt-bindings/clock/amlogic,t7-pll-clkc.h |   6 +
 4 files changed, 181 insertions(+), 199 deletions(-)
---
base-commit: 43e1705ecab981c66baee89041e6f728c0436f19
change-id: 20260923-meson_refactor_n-e7f25904e536

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>



