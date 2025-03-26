Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC05C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u25WqhtmEagySajkNE+28hxjAKU5YIyCDYhx4R1yQkI=; b=Gie8qdTMjl1PPDNA+4t2OQtsga
	fzI0hMYdwkxCq4EC4Rsq7DirbGOjQFazbwpdlHoUIyD3hUAnL+Yb6zGjIRtw+ZAy1tkzIBGQRugIW
	4smSn4poW0aLBQBde/o8802JqH3MfVQ+nuRYBsi79ZVYX9i64wglYDdshfZQPk8t/lw8x9C9P+fEl
	qkLP1DrkVqxeLNcYv/IbIFA/UoHXOt86QaUZ2hO92BBR3oLBlDWXVkG2XBCYENZ5f0x8MzZUJ4W0d
	qcxLrOj/2sH3Wzk631XCEgEJGV+kq3UaZa4fLonTeyfceS5/yIq105hhCwuIXZ34xY1vb/IpvjF6w
	ANQl3UlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txR1u-00000008aoU-2alo;
	Wed, 26 Mar 2025 13:42:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQj9-00000008YCX-0kbi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:23:28 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7D1FA57;
	Wed, 26 Mar 2025 14:21:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742995298;
	bh=oFm4U0hkZjYLWnEJeFMKYjlk7egwcLGFKCoUSOTzMSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=loFlaOpSHXOIfkLHMiTp3pdPZtMRlGyEB9+OTGbJq36Yo6Q27gTsb4K7q6zZ3M3yQ
	 eiHVOojyCF47fxt/HJwoS+qzJFieWgnH84D6sqlS4M0+5ecoGIKH4wuacBfOM8vdGQ
	 H4L21cO3qSiCWNYcMvhUEnV+s4/LauCyqRhQjzvk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:53 +0200
Subject: [PATCH v4 10/11] drm: xlnx: zynqmp: Add support for X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-10-322a300c6d72@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=766;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=oFm4U0hkZjYLWnEJeFMKYjlk7egwcLGFKCoUSOTzMSo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//Dis0L4uQRt67L4P2Qc6MhWqd7lhV/jzhvR
 sHl9RUreaGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wwAKCRD6PaqMvJYe
 9WPOD/42/uhBYTjLB+c6OwGMl9PEeXPllE5b/M6xr6cut6fEWSE3OOMpJxPdZU0gVaXy1JND/Tg
 AfWAAXNMX9oed7VtBx5tmWlzRZBZAJ0fpo0Dkr7vNYq3DqcBtvoXSEzpChs0H9Ak8uezBSQXJzP
 yMo58+ab4qdyak5zjbxFKuy9f/ltofwWSTpAQfi4F0coGleM3oyIEIibcjV94G63J3TajGOqsuY
 hBA0sopkfh70UIgxE5Zi9JkLz1wz9ply8pziDfVc0VDdHH8/VNaQEW5S3Zr0zzQ8UJF0Kas0n1H
 3Q3pCZIAqSOUNX1E4phi8G+A0QiRkHx8ZNldxtq3JOI85Vloyf9WdXvG+uZRI0xDMzqdAS6lqgn
 2OS6D/zay9zmNTc5/nG8tMwrolUQIFxicGDM08j/15Mr9ig0s3Adzm3vF5xHfmOoaQiFw8yHKHT
 moxsWwZUuVxXD/3yAMmAurU79czTpt9jc8PpJN0dE9ZVUnpWk60MB9tluBACrDoGa1e7IARVIP9
 gvZSBuwTMA6P3nMayh5H+zYE0M/vfH5GCcisvc36lwIoKDFd7gMj/e19goNXoI2YfK58r4oCZkR
 NioIgz5ZvSQKqKoz7lyZQVT96XFeN+2OhO0l/8D+w2GlRDo4RtTjirCiyLZQ2DNslN+xaXM0gEu
 ZiYS1ObRywAVzwg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_062327_359928_9B61B76B 
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

Add support for X403 format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index ae8b4073edf6..ce685dfbf31f 100644
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


