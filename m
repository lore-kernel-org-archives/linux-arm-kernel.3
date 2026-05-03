Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AEACD3424
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cPdyUCj5zFQG1KGlXkDAzMMroAEruqs+f7PQp/GCZoo=; b=jENWLOLFegkT2XO7eboZ62E+c+
	7vkdHqSJB7UHVnpDUo/8wgu9XUZs+6M4XpAF7i3GUC9pHor1+B5mxTqbDK/UD8OGBguUc3Jbu/jSd
	aXwqpJSCJh5PudyikMNDhXwMp/Ju0q3H3aRbGBdxcUJseEvLIaO98lkYvRzRlt8WkhZfWRe5SKRoR
	XMuXY13IuQ8AVVSVjniR78KNb8iOk35gCnUINw4nIQhGkUA3FfIN6ESRihqtvfD2/QXWFnFk03lXj
	pP9puFS1aEv1u8gxnCM4TeJeRSFIlYsQU9c8eQTXIoH580Yj4cezpNcJzsIlhIyCcTbevLm4C16EI
	eKUo8t2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJYJm-0000000BAXR-1lNH;
	Sun, 03 May 2026 15:01:14 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJYJk-0000000BAX1-252q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 15:01:13 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso1426262b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777820471; x=1778425271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cPdyUCj5zFQG1KGlXkDAzMMroAEruqs+f7PQp/GCZoo=;
        b=iHLJWjCSKfYvjRMPKmUXyUaELrDzOKDIdwqx1rHraOZlK46U6I6tXkGrBx8qgX7ss4
         r09C0gu/p0+maqj2C2KM24BeWr3f4i8nKE3R/ovAOiQ7iqNcffGERJGBCoahrVkCqPx4
         E9mIJhwddts7yAOLEY4ODA5NHrxlTlGH427TaXgLCc39oVn4v4BXJuFLlYcM+N9pqueg
         tQfZ3uHWCuMNkZzdmbrdI3O+D8kCPXIlsUgFHqtH2JGq6gHb5sz7HyPvzMPGnllFFs/j
         HObDHgicoWxbhSs9Y65u0m+/ocSFpYzKnKJ+BXlOEHne4AUHdyaY/2UMfF65yupj7/9G
         Qsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777820471; x=1778425271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPdyUCj5zFQG1KGlXkDAzMMroAEruqs+f7PQp/GCZoo=;
        b=nwN3spXur+YBx+sqOyiZ8iFOrzBZkjmKDzNLEzybA0/X3IvuSMRGsrIItYgvZ+ITQe
         fakky8ddRrnABIPZpp7N0O1fGu/wUGhODSkwfBDX4AQHJcAjAFTm8eZT1fhJkQd+JfMV
         GeVJV0CKeSVvvjYvE+RqZnNfNmpYr1GAN7/3IzAY3vO7QDNSCKBplButnRO2ZYvmVGdL
         KSuQ1chIRa2SU3K4Qn/dnApz+0+5PA6ov2NkApI652dY60REZcVQVLvbFE9F6L5xE8pk
         OR9k0b6xzorVCHSjr1QtbkpkWqvAG8yKlhDMP1SRpqNEflMJqC6C1H0kd3FeIb3gaf3Q
         Us6g==
X-Forwarded-Encrypted: i=1; AFNElJ8r4btRsNCfyU3T1CJ0HXIYVTTk+OIM+ZjlYeLzc+APe+xGFG0zX272ZkYbAoPcgwyl3hCw28AykSf59Oirs2g0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy67t1akzBT+kQBtzCjZ/gW0ZOoqLo8MRgOufqaOh4lRm4DeaXf
	ZXuBlS3S1HN2cjG0u9hJMbwe8KYC/DhC9dL7jm9vFy0/l5R+DvDlkUNl
X-Gm-Gg: AeBDiesuzZSOaCK81DPZQ2Lw3kKKjNUb5vkJTN2FPjRS6ZvdrebnABDdFnDAEKYiixn
	eeIx7y2j7yT1JejBg7VOsW9BrT/xqczP51OdxndYdDUf6KzUak0GpP7HGKOg9NZLZqX0guNDnSK
	DmxLkuJ6tfd6OWY0vhRXmLhBlMorOtVwbT242WU+97nMWXQTiXulrwj+B6JeyLh5MuIhmyc5NNc
	tx/9NHjiicHPHWTRp0uBEY+O7mDnj8brA/Xb1+GIupNZqe72U0BzdBevBTKQ90uSdDFelx4uzlF
	OWVN0uGuqPb3JpqZX6dZae3U5iRAJmIDwozp/2UsP5KDpw7cAMsG42tVqFNTZ5M6WsyoQSwlkH9
	GMSPWr+e8sdM9OW64k1HT+sARbmtwKXoT26GskHoIDhlOPwHSYu2NE7CUN8i3Hm/b2NMI/ukrJ8
	Qq/bm2VBR18uV6nY2izMv4brArSLP1fShSWfrKxbCaQslUzGJp5pM4RptGuA1+A8/gP7XKHIDzg
	3YCqScyPXPnMtodrTOMyB5GlKGOGECe+g==
X-Received: by 2002:aa7:8b48:0:b0:835:6bdf:c886 with SMTP id d2e1a72fcca58-8356bdfd657mr1415743b3a.7.1777820470787;
        Sun, 03 May 2026 08:01:10 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.115.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351582dc36sm9699387b3a.6.2026.05.03.08.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 08:01:10 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	s.hauer@pengutronix.de
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: media: imx: remove unnecessary out-of-memory error message
Date: Sun,  3 May 2026 20:30:26 +0530
Message-ID: <20260503150027.107173-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_080112_561762_3508BCC5 
X-CRM114-Status: UNSURE (   9.62  )
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

Remove dev_err() call after dma_alloc_coherent() failure.

checkpatch.pl reports this as an unnecessary out-of-memory
message because failure is already conveyed by returning
-ENOMEM, and the current message does not provide additional
useful debugging information.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 1b5af8945e6b..85b63993ef28 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -589,10 +589,8 @@ int imx_media_alloc_dma_buf(struct device *dev,
 	buf->len = PAGE_ALIGN(size);
 	buf->virt = dma_alloc_coherent(dev, buf->len, &buf->phys,
 				       GFP_DMA | GFP_KERNEL);
-	if (!buf->virt) {
-		dev_err(dev, "%s: failed\n", __func__);
+	if (!buf->virt)
 		return -ENOMEM;
-	}
 
 	return 0;
 }
-- 
2.43.0


