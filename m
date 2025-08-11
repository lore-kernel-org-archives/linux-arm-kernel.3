Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138B9CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T5gC1fBbs/ADrcpd1SASqlwmX0ZMgCaJU5f40fA1/fM=; b=MXbVxyQ5m7jbuVLvDt7BGIAVqc
	obtfvJshfkBRZwBfFNG4MBDijIkxDJ8kTPcVC1ksrnmZbIg7O9/H7p/guZNzMGvYgifTqEvNIfzaj
	h6eSv5+XmKi7+zVOrBHY3QztqbvwSxBZbjOnQCmVYlbZgilBjmg6NsxbrOjv8lhmhw1bY4zFb8Es7
	k9w8ubcpLJGUOOCOqjJ7LRJ0w7+8PvMkQfn0Hf76jJUzCnB1dkyD+t2MK4GYey5wq50ddV5PilV5P
	NO2SpMKOrOgX7mj8E5WmlAbVjs67/MNp6/0P0FsCBI2c8eG4vUyHR4Mmme57XUiYr/a4RBOLR/7yk
	kEwwu7cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulW8d-00000008Wyx-0NI1;
	Mon, 11 Aug 2025 17:16:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulU0l-000000087W2-0OZB;
	Mon, 11 Aug 2025 15:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754924429;
	bh=OfPaJwF2NqvhsMpHh+C8FnHDDOXI3HxcuuTEUJ1zXTM=;
	h=From:Date:Subject:To:Cc:From;
	b=WLFemwymTxFHpSqaFjYDh8D4g5Z3AnRmxJciNjevR87X6QsbJZ6iCmw+PzQs39ILt
	 v/LKs0B8c/HQhagBjBmPAtHOayWquww6fdEYFwpyTBt+bYyi32vtbNK5H7z1pVlqG0
	 TkkjdS9BDD7SUwirT9x6S8pi44qdoP362J19TYICTL1vwoXNTuER5WUndWxwDS8dUs
	 fk1+HktTyU2wWZlt1Hou7brv5fhw5ra4E1ZWDjVEuFK/AzHnq6VEJlH4FgsSREAOQ/
	 KJflIRPFVwGYs+trnI7V7olwXcC/xreTTLlo5P4QTpJlgeMEdzd1pqUicpRbQwQEMm
	 w9q0bOsmJ/zLQ==
Received: from [192.168.13.180] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D16917E00AC;
	Mon, 11 Aug 2025 17:00:28 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Mon, 11 Aug 2025 11:00:19 -0400
Subject: [PATCH v3] media: rkvdec: Remove redundant
 pm_runtime_mark_last_busy() calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-rkvdec-redundant-pm-rebase-v3-1-7cb5eea621a9@collabora.com>
X-B4-Tracking: v=1; b=H4sIAIIFmmgC/43NQQ6CMBCF4auQWVtDi0RwxT0Mi7YzSCO0ZIqNh
 nB3Kydw+b3F/zaIxI4i3IoNmJKLLviM6lSAHbV/kHCYDapUddlIKfiZkKxgwpdH7VexzBlGRxK
 ErWmamkgjQg4sTIN7H/F7nz26uAb+HF9J/da/skkJKdrSXq5KVoMx1NkwTdoE1mcbZuj3ff8Cc
 C/l/MgAAAA=
X-Change-ID: 20250811-rkvdec-redundant-pm-rebase-ed9b885eeadd
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_080031_327120_F52DBB25 
X-CRM114-Status: UNSURE (   9.41  )
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

From: Sakari Ailus <sakari.ailus@linux.intel.com>

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Changes in v3:
- Fixed truncated subject line
- Added Heiko Rb
- Link to v2: https://lore.kernel.org/r/20250811-rkvdec-redundant-pm-rebase-v2-1-90c47213fbbe@collabora.com

Changes in v2:
- Re-applied since the driver have been moved out of staging
- Link to v1: https://lore.kernel.org/all/20250704075450.3221972-1-sakari.ailus@linux.intel.com
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index d707088ec0dc1f6a18b2d168ebdf20b443f2240e..445f7c92eee34f7d6f885bb519d9eb24313da548 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -765,7 +765,6 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	pm_runtime_mark_last_busy(rkvdec->dev);
 	pm_runtime_put_autosuspend(rkvdec->dev);
 	rkvdec_job_finish_no_pm(ctx, result);
 }

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250811-rkvdec-redundant-pm-rebase-ed9b885eeadd

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


