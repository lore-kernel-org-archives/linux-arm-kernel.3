Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E4E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xP0Aqt1y;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=nFDu680s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lA6TJOaRxsa4Fs8ttaPCMuiOdnwDekD+hly6/8eGHww=; b=xP0Aqt1yeK54vy
	qpsDlHKvl319xP0Drs6rj5lDfWp7JdQqRb97kuMdxeGvJKUEDPcFPeZjnC35HgxmC1vPn3ezshaNP
	tzhOvQHVci9DiC8Pn4/PNKRrb9nzTBNrW3r4/FkljszQ6u2WwFfl5a71hvHGOqraBD8MICmL9vtNE
	evyxZAIR1zWS3eMc6rZ+WX0UN2tFFYU1gPd2tLEu8DqiAhpqAhM292iY3vh48Ochxov+EgHgZXJR6
	zgGxgg8OrD26yYAQ03wK+av0Biq69rSfQ57spoylZmDjKy896h2syFW0HF8EYD1WI+G8DpCY8x8jA
	9TQYap8PDsDfLxYezYLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkY0-0000000BVv5-2pf5;
	Fri, 30 Oct 2026 11:13:24 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkXt-0000000BVuY-2Jsy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=nFDu680sWTPFHy4B3sLoILYc4GXFPEXQOnUHzZRCF31jhj38JpRrS62LE1t4+irWTmosP1frNFZYt
	 k6RlXiZRanJlMCR/fcbNXWwTLu6KCJCwSTGM/J856hWHtGRAsnB9zKMo3jWrKmDcjySb+ISAKg2q3F
	 KyIUzc06klWeWWIs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96ae47bc1c89-7a7d3;
	Fri, 30 Oct 2026 19:13:07 +0800 (CST)
X-RM-TRANSID: 2ee96ae47bc1c89-7a7d3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96ae47bc0125-5c588;
	Fri, 30 Oct 2026 19:13:07 +0800 (CST)
X-RM-TRANSID: 2ee96ae47bc0125-5c588
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
Subject: [PATCH v2] drm/imx/dcss: Fix clock leak on blkctl init failure
Date: Fri, 30 Oct 2026 19:13:03 +0800
Message-ID: <20261030111304.2205-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261030083342.1531-1-laixiangwu@cmss.chinamobile.com>
References: <20261030083342.1531-1-laixiangwu@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_041319_532259_8839E0AD 
X-CRM114-Status: GOOD (  12.84  )
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
later error paths already jump to err_clocks, which calls
dcss_clocks_disable().

Since the clocks are only devm-managed for their reference (devm_clk_get),
a blkctl init failure leaves all five DCSS clocks prepared and enabled.

Jump to err_clocks so the clocks are disabled like on the other error
paths.

Also rename the error labels of dcss_submodules_init() to the more
common err_<x> style, which describes what is cleaned up from each
label on, and update the gotos accordingly.

Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Suggested-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>

---
V1 -> V2: Also rename the error labels of dcss_submodules_init() and
update the gotos accordingly, as suggested in review.
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 7fd0c4c14..206679d52 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -70,45 +70,45 @@ static int dcss_submodules_init(struct dcss_dev *dcss)
 
 	ret = dcss_blkctl_init(dcss, base_addr + devtype->blkctl_ofs);
 	if (ret)
-		return ret;
+		goto err_clocks;
 
 	ret = dcss_ctxld_init(dcss, base_addr + devtype->ctxld_ofs);
 	if (ret)
-		goto ctxld_err;
+		goto err_clocks;
 
 	ret = dcss_dtg_init(dcss, base_addr + devtype->dtg_ofs);
 	if (ret)
-		goto dtg_err;
+		goto err_ctxld;
 
 	ret = dcss_ss_init(dcss, base_addr + devtype->ss_ofs);
 	if (ret)
-		goto ss_err;
+		goto err_dtg;
 
 	ret = dcss_dpr_init(dcss, base_addr + devtype->dpr_ofs);
 	if (ret)
-		goto dpr_err;
+		goto err_ss;
 
 	ret = dcss_scaler_init(dcss, base_addr + devtype->scaler_ofs);
 	if (ret)
-		goto scaler_err;
+		goto err_dpr;
 
 	dcss_clocks_disable(dcss);
 
 	return 0;
 
-scaler_err:
+err_dpr:
 	dcss_dpr_exit(dcss->dpr);
 
-dpr_err:
+err_ss:
 	dcss_ss_exit(dcss->ss);
 
-ss_err:
+err_dtg:
 	dcss_dtg_exit(dcss->dtg);
 
-dtg_err:
+err_ctxld:
 	dcss_ctxld_exit(dcss->ctxld);
 
-ctxld_err:
+err_clocks:
 	dcss_clocks_disable(dcss);
 
 	return ret;




