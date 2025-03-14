Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927B0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 11:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=69QxnrDX+ARIIKroQoEvmFo1SyKWNr0b2to7TUKNckk=; b=wXixTHcdO6A6IEO5bE3pncYj2P
	IW31Gz2nQTxtVWIf2c5hDM7t/LuP9qtMGBCGUFWz23d35tQO6zC9AQlII41tpNeH8qize89+UTtHA
	LbGM/ZzXmFjdnlCSD9G/eCW2MbYps8tGkJqcIaMYNLMKI0E/07jgKXTn+BC8wdavh/Tjz1JdAMFvU
	nhUnp4F5kZqNGNTVXkM6ci0rlfNJpKBh+ZJH9RaCPBWFszzz5q02FlvS15/jODJNsIUprFzcCUjt9
	RWfm4LUE30rbfzrkZPoYscFvrbgESDbleb1co/v8Nmu5nCHAikj5e5obF+lFpxJxEiORPsRUezytH
	iZEMScCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2st-0000000Dx11-3v3S;
	Fri, 14 Mar 2025 11:07:23 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2hB-0000000Dul1-0yTl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:55:19 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-390f5f48eafso1140167f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 03:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741949715; x=1742554515; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=69QxnrDX+ARIIKroQoEvmFo1SyKWNr0b2to7TUKNckk=;
        b=DR+WmssyGBHWmv5ulwt5aCtoVab7wrK7q8i0vKsH2xImAxxS/dNjGwgNvctomckB21
         5BuiSxRBPd7Sw5y7UCFtG9u+1K6+WF2GM7ZhuJH6TXbAnjbY0VyFVfUaMoTIHddkiydf
         fSpOA/LWAAtcqMkd+RqbuRrlcm7ygdsZI0NtForJIJHASLIOjPLI/CnooIFkGVFafoQ6
         NTIhwD6j2bSA+WH0u0ruyb8D6q6nHUBjFHXKObFm56Nb8dEThWtrb5iWv7xwTZ/j0LNp
         am8aH/2nXAQTW0b3fC2iwgEJTNikn63Ynrx24bOYmEaZfq3gdSiWbc7jaFx6Q3YRMoFx
         sA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741949715; x=1742554515;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69QxnrDX+ARIIKroQoEvmFo1SyKWNr0b2to7TUKNckk=;
        b=WYW0T+dfCWLy54oyNif5U8llW3rZhHWWlUCJUMvyypInjx7ETsW3+wLwwVi7at9Gy0
         0r6lwqCHv9W82/Itx0Uf9FtlpHY2kBWHWUJMoRnPT56mv9ydsZhgl6QRDFoUa/iEESB2
         k6iMEFNQPYSRlIccUfHaJjbphMk0Y+y+EX26DLOFtBWgdrEh4zZO1V+h9RxfYLF6Pela
         hvnUM4uVm5sjpdHOWe1hsDCs+6cha2Pojk9y/MwJ+x61fkpvJh3XRGb9LgZFS9BW/HsV
         mv7uRF7h+Bzx+KvxzM8g0JN9zhs18uMlRGJEXOWF5KgyshywfUWUcXsbPd3dNtPteTx8
         oN4A==
X-Forwarded-Encrypted: i=1; AJvYcCWIlX7NtW7dgCokQ3h2dHLqupJRlYOJ0ySlRSnsi42So5dnu7kZZDsC2YQYiDAWNXlGz7J0KSTonjg4Va3xJE/j@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/oT2IC2FuGF6pI6BulQ+3jvHMH9PM8fklI6WWpBiTZee7a+24
	8cTlj3Md2CEAU65JPLwqQJskunbzvpmSawJ71pODdmVDwAl/rS4MESXE+TpdP6M=
X-Gm-Gg: ASbGncuP053qqjpjnmHxJO3zaokTs8y9w+hidaTRGN5i2oXRZpZ2AimWmyTewscGuH8
	lidkh7eLahnOCsN2YJ527GWUixbnDa9Q686wMkIEoraUwUziOd/vdT7Cb7KHV0ObaYMtlt6e+xy
	CA7qtQony9iutUr+3m3c7JsRG512j0jJsOQwBhnoqxMBTdejITw3QN3lWBDBoeIz/Qp3jR2DtPl
	jO9Ibl/1urNTxV1uED31ehNlQw1ubbgRWXcbtFtqPEGCPi30eR3ubzhhHEYOMy939YmLP2FkbB8
	NfyXIHYPaD18jIV/0E5tCv7nSwGj3aGdkNE26cBHYs0wIEl0WA==
X-Google-Smtp-Source: AGHT+IFIUbmEzg8hVlyMnrgTdM6eNUAOtW5/W1qBKD80PS2iZfgCvSTaSkNrtRfyXIH2NLPpshVzkw==
X-Received: by 2002:a5d:47a3:0:b0:390:e9ea:59a with SMTP id ffacd0b85a97d-3971d03e612mr2341760f8f.5.1741949715472;
        Fri, 14 Mar 2025 03:55:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d1fe74f4asm8461655e9.1.2025.03.14.03.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 03:55:15 -0700 (PDT)
Date: Fri, 14 Mar 2025 13:55:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] Coresight: Fix a NULL vs IS_ERR() bug in probe
Message-ID: <dab039b9-d58a-41be-92f0-ff209cfabfe2@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_035517_282665_820C4634 
X-CRM114-Status: GOOD (  12.43  )
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

The devm_platform_get_and_ioremap_resource() function doesn't
return NULL, it returns error pointers.  Update the checking to
match.

Fixes: f78d206f3d73 ("Coresight: Add Coresight TMC Control Unit driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index da35d8b4d579..c6bafc96db96 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -204,8 +204,8 @@ static int ctcu_probe(struct platform_device *pdev)
 	dev->platform_data = pdata;
 
 	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
-	if (!base)
-		return -ENOMEM;
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	drvdata->apb_clk = coresight_get_enable_apb_pclk(dev);
 	if (IS_ERR(drvdata->apb_clk))
-- 
2.47.2


