Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2218FCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 03:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=; b=B0RR2oaiGSoHNEFOYMd2jgeCCr
	ygMFp3zvuvSix2VlbVpUnxG+2fgxkxF+9wMvx24jeDzktR3iB5QbqRxtdjLEFkj70rQObnUQMkt8G
	5GwMTk7uUOnbba60yyiNwKNpBnUWOM+5+xqSEoyd0oBJaPF+9r2GxCH85vttyEwX1FAd1phK3/za4
	rSH7PB9D9zv4ETd1yIx8vsFfN4t4/QJdzjTz9gNB/LqSBIMp0eXI+kcdEdtt8YYSGP/IWJzrUF523
	WGY6cznKAWmRLVuTCFINwQB2ldBrImQQd9u4tcdP7ugeM9i55VIltoEs/uXFUeZzjWZGDGoPLlmxR
	/vYeSNeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYxJP-0000000DU2L-1MlX;
	Mon, 15 Jun 2026 02:44:31 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYxJL-0000000DU0r-0slb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 02:44:28 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c8584e80d59so1023513a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 19:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781491466; x=1782096266; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=dv+ka7L9fY1uFC2fNl5mIh+5fHt5CCklmwisHKj9PWzRDtPZ1L0AM9XueYzsrV8FE+
         rXxSf+XbtDa/lQPNmB0yLwTgbw9q80S5HH9c3OqkM3pruPrz9UNzhucZtR3xllhJ7G3H
         gT1kP7q1EwNlfUX4X9FayQaCKkWElFFNdzNto6HHiEWWw6w86e5fVXukSR9IG8R3tzuy
         Wn+r7jL5j7jV3t1NtlEMeKyJee+IoPzcEAkmE7yeWOibbwShrXc4hMXOMNdYUULYOgYQ
         wE8CsWjaGeVegXWBMfIu1fDHq5gGyrjSplhAcwZL5KRrKACjiCkFzIg9sglHx//8EgyD
         MQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781491466; x=1782096266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=tHy7YZIig6iXE2dJwejynzanM8ZGKYexYl7zfFP0Ldd26w4JYbm5tqN7pfLhxSRSi4
         pAwr4Rl+X2yW/p4ucM6/c3fzfnWFeJ1NVQSlJ7V9+VWRDBAvdwrfJJDBUo35557J8oFV
         8H/9Opdao6TEAHhBdGlT5RFWpYACrztX/SVyNlD7gheJMa/57k6aHdqNbCvvZ+YsrZjP
         7RlEHFOAU9i30d/MEtm+cNDvPVMaRShJHtN/VDO3yFAJ3lArG2cj7d7i8bup/jbaUolZ
         UypdBlI/4yJQgW8STZIlKKtgWgIAKaAniRh1oyybxZIWBJbyumvrJmd8vO5YFP5KeeXA
         kILQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XxrA61UPY6zo/7MTFCNaKRwymO5lW994/oIgWJDViye5TEH/lWGUJsTsaA5fsFzL+sw0V0woawGnrpY9/4qAU@lists.infradead.org
X-Gm-Message-State: AOJu0YzLes0EzxHVCmV5bjYDqvPVA2EKz1iAahbwov9zqOw7cpZt/wQe
	UDKJHBUmqHee5GQ+99wvVB7IzDMjFLqFOxajiqOYWfv8HTSuBanGV6rg8no7jg==
X-Gm-Gg: Acq92OEofLNdMd+MkeL9UScdE26N7J5hcGjcWiuPNCwbPRPbrGAQnM1F1/wvO+IGlKS
	R/OXnF7qMf2VFyghFFbvPtNR4VWB47vdySQrloBtNEc4jk6mZJY07EW2D7mRoygvzdc/nVl7KYY
	dk/fCUyqKpZ4U9gfzj9PPb18ue6mUL1dEN0Z1uHyllgh2qu2MLXjoBjmWQA4gZ4mZ1Wve8RPKRj
	nIL2PENqVV9kY3ktAzPQv3c00oshsZg3tFiqBIzNVu9px5/DrKMk9caUtT3YLzO+ggdRTT2GBTZ
	opVWRATz6dhP8LIVtRqfTkj5a/At3gMd2gfnKcRKeESRcCF5yJlF8wO3UUMQQR8MZhmgfeK0jaT
	jwBaXvG/zq5Fzo5+/Hy9jgSXeyyQs6biW0oHJc5GeY8blMGbAaqgqa/sAiVW0vpfa9GCczjtaMa
	Q2FCZ9gCBXWc/AMadG4Yg1i1SQh1KFDMLyfxGY6JoU1UGm0SELKd8Y0Yjm49V+3Qk=
X-Received: by 2002:a05:6a20:7f95:b0:3b4:8880:2089 with SMTP id adf61e73a8af0-3b783bb0448mr14504694637.16.1781491466271;
        Sun, 14 Jun 2026 19:44:26 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm7138676a12.11.2026.06.14.19.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 19:44:25 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Mon, 15 Jun 2026 10:46:02 +0800
Subject: [PATCH v8 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-ventura2_initial_dts-v8-1-c89f92c80447@gmail.com>
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
In-Reply-To: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=909;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=J3z5h5jN99f1BFk7jnvt5xoq1tLRgjc3X0kRzaksvsA=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqL2ds9BW16ZZQoO1e5JC8M56v9xEAV+IzijHmA
 lB0RGhp+EKJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCai9nbAAKCRClg0K3CVbE
 gXWgCADCprZUJ0z700syJ6zD139+Wivkz9tcUw6CjgrjNq/OnB+mBhvi3Cq6ed/gVHouqFJptUm
 Fd/0phsYrDe5eT8PXBsktLI0Yrueo2W5QvOgi8PDJUnobF+3XSLjb7ob0hVqqhpuBUz5ltN8/oo
 YMLheoIJVMkiOIddANX65rvHiLupttXtwCUKgVEOVIxe5nvs/c+WwudZqdahS4U84GXM2y8RLRf
 kmMb7l+CyL7Jykgj0F/Bmn1MT/yt5EoiuWr3IVXmC24x+YAVRTLR8u2wybRDB62a03VNKv2ZoJt
 xe8D9O4Fl1GiXWnItAKO9oRU9JLnIgtrb/+MWRTzOcq1ffgP
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_194427_266322_741827BE 
X-CRM114-Status: UNSURE (   8.99  )
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

Document the new compatibles used on Facebook ventura2.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..d48607c86e8e 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -92,6 +92,7 @@ properties:
               - facebook,harma-bmc
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
+              - facebook,ventura2-rmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
               - ibm,balcones-bmc

-- 
2.34.1


