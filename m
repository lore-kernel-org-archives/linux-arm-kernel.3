Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762E0C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1IWz3ETVJRu4jvTxLCDECc3u2dAVno7sYm2CwsHz3o=; b=eioWLZ9SXd8l++E3w+YMh5awNj
	QwBjK6Gles0GBIyW0PTpEsdGYxog2bo4NSgKJWK6d+1VOhPtP+NPcsPb6JOpyoqRwdkjlKHxLRdWp
	yIvwcI9lh9eVqHZVRKJqH7+iM+6k0S3rYKQXFM6WcDIGUkSGOZk6FVkxEHLQ0pUCkccf4VQleMaz0
	rcWmBd+eq3kC7ZGGRc/kt2WmZkaAdUqvoKQZfLZUYN33Y/W6y7mrN/aKJoPWeB2unQ7sxol+BhgmO
	lhVc0pf8HASAXbnEohr69iPChRK6vuflyAZSt0tOVx/8wszjPYWQDP6q6bDpR61x7lv/4cbKzEzCq
	Ake7DW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzTS-0000000BFZm-1zNZ;
	Wed, 15 Jan 2025 09:14:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzJj-0000000BDQv-40UF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 09:04:05 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC7C93B33;
	Wed, 15 Jan 2025 10:03:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736931785;
	bh=3lV+l32vg2JpWZEq7vy7NUNpO/y6nBsRUh7Y4B6/+ho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FZ8Jyj55RQ93WqJAAiPdlxbMXxgUwhO2i4D3Z61ZBkeFDsZEGicPJn6/5tzFDTc+9
	 1TUQFBqk2rRDRNJcnTCLlcUmIX9YOsU77lutn8H/VHKp1tynIMqs/evASQ/0cBLuUv
	 zn9kin6qMoJOYmPcl2VGPvvOR8xe21bPbQ9R65fo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 15 Jan 2025 11:03:36 +0200
Subject: [PATCH v2 07/10] drm: xlnx: zynqmp: Add support for XV15 & XV20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-xilinx-formats-v2-7-160327ca652a@ideasonboard.com>
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
In-Reply-To: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnh3n66hQ9SWwHWE438qJQhC2mJUfR5g9T5WMjx
 tJLMQkt8eiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4d5+gAKCRD6PaqMvJYe
 9U6JD/43ai4K/IWdQarREzPRDtpuhU3w7wcJMXYYN5J2kpQ+mrcMOq6C2dWMm+VBznkGtjMZSwA
 c/Iir9PPohmZO5n68MYt/axhq5Vtv7EbsMYxiCObXbFALD4jCihovEqtnlyKAB+Gemngjdr6+cM
 n8Juj8iP9Rxv07y2bsmSIYTXpk7yKqKioV6JZPAGQzUM+q2SOVKCQPezdaDVYfD+ck14/JrNS28
 UofnGflMphGbr4tvc52C1nFWoe3h8C0daKdOkiCXAnDblQeakUragcV5guKzTkj9LyGYjYimubZ
 HnO0aLtEtpYw+mvnO4MaDRuPke5SHs1FYuGEwQg16Ih8yprvF55DELqaxUPpgH+y7AsaPaik9/T
 LD5fYEXzFUvQrbf376nrDFPbLhV2YiUHJaGkoiS/YG8yusfMghc3AAN1lXyJZiDhdtJcDjNrl1w
 gdWl4pEKVS6D708+W65GG8lGrETSty4vZDJkbUnuNjWacF2pOSwuxoBDfxocU2azbrT15pFgIo5
 9WHSH2qv8ASY47IcMQvI3UvXuMu/0tZMSyW6CyqJP3gXsUyPjkhmeNf9xfAZpoCY3T4gen4VmjM
 7MJ+/dKhGlmPTM3hT/BVLp2k28AM06PlU1QWzHk8tZ7Uh7zF06cGo+Kyn9y3GN67M75Og9HQs62
 ME+8LWfSDcA3raQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_010404_145536_62481CF4 
X-CRM114-Status: UNSURE (   9.51  )
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


