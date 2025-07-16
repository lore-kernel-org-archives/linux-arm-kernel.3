Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534ABC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 13:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agtepONYuqRhRYYvNl3r7CMreXEHPwv+huMytu4+Dx4=; b=cxmk5dBWwEfyAAGu2m2yACR847
	U4+dPTmqaT6NhfDhg3hJR0bPkXUNJ7tBgwDg9kWtKJPLAGcVbUCH84wMWe+ODFITu6RSVwuNZXCb+
	aX5qmePEoOoY+f6kFoU9cRWQJJqYfAfLnaApsIvCi4QsMtrjaKWOB5YXXUFWmBwrzaNxHGPhPb+t0
	4vWpTzKVl6CXDHNx711of7rBhAf/rUVbLeKjn+NpXa83ikA3LcfjByCmSTbfIQJwcwmnIDgDuA/uA
	9VtoX8e3uvlsoBS/6IcAEda7PxXMc8KhVvt14JIW1BkpABW8AWJa4+Lquc0wqoMfGV3FWNPk/2h+F
	gumrhSYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2bH-00000007qNC-00n6;
	Wed, 16 Jul 2025 13:55:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2U0-00000007pe3-1NlD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 13:47:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D65F15C54B9;
	Wed, 16 Jul 2025 13:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2563FC4CEF4;
	Wed, 16 Jul 2025 13:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752673659;
	bh=N/5vs2O/O/RBR2chqPpw/Dxeb040MtYLeUEhMQ9qX5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KAo5FcRN3PXz9NMNZbBrnh5FsWvEZAldcGzxToXaPCn9L6QZ1G2PxLG1TtSbFXbD+
	 UCO91ePfKzLoJS6NAPQelNjTppFvVUpX14k19rb7VUlHKFufBDBg59xFG/kbL01O/c
	 bvf3EIbrQfFOjM911H5/xI6MK6hSDm+BiJmFlto/wAPgGAnXI6//3Cb4HHILwc5EcC
	 qvcilSKvD5kefx3BaY6EI3g72PRLRi/QKW6iQHt4geq4m+noGkFtc8yZp+jwyZIQC6
	 bqafS29hdEf1WK0HVBn1wfigpzm8PvmAx2tDNsuW9hEOBhvNrv2MRgGmnT3A+VDMeT
	 J9wzrSTL6uL3w==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [RFC PATCH 2/3] drm/imagination: fix clock control on the J722S
Date: Wed, 16 Jul 2025 15:47:16 +0200
Message-Id: <20250716134717.4085567-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716134717.4085567-1-mwalle@kernel.org>
References: <20250716134717.4085567-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_064740_412039_9CC0C54C 
X-CRM114-Status: GOOD (  14.12  )
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

The J722S won't let you set the clock frequency if there is no device
using it. Thus, the assigned-clocks property won't work per se.

As a workaround, set the clock again during the probing of the driver.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/imagination/pvr_device.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 8b9ba4983c4c..e7a7cc1bdf93 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -16,6 +16,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/clk/clk-conf.h>
 #include <linux/compiler_attributes.h>
 #include <linux/compiler_types.h>
 #include <linux/dma-mapping.h>
@@ -641,6 +642,14 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	if (err)
 		return err;
 
+	/* Set any 'assigned-clocks' properties again. This is a workaround for
+	 * the clock handling on k3 platforms. There, one cannot set the clock
+	 * frequency until there is at least one (enabled) user if it.
+	 */
+	err = of_clk_set_defaults(drm_dev->dev->of_node, true);
+	if (err)
+		return err;
+
 	/* Map the control registers into memory. */
 	err = pvr_device_reg_init(pvr_dev);
 	if (err)
-- 
2.39.5


