Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124A7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jV+/Yo3fje2MnYoczo5f53N+kK9uiGm/jhTp3kk1Yz8=; b=tI1U4kMIUUZ+B4UV+gjvax4VUV
	eBo8XbGyRotkC/NkRd6Kl6l3iivuySM+SKRgTj7AzUd7/ObdJQhjE/RgbvnEJRM6eb3xYrKUDuqnp
	qnphmb5yPnLijlUlMNNNjFTf8qd38UfN3j4ZXAE3+VxayKe7g9sWXi4i1DwreAye7CCPrxDFYBwGX
	MEqu/nQX4Z32xGHQOpMiwMyxohVxqTHgo6DpuBXq+WZpGi4ZW75l459NXTFiIAiXJauUNILviJyxL
	3wCPGChKtmL2J4zXCV7ia6M9aHxeGXVTzvX/3L/l2PqhjYgt1CixyueCw6dawRoWfXJmZjLnPTzUm
	oRzcF1vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlTM-00000000pLs-1KE9;
	Thu, 12 Dec 2024 15:51:28 +0000
Received: from a7-40.smtp-out.eu-west-1.amazonses.com ([54.240.7.40])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlLl-00000000nVF-0lNP;
	Thu, 12 Dec 2024 15:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1734018213;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=ltUDALF8WtRUBRtQU/ZvlBBXaB0jB77q/PnuMmcP0BA=;
	b=U1wQpTr3k8eLSbyCBCHyrpP+wbs1XpZS9hsaqkvPRaoxq25BZr/dM6k1xQAk267h
	RA5aOEbkc8rqk9RtQaIX+xl4oRR/h3CotlGUAvrd6J05OlHZTwauyYcdE+yjcn5hhew
	6v2FVSJ/8hzUTRFdtt7IpFFG/5dfHZgHK11x+SyBo/p4RksDDs6W02B6shK1uB9xJ3K
	tyfyd9N5rUU4WeK+EA+4SPx8BgFBzG5tjKntqL3LAcum9J3xETUWBWqxyDDOejpNpnU
	bsRefvfbI/j9XGZEV68GLxyyXkrwfSssvjRaGNia40a+5TV2mTyNEdyec8jvOrlnRmP
	sMO4u7KNAw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1734018213;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=ltUDALF8WtRUBRtQU/ZvlBBXaB0jB77q/PnuMmcP0BA=;
	b=hfVElm0gkL4Grt7PQrESSMWpcfKYEgyVVCSfM2oBuEj4LnmE7/FKiGmRp5KC6fNY
	hW1Sk8gIv52BHGqp5Ak2Z3dd5PdFzQ9mmnXWAfBvv7m1np5iAJRzjjQs9l5Zh1OlTvq
	k2sYNA/KDD0SzebN6C92B88egzp1dsvD1taccRNM=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 0/2] media: verisilicon: fix reference padding issue
Date: Thu, 12 Dec 2024 15:43:33 +0000
Message-ID: <01020193bb8a24ad-99eafebb-3b0b-40c0-9b28-3a0dbc84327a-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.12.12-54.240.7.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_074338_195136_0F551EB3 
X-CRM114-Status: UNSURE (   7.57  )
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

Hantro hardware is splited into two parts: the decoder which produce
tiled pixels formats and the post-processor which produce raster pixels
formats.
When post-processor is used the selected pixels format may not have the
some padding/stride than the decoder output pixels format. This led to
miscomputing chroma and motion vectors offsets so data are overlapping.
This series introduce a reference pixels format that decoder use to
compute the various needed offsets and size.

With this series Fluster for VP9 tests is now 207/305 vs 145/305.
HEVC test score isn't impacted by these patches (still 141/147).

Version 2:
- rebased on top of media-commiter/next
- Add reviewed-by tags

Benjamin Gaignard (2):
  media: verisilicon: Store reference frames pixels format
  media: verisilicon: Fix IMX8 native pixels format steps values

 drivers/media/platform/verisilicon/hantro.h   |  2 ++
 .../media/platform/verisilicon/hantro_g2.c    |  2 +-
 .../platform/verisilicon/hantro_postproc.c    | 32 +++++++------------
 .../media/platform/verisilicon/hantro_v4l2.c  | 21 ++++++++++++
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 10 +++---
 5 files changed, 40 insertions(+), 27 deletions(-)

-- 
2.43.0


