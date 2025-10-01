Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E9DCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OaAQemJb6KJJt7CrXqZoDzqLZRosfKzRZeSFjFBPeN8=; b=PbtDw90kAANWUhnk59b5QtHMu3
	/5jrwAvlIWCUw24AeDWteUyTZGZFbIAT9XdBTAvm4uaJvsKo92a0lXTewVU0dIDppNh55RqRAL3Mq
	vP+NNCynnCKb8fOAYcsjZKUMiqw8UebL6LHv+C36eoYXG/4nvvSfn9VLIkdvhe/PIPN3Q6ian25+G
	htJZr69VQnDFj2nLRF9bmzEbSn+q4n3wnaHzVGKtC28HCoaJe8PLaI1TcVY/0T/2P3ECvRQ5Wa+3H
	xhBGXtJ4CuaEFmFEjmu1tW65AVx625tKGh7FXtpMj6D0FQws92wtutMuLjV9zpFhuy7iXCXJf+r7R
	In5HP1Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wnQ-000000080C6-188V;
	Wed, 01 Oct 2025 13:23:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wnK-00000007zy0-3AVr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 13:23:01 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9740EBCA;
	Wed,  1 Oct 2025 15:21:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759324888;
	bh=LLJhV2LallcFwhanB+wQUXczMwB4XxYcFq1ZLrudUL0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=khsU2APjJexd87l2z75tK1gHeG0zowsOkrWUFz4T8bNHeWWeyTJuo+5ti5ukumoMB
	 HN+9fsC2jmfhqIopDyX7BEITpyVphzlI7arew8hrIxwOSt7K+WBNorVd3nTZ3pmCur
	 MYzeiW04kyy1wOB8eofyRkgoWxD5HGXepx7a4Xx0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Oct 2025 16:22:23 +0300
Subject: [PATCH v6 11/11] drm: xlnx: zynqmp: Add support for XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-xilinx-formats-v6-11-014b076b542a@ideasonboard.com>
References: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
In-Reply-To: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=898;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=LLJhV2LallcFwhanB+wQUXczMwB4XxYcFq1ZLrudUL0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBo3SskGYeMExv8ixkDTqYrKTmF3tPIjgjyGFyRK
 QMDlXQyH+2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaN0rJAAKCRD6PaqMvJYe
 9Rr0D/9fZ27rpk5xGJjeLhWt5a2DSEgBz5wrzK1MfCjEdkqcAZGoEFaBVRhY5GhVwwKByglXoDw
 SnKgiPxnf4d5M2TYHR1yuLkAgzEkj3rxZweK/h6m0A9LuXVmQc1a5Fb8zKuOliTw50i0/fTdQpJ
 /03mwFBDna82lA7ZiEfLgHaIAPuWQpeu1X5RoDt6sC/ulv/d3OeOjcirNk9HWXwMB7r3296THaS
 h5z3+bMFl1XrdzZM7zHMNcjcht6wFg1uwJyROFNOyHgqwQ8pxLxVmQYPUDe6UHWSjZaNaWVeVyF
 wNWzvg1emfigMt/17nU5EipujouJ4ECuctiK49pYCMsoOXi23x/wokvzLg/322lylWqJHGwacMz
 fnHN0qhVjDTENWMca/dgEceTNUV1mM8UvUaYJmy0DpJisQmJXQxPhBxcj591lnlP2bhsyGt/j48
 HACDVG2fNHpEVeNHT+A3m+gNqnfW0Qew1uKQnJbaBlLhNux9iGAWfefDf8DO8T+rPgLPhZOK7PW
 w2YzbHK3B1HEUDZr87vKVvTduGBqJtg15lulOA+MxcWisyAKGjvb352KdD08OcARcPufbi0aUyc
 uoKoncrz7Pc/ZopXgqm/h5ceAOthWo7/s0uSho8oRkKWWi5EbRoiaHZrw4ky7R2v/qHMVj9T3Wc
 zZqhy+QLz5qgxbg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_062259_005184_B8F7AA13 
X-CRM114-Status: UNSURE (   8.51  )
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

Add support for XVUY2101010 format.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index b7cc7a7581ad..f548f375750e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -322,6 +322,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10,
 		.swap		= false,
 		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XVUY2101010,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YUV444_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 

-- 
2.43.0


