Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81823C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c3MkuaBbDHUpaO4lzVpAovoUtzejyJ13kjQbhZJvXYQ=; b=a7JoHZszr25p+DUXCgnwY+Fng9
	akP+ImaVnvBm6V3YL9RlmGjWGZWrdmqMIQ2Na5GgS+OoojuDtElcfuWz73T41bCw3bsiCxfb12dIq
	GzXdVsuNFffAU1pqKdqFR038WWq6GiJZpveW7BluvI0/tzCNoHDNy4EpmXa8ZW4/a0MuDQaflqpaR
	wDbiDYPlF3kXQGn9nrtKojTikwzCMg1XjmXyWV7aplObpnlE9iQPaHFEKZOKgx5RvYE9UoEuOP+/c
	q6/u0lTDMRds9R7cjmZMAq5uH/dzm50m/sew9Nz52gUXstWWqtzlXKw5qzlXwPTd2Flkaw1Jnv9aa
	mWRwSOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BGs-0000000BIUs-3ivb;
	Thu, 17 Sep 2026 12:31:22 +0000
Received: from out28-73.mail.aliyun.com ([115.124.28.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BGo-0000000BIT4-2j4A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1789648275; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=c3MkuaBbDHUpaO4lzVpAovoUtzejyJ13kjQbhZJvXYQ=;
	b=AW+fH4uupJFhnGiXyJFb6A4FyPvCEvOPiNbSAZNBWt8gdWtMSm1zRq032LFPvlDx+ihRsuetzBC5CbRyC53p7Bb79b5BTJ5SenOarHapqVX646IKFWteKgKw3Naw+KU9a1/UBXoz8rCCQUVD8jjW38JiffITy5TfFFRjuWWa9EE=
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08340329|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0165461-0.00308746-0.980366;FP=12533628751979366192|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045220102;MF=liuc63@xiaopeng.com;NM=1;PH=DS;RN=8;RT=8;SR=0;TI=SMTPD_---.jFtbaHJ_1789648273;
Received: from localhost(mailfrom:liuc63@xiaopeng.com fp:SMTPD_---.jFtbaHJ_1789648273 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 17 Sep 2026 20:31:14 +0800
From: Liu Chao <liuc63@xiaopeng.com>
To: gregkh@linuxfoundation.org
Cc: michal.simek@amd.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	liuwb@xiaopeng.com,
	Liu Chao <liuc63@xiaopeng.com>
Subject: [PATCH] usb: gadget: udc-xilinx: clamp bytes_to_rx in xudc_ep0_out()
Date: Thu, 17 Sep 2026 20:31:11 +0800
Message-ID: <20260917123111.3757737-1-liuc63@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_053118_848912_8323A628 
X-CRM114-Status: UNSURE (   8.38  )
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

xudc_ep0_out() reads the received byte count from a hardware register
and adds it to req->usb_req.actual without checking whether it exceeds
the remaining buffer space (req->usb_req.length - req->usb_req.actual).
The same unclamped count is then passed to memcpy_toio(), which can
write past the end of the request buffer.

A malicious USB host can send more data than the gadget function
expects on a control OUT transfer, triggering a heap buffer overflow.

Note that Haofeng Li's recent patch for the non-EP0 path
(xudc_read_fifo) explicitly excludes EP0, so this code path was not
covered by that fix.

Clamp bytes_to_rx to the remaining buffer space before accumulating it.

Fixes: 1f7b0c6d8e34 ("usb: gadget: udc-xilinx: Add Software data structures and APIs for xilinx udc")
Cc: stable@vger.kernel.org
Reviewed-by: Weibin Liu <liuwb@xiaopeng.com>
Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
---
 drivers/usb/gadget/udc/udc-xilinx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index bef06fe75..77f06076e 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -1842,6 +1842,8 @@ static void xudc_ep0_out(struct xusb_udc *udc)
 		ep0rambase = (u8 __force *) (udc->addr +
 			     (ep0->rambase << 2));
 		buffer = req->usb_req.buf + req->usb_req.actual;
+		if (bytes_to_rx > req->usb_req.length - req->usb_req.actual)
+			bytes_to_rx = req->usb_req.length - req->usb_req.actual;
 		req->usb_req.actual = req->usb_req.actual + bytes_to_rx;
 		memcpy_toio((void __iomem *)buffer, ep0rambase, bytes_to_rx);
 
-- 
2.50.1


