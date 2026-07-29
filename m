Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209F6C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n992rOjIRPBDg7618S8S8GYpKUluCIyPPkfkKIUUbu8=; b=W7kbwWgRET11L2ldXKioTSOChR
	7uXmIPw8ZpH+B0mKidMnvFzow57WovDqzbFGw1KFhTqX3C4la0HOLQVRBSZCJugYOL9mPwxQUmaqW
	jiXukb8ldq/HtLzQnKj1/K2BGwcPBovmFjXfuG0KbXO4mW+IWXbnteotaCc0dc06FzQR70cw1xhoY
	3OdYIBm1aUOtYkoQttD1uD8CyuwK7HZdxBWzlAX2MRXxCPbbkl5DcxBnoHZRkMwaNac1OyNpwbPFs
	62cTjqDCUf/EtbATH/NPm0Kl6trSo4pVziC/i/1mEiv1iPHey8kB9vQfIr2HjYE2yZCDE9NoH33Mk
	Oo+p5RlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp687-00000008O9t-3oo7;
	Wed, 29 Jul 2026 15:23:35 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp67r-00000008Nza-0OEA;
	Wed, 29 Jul 2026 15:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785338596; bh=obc3cONwMuXm0CahGbeMX6PQND5qwEnkJKs3olgUTuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QPc8IUJc8yu7d8j/f0g4RMsaTmWsQ9ntU/FccwF5qu2iFKgPOWsk0Ccw+6IJHuBBu
	 cz8LJh7mZdcgpU1adMegvLVauzy7j/c9qFU7847L5krm9b+qoxLKbBWU3cFpDWXzWP
	 7tE1FxJI+kKB8qdi1C2KeGuQ9mY3MFrGavxA/CgN2mciAI+t3sVJu7QIsnpbyB4lBZ
	 8FWSsMRmZn3aQ5te61BEbbt26WsJN9LkrI/QW1mcxmazA0LrZnEf7yZtg6I6czckw0
	 C6+zLsWszBZJxRCUx/Yq5KmAOVqRQIi+1IManTqfR7oBwyaiuvuHnhBpjhy+Do1xDr
	 2t/lsXfKvTUfg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 0D5E042532; Wed, 29 Jul 2026 16:23:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785338593; bh=obc3cONwMuXm0CahGbeMX6PQND5qwEnkJKs3olgUTuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oymYrjvjwpfZc8j38jey6VTLx1oHJBJuyXrsn/ewxqka+GR5OpFMdiE4GmyO2iG8i
	 0xMyZ5kDVFLfTvNA21oU3fvIoJlCoqfGdg7mzZNrHVNDeYzdEC8/5lmtqYKG4IwtcW
	 RU4g43fnm4ABhXDRl1/qilly4p5F1A3N0OW4u1R931IQSTTla8w+0z4ksM83h/TPCZ
	 8VSjOAiZzU2+l0x2GEZQt6PWRK7dMNzFSZsfhCfuTWTnc9kx5OaFMTCZtYDgdfzfgo
	 CRTqzL+wAtr4Z/j7M+WmW4McvQJJ2Hp1NxD7yxVUsD4UXmxqxIjtw3PEILbPCvvdlV
	 2vholJ1pRhACA==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id AA67542528;
	Wed, 29 Jul 2026 16:23:13 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/15] media: meson-ir-tx: Ensure rc_free_device() is called on unbind
Date: Wed, 29 Jul 2026 16:22:46 +0100
Message-ID: <b7d2de03f7573fc0854a6b4c686e0b9dc6b60b4a.1785338381.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785338381.git.sean@mess.org>
References: <cover.1785338381.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_082319_277132_B7CFFF43 
X-CRM114-Status: GOOD (  12.62  )
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

Make rc_dev devm managed.

Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq callbacks")
Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Cc: stable@vger.kernel.org
---
 drivers/media/rc/meson-ir-tx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index e7bb107e6a84..abb107d19e8c 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -345,7 +345,7 @@ static int meson_irtx_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "irq request failed\n");
 
-	rc = rc_allocate_device(RC_DRIVER_IR_RAW_TX);
+	rc = devm_rc_allocate_device(dev, RC_DRIVER_IR_RAW_TX);
 	if (!rc)
 		return -ENOMEM;
 
@@ -358,10 +358,8 @@ static int meson_irtx_probe(struct platform_device *pdev)
 	rc->s_tx_duty_cycle = meson_irtx_set_duty_cycle;
 
 	ret = devm_rc_register_device(dev, rc);
-	if (ret < 0) {
-		rc_free_device(rc);
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "rc_dev registration failed\n");
-	}
 
 	return 0;
 }
-- 
2.55.0


