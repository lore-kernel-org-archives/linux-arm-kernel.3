Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E45DC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 11:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AA2iifuZLLKE6Um4OIk38K43eNvXX7huxRWiSxa/7cw=; b=Q7Zcn8J5BsdIr2beKbKl2g61lr
	4MBlbtZ24hpV+x7omQ5W99uUiNB3qFEKmaaSjbZFXx0OZrdm/ZkTnBvomW+kvYijqVTQfZ8CmxCR1
	F0zmt2X/RI/uitE4UVpk7h6MglfA7Hrg8kG+5/H2eiuGuxOuZs5xl7Ry4QmMT0F9VYtDAyGUf4pC2
	oW4kjFKECkN6PqYtrIgvUzq0UiWby3/dUhQG2cerBsP8nl4VwtOVDCD+KK+3GHjO4vWVN7E+Tmbxq
	DYOvx3TXwBoxOTcPYkoCIy79AycCaX/b28w3h3RBovGHZSU4ueB6M2BrM+SpTRq61jtJhUmlt4d07
	e562VsYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty7S8-0000000DBvi-1T9G;
	Fri, 28 Mar 2025 11:00:44 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty7Of-0000000DBVc-0f2s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 10:57:10 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5495c1e1b63so2308538e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 03:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743159426; x=1743764226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AA2iifuZLLKE6Um4OIk38K43eNvXX7huxRWiSxa/7cw=;
        b=LNXpEWtfJ9ScOws6NbvrH8jAn5DKcZfyQ1zKOKrNr0NurUSMPEZXYGfn8Gm4lbu74t
         gv6SY0NPhmjFjnyucTmtb/FluGA5W96f+ijaxaSoiotut/JH/myiSb1zp4Xmo4JDLF5L
         b3jYxLlE8BF5qsyB2ap8PQJYqwwHpbWQVzjSzviC93s+Kv0RC53gSG2NZuY4VgUV9di1
         WCzuCj0I0zQsITGakmXNFc6N/fE1HPVL0GIST8vKTjEpMMLfKFme9Uik6rDQUyHcLQLa
         zm+avD4+VGx4sa9fACufPSPuizGVEC0ctV/4S3qL+/MKPCUnW4amqQthqPlxnVDb5s40
         Js/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743159426; x=1743764226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AA2iifuZLLKE6Um4OIk38K43eNvXX7huxRWiSxa/7cw=;
        b=dlowicYSWhQIbuip4knRMGp4oEeJPhHHc9oCMKlr0/NLTVmcaNbadItGbf0xxVB4Kg
         iDcH/s77X82yvWOMSZ2dcOg19SQ5tTTiOAnHcThuEwbHsBHCObQkZ/GuOh4vgWR4bsxG
         u2QserPpdcq3Wnf88Dkyp5AXhF86FKzSnsEJcf4LsZTthbrbGS2X+uhFydnXxKfGHVkJ
         DDx8V1vRLeJt1S4mrZTgg3NV7g2pE4hXlthsiIAFWPfb2H5jMAA4+W3+gaBKzkavYfbN
         X2wKbbXqp/6GPVC2IDqKUqg655UAGCwAYwFdGtlV1FzmWjlCaIBbrBMGJdDepNAGTzfk
         hQuw==
X-Gm-Message-State: AOJu0YyNw7ZNURZrpulfVd96HcNaqKB3DMJ9lP7hSIQRf/Yf2kaR9ep3
	rXosIGGZUnG0roDso5W2JTklTv2hvD6+emEk6kPZL/Rn4tagYHd7YyX5qw==
X-Gm-Gg: ASbGncvc9IUEEwXQ5/PPua7M/y1Rgr8OxGRFsGupFJ6yApMFvw7wng/JTcNroL8jbha
	IN1YvPdQ7IbtN37vFrjsNnVRh2gt60L1PK8N08espGg8X9kmnYpD9jjvKpIDjPbGjZQTmQO3il0
	K9b1F0RKXTyl5gJ/lfi4mfYCC/UWBwJDiGeVAB5uvkovnrHQTAzMLRMhL+yZPbghRHpDfX8s5xt
	fScYnXFiZpeV8qaGUBOLLudvCiNJUHgr96Q/QjfaK+gg8H0+Blmn0B/xORAiI/mA3uYxoiAas2I
	T2pTSz1Mpjf3HiTKZm6vZjnCzBiFG4uDs07A5cw7VRxezkIrk5hUckcR10ytNftWRSfARFCB7CI
	r3w==
X-Google-Smtp-Source: AGHT+IFWW/u8xH2nZ4zWp5g5cik5QWlDJZGM2o+7SInp+46pZ5yqn9v7XWiYq8ype7pBtrFZ2L04gQ==
X-Received: by 2002:a05:6512:2508:b0:54b:e49:6274 with SMTP id 2adb3069b0e04-54b0e4964ebmr126267e87.1.1743159426305;
        Fri, 28 Mar 2025 03:57:06 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09580006sm264257e87.130.2025.03.28.03.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:57:04 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH] dmaengine: at_xdmac: Fixed printk format specifier when printing driver information.
Date: Fri, 28 Mar 2025 13:56:54 +0300
Message-Id: <20250328105654.143676-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_035709_195126_51BA9D84 
X-CRM114-Status: GOOD (  12.25  )
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

Use the correct printk specifier to print the address, otherwise
you get weird information:
at_xdmac f0010000.dma-controller: 16 channels, mapped at 0x(ptrval)
at_xdmac f0004000.dma-controller: 16 channels, mapped at 0x(ptrval)

After the change, the information looks much more informative:
at_xdmac f0010000.dma-controller: 16 channels, mapped at 0xc8892000
at_xdmac f0004000.dma-controller: 16 channels, mapped at 0xc8894000

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/dma/at_xdmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index ba25c23164e7..a4188046804d 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -2409,7 +2409,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
 		goto err_dma_unregister;
 	}
 
-	dev_info(&pdev->dev, "%d channels, mapped at 0x%p\n",
+	dev_info(&pdev->dev, "%d channels, mapped at 0x%px\n",
 		 nr_channels, atxdmac->regs);
 
 	at_xdmac_axi_config(pdev);
-- 
2.39.1


