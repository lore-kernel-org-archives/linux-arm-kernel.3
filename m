Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB53AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 21:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04rpi8Qi0ASHQrqKFAWwcdZ+O/U1M86p5o7kV03aHOQ=; b=g8h2weIv/DQ8jiqg7E5hQuPTw1
	D7CCQJTdpYYGka8zbWtXqUhr2UGvFf/8QgZHzV1GuUgsutWFI86dYlbyRAO5IYK9VYgkJX4YsuM+1
	NnRM1/W110YEGqIKJF08Qg5j0gryk198EoFTbLx7pT95yrrtV3j+za5QB/OyMlXjbaOvNoFranRvN
	RgR9l4kqnRzMfg3mXCuIVyjzyDVcYrEBmYW4FrUh3N0imSXzriUo3lLQfNrE3Wp2cMKQVHLHyA7yk
	NG0YbzvFLzG5YfUGxdw0ocFFP7xohBl/YuslnHEbIJC8U+eS7eb+z7iPDL9ECEA8Nn6KZKwp6QG/x
	QIo6/6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOFW-0000000ARtl-1Cje;
	Mon, 13 Jul 2026 21:31:38 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOFQ-0000000ARrj-1dCQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 21:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978284; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tk+Uuiz7dx6b0K76rO+IqBr7UYSiJuIM3z/Nm1TLA1YJECFKTxPulnLmu6f3PWM98
	 d38LYkaWefQXGkU15JYrHREz1+XE2OJYiqVzitLuI8qMJfvjxVsjK2+pPYAdbUTEFv
	 oPSeMjTTtMUUs+xCkBRuQyAHP3d2gkuB/7/FWJPWxVmwyXX7qQf/XuZZjH7KW12ekS
	 DXPghBtGhMJEPhtdp1xfU4nSaitT5urfWLpvwrLFB0F5ooN+aELeVveuJT29CdlLcn
	 YOHuMYcSP/7L7ox8/ZAe4FVPJDpqae82Lgc+LzekMTunD0O33RAdYuBxGmep8cw3Jg
	 W7VfVBwzgYrpA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 564F640B7E; Mon, 13 Jul 2026 22:31:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978284; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tk+Uuiz7dx6b0K76rO+IqBr7UYSiJuIM3z/Nm1TLA1YJECFKTxPulnLmu6f3PWM98
	 d38LYkaWefQXGkU15JYrHREz1+XE2OJYiqVzitLuI8qMJfvjxVsjK2+pPYAdbUTEFv
	 oPSeMjTTtMUUs+xCkBRuQyAHP3d2gkuB/7/FWJPWxVmwyXX7qQf/XuZZjH7KW12ekS
	 DXPghBtGhMJEPhtdp1xfU4nSaitT5urfWLpvwrLFB0F5ooN+aELeVveuJT29CdlLcn
	 YOHuMYcSP/7L7ox8/ZAe4FVPJDpqae82Lgc+LzekMTunD0O33RAdYuBxGmep8cw3Jg
	 W7VfVBwzgYrpA==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id D531040155;
	Mon, 13 Jul 2026 22:31:23 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/11] media: sunxi-cir: Ensure no more interrupts can occur before free
Date: Mon, 13 Jul 2026 22:31:00 +0100
Message-ID: <397628f5644f6488f111a3a3ee07d00ce01a13b0.1783977550.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783977550.git.sean@mess.org>
References: <cover.1783977550.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_143135_606994_1025D4D2 
X-CRM114-Status: GOOD (  13.03  )
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

Only call rc_free_device() once the hardware has been stopped.

Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq callbacks")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/sunxi-cir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 28e840a7e5b8..af1ee08ffdbe 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -374,8 +374,8 @@ static void sunxi_ir_remove(struct platform_device *pdev)
 	struct sunxi_ir *ir = platform_get_drvdata(pdev);
 
 	rc_unregister_device(ir->rc);
-	rc_free_device(ir->rc);
 	sunxi_ir_hw_exit(&pdev->dev);
+	rc_free_device(ir->rc);
 }
 
 static void sunxi_ir_shutdown(struct platform_device *pdev)
-- 
2.55.0


