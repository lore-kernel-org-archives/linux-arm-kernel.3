Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13710D7496B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8ApLgs+X4uwexjDkbhSVI2nnBcgdKLGB9tRGEOIKFA=; b=OvdI16wx8f5f5de6L1la4eq0Wi
	i1USGpUIE+Btfg8kNHZEfnURTwEklZ8NfGkp1pU7udzi2liDCTxtouQ475ds0PQD76hPsFiP81BS8
	yzW75T5XvkV9BWxZLca7lmAI8WrYxT0W2fW868oDIqn1XC+9R2wrsDXxCYxuqKsUe7ViY7U7AUfO7
	pckP/awn+M0R0IkkstoiflrFiBHJgxNRgO01GwbOyXInTCIWwCfn6ahAzaRqwS/hnvS7NAgoq4wUA
	B95GIKl+6D0QQCEHGU0zAG5gZfQc82ZX88YHCHZfbN0HzHXzmCoedbQzLoAkt7rC/jdoFzfu4Zajw
	J0kkTw5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWkS-00000009wDv-3CPO;
	Fri, 19 Dec 2025 09:26:08 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWkN-00000009wCk-3TY0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:26:06 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-42fbc305552so1140675f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 01:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766136362; x=1766741162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8ApLgs+X4uwexjDkbhSVI2nnBcgdKLGB9tRGEOIKFA=;
        b=hiHiO8mvw1Nid60NMsLInnLBaeMb15V1r5akiLfWFO3W+UDJRGZGPyH1y0+9L7hOzT
         lysAJkMz2i1SKmifQ5+zl9KaTCRph633wiCqRIMl6DalowbuVOzt/DCU27C4s1VElC7l
         yRUq2AVCFv39ghQaOV5BcMx+KbwtMbQ/Smc3IuWubsPtnXJewaFstaGefX53Y8reV0il
         bhBjqQNQ0aw6gEZt8+Yq/Djt9vvHWGwGma0nXSMGQg2DcSYEFrVij6JhUfpZI/eZhf2y
         TKOBqeCc67f8gDoo6goDflPlpDYF1NzeQGVblkQACrfjpnSx9bgcpL7z1nzITpDdH6S0
         8fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136362; x=1766741162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u8ApLgs+X4uwexjDkbhSVI2nnBcgdKLGB9tRGEOIKFA=;
        b=Wk3kE4KNq4l8C0l7Rejjcc69a3kOsvB5HAxleLgBZNxmHLGbJjCmTx2ai/a8nfsDz3
         Cjrh8uAGSxmQHWDmAQZbynjdkyNq3zkPLBlyg8wJHLY+Jp3B8KEDCVYLqX34xWmXa/Jo
         Slk2S3Ar47qHKeshgAeIRkWrGB9XaaKIcyyG/A3IGr5NPp2b6jyQamPdwH7LF0aJit4U
         /9tBwTFOwbuYWgKUdq9H/uFWFciNRMJ0/csvAz5H67Fe5NhNUK5We7vxr51zi0r3+5YP
         mEDOe63lbkGeywN1ISl9xCyxf47cBVIWTJOfy1d3OHgmBAvTOGdymp5os7lxPnjhvl9F
         Y4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWiXJObbklW30RKF7hv0/Q6ws35xfQE3JPTn5KoGWXt1IxBJcyhCK6tRiwV5HBC83CrNTgpuWd9GJprEcAaqoDD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7nYpiVzvDE30XsKbdSg1lcLBUeTf884ex5hakqR/cKo4nw4y6
	bHvLLADsk4+VK21Mm6II65+dSnplQW/pItV1LVCPWyTydEiD+xTOBVDhBL8bAAUSkZM=
X-Gm-Gg: AY/fxX5qhdxJGVpJC48rC2UOd3/vo7ayH8H7Px0acrSCOiCuKHxPBPTQnLNrSR9H5oH
	FYySgmfw+6Ypog2shG95ulYSmEMf8RgnqODli0s6lMxojJ52dPh94xiDdbJ4WnyZl6IHBiHahoP
	DYiMhRkegJsnroggwBGpZ5rOFrFxXXfyh+h0dnSWH66RnAizBjG9EoaM5WGafTbfmtJMLX58IF9
	84dxwPuPnhPopUlN3GKutl9wXeP95c7ZxTYejDK0GJDEnwUvd1vVx0oexjvE5PFmVjaQACPCSNU
	3ZloA6p9ujzop/1YTW1m/uAszKv3CSt7RXkS40O8Q1Y+aJ2H/9OQOCRC+bFh8MS9T+TEL8QnP3d
	ENRWvWMS6nqJM8l0tzoeKngsoqBk9KD17z82t2t0KNSuOxHwzHl939hXPgz/pMgQkxoIYn+h2pM
	f+W8TZlSK3VJao0IByUviPBa9ZfSkZGYTXKwLFiFL/IM3gNiSlf7ilInD6lYJqk7hZnPHJNZcK5
	YU=
