Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDFDCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 06:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaciwSm1L46TIODxCA9aHpcFSHmqvrXKCz/1wzRVFx0=; b=q/d2Oap7rBYuPzbPZIX2L2WZv7
	8sa1Nhw2Ewg2eCzVDA0a7F6OsuV/Kq4XqljrgTu45twzYF7Ffq3HsuxV4pSJnaNIQE+3wjAaRlFja
	cEe+23uPSmopzsAhxVo0RvlbHQO/NXKHAqEAmSBzsk3LYrKKousscimv1VZ4LqmiTEO8R0qf+Pp/v
	4iX/PL056ihDXt8VRK/7PoILoMig6/7dtSjBRpJTVjusRopJy4sAm5gzptWiixKx/bkn9JqEYf8qH
	teNiOJ8kPHrIzk2moYFt8+JfOUSAW+sX0noe7dJQCZlpjgSCI8G/gKHZOfkpXhe/F3ipYe8vbEvv9
	UTJKDF/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxIk-00000006sf4-13C9;
	Thu, 21 May 2026 06:54:38 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxIh-00000006seG-1TbM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 06:54:37 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ba856db1c0so41829725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 23:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779346474; x=1779951274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaciwSm1L46TIODxCA9aHpcFSHmqvrXKCz/1wzRVFx0=;
        b=U9LtNl8TKzbLzijWA61tgPwNOCcOi96diJu6+IseOKDK/U4qhpg3LDKUx/A496wBJB
         RY3/bo0Kq/T3CyzokXh/XJEU8EXsgNmy4SmPHCFqwJ5ZdxAzbH7hvkZ1J8+/zOx0Rk8Z
         lBj5USKaYfIa3SZpL+4qagQPvYxrlN4HsEWwaeaErvDC6BWweZVOFAPbInAjF+Rw2sxj
         +b4UPCw0ULOMUR1uELi8usL8NAYopxkPMaBwP6BVnCHtez8BNh9Dx4s8+OtvcQ8cVNv6
         uvVarpVirihnDryaYl06RTO2lwhqXHna3E+o1879Eel+/X4JPX5q2025GnZWVPvONCB7
         WKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779346474; x=1779951274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AaciwSm1L46TIODxCA9aHpcFSHmqvrXKCz/1wzRVFx0=;
        b=iHuhPg9Dwbux71poQPDSVnH7tBKHULxCeR0CPm5DhoF0qivY8ekZLRsEs9aVU7q7fx
         mLtyhQVKzbHlWA+X0puDrgJP9zGFZTSA7zUIHh3RJQ3T2J8AtJrcuLTV1eCu++LpDQNp
         2rDAnmrxlITcC9cVarRauvw+1cu8PKua5KK/CzLpsTnSKSGaZ8pJGb8oTLIu+Mui75FX
         RcE7z3DSqRds3rDq9uLsqfdvMC8dtm/xMmN5DKuy5OTCaz9Fw0y8nTAeBqVpappHXXyZ
         p0/zxy/8fU/tYRvmBq1c6tZrRRnD2XsF+DZfJo88gLBPKrO6OTonhyP6I/NDIrOg3HgB
         S6gw==
X-Forwarded-Encrypted: i=1; AFNElJ94RFJnSF3HIvqqzAIpDWTiE9kHSb6iarEa/B4BNoiDti50srmn7wfBx6DqXEaM7D2z4oIGgaQ7IrbBzQ5B7E0j@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Q6WxbJ0078ziE3MJN6VV1CBgAN7WjPCOWV3/71imuEhsNmlM
	gmLb7gBqNKPLqFeoKyv5LOdlI0LKCDWdNiUvrhLEk6+H+omg9+FTaHq0
X-Gm-Gg: Acq92OEVPJeHk8ZpMj91/rI1p9OoxmJ1KwnK2Fv9tQtuY/pREmLFhlDYJeWzS9uFUbu
	iZsC9a83cZJu0T+/jDbiGe+J5R2uo2BgJKN/IMk0Tj5+g/vjUkhzDu44/pqrWHBlCQtrFSsqTMn
	69AuH2qm1RvVaohr0wLTMEXAoham0Grl2JxX8J2KoRzWcdumDcoKOkIwmvw46SQD/cZZeCaL4uM
	qKGJk5H5jNrh6aVtyze8e+f4UHrMeF8ysTpLBpwIeWdx/fezreAmvWU/rBxG3tM6+q+31CntNDc
	5IxmCXQo3BnspbiysvSKNj37sWy0h7GMdGLxa+GmNisnvOn6qG/bg+g/Dyzs+S94w1PvIB+RKFL
	WxanevBawtBuWhLDZn45eXJMRmFVyLKjT27fWBuIgMvCtlaOrjtgi6rXXjUO9u9U/nVEqdKeDEN
	aOb46GBcZdb4M7vVddZT+oZYk9qsgB4gww3+m9ipD6N5+st068
X-Received: by 2002:a17:902:e750:b0:2bc:8ebd:af76 with SMTP id d9443c01a7336-2bea2fb709dmr15581365ad.0.1779346473759;
        Wed, 20 May 2026 23:54:33 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd384sm241757715ad.65.2026.05.20.23.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 23:54:33 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Neal Liu <neal_liu@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Lunn <andrew@lunn.ch>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] usb: gadget: aspeed_udc: avoid past-the-end iterator in dequeue
Date: Thu, 21 May 2026 14:54:28 +0800
Message-Id: <20260521065428.3261238-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519080213.1932516-1-maoyixie.tju@gmail.com>
References: <20260519080213.1932516-1-maoyixie.tju@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_235435_398506_6CC5D0F0 
X-CRM114-Status: GOOD (  15.37  )
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

Default `rc` to -EINVAL and set it to 0 only inside the match
branch. `req` is no longer read after the loop, so the past-the-end
dereference goes away. No extra cursor variable or post-loop test
is needed.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Suggested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
v3: Switch to Andrew Jeffery's shape: default rc to -EINVAL, set
    rc=0 inside the match branch, drop the post-loop check. Smaller
    diff, no extra cursor variable, no goto. Same semantic fix as v2.
v2: https://lore.kernel.org/linux-usb/20260519080213.1932516-1-maoyixie.tju@gmail.com/
v1: https://lore.kernel.org/linux-usb/20260518073403.1285339-1-maoyi.xie@ntu.edu.sg/

 drivers/usb/gadget/udc/aspeed_udc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 7fc6696b7694..75f9c831b21a 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -694,7 +694,7 @@ static int ast_udc_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	struct ast_udc_dev *udc = ep->udc;
 	struct ast_udc_request *req;
 	unsigned long flags;
-	int rc = 0;
+	int rc = -EINVAL;
 
 	spin_lock_irqsave(&udc->lock, flags);
 
@@ -704,14 +704,11 @@ static int ast_udc_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 			list_del_init(&req->queue);
 			ast_udc_done(ep, req, -ESHUTDOWN);
 			_req->status = -ECONNRESET;
+			rc = 0;
 			break;
 		}
 	}
 
-	/* dequeue request not found */
-	if (&req->req != _req)
-		rc = -EINVAL;
-
 	spin_unlock_irqrestore(&udc->lock, flags);
 
 	return rc;
-- 
2.34.1


