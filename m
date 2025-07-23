Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D653C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 23:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0GTpnFk/bVgaaL0uc3H/ZWhqid1SYz87+1rRrLNxfk=; b=cglDYTp5nIXF2gsad5kVqUbng7
	3gEv0t8JBhg1hw/d2UPjqc+aTPQ8XlZtoHd6mj3c9+qDaYIRwWUfuqBmRaaPD2zjX9wrj0mxJXjiY
	gBgeSKGkaLvbDwbkTAFXDQ1PBEvJOHfx1FaQz7DnzFZraHzdORpvBmHJW43H6nzjEReJWAvCOEISI
	nUedXmCjgACAn5V+NS8zm4nKu+ogrzWeKM/49TQlv98cB1doAU3D/SvaF7fmhXYwcrDCcrqAeGW1e
	bmqpeNlpC7P4DGxV/3/Cy7J9vxxESvpkBDHuyipsjqGS4VjK9Akq4a56T9BaPIVjrLiXjXJ3jmo07
	ob1N7CjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejBd-00000006B0J-06Q9;
	Wed, 23 Jul 2025 23:47:49 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueius-000000069KO-2aA6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 23:30:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-235d6de331fso4436975ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 16:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753313430; x=1753918230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0GTpnFk/bVgaaL0uc3H/ZWhqid1SYz87+1rRrLNxfk=;
        b=JQ3LeWqAQc0Dl2C7kRfh60PXdL30E2Oo0fku0WsHQndc3AQ1elzWMbbrnmOX/mwz4/
         kMYaQK/pCAt/R1xJr7tVoC4tXWhPgQyO071EpbkZlUQ7Ms+LhfAxXHKqEPlywRyqCXUR
         ZT1W6U1xDnwvybzfk3aUsSQYWxA4qymjyrJRNDNTNRxb5GIVQGYaT+9kdk0AMbs8hYW6
         gVqQipOT03VhGhPAaPk6ORqD0BRf3Ck/kt4bJVb9qYkfACyJiRWTmL/I6FSoNyuxGfS6
         sHouLTArPAw/abSovU7jQm7sg8mX1qzN1I/yfcm/MIKjb9Dhhb4o2eBAE6hiAj9zumKy
         3B7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753313430; x=1753918230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0GTpnFk/bVgaaL0uc3H/ZWhqid1SYz87+1rRrLNxfk=;
        b=CTZDOVXrwwnSvNcg0IHwaAKIX5XMpATduEU2YxVPjVSMV9iC72rqAXjIDEwiy3ybBd
         AmuTJZ9QgbFQUd1o7VQEpSNdq26KWR/dCx7BFtvXeJoPzkvfkgJdprcDsp4RzoduZdmo
         LJFPoDHh1b7HXsFKa/30lh0u1elAA3jUlqQWM13YMjgNCxjKyXKRljLH+5Z8VBWsYnGV
         EMPnMcrsXvf2HHusz7mq02txRKGtducuLhVLvY+F3nX0khNFBBdousW0TsmynHwRGR9v
         Q9PBh9rN5MDk9mfgJu7F2uyAGFHDp2R0Z+OfGWYVC+DSFqWsbVIjtBc0gRKIoGeAbId5
         jzzw==
X-Forwarded-Encrypted: i=1; AJvYcCUSn2Q7SYtf7x5KPADXbwKXWuXt+/QCkOe594AUT09TaqKpHLfDD4y7F2ZSzjvMbCMSpZ/A+hMuSQkz1k44u55s@lists.infradead.org
X-Gm-Message-State: AOJu0YzxliazxkPq2IQ95NlGomfofp4I8Z7MC9ItFBgHGtaTasR+ZLol
	9JMnJY703zjROj23as8QhsJNr5HCN9gLXkoyxuJoG+jBMMqRr2zN9QaR
X-Gm-Gg: ASbGncu4eR5i3spFUl5Xtzfx/+plKJgJL2BqbOhXUIc8yqshdHvseyry2QnmAr1IDOp
	g/8Y1Wc1+oqRnNenZfvBx0iil6YM79RoC4f5jwfM/jZTOXKYh/N54U+jmGHSE9zAgb2svfpKf3w
	5ZB4VmeKhIPVVNYtC6zt6ZHqEuBE9mBGE7A1pPYmqS3OiPXYT46xDuigrwlWUgkVxpchjEx8DXs
	ttV3Jv5s/aPbBDQoQl3Hvj4fNtWl4D6uNleuMB52UkVVYpOoXMvo7TGBPxLzQjABeQKwghvEjqZ
	Z1aVix7CfuCmCZYQ9x/RtJ0yF1PAXcehAGQX+dHPk25QIHvZi7qSNpQzwUiynkhH1aoua/l8myi
	d8AAj4orhxEfvrCDexVXERNluvHGlL22kFLgif8/eq7RGbcPKq1GkNo0mHe6janGzVAav04W32I
	c=
X-Google-Smtp-Source: AGHT+IFcQmIgGW6y7P89Tcy+OQuCYio6ZcoUtY2+xTcgHdOpWxirQXUIq6CUl1omDMrL8MI72xV40Q==
X-Received: by 2002:a17:903:283:b0:23f:8d6a:8e32 with SMTP id d9443c01a7336-23f98132957mr51684445ad.6.1753313429797;
        Wed, 23 Jul 2025 16:30:29 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc6fbsm1260765ad.120.2025.07.23.16.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 16:30:29 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v3 06/13] dt-bindings: arm: aspeed: add Facebook Wedge400-data64 board
Date: Wed, 23 Jul 2025 16:30:02 -0700
Message-ID: <20250723233013.142337-7-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250723233013.142337-1-rentao.bupt@gmail.com>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_163030_657929_7AB6579B 
X-CRM114-Status: GOOD (  10.27  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Document the new compatibles used on Meta/Facebook Wedge400-data64
board.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v3:
  - None (the patch is introduced in v3).

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fb..0c9d6a30dce0 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -46,6 +46,7 @@ properties:
               - facebook,yamp-bmc
               - facebook,yosemitev2-bmc
               - facebook,wedge400-bmc
+              - facebook,wedge400-data64-bmc
               - hxt,stardragon4800-rep2-bmc
               - ibm,mihawk-bmc
               - ibm,mowgli-bmc
-- 
2.47.3


