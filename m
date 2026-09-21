Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0155C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kZfNRDAZYMOe8/raf1+kfme6bgo4XiPP5kMyL6mrkfE=; b=RkiNwwEYxyvbzJNdqcFF6cLcCF
	EAqIG9oIH3MQF1VpHZ/+D+3ceYDylWT7zRdXjCmoS8oftMjKyhDNquIGytRqxh4HwzV7lW2Cru/+C
	3IOp6Rso4Jnxsnbmy3NfA3FEzgp1zFU7H7rUMOukRF7M8mwjYxtMZC40jnp+Yz+jpDOafmPxaMt0b
	L/llOoGd8qjf/wwLql1qg/TjpNqGwOSpO/9sAWFN/fmnkIsyYWjHwoDkjDO93jVJcA1sp5c6k+o8S
	1d4MSWJi1gjESV5yLMJRpuz2LX/ukw5DqsbjQmYIGQloOwnPkEe6m+ogMc+8VYYVyj5tghX64aHPA
	2HA1fmBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8a0e-00000001SXk-1EAb;
	Mon, 21 Sep 2026 09:08:24 +0000
Received: from mail-pz2-x22.google.com ([2607:f8b0:4864:3b::22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8a0b-00000001SWR-33Jh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:08:23 +0000
Received: by mail-pz2-x22.google.com with SMTP id 41be03b00d2f7-cc1cea50dc0so1112692a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 02:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789981701; x=1790586501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZfNRDAZYMOe8/raf1+kfme6bgo4XiPP5kMyL6mrkfE=;
        b=Dhv3CYwcalfU04oqxQkTLB07ROKWWrtIN2Ze8BqDo2BE9n+543/4dB6dkQuwaE6bp5
         UIaxxXZyHIl/6Pg1TlbQGF7MN/FCFzceXH1pYuo3amqbiZZWZyuR4EwwjJ17xaMKa5SD
         0dXFsP2cwS0kLd5NnzCj4WnAgZBtMRIVYSOIZchofjRGnmvbpipsOuZBSxdxEraAx58P
         mDm1YQ1/XEtm7D25AFzVYeCZBryXd8Whpp61RkSwC8JPPGm5pQ29I6luFl3lH3oddEdz
         FOJfg9xJjZrLCQGGpmK8KzMyjaft400a67Wp5i7Fd6B5BDu4k8JCdZ8Cbo0ir5t5VbvK
         IMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981701; x=1790586501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZfNRDAZYMOe8/raf1+kfme6bgo4XiPP5kMyL6mrkfE=;
        b=rIVi5O+6t+ifKis0XRiAPCc3Wu6kCanUFAI9mAEban74yoxFFywOYZG19JTFYFm2ia
         pSqd7w3jlss/3JG3XFdjb48a4dpte42X0kggwodkitpzHqpTiK4hqrBejB/sHebXE/r8
         3tRAh/M9yiAUc9OQLWDuRkC7rJ8b9wOatE2oZ1nEo+oeqRstr63TJw6AS0spIObDqqtA
         Wqs+6esuW0d7jwQGh4fFGSioZqojs+h8DGOmr+plxnkD9n3rSxDGnOsCJ8U0Ki9OOxWc
         9N4mQxWL5/xfrOWYxANKW8CHzgjVpayYsA7LHNJUoihMlG0cIbBxg8chQSQ+sOl15OJE
         RrMA==
X-Forwarded-Encrypted: i=1; AKwUvBwIzoFkeWn/EsRAVSGFgrDyk3xbkYEEBswF4PYNccMaKEnJXy/qBbxCS1DcKTzsqFJr/syS7JOrj0uiARAUxXIs@lists.infradead.org
X-Gm-Message-State: AFuF++mL7/by1YK623AqBACeAHfh1te7NO+zA2hT5+5XwIeOZElS49VC
	CD3SFklyBl1z+8hskY0p2gC6NUaU3ISB91TgAfwKjWsq709dxTEH76AN
X-Gm-Gg: AYBFou08xRC3tpT7aEp6ZD58Zx/SpADbDKgg7tmGkd19JfukPgstj7j9DMRAexRZU15
	hWyOaNJLb2aWkd5Y9jsxjl/bXY85KInupcBSBOGZASyNl+ggRlwYzUmwPuVkLiwRUtN89nSsEHM
	UQ/ggnM9TY3iEwnLr271Cs++txKQnyuKeogcw4uglTdiQN8vPhPl0ZzVuUk9SHxk+68kmwiwo8G
	3tJet5QGQ7L2jZTC28qc/dj7YfEcln4dz0FBy3M1W030CClb5N3eeg9wCFLFyjoGI48pPVrW31V
	yZk4a5t6CHyiXkZnTBasNGEdnYdOgj3dkui7bCt+fIaZwvHcIahRQQtQoJvU+MUQcFr63QL4PWH
	h9DkZ8sTQGw3jPkA0EQAXLZM/nFMBRqB/JYz6wKDvPhVqnMOPoou2GLle45P2cfgH2zNaQR+BqO
	PNvi3fKl6FWRoVVlL6xB0YprtD8jMci/wKF0VYcqmFotqRjuyAsANcTw==
X-Received: by 2002:a17:90b:554b:b0:39e:6c6a:4b6c with SMTP id 98e67ed59e1d1-39e6c6a54f7mr7862823a91.54.1789981700866;
        Mon, 21 Sep 2026 02:08:20 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6f1835adsm13203772a91.6.2026.09.21.02.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:08:20 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: fix decoder child device leaks
Date: Mon, 21 Sep 2026 17:08:08 +0800
Message-ID: <20260921090808.336112-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_020821_768316_2F652E6E 
X-CRM114-Status: GOOD (  14.63  )
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

mtk_vcodec_probe() populates decoder hardware child platform devices on
platforms that support decoder subdevices. These children must be
removed with of_platform_depopulate() when they are no longer needed.

If initialization fails after the children have been populated, the
probe error path releases the parent decoder resources without
depopulating the child devices. This leaves the child platform devices
registered.

The remove path has the same issue and leaves the child devices
registered when the parent decoder driver is unbound.

Depopulate the child devices in the probe error path and in the remove
path before tearing down the remaining parent resources.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: c05bada35f01 ("media: mtk-vcodec: Add to support multi hardware decode")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index e936ed8dffba..592685ad522c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -517,6 +517,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 err_dec_mem_init:
 	video_unregister_device(vfd_dec);
 err_reg_cont:
+	if (dev->vdec_pdata->is_subdev_supported)
+		of_platform_depopulate(&pdev->dev);
 	if (dev->vdec_pdata->uses_stateless_api)
 		media_device_cleanup(&dev->mdev_dec);
 	destroy_workqueue(dev->decode_workqueue);
@@ -569,6 +571,9 @@ static void mtk_vcodec_dec_remove(struct platform_device *pdev)
 {
 	struct mtk_vcodec_dec_dev *dev = platform_get_drvdata(pdev);
 
+	if (dev->vdec_pdata->is_subdev_supported)
+		of_platform_depopulate(&pdev->dev);
+
 	destroy_workqueue(dev->decode_workqueue);
 
 	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
-- 
2.43.0


