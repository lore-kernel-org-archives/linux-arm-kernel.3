Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B9EFC5911
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Me6/gMTEz3PAlgU521S5bAkTbmNg6yXoSMbtj++gb3k=; b=GUaJMdgYlgGhP8TPGN1iDEl3EX
	C6xyLGT5XaLvH49QD0A2VVl3D/p6shKDRKaW98j13ZZRc6+PbHlhmmpvYqhReiHKa0moi1sRBituH
	a/k5ubM+jaElM14CJ/Aa6jS3MoY6DHeJBa72jogqEHV5xEDjGHAI/XBJri7izNBmKEkaCJzTB6srf
	zFsLpW+7JZ5VA0jdd5gwT/gPhYVli2/rtyJ+5msdcbGjfykBVjR6qG4gMQK20mFTsMNLEQgSKkeg/
	b9kvm5hFbgdyD5drfb3HeJabysNrWdZ2vByPQUFAfcn9xgqbnPq5hqynGAvDKDyzJV0tToja+BAy5
	zSFDr5Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX3W-00000005hEl-1CUY;
	Thu, 26 Feb 2026 08:49:10 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX3S-00000005hCa-0pk8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 08:49:07 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-824a829f9bbso352497b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 00:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772095745; x=1772700545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Me6/gMTEz3PAlgU521S5bAkTbmNg6yXoSMbtj++gb3k=;
        b=PXLHd5zQW0uPXSr8lElH+mu/KsGMUlYlRhxCc6Sx5N9qIonSEVVRzNUCcvHkWhS6yN
         pEPXSmJ/xHHPEmpvKwc+8s7nAkq8iGSKPUKr/30xHnH+I67zLVGoa9Xl6aTOK1BAmQuo
         BbbKbUzwKDtmLdKlJ8q2eL//ipvHw+mJpBhO2Tm4thsKV9TQQc3QlWHLWuOOW4oDp3TY
         rIazGkR/lr4w6vCz69SUFgpzBvHAu1IUwlPsKh0kPlyAsYK0URoz8thlg7ZijEWE/dcp
         TD2l+KbaGocXBwHjaxxhOaHastHRKeyPid6jGtn5Mwo1pBiJ3KddzXeiCLjjet1CS4qb
         BWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772095745; x=1772700545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Me6/gMTEz3PAlgU521S5bAkTbmNg6yXoSMbtj++gb3k=;
        b=xUInUzyYF/Ww8GOplz2s0FYyyX3/NUA8jg4BYiGNlRDm+w8Zf0I8hCY8qYX1EkXWpz
         hmdABLC181TQkyNbK2ZZ63tmbhLKfoUPIE57arTyCg6ZLSL173HDXJ50Woi5FYMgXjIB
         rYMRze3JOxq9p6RiTrCvNj5PBL0WoQMOd7xtNmKcqYD5DCNseM0tPIvpzMk5e4Pc0mgv
         7IlFNC8t9gybycVL6ERzxFqDrQwOt4mBeB0QRZepq1RNmDRB6BvsaSIVF5GIa0ia4e0W
         37B+QL4iKNbRnuSjuFCjmpWV82Hx6oqRms6HL7IJmvDpOEOeMEmZHrkK9KgmgLEHOyQY
         mIUA==
X-Forwarded-Encrypted: i=1; AJvYcCV4+Bx+s6yYwrrWOlzZQI0oVzACtQBAHeW2OZ2ja4okwaaJ78mn0X8vrycAi3zZEpteuxVnSkxJ949qfxYoL/Ul@lists.infradead.org
X-Gm-Message-State: AOJu0YyyCzEOc6xI10sAMqV1VgIVQYtPSyPEP2Vayg7zaIRYpHwtI0H1
	ZA1oKJXcpIftLFMWV6/16++zWykaLqLNMfUlCbYvnCqBBIzPxqn/iuE+
X-Gm-Gg: ATEYQzxvNqB13iVJxGmJRCSMoMY3KQoXB+Ljwlubz6Xlg/Sur3ruJhICkSFAfkH6ZIS
	8P2/bE9tTsG93J1Nr+y3zjPMcH5JCbVZOeXNdHiz3vukxKqxoscomHq89G4BLJAPonEh5IagvZf
	cbw8HSMk/EVW5hOCXQYcEcQ5/ms5Mo3XLLlrydqw5bFqzLvkbqzaV0EcHm8T4+qLi1ERuVYohkU
	KlrSP7yxF1uthf8Q8/HlmQxIICvRF14TRY855Df29NaLXisA24OMiDMmTDb+s4acf0SqbQLjAqe
	eEx+AByTJ9XI+jZt/cseR3ojc/kWAw7n+KXEL4xLS9OR/z00A1iFgDnMdqj2ayMQgzk5JWVIAWE
	Ra0Yeohyj7Cj4me/1ZQM+1m40VKozB+l3QhALYFxkazGpb4IqmaNOzSa/THwEAyLdSakk1RiKge
	GBHuzZCC0bjkNlYundmKcqy6b//c7xz+XBvVKN
X-Received: by 2002:a05:6a21:998c:b0:38d:ebdc:3558 with SMTP id adf61e73a8af0-39545e2f265mr18580124637.6.1772095745577;
        Thu, 26 Feb 2026 00:49:05 -0800 (PST)
Received: from arch.localdomain ([117.147.91.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa848471sm1342441a12.30.2026.02.26.00.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:49:05 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
Date: Thu, 26 Feb 2026 16:48:46 +0800
Message-ID: <20260226084850.417731-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226084850.417731-1-jerrysteve1101@gmail.com>
References: <20260226084850.417731-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_004906_244629_5F9E40C5 
X-CRM114-Status: UNSURE (   9.62  )
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

TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
infrared input.

It was released by UQsoft as a blockchain-based terminal and is
now discontinued and no longer supported.

  https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 9e4627f97d7e..8f6f30f683df 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -901,6 +901,11 @@ properties:
           - const: allwinner,sl631
           - const: allwinner,sun8i-v3
 
+      - description: TaiqiCat A01
+        items:
+          - const: uqsoft,taiqicat-a01
+          - const: allwinner,sun50i-h6
+
       - description: Tanix TX1
         items:
           - const: oranth,tanix-tx1
-- 
2.53.0


