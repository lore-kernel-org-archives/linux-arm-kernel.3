Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8FDCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLEVYxxVdHF/BgWe9OZ+y/PeidNEKgGHjk3LEvKUj98=; b=sSbM2Iy5KD5UR8BrdbxvpWs3L5
	xBU3ZeTge5hDfF0x40MIW9/Sp1s8D4ag8Tnj9JXIhe/B22viFJN+4MYwDUEGVVJeDSAyCSoG+mifm
	s+7mY4ZwKmQGkyRHa6L+1DLqexqUzPtwbCZL3EVyUe8gTDx5dUMzA5He5cjZv3spyzrUQcI8D81re
	ASezHG1VsNjzuIXbQMMm/7x2KFGok5K6LpSNcdw7XRteWKXtAB7KmDH/WrElC6GpbrbKd9U1lAHx+
	PmHfpsK9XQ1Cl3ZVGgfVGMfY+Qk+5ksfJOEmKmo8tK5c2mkkFIbKW1gc4ZtgtongN/WIcTohqHvDx
	1GqPvq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvGG-0000000FFGe-3mHp;
	Mon, 18 May 2026 10:31:48 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvGE-0000000FFFR-1GDO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:31:47 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 4CDB51F8004A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 10:31:44 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id BF8DBB40827; Mon, 18 May 2026 10:31:43 +0000 (UTC)
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 6F206B407FB;
	Mon, 18 May 2026 10:25:01 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 13/16] media: sun6i-isp: Add dummy params link_validate implementation
Date: Mon, 18 May 2026 12:24:48 +0200
Message-ID: <20260518102451.417971-14-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_033146_634287_B7F7307C 
X-CRM114-Status: GOOD (  12.41  )
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

There isn't anything configurable about the params video device link,
but the v4l2 core complains that no op is provided so implement a dummy
one to make it happy.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
index 77c2d06c0436..b7ef33fa2b13 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
@@ -450,6 +450,18 @@ static const struct v4l2_file_operations sun6i_isp_params_fops = {
 	.poll		= vb2_fop_poll,
 };
 
+/* Media Entity */
+
+static int sun6i_isp_params_link_validate(struct media_link *link)
+{
+	/* Nothing to validate here. */
+	return 0;
+}
+
+static const struct media_entity_operations sun6i_isp_params_entity_ops = {
+	.link_validate	= sun6i_isp_params_link_validate,
+};
+
 /* Params */
 
 int sun6i_isp_params_setup(struct sun6i_isp_device *isp_dev)
@@ -470,6 +482,10 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *isp_dev)
 	INIT_LIST_HEAD(&state->queue);
 	spin_lock_init(&state->lock);
 
+	/* Media Entity */
+
+	video_dev->entity.ops = &sun6i_isp_params_entity_ops;
+
 	/* Media Pads */
 
 	pad->flags = MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
-- 
2.54.0


