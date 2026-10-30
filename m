Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C3D60A260F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1PBHwyqN;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PsBg8u8s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=L4YbgbPAe+FGPn8GCTGk5ZnAVwhjkVIrfVtDvzogHW8=; b=1PBHwyqNYH+HsWizf/cNqxRCUE
	Xrz+5QouWiNRjylGxcfKAWEnMr1BxOuVV1yzkezFDAKjJx06hdVG6lQWZfcn4i5lf6VkQaMGEjBRJ
	OfP47D4lDqJ67R0pUXpVoRlQpRWNLotbGtRnCACI3dOhYxrxTvNXJuSUC2+GPBpFbCMlG2hNDYTOT
	TPIbly4vyqPRWeG8jnEmqEoA1QGMvhxtjgri8XPg6nwrDH8unyb/N3Rtl40y/Ycz9sbXOYyUBb9pj
	MxVgkqaKxXO9SzRb3sW2r96O4DxtO5nrMWJsID3kDRbG/2bt9VahfGONIs+NKm8y5iQhAz6NNBoik
	6+/xIZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMi83-0000000B8j4-3QMi;
	Fri, 30 Oct 2026 08:38:27 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMi80-0000000B8iC-2677
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=PsBg8u8sWJIcN5izkL4AEKIdA3/ccU2KyHe6crzrBLhF1ywkoGRjUALPkuVVsZFLN+YcKx5ATxKRA
	 Pt13nIzsYHu7juaOcJfItLe5YJB2Gv5aBbfGeP5a5YibF1EjvMwhynphS+uSGhS9Jl8LgpZxo3aSHj
	 4C/MkLsUmh+sebyk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56ae45775fc6-70ef2;
	Fri, 30 Oct 2026 16:38:13 +0800 (CST)
X-RM-TRANSID: 2ee56ae45775fc6-70ef2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36ae45773be2-53d9b;
	Fri, 30 Oct 2026 16:38:13 +0800 (CST)
X-RM-TRANSID: 2ee36ae45773be2-53d9b
From: laixiangwu <laixiangwu@cmss.chinamobile.com>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	laixiangwu <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] ASoC: mmp-sspa: Fix runtime PM refcount leak in mmp_sspa_open()
Date: Fri, 30 Oct 2026 16:38:10 +0800
Message-ID: <20261030083810.1597-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_013825_088023_951B8598 
X-CRM114-Status: GOOD (  14.49  )
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

mmp_sspa_open() calls pm_runtime_get_sync() to power up the device,
but when the port is found to be in use it returns -EBUSY without the
matching pm_runtime_put_sync().

The ASoC core only invokes the component close() callback (which would
drop the reference) for streams whose open() succeeded, so every
rejected open leaves the runtime PM usage counter incremented and the
device can never runtime suspend afterwards.

Drop the reference on the error path, and also check the return value
of pm_runtime_get_sync() as the ASoC core itself does.

Fixes: 7d98cc648253 ("ASoC: mmp-sspa: Add support for the runtime power management")
Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
---
 sound/soc/pxa/mmp-sspa.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index f9066fbdd..eee15a6cf 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -421,14 +421,20 @@ static int mmp_sspa_open(struct snd_soc_component *component,
 			 struct snd_pcm_substream *substream)
 {
 	struct sspa_priv *sspa = snd_soc_component_get_drvdata(component);
+	int ret;
 
-	pm_runtime_get_sync(component->dev);
+	ret = pm_runtime_get_sync(component->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(component->dev);
+		return ret;
+	}
 
 	/* we can only change the settings if the port is not in use */
 	if ((__raw_readl(sspa->tx_base + SSPA_SP) & SSPA_SP_S_EN) ||
 	    (__raw_readl(sspa->rx_base + SSPA_SP) & SSPA_SP_S_EN)) {
 		dev_err(component->dev,
 			"can't change hardware dai format: stream is in use\n");
+		pm_runtime_put_sync(component->dev);
 		return -EBUSY;
 	}
 



