Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FEEC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8D/ScigX6w0Ntks8tt1Z8HJ/HOkWf3QCL1/JDcSPE1w=; b=q51coT8woMIdxeiT4H8JP7nl5t
	BVanxhqrWW4b3Amp7dFjoJFhEj189w/GIBtHI1mDhKhQAZ52WVIn5Y94vl95DfViAWvASCapmUTzs
	b91mRmg1kNFYzhT4/1jKRezr/VlHTvk1+BCzrbWQ0uGwHH0u7OHRPIW2GHSw25tfKwqqpZUVpcT2X
	ITljA2Ez5OPUWbOMDT7dx/Uu3/JHkM3fFgx0uLImZ09dodE0koCyIO1Mcyn8EDfLcrzpYFzVFzMsz
	92KUx0jx/fr+g8wB6zqHzXMu7v78RWOGqBOqP2o1sWo45WSftgYYot5T71NmP+jhqPCIb6+VNnZmO
	RMWTrEhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mqb-00000003v9U-25nd;
	Sat, 05 Sep 2026 09:38:05 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mqX-00000003v7K-3PX1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:38:02 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-398b3c37877so1765309a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601081; x=1789205881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8D/ScigX6w0Ntks8tt1Z8HJ/HOkWf3QCL1/JDcSPE1w=;
        b=mVLVWP8gTzx7hXV3Nl4Ce7HxTwpN/sBu6u7QaJ+pudXEcER8EyT06hzCVpC91ImlgD
         YnvOuliyFmIqBXywh5YALi4S9kjObMo9mRKk3J6n7N1TBOaikp15y5RAK95dbsd8VgGV
         01LUiaP88VTotDn7WgKFxWY58wQoFI2PBXvcc3PDXZQWB0juOfdth1SchhdOSiCIBwRg
         9B+qA/V+byaVzJv4mVsiWJT+rhTrT8V7L6YNYpTU+Cz8BzoeBLUtwZImfefxhKeD8Vpb
         hKLSXk8Mib/p6us44fPcHiZPWThyQPMg8VrEJUfaf7XSG4mrPa64Of9Zbk3IkSi3ycqZ
         CQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601081; x=1789205881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8D/ScigX6w0Ntks8tt1Z8HJ/HOkWf3QCL1/JDcSPE1w=;
        b=cp1cGmKMHAIUWKRYRf5Ppoicq4R2VdvzJOUVTuZqb0pTkXBFR2ElaC6/kNnTJPXvyD
         S2cH/QcOzBn9HOg1NZR/XbTCUlzC8B320fspXIHVohuui6LsqBbzJkEday/c9bW2QlAf
         hMdiYSK9yRevJMBiXDGO+q6NOeLxuHmUPJfmdWFskDJd65Vr3jrKN8cVX9T9sHdYhjbR
         GrqOO/C7yDSE6TtyLx/uH4bc7XYMOFVj1NWFObkRMAlxY6JjfMI7ywv56JNEjVMCWU6J
         5zZLcp/OEm5ZXzQqDskORpJ8dF8VnEjuMGKrkVTggEUTjVufU1oa2u3Z76Mb5AdIyaBq
         bUXg==
X-Forwarded-Encrypted: i=1; AKwUvBxTus9p1HAb3pJnOGW4NSCwnZt1I30Wov/XLRltkV2Ok55R063Ha6YhNLwOmS6PFfZReHM6oOt0vuWVYBJL09su@lists.infradead.org
X-Gm-Message-State: AFuF++nvbt4qm/C6LUqj4Qd+yE0vCMtbz6UAwPbw22eMYtaeeYquMB6J
	VtsUOoOl1+CTS7FeKfg5U/herBzBESTvhT0mgETU5P9gpQwDoEZYLF2O
X-Gm-Gg: AYBFou3xQV0vclpy5izJ/YLVNYf83s+0vuRgRPXZi67SyBk0def31DfQAi41txWk5J4
	rKTJOxK+ULH6CMmrQhVCEGheYaxydBaqlat0SdTiHSl/lQTzLh9S2EqjLn7KgIPqTJrNhRQqUPa
	9ToNvTudn/i6QwQEB/moJTLmzIBvDfU0IhTKOK24OEGpal11bqjJ7pGfLZlQUJ6UDbpRIoIDrVP
	eXM3V4+s3D/BczPil3BzdXOz7FN2xzngXdck+PtIetdb/l+pcmSPJw9UId6sfwk9zoymKqR9K3B
	oZL+7AbdbsymTQ9iIZ0SACf03TOavkhcakFH/U91WCv0qNdRfoPSyRtmiPTsZDecpS9gDXHXtls
	vjmZclJ/+L/KOuYpudUFGb+fhTFwLkoKZAv7lHNqtzN55BAt9vLs8LamF+LcaeE9S4xcBIwnMat
	zJ8IaCVhm6VGHQ628klCv3w0Wrc+myr0Qswy7Ks3EzOrJZ/8Y+cLIrFUsaYQ==
X-Received: by 2002:a17:90b:3b8d:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39b2624f10amr16533121a91.22.1788601080936;
        Sat, 05 Sep 2026 02:38:00 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:5b5:60e7:9f67:1689])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm15763353a91.15.2026.09.05.02.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:38:00 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v3 5/6] iio: adc: bcm_iproc_adc: use devm-managed mutex initialization
Date: Sat,  5 Sep 2026 15:06:30 +0530
Message-ID: <20260905093631.48667-6-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905093631.48667-1-mdshahid03@gmail.com>
References: <20260905093631.48667-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_023801_853524_51C16FED 
X-CRM114-Status: GOOD (  12.11  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Use devm_mutex_init() to tie the mutex lifetime to the device and
improve debugging when CONFIG_DEBUG_MUTEXES is enabled.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index 24fb41751e93..f4676607682b 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -526,7 +526,9 @@ static int iproc_adc_probe(struct platform_device *pdev)
 	adc_priv = iio_priv(indio_dev);
 	platform_set_drvdata(pdev, indio_dev);
 
-	mutex_init(&adc_priv->mutex);
+	ret = devm_mutex_init(dev, &adc_priv->mutex);
+	if (ret)
+		return ret;
 
 	init_completion(&adc_priv->completion);
 
-- 
2.43.0


