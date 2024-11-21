Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D61FE64014
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 21:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=; b=YLBWwEEWw5M4UWqfWK7R/opdLh
	9G4tRMSRLDvEEKtRckWs3KNXz9hzPkdX3WMJTBItSC1jp905t5BQS+mTWtlnxBgTRLaw04+lihj9x
	p6a8g3xYW7qqtt1DNWpu+yoT10O0mOYwCxgQPvFaUOl/Pjuq+48uQC60DJXhc/FmLdsfwUw4An3Yk
	8jvoPpWjx3VTt/NAvm28FcUHUcp+FEjX5zq1n7eeefO3R345xDavFtzmB6tlfKieVx58RQkIhv0SR
	RIeTSn+suFpkvgnMczaguMcBrVb12ChzyfneWhicljr2AYDCNaVF4F5n8jvsEnfWDvutv8+4o6wT+
	zb5glLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEEOj-00000000wga-0SPR;
	Thu, 21 Nov 2024 21:07:33 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEEN3-00000000wLO-2pZe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 21:05:50 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7b153047b29so78800885a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 13:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732223147; x=1732827947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=Nx8KQyi1PLWloaGiacO2DMHTp/8kDA+JIa0ZkcvLttzFkrshRzhYzQtwx232Otiq4/
         LhKzEcKNpw5UVIinYA8tFp9velFiEW1GSAPvp+vh8JeGhL6WonX/a9m2z6pq4nLGqqtW
         52r38IbZ5eQl21UZhSpRMkQa7x3JPB0VlWTMgWNYusu6BdPjTUFlG1wpP22wcTP0ovTO
         NrAfzvuS7Fh3onZsqPzGPOXqM0Ei83ZEOzFKaSlXxhLCcHPvo5N2LLHuihOUJOVTvUHn
         oHlBy3JiVeagxbGgfVyw1myiXb3Nl1IDOKbL5IgQZ5PQLLsYWND3GAULQrg4DnWt0en+
         TAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732223147; x=1732827947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=MrHD9TfKqD+8/DA/9zzjI57I7MbLQQ9DEB6GY7o1aQRZzphx6NLKCiVJU38MQc8cmA
         rfMxDQ3Twt+bouyBW/p9bjmsdg42klp/n0ac2Pu8RR2DBzQipGP5++lESfeO7uq5O2Su
         hszB6tJLyU2Ih90YHtDXYAoTS7sMEVQIsysWugSS6CRjDHXoEz9nVctZHX24Iswlp7DK
         f+g3A1Lcn7fbGkRFJ6fxGvem+PZGOu3lEiFbXwYyCDiVosjfZ5t3Hl+pN1YTAtQY9zL9
         LN1iZDAI7qPBK1F5dHgQwusWMjq2xf1CvtSe2MHLBIazCKhAZfIeVzJYs0KAOBPAUtNe
         l7WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpUQIge4b5WvDdWCa7htX7Pc5M1RAUnVVW7ebzQU+amH/Mpkq5Z9yAOxvJCZWdJspDHXYuhb4tpGc3PLni6OTe@lists.infradead.org
X-Gm-Message-State: AOJu0YyAf29kC7O7F174y8huzTcqRfxgI1xPa7waF/G7fxo/CgR/qUc/
	U8O9ad3m3dyB/SZoo+XbegWTMUIRv683cZXzi3TMfTww/68gYMED
X-Gm-Gg: ASbGncuC6IJRd4fRtubQpt/2h5Ab3+epGU6AZaJSUFZMa6iJ0NcxRlDdT5+nSlkt+H5
	kWd5GKiDxBvRClEmsNq2JcSsjhSKtJaLvARa/hiOf8srQBXLtBagOE2wXxR4foV+/r5OT1HStP1
	aApX8ZG9pQUq5mR5jn6iUHtjBv4BXtdQgv5UPNDUPUYaP/PSvp9qzM2ssLJ45fGhkA/vGRs81WA
	Y6nXw+tzgTpnh5y/nlQ2EluzUufxYI7s2aw8aCymzw9bF1SkgVYlBGgISQUe2GXRbrFNQ1g
X-Google-Smtp-Source: AGHT+IFG6Tff0/6lSGz4mSGoJUTTqX9fqp3fbXsR49SyMJyG9/0yxbeEdav0LyDICHYyhjtCi5eHNQ==
X-Received: by 2002:ad4:5c89:0:b0:6d4:35f5:1f98 with SMTP id 6a1803df08f44-6d450e9899dmr8796626d6.24.1732223146558;
        Thu, 21 Nov 2024 13:05:46 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451b4a11dsm1658506d6.102.2024.11.21.13.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:05:46 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: sylvester.nawrocki@gmail.com,
	mchehab@kernel.org,
	dron0gus@gmail.com,
	tomasz.figa@gmail.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	kyungmin.park@samsung.com,
	laurent.pinchart@ideasonboard.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH 2/2] media: camif-core: Add check for clk_enable()
Date: Thu, 21 Nov 2024 21:05:42 +0000
Message-Id: <20241121210543.8190-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_130549_711759_8346B0BD 
X-CRM114-Status: GOOD (  13.58  )
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


