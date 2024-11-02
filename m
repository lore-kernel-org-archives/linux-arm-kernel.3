Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B95E6F09A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 01:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAhPP1Ue2Iis5GJtsj6WYVFqMLGyqRg1DOrYPcB4peg=; b=fFyGIaOYhIEtWIGg3xbHea5k5M
	5e7i1uCHaxwColvedrtwnX9CoNFfe0NCmo/ATVrrOPWH7m28p7Ie54vl06oVBStGliVHLFzVmNRGr
	CDj8n6e1kvu81htDw4N1zKYMoM1WR4f1Kp0wTc+UzQ3AOZRF3Y5wx/KOca3Gk5fqSgrlZYjc/qFk3
	qh3s9i+7oa+opzgGDz3/76qpfit63wu++S1GzWBUUh5SjBs6Pq/zD4MRbe1Q4q4j55JbsPWNpRg2o
	5He1W1gYGwyfEi4t47pDl4affDuve8Q18xuGZuvI9bT2gSdRrDWE69/x4ORWJcX0vSqKA2lEGzAW8
	6Sg1oB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t72k6-00000008lZf-3JFt;
	Sat, 02 Nov 2024 01:15:55 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t72f5-00000008jwk-1csY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 01:10:44 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-720d5ada03cso1014492b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 18:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730509842; x=1731114642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAhPP1Ue2Iis5GJtsj6WYVFqMLGyqRg1DOrYPcB4peg=;
        b=Fw8kXW9gm0WTr73zYYedVlWllq8hNWrR8M3sbbPYyjAWClTibTPwZVCFeZT7weKw53
         RVOojhZz25el7Qq5t765Jg4DHdyrxnexdn3e19fiJqAFHpCr7m9J9F8hyl4mp+hzDL1h
         m6NHh2KXW7YRuiTC11G1EE4af2ptHJsLs3M6lyb1Yvg7kSksz0YlOTM9JoEq1c+9kQvi
         YY1XGh1nKlveo8ixDErXqYzatJmh581aPTMQiJa4N7/nIjopIgQeyChnLCmjGLRNo0Nu
         HoosPiwIHnsG+t3PvaaM5pfmsk+ScBsklbsb+XfnssM8Fzmzt5020REIrOnJisu6Ds6J
         NGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730509842; x=1731114642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAhPP1Ue2Iis5GJtsj6WYVFqMLGyqRg1DOrYPcB4peg=;
        b=a0XahLLHBRIS8HurSmg+NlYsgzhe+1jLXJMP33kjlOgW2I6ryz8syLMZZJJvBdqzvF
         weVJlWoQdprIsmYcc1i9CX6w1PrPgkOB0fpSQYrHcYnoYPZvhvzRTINoPU3fRgB58ZNJ
         zy7UgCSpDBhO34Sq2ldksfnIytxaFOqQLCvqOezrk3qKP+yWI05iDSsWhrmz39D5IlIg
         BEpgTFPxWVARw6II0+ZwJS1eYIkx/pxFFxavX/fzI1jj3bSu+U8kDBOyAcPk0+X+j5cV
         t0YOrk43u+XYCOMznjx7+owT2sXg8WUj7kHS997FQMeo75H1Uy+Oukn2n9pk/kbELZca
         BBDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3f5RizW5rPyclEnR3xhwlcedjNdr/flAay8mEfXpq8aE49gXo6TR7x2YQhWXJzsNBs5/KfdCKl9chGsDtaWtP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5MdfptAUVhhV0pKylNzt52cUOL9ub20R1Eoda76xJacEv4BSB
	5NP/lU3FnQcW6vgIZPO/oJCUecyWCnuGwpcJXHbErGgRMi2DVago
X-Google-Smtp-Source: AGHT+IHglVfwgkkjP7njhQl+3LEzj6gkB4V5uSI54EF36HyRqGCWy+P/+5iuFidHPUysoa6ehfZecw==
X-Received: by 2002:a05:6a00:1817:b0:71e:5b92:b036 with SMTP id d2e1a72fcca58-720b9db47b8mr12441036b3a.22.1730509842363;
        Fri, 01 Nov 2024 18:10:42 -0700 (PDT)
Received: from localhost.localdomain ([49.130.42.137])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-720bc2c38adsm3287708b3a.133.2024.11.01.18.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 18:10:41 -0700 (PDT)
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
Subject: [PATCH v2 02/10] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
Date: Sat,  2 Nov 2024 09:08:24 +0800
Message-ID: <20241102011004.59339-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241102011004.59339-1-towinchenmi@gmail.com>
References: <20241102011004.59339-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_181043_448080_C1826A1D 
X-CRM114-Status: GOOD (  10.28  )
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


