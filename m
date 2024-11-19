Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833FCD6C29A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 20:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oTvpCQq8alGc1ZL61S7t0BIfplAY2aaCla8sSIriT5I=; b=AwcOumxNIbWIJZc/tE2jqcDwu0
	g365e1RqR8Z0uakZmzZvvpQJpo9obh3yJuNuiu8ilWksuIPJGwHSV1+tq3X7m0cYAFOjny8oQ/ghj
	DK+z9yARXZBLW/zEZU4zJIv+ucbPFVTGb6vLGCRaucHWG97ORj5pvXbqSWnSYjG/WIAmsEEWQz60I
	d7ko6+Nw4VGo1ambVNY3g2pWVvvfOjHVUxnIaFHd/ZwvOiOjmU0BxTD56F+0ukDv5zXw1sfjSUNjo
	PnWQU/7INqzWhsipsEvgVod2kcXwOr88VgLIPub+57ZTyTaDWWKjf1j7J8o3eUBQ6dh5gWeQm4mDj
	Hwu22dmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDV4Z-0000000DkNU-3izN;
	Tue, 19 Nov 2024 20:43:43 +0000
Received: from smtp-17.smtpout.orange.fr ([80.12.242.17] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDV3e-0000000DkHV-0PId
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 20:42:47 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id DV3WtqL3lt7pwDV3Wt8WJd; Tue, 19 Nov 2024 21:42:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1732048961;
	bh=oTvpCQq8alGc1ZL61S7t0BIfplAY2aaCla8sSIriT5I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=VbKHY+mlpgskjUyX+wxpYcuC1c/8GQQ+E5Enw/i0AuZkoWr1oQbGbExT7uhBNkz00
	 bQqT2jvlf4lhLEsZsvW6KqO39EFWrxzo2lus8pANKgVycmVgEpkOvFYDKvjRP5F2AY
	 xm9JACV6Nad6i7jZi+pS8C0qW16nvijQq39k4sle2GIN378TguFs7ElzPhqO/tvTBj
	 QZuyzfQbsoLgW59qrdar5uiWMH+xK9OH/X01kYXX2egrEpQD9XDPUZMOo63r+TfFBB
	 R9hJiemZsljz8f6+9rnCEUUvHLQ4rD3DfAeqGIgHG1lrDGBqe4gFuxBqnDtrWjJdEc
	 GNgkuLSgKhk9Q==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 19 Nov 2024 21:42:41 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: [PATCH] media: s5p-mfc: Fix an error handling path s5p_mfc_open()
Date: Tue, 19 Nov 2024 21:42:28 +0100
Message-ID: <b486e0ede5803258464c97d702f6588e7e7d3077.1732048929.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_124246_267193_852FAA2B 
X-CRM114-Status: GOOD (  12.56  )
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

A mfc_debug_enter() is not balanced by a corresponding mfc_debug_leave().
Add the missing call.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Apparently, only a debug message was missing, so don't bother with a
Fixes tag, it is not really a bug.
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index 2fe3c9228ac5..5f80931f056d 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -774,8 +774,10 @@ static int s5p_mfc_open(struct file *file)
 	int ret = 0;
 
 	mfc_debug_enter();
-	if (mutex_lock_interruptible(&dev->mfc_mutex))
-		return -ERESTARTSYS;
+	if (mutex_lock_interruptible(&dev->mfc_mutex)) {
+		ret = -ERESTARTSYS;
+		goto err_enter;
+	}
 	dev->num_inst++;	/* It is guarded by mfc_mutex in vfd */
 	/* Allocate memory for context */
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
@@ -946,6 +948,7 @@ static int s5p_mfc_open(struct file *file)
 err_alloc:
 	dev->num_inst--;
 	mutex_unlock(&dev->mfc_mutex);
+err_enter:
 	mfc_debug_leave();
 	return ret;
 }
-- 
2.47.0


