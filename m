Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47505CD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=feqASc44QbNe6VCpQPPDc88UHJTnZ4FT1o849ySLP3c=; b=z7iMnEMFuFRN6gyzrPYeCHLr6G
	ECLLRflojB5t6IBnBNRWbzx4NjeuBmPDRZqruHOcZTldtmhdTCiUdopkfXvVnF9Gw6z8Z3IzDJomY
	cIUUz5pTcanIXd8k/dJI+sMzK+hBF4vXsPhPDAJtuI3Y7gT7NXSsKEllqs6D783cXjD3nzPfE275v
	MdTFs0fVWrAoBEwYbi9oQXRk275IWoIsnS25xnMLh4KJQS9ZNWLy9FcrRwim1bIWygnxNHkWUhk9x
	WJGJtCs/TgJBlj+p+ky2iawbUDtk811dxeNl7sLl7rz90Aq8WnRINMDsrsKJU6Mwzxv9+FD/Le+ff
	oDssOeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsUO-0000000Ecxr-0tAP;
	Mon, 18 May 2026 07:34:12 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsUM-0000000EcxI-1K54
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:34:11 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so1591258b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 00:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779089649; x=1779694449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=feqASc44QbNe6VCpQPPDc88UHJTnZ4FT1o849ySLP3c=;
        b=m58rAHDaGoqdmjLD2SqV5kvzUhiTsp5x8Kb1WGxjNcvUvyX6CNHLix7AJ2od5s6CwG
         M3HzwthhmDOQ69kjEUzAaeJ9oE8h9+gfBMCfO3g0B1l2QtHM72fO+57aMQBS1PvI0IqH
         B+l+vLRMxDdBn6cYYP1vsEoRqkHMYfny8klz8XZavFhRtkuDQJ5/96sATvzGP6qIsH0j
         m6uqRLG20t41a1u3iFKxrBYnhbJ3lpVAcol+xajFX/0nnYa9xsPvuJFCXwVdPOdVTnd9
         Ui+ThLUnlhPjfVwN9857RyPpwqlc1lZR6LbyIqUAgjvJLfLuIklKPOn7LYv8uKTOSSXG
         eYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779089649; x=1779694449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feqASc44QbNe6VCpQPPDc88UHJTnZ4FT1o849ySLP3c=;
        b=qTAjonpfh1l4aBrZdgB8+ewpNBWMaImuqU62zyTj/aBZF9CNoFvk1//lCk4o12mcwx
         /HHPwh918KtnSI/mdJHhtKtwFblieTCVPIo5a02WGICp0WjRHmRlhr4HK9bXS91Pdh8C
         yD/Lq+uVUpu+yJgkqXqVfmHuKshUxb8W1GI6ysJnyFDzWvdxaCjVoZijjUKAU0njwBUS
         q+BkKvs/71vyHjxdXZHY7gRQkZSa68xhfxAOBtqaZBr0PegDQlXINwnhpFBUGzBOw6se
         iJ7e/66eFSrePiZ4xWF3y56zobCBRobr+Xr7gLjR6NPC7hVayEC6EtoDi/TB9HaGz+DE
         +KPA==
X-Forwarded-Encrypted: i=1; AFNElJ+CkiIMhCAvJDz8GxBmX5hdID2ZyfcJ58fgpwyJ3eq5uPxKC8SUM4rsnXZ13OApAU/mY85Xp3WT6v3gF8OrhKa9@lists.infradead.org
X-Gm-Message-State: AOJu0YwqSX8DcgFf7UyheujL2rCWfwBbV49c/d9HV7HHC0IcsmhHxLqq
	8+QInJ4VFNmbU3CAe3oDvojQRQ0XofgBxLVvwNmayV8IFx+27e6SAjtA
