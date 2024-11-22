Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56777E6918F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 19:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=; b=AODAG6Mw4MQ35F3Xnt4VmIuh4t
	hpPCX1+kze0r9hry8tg7uiTvHv/uaGRkFHr1u1wg5Fyk8mVi0WtuR5pvvQN1kZugwPQiADuMbfhf2
	xRJQNSbkBWPxco+zSOFUsOEswm96ONi9oCCLRVEQh+10NCQk86IGEH+imaOOMQJtmqNi2pVV65ZMv
	T+dPgZGBrr+YLi/Hx4J/GrDNpw2SVin4d4KkNxiQ2q6S8nXSyYrNTrhhZ3LLaXDQFUeEtxLnr2pZQ
	q7zeiQfik2xLCQZzANul7Pfzy/goEfrMS7/jZsZrJQz0O3z51QgU0KF7UNWIME+qT8Y1j4SQwgmDc
	l6F9GPBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEZjV-00000003EHT-32Jf;
	Fri, 22 Nov 2024 19:54:25 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEZiY-00000003E8m-41ip
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 19:53:28 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5ebc5b4190eso1385448eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 11:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732305205; x=1732910005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=fHaTPwFFyit5WyPuy3wiU7488sM9k/zYQfS2aUXGNtB5AJGWhiQwnFtphclORjs9nc
         fvd/5+n+u15wS2HnbA+SgDmLZ5MnR4dQeB1+6YUF1AlBn9o9nDPORErpQ1tU+xlgf57G
         qKkl+dT4U2lRP+qZc38lyveG/BOsYQzJ3JObPsq0vfEcc1BpGi27gampxzskqGgrqZvY
         EKu+F1n/DVWlnmBOfpR3ygxCqlyOaW2CuHGGh7C27vlkW0mFeMxEFB0VIYL6oKwkVfh7
         +RBfjMydCZ7YFgIaDkv5o2w0XGpcCxyStphXIlFFqcgLhrkV9RhVNyIAlGjOnq110G+j
         reug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732305205; x=1732910005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=qLjKAJD9zjzbouxq12ELr1iREV6OJArEQyX/t8PfbSpCPqXe0pwO5i3WFcekf3RkmT
         Qu8j0UupHIki3Pveqv0z8U2OGqO0CjwbWnw57Beae1ZsBbJ3sSTtoeLTrWbBlNOjKjpv
         sQu9ZMlIRlsZgi2OwlSPIGbrGDwMytwUIO7xBrHFF90cc3Q2jzIKXYyQFzzyNS+tGg78
         ExsGefMmPrVvfpoKbr7U8MiNn/X9STMFSb4YayZZzG4nAaZ8/TKzYndMc+ikvKnX8/8Z
         ISfVI/YLipEVypIvAYF2RA5LLcbr9p+NA6peisHZ1UoTDjyx3/CeVa/bsrr0lEqaEOok
         RB1A==
X-Forwarded-Encrypted: i=1; AJvYcCWjbZXPyHX+lZyVpPXX9fafmGhMxF1x39ownNADnGNiWf62SmgtNy5NqzFagAIrVIGEDMePxcIWOGaF1PZbkjGr@lists.infradead.org
X-Gm-Message-State: AOJu0YwxnpGNqZS0oVHaBp4AoB93TfAfpPwUJ2E+alUQxRZOQSEGFVC3
	n/hRgNpm8ObVxjPPPtrJpmoDblwj4Tkm+p7KT0siJCKa1y2Oe/hv
X-Gm-Gg: ASbGncvRV2lWA07Uvr1Lst0+0gd/t5gzQ7yuNejhdJ7bqWFbM0utEoDGBuKoiIRE3HY
	MrBsPs479y7Sa/kseO01wJTDwdW+d7lZ2s5u/IizAJvqIU+CV8gN8xj0/REgYjYPuEwbIANMF0P
	nTDTUDs/1s2i5bkqnw12BpfwYOWhVH7zxj4Ah7hc2erd3uC9bZjHYTsSHJBEog5BzhLsDgJRFuZ
	+z4OCK0KxH865Hi1LxNviuSCuZA9V0frNECVygmZFSprjtTDH3vFLxD7H9BCS9k4OQmkeob
X-Google-Smtp-Source: AGHT+IGG9LZL6Q/86WX74N5XZj9qYPlo3OR250a6F4l7/ScFyw2yctiaAwQR6Ax+KIbBRfxQwQ330Q==
X-Received: by 2002:a05:6358:42a0:b0:1c3:7b75:24ec with SMTP id e5c5f4694b2df-1ca7977c9a1mr446366855d.15.1732305205386;
        Fri, 22 Nov 2024 11:53:25 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c3ee8cesm15535781cf.25.2024.11.22.11.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 11:53:25 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: krzk@kernel.org
Cc: sylvester.nawrocki@gmail.com,
	mchehab@kernel.org,
	dron0gus@gmail.com,
	tomasz.figa@gmail.com,
	alim.akhtar@samsung.com,
	kyungmin.park@samsung.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH 2/2] media: camif-core: Add check for clk_enable()
Date: Fri, 22 Nov 2024 19:53:21 +0000
Message-Id: <20241122195322.42289-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_115326_995967_7E31DFEF 
X-CRM114-Status: GOOD (  13.24  )
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

Add check for the return value of clk_enable() to gurantee the success.

Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC series camera interface")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 .../media/platform/samsung/s3c-camif/camif-core.c   | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index de6e8f151849..221e3c447f36 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -527,10 +527,19 @@ static void s3c_camif_remove(struct platform_device *pdev)
 static int s3c_camif_runtime_resume(struct device *dev)
 {
 	struct camif_dev *camif = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(camif->clock[CLK_GATE]);
+	if (ret)
+		return ret;
 
-	clk_enable(camif->clock[CLK_GATE]);
 	/* null op on s3c244x */
-	clk_enable(camif->clock[CLK_CAM]);
+	ret = clk_enable(camif->clock[CLK_CAM]);
+	if (ret) {
+		clk_disable(camif->clock[CLK_GATE]);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.25.1