X-Google-Smtp-Source: AGHT+IFQAhNkTc5ytTmFQoCzq2kpBrhbdcL15ws/0mD1lOKgcviKWNLj2gB606Fsbvncghm2MouC2Q==
X-Received: by 2002:a05:6000:2303:b0:431:342:ad42 with SMTP id ffacd0b85a97d-4324e50d6d7mr2259085f8f.44.1766136361832;
        Fri, 19 Dec 2025 01:26:01 -0800 (PST)
Received: from localhost (p200300f65f0066087cf387e078e1a5dc.dip0.t-ipconnect.de. [2003:f6:5f00:6608:7cf3:87e0:78e1:a5dc])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4324ea1b36fsm3863039f8f.5.2025.12.19.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 01:26:01 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	=?utf-8?q?Kai_M=C3=A4kisara?= <Kai.Makisara@kolumbus.fi>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Bean Huo <beanhuo@micron.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/8] scsi: Pass a struct scsi_driver to scsi_{,un}register_driver()
Date: Fri, 19 Dec 2025 10:25:30 +0100
Message-ID: <ac17fdea58e384cb514c639306d48ce0005820b0.1766133330.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1766133330.git.u.kleine-koenig@baylibre.com>
References: <cover.1766133330.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5857; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xXNyc3XdzurEAz26qjxcttkpA50IJuXe67qdD2JoMBo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpRRoQ+rKmIl8VKZbGhEIWm8TteCPYl12ira9TX AoE/6RTArmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUUaEAAKCRCPgPtYfRL+ ThtBB/9ayMulPqjTlc0DszWoahuw67pfRGpc5vOLZsOtqHOXKA+kV0Lp72EO8zO686wO6j0wWde m2bV6qMC3NOc7Jp+9CB1NP5/rHr4SVg7D7B2Noa2+iS9nfJbaGHElNzsGFYq19/MkhsPY/wYWP9 9ngozQjFmjsQ/KKoCwxUGLWfAab7akqvGq2MftWRJ7DNMtAtsXRPWqz3GM8WM7WnaTtBg9gpFxV jXRGPpKCiyIWZcon5w+6sz7ouPRfeoOi10rqvjdsMOK9Uyr6IgTaaffaJEey2STBM+L32/iOSe4 SF76ectDaaQAIkTcpXVIwhEWJCjJCllTtHLvLIO2l2xcUHC8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_012603_902609_44F66085 
X-CRM114-Status: GOOD (  16.52  )
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

This aligns with what other subsystems do, reduces boilerplate a bit for
device drivers and is less error prone.

Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/scsi/ch.c          | 4 ++--
 drivers/scsi/scsi_sysfs.c  | 4 +++-
 drivers/scsi/sd.c          | 4 ++--
 drivers/scsi/ses.c         | 4 ++--
 drivers/scsi/sr.c          | 4 ++--
 drivers/scsi/st.c          | 4 ++--
 drivers/ufs/core/ufshcd.c  | 4 ++--
 include/scsi/scsi_driver.h | 4 ++--
 8 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/scsi/ch.c b/drivers/scsi/ch.c
index fa07a6f54003..f2b63e4b9b99 100644
--- a/drivers/scsi/ch.c
+++ b/drivers/scsi/ch.c
@@ -1014,7 +1014,7 @@ static int __init init_ch_module(void)
 		       SCSI_CHANGER_MAJOR);
 		goto fail1;
 	}
-	rc = scsi_register_driver(&ch_template.gendrv);
+	rc = scsi_register_driver(&ch_template);
 	if (rc < 0)
 		goto fail2;
 	return 0;
@@ -1028,7 +1028,7 @@ static int __init init_ch_module(void)
 
 static void __exit exit_ch_module(void)
 {
-	scsi_unregister_driver(&ch_template.gendrv);
+	scsi_unregister_driver(&ch_template);
 	unregister_chrdev(SCSI_CHANGER_MAJOR, "ch");
 	class_unregister(&ch_sysfs_class);
 	idr_destroy(&ch_index_idr);
diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index 99eb0a30df61..db0ba68f2e6e 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -1554,8 +1554,10 @@ void scsi_remove_target(struct device *dev)
 }
 EXPORT_SYMBOL(scsi_remove_target);
 
-int __scsi_register_driver(struct device_driver *drv, struct module *owner)
+int __scsi_register_driver(struct scsi_driver *sdrv, struct module *owner)
 {
+	struct device_driver *drv = &sdrv->gendrv;
+
 	drv->bus = &scsi_bus_type;
 	drv->owner = owner;
 
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index f50b92e63201..6ea6ee2830a4 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -4417,7 +4417,7 @@ static int __init init_sd(void)
 		goto err_out_class;
 	}
 
