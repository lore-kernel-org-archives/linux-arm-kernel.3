Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175DAC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2k6QLhMs+Ybe7hFRFwIVvK0vEsmpmU+VkYws59KtZA=; b=tgJ4vEp2AKoeRkB+PsXAQgrcdl
	h8l87uJYta4CVMAzayumcG1q/FdZimWJ+6XCeFw0GtYL7BO2RRmzlD0uT1eL8t1d8g5oqayONK+cK
	NKLInO2ul/s2fosK/Vjbp9gUxrEV2kXvhJbIQSPNlMOx+aGkXI3m4mv4zO/cCkDtdK140VUD2F4Lm
	nX5M16eUiJnU8g3zKjuMznQ7fDNxTisWKLEpjzaBIZ7guwFJApHpoVHl542ZpjMD0WXS/BnM+ftrJ
	qGzttCmz4re5n/1lL/0lQykmxiIeuvE261BwLMGWo6MhI7C3NLST5bgzi1f1J2kAFzJSylCYTSz7o
	+ptRCB0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULaI-00000007yHR-3JV1;
	Wed, 25 Jun 2025 08:34:22 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKif-00000007qP8-2oBm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 07:38:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-234f17910d8so13812885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 00:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750837136; x=1751441936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2k6QLhMs+Ybe7hFRFwIVvK0vEsmpmU+VkYws59KtZA=;
        b=nZZ3kworvbwHscY/wjSc+vodqvtDQKamECkstvmEwEzRRRr3vf10vkyeUQ1i8Pgi/j
         evHCTckRshJROroSc1Mj6zJjsud30hHZ0l3Wl/ohYx8NCzQ6qYG7MjzFirHD580HNd6m
         grrmN0Jhx1qP7GIxurGzwwOOqOFN8oNJBhpHfTR9W1+dFzm2LYMit+TrUE1HoFIxModU
         gaS8l8HBlaXVbRyyeMXyOLWyCGosjhje5/hIcTYiEkHiGHCNWoKHhIOqXuoWdZuQ5uet
         dDjcO4aO+Tx7aDVqnB291nCB9E1YMjLtMQQAnyQ1qK5Q42YWMVS0mDDbldPJBzXKsjRM
         Z+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750837136; x=1751441936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2k6QLhMs+Ybe7hFRFwIVvK0vEsmpmU+VkYws59KtZA=;
        b=hyL1WMFfJEaMKe6RS+d2VUv7+JiANdJWvmnnRoPmckiKchf/XzwDwOHXKJbXAKguwb
         NEksd54LYMcP1qAcz/uulzNe13yu/RMi4XyCjGXUoHuUTfTFIvyHwNemPh4m3FL6wufs
         QImtAFxSVN5qFoLoU0iReGptSE0g0+RmpaTGdahaoIYedwi3rvvnB2gg1cpc00/2cPVx
         z6btWJFK89GSkKGqLwxdr5NP4kwRY95KDZzuOMNTR2L+idavIu8J+TcyJWpGLjLdFTPg
         tnFhQriESWHhbXWeQNNDKaCIUu9JVDIDqcw0nQCqogyjTsIZ0Au3ZuYT+bPNUkBGXboG
         pfmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6+aHRa7gKKDNM+Sfqj7sMXFIAfAcEPfPolVJ/Dir27MkJEAkXrdfGsrDM8xJj7CDqWGKr2P7NTsy28yejOpqG@lists.infradead.org
X-Gm-Message-State: AOJu0YxQLoZZEmIdhbv8VlXMefYTyTStOx3U/jzzNzbzfdcNso2hSlmu
	OaMW/ibtlX5FWgYMjv+/v1Ko+GaaM4le6leetRef3Bh3uJslnlhNwRwD
X-Gm-Gg: ASbGncvSnbE5tZUDIPeSO93jZIX6b08drFAQdgtpzv7dQ4N+C42DablelYwqmQ+PqLM
	X0x3aSRjGukSqXeELrfDlSzI+Zqz5GVCFkpw+ty/OfCxO7TP9DEu5mMeQ92tdd7F/bXEabMT5OA
	4ECUH9DJEPKW3q1v7Zw5+rjd5aWWYB1LXs91HrP9SwPVTf9pR4CnqVKU3H6+ZN0AXtDHY7eGpnz
	EXuEbnG1vJoHmT/rnLzx1Ch8hPOctGcg3mU9TZMt/P4POybiYzPvyPq2bxpLr72AwevEK3pmtxI
	URF2LNd550PbLeBAGQn6nB6OT6voGhRIunNV/2j/dymsi1rfGUzqrZyEzPNt6s5JW5k8k7VuKe9
	BrqxHZL5/EE0ltksDuHd8isg7/VTZVgOu5Svnpu+7LTDVM2b22KAQ6xpqvIhgS897NhdwCNXVMU
	uvlEv23FOqlxnRIw==
X-Google-Smtp-Source: AGHT+IFPhsOEHB0AtL92cnu1eg5DcAJ4zv8O/1nAazjCboc//yT2Vhmq+mZ1KELkj888CHOfjGO1KA==
X-Received: by 2002:a17:903:2308:b0:237:d734:5642 with SMTP id d9443c01a7336-2382436220bmr37350915ad.41.1750837136289;
        Wed, 25 Jun 2025 00:38:56 -0700 (PDT)
Received: from fred-System-Product-Name.. (2001-b400-e389-b6b2-29b2-bfd3-aa15-d345.emome-ip6.hinet.net. [2001:b400:e389:b6b2:29b2:bfd3:aa15:d345])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86a3083sm125374285ad.195.2025.06.25.00.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:38:55 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta Santabarbara board
Date: Wed, 25 Jun 2025 15:38:37 +0800
Message-ID: <20250625073847.4054971-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625073847.4054971-1-fredchen.openbmc@gmail.com>
References: <20250625073847.4054971-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_003857_711200_B69F1D70 
X-CRM114-Status: UNSURE (   9.77  )
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

Document the new compatibles used on Facebook Santabarbara.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fb..a965f1a03051 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -87,6 +87,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
-- 
2.49.0


