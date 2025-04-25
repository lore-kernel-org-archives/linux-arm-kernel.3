Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA2CC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiAUScSd9tiPRa6OJ5fd124/EbnKGaHOc78hGlE+hhs=; b=3yynuO9qnfDkbctP9CUR7vbMVA
	6xIafdvxiS7l8igtZ5G9gUwre/sBb+lF8gkK3uzXs5q49+Y7rvHmaJz7n8bwj4soKjEWZ++MzIReL
	RN77WqwjrzqEPiXLJhyueV9kzPoicBmCg0oBrIjZz7HN/bBgVjfqIGRRauviDWq68XoaT6repcmCT
	dRPOu1vJZ7HWXCMze1VnbtgT9iHjN7E3ZtSI4kqZze3H1vUn5cCToMA2fPYLm2H2+aYwggOXKEPgt
	2KP4p1hAt4LjgfE5/Ckk5G9XZF2Jq93vQnWKWN6OnOr/uwSy3NV+MyJJKbrth7Rtv9se9jogQaT7+
	qILQ58Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IQX-0000000H9uv-2ioa;
	Fri, 25 Apr 2025 12:45:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Goj-0000000Gr9G-1ac3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 11:02:02 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AC0ED77;
	Fri, 25 Apr 2025 13:01:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745578917;
	bh=vgUvtrRNpZAPQ2ZmQyEkc69x6eOUJGW8mLQ5lXY/P7Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cwlt4lvlA+XMhHWdWlmQ0xkqfca76oV5KWxcoqKsbOHGKRbAE3Z1G8vkCrDs0vDkQ
	 INZG0PqdlON0OmVWaJfoBWkP2qbJnoxiccmnAnJx5aaltwUZjX80P4HG3YfDJm7fT6
	 Q7u16YgqOFDB+Uk2Vq/KDPdV9RPPiu9wkaZo6SPQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:30 +0300
Subject: [PATCH v5 10/11] drm: xlnx: zynqmp: Add support for X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-10-c74263231630@ideasonboard.com>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
In-Reply-To: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=vgUvtrRNpZAPQ2ZmQyEkc69x6eOUJGW8mLQ5lXY/P7Y=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2udE+M2IUzyHg+n0uVRE0pt0BMbSKufyO3ya
 mPxX0j9pI2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrnQAKCRD6PaqMvJYe
 9eP+D/4rxFktMuTr1S4TAmqadr6fgshnWoCW8feEkf/9Gz5K5SLslxT/189YdWyNqEheqWh+cUh
 hv8YvRNA2Xr1FgAh1aB2InKvbfLXgS7hZErx1ffJb28ZARteJb08jIGorQMfJ4dJM6kuYMpI1hl
 e2+txzudidZVgGxb5pzji1X5OkgW7O8ILD3gszMbmxqokATjcpBGAczvlSbiBShd4NBXQHe2xLX
 kfszcqMRYfdJe3eLoNL+S3oxV7C3OUCb4WavK1zhvXlJ8z4PzUaVv5AN20oncSy/8H/Yf/z3190
 1gcvyhmKxGdWIxilxuvLSi+3WzzAOENRlwoZovvu63h2VJljV4ykjqBQicoS5NofDzaUlw1KvsZ
 MuaHRi2770rdZBroF8yqAYgG1EK6urkBsNaLXtqi4luHeZ0uy5Pkp6eJzyYf2hSzKlbOU9sj1sW
 Nh/1/ibZRTbq6YbZ04EJLXeUqWbvFmmIC6ojkDd8JuqAukfEc3YOf1CA56ez6tnAdkAgbaGb/w+
 MBBF6eMe1WgCqO1x2swaXthx3NtHskfDCtn/pc/5GkWzagEmq+NTczTr368IYPgXUOdm/gz3wiT
 PacjpsByNTGQZ3tcn0e+PvFMBvWPNdNl6/iYwE8dAVUL5hAbcQ/zsTfZkO6x6N41nAARz1+QiTD
 tBd2YwzV/96vPlw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_040201_565428_3B5674EC 
X-CRM114-Status: UNSURE (   8.08  )
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
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index fe111fa8cc13..b7cc7a7581ad 100644
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