-	err = scsi_register_driver(&sd_template.gendrv);
+	err = scsi_register_driver(&sd_template);
 	if (err)
 		goto err_out_driver;
 
@@ -4444,7 +4444,7 @@ static void __exit exit_sd(void)
 
 	SCSI_LOG_HLQUEUE(3, printk("exit_sd: exiting sd driver\n"));
 
-	scsi_unregister_driver(&sd_template.gendrv);
+	scsi_unregister_driver(&sd_template);
 	mempool_destroy(sd_page_pool);
 
 	class_unregister(&sd_disk_class);
diff --git a/drivers/scsi/ses.c b/drivers/scsi/ses.c
index 2c61624cb4b0..f8f5164f3de2 100644
--- a/drivers/scsi/ses.c
+++ b/drivers/scsi/ses.c
@@ -921,7 +921,7 @@ static int __init ses_init(void)
 	if (err)
 		return err;
 
-	err = scsi_register_driver(&ses_template.gendrv);
+	err = scsi_register_driver(&ses_template);
 	if (err)
 		goto out_unreg;
 
@@ -934,7 +934,7 @@ static int __init ses_init(void)
 
 static void __exit ses_exit(void)
 {
-	scsi_unregister_driver(&ses_template.gendrv);
+	scsi_unregister_driver(&ses_template);
 	scsi_unregister_interface(&ses_interface);
 }
 
diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
index add13e306898..2f6bb6355186 100644
--- a/drivers/scsi/sr.c
+++ b/drivers/scsi/sr.c
@@ -1001,7 +1001,7 @@ static int __init init_sr(void)
 	rc = register_blkdev(SCSI_CDROM_MAJOR, "sr");
 	if (rc)
 		return rc;
-	rc = scsi_register_driver(&sr_template.gendrv);
+	rc = scsi_register_driver(&sr_template);
 	if (rc)
 		unregister_blkdev(SCSI_CDROM_MAJOR, "sr");
 
@@ -1010,7 +1010,7 @@ static int __init init_sr(void)
 
 static void __exit exit_sr(void)
 {
-	scsi_unregister_driver(&sr_template.gendrv);
+	scsi_unregister_driver(&sr_template);
 	unregister_blkdev(SCSI_CDROM_MAJOR, "sr");
 }
 
diff --git a/drivers/scsi/st.c b/drivers/scsi/st.c
index 168f25e4aaa3..45622cfce926 100644
--- a/drivers/scsi/st.c
+++ b/drivers/scsi/st.c
@@ -4576,7 +4576,7 @@ static int __init init_st(void)
 		goto err_class;
 	}
 
-	err = scsi_register_driver(&st_template.gendrv);
+	err = scsi_register_driver(&st_template);
 	if (err)
 		goto err_chrdev;
 
@@ -4592,7 +4592,7 @@ static int __init init_st(void)
 
 static void __exit exit_st(void)
 {
-	scsi_unregister_driver(&st_template.gendrv);
+	scsi_unregister_driver(&st_template);
 	unregister_chrdev_region(MKDEV(SCSI_TAPE_MAJOR, 0),
 				 ST_MAX_TAPE_ENTRIES);
 	class_unregister(&st_sysfs_class);
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 80c0b49f30b0..da1e89e95d07 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -11240,7 +11240,7 @@ static int __init ufshcd_core_init(void)
 
 	ufs_debugfs_init();
 
-	ret = scsi_register_driver(&ufs_dev_wlun_template.gendrv);
+	ret = scsi_register_driver(&ufs_dev_wlun_template);
 	if (ret)
 		ufs_debugfs_exit();
 	return ret;
@@ -11249,7 +11249,7 @@ static int __init ufshcd_core_init(void)
 static void __exit ufshcd_core_exit(void)
 {
 	ufs_debugfs_exit();
-	scsi_unregister_driver(&ufs_dev_wlun_template.gendrv);
+	scsi_unregister_driver(&ufs_dev_wlun_template);
 }
 
 module_init(ufshcd_core_init);
diff --git a/include/scsi/scsi_driver.h b/include/scsi/scsi_driver.h
index c0e89996bdb3..40aba9a9349a 100644
--- a/include/scsi/scsi_driver.h
+++ b/include/scsi/scsi_driver.h
@@ -25,9 +25,9 @@ struct scsi_driver {
 
 #define scsi_register_driver(drv) \
 	__scsi_register_driver(drv, THIS_MODULE)
-int __scsi_register_driver(struct device_driver *, struct module *);
+int __scsi_register_driver(struct scsi_driver *, struct module *);
 #define scsi_unregister_driver(drv) \
-	driver_unregister(drv);
+	driver_unregister(&(drv)->gendrv);
 
 extern int scsi_register_interface(struct class_interface *);
 #define scsi_unregister_interface(intf) \
-- 
2.47.3


