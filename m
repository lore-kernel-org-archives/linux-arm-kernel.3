Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC43DE67806
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 07:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7y+F0NAVhdE2hhGdAP0Oqd3utvxnAK6BbO2jtHkbzc=; b=coHsQyY4J7h1Ol5APthhAPq8AI
	cu9mX3MOxv8VCMvQmGXAat1EoR6vc5FElgK8Olicgl2eutF6/kyZn7f1Qfwcdc+ot0k1SxvbbWecC
	mN2mERqx+JC+FD3W4u0tq7FeBpEFztQPdv4cvShFAtYJ/qKf8P0rS8uDCV1rqpGB3qw5E3G0D0Qm0
	ZpuKJl5Er02zN+/KxVgJOEL0NdPiyEPzHVviAherFdQyHECCPkpb4bMGTJp4pQrcjoN6fFOBW7cJI
	pSNfX3HGxDifTCiCtfoMfG/NA28XV+gsefhvZaIrdZdEOLe7v3UDeuEbICqv1Ln0PgMQpEeUDAMlb
	WuFbCotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7VAi-0000000B63L-3jc5;
	Sun, 03 Nov 2024 07:37:17 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7V7I-0000000B5NC-14J8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 07:33:45 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2e2bd0e2c4fso2685925a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Nov 2024 00:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730619223; x=1731224023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7y+F0NAVhdE2hhGdAP0Oqd3utvxnAK6BbO2jtHkbzc=;
        b=SWnt1m/bKjXQksRCAhZZMEKCrgvI9mYLFEDn8l84zUO7fHtqByF3CSFilakJwA5gzn
         AW8Bh8y2nHEzdITpNRvMiLGSToR6s6TogPXdy4KegUrXmKNfeTuqWFOYS/lLdSPoLWK0
         /psS0Tof59taHYwdo+PMYw/NbP7RbVlcov/A9+fiuAB8o8zRPrHvBHZ5SX+A/o2rHbmC
         uzp6c/azZH5uzd9EmCUa6YmAfsiV99WOdFreZTk9s0HpHrnkpmIczsC90ts+z93y1Agk
         miOBvjuhQxxjc7oZHWzt7HkQbau9FMIRz/CX0GR713oO4czFGskE0bzftavjwTYIcnjr
         1w6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730619223; x=1731224023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7y+F0NAVhdE2hhGdAP0Oqd3utvxnAK6BbO2jtHkbzc=;
        b=L0fcCQ96vGj2QkAUsDGCPcYqHa3y8cIzjwCzCNJJy3g7//P3LcMf95Z4XH2vYzlF89
         jDM8jM62pWoH/DR+BeQw7sGp9aL5OjiPXs+TFsufc232p3XVw3dtb0S8/Z5HU30Dc7wL
         n/vC+2ul4py1VTSekzCt4GAKDYy4QcNyHdpsfPW+4b4ilN1UYD7zwqRMWlAEHfHDuDX1
         7QDsKGgocg+j35Nzz2lHJzscwwkGP6AE3UkeSNKWNCDeDGBiqsxoxaOyRZdb/LFvkKw9
         aPeO9uLpFUdEMEaIXaG4ZONph0tbtL/89dg4Nj460GNG9JGLff8Ep78e7obfjlhxSMG2
         xb6g==
X-Forwarded-Encrypted: i=1; AJvYcCXAaQJA4MyUtkxNfHnIS5QuFUDKElIhHfu42oM0If6rovXtvycIBGX7t36eUh8777+jX/ZBengRtakxLHlAdqbj@lists.infradead.org
X-Gm-Message-State: AOJu0YzWIyTwI9PbSP7V0wc+FHlb5mJfpQj4Gl5K5sa6hxv7Rwzt003j
	GLMPoOjq2+4J7hsuVRvRTPuGIjn3awMTOksPQ7sPa4s4mNTjbqeo
X-Google-Smtp-Source: AGHT+IE6qDUt9+yFC13+4w0ALhboEGJDjMA6yvBceFpgkq25mvQ/surgMUyOnPPCDOEl/rb4VKy2Hw==
X-Received: by 2002:a17:90b:4c0b:b0:2db:2939:d9c0 with SMTP id 98e67ed59e1d1-2e93c15bf3emr17260428a91.2.1730619223097;
        Sun, 03 Nov 2024 00:33:43 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e93da983f9sm5353443a91.5.2024.11.03.00.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 00:33:42 -0700 (PDT)
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
Subject: [PATCH asahi-soc/dt v3 01/10] dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
Date: Sun,  3 Nov 2024 15:31:12 +0800
Message-ID: <20241103073319.30672-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103073319.30672-1-towinchenmi@gmail.com>
References: <20241103073319.30672-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_003344_430027_FDC945FD 
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


