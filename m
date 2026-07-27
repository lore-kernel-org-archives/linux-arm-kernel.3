Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9C0C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSR2im6S6cq3HZXRJKoCqDqu90Syd/6myKnwGeWN+t0=; b=OkR2NVGSYU58nHYGBG3fmoL/fi
	omV4sOiG+Sk6BxOpBO9kj5IVVW02ipf2sFVGgZGzHfXsmbwi7tmZ/Akb/4ThR020qeDafT8mDTxgK
	HdQhyFwAM7Y3Y8VGSHhI2pxvVqSUqLstYNK2cty3x9w7/hTJFNXX8nz9nc6/ElisXE0VxyHLe3d87
	p8e637alTXgDReNxf7va3YmKLF39XE+eFfd0mAR/aQnG/tE8CnBG3u5m57+7Mld1jeuBcFoc1F5LP
	69DPqpune05GJrSOzLNaNGOch7/KYGWLqtMdaiv2hmN7PV8w8EKsF+fmEEMpADS26dfK2RwZAOdtC
	fZBElsAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS8C-00000003rzP-2wEr;
	Mon, 27 Jul 2026 20:41:00 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS7z-00000003rr6-1w6r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:40:48 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84e584c7a5bso1512817b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184847; x=1785789647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSR2im6S6cq3HZXRJKoCqDqu90Syd/6myKnwGeWN+t0=;
        b=qAOsHpLYxixohDOwb/XJ6IeuVWrqLwM/oTWWuq0VZhDjHvA0tZwdYnF162dLJqE7f/
         osSRjHKUS4uV98Hw9RWz4Jj9L9GnTwy4+pqeBRw71In+CkU1zXxB9XwqXxuRqrtM4y/9
         t2Uyiut5iRGVkr3vPpnI0inKWscH3DPWG/7PwwfjokM1f6JpomKNixN/REcdW5vnNFog
         UVxBaq07MKvb37S4/YNk8lbFteomUga6sO2xHuhVnHKL9SD46G/Us8Tn638wGeXswBXk
         9u9aRsJBZRVsOGnGvadIuCwvfM2KY1K4JLon2in8zHNiYHI60zoRcc8IxwKEK+j8AfXN
         RQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184847; x=1785789647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSR2im6S6cq3HZXRJKoCqDqu90Syd/6myKnwGeWN+t0=;
        b=WUlPMx5HXY6f5VwmDfaQMDMzdZWkImVtUyrch8PyDldhJ7a2zucGvNoU7oZd0w+RM1
         ZTKJItUR2WRwDY84epVEQNrrDrcQVBf6ZU2EDNUALHaM5xyBwOU6ZnO6OAcDtsAwEuK8
         yPwvNOSWZH97akZNwvj0ySTl9m64UReBi//IbHAzLhAzY5wLXqX1DBdrJfjTJEYw+eHr
         ixzr/lZOUJA8MUJZR8D8xcLe8yOeMwWmSjAGlbSC84q0MUJ3Xg1hMVenzTvjMTajkpIY
         fxqxNVmg+vQ0VNCziYqPOTg/oQgjrxC6w2opUsjzaGGnLOIyVRaq+ItDuYJlLtrzeSgN
         QnMA==
X-Forwarded-Encrypted: i=1; AHgh+RoluL7fnDQTE8bxrC3ABeKP/AOXQUL8jIPe/oks/Mp+0LAri3NJM/PywZP3TKdRa97TZ23Ih0NqiZIqworPsQxz@lists.infradead.org
X-Gm-Message-State: AOJu0YyFnOKudQA/YTjAIr28FFYXUBVl9W5uwqrGzs1Blh4gUnJoSXzY
	QTK3GCDHrPHqXKXzHF5/NSAgYm0gTAEWNbufopk5g7gJBOIZh13GJYrg
X-Gm-Gg: AR+sD12qJuETTXfDOtgRWTyTHkmpoo7uKZiJY5Yrz7C8JEh9Xruh2XcF9ZQEfnDHcA2
	Z3q2NJjD0OgUz+Uo6uUkWN5beFVwtjMzFnd/pydx4yYKxWOB+PFMlYBSv5LXMLS4F0Qug7D8tb+
	JClYOdZEqOEyQExG/Ve7Mpj4MWHh6+Iwojn5UrYs+TFHUn+k2G5D2v62IESJpJ3ea4E4eiSSJ4O
	KSEoyhmk43WY4Oks5fV+D1S81uL9BiEFK4146CIewXGDL7eUm4jn7lNdMZIOfPopZCPogp03GXD
	aHlRoUwIi1J6BioM0u8fccCVQdk7yTj9HO5DM85uDw69XF6pSIPIpUI1mFCHTnNpWsLoUiMbeFi
	Vu8dDUpMQLhogeLBOUbaoKqXaNM9khtupQzvKznbrL2GTHWZQ/i8iGHzDqLF+OMtJ8+d8SHGCrn
	by8CAE
X-Received: by 2002:a05:6a00:4489:b0:848:559f:1450 with SMTP id d2e1a72fcca58-84e8d425932mr798902b3a.74.1785184846760;
        Mon, 27 Jul 2026 13:40:46 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:45 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 51/64] dmaengine: bcm2835: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:13 -0700
Message-ID: <2079c09aba6b298cad25fb95b062ac370a65452b.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_134047_497594_9414F6A0 
X-CRM114-Status: GOOD (  11.96  )
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

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/bcm2835-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 06d830d36882..68e86c8d3d43 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -829,7 +829,7 @@ static void bcm2835_dma_free(struct bcm2835_dmadev *od)
 	list_for_each_entry_safe(c, next, &od->ddev.channels,
 				 vc.chan.device_node) {
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dma_chan_kill_bh(&c->vc.chan);
 	}
 
 	dma_unmap_page_attrs(od->ddev.dev, od->zero_page, PAGE_SIZE,
-- 
2.43.0


