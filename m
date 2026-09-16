Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8C8C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 18:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8UIaYnfTCT2SF2eij0JVg6pxcqm481C2BryTjs6N/As=; b=le0P2Rs0mpMaFSImLARn8SlfVi
	upvIj3iEvT4O0gtZXAZlop7mII0qH4mnF8yL9BrOBc2vhmzrTTuDSEZPgpgWnQ/pophGm+ZvB5w45
	DMGN/dZbnELuk1jCfNYCJyriH6m7ng17787VIlKuZbgtYmdEYxJwzVGNFm75d6mLSVqDi0rsUbDq1
	KCfiCu8PLiMDTJi1Z1LjQZD5gwcM4BJY+AYT/aU3c6WfvD8oQiQjgt3rtblDcCipSlRClGkQYns8w
	RRjnBghD4KvltxexUQ8HbMDXmQb72F/taLw5gi87T1VJVARuphnWTA4EoO3OQs5jZb5tJrflscDWB
	ix0rMFRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uHG-00000009wpS-1PQv;
	Wed, 16 Sep 2026 18:22:38 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uHD-00000009woP-2OTV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 18:22:37 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABHsTtj3qpqAG1vCA--.23703S2;
	Thu, 17 Sep 2026 02:22:27 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: airlied@gmail.com
Cc: alexandre.torgue@foss.st.com,
	benjamin.gaignard@linaro.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	maarten.lankhorst@linux.intel.com,
	mcoquelin.stm32@gmail.com,
	mripard@kernel.org,
	philippe.cornu@foss.st.com,
	raphael.gallais-pou@foss.st.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	yannick.fertre@foss.st.com,
	yannick.fertre@st.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] drm/stm: Fix runtime PM leak in ltdc_crtc_mode_set_nofb()
Date: Wed, 16 Sep 2026 18:21:59 +0000
Message-Id: <20260916182159.2091530-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHsTtj3qpqAG1vCA--.23703S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF1xXFyUCF45WF13Gr1kAFb_yoWfArc_GF
	45ZF97XrWqk3WDZw17Aw43ZryFva4UZrn7Xw10y343trZrXF1UZ348Xr90vr47Xa17XF9x
	Ja1vgFyrJrZ7ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-xFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JF
	I_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26F4UJV
	W0obIYCTnIWIevJa73UjIFyTuYvjfUU-eoUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgAMA2qqok+DJQAAsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_112235_986142_85360DBD 
X-CRM114-Status: UNSURE (   8.30  )
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

pm_runtime_get_sync() increments the usage counter even when it fails,
so the early return on a failed resume leaves the counter elevated
forever.  Drop it again with pm_runtime_put_noidle() on that path.

Fixes: 35ab6cfbf211 ("drm/stm: support runtime power management")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/stm/ltdc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index f7e847cfa38f..a95ca3c3df76 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -945,6 +945,7 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		ret = pm_runtime_get_sync(ddev->dev);
 		if (ret) {
 			drm_err(crtc->dev, "Failed to set mode, cannot get sync\n");
+			pm_runtime_put_noidle(ddev->dev);
 			return;
 		}
 	}
-- 
2.34.1


