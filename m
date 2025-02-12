Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E1FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBRzxnozIixQNrxNdu7Q8Qs+ulivex2ntAplWA5efl8=; b=2NrisnlrQVLiwHH6WTlnWxP0Xx
	RqpQK8uXim+u8LZSPyNiBYyrfciLftSvS1Tr2jWe0CaR9iNcfIxDSoaoWhxBUzIa8hEeoo8BpOPSq
	mxfGumDPYeMwrfEpBNmsNLKlQKmIyPJC+f7YXijsE0YX27de1nlOJ0l8yTRklCTHkkQM10X/rk6ez
	hVN/ETUIlGM2nj1f9xH17u1xJxrIzdBCg96MEbT+MdSShjlp9oXOQp2DJneV8NCbYfFsgCp7ctpw1
	033rl9EIpfJKzKzl4TFvHLNMsZIPCWO/4UqGlQgJLs9jbswiGHGwDD9TmJMimb+/VW3wU8kEcyASM
	4kCyFY0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEN3-00000007nyw-3eAP;
	Wed, 12 Feb 2025 15:09:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEAa-00000007lfL-2q94
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 14:56:57 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1DBA19BF;
	Wed, 12 Feb 2025 15:55:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739372135;
	bh=fFbDQjMv08pbZ+GS9RJNCrHnwyHjHAt8x+pQ0R0Cwsw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EQbHYksGFVBrAPeQOt4ESxawcmddUdC44o7mKYJo+RIOhxvP5++M0OPiZRHDiJ0lD
	 7wWjjX/lcdx0yHATsaMlZlP+RksKqnrDgWcpzD2InIA3+uiGmU1/y7EEUBJcZp5AQu
	 sAwKNRb6O+t31BHbPkOBXi8n2RKvMOZDr4NRAZq0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 12 Feb 2025 16:56:12 +0200
Subject: [PATCH v3 08/11] drm: xlnx: zynqmp: Add support for XV15 & XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-xilinx-formats-v3-8-90d0fe106995@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=fFbDQjMv08pbZ+GS9RJNCrHnwyHjHAt8x+pQ0R0Cwsw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnrLarqUOAtxO9XOj3PUvphZINF3knc3icLJQG6
 81LK1Kf0H2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ6y2qwAKCRD6PaqMvJYe
 9VLjEACrytYdowKq5+iV/VBNe6O/sHK+aFX+jMOqwgw1KGLf5MMkAwQUBWfcrmM4Mi3JYlvtEK4
 +F4BnGjmJhU5/REefGoocQbKywgGZoxLr5cqneqv0+365KqRc0aStsW1j6q0iuaQ+tSQ6zQdhBI
 TSFtLSf617oM4y0cWbiP6+Xbabh9MJhPiKVdjnaZibNJdiqqtAYAzANMRKRQoctdJFOBKDMTKRu
 OCqrDFMeT+pi7VdJ9cNEO4gXT3ZTyTMHGtKnsSmvm28aTz5zt4/KT7hwbxF1GTprbu/+Jd8bOwQ
 wyU058IHkWF5AJhpnlxJ/PhIQcwXKX2llzLx6NHroHovVi8hjvwGO+oiopE4uRY8g8Zz4qCCHoS
 liDpR+sq4XFnZE0ih88E1kraUaoYlN2A4fdX3OLSWqVR5pIHn5oumj4IXRHVG0HaNy5qj2fJlAQ
 FQ1WV+L2wSGPsNxF4WRgIP8yl80JDJLSkrXQtETXcNslCBQ921AdUBzeD9NNv/CE6/tKFd64Hc5
 m5tJk6BMJ0AexLS7AoERsWoCi5BrV8McL15fahtvAfzk7bR681EuC4iaUNCVuyJbxFxIgbT7qQh
 LtzAhwfTdCuWxWy+kizRlOBymFADr/Ri/OJbYL8uj2CFAjtDSyTVE3djgCIq7p48JD5Zslu+FlU
 gkGzI8gSoa+h1lg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_065656_856994_7F99C016 
X-CRM114-Status: UNSURE (   9.19  )
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
index 3d4ade571f0f..32031f52e114 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -297,6 +297,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
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


