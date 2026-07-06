Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567E6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ThmdWFoUi9SJhoiWKeVyJUwaJ8zMIfm7djT8Y8A3Rq8=; b=3p+PgmT3cVBTo16K1OZdwZThUY
	R0qOMNcFc+GSkEaQz/PvdgxfO/iSKjQreagEwwlptdOhY7JOEHuIsPZL4GTDphn98UDg3HC5WjxLv
	kx1cFtXOqDoeA24TkcgHkn2dZAtdQPYoT8PU2C4OQ/PJ3T03x9N6BFgB86powRisRCsVPhAdZBoRL
	caiU9C7//5Vka2NKpZoHGniEeQSYViT6Pdxg10SbKUCKiPgcuoSOAakY0KEZ7ngIxEvLXrjwicFez
	82wp/FlpWYOmtm+Q1aR+/hvH7VeHRtBnsNQoJRSTLvdmXHev0P0FL4eOM9ogjGD646GTEXItJPSQ0
	I3ErhfGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkIO-0000000CkXN-0kWr;
	Mon, 06 Jul 2026 14:27:40 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkIL-0000000CkWY-2ppz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:27:38 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493c83474ddso28490965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 07:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783348056; x=1783952856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ThmdWFoUi9SJhoiWKeVyJUwaJ8zMIfm7djT8Y8A3Rq8=;
        b=me4GLqK3CWwWhmpX88s88XP4bdnemK8KFQz3B4aPUHJIuSlmQRYSufoz95mC6hOUIQ
         YFV2x7lTtpubq06Gyh10eWWu5I/qhEcbk4FA6pwpdg8Q4KySS5wsmIbIoQqm7ORYcW/e
         4XBqjzDRP3mIY1/qJXLNzDN1CoXShkt5yHoXk5r3P43rFJZjR9xd9JMpQ0Rgy/28kJEH
         4OvI/g7CyCnfKSPa6IBswiAeFwN9gDNdz8Zj4xWbCAJla565GFjO9oq3lszZ/kco45EA
         VyK6PJZdnR/kofLbsKLI55p4iDJo04Y0uSD4Rxd4331m+nc+wU35DS/4AEJAHLhdr/ou
         imag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348056; x=1783952856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThmdWFoUi9SJhoiWKeVyJUwaJ8zMIfm7djT8Y8A3Rq8=;
        b=l0rCR8eHFhyMFSlfW74N+an+pSrq5G7FsUI5Dei1U47AP+POBdai/gW1rypT+lBG+f
         DmM5iiOa0J4AQfeGFc+jyi2UjpUxWuGjYr3BIznsUEe6uuD+dF1/SfhY8Y+eNciDIRH2
         5WHSUog7IzsoeJdxsCd0YFf+k8wd9DueT8QWR8bcYHvg3ODkYxhAvmMVKTP8pFIyjsY6
         e8iczHiOYObow07D02736GT0OTzeIF1gqEOqiNBcqMrqMHxrk/CpAx/888TXaiab7OXu
         EjM9cVaPU/O1BF7W3tHh+Ntur0mLyayclssyKcA5P3xAvXFamQr3aWDhnwnV7fSNJwWA
         cTGA==
X-Forwarded-Encrypted: i=1; AHgh+RrsQhdnAgBoWAOkhO72+ksCRK+Wrh/6YoN8XJt1IOmivQHZvcEQaFydBi/12EBFLB1fUOAbzJNPYFPg0cmENzfR@lists.infradead.org
X-Gm-Message-State: AOJu0YzqoQwJ7AWb5Jkah6PnehZrI+67oHq3AwKsVwzO/To2FSvV02G3
	xNHmm2bBLAP4hPE6ngp5RabUUn5/0Rd7N8eFSJyCPbr4jJ/F0PH3nzok
X-Gm-Gg: AfdE7ckxtpchBjow7Bc15b90PZ1RHB1y5nbeqg3bicvdoSN7UiqJU1PEPMwsMt7kWOC
	wPIdysrE87y68xo7Zw7nYiH+p+EUKtNsAlRpzc9ZYHa8W02s/JPkCuTKCGlEYJ/4Aym7RfWAKvf
	hGMkF2WCwdlETMkXh2k6zALppHPrqOdbJMmJ1q/J2eVKeUb1CsVIvOUPhBcR3ei5OUSbg4Naygz
	eieWaIQpcw+myNSs5aecKpHxWiGka9+EvxXGe+A1IZKVj24OCx6814QVIPtNIpaH7XWKJk10z3n
	p1XoHxHuUp1QtB/g3HOvKRLP/eNT3GqLlveIwPFqTWz4UlKWaUG0VBb6+YTsSCF/wimCW0UkMQC
	qtStOBxqn8mSqVejAdWEoxofpT32qjMConA1lIWI0kBSI8hqFD3hYaPXJs+3VCsJS+vmZQlKj56
	TJxHiUlv955I1auCXvkBM1DMGXa3WcVvdBL4FQjqBubUSIjtODeJhEBr+6nrY=
X-Received: by 2002:a05:600c:8b6f:b0:493:a7bc:5bcf with SMTP id 5b1f17b1804b1-493df08cf98mr8234245e9.24.1783348055423;
        Mon, 06 Jul 2026 07:27:35 -0700 (PDT)
Received: from osama.. ([2a02:908:1b8:2060:bfda:c630:e88a:7a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm268422715e9.4.2026.07.06.07.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:27:34 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] drm/imx: check parallel-display drm_bridge_attach
Date: Mon,  6 Jul 2026 16:27:32 +0200
Message-ID: <20260706142732.49397-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_072737_723319_85485F4C 
X-CRM114-Status: GOOD (  10.96  )
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

check drm_bridge_attach() in parallel-display.c, aligns with ldb/hdmi.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index eb75827394f8..fd48845877cc 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -210,7 +210,9 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		return ret;
 
 	connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(connector))
-- 
2.43.0


