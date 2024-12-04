Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9638DE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iby7aHHCn3scQ8TuJ3LcajNFYLWULv0S+s03g11tAg=; b=VV2gsDH+zl6FF4UI+5ThlGOqTl
	eHZR1vDYv+Bv37kiR3IGTyW2TLz/215ZDRzUJ7ATXSfyA1IOEjNnzKgIMssgJOlvXkWaxFEUhiuZg
	07fMKNh7npTZ5gfEyPKCfXGllzMG7dDrcfh2Dzs+YFgSit3BPFMmrQ2cyxaNcFGnKXYbXsbWWvHd8
	EA1Hw//zjA87ItzeMbWhUwqEUHDCp2J3GG3WcR6l0XZf/2ylnd/y/TGzZ4zWX6cfhKkJxt7PUr8IM
	O9ChbCTX+Q4RpFzqDDDT4BcnFLcrCnfmWjSooOEDiXTBwyCOajIuQ9BfaZt9lvc7I+HjxykCEiUsA
	vNMPmF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlwg-0000000C64T-3e0r;
	Wed, 04 Dec 2024 09:45:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlpO-0000000C4Wd-3nst
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:37:52 +0000
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8C311D29;
	Wed,  4 Dec 2024 10:31:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733304673;
	bh=2kTYJooFMq+5La3iJTTLvA+HVNIvS8ojV7vTfwy1oII=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GNF4xzmL3MleQEFQGtbFiYw1E8RrIuwS3XhQ3Q9gzd1Y2lJS6CNJV2i5TeYutv8R1
	 kch/wEjHrwmk/z0/+FXj/6QWOqvq6FoFjE3rv5zkXnxdUGCHp4uXYUdY+1Ipo/eY4m
	 FsqJhx4S7ddmZ1Rg8vCnnRAAjLQzgQlecYZijKlY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 11:31:09 +0200
Subject: [PATCH 09/10] drm: xlnx: zynqmp: Add support for X403
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-xilinx-formats-v1-9-0bf2c5147db1@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=766;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=2kTYJooFMq+5La3iJTTLvA+HVNIvS8ojV7vTfwy1oII=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCFzs5fjsix/w/yAKDDiwajcNiOFWZyKW3aKm
 VY6shZfH3WJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhcwAKCRD6PaqMvJYe
 9cKND/wMV/dSG+TgZCNtmwg4MqMJVd8JugsFWyt+4GwifiFA57W2Utez9VYn3Hf4CrQJ9RnMnL6
 IZzkMV48OZ4g2u7xYpQ7myK/fd2l9SMOc916mhweowFlsQMKaruqmYdU57Hm68e4fXSMYTcq8S9
 L8lo7MzYjNZ+sag+vN0gPC+7KJ1f7WYosn79zy6vRgixgJkrAsAqbDCg6kGABq832rcwy9jknSs
 xLTs8GHzn08WIIFkPlAR0XyBWL59qoq8lMrugpHPYZB4KZjCsgivOVfFWCZW+AVo1tDloLWvCjq
 tVhU9moaDnvF01XNjU0CIj3tVm6F57Olk0iQhWPzITqoxvLtfmiYK+SM7iS7KypIGpeJcCqjOhc
 M/iqtLdeenC4fEnVCQ8vo5e1SJA/X8HrA9g35iLT+tedpcG5nAW0ZiGC4eSCjuEkfWpfGcn9Dq+
 po2HPfU/eUx12RHQjc/5tmD0eNOApTnWzmnYLy9ErI3aym2aNupGuM7KAQzqc4J1MRUxvfSkM1g
 tMSyubS1BDzZHprfKzH6dmlm46u4KsEjnTZQ1mHvXrLZ67XlaTYYKlOHpQA16xQpCy1Ys/hgNxB
 tS3oydwDbYYuWgVwkKIXnusmHmblbozCa/r5AHLjC8iv0n7vRuxVWOe0rOGqIHRKKJE5eqwcQKq
 bEv3UWQM+MkCkQQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_013751_078494_A8A87636 
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

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 44cfee6a0e32..622d1dfac42d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -319,6 +319,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
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


