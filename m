Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9127CC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mze8hotAEoOrviGEmjQLJnjbwR2Hb09Vtb4oE1gzfPQ=; b=ZMgWVKfkzj9TW7o0PjSvs84ZKm
	VDxveHsf2Fze6lZNX7sBRmwgjzlghHBLVE5z9X2nyQ1Zd+9RYQryth+c3Ki9ffAK7qJyAfwxNvFtT
	kwxvS0X1ODcH5GHzo7Tmg/o2Dyf10GZEmdWdmmcVIjJmP/CZ8N3tF5r2HtAbC9yOemf0KSaxISiS7
	RnZ/N65gC7GowwIa7e29Fb4sLla75PVQMlmFznUkcwNFvPkFH06lNRY8EaPVxj5kOVGaDwebtRy2U
	sUTgEndi55TF8KRhQ7oSyMJ8n7x1GOCsd1dpCUXmMCSl1gjuV2NE/yBUr0ilCvFOf5X7TLwY0Ue9/
	bwBylCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevSR-0000000FM2n-05OI;
	Mon, 03 Feb 2025 12:21:43 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevPq-0000000FLUr-0RrW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:19:03 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21bc1512a63so81539765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 04:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738585141; x=1739189941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mze8hotAEoOrviGEmjQLJnjbwR2Hb09Vtb4oE1gzfPQ=;
        b=lsfuhEHYg7Dojh+oFAu8C0lTgwUw9g7YRu3idxgyD7h9v+BO1Feb6bE0gAOHQxjCMD
         Hh0taEbWKhxLaT2pDKiEFj16xyxji+PBdJ3jQ1MrmSy7zLmxDmpEl7wWXIlaJREgxVq9
         EcptH4XvSUMKsZQlh4hzR9iI/obp5ZmLhiNagCiL6KZAgZtD06tL/CQAp7WwZaWeP/tK
         wRgMgMrfLH3SmSXbOXOJdK4lMGm+J3iRZnJxSfr4riq88d+uJhpnhOOvfSxPF942yVmZ
         LaL0+lQcsRL13kpy4422Pgs50maafT9Cu0tkWhvNzmgIvWIRTY4jvuFvBRj80wOzdO05
         BNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585141; x=1739189941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mze8hotAEoOrviGEmjQLJnjbwR2Hb09Vtb4oE1gzfPQ=;
        b=XZyOQ78VT++S8i8mlpQn+Qugvusr3gEG/mYQoS8WTw76wdiWUh39pjNaD1IYQ2RRwE
         JvAszC5F0CxYhCsbhwfN84QLg1a5pQ8Gff5pWTEG6prljxWCiDXdK30EzUqEZKKhRGBk
         xH2SJZRm9056D4aEg6VMSqjRD21HhI3puO1HQb4TW8KwK4jGcm6OTCmB/wUK72NfqG53
         L/A+mVSz6JBg6TkLqGWjpLu9H9071TwN9lCGNuIpJIPBBiLpFzgoNlEllb4/D6amYEex
         3qPDB+jmL+JHhkf1MAaDC3zfTjRUL19S4XTUPlkY5ulMN3BWeLq+3toRyT2mWZu7M5xY
         C0kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyzhvp11P0agpadTWt+XT8Sojtf93ozMdnaHtvtpkqgyXsQzC6C5D0a577w/Ggnm5MnLNn/O5rIh52FOCi8qcc@lists.infradead.org
X-Gm-Message-State: AOJu0YxXA2Erh/c5Bwqw6F4ylDXIPGebFZ92fRMyM5fkwFrtsGzeIhEG
	cuBa9A4h01emYuFudXhlNiOUmuKjDRpmrALBE6qCb6PkqyyhjIsF
X-Gm-Gg: ASbGnctoMV1E5OZATJwNqoEgnB9SjIKx9zH0C9LGbpW4g1Mu2mvql0UNDoNEpqaRnkT
	lL1IbDCNbQEzXOHz2yu7qyxvuQ2y3Zy+XtKcrvZoYdyHerNhzvIf51vDPMi1C/5duFIJePi8FLq
	vTG4UdrwDyWz/9ie6I+DCi9GP9uc/KvEj+amvvRoAS2XlsP/mWbAFyFdKhD5hNDqlQDyMgIAYFA
	LjNcgmkRES026UQuWSCNKAjwTh20MRVeJapm+PlhFMiF7jIn/QYEBug/tucWZFOgDxXCHNjL5PF
	iRFKvI5Ur2Y7UtAh
X-Google-Smtp-Source: AGHT+IF++I9XnXiFEGYHA9dEu9o41bfGAtiDlH7AxvFI/EqWBiAjKHlfZu5h6CMES1Hx6Nig3VrSwA==
X-Received: by 2002:a17:903:2f84:b0:216:3dc0:c8ab with SMTP id d9443c01a7336-21dd7c4976fmr343221115ad.9.1738585141430;
        Mon, 03 Feb 2025 04:19:01 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f8489aefc4sm8789225a91.12.2025.02.03.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:19:01 -0800 (PST)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v7 RESEND 01/11] dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
Date: Mon,  3 Feb 2025 20:15:45 +0800
Message-ID: <20250203121831.36053-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203121831.36053-1-towinchenmi@gmail.com>
References: <20250203121831.36053-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_041902_143280_9F672503 
X-CRM114-Status: UNSURE (   9.24  )
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
Acked-by: Neal Gompa <neal@gompa.dev>
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
2.48.1


