Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B963CD68BF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 09:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M+GBJR5MLY2BMSbeZqP++BCbPYO6xaydHjcArVErACo=; b=Hkh2nf956QoKiw
	R91tHJlo4JPEucnZ8s+XZF5rXgX9zDHO/cZTuO9ylo4Hzj0xYQ8gdVSNn5iDFiyEvbOpP2DB824qi
	CQu8YqjCAXcp79J1EjCx4D0zrPqJ+jy+rzEg2cna0KBNOJ1xwPeaFTozbiozZ/vhnVvKbsuIJ8zdA
	thPrECpWFzdwPlG56LknrFBMKyqoM5zPWF1mNNu2EarQ1oq43u86P/7JXjhR6v0THM4cuQwRLSdRF
	hPISac2vVSTKb/Rb4+fbTXK9fe17W9yMdKZM2heGslKVurT9FnpnrYW63uxJhnOlo7i3CFfcpVdWx
	O4cABc4vz3Yzw6XFShUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAEy-000000088bq-3avx;
	Thu, 18 Dec 2025 09:24:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAEv-000000088aV-3cT3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 09:24:07 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vWAEo-0002J4-FB; Thu, 18 Dec 2025 10:23:58 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 0/3] media: imx-csi: cleanup media pipeline start
Date: Thu, 18 Dec 2025 10:23:48 +0100
Message-Id: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACTIQ2kC/32NQQ6CMBBFr0Jm7Zh2rAquvIdh0dABJpHStEAwh
 LtbOYDL95L//gaJo3CCR7FB5EWSjD4DnQpoeus7RnGZgRRdtVZ3HNiJRRlWbN5s/RywUkSuMtq
 yMZB3IXIr69F81Zl7SdMYP8fFon/2X23RqLAtyd6qS0Nla56BfTdPcfSynh1Dve/7F0UsSCy3A
 AAA
X-Change-ID: 20251107-media-imx-cleanup-9022d941ae44
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-staging@lists.linux.dev, Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_012405_933622_09582D92 
X-CRM114-Status: UNSURE (   9.87  )
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

The imx media device currently assumes that there is only a single media
pipeline. However, the media graph has multiple imx capture devices.
These may be started separately on media pipelines if they don't cause
conflicts in the media graph.

Move the media pipeline from the media device to the capture devices to
properly track and handle multiple media pipelines for the imx-csi.
Refactor the code to start the media pipeline from the driver to help
the reader.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- Improve code readability in Patch 2
- Update commit message of Patch 3 as suggested by Frank Li
- Link to v1: https://patch.msgid.link/20251107-media-imx-cleanup-v1-0-f82a693c28f4@pengutronix.de

---
Michael Tretter (3):
      media: imx-csi: move media_pipeline to video device
      media: imx-csi: explicitly start media pipeline on pad 0
      media: imx-csi: use media_pad_is_streaming helper

 drivers/staging/media/imx/imx-media-capture.c |  8 ++++----
 drivers/staging/media/imx/imx-media-utils.c   | 12 ++++++++----
 drivers/staging/media/imx/imx-media.h         |  7 ++++---
 3 files changed, 16 insertions(+), 11 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251107-media-imx-cleanup-9022d941ae44

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>


