Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34F3E67807
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 07:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAhPP1Ue2Iis5GJtsj6WYVFqMLGyqRg1DOrYPcB4peg=; b=ef4Oh7u9aT+e1et1a1XxPzbaBo
	r/5ILrwfsdR0rX2U3BwERbJeW7NjlV636aj3Jdx0iXYu8IklPlOJLDdS+l6Kn2QopWKbUrltXv1NF
	gyDQfOiv1ZJpI/2fWJWYPsNY1KHtJjCOaAGKpHhgur8KKphzE34y6q0GOfke2feJoNTlMNVOypaE3
	H/N4OyuBe9TuVHX0NT5f+WBXQDuj7NcRp8lSQgEcLwyb8fPIV0j8r5TqGGi13EJZNyBR7DMw2hUhF
	/eA7eYIt2EtGgJoS4ejFB/uAmf7UrXKQAE3yMarTlL4xgTXY3/6T6+z6rfINUJau4xOAvI4Oj5j4y
	7FPHuwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7VCM-0000000B6BD-1KWg;
	Sun, 03 Nov 2024 07:38:58 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7V7L-0000000B5Nd-319X
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 07:33:48 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2e2e87153a3so2250163a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Nov 2024 00:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730619227; x=1731224027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAhPP1Ue2Iis5GJtsj6WYVFqMLGyqRg1DOrYPcB4peg=;
        b=ngEi86JiUrBjg9RkS17vwAXKyA+4ZSP/9zIi7p1n3buBqUy3XvYvKaQplqlA3UEjBz
         G6OWGjTqGUkugZ/eu+Vw1dbFNVA3cgLd0NokjJvauhZ4rLyTeVmRQ/Paa8MkbZgmS2ux
         ZOVy3H2BbwxMpaY4o4G9DTip7DU9AsDqb+9ZYx4/NjvxDHSbr2t6bSU8S2u4swlsY0Xu
         BlISzZoCJ1XEOz3t8HNbmaWm7iXk+ATawgvYbSbEEq2Qk7WWiLE6lV6v8+99hP8Bm575
         Xl458iAe5DPNjLrkINZtO6wEKRk0d9MofALMXK1mztwYjtx5fSVsjzICnOHe55ChhXCf
         ilRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730619227; x=1731224027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAhPP1Ue2Iis5GJtsj6WYVFqMLGyqRg1DOrYPcB4peg=;
        b=C0ClYPuYikOW5w6E4/HesX3UvLmGaJST1yPS2JdbPfTT8VvovYcCT6RjKvH+xqimpL
         +sxErFABozKjokepKRuQEh4e4PWz7BZYJqtC7efHA7j0h25zptolWqJ/1VhOI3fILyaO
         BIE3o67S3N9XvtOeon5Nmd94LjcZ5aye6AZxk7G4+yRxfmTNvnA7oV7asqB9+PwNugVJ
         m2lmViUW3EzQ1foHKpqfdVKmtTRZP5+oNi/3dCD8cJjNJ0jxPj74h8jNQDgzQxd9EGOY
         XrcZkbutAMaNUwPir27cxzTxjNg7YoiQ59MXPXROTQzqcd3rNABQKc6ltqYHejfeDi5D
         1lKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvAFnsk0chnUFsbTRljaqXWh7xIPdoORgTjuj6hLZ8dupXrqHiicdt0A1q3wXv5iP3NDCG0V9k2bScws/HBhqp@lists.infradead.org
X-Gm-Message-State: AOJu0YwbowVL86WtuIbH8fXS9xLWhs0VmtxgZyO5h4F/q5XIPZJWK9yj
	zkqOFfbGGLsG6OG2aaoQGedgxQ0p7Wn0t1PbJmI3ejELsJQqHlCk
X-Google-Smtp-Source: AGHT+IGImwWeyY3Moiafe2fkJOaFyS7i3wOq6EzM2uCFlnPu6zaavprp4mJQyKnYQAczv96ouYNN6g==
X-Received: by 2002:a17:90b:4ad2:b0:2e2:d175:5f8d with SMTP id 98e67ed59e1d1-2e94c2ac593mr13732559a91.10.1730619226771;
        Sun, 03 Nov 2024 00:33:46 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e93da983f9sm5353443a91.5.2024.11.03.00.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 00:33:45 -0700 (PDT)
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
Subject: [PATCH asahi-soc/dt v3 02/10] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
Date: Sun,  3 Nov 2024 15:31:13 +0800
Message-ID: <20241103073319.30672-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103073319.30672-1-towinchenmi@gmail.com>
References: <20241103073319.30672-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_003347_763081_0F1502C4 
X-CRM114-Status: UNSURE (   9.40  )
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
driver so add their per-SoC compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a21..6e9a670eaf56 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -31,6 +31,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr-pwrstate
+          - apple,t7000-pmgr-pwrstate
+          - apple,s8000-pmgr-pwrstate
+          - apple,t8010-pmgr-pwrstate
+          - apple,t8015-pmgr-pwrstate
           - apple,t8103-pmgr-pwrstate
           - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
-- 
2.47.0


