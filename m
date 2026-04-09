Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB1EEA3C4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 11:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGQ0vmmUWIBnqyUaESvXUUOwisanulkIR/QFZEP+UTM=; b=g+vt4r8nJ4o1n41c7UCj2pFQcS
	gKq6YSEtpi21NJ2xoNOEjL1GQgPFmJ6TsTKdpc0wY0LhrFdd6CMju8YBPEp7co28gG7Tzib649AzG
	RzDFjvRZoHsr69C7nZyLdVi1s0udqDqYRAuhTYw6Dt7MgP5qDzrZ5+8t6SaNvNl1HekgspQgDyaBd
	1YmHPhL1hAaD6eRKKwWNvovGtJl24eAyePdG2Kd+YwuwH/GhKJ9Mh5pc3uNA7vS6PLkpMJF67S9LM
	NGN6pfPVFMIqVn+KfaTKWmQZ2a4bEYcnEU07IP7o6eO3qeSsAsmE4dojfGJMANu3aewMs6xCJF6xs
	3Mc9cAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnkX-0000000AITt-1TBJ;
	Thu, 09 Apr 2026 11:40:41 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnkU-0000000AIT1-3LAp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 11:40:39 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c70f91776fcso357710a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 04:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775734838; x=1776339638; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGQ0vmmUWIBnqyUaESvXUUOwisanulkIR/QFZEP+UTM=;
        b=FcKmw8cpms+5QmXjxhLWj/RQD2Wvqimz/XkO3LWsQaBY+YzA78Og+acWkRu+yoZi7f
         lbvKgG0e5WQuBON6ui42TK5v5PNUpcm6LTzZMX6gNvW9BTTYwPrGjpXVkpQjXa6PyTHA
         QBacXw8qJYSjerzDOEyfoClxTg2jJ7r3NFd6ap5+5v9r76Yubke1aBHTEI8Lgkfw7dJj
         gl9Y++IhTciL2pLrOWYH6d0Go58mqktAmq3lXzt0xvvYmCuC+kit1h/YcO0yFTSs+Udw
         Nj/5h/KGkkZhNrKe4zrYIfgc3/FHe/yuRwsSfRsU+HoOKzXdo/oIDkyfI7kFR1RznX7G
         WlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775734838; x=1776339638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aGQ0vmmUWIBnqyUaESvXUUOwisanulkIR/QFZEP+UTM=;
        b=dYowMaKL5Y9wJSdyxM0km0JR3sXIYqxOpWH8T4+md+ItB/hkAeUQEzYJyyZTQyOupS
         nnb+QUI2oRjM+vjNxdUppA2rQO4EretLDJnUER6xMDKKsAU6YOgCkfqbb9inLmK6f+9L
         dYDTvyVAef7dJs1tatfx1muehKuJwAr/y77LewLiz2ApUptxKlMjqBbopxlFDI1Eo+tn
         OjtE36CAGLYaktrbpZEgnK8WNxelYk++m1/oxyCiW2CughH1WSJSnLoFuuugSYCkgniR
         +m7af2sjijVPf8zmGzfn+JSlZQegLUO7BLKq7J3A/UgmSFzMf3kAHsdqfEfDFrJJRtCP
         qXrA==
X-Forwarded-Encrypted: i=1; AJvYcCVsFWMPhtRl4ywTJ9995bKIu2VAb+yNW3Qvu9KBcDzLZLWhhwG0AYYM6AgwZNjOI7NFNn1MZIVhDEOfvg31RJjJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr43PbPGmMwN68k5jerg6w5/erD5a6abLKKxQ+9Umq2QaJrL+J
	n7eQoXD48e6KUOBN4aOqP1zu3UqhA1HMI3oPVc3o82up9EHbQ1FmQ4CV
X-Gm-Gg: AeBDievotqiCktZKUEmF4fblPn+HtRo1hOmMl5EVq4FwFAxUJ5w/cUoMg2r5U+fzHgK
	IAz9AA1t25iog+YKj5yKStb9qksyuv6PXZJsWXt+ozofukF+eDwUL7wdJ1BeAT03auVG6g8I2b3
	xi4fXxJj0zRagQeQHYLrabgYEg37ZHQ6E6M7jRPDDoxlhLdXMrq9UdiRplX3R/ifGbhSA7aZbkz
	u9you+WZD+axTd2fc8aZ34a5AtBjz2GcuaK4KY0h2mkOJnzkc9uz4S0XWLOhMkInq9D1pmr16xg
	aw5VshkSnf4XgdGVk6n08C9BSPWsKV8DD9g6Ozd3DaAnHTTCaL1B1qDQmZbr9sDPOYK4xsWRjKt
	Nm1dVBXpzuudQbmwHUA4J1U1PKEoKc6lA/4neUKTXoSIG4ib+PknptoUipbM3jPuayDtuE2Kfkw
	BuxYkRhLtIlvMLrWbmqsdBPkOeWlGrDw==
X-Received: by 2002:a05:6a20:2e0f:b0:398:ae03:722f with SMTP id adf61e73a8af0-39f2f0a28e5mr18690906637.45.1775734837794;
        Thu, 09 Apr 2026 04:40:37 -0700 (PDT)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c659a218sm22438545a12.29.2026.04.09.04.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:40:37 -0700 (PDT)
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 09 Apr 2026 19:40:26 +0800
Subject: [PATCH v2 1/3] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-anacapa-devlop-phase-devicetree-v2-1-68f328671653@gmail.com>
References: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
In-Reply-To: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775734833; l=882;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=Hk36uMGemdglD1N155LHlYS04DfWcX4jaFk3m0XEMoY=;
 b=qB/7HZdK28u0LjywcyJEq3d12szbQ0c6O5GBzjpklCFTSOFvhUuAZyLpt/R6Mh3FAG1XgBFRw
 NWekkpuc2kNBfOgumwL7gynPmQPmf4JwbQoRS8wAgLuCqgFNC6+wowz
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_044038_854373_9582FD55 
X-CRM114-Status: UNSURE (   9.02  )
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

Document Anacapa BMC EVT1 and EVT2 compatibles.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 8ec7a3e74a21..c4b87c014941 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -84,6 +84,8 @@ properties:
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
+              - facebook,anacapa-bmc-evt1
+              - facebook,anacapa-bmc-evt2
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,clemente-bmc

-- 
2.34.1


