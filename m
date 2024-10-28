Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6D0D3399B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L/CK72WBoLRu+mlWuAyWKBAXJvh229c4kXsgrNQRnWM=; b=OMpFYfCWQJfIBcKscmtaTMw3mJ
	V5OsB5G2bje+FNrMvcYMDRiVTrrQ61Jtg7PDD3ZSvZldLlR48GiVR+oDrYR4RdL8adtjshJMFivVK
	7Sfdmyd9BldWy2SVPr1omiuVVDOZsqDlEwzG+EZ8rX55pKWHwXFQqYpxW6nRhVhC3GBzcqXduLhCy
	BPYvbnHZeDj7S+/CktI+Y6paTEiPxysq9PrcXaFieNiLAP+8FtppgOfFpPL7UJCMHSJTZtR2LkF1s
	lqjejAlhjCFWwqZ2yw/OQ4us3AxpM1LyfyAVebJBpwI9BmLOs6FDddtYcYFSXIUz7/RaeL3Dy20Tj
	xDIGjXZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5StT-0000000BYzJ-2kv8;
	Mon, 28 Oct 2024 16:47:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SiN-0000000BVOX-1bbe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 16:35:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 45E5AA429D8;
	Mon, 28 Oct 2024 16:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4354AC4CEC3;
	Mon, 28 Oct 2024 16:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730133333;
	bh=B+pJhWPiLhnporLquPyi2au3DHThLhnQTOKU50phhKA=;
	h=From:To:Cc:Subject:Date:From;
	b=h5H9CyHY+7U9M417dT5UQgoE0GhbLmXiFBB0fYmDKClDxIWeb1sYo0spRU3mLXYPF
	 QqrkVeBxEV7DE0/CiFRJBHzeObzzzIJ3KpGZJaw3QKOa1WJkDVa8Q7VzaWbBDNrFcw
	 RQorsCq5K6NhdWFIbwdgGgmmZ6GSqyaUfACbMjfH9vglAkKUrHeRw1uTsoNirn7LF1
	 sJk9KoWtA2H2n5/60Z/zVxNtuwh+KJE0Z78kRxZyXHc8MkFk7aTBp6VYBUB86kYJAL
	 QCLJlx+8qySvwYe2PjVB4NBv32H3y4wCNADIEzrbORnqWGciwBZ5OxO1THfQpb85go
	 784NbkD7g4y9A==
From: Arnd Bergmann <arnd@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Lucas Stach <l.stach@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imx/dcss: include drm/drm_bridge.h header
Date: Mon, 28 Oct 2024 16:35:07 +0000
Message-Id: <20241028163527.2425783-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_093535_506195_68CA6AEE 
X-CRM114-Status: UNSURE (   8.73  )
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

From: Arnd Bergmann <arnd@arndb.de>

Compile-testing random configurations leads to failures in
dcss-kms.c from a missing declaration:

drivers/gpu/drm/imx/dcss/dcss-kms.c:95:8: error: use of undeclared identifier 'drm_bridge_attach'
   95 |         ret = drm_bridge_attach(encoder, bridge, NULL,
      |               ^
drivers/gpu/drm/imx/dcss/dcss-kms.c:96:5: error: use of undeclared identifier 'DRM_BRIDGE_ATTACH_NO_CONNECTOR'
   96 |                                 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
      |                                 ^

Include the header directly.

Fixes: 004555a18d57 ("drm/imx/dcss: Allow build with COMPILE_TEST=y")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 3ec721afc30c..63a335c62296 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
-- 
2.39.5


