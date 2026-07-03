Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8029DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIVGJcDfvA5ZwpQKNPuEjeP78VvaCq6n4AxhxUcG/F8=; b=wjWL10xrDyzO83JbJbkaa6mV0t
	V2mOkcpZoPbekb0n6LwWjpHsEJRNR4OGTg0Ff0Y3cQ/2oF/wM6w+9iDDaZdlt0q3BAMQccf7YIl0i
	L9oLvtDMF4QwhroJ3U7MdI5xDkUGA+nC8rFJ2d8VHLZFgjUz+yOIi/Qy9jCUVOFsNcQhhpyx0TIpC
	8ArInnp2twySH72XCdIb3i86/XLJueHF3rEKVwycQSu6GVLNfHHvNGLA7UnLVNsgqTJb3tu/hrgeB
	vCOZlOKe05NQNFo/iR7OQt8NrYXvZKpmkNYOUU+AY/dfFcNtrPp2LN5JdzXhlgI3VCH0z/D4hLmTk
	2tN+Orbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffj4-00000007OCT-07L4;
	Fri, 03 Jul 2026 15:22:46 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffj1-00000007O96-2GNE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 15:22:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D11091A0E22;
	Fri,  3 Jul 2026 15:22:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A645760300;
	Fri,  3 Jul 2026 15:22:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14CC5104C952E;
	Fri,  3 Jul 2026 17:22:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783092160; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qIVGJcDfvA5ZwpQKNPuEjeP78VvaCq6n4AxhxUcG/F8=;
	b=tEU7CuTohFUte7Uxofd/BDZ3rp9SvjYA1AV43V/vdIK0AI6NUgHSOdIGWTcXPE8hHkWCJ2
	piOyMPm2BEpZOFvoVk8A1cdRW2cv8kGUqRhLmvkCMeNzeq71CGfvrHgDVwGCdSaAqs1uyK
	ycQ8m5CFW2e8y+gwsrmzgijSmhAAjqGn19zxXzCNopcsy6oMxvWin2A/yXFwFrV43frexP
	1AIE4WAsUZw5fqAIcELgWUa+lNYCueOGCViHPyD1aBU357XO4oa6BD9yhAVN5caKeicIeS
	31km40s2sgu47abjUfUz+Y9RbJTAGrOLMAlDiVsru8ftZFVRuTQiLTAS8bb3fg==
From: Richard Genoud <richard.genoud@bootlin.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	John Stultz <jstultz@google.com>,
	Joao Schim <joao@schimsalabim.eu>,
	bigunclemax@gmail.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v7 4/4] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM driver
Date: Fri,  3 Jul 2026 17:22:15 +0200
Message-ID: <20260703152215.192859-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703152215.192859-1-richard.genoud@bootlin.com>
References: <20260703152215.192859-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_082243_753729_9EB70B63 
X-CRM114-Status: UNSURE (   8.28  )
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

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..51ca159bcaf1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -919,6 +919,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>
-- 
2.47.3


