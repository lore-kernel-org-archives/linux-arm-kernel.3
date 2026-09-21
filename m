Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0A7C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZAoUJ5n70t4dRNpVYU2ESN0IQMx9sWFKtOYuOw8UYwc=; b=ugR1zeJaXpDOf2sAznlC9O3SL2
	Cda6tD5MlUVIakBW+63oXRXGmyVNjo7Oz095JxHUAh3f8UgEhr2mAeNDPk2Jw41ktO81xWWtVR498
	sJ4TUjqNe6LuEEZDeVQ3FlxcvH1KvsluBbESmVWmLpbTwm6QAOEZ6Ua1K7sRoxRM0HUFUJcGrau2b
	bJtTxGazbRlUR7GRge2uTD6eiQv72bOZgJo1SkdawANH7XJFijRFniyNqHnW3hHeh7iy4L0AElk6G
	McDfI57MAZeUywww/DOhCYo5xLPnwycYaaGgVoGIarzGLDnjLUA1lIFO8pErI4U6JPTryLNkHO0Ta
	coox+v/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZkM-00000001P4u-4Aps;
	Mon, 21 Sep 2026 08:51:34 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZkI-00000001P3g-2nlj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 08:51:32 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so2411660a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789980689; x=1790585489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZAoUJ5n70t4dRNpVYU2ESN0IQMx9sWFKtOYuOw8UYwc=;
        b=QKyp69MY7ZL/M/iL2fZGr9dYe5BxawupqmcL3mxeIpAqnup1qWmQ1HPU3KGdO5uONW
         UxSeG2NrM5TNBy0yDRXA3FzOMyCFUXa/kc4ztTKoFKf/KfAA8E6/qgNEhARKxlj/gkW7
         W+ogLZyYdv4OZB4gi4CqozlbPljKvURxPPcdf9DASAq1Sx7GQ+soYI9FBrZXPCJ8huoy
         8zYNEyd1/utSEiMkxZN0oNjEgVi3pULL4MB03G4+WZKbEtysjae8NwnJt3ySGwM8tn0q
         BifO4UKADhNRLEDm7yAjX/hlDs8FhsYzuGFBzAQFkZg2qHtqdp29KBhteVu6uS1Ewc2K
         WfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980689; x=1790585489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAoUJ5n70t4dRNpVYU2ESN0IQMx9sWFKtOYuOw8UYwc=;
        b=xEOPBe/Cwdvq/TWxiQlUnx7vFZF17BwOJkLLC3Y50ymVaqBH+9dP5QNm7qhX0gXneB
         J5SpWRGbFARy2ZwlBZnRRFCaq6YgpCQ3dZMbl86+pZrkgGk/lwQHg/3Gv41Cb4v/Xw3f
         XTS3vf5EqTli8qrOKdZyT8MgiSYrnaVUObvVMLDsPSA34UOxlCm//74J7Tzjgno5S2OZ
         IBjQO2mCNeHVtoFd7XeDDb8noCKemB9vB8+4XqYXje50AEShNfnaqvqaxq0oDGlDZK/G
         /r1rElnfhfq23z0bayBNSfVajnQgMXcDwBCYVLt8Y1jH5OxLtom986gc4HyHGpQtWxh8
         xXrA==
X-Forwarded-Encrypted: i=1; AKwUvBzQb0lx1D5oW12+p4t2uMWiRLZa5E8BXgRuU/c5Wdbb9uDm2jqBjz7XNExySPstEmnwd2VxpUMGmzHKVgQYs2yS@lists.infradead.org
X-Gm-Message-State: AFuF++n7LJD2M1PXrbA5bFQ0cN/osExieWcBX6PiQbIAP1pM1Mt6KTnI
	oJlpdC0N0TYfXdqALtre4Ywe3wBNlmXe65qcGYH2jTXEsZKbx6WshBM5
X-Gm-Gg: AYBFou3kKPP9dsQDpYPiPb70RMKQlhKd9T9YyTVIu/nwLre0RabFkZj5USwi3Rujr9P
	HLROAKLnGcjIzmFzgVMstUB3UYFW68hoCw5qtIAGpviCCbubdpdB5ScRvmOBbxQSkSVzdK0IA+m
	DVYkyxFvPh0KGx/B49GYLfm4nD2XE69SN2VI/ij4h5pDMjXkPOmAnOhxCWix8G81Z8Ow2hp+sTM
	L8mJP92xcQVvO14GXeRU8DOudKYjgilMG3IXGX0lTbd+ddqUcwP+hKgiCX/Rozxfa1LJgBUOjlV
	j5kQRXxVs03mE6EJ+rj31VfkBDD89hpzWDnC4prP5a5aHs2S0V8z25G3VE7EvC7PU72jIsqio0X
	6de1qp/PnLMvZyKuTfECirdDpIGSbOVVlBzy71XF9iPdNii0vsOxhEkf9RS5Sr5JwSFjQ11cKju
	U5zBUzgEdKkCsrpmU4p5gsf7IXZmEU4XZrMfQXI4f2oC9YFF+p5rplPg==
X-Received: by 2002:a17:90b:1b0c:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-39e54bbc32fmr15958386a91.9.1789980689350;
        Mon, 21 Sep 2026 01:51:29 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55b83602sm7853716a91.1.2026.09.21.01.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:51:29 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yonglong Wu <yonglong.wu@mediatek.com>,
	Min Guo <min.guo@mediatek.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: musb: mediatek: fix child device leak
Date: Mon, 21 Sep 2026 16:51:19 +0800
Message-ID: <20260921085119.308981-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_015131_952910_9CA9FDE5 
X-CRM114-Status: GOOD (  14.94  )
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

mtk_musb_probe() populates child platform devices using
of_platform_populate(), but neither the probe error paths nor the
driver remove path depopulate them.

If any initialization step after of_platform_populate() fails, the
probe returns without unregistering the populated child devices.
Likewise, the children remain registered when the driver is later
unbound.

Use devm_of_platform_populate() so the populated child devices are
automatically depopulated when probe fails or the driver is unbound.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 0990366bab3c ("usb: musb: Add support for MediaTek musb controller")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/musb/mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index c6cbe718b1da..3aff0add2faf 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -415,7 +415,7 @@ static int mtk_musb_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -ENOMEM;
 
-	ret = of_platform_populate(np, NULL, NULL, dev);
+	ret = devm_of_platform_populate(dev);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				"failed to create child devices at %p\n", np);
-- 
2.43.0