X-Gm-Gg: Acq92OG4DhDR7DXhQ1xgjF4a2uS8c4dttJbAceQmelP6fm6c50Y9BfeYHROHvLdMc2u
	tqq56R2tUoXMZ1YFl1mlwJjAfGs+xqQFGo/WN0aGOs0Nn51eVYRbnrD9REVGSjGYI/xZdQl609+
	tFyBTG1Z0wVZDbWcJXMbMZHB7UHYaoavcuNuNyH/yXpZbhaOrVig9bHJKdq6g/lfy1IokY3r6yR
	4qY6nIL8jM1M3UBT9nZc4m+ByWRVSBGKaSyPGtKavfzSVn0fX7Bfbbc4cqm1aI53gJ92WNWSKXn
	zSKwe30HEQpHBNjTCIW2c1wJdN2J4WWThsTfPht92wUWXPLVaniODgy2SHRMnIyIhy1wm0mWRCj
	aND0KFyrJ2FriNmpArTGBjQZ6cnFS/IVFSKZQ03IKnXZ9RhwrD3E66+96B3CXuQxEQy2JWU38hQ
	rObUOZl5g77cr3/uek0I3cX8Wba2qc0gY6YAZeX0WRgIJ4Fw==
X-Received: by 2002:a05:6a00:3e22:b0:839:dd77:3501 with SMTP id d2e1a72fcca58-83f33c33546mr13925885b3a.1.1779089649248;
        Mon, 18 May 2026 00:34:09 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19775ca3sm14500746b3a.14.2026.05.18.00.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:34:08 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
X-Google-Original-From: Maoyi Xie <maoyi.xie@ntu.edu.sg>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Neal Liu <neal_liu@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: aspeed_udc: avoid past-the-end iterator in dequeue
Date: Mon, 18 May 2026 15:34:03 +0800
Message-Id: <20260518073403.1285339-1-maoyi.xie@ntu.edu.sg>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_003410_369343_6D0D74C3 
X-CRM114-Status: GOOD (  14.87  )
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

From: Maoyi Xie <maoyixie.tju@gmail.com>

ast_udc_ep_dequeue() declares the loop cursor `req` outside the
list_for_each_entry(). After the loop it tests `&req->req != _req`
to decide whether the request was found. If the queue holds no
match, `req` is past-the-end. It then aliases
container_of(&ep->queue, struct ast_udc_request, queue) via offset
cancellation. Whether that synthetic address equals `_req` depends
on heap layout. The function can return 0 without dequeueing
anything.

Use the cursor-vs-result idiom from the sibling aspeed-vhub driver,
ast_vhub_epn_dequeue() in drivers/usb/gadget/udc/aspeed-vhub/epn.c.
A separate `iter` walks the list. `req` is set only when a request
matches. After the loop, `req` is NULL if nothing matched.

The same idiom is used by the other UDC drivers in
drivers/usb/gadget/udc/ (at91_udc, atmel_usba_udc, dummy_hcd,
fsl_qe_udc, fsl_udc_core, goku_udc, gr_udc, lpc32xx_udc,
max3420_udc, net2280, omap_udc, pxa25x_udc, pxa27x_udc, udc-xilinx,
bcm63xx_udc).

Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/usb/gadget/udc/aspeed_udc.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -692,26 +692,30 @@
 {
 	struct ast_udc_ep *ep = to_ast_ep(_ep);
 	struct ast_udc_dev *udc = ep->udc;
-	struct ast_udc_request *req;
+	struct ast_udc_request *req = NULL, *iter;
 	unsigned long flags;
 	int rc = 0;
 
 	spin_lock_irqsave(&udc->lock, flags);
 
 	/* make sure it's actually queued on this endpoint */
-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->req == _req) {
-			list_del_init(&req->queue);
-			ast_udc_done(ep, req, -ESHUTDOWN);
-			_req->status = -ECONNRESET;
-			break;
-		}
+	list_for_each_entry(iter, &ep->queue, queue) {
+		if (&iter->req != _req)
+			continue;
+		req = iter;
+		break;
 	}
 
-	/* dequeue request not found */
-	if (&req->req != _req)
+	if (!req) {
 		rc = -EINVAL;
+		goto out;
+	}
+
+	list_del_init(&req->queue);
+	ast_udc_done(ep, req, -ESHUTDOWN);
+	_req->status = -ECONNRESET;
 
+out:
 	spin_unlock_irqrestore(&udc->lock, flags);
 
 	return rc;
-- 
2.34.1

