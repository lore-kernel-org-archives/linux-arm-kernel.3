Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66197C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwv8jVW8Cpw1HdPZHR5pkIUQOrnV30U4PbqXFmi6s24=; b=F8ymVI5tFIF5B7BaB8YGD84dxW
	8g6FbP4BAlhtDEMxWfsi1lBbUQmn3BX+QeLoT1pvSePa+ACjEzT/vHtgY8IwrOuyWOJs66uVFbjPg
	TM3V0upzYorRhqCJ+zWOVDHH9f8uU9Y0pEOP0ky5kgmeRNftfW7pZy2wMSy+lFoQvsJ+HOhZFHNQv
	wFct1XDDwFkpMnttpDrlgKsWvQeNCmIN8lA/t2LjwvYvhfKtJGWeOI8MU0L5V4QW+niWaUHEPS/LQ
	jvQ2Jex5I34vGag+iVHnet9wAstQ01Yfrx3hDe0gxEstjwOpy5wD2VHRAwZqNvlPc6w7ktTkWCMrk
	qqyRIMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHOR-0000000DlYT-1UWP;
	Mon, 28 Jul 2025 06:31:27 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGqp-0000000DhRL-2dnY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 05:56:44 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-23dc5bcf49eso55027405ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 22:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682203; x=1754287003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwv8jVW8Cpw1HdPZHR5pkIUQOrnV30U4PbqXFmi6s24=;
        b=UtW4C+LsuKpGl01Ads7WQt3S2c0T825gikqyxVYxxtBCGoMmjGoE94DdtB+7M9yzHY
         cj+sCSgXIdsRZAMEevJ9qKFdXPlmg1XyLSEenIeaSI/0NEpoFQCgczkhg1yKp5Eq3pLX
         7AXhkEW4TZRGxMOUQHX4w72bvlcuNLy+Bvtp4+W8/2Zb73QHFOVHvx9i/RASHdLc8CLh
         +f5hCFQ5VbMgTlvQP4TRYVBT1oNGc8XOUUyuuax04r3OIdCN9Tvxc0lrS06IorzZWC+e
         J0DPg+QO4CYaGvBsoiFGFY0b81i65s6ttSF/oQW/x+IphCjhPC1zjbuG5mp5XuDrXZHu
         mnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682203; x=1754287003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwv8jVW8Cpw1HdPZHR5pkIUQOrnV30U4PbqXFmi6s24=;
        b=omCHrTLKb7csrXC+NPKft7UpXRBpCj43B0AcmyUga9ubG2Vqcbd2bybnUm4fVMgeWg
         mi3QG98BCSE9HqN2OV2ruFNffVe1sfacP4uv2kYkBFVw3Lg1LaWM9cnNE5Hs3gr8Ljbi
         mAtqCRcVhMZ0GGCTUPtUqjgKBDo7L+6cOgzzOPKNbc9nZuDD4jy+tu4HBgJgUesmkQ6J
         XLEw5b8/Lrq3NwbZlwpsuzoSyZs+K2jqsHfwX4P/ETD/lZusg5i/aHcVneBmixfDqdRV
         jbiaQmZsgF8o+pYwcwDHeh/Zjn20bA5xGvbLZi93f1ob8ndx/PM2QG/Z0jvnRMwrMT1o
         vROg==
X-Forwarded-Encrypted: i=1; AJvYcCV9MjVxWqtajzkURNdub7dnhQFkgk4UkQ3Gqdu4dXMc0ZizOwtYkgnVSznnGU/JvHTp5Cbasux4p8KFT52OVafs@lists.infradead.org
X-Gm-Message-State: AOJu0YzdMaAMbHAjUQLHQpHkv+4asTJBaAS8hGUNaQNiG+gkbL+o0Z7G
	0LlSUtIKOhq8cJc6U5QClk7/0oPxyFbRiMEnNSWSioOD3Yy/dqY3s01q
X-Gm-Gg: ASbGnctMc9kqARTnBqLFycTS+jkwm4pUVyCxd6REC5pHL0gBddYkamnNrxLy3dqoZxl
	6q/yrwruD1K5PWvSeMCk9JWuUZjsKu7MoKpBwisTPoQ/zGBtXXu5YorfFjMk8Aohs2/JCY3phdT
	Jjy8XE8ECcscjQ4ckJNvl07smt4SZcqo2dk465KkM1NNW1PnJ2bsdfKtFtOJAO0JHOjL+ebLPD0
	HT2S/PCf+M99N9FWk/DPiU5VLkUpP+MXpy/pVfQDjI5MV9iGrr4fWN+0iM6i0fMSqRpjKoNyE4P
	QXLZxvN/kV7iVfll1rCJCZ6Ls/jAf7EghYZqsj56fShu5bjY0mX0wWxocXglEnheri/YV7vR2Li
	+DDrDSq5bYs+Q90mkqqkb9lhnvQ3Mzeu6T2nULz0o0+Nbz7xNjbxJzJFxojcozON6U49LWyNOfL
	I=
X-Google-Smtp-Source: AGHT+IH9RbYstZRftDP7K1JFfq4K9/bJOuDCvgnQtsdkV8ZotM7LNFEtIGdprzRSpoN4SreniMPYxQ==
X-Received: by 2002:a17:902:dac5:b0:240:aba:fe3b with SMTP id d9443c01a7336-2400abb2552mr50892895ad.16.1753682202708;
        Sun, 27 Jul 2025 22:56:42 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe514b59sm45091795ad.128.2025.07.27.22.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 22:56:42 -0700 (PDT)
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
Subject: [PATCH v4 12/13] dt-bindings: arm: aspeed: add Facebook Darwin board
Date: Sun, 27 Jul 2025 22:56:14 -0700
Message-ID: <20250728055618.61616-13-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250728055618.61616-1-rentao.bupt@gmail.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_225643_669658_D36B38A8 
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

Document the new compatibles used on Meta/Facebook Darwin board.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v4:
  - None.
Changes in v3:
  - None.
Changes in v2:
  - None (the patch is introduced in v2).

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 3cc6e62ae5f3..2887565d4170 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -83,6 +83,7 @@ properties:
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,cloudripper-bmc
+              - facebook,darwin-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,fuji-data64-bmc
-- 
2.47.3


