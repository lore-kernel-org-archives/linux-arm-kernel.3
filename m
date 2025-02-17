Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D949C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8maJfYkTXgkfcaPc9gQA9AmDtt9BCUs2vbI6e+93ktc=; b=uFD6d7SBrtSrarpvLrYgDKWuTr
	6I3bnf7KkryCcfx8ftDZopWDF8gomUivD+uNuwFHr8/aJ3xTkxUme4y8kWTmjdoGXxDi6M8R0/bVO
	muEbyMb/sEYEaUq48rz2Hz7AuMc4BwQbuCXBGoHGd5tYbe/Jn483LhwZKSIlrnaSCT9vd/HgZc05c
	O4IkNxi7P47dMveW6pw/XSxSKF+YpGBHbFT+7PGOgE+7FCLCUGxYBhSlLXhK44viX00OwH4OOj/zI
	iRZSwsJQcHKtNcxrFfsGUmya5PhQmleeYj9F7w6eVzjGzeJcA5HjCalsKtwgGA+G6I+N+9uhpOhpW
	IOqBwUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1Ap-00000004fEn-35Hb;
	Mon, 17 Feb 2025 13:28:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk13T-00000004dJN-09fy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 13:21:00 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739798455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8maJfYkTXgkfcaPc9gQA9AmDtt9BCUs2vbI6e+93ktc=;
	b=ZuRG5kb+fr5GuT9s0jY4lzPP2IFc+gRwMezjWTKcK6K2VDEdIOjiY5SnWpafTdYiS9ttYO
	YB6gDfrNmcNsF3riHZ/ON90blm+R3ffRIk7k1u7Jcc2oIMg6xkX4r+jnQOsEJyLbB8L7km
	a7ycio0aYfDpyBecYQuUFb5Bc2TnThUbzozdZ+ng6R+j2+sLSwSoodhNOiPlD+BH3zbAGb
	yvwgxNy45E1fDTRLu/CFAbZxi+bZnCKWe+42SVUEC4fPE2bZoFWuK/G8rqdMRWpAEBxMVL
	j3E9/HGb4qYjSmGpoHnprucjgE5um7dfGYU42zDsQoOPLiWW1qLb/X0qn3d/fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739798455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8maJfYkTXgkfcaPc9gQA9AmDtt9BCUs2vbI6e+93ktc=;
	b=CGZQrlDNTTNx2cAVBC2ANjwxhLlndS1RNoQguep+h2tDhztm6KMYinB2fcD1zXrB5/iUDv
	vBICjfuReroQfpAQ==
Date: Mon, 17 Feb 2025 14:20:51 +0100
Subject: [PATCH 1/2] usb: core: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-restricted-pointers-usb-v1-1-78da55158832@linutronix.de>
References: <20250217-restricted-pointers-usb-v1-0-78da55158832@linutronix.de>
In-Reply-To: <20250217-restricted-pointers-usb-v1-0-78da55158832@linutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739798454; l=1925;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=mAVviI4qc5ZOybZnWIvthxIwxrVl/jx7euFyvae59SE=;
 b=/hHZT2J4XirZ3lFZXkgTLIVxF1s1Z4/5CElqeri+JZU1OOXCwq+gUfa26ykEavrQC3B+1t8FI
 f5BFRNRL6EfCCWWTaJ7kJHb7CRmMrXuES6MinUzTa6zqQCilm3KgcM+
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_052059_219025_BCE64EB9 
X-CRM114-Status: GOOD (  10.22  )
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

Restricted pointers ("%pK") are not meant to be used through printk().
It can unintentionally expose security sensitive, raw pointer values.

Use regular pointer formatting instead.

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


