Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720DDCD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+hlBWVPQXy43hiRxqKhCnwnHHiHzFjw8+7rkTfE8vA=; b=JjbEe5A2QqxlXWAh04Gcyfnasz
	9kIuhpfhpYewssPbweeqGyhgspMYXWtX2/TicmEn+h6VOq6Ceadl18hq9voWVH5qN9f5ivgHS/lsu
	CDFiyCeqjmhXN0dgfrrZrN7egGZOfqdz+cA0OiPTNkpizJ26Xs9VxH6cbtMyF9gv1kAFzIBtCg+np
	3N+xkKnSYJj80Ucb2IoH3Knb/+f5gO0uQkJElAn7T5KjnamJhhr1+8BiZknOKw/tVpp9PQ95+IXOa
	zzK32VRmN3sslfvyJnLrHVZT10jTuafj4kebMdpxRh1nLYvf/+IDIo0wzZTKKpDTen/afiuJ3Dfmb
	L6JSCfYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFPD-00000000bCb-3iG3;
	Tue, 19 May 2026 08:02:23 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFPB-00000000bBq-0fLs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 08:02:22 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b4583f0a1aso19979275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 01:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779177740; x=1779782540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+hlBWVPQXy43hiRxqKhCnwnHHiHzFjw8+7rkTfE8vA=;
        b=j99TJRW+yznjeqUCGLNPz4b7WJ0jVUGw1fQ3EPUMRYrNRvDuuCizpBjJasxTT/hiZJ
         dkKlft5R6RZo6YmygfOmkBw0UFH053x6BpGqhFCBep44yhs1r4DfYGsdx8t9tKnqUx2G
         OnNpt9NWPBeTbDbh79dBFJVy3yQRmCauge/IxT+0du6nEr4z35LAdV1OciOTnAohUXne
         mp4/rjYaOTpeiZZw5ZTo7rsUCVR8rs74/UF+rzzKz5BjfvNhTfFINlG9HO9DhEkDBIT3
         6Oo8Oo7CNf/RF5ufPn8h3oVr2dz6NjTj9r7TVAWj4LCUJOpBTYXN9oiqxqpTOgfvGyX5
         DaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779177740; x=1779782540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+hlBWVPQXy43hiRxqKhCnwnHHiHzFjw8+7rkTfE8vA=;
        b=hLhj8LM5668Pfu4Nil6W1WsnePmWFk+f62LkUi/hs6PZ+kpKS3wHkFYj2xuF+Q61OX
         kv3BXKHhWTi686Yq0wgw8li4O1TSAiwWMUxEn3uAdH0HSiES0rd5o6HsqbPPn1hU8KL+
         dquAJdvRiXYr+YeRU/5jcFILg0HTibL7qEOlxvFoFmD8XAWJWkq9uYks5yX7X0om8Ns5
         YcB2XKDkcl65YMaf44w5JXC/toUnQSLymr6JGgjrKV7MGT8/FQY8ZdVMHZeGAJrVwWBe
         QNjdQ6KBbvEs243Yt5ThNJ7jld04ISci3934OqK3k4eNKO7Mz86MxrD1RKE5T2Vo8P4K
         pvDg==
X-Forwarded-Encrypted: i=1; AFNElJ/p1tuFZbX/EfUXj+ypmkMWmvMBaDQLVISyUsXnzWllhMLcAZ1flzRpUp1bz32ndkqoBKnTuxvrA6mWNxHfaV55@lists.infradead.org
X-Gm-Message-State: AOJu0YylamZhEtcupsgesDVWFup6Sw0mpe61W711ibP3dhilfZBy2J0K
	BH0I0iY6XT2d2Ky3s1+C7xImffdu236GqmYNb1rtsFt2RQnzekDpjfkaqx59Ng==
X-Gm-Gg: Acq92OE4AfNlGZ/Apvcx2oab9agly7av4eXIsGHEocZRsc9VLh7+R/zVYMmiPUoxuW5
	rRDPJu41nP47WxpqDcByu7pgbbM5lrdl6ahagpIoHUw9xyFLIK3Z2IOM+OzLdvPNvE9j5t5Bw11
	MmIiBjrFDihhMUrzlKYmhgABtmpmIHAgIwrMEv1qcY9WomZKTvyOCYsVLbHz5sjWXyrFuSHBEF6
	ZSeEWMZHOB6zWSK2ghfKaXYEq6s8Ti9aOgDu60Kfx46zoOcSVT0KgaoS/ub0aqsvoFcMFhHPPyK
	saBp6V0j0BWTLtdQ2+ZAsW/WvYSNvkIl1hdEhgKZNEKKNuSeWYzaX2kKSS58t/peiDzWRadSZKv
	zb1afM6YRCuUM2XKE/zL0P8ju207nZNMAZ2kvWRaDLqsLUzzmpE5iER4VlduIa2cMJePGBbgeeV
	bfvQkLK8wmG5dmheYJe1BXYnhfjZyfafTNxWLDVkr5TPMUr9to
X-Received: by 2002:a17:902:7206:b0:2b7:aa20:3c61 with SMTP id d9443c01a7336-2bd7e8cb16bmr129248565ad.33.1779177739786;
        Tue, 19 May 2026 01:02:19 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0f8efesm181857735ad.55.2026.05.19.01.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:02:18 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Neal Liu <neal_liu@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: gadget: aspeed_udc: avoid past-the-end iterator in dequeue
Date: Tue, 19 May 2026 16:02:13 +0800
Message-Id: <20260519080213.1932516-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518073403.1285339-1-maoyi.xie@ntu.edu.sg>
References: <20260518073403.1285339-1-maoyi.xie@ntu.edu.sg>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_010221_199315_75B25678 
X-CRM114-Status: GOOD (  15.59  )
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

ast_udc_ep_dequeue() declares the loop cursor `req` outside the
list_for_each_entry(). After the loop it tests `&req->req != _req`
to decide whether the request was found. If the queue holds no
match, `req` is past-the-end. It then aliases
container_of(&ep->queue, struct ast_udc_request, queue) via offset
cancellation. Whether that synthetic address equals `_req` depends
on heap layout. The function can return 0 without dequeueing
anything.

Walk the list with a separate `iter`. Set `req` only when a
request matches. After the loop, `req` is NULL if nothing
matched.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
v2: Switch the loop body to Alan Stern's shape: test inside
    the if, assign `req`, break. Same behaviour as v1.
v1: https://lore.kernel.org/linux-usb/20260518073403.1285339-1-maoyi.xie@ntu.edu.sg/

 drivers/usb/gadget/udc/aspeed_udc.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

--- a/drivers/usb/gadget/udc/aspeed_udc.c	2026-05-19 15:29:28.690931576 +0800
+++ b/drivers/usb/gadget/udc/aspeed_udc.c	2026-05-19 15:29:59.482953528 +0800
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
+	list_for_each_entry(iter, &ep->queue, queue) {
+		if (&iter->req == _req) {
+			req = iter;
 			break;
 		}
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

