Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D862106B535
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 13:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=clFFht42Vqa1JrYtRLzyp427Q8lxoPzkFk/Z62BjVbU=; b=VKI6yFvIe3PVwGQh5PH57dJfBs
	buscSS+ozon0ui/MviV321JUE9furSiRE3DlHgnOir99fPTZ+46OmtmpPv1VIuCkJ/Gp/N7s53Mvi
	OIyPQL1Xp9y0bY6s+WyDzi0wpTwyhHeVOF//LFpgq08vMxdBHULcq7dqhkppjEIGES437ZPW5zDdT
	3IoDLLSGq4nVWUhBvqQEJIlk8UjBh/USMUUV7ubhCL9iY0z+j0kOQdq9h1h5WYsR7vtf8LZJnfUu2
	ogdBrEM5JmwS4W9NhJ4NnUeg2pdimMTkVUegOpyQoxWYxum3MBoNmPfj/TRyagZ0vI7p4Psw6PPse
	/6XZtdZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5O9U-00000003Ruc-0gtf;
	Wed, 25 Mar 2026 13:20:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5O9S-00000003Rtc-1Yk0;
	Wed, 25 Mar 2026 13:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774444799;
	bh=rAtFCTnNu62D1mgQjhXKJO7Vg4yukZj9geogQbPukM4=;
	h=From:To:Cc:Subject:Date:From;
	b=Y7qIYXrMVX8by7jKWR9K3d+2t3lvnEQZpo0dYyAPmqdklWQVMox/zR4oH4I0dG1NO
	 dOFBeiM49RWp9Nzz0oO3qH0I9tfplE3RgpemIg6TScv4qfsxbtHV/RJaMp/y5A6Hkp
	 VqdUeVyNgx6FgmY+B2idY6qujq/SmHV9l6DW1Ybah5Jx67JUixJZnCWR4RRf8zupJA
	 egY6avMuj2yg27l1NKopq2ueLtC6utlIqMhVoNrbcvPz9LLfO1QzbU2NA8n0KLUKpR
	 zILTnWY4cZbkMYw6I1SS834mT0cEGOjzfJbfpTvFfbWvhBHUAeTujpbmjPlBLV3jvK
	 HYtCl9wWQLG9w==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:5bd7:b5b9:ee7f:b609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED71E17E5A4E;
	Wed, 25 Mar 2026 14:19:58 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: verisilicon: AV1: Discard none supported profiles
Date: Wed, 25 Mar 2026 14:19:56 +0100
Message-ID: <20260325131956.18075-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_062002_583252_30B6241C 
X-CRM114-Status: UNSURE (   9.26  )
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

AV1 hardware can only decode YUV420 pixel format. That means
that only profile 0 is supported. Discard all other profiles
when receiving AV1 sequence control.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..12f98e7e7994 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -283,6 +283,8 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 
 		if (sequence->bit_depth != 8 && sequence->bit_depth != 10)
 			return -EINVAL;
+		if (sequence->seq_profile != 0)
+			return -EINVAL;
 	}
 
 	return 0;
-- 
2.43.0


