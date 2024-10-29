Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2978AD2AB2C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzwRCpqtu/LaKB65Sh0DA5SNke+63PFskUW28xnczPk=; b=3raFZVuzFm98DGFhLIyWX0Q++P
	0wLZkn50K3B7Oyo0WIehR//byKn649fZGbdfbCuoJDmwz1UYFKyiu3mUOZijiX5rngMcCphc/fFeT
	UHSOWOtkt05h6iCkCPxK0Dhlk/VT08vhFfBISnqFYmPclMe4Mag9SPhoVqYymcdzeJHWfWLRnb5RT
	TJI6cCYBHgt21y5HQpSqTEtNw1Ny1S70kUev4lNfNionrFI2i1+t51smgtLs2s49TRvT1D9+n5ITZ
	ZD6UkvTBX+/ZqZD1B6Gu2dOQ4dFVKuhg8XxXAPd84l2Tdzh0sTHdlL9hhZMu6P2E8rgW79EuaD8pi
	JaFIHdPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tJQ-0000000Ftgh-0TOz;
	Tue, 29 Oct 2024 20:59:36 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5slQ-0000000FlK9-3lt5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:30 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3807e72c468so245032f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233467; x=1730838267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzwRCpqtu/LaKB65Sh0DA5SNke+63PFskUW28xnczPk=;
        b=AGZBSDMIVT6bYLMuEdRcuXQxyLJ+3fyIl7HX1OnU3RrxeuB3iKEOC1rSCfpUITmkDW
         2yCBRSyqfN/DJer9Juv7VPZ08heUrrnIGBkpOoRpWkkArGETZg0J4hpc91WUEYbmPwjs
         MSklhHn/jdr01NNpgQ+OKLQEcYiSVIjgp/XhBRNTaoB8PrJ97IA5JDa46GPIU3z1ex5T
         rPG/Gg1+12pM0u6xau5Smm85r7RkxbnkGvRspFgVp7nw26BmNbM0foTyNyN1bQscXgu0
         PWrWOYHkK3Q1P/xJ6nGa9IO+/it4L7FsUYgQj4oC5Qx5gvqpUz0blE85s/gmTN87Lxhp
         /TWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233467; x=1730838267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzwRCpqtu/LaKB65Sh0DA5SNke+63PFskUW28xnczPk=;
        b=Br+5jh2ak9VmP30Ke9qdTwCwF0Qa5mVl2478pHEt+TdxAicfwkpIxfErwcRepGFkWy
         +MWjv8sheHicAj2J9uCjourTFu1xfE+qgKYMCi2o3UXN60+XSdfGDqXCID/RiMDDNLB0
         HVQxxEZEZFB4BHsJdu0y2dJey8Ylsh4D1cDgCiX0DrMNqtvG2jVPTa/ftCbciLz5AJNk
         SNuWD42M2b+y9RULTvygsG/PC05h43mQ0clX6vi45wyh5IuYUVJYemfDs05henk8N00/
         4NF+CnBa+iLYEJjgqzDYhBjURAisL/r5r4HiI8aPmX2sS2+ou6lFQZugoj3Xu2mf6af/
         dSHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/ojlfF+88dI5gWHZ02bkr3JenGJRAMcSXuOETuxBY3/yNeK5/AnbES7YzbBSJe41JSurcpvFWZJW1B7O3euzD@lists.infradead.org
X-Gm-Message-State: AOJu0YxN37JbYRaTnyb9yRzXsIaujaBQgHN9I+tcIiWg3M7tsniVs1/x
	YA419bHgNtTs1vxwGbcXQ3fj14t+HP8VSWAIwn6kyClxuoIN3Y+X
X-Google-Smtp-Source: AGHT+IGVkLSu4+PWoIJ+coYpkKXLhR5XEyzMIPK5W8wNP/CqB9C8YHK4RGWYMg6MZPBGM3IM9RzNog==
X-Received: by 2002:a05:600c:4f10:b0:42c:ba6c:d9b1 with SMTP id 5b1f17b1804b1-4319ad236dcmr49969575e9.4.1730233467355;
        Tue, 29 Oct 2024 13:24:27 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:27 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Cc: conor+dt@kernel.org,
	dinguyen@kernel.org,
	marex@denx.de,
	s.trumtrar@pengutronix.de,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	l.rubusch@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 20/23] dt-bindings: altera: add Mercury AA1 combinations
Date: Tue, 29 Oct 2024 20:23:46 +0000
Message-Id: <20241029202349.69442-21-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132428_951527_5F48F781 
X-CRM114-Status: UNSURE (   9.37  )
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

Update binding with combined .dts for the Mercury+ PE1, PE3 and ST1
carrier boards with the Mercury+ AA1 SoM.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 31af6859d..51f10ff8e 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -32,6 +32,9 @@ properties:
         items:
           - enum:
               - enclustra,mercury-pe1
+              - enclustra,mercury-aa1-pe1
+              - enclustra,mercury-aa1-pe3
+              - enclustra,mercury-aa1-st1
               - google,chameleon-v3
           - const: enclustra,mercury-aa1
           - const: altr,socfpga-arria10
-- 
2.25.1


