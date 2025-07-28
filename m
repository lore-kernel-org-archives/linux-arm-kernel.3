Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714DCC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbL/s7XfG5xt8Ti9QG9pgz/kChTPn+PeGi5taFv6Wts=; b=Sj6qS8hAKcQZwj2gzB+McoPU+Y
	9k4whoBr3UKtZZYZZnvopWtKwZ9MUyBRONjLkGhSboOjSvt9Yzr8bnMHknT9IITJkNO460nAZFVwi
	BpLvn55NelHWEoDJwIgBDEtxsgit8V5GlwzKXLXHHlslZ/a4H7Z1Ydc9xZuv1kFNAj+a+Fg6WNnYA
	5j7++/n9aabssGs84Pr4j9TMDdj98ACqb3bRuy+/5cBZX6dcs2L2Ca9A9WQ2ivu1nBVIcs2BTFf0S
	Qmg/afTHsFGhercxTfRFG2EUG/hZJz+OgqEGdC44GYCtYCjiMPuCeY1znao/bdh1AWVff2tSki+rD
	MMHUjz+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugH9T-0000000DkGz-1Jr9;
	Mon, 28 Jul 2025 06:15:59 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGqf-0000000DhMs-2CVK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 05:56:34 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2402774851fso6266135ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 22:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682193; x=1754286993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbL/s7XfG5xt8Ti9QG9pgz/kChTPn+PeGi5taFv6Wts=;
        b=BwZ9zCzR7LRYa0rna2t4w1gjUwQpn0kFTOh0+6P5GXNSfhubKIAYDYeqfYdf9D62b3
         s4UJUnwO/tGN+/c9R5c/U+O8dvJ6s5lEXEvlXGwHcLbGzSqfXY8GdrfYaGmhlkFSndSG
         CYAVbAAMNT1GUH5uAKkI5qLqTJwm6JDe/EAcMITTUs+pAlBjWiyYwBLWcOF7g3r9pfqD
         wUpEb+ZDeK3CuuUxQEP23F0Mxcv7Slj6tUoxol29i+bh5qlK/BYcrfavuArGobXxKFrA
         UGVdPjkwHHiOBnnSGxCMJ/oKkxmITo0o6fdXGxWq2CkIQztAcr3P7C0oh1wOrPBcD6Jk
         11yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682193; x=1754286993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbL/s7XfG5xt8Ti9QG9pgz/kChTPn+PeGi5taFv6Wts=;
        b=nnRZ+9r0FgNonQDnhJ1O8NLRppAyiC+dF6c2G7851VOGXvDBIQcj9HtcoiYB6JUe0Q
         PKGqE7W95N3BceX59FJwiZOlWzsIvFi6+0ruMDCOwIK4P6GxXy7+Z0P/w6Bup8Rnzw75
         YwBAcveSYn2kNIAQO12st7tfGGa+ZAzRwHijAElsFD5lP7eSnDcw1WsOtNTH5qAXFuWb
         fqcHxF1LTeRTDCta3BIvpIL8rrnCnD3b1gqS+ClLZgh2aGRGIGGe5jxPPwBV80pdcKPd
         HoFzZl9WqVKM33/RluS/cHAx/sQTTEeRPmtaarV7teqTMUeu6uBmKTrzjOFquepbAxVD
         YaIA==
X-Forwarded-Encrypted: i=1; AJvYcCW6BMMn8LrCRCQLjPjIhxCjuhJlHbs7NWXz74PWnGbN42MOulUksp6WMAiWwg1T+vkrYxpxzClDku19mbh1b/tF@lists.infradead.org
X-Gm-Message-State: AOJu0YyrMyKA+GffXoy441Hr1hQSDFulcVzr/3z7Io2mupTTNRa/yvN2
	3AupSzbrwKoKY9cRI9v5nkf49GhLrV2Vawh3ijcewvT4Tv+Op6kaH9ihES+mg1Ys
X-Gm-Gg: ASbGncsu9Nt3A6Ag0JCudhe6IpoIGuj5JzSm5r0ekHkhZZcdLrXYMCzEyglpK9KwNRH
	uXStjPa+tCiz1MvtrC+SP4rXY8wkaRZWWeNXFmBCsTczPxljuiy60t5PAHHAvoQnLPkP49yLJaR
	tz2ESuzFnnxDidwf7QBQTitjJI8nBM0bBWY+IpZhy5f8D+Kp7qFSAEiU2wh4B8Iq6nrq6a6pdCm
	gPmaDGUvI8hhFxKIzXR0VfTO06XGhX+lCNDTpJt+4ntMsVQ0dOKM4tIf6tfwwhunX+HTt9Hk0np
	1l9XUsxC3Ft3F9/iWbKJW5l9/hMTvzUrbCd6+GagrHj9IWdVSMzS0T3OPNQypNcIToDuJrTmafb
	7KDQjp1TdAnZlTJi+ib7xUWZhZxxL96mzLwUeqe/17qssIZKbWhG+5DlSBfHKrJF4O79nSLJnij
	A=
X-Google-Smtp-Source: AGHT+IGjBjOZSuFuT3oqj5s+Dx4Lmr33TfDS+NDJuKJg8oPiu53W+GX6Z334iGOeg/ZkK+U5oI36SA==
X-Received: by 2002:a17:903:13c8:b0:23f:adfa:3a63 with SMTP id d9443c01a7336-23fb3021609mr159555545ad.16.1753682192519;
        Sun, 27 Jul 2025 22:56:32 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe514b59sm45091795ad.128.2025.07.27.22.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 22:56:32 -0700 (PDT)
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
Cc: Tao Ren <rentao.bupt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 06/13] dt-bindings: arm: aspeed: add Facebook Wedge400-data64 board
Date: Sun, 27 Jul 2025 22:56:08 -0700
Message-ID: <20250728055618.61616-7-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250728055618.61616-1-rentao.bupt@gmail.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_225633_573866_E4F51BDB 
X-CRM114-Status: UNSURE (   9.85  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Document the new compatibles used on Meta/Facebook Wedge400-data64
board.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v4:
  - None.
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


