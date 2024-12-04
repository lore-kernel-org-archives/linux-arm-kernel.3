Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA204E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1IWz3ETVJRu4jvTxLCDECc3u2dAVno7sYm2CwsHz3o=; b=MfLdpEkfUEc388dVlo1ZhQicRV
	7kZlSIz3H6wqLPriznaNIihCu7xP2zQoWfbRkIQWLhq/mXG7JeAbwV/lkRJ7xyb+AxwOCQhSKXOIp
	eX1ZHC9U7B7wi9nc2Og7GMfOW6eSgS5bpPf0y7JFfZCwt3AMm/PsHp9WdjvLACdmDXis9FPcr0RuH
	cArPf5SvlApWPx3QCj3fP7hGFGcZNiyAfIaQSmqYTLKe4w7V/KJQUgEfAI2bmMzWNyQ73fGRw1hgW
	XFwC2J9UdnZ5IfWmX43UXtllJgRoHtyiJGAow2j39zCNsvqQxZZekWh8uOzcQXTxKk39ElE2SXvyL
	cYKQqcDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlqf-0000000C4pK-3T4v;
	Wed, 04 Dec 2024 09:39:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIljR-0000000C3D7-3VmW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:31:43 +0000
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03527191D;
	Wed,  4 Dec 2024 10:31:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733304671;
	bh=3lV+l32vg2JpWZEq7vy7NUNpO/y6nBsRUh7Y4B6/+ho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hZCffjL17efrhE31XcvGHz/zF4lxvQy6/t4T7uOmwErvEgyhCmHUfXIKR4erT+emb
	 gV7cHOvHipDHn2/ronbTjJfCIMYmyMuU6ThdTIe027j1pifcE8E97t2w7RbKYJDeJn
	 LseGz6WcV/9yKd3xlb6ei/TmtiMZKCGZst3ulZv0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 11:31:07 +0200
Subject: [PATCH 07/10] drm: xlnx: zynqmp: Add support for XV15 & XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-xilinx-formats-v1-7-0bf2c5147db1@ideasonboard.com>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
In-Reply-To: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=3lV+l32vg2JpWZEq7vy7NUNpO/y6nBsRUh7Y4B6/+ho=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCFzjIte6iQJAwvU70HmuJG4CLSFQXDQ7PflQ
 LjDIRZ+McqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhcwAKCRD6PaqMvJYe
 9Ym4EACofxnUMNc2FyeEumCCakl0p5SAvqleYke9a+UAr3s2faA6SnucTFcG6cNwqOOHuHqwWAx
 a5zLZPUq7MqEb2a1gZ2YxQiF4/UfWqKUH5/rj/WTwoeCgSs41VrDUWbNYljYRpk5TcN2JbQKM1v
 HEa/Q7LANLrOuy5mbomCCPxIvTqCyiW71spixx3VzcSuRiaPdFd6pwN0Yv6FIXpzA4dvomn5jQv
 h4godXykGa7q2nehS4tOCLX3fRhZ8Ji+63koTpvaOihiljnTzEBqVKecX9QlYWUZw70jZ9V9/jT
 36RC6D56hkGEalOfedPHlwZsPyeZ2h9icpLZC0Y8z65Yz4inMigZ0pB79Es7l0f5fAetPN3OiUF
 Kj+68mE1bGn3ZPkg86li9Y/depPts1yyiM8Gd6/4/sv6tHK4NF/Xd3Ttswtsc6KjkjrbxTfyO6F
 QFbVElrEMA70YTiAiQUQTI4JIe6qy9La8V/7DCaovp0Fq+u/dKIOKpwjHb/R4UxtODR9agF/ZJN
 C7cBZAbYkefjDfOs84rBBaz88iQK1XJMVB1azYJpIUZFMIxgWuiE8Q8CIP2yuYkMl4NnevKsYYG
 vsv1rjPwqcFlcVhPyF2uK9DKLBIa1PvUx06inUT2bpl2v4NK9Bwu9Tb9bV7EAAYy4kNyx7sR3Vc
 gjg/ZHe+xxv2aag==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_013142_053496_79372C3A 
X-CRM114-Status: UNSURE (   9.22  )
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

Add support for XV15 & XV20 formats.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 57221575cbd6..3998754e367e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -299,6 +299,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420,
 		.swap		= true,
 		.sf		= scaling_factors_888,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XV15,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XV20,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 

-- 
2.43.0


