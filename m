Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9CDCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 04:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oC5WZ/7VfSXVPNYFtp8ZHIoPBfsAZ00riValRO0acVk=; b=hhNUav16lvccVNWnfZKEjeQkQv
	NGd3OjNm2IlBV0QVW3pKF3jVXX4do7Wvh86CzVx3vT8i4HvrFnZfSGeOtH2LLoYwkTDZIdlWJ4POO
	gM01xhtfx2NTscW6YndaDYV6vCoOx98m4f4KVG2ZqN/VRRbvhr5W5VaZZ/Pojzrr2NAPHiTdj40ID
	7kR9LrNsdVElOxIDHZfq3peiVJNdjirqIWM9YVyd0t4B/ToWSKk+0q+Yf4kc/vzO53I1jSYRcPaU1
	BKCBLORsKAhb6Jlrz8O4+Oi6/e3itG2e98nI6BTEkY9TFj4RLkeiohHGN13UQSoii2p4RXEcaqLxk
	FJ0BHKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLD40-0000000HLVo-24gh;
	Tue, 18 Nov 2025 04:11:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLD3d-0000000HLTy-1TRP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 04:11:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-298039e00c2so64090615ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 20:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763439068; x=1764043868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oC5WZ/7VfSXVPNYFtp8ZHIoPBfsAZ00riValRO0acVk=;
        b=bbirOwY80jA9abliKQ8AuR9D5MiiA/kZ8QYAaeiaOpibDAM7r/k6rKmpnTtVEVpiE3
         FylBqvCRdQrFjMe/SRsbYb6ZUiUyRQcz5qqtCkuc1mg42mtCWxMkqYge0mE8JGCI/8hJ
         aJy9pnxo+4Ejkyf7aJaGBaYfCqEQCVq8IBPZAURmcbxUWR1DTEQ5lvdxkiqw+vs7fzMv
         F4Dzs9b+nXKjaiuq9jhLD8+4aDXyIj1a04hRISChFkXd06Fu+k+OHmm0DaQvesi2AkXr
         ZrbyORCIvgFaIv+OA5wj9qND2oTvItw4I2jJp5Ocsb5tXmjAlHlj1hdLi67Axbm75kYv
         Oy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763439068; x=1764043868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oC5WZ/7VfSXVPNYFtp8ZHIoPBfsAZ00riValRO0acVk=;
        b=Oi4lQmSBthBfxfxbib9KjUEW1/zP6kcCSYFtmzkMdaLXxI55gvGSSpIWATGDDjBsu5
         BZW4yvpq4dzM+CwI6TPTCDRWAkX4/vn+fLiDu9EZdx05/9VpgEwU9z9glSvy2UEiXb9p
         idAFaCmBIL7wM7KY5Uk0cZHsFWyJ5Ju4+H0zBNb3K+oAKIRbk/qH8OHBnVoHfFrSxuIi
         xeekn+XPz1UiHIB6Yb9Yy/JWoWDyUigvhJqHiQx7t4iV2qyD6eap8IooWpLzqdap7kuy
         6gso2zshEmDT910c3cmW5v7Z9l2PebkaT8vHlXrEzQAXQOl4VT5ia83NfVlvqykEn1sf
         zRIw==
X-Gm-Message-State: AOJu0YxHEkOvSjqIqKjLiVUoARwOTvPtutMJXMvmevUnSseLqPkR3Sks
	9uzAZiyy82zy7XSIwk7w1pCgFQjzNeQ7tm/K2xJ8WFcF7XD3gHrqiZo3
X-Gm-Gg: ASbGncsBhxJkLl4e1D4IntFYVj5JnUk1mJMkIvfuCcul5UeWFJzlFDANrx1yTbqI9/s
	8Dm6muB2ekA+htbmtuQi1uj1lDyNij2baPbWt6P0n96rpypY8VbofmUZDg+cjatBC9ynMBLz/08
	RGqKzkJJMpS53YmOP1irD6oyxYsSYz82GSCJsxKKWMJ0m52XEGOA80SruNFV8IqwZsTvdnXYSMQ
	Fzr75MKcvXqVg8kg6lez7PhvIz+cUypT+Px91wgfqgBIx0vX9TttfkFPpPfkU0Bb6UVX9Uhs4B4
	HeuZgo5oGRJN2sEnbmmVeJM7AYEsR3cmURg0oV/2RpSV6ufMyRBlowVPRM+8VjqQa8lLMHiJLpl
	GpOg1z0SzBDWEDHJUTin+b8brPsLZdifwxXaRcdWMZyKrCvH8InXDcdjUXktSYJ2TJvdmcNuVH+
	BrhQ==
X-Google-Smtp-Source: AGHT+IFbAdQLeXsJ9OGt7mRsvRAVrwQRoN3HqcPgt18qw6s9BCntwNDrABtfQk2EGbAMTkHuQOqMzQ==
X-Received: by 2002:a17:903:2b07:b0:295:2cb6:f4a8 with SMTP id d9443c01a7336-2986a76a1edmr149678665ad.51.1763439068321;
        Mon, 17 Nov 2025 20:11:08 -0800 (PST)
Received: from gmail.com ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2cca00sm155514805ad.101.2025.11.17.20.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 20:11:07 -0800 (PST)
From: Peter Shen <sjg168@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	peter.shen@amd.com,
	Peter Shen <sjg168@gmail.com>
Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: Add compatible for Facebook Anacapa BMC
Date: Tue, 18 Nov 2025 12:10:57 +0800
Message-Id: <20251118041058.1342672-2-sjg168@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118041058.1342672-1-sjg168@gmail.com>
References: <20251112211248.3711889-1-sjg168@gmail.com>
 <20251118041058.1342672-1-sjg168@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_201109_387920_4A781489 
X-CRM114-Status: GOOD (  10.94  )
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

This patch adds the compatible string for the Facebook Anacapa BMC
which uses an Aspeed AST2600 SoC. This is required before adding
the board's device tree source file.

Signed-off-by: Peter Shen <sjg168@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index aedefca7cf4a..bcb874ebd9d2 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -80,6 +80,7 @@ properties:
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
               - asus,x4tf-bmc
+              - facebook,anacapa-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,clemente-bmc
-- 
2.34.1


