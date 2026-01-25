Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08F4E63CA4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 21:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAu2MatAEnI8QTVhImPBkJhxG/GJJFigkdVmzHyS/y0=; b=S6s4meAqcbzvkmhDcUcxxwlS3V
	rVgL3/SNxInUp9VLC1wVWQps3PXe+FtCWX4ZB2SLJfnFQl0gsPYg/E5KMVYia7LNBnscuAwrKeyHa
	sqhrW1O5F8WXMtTYVxYJ0OREi2b4EgmXxvfqpx9KIOIFTgC+tHKRZ9tcSu2bgV2dmMfy5kdgxuQxJ
	ZwCwW+y8Ii99Qao45/a8HylXHWi3Nc6zqkxDNya+oWlY6/g4D8EKPNIAeHh4iyKM2NKXcFO7lMLaS
	N/mdDm7p/rdvOby5SWzEliHCtzBR5Cop9HLa+UBNL+ObLxISdz1p/WMXtolPNeNjGN4lQzuWdYDTr
	fexKOuuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk7E4-0000000BVPH-1zLB;
	Sun, 25 Jan 2026 21:00:52 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk7E1-0000000BVOK-3N7a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 21:00:51 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-649523df010so3382233d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 13:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769374848; x=1769979648; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAu2MatAEnI8QTVhImPBkJhxG/GJJFigkdVmzHyS/y0=;
        b=erfbVFQGbQO+Z6bwoBTktkl3EXY9P8HDWi8m5isQMwhg1Z6loiXbcaLB2rHRHtoF7k
         blotuQfpdPiwlsdexjXVsdym/YDtFo2NiGniu90G/ojZyWrtRlHxbadlH+bbAHUfKcK3
         WAQ6SFXRy0fUZPFLrf1SidYr+zMcr+Ws71peWMmQS1Se6GM8gekGRZvYebwLvsLBd1r3
         njNdaSSzxiXQsAqcHvi4gx4+IkAEbo2KgGqTNscLPxfqraTHvNTZc54X1HkUl6KiaGhS
         k4kQevo3Oc0gMevY9ym1Q3cFoF3GXfBINJ2B4kxpe/r4QcOmVsEOS594WEP0ItgqBW/M
         i5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769374849; x=1769979649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CAu2MatAEnI8QTVhImPBkJhxG/GJJFigkdVmzHyS/y0=;
        b=UdtWebVw0AMFBgzKfTIqVdEmmICxqUm6H/KjnN84Yua0H/Ayj0GInWLSIPyDKgWzZ6
         o8aEr9iYzQeA5jJbV3IWT4tSjQLoypt746YI9uu4l90157hPlA5fa6DtMN4buIPLno7e
         B4KUniaKU2FOymqTIzHdmjZVRU85vPTNfLE1cbDd+oIinBCpXE8R8ywZF6zjDORa3zMU
         y4qWDzbiu1BbChm79ufg4cdh5WdfKLM2uLH7zIypRN1/AYeZv+hy9pBCOgq/hiNH//tE
         7chIp+SC4qNd+tMa31VXVxZj+ZhN1iwblrpP6H/Q1qoqPoS1jU+HnvOiDjbnvyIwb3A6
         nXZA==
X-Forwarded-Encrypted: i=1; AJvYcCWWJLat12Mw9R2GOH9jSQQ0b829GIMz2QuieQmmLXw8yJf/c2QlwOM81SXs6zOlQ9lo4hyZzEKOq9isdjkKr1tX@lists.infradead.org
X-Gm-Message-State: AOJu0YxgHLyXTwfiHRi2A1CMDmlBSNFGPFH/zPzULlGJNOTqYIiC8kbO
	BnO56p8XEjp1L/OG3D816z5Jp0oVfVAJfi0a0JloiG/m7vHp74J64AfW
X-Gm-Gg: AZuq6aJnmO2cneGTAE9BUvP7yBG6oUgFDx2MlDzLmnTZA2pCV/q3BMXrZHnDIgAgM3Z
	wK8RXlcHswdhi1dmQ4clihZxKYoNiMzJW+4tscQT1rzIqFE+2GmKty3QT5zWIEON1suEJjjk75e
	ew1PFqPGiqMWKL4WN/eGp53ORxZ6JzFTopsyYVa5Llsg6v6ToL048ZKlNe152UbphZ5yz5d/G6r
	EnwwLmFyjyNJ4sWNISvxFukkGkQW3yqYppMnN2xWqgvLgoULavtUiHfZSNtaF4BCq9/Gq0N5xBF
	Rwj840NF5R/U1YswpUevjTBHe/r7mUGJ6xG8TRHWE/fWHipvEX85dl894maJZ7HsOMnjkfAs/0I
	N7tzBB30hZiFRlOJfs7xWMX0bJFacbFXydEAiy6wIt2narJnh4BIamah5W9+frliUoZRuFBn7H6
	4dHKXR
X-Received: by 2002:a05:690e:1559:10b0:644:7398:6682 with SMTP id 956f58d0204a3-64970bc9f6dmr1471749d50.30.1769374848597;
        Sun, 25 Jan 2026 13:00:48 -0800 (PST)
Received: from [192.168.2.165] ([2600:1700:220:59e0::914])
        by smtp.googlemail.com with ESMTPSA id 956f58d0204a3-6496855d65esm2518183d50.12.2026.01.25.13.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 13:00:48 -0800 (PST)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Sun, 25 Jan 2026 15:00:38 -0600
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: Add Asrock Paul IPMI card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-asrock-paul-v1-1-956085a4bd06@gmail.com>
References: <20260125-asrock-paul-v1-0-956085a4bd06@gmail.com>
In-Reply-To: <20260125-asrock-paul-v1-0-956085a4bd06@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Zev Weiss <zev@bewilderbeest.net>, Renze Nicolai <renze@rnplus.nl>, 
 Anirudh Srinivasan <anirudhsriniv@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_130049_848250_2BD2E1C5 
X-CRM114-Status: UNSURE (   9.22  )
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

Document the new comptaibles for AST2500 based Asrock Paul IPMI card

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd13b447e5ddbc64c5e169dcd08fb15..4660b615da18b7cc390ad0cf95f5a3d7523a865a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -34,6 +34,7 @@ properties:
               - amd,ethanolx-bmc
               - ampere,mtjade-bmc
               - aspeed,ast2500-evb
+              - asrock,ast2500-paul-ipmi-card
               - asrock,e3c246d4i-bmc
               - asrock,e3c256d4i-bmc
               - asrock,romed8hm3-bmc

-- 
2.52.0


