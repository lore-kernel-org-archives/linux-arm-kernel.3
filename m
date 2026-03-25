Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9C2106B53D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rID9QIkiyjd0isomj0RQ+S79XP1tO5xaEqyb07sQrFM=; b=wXJe0+J8foLYFRYdwHvqFj+aWj
	fHWRPmuo+1/u/LNXrVRrVkkWrkIwy2EDF6qN57kjJiD8T5XMwRYuTHJjdKSRyCnPz8F6RZi30a6Df
	+erpoEfFdtq6R66Z7sn394QQQSdTLTPYP/ahoCX5Shb/J8ZWB4SYnYZD9ECY8EN1gqw2dSQAOljaP
	fbUhYj6RLNcTJF40KReFEQx5pLr8mwz4c0R2BmZEcYMpPO4Eag9jGj0JsRL5HIs+LOG1TBCxna7YC
	/iYT2Fu/nS6KxcfwdhM5nfMmLncCY7X59L6oVAmaMjfLhw4DkuNfCJWdmcflzylYGLP2Z3O6vdFEZ
	+qXl8KDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oom-00000003Who-2uBx;
	Wed, 25 Mar 2026 14:02:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oo8-00000003W8w-3wQg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:02:06 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E250725C1;
	Wed, 25 Mar 2026 15:00:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774447245;
	bh=3TPXtRTUT5zln3e1fUF+9gS4sqYImuqTzfDJL11JXv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u3Dcvjy13c5MZhvrM0Eyqu/ofIXt835ZF6eGmGHOClvtaZGpAB0ot51VjkEcVjWo+
	 SWljd7RQQ0LWd7MGp/u9vv4+2IBR/b/d+ydHRN6XgiOka91EVFN1dsX/9J96lS8C30
	 QAcaXlNTuzU8ZB8xXzK0q1AMxzKrrLaVPk8qlB8o=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 25 Mar 2026 16:01:34 +0200
Subject: [PATCH v9 11/11] drm: xlnx: zynqmp: Add support for XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-xilinx-formats-v9-11-d03b7e3752e4@ideasonboard.com>
References: <20260325-xilinx-formats-v9-0-d03b7e3752e4@ideasonboard.com>
In-Reply-To: <20260325-xilinx-formats-v9-0-d03b7e3752e4@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=898;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=3TPXtRTUT5zln3e1fUF+9gS4sqYImuqTzfDJL11JXv8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpw+rNEAUCHWXhJykAC9FP0441OGT+ANA7iakp+
 Osf3rz6cU+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCacPqzQAKCRD6PaqMvJYe
 9b/XD/wI4W1jEKdwBVvHS8KqJqBRjbhsxkEyUKYP8n1iiDMDMYktDK5odryHh0Af+XIEc7C2LRK
 /ysjrHoz6L3tCznH4kOUfwO8JtXtQ0cqJOKQzAHK7Y8kxjLc+uSXes7oamS3YHvTswPFNPapSCA
 yWXHpYJ31tTHw/xqs1CBYZD/CIt8KckQQaWo32a81i3uHEngBwKuIHrcw5EOrag5t/RFqWldWZ4
 +/aOAI1Qb4qj5qYsLN1g3GviVFDxNrGMxFLCI/9rX8DEs53ZIYIHjWtitTPIU5YXJQUO/2ISHNT
 9bEWwQjMvbiHuQRYdAVBpMgqlYdbXAaKKeAx8qJGvJiBFYXibKnKwS3otzmw6nmxDcDsDFznaEU
 MgzXRMe19lWPurcPrxkmoxuf5UqZEFnxWEMVHoNsaJ0Qtz5RMNtNIT0K6j+euYwMOB/Iidk2aE0
 kOxt+DU5J2KJzuPMxv5R/UiUB9y9KEaW3Yy9JvhMSxIv+tRyRkLnr52XZL9paoJyW4xMXuNpZ/W
 za0xCBsHE4sbuavu6XX9mSV81zZB5AGjme+SfkBzJ7v2eFW8i7nb9FxxmBuvAkGbPUSnsuld+lP
 Uo6E+3KhQO8ZgyY2lyjHgWIbmBn6lCyF16Og3msU3dVXoGz9jDl/xU0Qg1tHnKd9sa7jPC0Gu50
 sU3EE8WIeVsJNyw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_070205_206221_6D49B876 
X-CRM114-Status: UNSURE (   9.78  )
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
index eed0215ba7c7..9408f77d45dc 100644
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


