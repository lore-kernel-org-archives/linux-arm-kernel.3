Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5867C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfYUQWbI6cF6B/2lMpYxHVi3qhvy4GmEd25RF2vHAAw=; b=BehMPi2VDwM9PRlLmzIiGSSdE3
	jDj31klkIVh86yzoRsY1gqERMjrEH5Egk1XpZ/uFrpst8Qedt4Pw6Xwuoccsuobv52XKx8FOdIbpF
	/R9yLAGGG4WfCKivpoNcVVnLmcpzx+P986jWzbGaS8sSrp0qq897U6PS43wul7mjUc28ouwF1gC5d
	FIUdu8P4CFRA8N4khQ/vQHbpXQuAV61wDKVB20N8AIVrmVe2DVjHMU+CB/9FOI0pCoFQ464CEE0qq
	5LNblSeX5nsJK9KLJN/Y4tl6OOhMsmWNf4tWhj3yMYngqFmSCyjpMZXEmvYolrpAfYsSfWS2vDa4Z
	ZRBnEAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp67s-00000008O1d-1cJ7;
	Wed, 29 Jul 2026 15:23:20 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp67p-00000008NzO-2G5H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785338593; bh=jyAFNCAff7ONHFxb/FIrT3odoLHFfMrGUvGh9kBzBcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W0o2E3IcHUPcqjHRulLpkwmEad+b0z+jEKoSlYZ0KUVRCzb7ZgA6dkP6b3X2wqKo1
	 L3a3qBGUlBCIEMlkAFksukQZnYzQ0Xn6TjFH01SWkbKPKNcTf0KPK+neIvpCuA68nx
	 hFO87IOOc78Y0bynDu6l2jcmJlmwPJmRyLJBORtBNYw3vwk1d5xw4/h2vdaTKsu0Wi
	 Y89lm1YIB2ZoG0tyP0tXK77ARbKyLWsu13LjiTOlcmqN81iSXqXjKRwLC1hW/WZVmQ
	 Q55XEu9H5ZdbOTbZ+uOXlF2zjlVmegmm2pLEFVZYUXcZqmT8AQRavGjjvuE3extGru
	 2BDUnhCy5F0oA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 7EEA041CD1; Wed, 29 Jul 2026 16:23:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785338592; bh=jyAFNCAff7ONHFxb/FIrT3odoLHFfMrGUvGh9kBzBcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m0l850kXaZmCw8zaVg9tUIrPXj7WRgopm7tAw+Iam+5Pzh/vt5z94AM5i/EvBzYp2
	 I7ccCtN1ZTXiGFFYp9sKIls9+YkwU/+aHvDbnR9K1gk71m04rsV/LLi/qF5+936AD5
	 9KS7Z61nA9mOHdDIuLtPOCV+LPR5XSk50d49lBCfOXZ4efjaw3HMI3B0YACYfTc19U
	 bL0tAMcEIeCxvlgkapt6RvZdSKokA1W3xc6WkhccEHe1FhRIwpDmHCT13q+bjVz4ix
	 9bxf+WxC7LSipQf4k8Ew5oriQPyvLLEAqn07hCXTXOJtXDXsdl4gkurGPt6gWmbRqF
	 09pGN+gl53mWQ==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 619344017A;
	Wed, 29 Jul 2026 16:23:12 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/15] media: sunxi-cir: Ensure no more interrupts can occur before free
Date: Wed, 29 Jul 2026 16:22:44 +0100
Message-ID: <ca5cac44353fdae4d664b22de709cc45837414ee.1785338381.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785338381.git.sean@mess.org>
References: <cover.1785338381.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_082317_713040_10ED331B 
X-CRM114-Status: GOOD (  12.99  )
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


