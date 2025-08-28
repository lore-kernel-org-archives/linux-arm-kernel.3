Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6087C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gr8F9oLlUMXE4zHvyjlznjcTWEkXwUVRTFmLoor2DC4=; b=2mtCx7gNz4oHfW6Uz2PSOG3CBs
	QiI0sP0+GlNbFMCeRoCOiPtg/pktyVlQQxPU/UhFO/Z9RxxrzzX9OKkhQNJ/8J/BevTlwj0NvAKRW
	SPbq2+KXEDIq/smrTJaGZc93yHXKiB0kyEO3oDzCyzI88hpTEy8t58frWXt+rd+PpQVS+LR8GYaSQ
	1M5E+YgnXWr0iobQi38YWRylK/NIIqos9Yavp708qoM1wZCF/Rkz+LXAmHOvVPhPytLZlDj1cpk0o
	9aX8zHb9x4Oj3xP78uQkFzaeDeBe0/USPBQa0ZvcH/U1VoxABXUnxmohdqoKjrq8y1HT53+Uf53ld
	wc1ecrkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWI-00000002o9E-2vqO;
	Thu, 28 Aug 2025 18:38:46 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcTP-00000001hJu-1gWD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:15:28 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb78ead12so146394366b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 06:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756386926; x=1756991726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr8F9oLlUMXE4zHvyjlznjcTWEkXwUVRTFmLoor2DC4=;
        b=Na5ZSMMS0duMs/D7tpQ7IzYr3yC88eos25RReVzSjAUhMst6u87r6blsXPc8iB3j+z
         UGYoRPOOO025cfM7tPTI4OQbfW/7HIj+BiHtOHWe9fpRPLOgju7zdE12BNO5/8Wl9jjr
         sjtJ3oyAkbJ81WuKaD3QtsrEcG7aKYJChLwm+e9XYLnVWHx74uTAPHVM445RCbmNM1Yx
         tgRZM2H/bZTZLKUshUGvYVS6V18ObrRlEZ9O2PJzWb7vLs/UxMDdLFj89eVSv+Gc151M
         4qapeED/OQgna3jFpYJmR1ViX3ajZ2e/N0gUlcQpsfW7fx2pcy8f3U0XTr9MuFYxZACr
         hycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386926; x=1756991726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gr8F9oLlUMXE4zHvyjlznjcTWEkXwUVRTFmLoor2DC4=;
        b=DqWeN/8uTOdAgGi0gwRCe33j15nhIxKDcLwqGcoavcqXxxXxQWyAiOZZUTeHc9nILQ
         MdcxgqiGn3O9hIT3X4+TtXYgUUbts3PKBIBLeS+oMCVbBYvO+qqmHW9Uma2Zs3gRu2bU
         khBShGOh5ae/fTsgU/vEZXln1xAq1UZ/eLlQhy5EVAI7IVGbyVC/cxu4lrQc94L2iHSP
         SRG/kaQfDnLm6jGuZqeZfjDXgN0W7/T/r78Qz9lppbRnwO+8lBWUnUcm/gkUMAyEy23L
         D5STbt8MkDRu4y3Ovbhyzbh1l6d6SANmXr2XRhthhRSE3WGAGZdJ3/taw94VwIeh4Ozo
         Y0IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKTMr8BjjCJrTpQcKS+XGmZpzNdhWpxgQJFvcNyyfQjBI+E+JuZ2OdTocsT1jF8qanKwyXzvTEQpOA5lSqVZgN@lists.infradead.org
X-Gm-Message-State: AOJu0YyjbEYNrMhC/iSCcKNYSIp9cr/EltyvKNJd3Fm4z2u9vwz4JJ0n
	xbtC3GaujgrJZnmd4N3JdXmiVbF0fJaKhiaIipUpiqY+GbNumuP7ZNw/UsrnwBcfFLY=
X-Gm-Gg: ASbGncvFmO3rxfodCxmPp+ufrUjv9jQjhExvXkiJ5mq+ny9WD53p9JeWAePqhfVvWdJ
	6x/Pg4yD2u/P5qPXj7jyDlyV42QIDrFnWLEyXXVB/wlJwOM8bUzIK4ZtHK1nYkPCZrsPlMOv6jW
	/HoCjtlZi++0X0huAL3i5Z95W2iLL9PW1m4yb27iP3yV1f/UFLJuvvORWXe1VLzJOYO/qGfniH6
	o02VLBhDGo2zb6Qce/MDbT2v0R9GztWqdUB1R8ECPxJ2/VllxQ528sFLobi1ZRPbkhrcVazk9Hw
	23lAgr+7kQk+QYL+DzikOBmhMdPdlFphGN/KkB+SUy8gsmhPw14ZacDp88mkcoGWekZqDXQxtA0
	pVLxALO/GtXRRcNcFinS6JvXs2Arofi/OklN/AtTxgC/JQnatF0zYh0U+Ko5Obo+aHEu6TOU1OX
	f4xABMnVQlgC+GjyOl
X-Google-Smtp-Source: AGHT+IEI9YD/yIKwxGzebC+FCV1SyBTlu4bST+Ltd9CEVkIOaKvOCGIoQzOBpgJhki3SAdvQXPUT6g==
X-Received: by 2002:a17:906:4fd2:b0:afd:d994:cb3 with SMTP id a640c23a62f3a-afe294d3edamr1890495566b.65.1756386925746;
        Thu, 28 Aug 2025 06:15:25 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7ddbf166sm895554666b.78.2025.08.28.06.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 06:15:25 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v2 1/5] dt-bindings: mmc: Add support for capabilities to Broadcom SDHCI controller
Date: Thu, 28 Aug 2025 15:17:10 +0200
Message-ID: <181cc905566f2d9b2e5076295cd285230f81ed07.1756386531.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_061527_441421_562CBB33 
X-CRM114-Status: GOOD (  12.38  )
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

The Broadcom BRCMSTB SDHCI Controller device supports Common
properties in terms of Capabilities.

Reference sdhci-common schema instead of mmc-controller in order
for capabilities to be specified in DT nodes avoiding warnings
from the DT compiler.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
index eee6be7a7867..493655a38b37 100644
--- a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
+++ b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
@@ -61,7 +61,7 @@ properties:
     description: Specifies that controller should use auto CMD12
 
 allOf:
-  - $ref: mmc-controller.yaml#
+  - $ref: sdhci-common.yaml#
   - if:
       properties:
         clock-names:
-- 
2.35.3


