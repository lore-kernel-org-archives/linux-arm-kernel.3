Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B16CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 18:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sCx7/GrS1NY7tP/YcWrM9QhX/XkVqe1nWcj/hzRoPz4=; b=Gxfph2doJ+9a5d
	NExZUI/Fhjr/752oQbtnoQq+Bi13rAdAhKHuDdC3+LJ/renWoHbP9MLVY4wHfMvmKZXxg+T4gz8pK
	Or81qGvjjLXRFenapkowRDbDHMHrZsxh64OE9SGjTqQ7j4xqpMLalB8ShL5K+1fodBZ04rbo3l1iJ
	MwY5PCorXrdE3VkMmPGNHbqgTvnaDFBMIOgKZDfUVWuUDVc0uxgDz3+DaQ5314FbLefYq8kZqxq47
	QUHpU7Ju9QeCwVr6x+HOlQur11o8HVwjmWds7HnK/V6nSFaeCa5r/zw6e00DTVhqfZfpCFJY0BVvp
	jx4xO+vspZF77HAvR7bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZujR-000000009GW-2CHm;
	Wed, 17 Jun 2026 18:11:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZujK-000000009Cr-1K7t;
	Wed, 17 Jun 2026 18:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781719870;
	bh=Z7z73Vx6mkRGNkH8EeUxS/CCZ1mzZNxlvdn2HLEWTQo=;
	h=From:Subject:Date:To:Cc:From;
	b=hVi5hsz7e63rB4gVLSCgUy5meFM0i/5ti7SSV7bSlE+dahY0+pYoNGK4I+rS18xMv
	 LVutmxWKrB+LOpM2ntw/bcudTEi0oDfI5D0rm5Hh9BTp+qKkaGH2LedVv7jkRjdKC6
	 0Tqg6kJhurdf/CBxCpQ+8tBvrk2dDHCpRL4e+IHUAHIcXV0+thpMnFeIzUb25U8bmn
	 yg9QVOQR9DB3Wvnsf5mSDCQlMsMqDuJD7DqPzEckDBh6rmrzR5yc+z7b5d5YM/UvHx
	 DaUQW7GWfryu9lH6PvR7yvvAqibBjK8a932FaS8YsiAuXKxy3IDZRywC471a+gFrOD
	 /ENKuZLJiVovg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 716D417E0566;
	Wed, 17 Jun 2026 20:11:08 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 0/5] media: Add fdinfo support for v4l2 drivers
Date: Wed, 17 Jun 2026 14:10:55 -0400
Message-Id: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNyw6CMBBFf4XM2pp2MCCu/A/Doo+pjEFqWmw0h
 H8XMK5cnuTccydIFJkSnIoJImVOHIYFcFeA7fRwJcFuYUCJlayUFPnQo9DOCe948EHoupHekjY
 lNrCsHpE8v7bipf1yepob2XHNrEbHaQzxvV1mtXq/Ov7VsxJS1FiiUtrYY6XONvS9NiHqvQ13a
 Od5/gAQWHarxAAAAA==
X-Change-ID: 20260610-v4l2-add-fdinfo-a790fceab329
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Christopher Healy <healych@amazon.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_111114_517573_C6D9E827 
X-CRM114-Status: GOOD (  15.21  )
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

fdinfo is useful to poll information from the driver.
Unlike the ftrace interface, it lets userspace tools get a snapshot of
the state of the driver at their own pace, instead of getting events for
each driver status change.

This works better to get information like HW usage time or clock
frequencies, as well as memory usage.
This patch set focuses on mem2mem drivers that are per-frame based and
an implementation is proposed for the Verisilicon Hantro and Rockchip
rkvdec drivers, limited to main clock frequency and HW usage time.

To ease support in drivers, a v4l2_stats struct is added.
It stores statistics information and provides helper functions to write
the fdinfo file in a standard way.

An example of usage of this from userspace is implemented in v4l2top:

https://github.com/cazou/v4l2top (Check the upstream branch)

checkpatch.pl warning: The 2 arguments in the show_fdinfo callback
definition are kept unnamed to match with the rest of the struct
definition.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Changes in v2:
- Simplify key/value pairs by removing repeated <eng> suffix
- Add media type support
- Add v4l2_stats helpers
- Add support in rkvdec too
- Link to v1: https://patch.msgid.link/20260612-v4l2-add-fdinfo-v1-0-723211abc861@collabora.com

To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Detlev Casanova <detlev.casanova@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Christopher Healy (2):
      docs: media: add documentation for media client usage stats
      media: hantro: add per-context fdinfo usage stats

Detlev Casanova (3):
      media: v4l2: Add callback for show_fdinfo
      media: v4l2-core: Add v4l2-stats interface
      media: rkvdec: Add per-context fdinfo usage stats

 .../userspace-api/media/drivers/index.rst          |  1 +
 .../media/drivers/media-usage-stats.rst            | 85 ++++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 19 +++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  1 +
 drivers/media/platform/verisilicon/hantro.h        |  3 +
 drivers/media/platform/verisilicon/hantro_drv.c    | 19 +++++
 drivers/media/v4l2-core/Makefile                   |  2 +-
 drivers/media/v4l2-core/v4l2-dev.c                 | 12 +++
 drivers/media/v4l2-core/v4l2-fh.c                  |  3 +
 drivers/media/v4l2-core/v4l2-stats.c               | 65 +++++++++++++++++
 include/media/v4l2-dev.h                           |  1 +
 include/media/v4l2-fh.h                            |  2 +
 include/media/v4l2-stats.h                         | 44 +++++++++++
 13 files changed, 256 insertions(+), 1 deletion(-)
---
base-commit: 66affa37cfac0aec061cc4bcf4a065b0c52f7e19
change-id: 20260610-v4l2-add-fdinfo-a790fceab329

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


