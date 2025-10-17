Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEF2CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W1IDrz3RmQ+DjnJHgkvZJfeGuFV4FYY3VXTJn4UzdsY=; b=2vy/dWr6uG+m06I9iN3KpIfLlU
	5KHf7lTDycqEqkrX/EmHjD1TUiQ2r2n1XwBqmhQGmiDDpKWaej9/agRHgnZHQADaEtCmfPZ4UiM36
	hR4bauqFVVIknB3R2fLG7+Py1xv524EyXoJTSeEChrMgz+2uYJKaNu5i27V2A70nvxli8x9iz9JXv
	Hm+7Zpz3mJS2LXmEId2171la2W0/i5pg95YYjWmmisWeCIbyua7MMDPtpeUrktbt/n/pSyu8NKYz0
	Vyl2dojgF7sXOpJwuMFTTLDAl+yuE0avz9wTh0DzAehcMXAdphmIp6I+yoPDHVDE4c5g8B3kb+04A
	DqTQ4LCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hhK-00000007XF9-1kef;
	Fri, 17 Oct 2025 10:28:34 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hhI-00000007XE0-0S44
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:28:33 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760696907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W1IDrz3RmQ+DjnJHgkvZJfeGuFV4FYY3VXTJn4UzdsY=;
	b=LQG4n4Vai/wW3aF62q1eiUNmJjL5j3yRF7CeP3SbZ8TiUo9B8fklD1tcXvOIKbIQDhkTN+
	BuQVstW4GNimda8ZTHaPXOaCfuAXBZ1TGQCSEYCQRj/yTtLznR5VJlXq8+B2m/kuwNgGWI
	TN1vWPrCLBg0AHc+mvYBIoymOLwKMik=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/2] stm class: Replace kmalloc + copy_from_user with memdup_user
Date: Fri, 17 Oct 2025 12:27:42 +0200
Message-ID: <20251017102743.75394-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_032832_285370_76B55A1A 
X-CRM114-Status: UNSURE (   7.49  )
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

Replace kmalloc() followed by copy_from_user() with memdup_user() to
simplify and improve stm_char_write().

Allocate and copy only 'count' bytes instead of 'count + 1' since the
extra byte is unused.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/hwtracing/stm/core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index cdba4e875b28..5834f796e86b 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -645,15 +645,9 @@ static ssize_t stm_char_write(struct file *file, const char __user *buf,
 			return err;
 	}
 
-	kbuf = kmalloc(count + 1, GFP_KERNEL);
-	if (!kbuf)
-		return -ENOMEM;
-
-	err = copy_from_user(kbuf, buf, count);
-	if (err) {
-		kfree(kbuf);
-		return -EFAULT;
-	}
+	kbuf = memdup_user(buf, count);
+	if (IS_ERR(kbuf))
+		return PTR_ERR(kbuf);
 
 	pm_runtime_get_sync(&stm->dev);
 
-- 
2.51.0


