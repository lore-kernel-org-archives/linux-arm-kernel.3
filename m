Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BAECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6n8BkHBaTavJC5ziFlVTjXiczOm+um8gyea/mrzXkcM=; b=d5Tt23GmdvNNLHRB72fEY0kxzH
	rHd6RZny2s2q6JkYQOpTWBbNvkFe7RmPqMDCqJrQx3zaOVEE9tgyjygeiL9FbSIUai78PtDXroDGj
	K+Pr3EiibMj+NVL7/bhHEF1LZyT4x8y7DgOAM+L00c8PHH3YniCUdfK2jlfDTCOk1fdjsllJS2fUp
	rooT1LdduLKUb1iC04I38bI5V4KNnhz01N5s06+yEMvSUxxPrkjB+cfwSuJfT83XwtRCSZWnqVczH
	XdIvPy0NR60qg/+/h0UJdyMRJgDj9vFBo9cXmkZ+RmST0YwdBQT/6bI4kn+lSqukGjwBucqHJMPF9
	4279E9OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvDn-0000000FEBE-14jz;
	Mon, 18 May 2026 10:29:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvDm-0000000FEAc-1g1L
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 10:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6n8BkHBaTavJC5ziFlVTjXiczOm+um8gyea/mrzXkcM=; b=Nj7cje0OjTFEuB43GT7fC3ACST
	RqUkwi71aj2e3/IRbMjLehoRoAs5AyJ+fZDMuFJOUi5AiYNr8xqiT9gxJksCrw0hUO2aMyGR53jGS
	PEGknKQ0pxCovoPqi4+3fhEM2pKjvtH1w/8L0igzgyaITjhuOj1nojM8PZkqax5C0EknDahLr3FKb
	/MvA9DUf4MFHdo+eKbqwEvG9+Tj1V29N33j1/D3aU9Q8pHm5bdiOlj+TzeKfHHyGR9kiV8WrVb1AW
	3EbOjrR9dzzMQnbTNhfccKsHgFKmpa+GsgERcrB4PsWH9i6EDXesMHfmURG//W9PDhYiLa5d9i5Vo
	s1krVEOw==;
Received: from leonov.paulk.fr ([185.233.101.22])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvDj-0000000AlQJ-0czx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:29:13 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 5BB9B1F8004A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 10:29:10 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id CC4A7B40816; Mon, 18 May 2026 10:29:09 +0000 (UTC)
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id A0656B407F5;
	Mon, 18 May 2026 10:24:55 +0000 (UTC)
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
Subject: [PATCH 08/16] media: v4l2-common: Add NV12_32L32 pixel format to v4l2 format info
Date: Mon, 18 May 2026 12:24:43 +0200
Message-ID: <20260518102451.417971-9-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_112911_736836_95E8A82F 
X-CRM114-Status: GOOD (  11.47  )
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

Represent the NV12_32L32 pixel format in the v4l2 format info table.
This is a 32x32 tiled version of NV12.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/media/v4l2-core/v4l2-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 6194d6eb9c56..fe7141883ec5 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -315,6 +315,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		  .block_w = { 4, 4, 0, 0 }, .block_h = { 4, 4, 0, 0 }},
 		{ .format = V4L2_PIX_FMT_NV12_16L16,	.pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2,
 		  .block_w = { 16, 16, 0, 0 }, .block_h = { 16, 16, 0, 0 }},
+		{ .format = V4L2_PIX_FMT_NV12_32L32,	.pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2,
+		  .block_w = { 32, 32, 0, 0 }, .block_h = { 32, 32, 0, 0 }},
 
 		/* YUV planar formats, non contiguous variant */
 		{ .format = V4L2_PIX_FMT_YUV420M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
-- 
2.54.0


