Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847B1C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAoX4qMdIPtkphSB9GKeYmmiErzai0Mn6ZZBBQdvlcA=; b=zzY1ACL/NQafDaJkjB7Pc4jTFB
	xN6ltfbiZomCAeTSD7e2sGiZ9As7eCvI0tO32ZbpezbvAQH3H5TgxFwPcBjKA0j1P1ho3hft0Ojht
	I3GMfolE4Brm/Ncg68NuKAYSUR0CwXsZcNKQ1YGQERPgHy4Qk9ROO5H6dyk9qGZXtiLW1nSCCdwSa
	X4YxFceich8U/Gp4QotAqnQyrXoL6xoGiqs6ox46TU4nm/1pO4UW1W4aThJe/6J1Arix4x51hoRx4
	kR1uLU3jnqbr6aIkn3gnNJMVsiZO7H3ZBM6ox8bqx35SHWVjfsWG5/pKaCJk8DTbM9/h1PmVR2MrS
	NE+KRB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEPq-00000007oPX-0ngC;
	Wed, 12 Feb 2025 15:12:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEAb-00000007lg0-1sDO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 14:56:58 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D6231AC0;
	Wed, 12 Feb 2025 15:55:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739372137;
	bh=r57NaWWFPPhC7i0kzoRFR+eXfop5yw1bzEAG9VvJnXE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BiRJYl9J9v0stVfF9C+LuFyQgNUoZXoouVYNH5HOW6HQpJTV4LEa4s4l89GL1KVjq
	 3E2ZVRSx2tY8OtFkCvmBKlufynggHdYWLchqFRIHQ3VXoNSsrSGA5Y9bIKJhP79XAb
	 g9sn+JgvOlqOlWg251+nGevs4qCWV9VBMqbI8d9M=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 12 Feb 2025 16:56:14 +0200
Subject: [PATCH v3 10/11] drm: xlnx: zynqmp: Add support for X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-xilinx-formats-v3-10-90d0fe106995@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=766;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=r57NaWWFPPhC7i0kzoRFR+eXfop5yw1bzEAG9VvJnXE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnrLarT4sfICZwSzQygIQW+qN3PxZZDHAA/ei0j
 k3MLQ7YGguJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ6y2qwAKCRD6PaqMvJYe
 9UbED/wKxuR1EVTmOmYxzy+5rw8WwlvAgm4Kbik5Q4/WErN0ROBdVOiGWokOh5dJY4pkLKBs7hv
 bjp1REkrTLmYSPJdfp8UIQF1Egdl1lxwkRccqxz/N401eiswBLFgdta5BFUwSxJdFOvAUFGqm6R
 QgaJBtubbCedV4hf4SqSodmthxw/LQ32M3LppfA86ujprm3s/1LEprHFotpUpNO3vbt502Q+iVm
 cHnmDWQADVTiEV4RXJanxgv26LQWiqS8H31zGrK1d382AIsYEHS9Ll3MFeR4iqDqzD4CDn3HpJZ
 9dMq6wOL+xGS2H2a0tKO+RD7ooD+xI4Y7jKWU7GutKWZYR2u1bynu2DfuC/CsL0aZOdU77cHIcG
 lK1aYWEdnW9dnc7uZ4XSJPnhU5cRq1yDY8ywsnmXkM91AF9qxEsd/kbWr3zFomvl5COGifL/9t6
 2bb8gOQyzyqXelsRnjetQSynirCF24nndjPBLIsqRle43k+61DlhQBnNCuBk1cdbQdItWrkNsWO
 eO0zjqUiCV2loS/jh2MU3SRRMMTE2SkdHbbwX9XtrsqpGToZDa2cD/Yb5L/ymuItf5LP/GMA+7T
 cITJm8TzxCrAip1yOGb5MOeV+YPEwjKENxNIVgmEmKZxXAmQjtnavm7BOHqgkya5B6nWhG1iYX7
 pnv2mCKj+uzAIDQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_065657_639827_68C441D3 
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

Add support for X403 format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index c820df97aa28..7495e42677a6 100644
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


