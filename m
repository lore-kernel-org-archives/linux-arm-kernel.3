Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D584C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G1DsQ8xw/CbJlnE26e47lsHv8AyG3/Yu1byV8dq/fhY=; b=dU3ISe8IVmrMOYSU6imI2qG6yE
	5tyAnIFa0ElWK/kR8aBaQeN4/8/VAB6yHUwiae0wJecPOo8oEkci8D0b1D4hvhn2jmcg0HyWc+0xH
	YoH//GL7uFfu+fBMnCSPp6hW55SclPz8V/8WoXOrbtWhn10WI/8Y3djjCPk/9T1uo2nqymS8Yk2G6
	Y+vUVwat3HlXim1gHUXkRIPnnKy3r3qpPTPxSpB3CRtDRwJixyhX4H+trAhN+KsB9quvrHhPLmtpz
	nWxOeQIiP3pDv94JGEiMohZYbYbukTUAdF2kRSVU40c76ZMXiutPZxHxV3IV0KbQ73OXzvlOH1rLJ
	XP4QgPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJEv-00000004FSo-3Geg;
	Wed, 26 Feb 2025 15:22:26 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIIH-000000043fE-2Ig0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=G1DsQ
	8xw/CbJlnE26e47lsHv8AyG3/Yu1byV8dq/fhY=; b=b9R/2bqED/xY7w5nVSLAw
	9l9GF6Uf30+u9FHRoc8pgM2NYUsEG0LzNIBRoGu2ODaHN0ede47vEvmVdNsQ7SpV
	tGVVbPLlPPIQVDpyKl2dA2M5qNINFRP9BemySV0mRBHnUHlOAi/fY5vxzNiOpEJe
	4DcWLN2bot18n+BJP1vP3U=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wAHpyRoI79nVfm6Ow--.12430S4;
	Wed, 26 Feb 2025 22:21:30 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: imx: fix a potential memory leak in imx_media_csc_scaler_device_init()
Date: Wed, 26 Feb 2025 22:21:26 +0800
Message-Id: <20250226142126.3620482-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAHpyRoI79nVfm6Ow--.12430S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF17Wr1rWw15ZrWDWFy3urg_yoWfZFX_CF
	4vgryxXrWjk393t3WYyF18Z34Sqrs29rWFq3Z0va95WFWjya4avr4qvwsYq3yjgrWS9F9x
	Ar1rJr13Kr92kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuBTYDUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/1tbiqB4Abme-HD3S3gAAst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_062149_947268_BF7963A0 
X-CRM114-Status: UNSURE (   6.88  )
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

Add video_device_release() in label 'err_m2m' to release the memory
allocated by video_device_alloc() and prevent potential memory leaks.

Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/staging/media/imx/imx-media-csc-scaler.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index e5e08c6f79f2..f99c88e87a94 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -913,6 +913,7 @@ imx_media_csc_scaler_device_init(struct imx_media_dev *md)
 
 err_m2m:
 	video_set_drvdata(vfd, NULL);
+	video_device_release(vfd);
 err_vfd:
 	kfree(priv);
 	return ERR_PTR(ret);
-- 
2.25.1


