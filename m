Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BA8CCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6j1Zr2nqSljgnBt8lg1GB0+pNJF6HsLCg+rohPfLc0=; b=nQSFXKNKpvgIsxpxTAHfd7We4W
	DiarKwAxBFQ8SQ8FFN3iEhOgbq05ichpJAXKlfOjHW31y4drrkhG8qddxCtC+jVSNWZL3AnGf61N3
	YhM0gyx1k6V3WNCEDCjyGiELtNfiaOVPxg2lZ6gkfnu3Nl043jqnclSjbDrNxOHdOHHxsmW+iUcZd
	axu56jtCjpoPnl62rxNRuwOnHR8cuZjijPRr/2PcpBJBHpWRtcQkBa8rRV+68oL6am7hY52GDuFiA
	XaMa/RwuigLK9p2isxLq0yeMUqU2xXdcJYwJ+G2adEn6YED9d2U5sd/9D3TgGJzfd3ac9N4Q6hzVY
	0vXni2jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6X1-00000008Nzd-1kGc;
	Wed, 12 Nov 2025 08:48:47 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6Wx-00000008Nwm-0j2k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:48:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4777a9aeedaso5008285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 00:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762937321; x=1763542121; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6j1Zr2nqSljgnBt8lg1GB0+pNJF6HsLCg+rohPfLc0=;
        b=WNGZB85Ikz0BNb0pG7qakRNPzV0g9kdEkhYWESfkddq2xsMt++jYI1jYIQ9c2mdlRl
         wYuL5G8MgSNpiJclJsLVUZQAaIh6tZM3K6CqwTexYBkb+DavfYylID8G+LxOHH7doScd
         z9o6uuW8Gp1fnDZCewrfIU0ov11aI6izHAG9HBDdk5yHH8zTImTAjfcUbKNaJ3QulZig
         Yy7k9E+LIX8nr+rgPZw8kFul/LsmlVXDuqmG8JmqfOHKhC8c44BJtH+Iio7xI/Qn8gmc
         FCq+9J10rfPPkUmxbkY9uZ5mE4aCofAcK0+jniiK1IOmpjn2spWLwLaLrJoBHAbQ5qKb
         tNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937321; x=1763542121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U6j1Zr2nqSljgnBt8lg1GB0+pNJF6HsLCg+rohPfLc0=;
        b=QxYvXOTdvQyjnXj9su9Uqcxe85HcsYiFQaPQqmTTcf4rMjg/JLXElLUvpNrqZNkHtT
         L650IDJ3k/mLSKCW9Yx4Urag/sHobl/uae2yzDi9ObpKaxeLdbtQgr+Qp/Ly9UxLOikW
         /bjEOMvlOZKYbewn0bDLJSKEEZqdQmYMqVk0JLWt+CEUgMMJt7THK4iym0WVPl93nXBl
         rM0ixGDPedNYa/6+xBx91LpLxHRqlV02zQJfmLY5dzLkM6fod9T5Uc+b2NqomDNDFazV
         qGS7tnWnkIepJcxTUHMtYPG8uhhpoHk0ZV0CocrZTY8aLzw4u+l+UheM0TJhx8qwxDwc
         8+ag==
X-Gm-Message-State: AOJu0YyektyC2KoTEf9xTNYf1XUwAr+cPpjv7MUw97Ckdp4Xd7xzE4tU
	eyuGziXgozU+xRj+fRhaGKv1B5jXvq6bJ4rpRQOmBy1pQndh3G/vhmwfEUXFMWmgdJI=
X-Gm-Gg: ASbGncu/rGx8h2G2MW5tLUovwmbYaIEM54/8JMH4wZQgP2sJDd6SI3GHwuJscYOVYiM
	zo+AtTsKwYIj6LDpswSCk5CvFxBw2ZUAGFzzY/EoFH0IlfVh7sPEXuJ+Vf3+N8CtNA6/HOPuk8m
	YtehevoerGbPbgTn/wAnCY2s3/kJWXM303J+1lteEArJrvL/wkiTPWHYHEa2R6IEdC1kGQeHsGn
	3VTW736QLO8dvwtPQBJpwUeHQjNEdECAtXhMXkXcerd68haEfcuOilmcLD27UQbe+ZyS1R7beiO
	eE6sZtdry26q7KHDfuscNAGXhTpTISkjqmBMSWiz+xm5fs5aPp5ojZMeOX++g/qOg8C6+Dhy0Zf
	EZz9ech2VhiDmt+GNk9MDuBUb44w+th75ro8n3HKP6J69lu+3u8nrbtlaeRNgAZrg/0CHfzpI9A
	VVu0DCJFJ5ROdvermZcLZVEEIpIiTRwYK4vsvK4XhvFCsduNturx4l5xw6VFxqjDO0Jkg=
X-Google-Smtp-Source: AGHT+IHRlvqObTp3cztt6xzj5JbmMm8qTfj4NgJhVxdpVjTif65CUEVPFygwa1pmkHguCLJvzFL+7g==
X-Received: by 2002:a05:600c:1d0f:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-4778704cc7amr17363625e9.10.1762937321328;
        Wed, 12 Nov 2025 00:48:41 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47789ffea1esm3732645e9.13.2025.11.12.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:48:40 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:48:21 +0000
Subject: [PATCH 2/4] soc: samsung: exynos-chipid: downgrade dev_info to
 dev_dbg for soc info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-chipid-trivial-v1-2-ec2dea03bd83@linaro.org>
References: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
In-Reply-To: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762937318; l=1028;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=EhORVg5AyonyLqgYmZ/jq75ZA9P5rTDSsH8wOv8oehM=;
 b=KQx82sEfBGkvY2sSWUcfokNVQxltnCs2thIob42A5Z2BsHO52ZwpBzxC187lGiaoZUytR/WBf
 vin0DwG0RlxB7zwM/KikyLCfd60l8+F0Z4xUdL3ME26YySbIxkUe3LB
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_004843_232378_E001AFA0 
X-CRM114-Status: GOOD (  11.70  )
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

The SoC information is exposed to userspace using the standard soc
interface. Downgrade to dev_dbg to stop polluting the console log.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index cdab1d4326b9de5df477a0545839b7b8b402d55d..3671ed718b933a2dbb9e154202bd3235e3efd758 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -159,8 +159,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, soc_dev);
 
-	dev_info(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
-		 soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
+	dev_dbg(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
+		soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
 
 	return 0;
 

-- 
2.51.2.1041.gc1ab5b90ca-goog


