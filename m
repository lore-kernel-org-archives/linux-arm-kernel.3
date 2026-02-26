Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00F1F55450
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 05:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2M1mDfXgnz5T52hMj8GNJ84lRse5GAheeg5uX9GLBPU=; b=nFwLZ8/a1dkf+ATQksRAULGGN9
	1wq2QZdLk1GpOCHWQfazkjHXkjiLNqXENPReduFgTb/PIUIkA71Kf4mikJvaYsoXTi1CuvkNeNuCN
	wP16aJeRWg5Lhzz6lPYF6hcG/V8mhCmeyyZ+cdqts/TTWBNsgxPPcr9hRawLTeEBK3DnfhvX1luF0
	5F9HsUAv/uvTo2vHTBBjVNCzNDSVQ2f0YbE5gXqKbznx749MuX3kGho6lwkD8n4dSvPpfnOQFYd2W
	ai5hKZTQDn0g2kfz2GFj0FuMJ/voZYCWXtV6O7O+cSdh/vOJ4Q1JlzIBH1iIdVR15vKpYZStuqN5L
	/1tN6ydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUMO-00000005SEZ-00gF;
	Thu, 26 Feb 2026 05:56:28 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUMB-00000005SBr-2trf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 05:56:20 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8230f2140beso1013404b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 21:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772085375; x=1772690175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2M1mDfXgnz5T52hMj8GNJ84lRse5GAheeg5uX9GLBPU=;
        b=eDiMgDyT9wcerosEKdXg31SH2vgr71irENUZO//71KCwClHtRvn8hnWF1KhKT++1g/
         nnKtiHg7pmqT51bhUQZiNCY36T06MXJQvFvlQr+6M2YmLXbpiRr/jrq0GfxfY0Ur7t5Z
         GGThhEbY+a3ykieijlFPLcbCp9ChPwjSxnPjx66AoKIJLD35NRQjSZfAIBsI/uOnQmTV
         d+jWolXsQ3WmFInWIrX3eEVi8mktDsP2GPNLsKWWnAh2SZuh6K0U5uGMenhWjTZMSjBA
         0kgxQYbIlKqb17Tg7GdQa7GvG0uNp0PzF1O4i8bXfImJeho+TV7HhqGN8QyBQP6W+81T
         i86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772085375; x=1772690175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2M1mDfXgnz5T52hMj8GNJ84lRse5GAheeg5uX9GLBPU=;
        b=iKW89Dj2+15K0fJY3sIqaboj9baDeXcCU5bxLDCu4zjJJ2A3MZAuU2vBVjWkjzNP17
         O54cFiC2dXBAwTq0Qm41MQ7pfVWDXVzzRgyynSAfsWf5fcMmCkVu4GMEPdukqmnfOM7F
         paWwcsY08f2FU3i81giOphiPlh8rwunrl3UfREyTvxkvY8CRuFCdQRgCWiV90X3uSvBp
         j1+4AUz8ulWTeA29+KKvkTBvE6YNJthZ0VuSIXSJLV7VhkMkLw9FyJ79NVDZNPtjiAGg
         FvpiAxe/jNnAqo1wlF1Ly26pu58jXqUiSzstojxoszlYaDr64uC8QGv/ibPeVsaK20I/
         nXzA==
X-Forwarded-Encrypted: i=1; AJvYcCUN55uVdfEo2buTOU+2vjFBlH85QnEBrAStXB+YIPPiPWgo6RvBIXGfQld/DWD4RiNaIKl6k/Kk+xROQ6/sbHFC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5sHELTnZepm++O32c+u+wGsL1NCcy19u5BzqRBp60glEfTUI1
	bmVQO5UhahCDbrI8vG30Q9YodUwZmnqiFvOA+sNkFQXxGhKRi6e96UH6
X-Gm-Gg: ATEYQzzfp7BoCvzvqDDeAljE4ewfErfbd0kU0dJZhRWvOVysaNNWxXwBt7ilhoAl7gF
	vpTZr6s2XdkeJ3g91XQKumX7LEFwFIAQYsqlN7HZjP1A4ST0O23SWEue0CJUABDjBshp+8SB3pd
	rCbX3pYFL+rjcSmRxMj+fzaRPC5MkCfrLjX5N/Uq3TtvBb49Y5Kx8Sotbm0LeHfKpMYruO6oMLP
	2kq+IZ3VZE1R4+cwaGTD0az4HrE5T4oLpR1KJZs51XA5E/2tU69e/uEEZv9n2tLx9isBH3mvExl
	mTNLDPEvc/28Is8nmOh4MaLeHjLVjsdUX4xMMQs7yAQu6PHzbBBLawtHMfpCeXwR+SEHZXZh7oY
	u3hNoeJc54IwMtVdM4N44Ar2A56NxJLtQZRJX6Tu/6Y4Sk4Sd8iSSxtlRc0sd7nHkXkNVLHjMM5
	RBHhV+ZDTwRFr83COseCp3nw3eILoLlIz11uTWcCJpisMzmx9lvVXA04XzU8Bs4Zrgr3bedN9Sa
	z5p9f43HssYoiPFzmPMT9A=
X-Received: by 2002:a05:6a20:a103:b0:366:15a0:896e with SMTP id adf61e73a8af0-395b1d2386cmr1678863637.16.1772085374725;
        Wed, 25 Feb 2026 21:56:14 -0800 (PST)
Received: from pk-pc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa82c284sm767851a12.23.2026.02.25.21.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 21:56:14 -0800 (PST)
From: "P.K. Lee" <pkleequanta@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Jason-Hsu@quantatw.com,
	p.k.lee@quantatw.com
Subject: [PATCH v12 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Date: Thu, 26 Feb 2026 13:55:20 +0800
Message-ID: <20260226055521.1655243-2-pkleequanta@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226055521.1655243-1-pkleequanta@gmail.com>
References: <20260226055521.1655243-1-pkleequanta@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_215615_728176_ECE5CD1C 
X-CRM114-Status: UNSURE (   9.20  )
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

Document the new compatibles used on Meta Ventura.

Signed-off-by: P.K. Lee <pkleequanta@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index aedefca7cf4a..afabfe22c8f3 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -92,6 +92,7 @@ properties:
               - facebook,harma-bmc
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
+              - facebook,ventura-rmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
-- 
2.43.0


