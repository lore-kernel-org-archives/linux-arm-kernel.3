Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150E0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bjup8tkbZReyLVbx7owWNWJpf0WRCU5BarQCoUzbWwU=; b=dY7GUTYVCuiJYRcdGdn1W2TwuD
	/PCEVC8LN5CjdEd+vTnXNH5PHoihGS3xkd4NDUTcKl0is1C6NLPlTVCBS7lfJ//oDualPS5vJk6Ct
	4xWaWltZSVa4g7zXrfSVTzgJlWGJaop5J5K5uBqlscHKvBh4sgoLRxH1i+W5nKCmrjNM9P2Ecjse0
	tRl+eMMcV7lzHUfSGkr7CvTwgawbqoT6PyvR5bxNoIjvdjd9f7YBTwnqgUpb8MLqscaCeG2enpbQ7
	JLZ+MBA6Pj+ESoZ+cmp10fIij2CaP9vB4y5wWGCowX7bF4X/OEc0ELuSJkI/sDKDqGqZygjVHCHLP
	dcXNsT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjF2E-0000000931O-1AT1;
	Mon, 13 Jul 2026 11:41:18 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjF2B-00000009309-0DA8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:41:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cca0c5799eso30343405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783942874; x=1784547674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bjup8tkbZReyLVbx7owWNWJpf0WRCU5BarQCoUzbWwU=;
        b=DF7/NLo7eCCAwTHBtHDclQd07+MtzpVE5c2n+juqBXjdfsWiW2xmjxzIwLnJHMlfoX
         jBXgHKXURU743MXWa2yqDxUch042uUExxWyyHEyIdBZN1SNP9V5twJf46r5orV+PSAs1
         uE748cySf3lmPtGafR8ArDWDcVQT8KKK3wq6KfndJD1tdC1p/2IMMbFR78g80O6D/g7s
         ER6UEG1AazM2Uqa3Gn21Xh5NW6i1SJ0zTMkC51w/NmL0DL5hm/tZYXzKRseL+tuupeQI
         MwJHs+oJsqWw/A1w/3EDK3tyGVc9XjmLWn16AKNKGKlNLOhUZvzaTqLi3t65dX3ZQZ94
         eE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783942874; x=1784547674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bjup8tkbZReyLVbx7owWNWJpf0WRCU5BarQCoUzbWwU=;
        b=K1yQkt+c0CZTKxF0vekXbawYAyl5o3j2fdq8zTLGftqq3D9p5ZAiFuYBDIk6+CLh5G
         JGEUpb0w/1vpcPefKMx3MWQ6LS7EiLOqMUYcApbLgY7wVVQdFOaVmpHj0elGwMD3PiRR
         GYEIf3oUhKxOC1ZbOovNT8aPOk7BdMSYNfEzOCV/fZz8RJtmdCFPIKprFpQuBw+nPoVO
         +8gz/EqezE7Qbz6qE+zVxa6WlFReMRyT5jd27l9T1HJi8YZlVfV6WY3AywxXf4zFG0FP
         +sxuH45xSDq4I7c1iiqRGKqgXptabl1z3Dt5cmSt98fpqv+mKQIdskFuZPYtPUJxyxkp
         9+Yg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4d50W7k5aESCDd/bGDWQesqd4PWpdMDoc+3t/gvhrhXx4K4LfwC1F6/OHgnq8R64fUjc3hHj3J8KXq5BIMHUz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5KGaPOK9S7qabOrK0KO3joMDqY29vDljr61w65uoKp0YSc4UR
	AMhAh/FdFuEzaWxzq7NLv97Kj9mfr86cmir9MP40LPDQD5LDnAQFcln6
X-Gm-Gg: AfdE7cmXytzy0OM491y/DG4sAQ6emAJ65/oHyCm5sTrWCAUWuzabJGJUPtwtf3eCoo8
	PW/FA9x5QaM6opxDJwUdkmdlqg9oAFK5oUrxoBGfp5oRAT9cYXLRAmyIeCtcjLAy5Nddh2rCb/x
	OidgG0CUYWQJkraDbeynKEHPTEadysajRVANiONkdJ9k9OcbWGiBg4YBAkxuZk/z13nlktvUwJC
	4XgNipQ2Y4EscTVECHInSfixVdze8EqM5Zly1zbTBHKtoR5M4zcsfh1+CYXdH8fBN9KtPkofsUK
	fNzlXSw/pYVeVMdb+yn/vbgjgH0QxH7xygZRdZ5WpHPW7RXSOhDUmTAd/KqLCQeWH3YETsvu/jx
	eBbcS+lBHmW0MQUGlpvHYyqBZ7YOsf4W6ATHMnXOU3Bcm9sHB1r3p38p2qClxwu3MXstpYhua/U
	NiyWhVzQ==
X-Received: by 2002:a17:902:ea03:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2ce9ed181f6mr81660085ad.21.1783942873961;
        Mon, 13 Jul 2026 04:41:13 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e33sm95978515ad.74.2026.07.13.04.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:41:13 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] media: platform: mtk-mdp3: Fix SCP device refcounting
Date: Mon, 13 Jul 2026 19:38:59 +0800
Message-ID: <20260713113859.921358-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_044115_088257_CDFCE846 
X-CRM114-Status: GOOD (  12.52  )
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

mdp_probe() first tries to get the SCP handle with scp_get(). When that
fails, it falls back to looking up the SCP platform device with
__get_pdev_by_id() and then reads its driver data.

The fallback lookup returns the platform device with a reference, just
like scp_get() does. However, the fallback path currently drops that
reference immediately after platform_get_drvdata(). The driver later
still calls scp_put(mdp->scp) unconditionally from the probe error path
and from mdp_video_device_release(), which drops the SCP device
reference again.

Keep the fallback reference until the existing scp_put() call, so that
the fallback path follows the same ownership rules as the scp_get()
path.

Fixes: 8f6f3aa21517 ("media: platform: mtk-mdp3: fix device leaks at probe")
Cc: stable@vger.kernel.org
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Add Cc stable.
  - Add Reviewed-by tag from Johan Hovold.
  - No code changes.

 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 8f4da4cf55d2..121b1006ffdc 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -294,7 +294,6 @@ static int mdp_probe(struct platform_device *pdev)
 			goto err_destroy_clock_wq;
 		}
 		mdp->scp = platform_get_drvdata(mm_pdev);
-		put_device(&mm_pdev->dev);
 	}
 
 	mdp->rproc_handle = scp_get_rproc(mdp->scp);
-- 
2.43.0


