Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E821D2E037
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yJjPAsY+OlQh98BPt/llnxV3HvdF91YFt70SYWdsuBw=; b=LGdn55NJcVmyywDHP5XyYOqPme
	5QsXNagmEtueFLjc7dvabLzbz5sKU6M7PF6eHPGJY585/cKpuPPIWuv54Lplnrtdp1szb14RaZ1zr
	R7gBJU9rZiO3oq6BUz/ckRc4afMBVe6TDsVPMVm954h6g645giFOM1XlE0pN0NbmxNJFwiigzcalu
	Ynh2eCpp5Z7zs/B6fKnmiHgwm1uCf+1Tbx1LdBrTupLFK1K7maOs5HSOOVLQZT3C5MpsxKLwHPmfa
	wL0BBR8vNazbXT1IByvjY2RcRgyJMU2CBBi3UkU4GisVIGZgmpUL2pbT0aJDsihZWoHx/FeLdv2nq
	cGgRlqUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xw4-0000000DqsX-0veh;
	Wed, 23 Oct 2024 09:45:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Wlh-0000000DZgo-2Zwe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:31:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so6215047f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 01:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729672259; x=1730277059; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJjPAsY+OlQh98BPt/llnxV3HvdF91YFt70SYWdsuBw=;
        b=Vp9IB+QrsdCdpkBgBjIRfO/t5SdcM1VLoDzd936FHO0yUpbCms33CA0XoYQfGjpjvd
         cM+38Xqamuxyf82JpFJmIxVi+u/bVwISbMqherk/JNlBQlzZTXOeKS9XuP9PkBsuoDpb
         2b2Tg0toso6lbsJGCWpM2NKE1Sort0YuABc+oXJbnuzIgLaCmfzMgMdlFvbO5vYm5RmS
         d85+iG1wLayAMS4RAaKw13DDecHc9Eco9/DIk7l5357cuJiIEaIiUz0fzTnYZ7jTuJt/
         IIIHDfNOIDMMzRXQ3YoYSK0PRJdCVAOQ99sXeapemLkKWhVUFg3Lbjzw+rDtIsSMsgF/
         cAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672259; x=1730277059;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJjPAsY+OlQh98BPt/llnxV3HvdF91YFt70SYWdsuBw=;
        b=sqdSqlzW7Z4k/pEJ3N446uZfsvFzfA+hjLsdi0VB7xwKJPZ1cHhrWBq2s67H/+NPcr
         PiOevMDZiJgQPj24mTAota0KmCrMc0zXe1tXq7eLiAhEvp+k/dT73JEOm4weLKMlyBsW
         LLpoRwO4R17tp9PInOKhx8edi8jcRvvoCF+GB8WJD7Bk2q1VhrA8QqAHG9IhoKOh5+ZO
         vtfEFaDX7zNgnpcOXHFzbNLMoIS/VOUaQBPz8JoiodGeEkrmuDHkuaPPS4bVRsjFvk/r
         H8ocffaUeb3ZSoLulOgaaE1sHkiWXhxm11MtV712fqkwEDglMEIipL0BN1F0tfaq+Xq8
         rFYg==
X-Forwarded-Encrypted: i=1; AJvYcCW0gq0f2dwBc4HeKTXBtMCeTyO+rZBOeJDQgJJ3zFaIObHbHsj25YkDVNAEzsD9iDchRgEcIT3y/Y0zngHjq/Jq@lists.infradead.org
X-Gm-Message-State: AOJu0YzrBDLr21t/JOiUKSjAG27RAAVrU1NrvSQlSWfi2TkzVxgAHiLJ
	CRYmIYbgxU883ORSuZ4TCyFSeBguZR+FVMD6NoQx+KquX/o8jsL2W1B+cJOvw/8=
X-Google-Smtp-Source: AGHT+IHPU6nYNwgDM+9I4opxX+G8CARI27qe3xwEGfD9/YcLKJqmhTD/E8EfYj2M4UlFJjONaqKbmA==
X-Received: by 2002:a5d:51c4:0:b0:37d:47e0:45fb with SMTP id ffacd0b85a97d-37efcf060f6mr1389418f8f.21.1729672259340;
        Wed, 23 Oct 2024 01:30:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a58cc2sm8381119f8f.54.2024.10.23.01.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:30:58 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:30:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: raspberrypi: Do some cleanup in probe()
Message-ID: <fff40b7a-20cd-4933-9534-1f72435bded8@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_013101_685585_1988008F 
X-CRM114-Status: GOOD (  13.16  )
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

If devm_clk_get() fails then we need to free "cfe" before returning.

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 045910de6c57..1da58b07c1d3 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -2343,9 +2343,11 @@ static int cfe_probe(struct platform_device *pdev)
 
 	/* TODO: Enable clock only when running. */
 	cfe->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(cfe->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cfe->clk),
-				     "clock not found\n");
+	if (IS_ERR(cfe->clk)) {
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(cfe->clk),
+				    "clock not found\n");
+		goto err_cfe_put;
+	}
 
 	cfe->mdev.dev = &pdev->dev;
 	cfe->mdev.ops = &cfe_media_device_ops;
-- 
2.45.2


