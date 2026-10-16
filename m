Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33CACCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6jKV1Wzp7fGYXRSf7cKBGfPxyp04vnQU7GdTLpcL8c=; b=JqCslT6aDSwbNS3YfmZ7cvgP4N
	GCfPePB7GLP/vsQmQJsymnkhYyQXtKKC0mm1U40fHPCNIMCRMMTh5fNmBv1RaJLwBKMgrOLnOMAE0
	XWZVLDHx73sfrizn5VwrmDL6KzONlWyOFLSshhgTK4R9qFkqdSXTx7omAqSoFeLajpPLD0Cw93pRZ
	d4x38bYouBG5EYzqXh4erGkrxskNMMy2fdXGNv8h/0FxJyLyFzdk+/u9egLvg/yKYRRh+NAH5erph
	QWLGAcjSDkA8Rw/qgaggOkUBDpBRsbUM6ZP9fnDgFfSvX7Ly8si+Mco8yhEOYT26uu0CxDSb8aH8j
	vbP6/OIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiAz-000000033n9-0Uu2;
	Fri, 16 Oct 2026 13:40:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiAt-000000033iJ-2Ie3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 13:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=g6jKV1Wzp7fGYXRSf7cKBGfPxyp04vnQU7GdTLpcL8c=; b=EVPmRAs0EHHEtSBWs81SVpctft
	leOIxEyyCI+UpbPfYTPhmo9RxWCmdpfhS9zTS0rHjhNRbeLThuFEjNzg8/3vos+DstB2Qm5EiOob3
	jJX+2F1UjS1zdnPlzFVA9ycvqv7XivXXoTuSJrTRSLlBuRu89ZjRNUo27YGPjIo6PxAaIFBo5H2m8
	qI2n+jJOZKkW89UEXJ3zbxh/k0DiNUtMZL4Ah5G5mR8UbOpTkZlUEKDWBppl0/Fn+S4uc8WnCnKsl
	yOtjHIgkm1IeBmwqr8sNu0DQn3wDhy33Maizs+T3NPyJUVfHBpIvCEwLkrKz6ppRsiVEX7hbDFCm0
	3ZHxrLmQ==;
Received: from smtp-bc0d.mail.infomaniak.ch ([45.157.188.13])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHiAp-00000001YZL-0XCR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:40:42 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j5mKb2RRmzbqV;
	Fri, 16 Oct 2026 15:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1792158035;
	bh=g6jKV1Wzp7fGYXRSf7cKBGfPxyp04vnQU7GdTLpcL8c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K9HxLENO5ll75qzX6aI5UYh/n+FyHtM6QpadLCr4OW4z3Y0WEaCURefOdjkl/uDPF
	 i6dmyXMkb5BsERqI2eX6V1UEcQKNyjY35cqu6Fhj5z7SvnhB6lAP3do/9n80J/8rql
	 Tq+4ZDM1kV/oEaTsZOJFjcV1YKOTTIrlbVkDC228+fzAyJs8EIDf4OGj7eY1dCKcdr
	 RKppPmWt9zJE1yV2p8WdH/rKafft8G/V5G/85S0QWmKlb4jWwsNFLRsLu2oU688W6D
	 JhTqDvAuTbe2PyEw8gz7d0ihAxW8oXnS+Y56UT5uoUk39ilbz4W47adlPkaRlOoNXE
	 4CJprKKEt/7bg==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4j5mKZ1MrHzFgW;
	Fri, 16 Oct 2026 15:40:34 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 16 Oct 2026 15:39:58 +0200
Subject: [PATCH 2/3] media: rockchip: rkcif: add support for GREY and Y10
 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-v4l-y8-y10-csi-vicap-v1-2-27bb87aa745d@cherry.de>
References: <20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de>
In-Reply-To: <20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_144039_313298_7E0EA0D0 
X-CRM114-Status: GOOD (  10.63  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The OV9282 camera sensor driver can output in those two formats, but the
VICAP didn't advertise support for them yet.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index bc9518f8db507..7e86e0bc7573e 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -87,6 +87,26 @@ static const struct rkcif_output_fmt mipi_out_fmts[] = {
 			.type = RKCIF_MIPI_TYPE_RAW8,
 		},
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.type = RKCIF_MIPI_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_Y10,
+		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.type = RKCIF_MIPI_TYPE_RAW10,
+		},
+	},
 	/* RGB formats */
 	{
 		.fourcc = V4L2_PIX_FMT_RGB24,
@@ -333,6 +353,12 @@ static const struct rkcif_input_fmt mipi_in_fmts[] = {
 	{
 		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
 	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
+	},
 	/* RGB formats */
 	{
 		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,

-- 
2.56.0


