Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3AEC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfYUQWbI6cF6B/2lMpYxHVi3qhvy4GmEd25RF2vHAAw=; b=d+6V5/u+zxIdWZFWDTz4IEssNh
	0qdpaUIQx7K2IZPEZbR9F9EJRcqwIEUd0uWFYj7KG5gc9yWN/nLuwxe4hbGqoszYWaj9VN8RQ1zQA
	VBhGgmerRKSV71HsgWS91LP8rB9LedtSRXW9o5ync0ue2eb3zQinFXvW+bKVm9TYONPM8CRpD9ifU
	C1XvC6FJfaRHCrZaBksqyFWw5v+gJt0qpcjwoM80sI0EwVxtwY4xVQS7OoVt8ECbxepvQVVJO9dUc
	y4N2mlhww8pbQebjMUlF+gNogVxIkUbYLGSk4AlghkF4rETeu5n0d5oQhKg3LYkKH+4vSuOugOMpa
	be91KNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLEp-00000002pMq-1Ybd;
	Mon, 27 Jul 2026 13:19:23 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLEl-00000002pKC-2wNF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785158355; bh=jyAFNCAff7ONHFxb/FIrT3odoLHFfMrGUvGh9kBzBcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jFqJZ33+EK/wtLp1/Le/Xf5wB8zK76uiViXw5cnYBcdV3uJPkK8NGBfJ3ujFQkpEf
	 CMU6sEPzF0LQh4t7oJPMEuHhFZJmga2Vaw90ylrFY+6Z6CqkXN78TJfitNwoqcuKwY
	 1gq06t19XundoiqmCpalCues+vKRIjpainKF84Mxj4g9ABDRAKthOFU+Tq7XOkfx+Q
	 fTk4vcUJRMbaoaZEY2B+UtFDnP0WARfjeDGjADp6PZYkAFLN4huiC6x8CS6tfuJ7CR
	 LVf2S8Iapg16L1FVOM243xBrt+vCAITdUlnUe9YTeFcBYpzJNIt+tzgQEcbSdcYX1b
	 qiCgpugUXqppw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id DFB7242548; Mon, 27 Jul 2026 14:19:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785158355; bh=jyAFNCAff7ONHFxb/FIrT3odoLHFfMrGUvGh9kBzBcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jFqJZ33+EK/wtLp1/Le/Xf5wB8zK76uiViXw5cnYBcdV3uJPkK8NGBfJ3ujFQkpEf
	 CMU6sEPzF0LQh4t7oJPMEuHhFZJmga2Vaw90ylrFY+6Z6CqkXN78TJfitNwoqcuKwY
	 1gq06t19XundoiqmCpalCues+vKRIjpainKF84Mxj4g9ABDRAKthOFU+Tq7XOkfx+Q
	 fTk4vcUJRMbaoaZEY2B+UtFDnP0WARfjeDGjADp6PZYkAFLN4huiC6x8CS6tfuJ7CR
	 LVf2S8Iapg16L1FVOM243xBrt+vCAITdUlnUe9YTeFcBYpzJNIt+tzgQEcbSdcYX1b
	 qiCgpugUXqppw==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id BD6A74252E;
	Mon, 27 Jul 2026 14:19:14 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/15] media: sunxi-cir: Ensure no more interrupts can occur before free
Date: Mon, 27 Jul 2026 14:18:49 +0100
Message-ID: <9c73eb433ce34de243d5be7a5e81e38fe26d39c5.1785158244.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785158244.git.sean@mess.org>
References: <cover.1785158244.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_061919_892625_FFA2F13B 
X-CRM114-Status: GOOD (  13.05  )
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
Cc: stable@vger.kernel.org
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


