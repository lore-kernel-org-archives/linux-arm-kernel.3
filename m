Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F2BD75BAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7y+F0NAVhdE2hhGdAP0Oqd3utvxnAK6BbO2jtHkbzc=; b=PacCawWrQ/QMzchfiQ1liP20LS
	lOFqa41LarLQaM+LnOPkItLf810m5n12KCm9HtZ+9Apth+VaIecsDJj1u++6WeyfF+oem1wyyZPEy
	tzLukPUvSfjc08WFwS/FWw0HTYEZ6+lYFI47nrv6JFlyccGafCD0ZRmkA0ZPP7+olV60jrJnoXY8H
	S4wLrfcWrDXjIXwZsn84MGB0B8TS4WnrtZxc2UgN5Z+JYmNz8sIROn2zszizzJEiejhWpz5T8HGWr
	I/PLzoioR0Yj/cbwHBQIn2EeGNeult+sg94TlHbVwTccxN9Nb4o9LwFaiaYw6SndQHQISH4kR9EjR
	6xgq7pgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQOu-00000002A75-3HgK;
	Fri, 22 Nov 2024 09:56:32 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQN5-000000029gb-3NQQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:54:40 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5ee53b30470so875306eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732269278; x=1732874078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7y+F0NAVhdE2hhGdAP0Oqd3utvxnAK6BbO2jtHkbzc=;
        b=msA0b5ouYUxdjCVnxL0Tro+MatC8gkLPPc64/6AYhaQMQzEYgMffT8yvNXRfK+tg0J
         3WAnPzqoIWOSUpTHYDtHBBY4A0Ba9rGa39dZf22kaY1D2uknHoVxBm1S9BAAzsTXwgtn
         K6CMhWZUWEPn8lKlG9uxXXq3gm9GM4gnAcLbkZoud9DtL89u3VQw+6h+X9hPhwO0DNrL
         VxD4xCo4T5w9xdEncEhcRXhtL5OJhmuCRjo4K+3l2/NxRHK+ZKNuNN1TknUlynmzMH9j
         f6g2AVIrclwCFXb3EK7hCUmOE//7JHZuTY5gr7l6C+FwpYbxKEoMKehsYzrvlAy/DWzs
         462g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269278; x=1732874078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7y+F0NAVhdE2hhGdAP0Oqd3utvxnAK6BbO2jtHkbzc=;
        b=fnhLrw0w2/my0Db+Y4piRQrtBehJI65eEyk2AGqbJhRcwP8M2HS/j12dnBg8TLxPSr
         aqSoEsWzhJIihAH3FsNsYZM9oTXQqLzV8onf0iaMJ8RHlbex0rzHQvAjsb+zNNSMyubc
         W8G4K/uuGUqOe3bGnHEFLruBZC5XS8AyODq64KYeMWgXj5nnXMbY1OksnHhFi+FCp44g
         nEeOa71RZMmfDsXeE4J265eaPv8bbWz8rja0YTPnURRFVPgREKyeCFssxGKnmIYi72ue
         AqFJA582WglFvI5OE6h+Zc1phh8Dn8Bh9jKiHjfxjkAfgjlo68I1CjtcKJQ5gV1DSfsc
         sELw==
X-Forwarded-Encrypted: i=1; AJvYcCVi8mzODBWBWISLDCCPc6MPL6+qFU+pFAjS/34oKOjwyjbtu6vPlyaw70E9m9YJwme28wxm2J6sH+w63PJ+WKRf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7JCXB2zr5rWXkmYt7rcHBOvtaiDHZg4MWzdLOIYeEIRHjba/D
	CQ9hZeG4Afc2MJ8H2x7K3zmIHfp9th/ytqXU+8JFMJXyHIP99vCh
X-Gm-Gg: ASbGncuVgbmBCsGF9aWX6d4YAnbUWxKorflTWd5qX9NsxdpR8wFgppUzBS6tr22gcVr
	wew/Li2tb4UXy99s9OR07Io3l/xhchpjfnpcrxexovuri9nF29jInjGCpyyEDd3IPx/JbYnYem9
	hI4Q8TJFVhSBQshr/iL3AfWWpU3Vbzk2ZNutBUUcVH0IxSOzlViUz4iFAxRVI86w/kTuTOEwlPH
	mpZlQMQsE/o+scOLtC/qgMhRq2YBSdNeGzVK8AjJAYCRLwf3/zXwF0JUVbMH9OPLBs=
X-Google-Smtp-Source: AGHT+IE+gh3BSpZEe1CgwhnQPRowDufm7Rsfvh11La7niwtoGa5rKSayhi65ZAq/xM9Jk3gdgp3t1g==
X-Received: by 2002:a05:6358:7251:b0:1bc:59a1:5bb8 with SMTP id e5c5f4694b2df-1ca7970d006mr180191155d.6.1732269278502;
        Fri, 22 Nov 2024 01:54:38 -0800 (PST)
Received: from localhost.localdomain ([182.152.110.125])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7fbcc218a87sm1236332a12.39.2024.11.22.01.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:54:38 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 RESEND 01/10] dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
Date: Fri, 22 Nov 2024 17:50:30 +0800
Message-ID: <20241122095136.35046-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241122095136.35046-1-towinchenmi@gmail.com>
References: <20241122095136.35046-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_015439_856379_16526D8D 
X-CRM114-Status: UNSURE (   9.78  )
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

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 673277a7a224..5001f4d5a0dc 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr
+          - apple,t7000-pmgr
+          - apple,s8000-pmgr
+          - apple,t8010-pmgr
+          - apple,t8015-pmgr
           - apple,t8103-pmgr
           - apple,t8112-pmgr
           - apple,t6000-pmgr
-- 
2.47.0


