Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25901C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkftu8Sjo5OhTlEOEzdyKQ/gI7UDvxejJnmVYQn+raw=; b=p1eLeyo/WePuym/aYd879F7t9W
	eT/ld/Oc9jzA/XpXQuJSoby+jIC4bvbnTDqW9RW53+esiouUdQaVfDQ4NAGwsoCwWR7t/JagLZRr6
	ZWnYGHHgeuoWFc1sST0lc4fmVul2MGrqO1fNc5MmHyV7ZssAeRBB2NSieZTV3WBCrDEe6chL6ZeNS
	4iB3U7YobDwzKdrb8Y5zNnX2RcV1t5cBpZCLxgd6QojPrwNPOITSTxDK7/VW+YoCkb5v4iZy/3ZmS
	Qz2l7RGNLmcGTObAGeQtzZnfxftqd5r/0i88h+5k5RNob/5P3pAZ64t07A+C+XiipuahdAVdK6Fu7
	APDPPEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiERD-00000007ohA-3Szm;
	Wed, 12 Feb 2025 15:14:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEAc-00000007lgp-1Awm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 14:56:59 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EBA81B24;
	Wed, 12 Feb 2025 15:55:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739372138;
	bh=DxQP+SXSvEVysld5s1g7qrAaoZ/u/BhlAP3hHBtstmw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZnwfX5WcqsLoJ+3YW/8djlsrbdcLA7/HUdhLxTX5WXanXpzn/HHWxxSMhdL8CAEJb
	 cABInYb9PZUdKvq/fIBthuiURSRaFf9cCR8q9K+1BWFp84euXFaMtGRQdX2LtWcJeX
	 JIX5MfM8FH7LCuQwJBI7ZeGZzqhMecaLLzJ3cGqc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 12 Feb 2025 16:56:15 +0200
Subject: [PATCH v3 11/11] drm: xlnx: zynqmp: Add support for XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-xilinx-formats-v3-11-90d0fe106995@ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
In-Reply-To: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=781;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=DxQP+SXSvEVysld5s1g7qrAaoZ/u/BhlAP3hHBtstmw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnrLasSYwlnmhIHTEWBtOZAYSzkaegMe8FZW3k3
 o3I5HHP7PmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ6y2rAAKCRD6PaqMvJYe
 9S99D/95eYK7tFxPCEW4xkmzObP5DNZWZm76zEKvCZYWftqusZPxjG/thjpmTecXWx14oBK4c3c
 Miarmq937Cfkw8L/AJZ40HBAmAagfIG/SGqBJIvVx7KVoDk0/wGQJGA6ADq2jpymmTXL2Ovfgzn
 /3Y6fwTaIUORIR8QrobAkvRyKlLXZipGVpls0+zkeKjwTzaVV0NOy4Yv8+H2+45ZWMvCQvGlFDi
 Waszub4Vz/InKO66DQn0DdlDSUSdXr1A+fKQvRCwGv5/WwO1WMVgFMS51Nx8D+YphhO7a64+H7X
 TZj2QBFnEVicX1bo3F5KuqJIKnXhLhg1TZo/Ab80jRz9jBE6x49iXY+7WERaaqf8GWoEjdBnPX9
 d9E95wEMv29nLQf5HQbON3lmmz6YE0pcDyqo56iPoy4EMQjWDy6hSXHUkb6438glqsQ8H5MOLnb
 hrkWE2TZzS9rjiEZOkLViu00cxcm5DyPR6XlvztLrpiaOGijI7AoDcAvRVi0xDAmUvGVnV4ejs1
 AgEh+BHrL9d7Ahm9QbaZFqEVJLPccsu/QiDjYYBxISZVFcaH9MBQifYcZCXwrOEqK30xqkeYVX9
 w3ikLD96CjcyPUtPrWE0D0YcFxnLe76Sx3tEPSilowwKGx2ioG1H5xerBZ6TkDWVWBeQasXNNxd
 EvFIYhdwFnla6Tg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_065658_462950_D55FB98B 
X-CRM114-Status: UNSURE (   9.45  )
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

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 7495e42677a6..859ee050a668 100644
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


