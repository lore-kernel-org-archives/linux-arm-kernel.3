Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31547C55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LX9tJPPybQG23QnWol+WkuZghQpoeotorNVxrLWGsFg=; b=gqTWa//enCOh8NwN4x6mrqgbe+
	uyijV2Ka8Ehppe+MvKO5wcxw13SbfmZdOo2b2w1RAP9Cnj8UD1sZp5F7NphcpvehojE8eddFltXKt
	XWTi+bDnGsyeSpggTedPFSE9FfAe3nBk25apyoMB8G1EGfkF2DrEC6dBzh95R4fKnNNxRkXA/qdUG
	zgu1si93hAYUHESRN8/UWaAQ+kjRgcjKB00oBmm50cCPdGueuDywuDY3J+t3Ac5rrXh1GPVDhZKT5
	D5U3MWFtvQyDmDFP4UWCg+Be8UkQZNst8qf7uh8OHpH6n2d5Wi5GBRljqEBxmfObaaJKhGZHDpp5S
	2kRUgDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnQb-0000000GYnv-3IAC;
	Mon, 03 Aug 2026 07:49:41 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnQZ-0000000GYn3-1Oza
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:49:40 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ced3386430so30502175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785743378; x=1786348178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LX9tJPPybQG23QnWol+WkuZghQpoeotorNVxrLWGsFg=;
        b=lH2wC7rIWVx1WWOx2lKqmvCXRviiRxHdpke25POjyXR/d0epYZ8QewC2nvHHM0o9qz
         gdJ9/YWICEHpsEfOP5y6jVhSRIfcS9ECgyLx5iHiCNILVAMOkoFSf2gHahHsYkCeMmuz
         ikPqpJ5b1z+H2EJoiZNYZHbRFFNxoJC5TeCVS/yEbwRsxkTQH8QhyeB2cQEvAmaA68PT
         DG+GO4xdRkjtBO4YbFbbEH9G7DghI6OdDpmhTHoO1VTScLph1ZbrN6jMEyW6o4JcJLUl
         lv58D6nA0zzI9Iw+LCHTRPmjaNUpJykFVdkdxlTZmv2zAzrB4Q4ZEh6XDynhFIY+wBre
         90OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743378; x=1786348178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LX9tJPPybQG23QnWol+WkuZghQpoeotorNVxrLWGsFg=;
        b=aSMUstNknt/TFV8Hd82b1pIrZ/HLBWVzJkvAG3Om4quPobk980u2qon4/KQYIrywje
         T/ssYzCePunU1Tjz/nzY/UY8soNauHkhp41izZnwFqf8Fplf1YlAHHukLIy4tfY8c5kt
         BtSehq0362A9wxtWIQ1jOFT232YlG//nz6do5Yq8SeE9rt8SObngaOK6gcNjK8Mp3BV8
         BQZo7Dn8R4N2P5CxeLD01zHBePqJgLYOk6Fjm8GETkfhyQKYwq82AcwJuXEuSIaTy7lL
         hsAqoUDw4PND8P02YIcK4g3rdOW2M9RZTMisyJc3Cedsb7Si/XlOU55hLC2FwwKIhUoE
         4wYA==
X-Gm-Message-State: AOJu0YzWiohY7RN+uNykKIi8Bb1j5nMaO0lhJY1fj7xCaL04sWVkAs+p
	CvKKQamt7y+JqT+FjUZoTNUxIyjowOQv62Td7n7+Dva2xA3UV5fjJKNI
X-Gm-Gg: AR+sD12dNrIyl51u7TEzQsK0yYSq8YIbIM6NiF2gcntUMj3zXkPmIcn2a6emxhOn+2t
	SgVT0r4bzhEhDf8X5UGtb1JfZCBG1sqVKBKBUOjq8mBzdliSw0W0kRGoqpgPQqUNO/p1L194VHY
	/vU9uAPNWW9IxYLaVrFSsm0KUkYiqgbioVXNlUoHrjFSS4XA5Hc9WPCE/hiq0m5wdaMAb7Kq7mK
	Yjt2WV5s9y/ugeFNZ+5oSLBJ4ehUHEtoTrzNwema3SX2/aVYejKSLK/9OLbrYMFVDSrhtQjRMRm
	GjdBOurRKGBYKHzkUM20dOBDuzDbDtXRLVIBTdr5Oj2CmDpCCnrunO6TKtLnha0jNrYmeaOYt/e
	3iwuzxwM+276q7d2ar1GbN0XC9DgYUTLFSWnhftuABt98it3It1bJ5/QeayIeo8czxyDcnn3CBl
	iEBN36j1rJKgZt0ubHgQitfFcWef5ooHpbcWhEjQHAcVoWs6ae76aPErzlC1mIkAhpoh0Gy660H
	LoNUL9VwCMy+OsVGcI6y6fvyaCZY5m/SgdAPT4cuDI3NsggDpPnok3IPsBWjQ==
X-Received: by 2002:a17:902:e5cd:b0:2c9:97a9:2098 with SMTP id d9443c01a7336-2d052421484mr95275985ad.44.1785743378231;
        Mon, 03 Aug 2026 00:49:38 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b120f2fsm33679845ad.64.2026.08.03.00.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:49:37 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v3 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Allow additional GPIO chip selects
Date: Mon,  3 Aug 2026 15:49:12 +0800
Message-Id: <20260803074913.1656675-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260803074913.1656675-1-cwweng.linux@gmail.com>
References: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
 <20260803074913.1656675-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004939_377797_222931EF 
X-CRM114-Status: GOOD (  10.66  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

The MA35D1 QSPI controller provides two native chip selects, but the
generic SPI controller binding defines num-cs as the total number of
native and GPIO-based chip selects.

Remove the maximum value of two from num-cs so that board device trees
can describe additional GPIO chip selects while retaining two as the
default chip-select count.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
index 377ccf4fb224..f837367e6d5f 100644
--- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
@@ -30,7 +30,6 @@ properties:
 
   num-cs:
     minimum: 1
-    maximum: 2
     default: 2
 
 required:
-- 
2.25.1


