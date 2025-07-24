Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A484C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 03:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6wVDs/1wpqhDY4HcSZTV4ZWp0eLuVHcvYN7ua0ivt9Y=; b=RHG2NUG2BeAvrtR/n6oo0v5W2k
	CsiKfVerH0CDQWjvxfxgbqMKt/afJPrRCrQGp74U/8RaE/35/GUPqXDnT8nhpbn/Orbb4knvqAUux
	7Bl6Us2cc6Vos1qxGGkO38qM1jQHmZkTjkiGdIcT/1hsGLJ+Ms7NkBRWfOHG9zlSXrARs+6V3O7pt
	TYPSZeTonhFz2ITWJdEyCgDzWRzn8h5HlkGjUNqRpL5YtXVpJFQGfrQwz3bmGalnb5cDJH0k+s22n
	vOeTBtAuLBHsX0Grrq5Btx29LNI+FH7tVl6OC8iEe3J9c4HaT0VtMtgQunshNujq3dVgpJ4Tmpq08
	rzb2/Amg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uemcr-00000006Ost-2QVm;
	Thu, 24 Jul 2025 03:28:09 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uemaR-00000006OnV-0kE1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 03:25:40 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4ab40633517so1383871cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 20:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753327538; x=1753932338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6wVDs/1wpqhDY4HcSZTV4ZWp0eLuVHcvYN7ua0ivt9Y=;
        b=W5jZams/G4AD4BYM+E+cTA4khFWAIzVMjjjWAfZ4uvCATuCJSSr5ZmdkOFHoPabd1R
         nN1z+DpiHL0k3T9/F0jdWKa+0x+ludNyJ+7nrc6ibagOkvHDXghyyiSjPYcDvLhpsC6Q
         PcKC+1/kNAgElgFXjADcnWdDJYcdsJL6oNnmRpIe8/VYp5ohGUrmqXuwal+bFXcT03iC
         BfoZ45fj0XjaMqekUh0KcmFBQsGOXBRG0A2wEkVoAYgMrJVa/YDCASNKXEbMTpZ1+52+
         MG1G48lxCbBnL0CN5IWFGPy4Qh1LgLDStbN2stI16DJsNF/B5mTld2MbtLijhnpUimc8
         QsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753327538; x=1753932338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wVDs/1wpqhDY4HcSZTV4ZWp0eLuVHcvYN7ua0ivt9Y=;
        b=CUES+aIxq2Fvsve6d+ekbogmbYTPp7tfEFzUU9TcPmyxl7sCVb7eb4kJS59PHLQgP0
         w2bf/tJsf1dThuO/dV4ZP5mnPn5kNb1mydgtSPNIyIaGo0XvnTUxgLCGEG6Cj9kf29nC
         14msaeONFw2p3iBR1vSMdSSlaSyaHdHL7VWdfYZiVouR9QKdQcy85OBEfH9M2VbHllcz
         qnjZN7lkHnhGOZpaxHg/kp2OVHVmY/RMbu4K8EdbqNnpR+5GMVTgGbGXNyoTLrSWHr+6
         Rca+nt2FgmiMkg6uoLs3q2c8mNhFTYhx3OtaGUroXGZ91QLt/dV0T+4rvJ2ZznAw88Ku
         HuJg==
X-Forwarded-Encrypted: i=1; AJvYcCU3NYn8LTRjHU+7GH0sVcDpLtv+mhg3unNQ9otJxRpAwbBAu6NmGRfkwxRv9ROc60q7Vxjem7X5DLZi/4sk1X1n@lists.infradead.org
X-Gm-Message-State: AOJu0Yz62gEQCcKGsHrCiAnDaSL0gIjG8wQablMd3D3yQV1bGL/CszG2
	ZAInO1buX4uiLDgj5SwRhnQ7xhgE7pFb12crd4TXdMLGRkVSDVkHJy4=
X-Gm-Gg: ASbGncvQ7aO8cKZF/Fm9uCvURNjgli2PYS9TL0TfxYSsW7bedabSh21ZC7BtHCkAifr
	HPAcjh0Ik0MA8DRmgLplIKuVGLJv6WcI04xRtcHeVkpc6mDjgtQHtwR1mH/pA+nT26lyXnn+oUz
	UZ9ic1fafnK5OFtqPQTXhmBlfcy6eGjuZVHBYW7B7Q0QqXgWnmllb5ffD4DYOq39O3gUxOhMh+P
	xDI1GsvIaUwv0V/1wM/DJlCmE4ODmWhR4LgE/82nxOOyUyaYSBSwdivOtzprqbp80ZCVbSQ4eUp
	L4ISbBMcQVW8PpYfc4hSMzZrFor2iiCLkz0RKhTrm/mXMnYFGMnU4SrlEV/v0LhpC3m6uwqey3Z
	+yoDblyCngmm9y/xleWU=
X-Google-Smtp-Source: AGHT+IHGnu+YAjFvpNlXoLdms3urmPpO5CFALkcBe0mKnj1jUfEF3394xo2fVnScG0OOVxyFL1h9pw==
X-Received: by 2002:a05:620a:4687:b0:7e3:328f:61fa with SMTP id af79cd13be357-7e62a1410a7mr262258185a.5.1753327537421;
        Wed, 23 Jul 2025 20:25:37 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e632d4d48fsm54145685a.2.2025.07.23.20.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 20:25:37 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: s.hauer@pengutronix.de,
	deller@gmx.de
Cc: kernel@pengutronix.de,
	shawnguo@kernel.org,
	festevam@gmail.com,
	msp@baylibre.com,
	plagnioj@jcrosoft.com,
	linux-fbdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] fbdev: Check fb_add_videomode to prevent null-ptr-deref
Date: Wed, 23 Jul 2025 22:25:34 -0500
Message-Id: <20250724032534.1638187-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_202539_231502_028606F2 
X-CRM114-Status: GOOD (  14.73  )
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

fb_add_videomode() can fail with -ENOMEM when its internal kmalloc()
cannot allocate a struct fb_modelist.
If that happens, the modelist stays empty but the driver continues to
register.
Add a check for its return value to prevent poteintial null-ptr-deref,
which is similar to the commit 17186f1f90d3
("fbdev: Fix do_register_framebuffer to prevent null-ptr-deref in fb_videomode_to_var").

Fixes: 1b6c79361ba5 ("video: imxfb: Add DT support")
Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/video/fbdev/imxfb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index f30da32cdaed..a077bf346bdf 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -996,8 +996,13 @@ static int imxfb_probe(struct platform_device *pdev)
 	info->fix.smem_start = fbi->map_dma;
 
 	INIT_LIST_HEAD(&info->modelist);
-	for (i = 0; i < fbi->num_modes; i++)
-		fb_add_videomode(&fbi->mode[i].mode, &info->modelist);
+	for (i = 0; i < fbi->num_modes; i++) {
+		ret = fb_add_videomode(&fbi->mode[i].mode, &info->modelist);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to add videomode\n");
+			goto failed_cmap;
+		}
+	}
 
 	/*
 	 * This makes sure that our colour bitfield
-- 
2.34.1


