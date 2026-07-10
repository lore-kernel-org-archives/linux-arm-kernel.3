Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D881DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04rpi8Qi0ASHQrqKFAWwcdZ+O/U1M86p5o7kV03aHOQ=; b=ujYEsbaIXF1NXucdFBKGBUSebi
	i1RUPEHYVu3su7Z8oGvxDuA62cgTdSenuyiQvAFqGWwLWBtxmES4a8S4t7V/9TTZYXH2w7ErxBV8E
	7SenWMDasH5vUFNHwOhmyM+HISVhGjtqMJjcXgsw+zp+Sj/PQpaXrbwYrtwPXoIiVbIlfhw+h3H64
	S9jIYA8v18Olk4vMX6PveByulQmtkTVrt+fP3DUnYOXskO1EipB6ecxegEGlAIB9J9LaZ7swjF0AU
	0MEsFnl1t2wMBBvYW2aHM0l73QKJcXXcAdJ8SMFAYpSKJvWSEIjBQfRZk6hG5ghY+7M5DzO5Fb//c
	gryvHQ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6zd-00000004Uyx-2E5R;
	Fri, 10 Jul 2026 08:53:57 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6za-00000004Uxk-1Sii
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 08:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673630; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pqaVoVc+xqwi4zltj+mcYWczHgP/iJginifwqnX3TdaDGrn9Fo2biGHB4LkJUYEog
	 u2BKKbjSMb+PJvjwn8U7aD1Umnb3MtMioRxmS4T2Hs7LgdSeJZJqiwjAGKsrxzjo1t
	 XhRRdDolDRqHN/jWkkxCauK1pm5+ch5mJ4IJ3Ty5sygL4HxvpeK4StAbkIRYeosNWU
	 mUxh8khTw26WwJJVtEGoxfULdBIIbt73S+xo2JdlyqB+PMTmQqkNggOKKheYr7tG3O
	 uhb6YALZxnGWhS2siP7468iU4dOUW35VCwD0Sv82LWC6nVFari0Ne6m5zexY3n0qui
	 yE1VwSj9VYHKA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 5FC7240B50; Fri, 10 Jul 2026 09:53:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673629; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q7tS2vmA86o248eMBvJZbYEhyUISrTe2nv47HVo3EBB7Wxrw/q2cjF2Q/s1a683pj
	 BoBwF+MTN5v6MmQc7WN1g5SAoqY0NzP9lX+ggsZPVjvkpArpwCtP34JWz2KigVZg4e
	 6L0xbtr9uexxKL+seFkxe6wfL9blzBpwgYSgfoEFoYy6gvzgZ3t9n0FXXuHercC8Gb
	 ArHomzEUtOdrVqrjnuDjawTYJZawhFr+ZEK3GKuww4egj8dYWc46AUqlVpofx+Ap1z
	 aJPjdLb7TV96CXOc2nFahvHojnRrNmcHsgaXzd50an5BycQdq1m405O6IWFL8/cCJK
	 Z4M3GggQWecXA==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id B556540B4C;
	Fri, 10 Jul 2026 09:53:49 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] media: sunxi-cir: Ensure no more interrupts can occur before free
Date: Fri, 10 Jul 2026 09:53:32 +0100
Message-ID: <e74a0caf91aaefaf98476a191e6489c606632bf1.1783673420.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783673420.git.sean@mess.org>
References: <cover.1783673420.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_015354_542344_ABD27FEE 
X-CRM114-Status: GOOD (  13.06  )
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


