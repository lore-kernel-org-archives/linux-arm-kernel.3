Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4305C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 03:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kKJ3JnDN7CMAEU7BuJ5mn/TOdxuZKO16Ai+J9jrTaQ=; b=3zoGYLhnRl1lpU03Hrm4HWl6LY
	movSgg0VWA+KhenvG3i50/M0JtDEDE/AgLqFZTTQX3SFj8mfrjXwXSyrEqtEZ9g5xCOtiqL4Rkaee
	Z37kKEyrx49awuwcJPzYq/ZanWJGqdYT65C6R5nawFgZ9kHdz17jkbod++zA91DKAvpsQlQjZ21Xz
	i5FSoJlkQ3/r5LMHNPQDFdkW+WsQfbFVc3e408I9sL6D4IfqoXA1QwpnClVHOliyQdZYw/T4YCLjf
	eQ3cuSfxopnu051OIdAKT9hKPoRohw6Qy+kVRi72zsd8fx8mB4nfBy3RiaIYNJBnWC+rsc5wbkoH9
	p9bih+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wikQW-000000073Ii-0IPL;
	Sun, 12 Jul 2026 03:00:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wikQS-000000073HZ-381j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 03:00:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F8A443A2B;
	Sun, 12 Jul 2026 03:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6491F00A3E;
	Sun, 12 Jul 2026 03:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825215;
	bh=+kKJ3JnDN7CMAEU7BuJ5mn/TOdxuZKO16Ai+J9jrTaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PiL2VajbblouMJbCl4hJb0obOawgU6W0DNq/OopJ6+VjFtINEurqUTitTDfoV2K5+
	 XDnRBIpfY9iQMkmobm9cHAqbdGIUbbfGiPj0fH3miLZ8S0lFm1DJD+JC1fQznpl93/
	 ZA57Y1/MmPmkWWzCQASiJucyVaI9MtJtQX3+AS1ErYbLOsusM/Het3OLx8/lhNgEQe
	 Mp/dj+B8DDqrWs2ILYYK47A74i7MmjOcdyK7D1XML+yMIOKi19XvF+6GjgWIgNX6FJ
	 MfpJ4UkdhO7DLPFwRKTOfdGqvbIH50jiVMg4SYHM4QlNovoZ3bLWkAnVUK3Cg56whH
	 hfEl9CR0Jsy3A==
Received: by wens.tw (Postfix, from userid 1000)
	id 050F260162; Sun, 12 Jul 2026 11:00:12 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 4/7] staging: media: sunxi: cedrus: add H616 variant
Date: Sun, 12 Jul 2026 11:00:07 +0800
Message-ID: <20260712030011.3778169-5-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260712030011.3778169-1-wens@kernel.org>
References: <20260712030011.3778169-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Allwinner H616 SoC has a video engine hardware block like the one
found on previous generations such as the H6. In addition to the
currently supported features of the H6, it also includes a VP9 decoder.
Support for VP9 will be added separately.

Add the compatible for the H616 variant, using the H6 variant data.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
Changes since v2:
- Drop "drivers:" from subject

Changes since v1:
- Updated commit message on VP9 decoder status
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index bbd186b8035b..ac0217976670 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -696,6 +696,10 @@ static const struct of_device_id cedrus_dt_match[] = {
 		.compatible = "allwinner,sun50i-h6-video-engine",
 		.data = &sun50i_h6_cedrus_variant,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-video-engine",
+		.data = &sun50i_h6_cedrus_variant,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, cedrus_dt_match);
-- 
2.47.3


