Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88299C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BrGTdKyYWPDzcFJDUsLHUxteyx4n5jj5bbwXZChmZq4=; b=bqDmu44y8gu18n0rHXyVjTc+4b
	PaEsGNsScPSQvheqfyfpGS1Ot9Voj+ru93miOmhyt09Ri1siX79CnLJZB+qpm0eCmXnIMSywysqwC
	tSoQTAx1twpWKbKOo9HxrUjqEvfd+coaWOcIVKRJ9rHv9JyzUa1pu6SaR4tRto0TqxLhhl0izbR2f
	wFv2gagyiFEYDtBuCdJSYaQLBzRpGkThDRNyjUAStUhHNZLLAzQW7pPDAySqb8oLrNqRh861F9ccT
	oD38YJDV6tAQ8FxWhV08a4j/GyphaUzJq7uvt7ZQscujzOa7Bt9CrPAcap1i/k1Cr/mE/5vmvsAA1
	pv/avjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rnj-00000006LGx-0fPD;
	Tue, 15 Sep 2026 11:58:15 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rng-00000006LF9-371p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:58:13 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso2198749a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 04:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473492; x=1790078292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BrGTdKyYWPDzcFJDUsLHUxteyx4n5jj5bbwXZChmZq4=;
        b=LjuV5cDdC4mMuWZDfAM+3MEykNztWrJLWHBmDUn6v2o9a74FUX4N9KsppZhJtEVkA/
         ZfSOdSkFXh8KvqJhSwUxTaJPPRyhWRYua5JILRQ1sYKq/k+LcIqvavAf0ZBcn2+GoApt
         QFZrod6K3WsPt4ZbreqKS+G1I7GEW+Y+PDyXmkaL5H7qCD/URVO+71ZBVW7giqw+0SGt
         /ziv5xRa/z09aaXKX1gd+68tdpbelTMeb4+WswUxTYNzZvdSbF3EFDxVxbYyEMdUZCzw
         gz44zciawEGW2NMC1zbVluZvgL9GxrPY6VFZflf1RO9cw1D+3L/f3wWM9nNViULQtBKr
         RJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473492; x=1790078292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BrGTdKyYWPDzcFJDUsLHUxteyx4n5jj5bbwXZChmZq4=;
        b=Kr8H92H31b5uWZIRhupCmGuXao6P74LamF8lWwk/3rQ2lO+oAPPLxtRB+9RPBvTL+b
         FgAVbs+gSUXQYnR2zM034BXxI+bgUY6eCxOaoAefwKVpntKKuihvCj5ZtpWJJ+b5OCZw
         646dJw6e74Wu1JoUEDiMJXEulUKQVHN1HJTSV+8+zS4QQNuQ+TB6Zdw0xP6gBKS6xyyW
         ICkOIt4ssvDs4MfMNM1U2IWFCjP4aXIBXwM4CyhmkxuL4pIKxpbWr6rz2P8MIrnpbCOv
         LNssA8Vl8lbYrj08XFmdMQR/2MzDEltc+2bOrEiNdd0N3iiHODbPUbeOJbcYLickRAW4
         Cibw==
X-Forwarded-Encrypted: i=1; AKwUvBwoYVPuJiyV0Tpez01l2q+FvM09/QWyQMbEcA2h9X6RIWiQ3IPVts3BW8OQsRv+MbdUw7HYtTf0LKbRyItpKHp5@lists.infradead.org
X-Gm-Message-State: AFuF++lfGy1gcVE6n0aH74umKkcP3LSRe02pxMNG7KpIJdE93Fzxam6Z
	X2L1UA+RhAqqh8nQ1uUDqhAEP4/hEesX8ATUrKf081PwFN6RlzLjnT4F
X-Gm-Gg: AYBFou3/6zek0VLcN5LKmYarQTX9zCP7y7s3EmWsEB5+PsIXwLqY61OCtpzM+TDPZEz
	/42XB0cXuUajLEssX9PlcA4q7LJIWmxtrFojwQ3kOBkNBZSnCFTqn2c3K89s8ZYL485Nrp8V9SD
	whfcBtDr2ij1b8y/zLICKYKtQEQ2ymx6i2bH86n4W/eFSOCcQ5LURy+v2McI4JEIpUxGnl+6zbo
	+iohidO3NU/RrrWPlOoybyb6c3loYQjL5mNd44PlabYZNcb9UZBgemhJ2njbqddUJTHmCxljo7Z
	syaer5yXBh6I98X5tKa0RudWzdZOcBbTDozZL4bmjFUWW98yaM9J2lGlEYi6TqHnaRStCayyxgL
	S2YbaygSEF2V6V+RDaYnDpP22XsUBTVofO8CTc0igooMt10uH8HVmWfpbegeCsqnpZryBgR7qWA
	qVh0FYq0FQMXKuvEZRa0JqRWCbb3Z0vH6jHC+uTNMjPt0DvGdF9ylQdg==
X-Received: by 2002:a17:90a:d648:b0:39d:cbb1:c96f with SMTP id 98e67ed59e1d1-39dec09a779mr13558544a91.18.1789473491565;
        Tue, 15 Sep 2026 04:58:11 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdacba6bsm4953697a91.14.2026.09.15.04.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:58:10 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Fei Shao <fshao@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: destroy core workqueue on remove
Date: Tue, 15 Sep 2026 19:57:53 +0800
Message-ID: <20260915115753.2411047-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_045812_785396_D1596E74 
X-CRM114-Status: GOOD (  12.34  )
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

The decoder probe allocates core_workqueue for latency-based decoder
architectures. The probe failure paths destroy the workqueue, but the
normal remove path only destroys decode_workqueue.

As a result, removing a latency-based decoder leaves core_workqueue
allocated after the device lifetime has ended.

Destroy core_workqueue during remove for latency-based decoder
architectures, matching the cleanup performed by the probe failure
paths.

This issue was found by manual code inspection.

Fixes: 365e4ba01df4 ("media: mtk-vcodec: Add work queue for core hardware decode")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 .../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index e936ed8dffba..426d060d937c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -570,6 +570,8 @@ static void mtk_vcodec_dec_remove(struct platform_device *pdev)
 	struct mtk_vcodec_dec_dev *dev = platform_get_drvdata(pdev);
 
 	destroy_workqueue(dev->decode_workqueue);
+	if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch))
+		destroy_workqueue(dev->core_workqueue);
 
 	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
 		media_device_unregister(&dev->mdev_dec);
-- 
2.43.0


