Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A5AD46BE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rH2NXepohJaTo1isM8gNLxamlTW382a50dR8hOaU8Y=; b=H2kcHLvrQzlny1RWuXDOLlajGI
	XvXTMU0h7GJccTORb83bbcAFnq8MHjYdwuiCaXI0PA6rua1uCH00MdSRcmiq7UKeQlY06cF9hryOe
	q7d+LujasPZoup49a3T7bbj03cJP2EkxNKNRsW1OZ+dFyV0qO7zx5A+txtKza9ujEkWkpoG0h1Z/K
	1uO0hbSTXPPaAxiWfKGFVygTEv3xyiLFl/PoHney9B1eVX55uQJPuhzXREPoD8jr4jT1C6Nbf/Uds
	iHOstdHbYZabHQigFsIEHEymgcgFE+5g75S7lx7b52nMRegGvdf/alAIa7XR+30Fln8beRROSZ5Tn
	IeG2Kwgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Je-0000000GTn8-1oF2;
	Wed, 28 Jan 2026 17:26:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Ix-0000000GTK1-0M4F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:26:12 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1056D2816;
	Wed, 28 Jan 2026 18:25:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769621132;
	bh=BZHJIHbfU3WMf56HjmEiiHzf5jpWhVk/2HMKJJVRN/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n3xAs2Z45+uxhJSOXbQ9I/DOcOPs1mYEIgMDFRpWK+gwaiXFnTpwaoQc2osv4xW2Z
	 jKSea0oJy6oy44jEfeZ2+iWVgvlM9wgOue8K8yxGea+yNCq+MIUwTAECVTbTjB3wEL
	 BLKYcwjSBcQPQWeBQogIQi1tfrq5PajYbUfsBxmU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 28 Jan 2026 19:25:35 +0200
Subject: [PATCH v8 10/11] drm: xlnx: zynqmp: Add support for X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-xilinx-formats-v8-10-9ea8adb70269@ideasonboard.com>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
In-Reply-To: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=883;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=BZHJIHbfU3WMf56HjmEiiHzf5jpWhVk/2HMKJJVRN/Y=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpekammVcnVYz6gf4gZVCGbHxAjIhBFFhgNq7Ge
 br/STj6SDmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaXpGpgAKCRD6PaqMvJYe
 9YvrD/wOvZAPuoQW9Vk7ZIkDTJJx4Uf5YkZu+9+xHFYQnRSS5AlQDLHQQTGjdp1vrPhZOfUstdQ
 +fRjBM1CYIc24ynA8eJao8HjtPGCaLcp8slVXoLC88M/Wfpw/en/5pnLuFLEeU/K2DQux3XxJoV
 R+3BeS9vnSU3EQxtbjewoRFMeZsxXAcSk6yK0JVx/n4LM247FFsr+5oWqelzlcKh0HyvoPEyMi/
 +/PdXs3oAUCMrWSz8sa0PLOdO7JMw/i1pjl/RT0TnLDJqADZ7SZlihE50pg3XhGWm4qkVHLj94O
 PFbOPKKY13wRC6kOn2CWQYbzCxyCOcMySAxHedOz7tBtZpLLmf85GB840qS4oR0i/BN6vrzZOWw
 tUBGF6LMqDGDWAw1X+nGpC98qT6OWMU/OSRYONf2da4bWW8FIrVyILvrwLQrJoKsNU7FzobNyme
 CwmyftUfiGwJEhEXQqXBhhWx2tdztl2u65HVlQFMeQP43qFFiRIvqcgDprSODcuGE85ot3aNun1
 NsOUJdAnsjGx0g+6nzPyPCd6kB0+y/D4hgoqktTeuvK8AMv9Au9Cj5DH9EpcDuXKT6sqBFlvBIm
 s325a1bSdEhrw1R7AHVSaEWacRPboX4qs1m3eYxJdDkS1sHBhngdBJJVgOZCduF10WWeLu2zv1r
 VCbRZHEYF2Mb5kg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_092611_264948_DD5EBFDB 
X-CRM114-Status: UNSURE (   9.48  )
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

Add support for X403 format.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 57bb6d1dd10a..98105d1c4456 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -317,6 +317,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
 		.swap		= false,
 		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_X403,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 

-- 
2.43.0


