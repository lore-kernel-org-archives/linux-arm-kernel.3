Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50A1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 17:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z6ud/EPfqlMZplwdn/5Y4rUm6oDx99RAJ6/NlqJ75W8=; b=ARJEYE57XLwg4hfjuTBCS8k2Ap
	M5Qf4cifVQ1MwSIK/REZ0DeXMTzQI3W7PZYjWSdg8K9Uzc3Co29qU4ZoDTeFFmxGXvRrVX3uaZXCe
	uAk8cHXKTe1L/ypCM52RXBVZahjc85ethm4KHRHs/1l7ra5xJNQpsoXSnixbF66DfgWNmjKFRg7PF
	xHsD45VtCnnBitYfQniM2fgRmVLnHMAWP3s6vWk862ZDCML0zRSj0y3qI35Xnq/WXx9+TKyhDiNEZ
	0fj99k88H7WQgw6CX9I5KFA0eIfhztjGr9v7tt2vv98OrromkVjwRLZ1wOVU/RxctKbPveXgypXYh
	eUOmMD5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg4Ps-00000008dXs-1QXK;
	Sat, 04 Jul 2026 17:44:36 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg4Pq-00000008dX6-1n1I
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 17:44:35 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c9ed0c7fc7so21906615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 10:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783187073; x=1783791873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z6ud/EPfqlMZplwdn/5Y4rUm6oDx99RAJ6/NlqJ75W8=;
        b=pqofVxZ/LJlY27y5Unh9TBcquDA6Z/cmqDuD4LKO3YZ/qgVeQcs1rRgwtuF/zU+mzv
         XR21dxtp/r17fq4cI28Qsps3u1gGnmKqyLpaSBCzDriBJeX+cXIBLrNqCC4JggbCMt3R
         JSbDvwHnxP2lAdiMXpjXclCzh681jZRTAIU8AkAOk38C88n6poxYWs8snaRNFWiFhJ+T
         L9Ge2spmkpMcyOntr1T/dqh5tD+PcujlBLU2XZarvwaXUbjMGbBjc5ZyX9/qXCaPk8w6
         Ug4Gq32c5MfKcLhgcU/AGuwgwDoHYiNz7IqKIKaH6s0aElQpv8tuODNvSP5OG/O/FOCr
         7dEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783187073; x=1783791873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6ud/EPfqlMZplwdn/5Y4rUm6oDx99RAJ6/NlqJ75W8=;
        b=P8fsi9qOr8Fyeb4eb1y8iYSE0kla1D5DsF+SKg5Z3DsDF6BUTYlDegqDv0C02BeaIw
         48RQ2aQHfjT0NBs9MXmznELxF+/CoJSiAT/8em9QSgJP95njbIiA9tCS2Nrv4UCXBMM9
         XDU/I+ZoC9DNFoG+h8SymuAWLVCaSpwkh/xolsfcothO+9xupKcyvdxPbXoQtMnsKXjE
         xS8Mu+7R8t8/6l+4fZjtWIpqobAO1pgjcd/uM2AVuS2YGihNyYFV4MKgNZu+h/cJ+deJ
         eRJ5uqC9K0b2as2iMiM2DPyrB4rx1WVTfzgVFVAJ8zlqqwpnqsvzVkHfKGsqk2itP2ZT
         9e5A==
X-Forwarded-Encrypted: i=1; AHgh+RqPljdQNe2XPWr7+AYxG/uIpSnuYW2jZUUZjsAjxbmcTvsLFjUuiP+OSKionwQG5XEs5zD8udlr28ZNS2CZJmKZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj7nBJ7OHZAs1Lvq/gk71/tAtbcUR/6LbNxBt6BUuuwOf+Ibuc
	suIy90IgyMpGqaMONMOzXOSSR4k01Zt0nlnMGWqc2QCV6kzBd/5otBUV
X-Gm-Gg: AfdE7cm233EUoVCpqGbEAMRTtRiswyeBhil6ccdT84IBlD9Zmsv5WBxY8/ERdA1537l
	rFbOooHBcc4MtBtXJbUTQzbbM8XxDC0K73rdIqfPyO3QyuZPOZEnsbdYszfoT6BABx78k8dOPdN
	GBCL3m/BHdZBxxNbWLW43M6n/0GRxB93GHI5kZNpBQ1DphDtRD447A6TgmuG0tHUST85Ox1eo8s
	UwNWmNTUZL6NCdslhFArq/ft/1kwxLg3/8jB0CnwnfPVjPI1JX7i4rL8mOb/L7OvehuEzPBm2uZ
	rBnKA3peIfkHB2aTD9TTsJ2Y6gmxHn2yrxMT3O/MSIuzdVN7tv0620B2zmBlUdigBpqUTPO5TTs
	t4ljTFFCkb1TFIq+bQTmlNrpkUrqYYPHYCbgy6Th4PRJDuqfbNALPiYp9924MFDsP5ukM5R4=
X-Received: by 2002:a17:903:32cb:b0:2c9:b01a:fbd4 with SMTP id d9443c01a7336-2cbb7511bd4mr37563465ad.16.1783187073499;
        Sat, 04 Jul 2026 10:44:33 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad78a3e76sm24836105ad.82.2026.07.04.10.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 10:44:33 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] drm/mediatek: mtk_hdmi: Fix DDC adapter double put in v2
Date: Sun,  5 Jul 2026 01:41:13 +0800
Message-ID: <20260704174113.255485-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_104434_516318_9474DAC6 
X-CRM114-Status: GOOD (  11.66  )
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

mtk_hdmi_common_probe() gets the DDC adapter with
of_find_i2c_adapter_by_node() and registers a devm action to release the
adapter device reference with put_device().

The HDMI v2 remove callback also calls i2c_put_adapter() on the same DDC
adapter. This is not paired with the find helper and it drops the adapter
device reference before the devm action drops it again.

Remove the extra i2c_put_adapter() call from the HDMI v2 remove callback
and let the common devm action release the adapter device reference.

Fixes: 9545bae5c8ac ("drm/mediatek: mtk_hdmi: Fix probe device leaks")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index 7bbf463056c9..e668506daf67 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1501,9 +1501,6 @@ static int mtk_hdmi_v2_probe(struct platform_device *pdev)
 
 static void mtk_hdmi_v2_remove(struct platform_device *pdev)
 {
-	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
-
-	i2c_put_adapter(hdmi->ddc_adpt);
 }
 
 static const struct of_device_id mtk_drm_hdmi_v2_of_ids[] = {
-- 
2.43.0


