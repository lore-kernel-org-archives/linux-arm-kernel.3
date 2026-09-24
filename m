Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8F5C98325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYWXI6vX2cv7QnVwwZvXd4tN+q64FX+cupNU+kNXi54=; b=JmEsyrJLtPd5g2iWjZy+14N+BK
	UFlAQG0LlR5cMB7sTiZpXAvnZ/Q0UN6+jD+Jd9+SULX2LtSVVo55GEfqadGLdvq/Slm0jZ86+EXBu
	U8UviOP7aEoqU2gkXRpwzf1Bc/GNEnTX8KUFupYvMN9BXHsFMtrxUuhl4+68PfKsZAzeByG+99n40
	Oa7B2e5Qbb6x431YNbJ8Al7yj2RYgt1OX4s1TiLSRmJhmZ6DeLOEELUY7wixdFKLNChw5CdoNXUMx
	B10tB9y6XQDukR7x/ciWW9GDYjaIzEDvDZ4uNQ4JxGZRuCYpMZDx6IhN40QvgOQ8mxYG7NSOfbw1p
	3NE86gmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lAJ-0000000BM3e-1d2h;
	Thu, 24 Sep 2026 15:15:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lAH-0000000BM24-2jF2;
	Thu, 24 Sep 2026 15:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4E0044042;
	Thu, 24 Sep 2026 15:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF5FDC2BCFA;
	Thu, 24 Sep 2026 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790262912;
	bh=C204W/yB+PghlPEk0hny36BOqfLvlmVXE04baWTGylE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hKk1fhuWqe50DwR4hUjM0wcJCN7HNE7AooEFKMQNF2KAz3qOTVu1fR71Gej4n96Xw
	 hI5HmHr+T0WTxQZc2xZkEnRxWZ5lWonRklgcXnbUOVzR9nUDQyn98dGFC5mgEfOXkZ
	 GjvbSm8tDfom4Ad00oNhNHtEvYuYclRdJ+st8j7EugISmOxS3D/s29pV8MgBze6QTH
	 8113wxzOxbMEx9lZS9ANCLczOHF5HPv5q5OW40roZKh5SVNUFt+A4mxtWwsp0jrFAD
	 3EPQyiaHMQHOPrwWXkDTMypvSiOfnm0MKCO2QQdLjtHnxkBCOtXEugtz/cHbsuX2LJ
	 AjyeL40Sv+WBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E506C98324;
	Thu, 24 Sep 2026 15:15:12 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 24 Sep 2026 17:14:29 +0200
Subject: [PATCH 2/3] pwm: meson: Add optional core clock for S4 PWM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-add-t7-sys-pwm-clk-v1-2-05b91e87f0a9@aliel.fr>
References: <20260924-add-t7-sys-pwm-clk-v1-0-05b91e87f0a9@aliel.fr>
In-Reply-To: <20260924-add-t7-sys-pwm-clk-v1-0-05b91e87f0a9@aliel.fr>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=38T10zBYHuRS2HPS8ZW7iUWdDAPvTmkAaZ2SgSI77jU=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9ZWu6pT15LsDn55aiS9828tt1ONuOfjKCMHl1x+waIF6
 Sptohs7SlkYxLgYZMUUWfrnWp54d/noma971FNg5rAygQxh4OIUgInwnmf4K7ORZY3ewcW6e59X
 vrBM4dPxuiEtHrcxcdOHBUEqk/XDrjIy9J2ov5QxPThz4/Gn0yfd2MU4/0imuY5F9fGYj7tucZl
 Z8wEA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

On some SoCs (e.g. T7), the PWM controller has a system clock that must
be enabled to access its registers, in addition to the per-channel
input clocks.

Get and enable it with devm_clk_get_optional_enabled() using the
"core" name. The clock is optional, so existing SoCs and device trees
that do not provide it keep working unchanged.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/pwm/pwm-meson.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 20e6cd07127c4..5ab07322e8d15 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -508,8 +508,13 @@ static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
 	struct device *dev = pwmchip_parent(chip);
 	struct device_node *np = dev->of_node;
 	struct meson_pwm *meson = to_meson_pwm(chip);
+	struct clk *core_clk;
 	int i, ret;
 
+	core_clk = devm_clk_get_optional_enabled(dev, "core");
+	if (IS_ERR(core_clk))
+		return dev_err_probe(dev, PTR_ERR(core_clk), "Failed to get core clock\n");
+
 	for (i = 0; i < MESON_NUM_PWMS; i++) {
 		meson->channels[i].clk = of_clk_get(np, i);
 		if (IS_ERR(meson->channels[i].clk))

-- 
2.49.0



