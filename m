Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F80BD7496A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=seg1Djb22mG1EtBOW8bPVm9ZKhEV+FEwOFvHSuMZezs=; b=EnB4O1CDiwZDFJkfFXEe3oDaKW
	FeOQuP+v7HC4aKLmxDPvROJ5Mu8+hderSg3J0c4xR7j13npTOatSv8Gn8TCBOo6JnReGQoThFDHB8
	cqQl8x4yDXEegOEeJvmDs885wT4yEyIQWMnjd0r56Wj2O4IJwX7Ki3wU/346IK787j/FMXNxyZW+t
	8i0pfL08dQQ1CkOUe+OtCNcFJ/76KDHQ8qako1naSokV8iWBKQl7QqFxWJy6PmnWUp5odPe4oLxpw
	9vlwDenrq0BtxqcxD6iOxowRXEglY5E0w6PcFWAiCB5hlZPRoZiaMA5vWdJHgH+Ut+Byq3erjOl2v
	7on6Se0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWbR-00000009v70-0BGt;
	Fri, 19 Dec 2025 09:16:49 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWbN-00000009v5f-2PLh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:16:46 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a0c09bb78cso10633235ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 01:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766135805; x=1766740605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seg1Djb22mG1EtBOW8bPVm9ZKhEV+FEwOFvHSuMZezs=;
        b=Lv/QbyzjG4zbHHr56LIXwpLN7ykSVOEogIMoocwZcW/DP5tUBS1W8QEklXtMLg9vzh
         cJFf5qjvGKY//8zuxc2w76WaEqBR4XFu7wb3buxOgjcAnlSNyXLA8EwDYE8EcnZ+parh
         FRLjueaU9n+Z1qzUeeBj7bQTNc/lBDSlZNqqHvVDPFi5nMdgvDhZcjbMS12E8eFEfOP9
         2PmMN7mErRkFDo/altnOfezguGVnKmQM6xLhS0y0s2jRms4iG2wBfEtmhbfVZWnvwz80
         Wp1+3Po5dKY3mWzglMpgbsIXmHzFjL9xuIZ0SbLLWuv/ZWn4Wj4fiymy04Z9xPlllrcC
         I2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766135805; x=1766740605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=seg1Djb22mG1EtBOW8bPVm9ZKhEV+FEwOFvHSuMZezs=;
        b=lqMy5xyrxEqXE5Kv8huHpoOYp4EAmTNqvYh8+a1W1QIdnH3c5DjYCGry5dtOWE2hq+
         E2bz7tTrWScAWrtnJw5Ft90DvvMF6RK1os4I8TmNkDgBzJvc4lc93FvXKk63Xv3Rb7Ki
         Uqtd9k60pIaPD3dTi6JYoAIvL4g8Fe22h4mZF8fXBaptceQsIEboDvknNxvpOp60z1eB
         YNJZd08i4f5tF5n6xyKaThZFaHxP1i3QBbrE1iZpeMlhzNB6Mg/b+TeKMyEL4zSp7Uug
         qvtft0sZdODMWZ+m5Pe9QD0J0jO12L6ghJk/djWJQCi71SNBBKiSBFVe9oEc/JkUVo/g
         OHQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0pY0MYq3jKNJn1UuAi2lh7dAHv3GKddtwizRFo6W8uDLbMAayGcxhD6wJnyV87sKUIs/vqjjex70Z7lk+hCWP@lists.infradead.org
X-Gm-Message-State: AOJu0YwUF8LZAU1AGsBEHWf9DvYx6haaUI0GutCYVJfIllrQY51vjCb9
	5J1SDLTkeJxEhlWcmSrQlnwNKN4pllw6zkWnfdpTD0eTS0HHtgFGzsgm
X-Gm-Gg: AY/fxX6yiWpfiP0EDxATs8gF5nrnAAZFvMKmlj86A9CKNADdmqwqbc5Xs9upqeSibqA
	FtjY3cqrzBS5eJmNcrMA7cNHUaTG2PELE13vW1AIlickSqqRncAeZLS60UwKt9EWHbWUwAKKTvK
	yUNk7Tknhv+UmjncbQ/nNqM/AB2OmbZW5TwWby3l9Y79qSYm423vKQ/rOthLxbdiBBnb76WHV4o
	sVq87McnnuXN4HA5f4ZE8jn0tfolDzHGl5PcZNi42XNF9BeNplzxFTSmw90D8RdwaqqqTX1UPkO
	8W7qr8/Y1m3lOzP8iixk59LtR11YYU9ML8EI6npk3kSXhSsP/8GaRKotr1AXiND6o+DDSzigld3
	qKGN/tJJLaeSry5oDbm+6Il/sz2rR0c/byuygJAwwE79Vj0+ZeuI0vj6utXWhbMHljP59NPMPP4
	m0Cy+CV4sYL6aA
X-Google-Smtp-Source: AGHT+IEJ9Q5qdYN7r5wkxKvXn/1Lu7RoXv9XQ+En4DMwtXVbXRE2hJNNeOmPbiwOSmaKWGCsKMsYAg==
X-Received: by 2002:a17:903:1105:b0:2a0:b432:4a6 with SMTP id d9443c01a7336-2a2f0d2db41mr23919525ad.15.1766135804477;
        Fri, 19 Dec 2025 01:16:44 -0800 (PST)
Received: from gmail.com ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbb7sm16831515ad.59.2025.12.19.01.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 01:16:43 -0800 (PST)
From: Peter Shen <sjg168@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	peter.shen@amd.com,
	colin.huang2@amd.com,
	Peter Shen <sjg168@gmail.com>,
	KKrzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v9 1/2] dt-bindings: arm: aspeed: Add compatible for Facebook Anacapa BMC
Date: Fri, 19 Dec 2025 17:16:31 +0800
Message-Id: <20251219091632.1598603-2-sjg168@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219091632.1598603-1-sjg168@gmail.com>
References: <20251219091632.1598603-1-sjg168@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_011645_610928_EE5AAECB 
X-CRM114-Status: GOOD (  10.52  )
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

This patch adds the compatible string for the Facebook Anacapa BMC
which uses an Aspeed AST2600 SoC. This is required before adding
the board's device tree source file.

Signed-off-by: Peter Shen <sjg168@gmail.com>
Acked-by: KKrzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..4cbd79363da2 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -80,6 +80,7 @@ properties:
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
               - asus,x4tf-bmc
+              - facebook,anacapa-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,clemente-bmc
-- 
2.34.1


