Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1752FC44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 21:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5j5knED6q3pX0T/5tJ3M251cDQCJBmX/HJ95U5CMOc=; b=i2c3ogIrKIBeSZ2SU29gdT01im
	aD42wlQeb9dl9tCg9XB8KRaB2it3bxPSpsG2wzA6sYeNbuEN3gPtLBee1L8T1hCMHBcc9zFXKn4Ti
	sBMkDnVmdLnoJGgGf9Dag53ACQE9pVXHW/Oc28kNSbEVauRiPs0xRQhGLxRem2lgIc6g1oRc/ID5x
	ZCraWZTFeTe4Igbc67aZi65/cpXZu2mYzczl7cMEFwZEWAfy+goMOwVU0EYdq/ZXu7XjIp4CnhNBA
	cWhdBdnZru3IyOd9jg9vNX8Jz3cvK8BKZM2z6NeVsnKGTqhjtbwFrELtlZW2OUnBtmMBeQtoZjDdw
	yCH6RmXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOFh-0000000AS08-3msu;
	Mon, 13 Jul 2026 21:31:49 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOFT-0000000ARrw-2r3n;
	Mon, 13 Jul 2026 21:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978287; bh=1yP18ZTlPXUiRlBsdmIVfczBqI+60MXCB3xkhNeyZNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VOGD8gWa+quOr9YeBp/h4VX9sJ9uaqQjyOFcR76rg3f5qxMTBi8DP03P235wN7C3x
	 bvY8yFfAgFo+86daHResImzh+blajKWKV+Y7/FuWvzaCmM0RYzx2VrX92pa7hX1TVH
	 evMNRbikEaH6DRswKiCeW1Nw1U6oMdxxLx//KZvP8XAnr8tLVQMj6bcIxog4Dh/uj1
	 +FJ27Q1EDl4RWf/tqBu1ujRNxunw69XGkRJl9RpxJcEJuuUucYS6hDWFnJ8zgA6WfL
	 d7yPq/cz2j6aWwgOnOdmCCc27H3WJ+V6DOYQKXEURUN4JgsZSi/Pz1PUE1AnTHxJZV
	 vFnKc5UCdl5eg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 5A55340A3E; Mon, 13 Jul 2026 22:31:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978286; bh=1yP18ZTlPXUiRlBsdmIVfczBqI+60MXCB3xkhNeyZNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cXuqPrmidt0dnxcHe8V5AM1bmdamGmL8yswwwk8ITkwdMjNvUAPU59YsldlUNIxKl
	 NxZw3IPA1tlC5rDViDXGtYbfcQVNf3o0dU6k5U9E/66FLD8krs0PWONQH0v9ZwsRHM
	 sBNUlTsXmm6tV9PmE/x2dRZhEM+tnD1u6AMo8zYu/sGJkq7r3LqAehVdMsQ/2TfWO4
	 OacQFJw79kk6acd+K/ZJRKqNA7ZNRCTQ43CNIpVmULtycChVOvhYHznLNaQaCtt1Ny
	 Rier5SZK8mI9GAmHTfo03FsLjMeGFz4g6Zl7Ni89jR88Ix5N/++0+Ff/L1o7T4HMGK
	 O9uQWEvp5qWcA==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 13A9241EFB;
	Mon, 13 Jul 2026 22:31:26 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/11] media: meson-ir-tx: Ensure probe error is propagated
Date: Mon, 13 Jul 2026 22:31:03 +0100
Message-ID: <b1ba67cf06df907bb1e25dd13554fb72f2ee09d8.1783977550.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783977550.git.sean@mess.org>
References: <cover.1783977550.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_143135_857489_1DF2566F 
X-CRM114-Status: GOOD (  13.18  )
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

devm_clk_get_enabled() may return -EPROBE_DEFER which needs to be
propagated else the probe will not be deferred, it will fail instead.

Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/meson-ir-tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index abb107d19e8c..174d5135e1bb 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -290,7 +290,7 @@ static int meson_irtx_mod_clock_probe(struct meson_irtx *ir,
 
 	clock = devm_clk_get_enabled(ir->dev, "xtal");
 	if (IS_ERR(clock))
-		return -ENODEV;
+		return PTR_ERR(clock);
 
 	*clk_nr = IRB_MOD_XTAL3_CLK;
 	ir->clk_rate = clk_get_rate(clock) / 3;
@@ -324,7 +324,7 @@ static int meson_irtx_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return -ENODEV;
+		return irq;
 
 	ir->dev = dev;
 	ir->carrier = MIRTX_DEFAULT_CARRIER;
-- 
2.55.0


