Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7302CC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 05:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FDIEMHgS7ajFHvH9Fh1sd1G2DjnILNUgFqu1dUxQhM=; b=zt3MFwA5Hog5yBMAZqokYGDFVT
	HT9HU+33AepSg0WMk11l3iyJYCcnTn+3lonMiCSlygkHj1cfQxS8F0k/TONJdglIBpDXPen/LGAWh
	7+R+uXbETgKKydS05BU9bs0zQW9apgP+XvUufguTVZdevnjYJcRHFLxNilOokLrp0pIhRaGQ1CSnT
	M4bz9DpiK3rcbHhURB4icC874RBS/zvsmS0HdiLOZ4x0W9UmBcfMcREb/WQQnHdjhHCTpTqLS84Od
	xm6f+WZAUxFSzhxzQ7G6oI9JyfMEPk/2xZHFUBe9UzRK7whfta0PVs0wZXXYsyDsMLPgAXjOM27Ul
	p7+mJhGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUfaG-0000000Ag12-2Tns;
	Thu, 26 Jun 2025 05:55:40 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUfTT-0000000AesW-27hx;
	Thu, 26 Jun 2025 05:48:40 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e733cd55f9eso477070276.1;
        Wed, 25 Jun 2025 22:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750916918; x=1751521718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FDIEMHgS7ajFHvH9Fh1sd1G2DjnILNUgFqu1dUxQhM=;
        b=Op4OWjQCtuMU3cfYAkW99NoB1x/dmKxuBBDkWp9Rvz0+BSpoC8+3QadNx86GMLEnZw
         /rDiORo1Fz7i8rVRIaFki9/6VGd3ThOWNKBtH6pauL6Rh/orUagBlr0mHtTsFlnckb4V
         SvCAOZTWvln2l/ObQEYX5eoPNrj5/9erJKRkah6OrmieLxikzVf62djJA+y7dmLl2bF1
         O/x9XvqbBKDdUHxKbEo97tWQEJ9YVsledgoPtamUjHz2MgI2WxK3GLKNP0Fc7dJFWB+z
         PW+XFN8xSva58wMvUv8pDr2nEQshgd7Vvf3Wv0XTDaGoGY4S4ftAOJJk26M7/zKgEzTi
         DOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750916918; x=1751521718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FDIEMHgS7ajFHvH9Fh1sd1G2DjnILNUgFqu1dUxQhM=;
        b=sz/p8nv4oWCQPKo0c9dFT55AZDpA/X2qD9r00V+YYou21fu1VCp2A2hzRbVHdzKuZr
         TQI0KYz0OW/AMNZ3p6yk2JV7F/cCIwFVVZ+zqwr6Ok25I1lV3EgvKjcq+CKdfW/ZmtTu
         coC8btV4zeJUjSmB1TwmE0xML3KddQGMS31jeyqPwraFVzmUieGHQIzt+AIjk7RygVJs
         0MZGOAn/olmhpcgOeSkhvWS3hcsLmrJgLd3G/qHF8UKONBaTdDzymXp4f8VXnIx6c09x
         zYm8U4QrVNmOe0fnAGItFni3StxtvK9ARW1ZAqR6uCTXGmv9lwVZLNq3ieLAFLK2PGJ8
         eySQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAEtXL3+7R24XVGVGT6ll1CJ6wHmtIObuYZpQuvfCHgnOkTbUMq6JTAY2GjtvVyFcgpTg6vUdPfA45p+7SlXQw@lists.infradead.org, AJvYcCW9F2tNEJ5ohPuIJ3/HTv/66lXNRyR/iL288ZR8Y2uTstXLwwa2cqJZERrZiSch8jdEDLL9FgNQfkeWMb2Kero=@lists.infradead.org
X-Gm-Message-State: AOJu0Yykh3m0sBfSz7HiYLOgjL5Vf0+9Hf9qrLN2H6m7Qf+2rnkDo5iU
	SMN1rujsn0RHsV5TJJtcIsepgtYq1o4YExWZjZArT1j1VQmDnlIhlIIB
X-Gm-Gg: ASbGncsZcbCUy5qzAcISAnktsanLX+C7YDCEVA7S6tG9mvyttH9DCyITitwMkLbaHSl
	llCRDSlP98fnDhOYOqZUIWv3/7HWrdoNAmmZoFTLBKR2kWofmW7iGV3DuBVBalXvmp2+k6tlQ/r
	b+GI6pDo6e5Vj4iu5XHLTYMbUOtcVWynO2ffVBAESNxRgW1ZTwUNlTRRQBoiiSOA9XKde0eqP8F
	WqTGgEq3qsMvnd4ZjUpd6JvFI7nYKqruRE9ZZXvt40sUtkyqsf2dvVBW4rx32Tj/DeBvS2qG8/N
	EAb4gP+IZt5EXfVPDW9efGnE5nrsuwPb3qi7IQN4R5lJbMgjU739X0nPlIscVXgrY8v43WQ=
X-Google-Smtp-Source: AGHT+IFluHKTy+1TvhZm02sbj1gWxLYizB70KgDUwgLVV/tMTaczcVwUjR3mSGLC0W9MNbI3PX0YVg==
X-Received: by 2002:a05:690c:4c02:b0:70e:779:7e6a with SMTP id 00721157ae682-7150875ee1bmr39801987b3.22.1750916918571;
        Wed, 25 Jun 2025 22:48:38 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4b97299sm27323757b3.66.2025.06.25.22.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 22:48:38 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
Date: Thu, 26 Jun 2025 01:47:27 -0400
Message-Id: <20250626054728.4882-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250626054728.4882-1-inindev@gmail.com>
References: <20250626054728.4882-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_224839_544054_A4D9FC1C 
X-CRM114-Status: UNSURE (   8.53  )
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

Add device tree documentation for rk3576-nanopi-m5

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 58b9312c6c73..28db6bd6aa5b 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -300,6 +300,12 @@ properties:
               - friendlyarm,nanopi-r4s-enterprise
           - const: rockchip,rk3399
 
+      - description: FriendlyElec NanoPi M5 series boards
+        items:
+          - enum:
+              - friendlyarm,nanopi-m5
+          - const: rockchip,rk3576
+
       - description: FriendlyElec NanoPi R5 series boards
         items:
           - enum:
-- 
2.39.5


