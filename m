Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EECCC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NztMN+lrRBAPGyb+j4gGNyxW1xmIwWsR49eJg2k55sk=; b=jH0B6uwCSXdq3L
	j3srSQ7ogUWGdRsPvaaoPN5aQig9SphPPi6Uu8411hpM4P6Cz3FFOwm+Pj3SOZFi1tuRNAVVIefV4
	D4KwPAWb30HE5T2XRPikM94YsRENVbDwzrT/kXdtUUvTi41HiW4faKdvfzbzmw3X2wq4bgVYy5GoV
	8pyfKd7O0Gd8DuvgBR+e8Ill8+0DZDHSFriZP2CSBxNokQ1p9+76YhvqYoDayXMne9M19r26K0N/u
	WZHuCeR7O1dY7SDORF1u3gTG9li7TfgoqhTegQ/8ipBlCb0641C6bNDZS7Ddv/Lks+BYo9BJYY/bq
	FezYBwdWj9jeVNLsrigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjav-0000000CdOY-1ofv;
	Mon, 06 Jul 2026 13:42:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjas-0000000Cd7w-0C9p;
	Mon, 06 Jul 2026 13:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783345347;
	bh=+iOjTAdA4oCabpofL+K7pRzUfLApeuQa4aammB14sWA=;
	h=From:Subject:Date:To:Cc:From;
	b=knO00BEAGmqnYTyt4Z8i+g8SH3CgUXg0FwMtnpsXn16/qMUv53F877rFtJxFjZQAu
	 xYCDrL/ewCCiMG5SBIucxYkDPWqn3zi1SAZn/x6AoMYM6cEMWMWJl0MYmUWrYsbxGz
	 Wi/fiYQdWvgFy0noT0rK9iOGNSzgROsiqh5szIPNyDGZ3z16j4EwHVWTIRr9QAlqkJ
	 QHzbrY0dF4QQ3Lj1CllsfkLYR2BbaQ0Imq2tSbdAy1pN8oqMXcL4Qd9TbOJNdv5Aqa
	 ymhhKZ2kGC29tVdqXX9pl7uIG88Vto/y25g8f+jXbDJwpIgOLpcRARjTacVWbhkWMm
	 n9nuCw2+fHvKg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1074717E010F;
	Mon, 06 Jul 2026 15:42:25 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 0/5] media: Add fdinfo support for v4l2 drivers
Date: Mon, 06 Jul 2026 09:42:17 -0400
Message-Id: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XNTQrCMBQE4KtI1kaSV0lbV95DXOTnxUZqI0kNS
 undTSqC2OXAzDcTiRgcRnLYTCRgctH5IYdquyG6k8MFqTM5E2AgmOCMpn0PVBpDrXGD9VTWLbM
 apaqgJXl1D2jdcxFP50+OD3VFPRamNDoXRx9ey2XipffVYaUnThmtoQLOpdKN4Eft+14qH+RO+
 xspDwl+jXptQDYMtA22jUYm5L8xz/MbcIXnTQgBAAA=
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
X-CRM114-CacheID: sfid-20260706_064242_269270_710FE421 
X-CRM114-Status: GOOD (  17.42  )
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
rkvdec drivers, limited to main clock frequency and HW usage time, as
well as HW cycles counting in Hantro.

Even though it is not used yet, per core fields are appended with 
`-<core_id>` to support multi-core drivers.

To ease support in drivers, a v4l2_metrics struct is added.
It stores metrics information and provides helper functions to write
the fdinfo file in a standard way.

An example of usage of this from userspace is implemented in v4l2top:

https://github.com/cazou/v4l2top (Check the upstream branch)

checkpatch.pl warning: The 2 arguments in the show_fdinfo callback
definition are kept unnamed to match with the rest of the struct
definition.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Changes in v3:
- Rename the fdinfo key prefix from "media-" to "v4l2-", and "stats" to
  "metrics"
- Restructure the documentation to have mandatory and optional keys
- Add core ID to fields
- Add HW cycles count support
- Add ABI documentation
- Link to v2: https://patch.msgid.link/20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com

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
      docs: media: add documentation for V4L2 driver usage metrics
      media: hantro: Add per-context fdinfo usage metrics

Detlev Casanova (3):
      media: v4l2: Add callback for show_fdinfo
      media: v4l2-core: Add v4l2-metrics interface
      media: rkvdec: Add per-context fdinfo usage metrics

 Documentation/ABI/testing/procfs-fdinfo-v4l2       | 129 +++++++++++++++++++
 .../userspace-api/media/drivers/index.rst          |   1 +
 .../media/drivers/v4l2-usage-metrics.rst           | 137 +++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  19 +++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |   1 +
 drivers/media/platform/verisilicon/hantro.h        |   3 +
 drivers/media/platform/verisilicon/hantro_drv.c    |  19 +++
 drivers/media/platform/verisilicon/hantro_hw.h     |   1 +
 .../platform/verisilicon/rockchip_vpu981_regs.h    |   1 +
 .../media/platform/verisilicon/rockchip_vpu_hw.c   |   6 +
 drivers/media/v4l2-core/Makefile                   |   2 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |  12 ++
 drivers/media/v4l2-core/v4l2-fh.c                  |   3 +
 drivers/media/v4l2-core/v4l2-metrics.c             |  78 ++++++++++++
 include/media/v4l2-dev.h                           |   1 +
 include/media/v4l2-fh.h                            |   2 +
 include/media/v4l2-metrics.h                       |  47 +++++++
 17 files changed, 461 insertions(+), 1 deletion(-)
---
base-commit: 3c587e0b08bd3c4853a22792b9166b7457870165
change-id: 20260610-v4l2-add-fdinfo-a790fceab329

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


