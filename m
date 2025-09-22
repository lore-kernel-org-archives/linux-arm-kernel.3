Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75038CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 18:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pigoEzFeIwmYIYUn3ePhZYQo7qKn9dl5kz0ye5QOxgQ=; b=mlmReLpbt+vl0t
	1eLo/ApZLU8Cs7PxVyB/R+Ezb6nNCJG9jLVXyfaAGzcEp8zkHbvUDHUS965vuXV0gVw+iEEAxWjyw
	DAxSKQwmuR2w/Tv+x9/y/QhSdmvD0J7xaei93Zwu36siAc/oFLmmOCkt8sV7wp5NPYXx6TCWr+X8p
	kJOEA5BgJROi9UhqouOb4WhOTC25IzsoY672h3iYhCt6q92JV4eltq+KWDRCUpB9ZgTepqP1xwqO8
	kO6BLPMhPQtNwsu6aDspgmUi78KPV32e0M+32ZmLDs+5AVyQQBr5Tdo5I3LxeVyTIohHlqT6ukjrZ
	H/SLrwbz5m5VRGonzNoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0lWC-0000000BGoQ-1O9u;
	Mon, 22 Sep 2025 18:44:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0lW9-0000000BGlr-1ZG5;
	Mon, 22 Sep 2025 18:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758566642;
	bh=qJ+biJM2TwoXnGA56XQYa05itNz8yBOcvDagz+NFrGU=;
	h=From:Subject:Date:To:Cc:From;
	b=ebwaCkxHDAGHYS4qE8QPgOdYsJO6p5SHToqt6R/xmZUc2nyC5YmOn1TmNIH/TLIjX
	 WqaAwY4noR5s0Roa9ac1OaDa08wQIQDT6xtmUmg25QzyM8HdIb/icMWquGIN7i50Cz
	 elcNukL3U+BSecVNtDaJ1/FrVAKZ98CZ5meoEr5Ka+9DcoeRlPY51n4WpjBQXiUsMe
	 vO8OkI5Nx7asWoNczggXDG3Uf9wjsfjoAZdZrarvAxelWxxsVVmCeEQSEPNHFOyA1b
	 iebbRxnZKeQtOGMZluTaAKXwTQpVc64UzS9xBlkkGxOz3a9JBfwITtxRt2q7RpTsuw
	 mPVBEYdQmhrXw==
Received: from [192.168.13.179] (unknown [IPv6:2606:6d00:10:aee0::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CAF7517E124A;
	Mon, 22 Sep 2025 20:44:00 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 0/2] media: verisilicon: Fix Hantro G2 handling of invalid
 DPB index
Date: Mon, 22 Sep 2025 14:43:37 -0400
Message-Id: <20250922-imx8mq-hantro-g2-hang-v1-0-67d00eb6a548@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANmY0WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0NL3czcCovcQl2gXElRvm66EYiVrpucZGCSkpxiYJ5oYaIE1FtQlJq
 WWQE2Nzq2thYAdneXa2cAAAA=
X-Change-ID: 20250919-imx8mq-hantro-g2-hang-cb04dcd07a84
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Stable@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598;
 i=nicolas.dufresne@collabora.com; h=from:subject:message-id;
 bh=qJ+biJM2TwoXnGA56XQYa05itNz8yBOcvDagz+NFrGU=;
 b=owGbwMvMwCV203FKoGZC0RfG02pJDBkXZ3yovtPKc/bayuTVDL5Te89tm/FbdErJsc2fd4XbV
 7fkbXyo1FHKwiDGxSArpsjynjeoUfTI4UNSLPlCMHNYmUCGMHBxCsBEihkZ/odfUsnYEhFo8fR7
 rNdNKW3pL4opq9dsnJ82w0Q2ereLgSDDf/8GueoZh8xYDdZ+yG/fINd6z3b93u8P9u5lXcdVuL+
 8nBsA
X-Developer-Key: i=nicolas.dufresne@collabora.com; a=openpgp;
 fpr=EF0D528115C4C3C21A046F12D9419451296072F4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_114405_605019_7AF628DA 
X-CRM114-Status: GOOD (  11.74  )
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

First patch hardens the IRQ handler so the driver can resume after
hitting bus errors (presumably AXI errors). This will reduce the
risk of having to reboot the system in order to recover.

The second patch actually fix the issue, ensuring the decoder won't be
instructed to use address 0x0 as a reference anymore.

The issues was discovered using GStreamer. A bug in the userspace lead
to skippable (RASL) frames not being skipped if its past reference are
missing. This will happen when seeking inside a video that makes use of
this GOP configuration. The probably could also have been hit in lossy
streaming use cases, such as WebRTC. The JCT-VC-HEVC_V1 ITU tests still
results in 141/147 with two concurrent decoders.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Nicolas Dufresne (2):
      media: verisilicon: Fix CPU stalls on G2 bus error
      media: verisilicon: Protect G2 HEVC decoder against invalid DPB index

 drivers/media/platform/verisilicon/hantro_g2.c     | 88 +++++++++++++++++-----
 .../platform/verisilicon/hantro_g2_hevc_dec.c      | 17 ++++-
 .../media/platform/verisilicon/hantro_g2_regs.h    | 13 ++++
 .../media/platform/verisilicon/hantro_g2_vp9_dec.c |  2 -
 drivers/media/platform/verisilicon/hantro_hw.h     |  1 +
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c  |  2 +
 6 files changed, 98 insertions(+), 25 deletions(-)
---
base-commit: 40b7a19f321e65789612ebaca966472055dab48c
change-id: 20250919-imx8mq-hantro-g2-hang-cb04dcd07a84

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


