Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0965CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 22:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zA7/PnrzVV0kuFjVDODfJEpzsfgOMGEo0xCOYFUWh38=; b=DQTjsKSVDQS1vSqs2LPkkPMQ2n
	XWsyGWfieteD7t+pzkOKQNOXRodz7PHq7zjBNSHfOd/GlP6hG826t6MxeZTa/QFCOZoI1SqDD8OBJ
	qJ1+pV2rs/CP8dcYax3/MB3PbEa5KLSbBLlqY9D/8P05SdYlVjhKahHIVsfYHIUKiXum1UTLYBDiH
	owQPe2efhS/iPP+IVK1fEPxmnXVtzyKWO9MxwsA/gRwFUvXfDu1W4Te3eOm1uZHgi+H+YL6Vt3Kz6
	UsZCdXUNHjzadJfzRyrPGk0ogi4tPjh16ijdJqoWBzb/y+pBGak47iQrCJPPRuZQyl6tY0QoG3y1n
	p1EXNe5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUIS-0000000FOua-2JoY;
	Sun, 04 Oct 2026 22:03:06 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUIP-0000000FOuE-1ySi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 22:03:02 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-398a5aad413so656937a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 15:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791151380; x=1791756180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zA7/PnrzVV0kuFjVDODfJEpzsfgOMGEo0xCOYFUWh38=;
        b=Qvnr5IX3YatqEA0XT7tx4bkos90qgRE2ynSjmy+ZiK4V6Uql57hxoAR7TlHO2UU3al
         gvHHba4FFkzrR1WSOsIm00ZXyq+4Ke27CU3OC+zFucDlWwvWnsIOMDGn9Aw5MKG3wzNG
         vMWRq26dFNZ/j4ydclkWwiQCnw9KCLcnZNaCmmpCDfobxQeDxL2tM1zgDA/wSvsIOG0t
         9QbrArA67YTaK3DeKulN4SJx9IVDp4NlNppbcq7kkMcVvqV43Hddom/qQu0a/Z6fGemM
         s6T0fwR7la1tltxvYf4Hqo0D5XnSEu4biFQMvpb0tL2AGrO0EOUtAJkFBU7sUfvU7r4N
         ChBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791151380; x=1791756180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zA7/PnrzVV0kuFjVDODfJEpzsfgOMGEo0xCOYFUWh38=;
        b=p+ECEYqtJLy5Jd3Q1D1adyUUmd9tDeWtlHZMfnS0CH4+KHqPRhW6wa23tVfFsqWTtM
         /bBO4o95lSgrC0JUBXobQS5S+4I3sLEuO0jfAPY/Bz1HTy523O51GGiPaWaFPnZElsYt
         ThKGnGbVTZGlsoi5NOPRuJFtfIU6XfYQI6i+5HU2NPFA9r4eZr4rvwde6Oat4s0RnAc8
         R1MqoI+EA/YdX7JthaSrXI/0AV4XZb+/Qv2iUf9V35UwWoBx6yFORulUvsEZyvX953zx
         AOVzmm21iFLvVHGiSb9dYBQPyIUsw1KASGWFA6NAuvYHeZBoJz0Q6Rpmhvvr2fsvcHyP
         qNyg==
X-Forwarded-Encrypted: i=1; AKwUvBzUHWBmyW3L3JNwSLCOpnjd/+feo9EAB/WUR/98neM08yav+Qx816bfFteRG2tZliBUeonYTifmsXMP0xJQWfmA@lists.infradead.org
X-Gm-Message-State: AFq9FYKYBYFJlhNlp48LfUHZuWBR+4WaMcKuekptXuxTOTONbLx2rWdB
	swKNyQI0feUyt1QFZlZf8bhOWcAjNd27WBr0+N7xdv/j4VlBRLnOZrma
X-Gm-Gg: AYBFou1w3V1imeaRXJI8QyX4P52eb1v+iGFz5Mcc+LdKV04MwRLhdMHDjz6QfhUASzT
	JNaDUwqo1cE3Ptn5ifYQNHJqj+ejiWl1b8nev599mK9GlAnFwzZ8OGpkbtWHx+KZL4+HcAG62Ec
	2a9KNODrjQZanWORN+9wFZFjRXgQS1f1ueEAQgFgEjnBIxxnNGQCz76hmjGQcyyGLYIOo/N7bLP
	xsjttnLYBYk2KiSBC0tQjfYKQj2lglw6V4R+brbYMxXxSVADLPVSDCpPtigipYiPEObwO0ijj/h
	6XuYtcpVef8765Li+Uw2yz1kX5y3MwLJrJxxu49CYciL+c+nGhkDFUvMLomGdTgTsoJuFOHdE8v
	/zrP5iu/9qJP4kwqMPZA1MDfSneA70ZJWA8yFOEZ6aS4NXezMiTSgDOuU5Yb0u/4e8BBdb6uVNU
	sKPWOK+mqleJRq0V7GYAMVlqDJX4OfqzmmP8VnAm8xCReh4/HAeh8EBMyIN95yEfNt8+Btz6hgQ
	AKOerKHoaeWroEobcbtR30V0NcwWIJl8Fv4lZK/ZDdEABPd52nBvjzcEp5j71acZxkt+6CDSjeo
	s0gducrDib09p5pBYEt6vVH8C6DYDMXZSTPL6Jgyin8KZPK+
X-Received: by 2002:a17:90b:4ecd:b0:3a2:b4bb:91d0 with SMTP id 98e67ed59e1d1-3a7873da1b1mr4484990a91.36.1791151380450;
        Sun, 04 Oct 2026 15:03:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dce36d07sm5771328a91.1.2026.10.04.15.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 15:02:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] rtc: ftrtc010: use devm_platform_ioremap_resource()
Date: Sun,  4 Oct 2026 15:02:58 -0700
Message-ID: <20261004220258.401706-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_150301_538489_29C4B24F 
X-CRM114-Status: GOOD (  13.12  )
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

Replace the open-coded platform_get_resource() plus devm_ioremap()
sequence with devm_platform_ioremap_resource(), and propagate its
ERR_PTR() directly.

This also reserves the MMIO region. The only user, gemini.dtsi,
describes a single 0x100 window at 0x45000000 that no other node
overlaps, so this introduces no conflict.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/rtc/rtc-ftrtc010.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
index b29c96be40f4..3e88cb224f67 100644
--- a/drivers/rtc/rtc-ftrtc010.c
+++ b/drivers/rtc/rtc-ftrtc010.c
@@ -111,7 +111,6 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 	u32 days, hour, min, sec;
 	struct ftrtc010_rtc *rtc;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct rtc_device *rtc_dev;
 	int ret;
 
@@ -135,14 +134,9 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 	if (rtc->rtc_irq < 0)
 		return rtc->rtc_irq;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
-	rtc->rtc_base = devm_ioremap(dev, res->start,
-				     resource_size(res));
-	if (!rtc->rtc_base)
-		return -ENOMEM;
+	rtc->rtc_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(rtc->rtc_base))
+		return PTR_ERR(rtc->rtc_base);
 
 	rtc_dev = devm_rtc_allocate_device(dev);
 	if (IS_ERR(rtc_dev))
-- 
2.56.0


