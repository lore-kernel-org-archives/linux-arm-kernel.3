Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55666606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MDsfbWFx;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RuNNqWEj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sPAT5BdNlhSR3TVHkk2zOI9YV8pl9pF9QIk48sjM/RA=; b=MDsfbWFxQFqVzbXv4QA5Vl6yYI
	Ougp9Sa1cl/EQjR19bq3VZzUHCwSM/gue+HXRf3tbrtZzqM1e/ms6YbBWlfyyPvWKn360eZMzL+Y9
	KIGgZZa9hd4b/N+L4yMJDaKJ9tW60oF+wPEBUY5y86FOEyHlvzkL/jBd0jrWRvPqRmBVK7cwD3VQu
	SVByxXYxqg2HYQ4C9yJZsQihuJnJcZWir328BOHo9E0y+/pXoNeIdivLZGAFvlCharkqj0f62BMkZ
	JyGSm2pXXJnBFzIpkLMGqEvyOU7mCI2xU9qhRtfwJBYl4CpHKalTniUxd2fl3GU7ERT5ftXRKwG/X
	VzXifZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMi3k-0000000B8ED-1Q2u;
	Fri, 30 Oct 2026 08:34:00 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMi3g-0000000B8D7-23W2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=RuNNqWEj6+XnzP+7lSLupdpDCajAdmybPNVly+fneDvgeY39ZyRTJxvtr1xuS42HaI9KimeGc43E6
	 wQXFWpD1gyYQvA2eYXz9/4+MT0QrCCWfzMZo89XwyGf1NIJhNKFw1c1sDSG6P/VWJyeBT/1a+5DFtY
	 KuIAgdRzL3NyIOXA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86ae456693f1-12cee;
	Fri, 30 Oct 2026 16:33:46 +0800 (CST)
X-RM-TRANSID: 2ee86ae456693f1-12cee
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96ae45668c95-55de9;
	Fri, 30 Oct 2026 16:33:46 +0800 (CST)
X-RM-TRANSID: 2ee96ae45668c95-55de9
From: laixiangwu <laixiangwu@cmss.chinamobile.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	laixiangwu <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] drm/imx/dcss: Fix clock leak on blkctl init failure
Date: Fri, 30 Oct 2026 16:33:42 +0800
Message-ID: <20261030083342.1531-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_013357_046746_03640A9D 
X-CRM114-Status: GOOD (  12.11  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

dcss_submodules_init() enables the DCSS clocks before initializing the
submodules, but if the first submodule (blkctl) fails to initialize the
function returns directly, without disabling the clocks again. All the
later error paths already jump to ctxld_err, which calls
dcss_clocks_disable().

Since the clocks are only devm-managed for their reference (devm_clk_get),
a blkctl init failure leaves all five DCSS clocks prepared and enabled.

Jump to ctxld_err so the clocks are disabled like on the other error
paths.

Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 7fd0c4c14..551786060 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -70,7 +70,7 @@ static int dcss_submodules_init(struct dcss_dev *dcss)
 
 	ret = dcss_blkctl_init(dcss, base_addr + devtype->blkctl_ofs);
 	if (ret)
-		return ret;
+		goto ctxld_err;
 
 	ret = dcss_ctxld_init(dcss, base_addr + devtype->ctxld_ofs);
 	if (ret)



