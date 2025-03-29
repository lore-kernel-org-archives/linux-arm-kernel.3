Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDBAC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 00:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WYXL/IJoE9Di2fp4ccVQCgQpgTyRfUoS3TC43hdzJJQ=; b=PSaDeJ/qdRd1L3QxuzD0gON6Tr
	44oI2ZV4VwbSkkn9YGfg979N1HgkjVfqm7XPkFJgpXwkXiCHbhoT6gyPsoGjJ/BxZzMEClTlD8OEt
	V1YT2J6R3M6ejTRahO88s48wcSwo2ZSEwrwiswygj/YCqjdv/QGYhOI4gaQv9RRYqStwqFYCq+S8Z
	Vz/pdfL3qMaaNNX0yhPgugfbmBn6yiF6iAZDPOBtX9FxQq8ova+QP4sG6JA3ed6wXJDaxueEHPxZj
	MZdsxCv4ydoZCBpJL8Nr1jwJ7pEdNANrBiIs0GXnRHOcnL+ZzB4cxHuihGRvFmZZdPgQBvnHHINf8
	+iiMrY1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyK6O-0000000EYC6-0k8Q;
	Sat, 29 Mar 2025 00:31:08 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyK4e-0000000EY86-3D0x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 00:29:21 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-224341bbc1dso54069885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 17:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743208159; x=1743812959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYXL/IJoE9Di2fp4ccVQCgQpgTyRfUoS3TC43hdzJJQ=;
        b=Tpbyeyxj28UduVzMsUqA2Jd+UoMdPwU1QwzwLqFc/wUtaSqTbYuuu6x90aeIJvPIxD
         G8GJHPmr9KZ5t4YLJnk1qkaM26ftDoP5IAhp1G8uR014G0ZuAqXw7B8r0yte83ojiZw3
         2YcCJPXiSdvvItWanmo0Vslf962OCIOPoFxCl+TJHPanp+8kocfOl1V8AMjhuksVj0ZS
         wW3c0cqagkGQ5HNRwB9ELnE6i4u+Trv7bjL1U44FKFE/mxqgkE1B0+3QMgOq/Coqoj8q
         Whj4gtTdj8KiCMOkx67rNss6vZtuwQS41wh1Xjv+R+Y7qMjN8zrTJSROdFQV7/nlJSRG
         wJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743208159; x=1743812959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYXL/IJoE9Di2fp4ccVQCgQpgTyRfUoS3TC43hdzJJQ=;
        b=jafGR/F3SDSIAKZ37aS1Kd6bDFZIH4VpzJlFfjz5IzVKC5y3VwUlserc5oITOxvypd
         pOvsS7EFmzH7oV8sepJMQH3cC1C8DU7howSWMaenI9IgNh9EpHzah5+yhkVwByrCFOvd
         gU5m0qBBSw+Xbn8hWB5qLPx6Go7jmEYyDSkJdOA4DokWjneapbCglqg26e6oTYqzpUJV
         pZ96MuNp374UU/0UDKiJov3qasBp9yXSOD6PaYdP8i3vJzbUhs8fxvley0HYMdqJvOJG
         qUKjKtNPkT+HtR13cwwOBzfRaUxyTDUNUIkrbj/EBo58Nn3CRVn1Mkd+zkJW78ajxoGM
         D1zA==
X-Forwarded-Encrypted: i=1; AJvYcCVvi0NMNPNQXMx4Jerhr3IfEnoo4y4mH5yrTwfbo35Hu5M6av5W4QvXxlOM0znGVETVZeO6gzewprSqQHl7GSSk@lists.infradead.org
X-Gm-Message-State: AOJu0YzTMkh+vY97/2H5w5BYBEdlgTCRpXZMCfRJT3nr6MTHq/jZDjQM
	DddZ1ziLdQvO43APKOeUiMWofmH5BKfG2VI7CVYCuq+wpBboeaKM
X-Gm-Gg: ASbGncuz52yLYLfjU0dhb9A5xYs26f5Z//Y9Nr4UzxF3aFZRNHpsQ9oTF+yUIm641n0
	v+TkW8Yk4W9MRREe8JUvSG4ZrJlBCX31ame4c6FoWXxH46O1B0tPJ4Hvr1aMbuSy62B2fnWZ0Mp
	NgzJkGJuI9/nt3b2ikSFP68NBpabpzHShHsac0XDhnIfVrGFhgdyUkz7Y7AUwi7GyUuemW8wbr3
	Xb3lKkl1BrN4F94hZK7bdy3pZ8xZSQIs0/o1zeAvCKPZYpuC2kcUJHVtU85nZMnXcyAxLlW6251
	mBMKa+zanNd0F4DNogksZqO4AFGNamoDOQ/vUuGHKH0ClDj7xWnubGcqypnZXj5rOd3euA==
X-Google-Smtp-Source: AGHT+IFA2z+X2uC61UN1KJifyXv9jI8e3ROzSjHTCWF6TbJpXqQnAeo9E5gok3I3WbstaxxTgqoAHg==
X-Received: by 2002:a17:90b:134d:b0:2fa:e9b:33b8 with SMTP id 98e67ed59e1d1-305320afaadmr1854600a91.18.1743208159280;
        Fri, 28 Mar 2025 17:29:19 -0700 (PDT)
Received: from henry.localdomain ([36.112.187.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516d3e535sm2541627a91.1.2025.03.28.17.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 17:29:18 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: linux-usb@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org
Cc: gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH] Subject: [PATCH] usb: gadget: aspeed: Add NULL check in the ast_vhub_init_dev
Date: Sat, 29 Mar 2025 08:29:11 +0800
Message-Id: <20250329002911.132826-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_172920_806425_B2BD20E3 
X-CRM114-Status: GOOD (  12.98  )
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

When devm_kasprintf() fails, it returns a NULL pointer. However, this return value is not properly checked in the function ast_vhub_init_dev.

A NULL check should be added after the devm_kasprintf call to prevent potential NULL pointer dereference error.

Fixes: 7ecca2a4080cb ("usb/gadget: Add driver for Aspeed SoC virtual hub")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/dev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index 573109ca5b79..1709a58299a5 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -545,9 +545,11 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
 	struct device *parent = &vhub->pdev->dev;
 	int rc;
 
+	d->name = devm_kasprintf(parent, GFP_KERNEL, "port%d", idx + 1);
+	if (!d->name)
+		return -ENOMEM;
 	d->vhub = vhub;
 	d->index = idx;
-	d->name = devm_kasprintf(parent, GFP_KERNEL, "port%d", idx+1);
 	d->regs = vhub->regs + 0x100 + 0x10 * idx;
 
 	ast_vhub_init_ep0(vhub, &d->ep0, d);
-- 
2.34.1


