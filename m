Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B97D172D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 06:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HE5glzw2S4WCKHAKIYJ8k8reipPAB965cTMWcHuh4wE=; b=RA9wIJURJye7qqEj2uuEkTATEE
	Ob0x9je1Kp7WoEkvG/Zjk7yyNXD7T7aZg98FxLU5M2SNFrgKUHXrOzxdOAFTr9UdGkA/hLigECS4i
	A1RMS+X9BZh+ztqNEai61KdFrsg18p3YU7BR5Y6iyUjnw7qGcS+HRLsGpQzrbd9bMPiceyCAiaqF1
	dYU4ruJRj3E7Ne9Z5aZTwXXW9GPg5/BKIySHo/7dpR4GSUMsSpyskxv8KQFxMq6G+ggfUy34znzX+
	LgtTpfPleEZT4ktC2s1YDK4BYBs9TAs2pWdGC45iP09f22BiTeB0Q/0AUtWu82wIsxzCiWFllFqZt
	62Ewg8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmn4L-00000004URb-3ox3;
	Mon, 02 Feb 2026 06:05:54 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmn4J-00000004UQs-2UJh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 06:05:52 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-29f30233d8aso25815495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Feb 2026 22:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770012350; x=1770617150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HE5glzw2S4WCKHAKIYJ8k8reipPAB965cTMWcHuh4wE=;
        b=cBGa0GaRLET0srwyFgqcFWtZ6NNhT5Y3iVDIIh5kQghOmz3pJrx+6nYV0eB+WRPxi/
         jI+xajyFdcgBHc1GCqT2F/nmKy6BVbbJ0pbeppCL8yD3sB34DEqkF81brDLWbmp+Ls4d
         tnsGMNY64uozX8yyJpuBszIqWmDciWID/ciXhaT7pMUiPUV8F7UHFilFRf6UesWEdC7b
         sIR53rnqnNZzOa0DLUN6UVf6Qco2mrJwbyCesXJBxgk54MdU0V/JvxxrGiWsUyPU3o3+
         pp82fQ+KYJDhriC4QeFbeS2f79t2c5nsiESNk35uIHo24YJ6d4+PMssGla3zRdWHhraL
         +OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770012350; x=1770617150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HE5glzw2S4WCKHAKIYJ8k8reipPAB965cTMWcHuh4wE=;
        b=bjvmhv2X2eykWb402DL+4iQIYfq/7QvkIE4kyUfiMISVTpaL6XiHsG/UcciMXYpY5k
         q2ZrUXsS+7BJ/UjdWD3ZmIZMASRDnIE50fEAkNusmGKP0rzl6I9GlM72J1Gavq2SNkGB
         L9msyjRc+9TrvCSlDaaXaMS/9MCzIN+rSiSZafZHpzRmZ67l1evzVMnb7xQ0y8SzE0Q6
         8rLi08JCuhq2Y9NZI1wzMTBCFTDHK4tnBeVAI/a43HygQDafMMECqRB2XeCc+tbb6jl3
         KEucEPtJt1VLQ6AoAEwok+qSXHI/z+G1/k5ofBt7Ny6FRfipg/ZTQg6PlAxQPv2Ljodt
         Bu9w==
X-Forwarded-Encrypted: i=1; AJvYcCVBoI4RUCYaEDJYhG01jFh2iq/r7B1arR1CJjgZBWKW9dsyfmiAqvOKI17ZwTouumfzO2lnDI8Yp+WHYzy99evN@lists.infradead.org
X-Gm-Message-State: AOJu0YyF6u/02O5+DdUTJ3m4xVsuyYaBnHD/mjGt0qGXbL4CBsHPGJ0w
	zAGewcFKTp8IhIjMpuT3Sit7UL4v/gwcA7M7rFGvYOmXVQdyEVsi2tIhbEBUHQ==
X-Gm-Gg: AZuq6aJYPb//Jt1lHKpEI9CX68Dk8BdY4D9FL+e1vnGhYGSbdfrkT7FZp/4gjAI/HW0
	vNDW6UZxmnbx2VHEtXdWXP0KSNJuUnFGv/cCmxHmtHZxU+qfsFWocWtZMMBqkZYkTUsZ7a9Nj5z
	SNefEFk1LGAXFbWOTi1ScVN6qV3k1SS6JzbbnE5fTR/TKp4HHW0Bqwrg7IiL0feKRm0motZ3rqm
	RAKYxxkp+yewmnoz4Tpsy+SPuMuOTtPYEnKksw/DOvScyBlGyAnuWTSd33Hj348kL/9FMVmi2SX
	ghQVC+me8k/5RkvA1M/NPpUoMYh+e72mY8j/w0z42Rlamwcw7WkBRKuMHThajfJthQF07HaVb2U
	y7MIxsYPd2uAKe78drsCfjjF6eK6ked5CYPsb6RNEu4f/NQElUVlCgQattUIkyfZ9p7o26g3rkj
	qqlgenqDCkt1f/Dn4ZnGtJUR7NnBNkyzdzFC466eF1S0w42gHQKAWAPNB/S88CLSOzuy6c2SPTQ
	g==
X-Received: by 2002:a17:902:f708:b0:2a2:acc5:7a42 with SMTP id d9443c01a7336-2a8d81801aemr108152325ad.48.1770012350239;
        Sun, 01 Feb 2026 22:05:50 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d99eesm132926135ad.78.2026.02.01.22.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 22:05:49 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 02 Feb 2026 14:03:16 +0800
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: add Meta SanMiguel BMC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-sanmiguel_init_dts-v1-1-c0023ae41899@gmail.com>
References: <20260202-sanmiguel_init_dts-v1-0-c0023ae41899@gmail.com>
In-Reply-To: <20260202-sanmiguel_init_dts-v1-0-c0023ae41899@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Roger Kan <Roger.Kan@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770012344; l=841;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=awDe2howAZDyvltIFZvQ9S1Z3NdAcsc3EqMeuy1puZc=;
 b=kEp9CUwnACmR9NE2TIjtVwLyacYjzLHZXZVw5BEazIRRzng2LDy+t2D5cYB+vLl5p49SqUkt7
 BZQ8VeQwu+HCJwN3aaRbYw/PF6VzsDrAOdJC7cddPQyYrAXH2ndXXaJ
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_220551_640354_8E6FCB76 
X-CRM114-Status: UNSURE (   9.26  )
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

Add Meta (Facebook) SanMiguel BMC board compatible.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..6c84e6c80978 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -91,6 +91,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,sanmiguel-bmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc

-- 
2.31.1


