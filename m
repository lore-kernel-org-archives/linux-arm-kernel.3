Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D892C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RT7Nq605PxZzjLdpPGb1nOxowo5/PdFqJp0c2whstw8=; b=SrzG2vY359IaypF6u58wjjvdBO
	fp+yHyCa5N5oSTpkIb8T9P6m1bItd0yyKOzXHR+z8rB7aBJnvyQw+V35xFcwFnW5NR613RlkwSti/
	Uk76wWeinegK6bY2UceT3n0+6bXDy4fQ4fZLjRzQM8YmAyptuUIa9HMtXYPgO78iQSe+U+vcklyjQ
	lrHfiAaeNGqLG2/gEWtFB/dQub+YWucn3IOfVnexuMsQzRN5SgA38i8F9Ur3advjPfB4zY4MMINh4
	xUHl3ZwWZbQXf29kvcYNE1lzKlgwGH6vdErYAE5C3p+OUi7170Ywqq/bu/G+vFX0BectF91yYmoF8
	NJX2tsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txR3c-00000008b0l-1BS2;
	Wed, 26 Mar 2025 13:44:36 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQjA-00000008YD9-0QKF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:23:30 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AE2E1963;
	Wed, 26 Mar 2025 14:21:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742995299;
	bh=slBT5ASGlHlLYRfFHdYzBrpOFjHVj6vIx9ezqvhm0zk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EfwIHjRQVLubJCVoeMMp3KoFoKUUhiKhawQtKOditfHbhDXfv0f7z+Y8C4fzubz3s
	 5R+7hWkPYIh5iDBk4aZbqPBZjlZg9ffj6hmiPzEhfg4vMX7lcn9Txh59KBmO0moakN
	 a3XsJQlLP1fpQ3lZ3bj39MLg3m0hRL6vW8Gz81RU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:54 +0200
Subject: [PATCH v4 11/11] drm: xlnx: zynqmp: Add support for XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-11-322a300c6d72@ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
In-Reply-To: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=781;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=slBT5ASGlHlLYRfFHdYzBrpOFjHVj6vIx9ezqvhm0zk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//DsRCMB1WLCta1estzXkjXoSWER8pSvhQMe
 KB37gD3tzOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wwAKCRD6PaqMvJYe
 9YjgD/4176gMq72C0vNw+apzQNHJlqYV3VbqPh3TMJ/E+F3SJ8igO26yenPGmMC6YL1NwmI8sD1
 VCRJ7Bzr/G0MG+FbqmU0eUeUGlJCwoixtjCTtiRW+fyoNYRJs+cVKJLrK4WAiylri44RPu138eD
 jh4ZFaS8Is9jAU3Qj1n5TwZsAhVof+4jWjqpX72+98iTUTklWo+Xwnz9b74qdwQ3rApzKAhX4aM
 hk3T/wJ4sDRFMrVimMG6TBrMvKQ0BRIQ+/cql6IxNwx9liLQbAtTL05IDTnydTNFqTad6YKKBhf
 RVRtykBfQzVP6z0gF/klnlVyGASfx1mIG8DoCfNINcCSC9k0PTGg7C6KI04V6y2W8/FxW4lOQWm
 LC9yedg2gVmS3AJPvkWtzdBog5DHf0GUZOW+A93385F/T9C7PvrjJRIcdw2dJe8WSL+eufWCul8
 kQYYvNeerHKWd+eUja/xUTQlbQ5AH4gs80zzdbfQ7xOIG3i0k68taatYwl1/MWrnyloAvSzs/yO
 lYCha1+wkeM7CnR6bM3dFzwkA2XE1n73A0/s1/dmZOfo1gb4HY2tDv0kStCfk0XrWM+ZvT3vAsx
 nsyBMKs5r1FoP5nPUPqpBcl8uqABtsYKzFu9wSDluGctgS9gSB56vV72Fgyw/MtJq9CknEbXLMI
 nQ0kBNBUuV7BMSw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_062328_289918_CD269AC3 
X-CRM114-Status: UNSURE (   9.34  )
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
index ce685dfbf31f..79f58e06f38f 100644
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


