Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB23E6ADCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 22:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=; b=K2eUME4pOJWyWYJAMwICAEy3ot
	xJvke5nFHoTqz4yNYgSJTbODz6iyzfB/bXCo7VLZBENvc6lDqA8d+rnose9NoI0Ecvw9TUNCD3Iv5
	Y+XFl67g4OQDfQ2JkPkoZR3zkVIIb2FyNpoZMZRW9x554TfKJMtvuwgOLFYDYppF7VwJg/tKGKG0O
	r76gwoa5kcjSBf4MiGEVMxUjBcHzkORHtA6Be2ScC5+l6Vkq83qEaZw8hrjOiKwQr+tDchYv9YiAQ
	eunSdPy4nmcbJPi0CNfHDNu/Kyc02vUgpXDNh8bgovAJxzGrhdP5j6u5ntmxA9nz+v4w/x+kSwV+i
	nfA68dyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEbvQ-00000003OCI-3rQg;
	Fri, 22 Nov 2024 22:14:52 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEbuT-00000003NzR-0yox
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 22:13:54 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7b18da94ba9so223586985a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 14:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732313631; x=1732918431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=V6U+NxR5lYX98nQJXCcR+cytgDxFneUwF7CM+AIYBT/avsYCoLQjprganCN4eVxrmy
         6qGlEubQQg0tHEDusE8PwgntnvcjOHa0LwF1PFr/Zsqx0NwqkBEmR566+5F2+m1by3YJ
         6kWpuorkhBkI2DeoGtgP7d3+BFa6aMxY4Q9b65X50k0KzuEYDcpCf16MY04LN266xDob
         mkfOea4WGIaBJqzWNM2fia3K3z5SY5TM3FeivD3FbNDz5ThLp/xBy+kYaf7VFIcfxbAU
         U8qP4K8/iwGauOME8w4UMf+CgH8RGY38cPP49kC1PGXQGH/bLW37yiQfgA9WhLzUKjsQ
         OxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732313631; x=1732918431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=u3v57LfgYU85HyJLzMc4mKZNnpqPQLMYb24sU4ydyzeMlQryFQ7VDm5EsZGbL2DbfD
         NOXhkFcfRqpcPd6X5pXzXGYwJLHjua7d3soYpat098KM0Z14ZyhZOFRPiel3Oxylowvh
         6Oy4jSCnF9gYRA6hSciPM4ewiUu9fDbH/D+XSj8MlegYtAJLGdQBLYB/b0iC03d8e8ca
         D69B68DBz8QzsdHPvM0H1w1k8eT8LvnNqjoPB7ohsCfWxsdizv0r8/FSlTK2UW0MHa8Y
         WvuQDQiK1VVEVajqnijCg+uMMRA9Rr4k1HhWhstdNgt06qh/U3OHcytFrbRjcJneMoXS
         +/Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXiAMpbR3JXErUW5IAxMs8rWzqk+Vcp8BLTb+OTrm3ftCWS0q+BRox/PgY5MRJ6my5mIQ2LitkaCNL7ZxOKr2Yq@lists.infradead.org
X-Gm-Message-State: AOJu0YzUVjzawk8eMAS6psNVFJqoLvCmRwSDA8GLzJERO41jhJqTCPWE
	KLetlcm8oXpPb+pdOfKtyMR5+sQ52wICGRI99ew5EQwwFn1ncsKL
X-Gm-Gg: ASbGncus+1jk163uUXZnmjjERN04i75cTxsbNEMQGEh+B7117RmI6QHzWjtdEXpZ11t
	s0e9QPRP5Q6l2I+8p9AfZKDRZCHPUspJ+atjnU9hFG8Pfl5SpOV322JdwoSwienHny8V2oi2gx6
	Xk2OmSKm11Gezvr+33RVBuocM+ApJ4UpH3UifQWMlJD7/SDaDnnfDgAXaZ1Aii0lXaIay4HVNH0
	6he9rpROEuxBVGzC4mrNdlOwQFN8DYCl2wgRvlXqv7ceR0cJErkOfQ9SG3sgTGIvSjSDF1r
X-Google-Smtp-Source: AGHT+IEzJaoN3aH6zpKSzv+lhJWHLO6tx485UfeoF/qternotp83Yq1ZBtdBH+mLh7LqABjxg22dlg==
X-Received: by 2002:a05:620a:2b9c:b0:7ae:310a:75de with SMTP id af79cd13be357-7b5143eb019mr779680885a.25.1732313631490;
        Fri, 22 Nov 2024 14:13:51 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b513fa5feesm130646485a.30.2024.11.22.14.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:13:51 -0800 (PST)
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
Date: Fri, 22 Nov 2024 22:13:47 +0000
Message-Id: <20241122221348.3998-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_141353_265440_3B859E46 
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


