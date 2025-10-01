Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D470CCD180
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 13:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tcz3Uz/Rol3nIQJ9a/rFAG950ZYmTJ/T65ex0/7R/iM=; b=p2MfCj9K+DkJFE2cuCT/cR36XO
	ZsN2Pb6sT+TqXJsC1mYvPovqdNxUcrcXqaHzgJyGkTj0Ajlqh4eUwvp2hB75PSGbyl3/A6wd0Q5Lr
	mVlLAPoXj9w5O20HUQmN5IQri3k/r0UoAPwKXEacm2Ap6nr9k9iBjxT8JRHH/h5NzAWmOB0Jwemd3
	ZGD8arAgxSo1iXccA2xlxEun5Q43t7lPm1dQepY9bIT7udVvO+3c9nt30g1t/4UPjSxcq2Yen27nR
	9ssaTYVDr9OzVFCe8LP6eo3EVk066wDSs4yJTjcBffzHTOokdv42kLFmHs5H4MmXfcTLzM0csWBqW
	i+zeMPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wnO-0000000808X-1a2v;
	Wed, 01 Oct 2025 13:23:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wnJ-00000007zwA-2qbR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 13:22:59 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B83D19AD;
	Wed,  1 Oct 2025 15:21:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759324887;
	bh=Z4gNQ9UWmg8H9YFAi8N+jXqbfBppeZnMk/tmq5k2slI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iXw0QNt5bU8P8raD8mTzXneQXaVochjSwjAIh8vIUYNORHRz6hTYyNDMcZOtYz6Gk
	 Pnk9lmsmyK9HleUt+UuhlEbejANCBP7QBqrEoRmAvluAtHVXcxtCi0Bgmy//7ZqELr
	 yCPjgnSVBR0CJuTYPg6UZslspfwgN/URCc2UfXyQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Oct 2025 16:22:22 +0300
Subject: [PATCH v6 10/11] drm: xlnx: zynqmp: Add support for X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-xilinx-formats-v6-10-014b076b542a@ideasonboard.com>
References: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
In-Reply-To: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
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
 bh=Z4gNQ9UWmg8H9YFAi8N+jXqbfBppeZnMk/tmq5k2slI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBo3SskYkFp71Muh/vUeiWioR8OLa3U9Z/Il8HAI
 lOM9I75I8OJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaN0rJAAKCRD6PaqMvJYe
 9ak5D/4keFN+7hSFuZnonz+gZBC9uEwApG91/goDKyuXfmHO2g1O3ubofSDBSPvup6LdJUQobdz
 Ye5ROKzfhx+AyeFVcwcjAVZPP96nQxFn6jOd5J8X0qCT0gI6QeJZaOD+7YOgIL92bsJbZ8hbIPp
 EJnC4ukbUkzgrWejxmeV06/o1XISDsvPsgrU10PcjMzcfSEsCPcFfyHeJDT4AJujxdNOMaToeqb
 mx9aTzI5qyrQhgT9RPaNPxZ9XC4Yktt406dnv2KMkKNZxz6As7fgNreAPjq7KckthBMc6tKG9Sd
 4qyZkIjjy++saCjxL0QYAHnW78K2/BjeNW3Y9LYhgVDpW36xFWP0acqBje1F4AFrwa5pu+QjS7i
 4E08hnN+vFQ/YK6Cj5CswnGg7y3L2tgivO3FJymWBTShsjTg8OjtCJrkeo6rLMAyMtYLoiI3BMt
 gBTpqAWrGksduaEU3XuyWQBXQOE1gh2EOVd09ziE1/OSuDOThqD/pzmB3RJ28zmN6lcb1ihzJrG
 cm2GCA6fJOcjmSJZE2cSxFQ7d14F28Vb7QHisMwBt0Zt7bpkhvTGwKhKqxx9a9IeWDRENNmvxCy
 9OuB2/vrdjb8SlTyU1vsfKa1UHZTE+cmKtfmdqv68W1YW2XvgoMxGxqD2dJs+KoCFpIUmaafPRw
 6Iucigxyk+8Ge7w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_062257_890751_C394F964 
X-CRM114-Status: UNSURE (   8.40  )
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


