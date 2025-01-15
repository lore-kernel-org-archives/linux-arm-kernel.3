Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58CDC02185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cu94CIEGB7IrJA44pVbIQn3sn1KmIVV2LpHwQuetYEI=; b=YThv2+ksNWRGYT1YpT8Q8ECod9
	5myPd/sGluGJIlnzGSr+3ehfQajmcSAH9HLrTEzfSNYyTu7eQYURC+8md6UD2mFlBqPNUmHJIonqT
	n88DB7D8HjFpb+xaNY8MCWU5TWxwsbF/j/49soQKqFZTNq2kqGqvQD9mRVbn9R8lEMfnn4yRqGuvU
	ho0Tkk5HhMwnP3hTrzCYt/y5jccPyqLzGW4Gh3T1E95a4WYtmoffSauKnAsmBJu9oxpJB4PPQr5Vh
	bxC+mypy6XbGn2VVzo3fl3geL+jyZHga7rZdRpytMq1mGyCrduOEH3YMwDlhJp1J5hkG9C8uN+39Z
	eQVCu7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzX8-0000000BGVF-21OC;
	Wed, 15 Jan 2025 09:17:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzJm-0000000BDT4-1xr6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 09:04:07 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DC79437E;
	Wed, 15 Jan 2025 10:03:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736931787;
	bh=Z6AQhbg5I9MENjbzvyltnjwwjBTG37ZyGBUaHh8zGq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sKbBplOexyMCfNjzCiYb+FzSMrHcL7QZoRJ+rXB/jBmhW3rFuRSQTbkLbTSmAui8+
	 M3FSZ80+8N0QOC24eXLSJSkREw4QQrp/lkZ4CrMG1YlJ5pEJbT9Clgp6GfEFkPhjkV
	 rhT0VN+PkEtOdKUremC9gOS/3uUP8Q7lfI9JcEA8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 15 Jan 2025 11:03:39 +0200
Subject: [PATCH v2 10/10] drm: xlnx: zynqmp: Fix max dma segment size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-xilinx-formats-v2-10-160327ca652a@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sean Anderson <sean.anderson@linux.dev>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=961;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Z6AQhbg5I9MENjbzvyltnjwwjBTG37ZyGBUaHh8zGq8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnh3n7xRoZJZWl72D8riAEsE7UvOq6P0tm4NoZW
 YPOZPEcQYWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4d5+wAKCRD6PaqMvJYe
 9QMFD/0br3w+rz945BiM/x6AeNOdcehdJyHBX5jHvxMrp8D0wyr5ccOjh+TAOghU+fPRTgUXIV9
 iomCqsNWkjh8bfYoT+c0GR+iDgGzDrmmLap72Eu6oiotFsiNa25PdliptiX/uA2IWAA+UQbXlSN
 2w4wV3P/O+uENr342ql6NQeAgZ6MAChXvJxro9u3648AUn1vzrR357eb16ACPp5YoYfmhQ6xpxL
 VMnLoaVJPBVgTwrVU+DdGGDgJ9ICH1/2A8Ln8YpDUnHtyFuF332Dtm6e3vvDOv6j12VXmxub63T
 M3VeeZARF8c7Dc8wCmyqphDQQTFiZ5QlNsf88NkEZ+Bk0su7aPH6vJqleepxCl2wbc/DmBEF+so
 sXVBciQJCg3gyWwls3BIHhNso3Ib7qB4Ev39sgnq1gljs6EYyh/W6RSZcsaMg4k9QIarxWoOYMR
 dvD6G+WGzNVT37ifdPJsHLtL3nR+9sIb4SwOGPPQMn03ruNJfe6kNCHMWjA6bj6uW8VyVO+P9FB
 NBsE/V1ZgcpNLtvzXyppUXvp8ZO3FaGQmmJmChZ9Ztw0m12ZRQ7IcDcVJ1bjrWggO3lGqfLPUH9
 jqc9yMaRC694b82jpMczyoHJZp+h1BaHIILZAIZGfsVIX+2GgWom8AEC5qbQggcTHIt3EgVML5y
 rdSc7Ig0PHFysKQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_010406_673899_B8599B84 
X-CRM114-Status: GOOD (  10.39  )
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

Fix "mapping sg segment longer than device claims to support" warning by
setting the max segment size.

Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
Reviewed-by: Sean Anderson <sean.anderson@linux.dev>
Tested-by: Sean Anderson <sean.anderson@linux.dev>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index f5781939de9c..a25b22238e3d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -231,6 +231,8 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+
 	/* Try the reserved memory. Proceed if there's none. */
 	of_reserved_mem_device_init(&pdev->dev);
 

-- 
2.43.0


