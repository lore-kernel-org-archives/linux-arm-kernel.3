Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D64BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWGtyVn2rN7EwJ1jRjbcq53aKO4PEHGJxf2rnf/dK+A=; b=bRj4vNUPik85K6hW+MYR2EEdI7
	hzDg/9RnqKSWFSGpq0tTxEXKRDJJoWgefr7HzwrDfkd7SOJ3bcd/y1bcE4Hsg9IolM+jnqrUIRo4f
	Z1AixqwLVyhY1mbVEKmptMCnKHfxWMWR3Mg2HcwK7uxFuFQdhE8VtAbXjXysbrMfO7OgFXZuqEU2g
	iR20yPh6Lj3OlY2vthGWRWKQYk9nxkApP3MGFIcC5wIhBtuVbQQJZfLwHjTMq6jDS46PevY2ltRu9
	SyICt9s5xWYBCDlv2Y2zbqipwnEb0B/1dTVz4ZvRG92s3NjOxyC+M+t+mYFomcDLLxhK6PgdhVQJy
	mInj+pnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfSJ-00000003Hzn-2gTm;
	Mon, 10 Mar 2025 15:54:15 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfD5-00000003CVM-1P6s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 15:38:33 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741621107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IWGtyVn2rN7EwJ1jRjbcq53aKO4PEHGJxf2rnf/dK+A=;
	b=hHgDwGCcuKwsPSLbHVZabY2lqJEFG+OSQAP7nZgMvxlPZ+WLAe83Kqeer/QtpkbW8XlEW0
	UTqMab7XOYRoz+EIhvpSAI/HylsaWHP8yp7g0Yq5S6cK4GeqNxpOBwrCWlFY1SmUU0590R
	uRNE8zzj5dtsd1yl+bJ72YPoTXeAjfE5uxPiFxTqG0vOQFdGJSPHRO5/4wko7+oq+gAwPS
	uX4sfzIfWLOK1eOtaHbthUqaFVv/Haoeh6O8xXHnFjs0qHWOHdMr2Jq0RjeZ95qOakxA7R
	BMBmVIudePGZlzDEPoITlSaAiiXgO5FulnTKZLRnYJUlrMtq+cuLGrjT09AkUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741621107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IWGtyVn2rN7EwJ1jRjbcq53aKO4PEHGJxf2rnf/dK+A=;
	b=+ynUqXJKVKc+5A0HyOUryvQuweOFli6lQ12M2p7tfQ9zK+b2wfhvWvtaVYisyVDhARVY6K
	0bKz+GlCDOO8EzCg==
Date: Mon, 10 Mar 2025 16:38:23 +0100
Subject: [PATCH v2 1/2] usb: core: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250310-restricted-pointers-usb-v2-1-a7598e2d47d1@linutronix.de>
References: <20250310-restricted-pointers-usb-v2-0-a7598e2d47d1@linutronix.de>
In-Reply-To: <20250310-restricted-pointers-usb-v2-0-a7598e2d47d1@linutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741621105; l=2308;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XDyUbPuJlR7DvaGBrt3qErD4QUqtm+gKU3dJEHNsO8o=;
 b=XwyTBZ+IFHW2x+2jfFgLyYxgRWrzntqxSPvYB8QBT6LMhszb0HlkPr5Xr1r4JEsmzmpv776Yi
 OjC/B+tKP9fDhA3CgfYW9vYHWdAjBPfv/n6+XzI0cESvGwh3agosQTD
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_083831_557202_326B974F 
X-CRM114-Status: GOOD (  11.99  )
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

This is a revert of
commit 2f964780c03b ("USB: core: replace %p with %pK").

When the formatting was changed from %p to %pK that was a security
improvement, as %p would leak raw pointer values to the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
On the other hand, restricted pointers ("%pK") were never meant to be used
through printk(). They can unintentionally still leak raw pointers or
acquire sleeping looks in atomic contexts.

Switch back to regular %p again.

Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/usb/core/hcd.c | 4 ++--
 drivers/usb/core/urb.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index a75cf1f6d741cf5827b9c4deca3b63013aff6cfe..46026b331267ade29839393b2fb5c0c42e34ab84 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1609,7 +1609,7 @@ int usb_hcd_unlink_urb (struct urb *urb, int status)
 		if (retval == 0)
 			retval = -EINPROGRESS;
 		else if (retval != -EIDRM && retval != -EBUSY)
-			dev_dbg(&udev->dev, "hcd_unlink_urb %pK fail %d\n",
+			dev_dbg(&udev->dev, "hcd_unlink_urb %p fail %d\n",
 					urb, retval);
 		usb_put_dev(udev);
 	}
@@ -1786,7 +1786,7 @@ void usb_hcd_flush_endpoint(struct usb_device *udev,
 		/* kick hcd */
 		unlink1(hcd, urb, -ESHUTDOWN);
 		dev_dbg (hcd->self.controller,
-			"shutdown urb %pK ep%d%s-%s\n",
+			"shutdown urb %p ep%d%s-%s\n",
 			urb, usb_endpoint_num(&ep->desc),
 			is_in ? "in" : "out",
 			usb_ep_type_string(usb_endpoint_type(&ep->desc)));
diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 7576920e2d5a3e6c0dfd8bee8fce9d09a55c195c..5e52a35486afbe58bdffd3dfc1eb5964a9471ade 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -376,7 +376,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
 	if (!urb || !urb->complete)
 		return -EINVAL;
 	if (urb->hcpriv) {
-		WARN_ONCE(1, "URB %pK submitted while active\n", urb);
+		WARN_ONCE(1, "URB %p submitted while active\n", urb);
 		return -EBUSY;
 	}
 

-- 
2.48.1


