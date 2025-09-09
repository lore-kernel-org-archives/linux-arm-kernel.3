Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441C8CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 16:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ejyOVWNZnM4N3Ivi3K/PAopR0Lc4S3yDQSFJewEL248=; b=Nn2P/4AgUbAfubroaxgN+mcZbP
	XW55aXmNH1S67T32vyq5ueOvjln9BBfjyT3SBLtjVB6O5WCFEOL3qWgoI2/aL32EoVcRaukFQwQwb
	5BH1JtMkJAevNfdOGovwfN4lhFYlQeQbRXsDd9OFVWn6yVRRaAoeQHKkNyg5tyy2/fCa1v8uVOd+4
	07wX20UhBcq77CRTnAH3jTM6rzQu2DPAE5FL/V9569aTAPgBqJIvoZFfrWPojMP7N++MzQ5BVljTe
	9+imifWnJrq+so+Cjj4HfluaORBGXVokPOkQY3KhAWFuhHZ3lts4H7fBepSf7KS6Jes1GLdnhmS3L
	iT7uPAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1cX-00000008ft9-1hdp;
	Tue, 09 Sep 2025 16:55:05 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvXp-00000006NWu-1BYy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:25:51 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757413546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ejyOVWNZnM4N3Ivi3K/PAopR0Lc4S3yDQSFJewEL248=;
	b=bOzGirjNc89HFYUO7bNBKxqLRtE6F/lgIIgN3nre+0+sMsO9BDJv4t3oByr5BnzI6VYtU6
	A50lAWW+/SrsIVMEp3qCA5EmWZOOned6SOI0QkGT9qR3E9vWGtCrx8bwiQ/M2dSkFxGYFY
	aFSw28tR9jSscq0VwVjpkNll4VSkXBY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] stm class: Replace kmalloc() + copy_from_user() with memdup_user()
Date: Tue,  9 Sep 2025 12:25:12 +0200
Message-ID: <20250909102512.694203-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_032549_731773_747A651E 
X-CRM114-Status: UNSURE (   8.27  )
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
improve and simplify stm_char_write().

Allocate and copy only 'count' bytes instead of 'count + 1' since the
extra byte is unused.

No functional changes intended.

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


