Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE00CC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 07:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1r95TCcHEiHpvMqFCEcTBmSykQv+FZGWvggAUclAA/A=; b=ZD1djw0L1lGeV7KL0KEjaM/1BF
	9szW96tSyuUbN6UEgx+0CsZLeiHFi1DFxDWQDkmx300PpNqGiBa7lgsjtR9bhpAE45t5cJavaKh4U
	xN1i9wh0Vw3D5zrnIWuqPfWcuMEl02EFGGO3NcyRO7F5iLyToMERPszIOBXCmg/Rwc8E1D784Df4I
	j2TXH0gVxG8Uqq6AKXGY9Px5OOOGst+MNs+KB//SYsVH0CkodZag9wSrWKmTixJs/3U63NLnbBvXs
	0uM+J7JXBo3Dn/omSTXH1nRG60UUQDKI1UogUEtWIcgAu/WYm3i4iffg8LwMqAJ1HtHiRAQo2a8LR
	2T06Z0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYcI-00000006acn-0de1;
	Thu, 27 Feb 2025 07:47:34 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYaj-00000006aVl-1gnw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 07:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=1r95T
	CcHEiHpvMqFCEcTBmSykQv+FZGWvggAUclAA/A=; b=Pdw9TsGxqEIb8P1Njcyt2
	65sRf1XYHRd/Y87FZJJVFM9B4S1n7jBzIVrgtfyMiwaao9AucI5GaqA2BCTeXhDb
	Yd2ifvgOtUDxN86mHg4aNwTGJc/2Xgvj2+/YzKg8T8f5oy6tsbENpHM4/8BWwLsa
	oHjEHQsO9B5l7chEHKG388=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wBnKk_0F8Bnz+IEPA--.57589S4;
	Thu, 27 Feb 2025 15:44:54 +0800 (CST)
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
Subject: [PATCH v2] media: imx: fix a potential memory leak in imx_media_csc_scaler_device_init()
Date: Thu, 27 Feb 2025 15:44:51 +0800
Message-Id: <20250227074451.3698971-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnKk_0F8Bnz+IEPA--.57589S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyxtFWfKr15GFy5JFyxKrg_yoWDtwc_CF
	4FgryxZrWUC3ySy3W5tF10v34Sqrs7urWFq3Z0va95XFWjy3WYvr4qvws3X34jgryF9F9I
	yr1rJr1akry2kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtnYw7UUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbB0g0BbmfAEbmqBQAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_234557_807551_EE819943 
X-CRM114-Status: UNSURE (   9.73  )
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
Remove the reduntant code in label 'err_m2m'.

Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
Changes in v2:
- Remove the reduntant code. Thanks, Dan!
---
 drivers/staging/media/imx/imx-media-csc-scaler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index e5e08c6f79f2..19fd31cb9bb0 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -912,7 +912,7 @@ imx_media_csc_scaler_device_init(struct imx_media_dev *md)
 	return &priv->vdev;
 
 err_m2m:
-	video_set_drvdata(vfd, NULL);
+	video_device_release(vfd);
 err_vfd:
 	kfree(priv);
 	return ERR_PTR(ret);
-- 
2.25.1


