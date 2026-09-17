Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6DEC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hM97g3YwfaEMx+8bFnA6c/zdlSKLtcHR34v1IQ2hIFE=; b=Cv0CLkBSE2zOX6DOh6J6uXq+JM
	5OhOhbCUEMaYQmDofReifwJnvFcHs2NlraYM6QvnPNpV/S32XGVpwDGhnzBFVTqxtSk9vGuYfh0+h
	H+FhMXelCr62UgXaQEFHPLn7HmOk+sdFeWMdsb/80jEXyAxKneMxwOU83E/NObdxLL0OmcCDlomLr
	J2JDYv5vP1QeVYYlG1k7Q3/e0iouPUmtaYfjeMtfrGx1BmQjR5HuDnemoW9qDcnWBTp/5yqKDMPWm
	pNPrAMzJs/yljgtY9/EyqAdy/CBYN/xZWfkrr2uUvRq38tundhT9O7j7sBYXcJkAuWkqB2vqfhlK/
	/KxzQBYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77SO-0000000Atdk-217P;
	Thu, 17 Sep 2026 08:27:00 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77SG-0000000Ata8-21Ky
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:26:54 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48437356d60so279565f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 01:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789633611; x=1790238411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hM97g3YwfaEMx+8bFnA6c/zdlSKLtcHR34v1IQ2hIFE=;
        b=LohzYJcAVMGrBcbWx860RflI9NHPpsN1fymGPmdyVRJAFq/sV2pk5Zr+D0MAkKAcgx
         aygTank/GqdRJuSmCEYaXFL/VrUX1WcaAFLT0SBT4nacnnApHCdn/lhrjD6fnMrL0PUX
         dOaPHdu/I5ZrYZFn+Kp9rXFd18mb79Fvf951PDwqq7fuAvdZhYTxntFtNAN8CQV7p2pu
         IVQmq53sVIl48lKdL/Xd05NPwXR+pWptqTRW9ED4xCE/PK7AcUt6ZL9Wg20eYwHTYN+J
         M+ZHnf1mzaD9u9M6I43rlyLpvSOSkosSJnzChydXiFmkdJGTw6ij1MQZ8tKxctX3E18r
         SMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633611; x=1790238411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hM97g3YwfaEMx+8bFnA6c/zdlSKLtcHR34v1IQ2hIFE=;
        b=b7uKzMPr9Y2MktBjqPXcAeCuGS8dMmCa0KjONvoPATw5T4Q4cdRi5OfW+2e8EsRdng
         bigCnpKoEfVCqMUGrt1yYlN/e2YhMXkmxmtvnemH3SPmp1wT2Nt21KUqTWBDJQTjSv2G
         VoNh5aY00q4cvGjVotoDmQ/9ZQSIeJ2EYy2kFadHcaj9GH69DWB+WMk7PYAghlqe76Ws
         HRasdCBj4ujueITNs1vmlidavzxeWgHW6L5zZcquMLTKC0FK0XIjWT/xl+oQr99EsZ39
         uWv2a1AnvB76EN4fJTN8jTfgz1Omf9WvHoEqcmKoT84Y1GFzQFbTGM+wgo7y4J0NLAKb
         eQaA==
X-Gm-Message-State: AFuF++m6K7uTXHuOm4z9KK0BAvIvXx+cEYNpu7NzDtPc/lmfnW7/sfsr
	MLw9TTqQLuYdb/HUJWnjpswMedXi3tffuedEe6zvRdV43JOHPQUeXuwrudOLtghZVyH/MPZXDoj
	P0DxLXr4=
X-Gm-Gg: AYBFou2qVufQNCTFpHn1TabE/8VpBrYLedrnHgDDOHDrUagcxgQtymEWbmtQT+NH1TB
	wz22HtJ1FAMjrxY9i5GZ4I+aWyM+E47mJ7jYZfiCKg85XDE+5r+9kXv70/ljNgFrFtFxHb6H1ji
	m8aaqy5ya3KTo1TRg+iMCfFz/EWLUinSz4alS8eIIMTRGcqhInb3GLBJy+3h+ZStGqTmYFPs7Qd
	kavl+9qJooyqdDAn9V72mgTjpf6hhoqMuYA5R6WeikQFzik9opdB5XySP2D2u4DnaLyHUaVAKDM
	CjZBHE5cyhBLOQoBAbS/F8YcTCCAEi+GT3XTUu2KYW5j2aagzNMFEBgucx0tKS8fmAT020pjgiU
	VzZvOwt15X3jXVLGo4a44q5QRs9ezFC0Bgjvx1QGc+gaHBdy+sywU6AXRhViU+DObVt6mZlhIIV
	5besxJFAMW9me23J6JSD+1ZL+RfG2GcDdiPNPrrgkbNtKQmJMPEOt+a6GraiXdv+ohfQY2+Sq9e
	ffqtFxhoelH7uQucjJkAU6wMZ8kJqLVyKCt
X-Received: by 2002:a05:6000:2312:b0:487:355:4619 with SMTP id ffacd0b85a97d-4870cf273d4mr7343829f8f.4.1789633610892;
        Thu, 17 Sep 2026 01:26:50 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm13420395f8f.24.2026.09.17.01.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:26:50 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Tibbo
Date: Thu, 17 Sep 2026 10:26:29 +0200
Message-ID: <20260917082632.626614-2-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917082632.626614-1-ag@ffroot.co.za>
References: <20260917082632.626614-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_012652_522655_BA81D808 
X-CRM114-Status: UNSURE (   8.86  )
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

Add the vendor prefix for Tibbo Technology Inc., manufacturer of the LTPP3G2 board.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4a5cf436eb14..caf07095144c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1724,6 +1724,8 @@ patternProperties:
     description: Thundercomm Technology Co., Ltd.
   "^thwc,.*":
     description: Shenzhen Tong Heng Wei Chuang Technology Co., Ltd.
+  "^tibbo,.*":
+    description: Tibbo Technology Inc.
   "^ti,.*":
     description: Texas Instruments
   "^tianma,.*":
-- 
2.53.0


