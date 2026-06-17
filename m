Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B99ACD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 18:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1iHTpMxp0sTX1ouBA7FVS9JwNOdN7u6NI9eBDUUiZo=; b=sdu8zMuL3Be9QWiffQBU9FgTnO
	/csooSscGYjU7Egjom6ypkrVVFk7HOErLIGKnYjM4noP1TXrgQpGAc6OTQzTxfmTJc/Ayeg/8jIoB
	Vfo5wbtrmNzQpdpYLdXzkqNeLG9gFbItLTDG9Lz0ycH0tF6DOFlw1kxscuU3g/rJiS554QEiksOiU
	OqmtdkPoXL9jJR3RT8Arzk3ODIVhkjvqXifDlfAXCaLD/1SxTSDLMf9bIYuloVE0XqmSLu7CUzMUq
	lTkh2GKfBmlk+gsroiYfO/LHCX+sLWEBmoHvGAD/R1Buw4mBfoP42C4JSb7pQCzk0LE0sK9QhK+xO
	oWgWxyhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZujN-000000009EH-1QK8;
	Wed, 17 Jun 2026 18:11:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZujL-000000009DC-0Gom;
	Wed, 17 Jun 2026 18:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781719871;
	bh=FABDxv4lHTYBByMlOCppusyHS79PePlZmwh5TvT0nmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IJnW4yfP8PHRyvofnrJPJQZzgJoFYrdG9LzwKKtaI3J5HktjnuqO/oJnwGmxlWkeM
	 kgls9GrinQyS+pT090z2FLwqpj1qmsZP+FYHu2jnc3TeMfLXM/ZgCvyoiG1RoC02Lz
	 j8DYVvwJ0bcndp3bY+g4N83kf3CnSdiOqIFCXZ0ShtJ6dzOUxUbPKPjRxXE7xTmv7M
	 iJZBmtrbC6ki+BWnebrsGkitfgLbRsva6x8gx2pjUAX3iqJkCUfJNo712oHk39MIQM
	 k0JxdMHmnc1xWzTbRxXTORH/RYqsnNLh9f1LpL5bZtTHEFKymiWtWAUwFYlBYUIAIB
	 Nta4bU39F0d1g==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 612B317E0920;
	Wed, 17 Jun 2026 20:11:10 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 17 Jun 2026 14:10:56 -0400
Subject: [PATCH v2 1/5] media: v4l2: Add callback for show_fdinfo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-v4l2-add-fdinfo-v2-1-d298e98ce06a@collabora.com>
References: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
In-Reply-To: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_111115_258791_38133F49 
X-CRM114-Status: GOOD (  12.12  )
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

Allow v4l2 drivers to add information in the fdinfo file matching the
opened /dev/videoX file.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 10 ++++++++++
 include/media/v4l2-dev.h           |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 6ce623a1245a..3878fa2ff73e 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -481,6 +481,15 @@ static int v4l2_release(struct inode *inode, struct file *filp)
 	return ret;
 }
 
+/* Override for the show_fdinfo function */
+static void v4l2_show_fdinfo(struct seq_file *m, struct file *filp)
+{
+	struct video_device *vdev = video_devdata(filp);
+
+	if (vdev->fops->show_fdinfo)
+		vdev->fops->show_fdinfo(m, filp);
+}
+
 static const struct file_operations v4l2_fops = {
 	.owner = THIS_MODULE,
 	.read = v4l2_read,
@@ -494,6 +503,7 @@ static const struct file_operations v4l2_fops = {
 #endif
 	.release = v4l2_release,
 	.poll = v4l2_poll,
+	.show_fdinfo = v4l2_show_fdinfo,
 };
 
 /**
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 2e0f6d2e6a78..1635ab186f21 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -212,6 +212,7 @@ struct v4l2_file_operations {
 	int (*mmap) (struct file *, struct vm_area_struct *);
 	int (*open) (struct file *);
 	int (*release) (struct file *);
+	void (*show_fdinfo)(struct seq_file *, struct file *);
 };
 
 /*

-- 
2.54.0


