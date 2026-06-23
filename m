Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCE7CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 09:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d5s92hGEq5208iujjhhC3arh0ICrujvsV1eSvCSTxrs=; b=aMjr0iNqrSHBlAdEzlX0qy/9R0
	9Byfritl8a1lLVuuPRn5XcCl/TRy+JAX6uoHnfVX4XMSNT7MgFDc9622pFMBvCEmlqBhNiyc6Vn7v
	5E4iCoyQjDnxD6dlBi+wtWBHT3W0XVAbQdcdFFmzq/R8nbMDfjaIDoiQS8wU9BXmdNxF0hUdrUjyQ
	9aKpJ+2XoMamUiw5ZABiI13KJFBjsebr/qy/OupRakQ50HsH4O9AMH50CjIl/8G6hE1JjX1fCEBhR
	4B0NHvWp9XLFnL+z4Xm4AJxESvmVHhOQoGu8pBa1ASuzHZeIeJDbVixXEJOzf6vrhKFEOUuuakYLg
	9kDaO+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxVn-0000000616T-3KeP;
	Tue, 23 Jun 2026 09:33:43 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxVk-00000006164-3GAJ;
	Tue, 23 Jun 2026 09:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=d5
	s92hGEq5208iujjhhC3arh0ICrujvsV1eSvCSTxrs=; b=dmlZEJKfe5gvScPzs5
	iozHUTq94La/sX4p7B/F5s1pcvrOtNwPrhVcLhZ/f62M0+7x/BIVU0Blb0naibk4
	bDHy8gm/+NWJgG8e+uqOdJECkGwHk3QiTo4rC3tDUj+x6V81kWlJuAoxOgIRDGH8
	TJb2U5QcbLFSRg/x3NlUO7HOc=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnTyPlUjpq6xXLDg--.19652S2;
	Tue, 23 Jun 2026 17:33:27 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: mtu3: unmap request DMA on queue failure
Date: Tue, 23 Jun 2026 17:33:25 +0800
Message-Id: <20260623093325.2105323-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAnTyPlUjpq6xXLDg--.19652S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurWfZr1kXw1xJw1Dtw4rAFb_yoWkGwc_Kw
	nFgrn7GrW0y3sFkr4akr1v934xt3W7WFn5XFs8t3sxAa4YkF4Yywn7Zr95CF1UZF45GF1k
	A3W8G39Yqa1fXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRizuWDUUUUU==
X-Originating-IP: [240e:604:311:e68d:298a:1bbc:177b:53c8]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7Qf2ZWo6UufmuwAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_023341_207724_039E4A8E 
X-CRM114-Status: UNSURE (   8.72  )
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

mtu3_gadget_queue() maps the request before checking whether
the QMU GPD ring can accept another transfer. the request is
returned with -EAGAIN before it is linked on the endpoint
request list if mtu3_prepare_transfer() fails.

Normal completion and dequeue paths unmap requests from
mtu3_req_complete(), but this error path never reaches that
helper, so the DMA mapping is left active. Unmap the request
before returning from the failed queue path.

Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/usb/mtu3/mtu3_gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index da29f467943f..f224f2ee379a 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -305,6 +305,7 @@ static int mtu3_gadget_queue(struct usb_ep *ep,
 
 	if (mtu3_prepare_transfer(mep)) {
 		ret = -EAGAIN;
+		usb_gadget_unmap_request(&mtu->g, req, mep->is_in);
 		goto error;
 	}
 
-- 
2.25.1


