Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C141CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=abYjL49SciLzOaOA35f0uMdKGEjHBbwqKbxX7MVH+24=; b=yvBzKv17w2xx7y6xv7iBh9UmK/
	i2xvg/NyhPpBH7nA1cAWdDkS6pqqdwcsvQjW13FE/3LAX1SgC/YLi9S2rzEisCrKABN3L8dh2O04t
	B9gBAOI31cXYuu2vfDjY6k6EIMh2ueUoKgP0ystvevI0lLs4PZU7yeg/VQL+ZvTu6ruYb5qqkCaUJ
	Ub8qkcgOi9O8/UlBDdYlD6V4sP/nIlsJGRUkYaFXQ2i3bh8UJfz51fZmCgYOm3nCj5MAZph/m8WDp
	Vlf1cSp2bkrsuh7gCGrs8SBxhfSdWmP/NOCDs/OX2FbtlRNuewLCQwA/ui3su/vzuGC2uMVzxXp8P
	43vsJ6Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymxQ-0000000AX44-1DY4;
	Wed, 17 Sep 2025 07:52:04 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymxN-0000000AX3N-1JcR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:52:02 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-323266cdf64so5480203a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 00:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758095520; x=1758700320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=abYjL49SciLzOaOA35f0uMdKGEjHBbwqKbxX7MVH+24=;
        b=MY9V0JyjsbB4+50/CdI6Sw3Hl19Y03WM4f2LG+y0rdjviD9Jp+1emfh94ZtHRdL4AB
         lizu0dpObbhIVQZLZTOAdTj9OHMF7O9g5KUDeIQdvGOzNEZ8y71u2LSszucxfgV0RYk/
         2p3hv/du5CHE32FNNkV101QCRZ0gWD34pYPwJ1APAH0scEqTOhZkgA6XhgXpCUockJH3
         cx5j95bi0TxhxrxEWmWeHp1s3bYqe6aXd1GJIdjutuAAdTui7e5TPs3M/vc4OlhLzhBQ
         YH7mEF8AMOvBOwjfqDv0cWjw/2qo3p1ZbeHQL+pwYlc0WXyIqf2SYgy/HiByY03SHoyI
         Ujuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758095520; x=1758700320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=abYjL49SciLzOaOA35f0uMdKGEjHBbwqKbxX7MVH+24=;
        b=mAPW6lVMegv5CvXlYQwd+L4xvuN+mmf737RWbpyDQFBobpTd7pvNrHNnoA/dv7nHGK
         koa2qOw0jgkIVrbHMlaRxF6gEGMlfK6OFDtRqCu6l5BQA3CKT9pVKmbZ6sTcT5f++tR1
         suPKCbOSBXJhamq3P7Z/K52b5brPFC3TypjaO0mLX255syx4TTLOMoOu4serLumtH/O5
         wqqQ8bFUG1ECfz5nWPlHWw6PMg0gfpG7ZmaM4yN84oAO83aXJqkOkKj0ckM+Jgin3O9+
         UeWV6J3p2oLkQ+TU5fUOn6jiyxJ7+jdcpW5FSccOYIJRbRAAoFKD0yQseyiHYNYYAjVO
         pJwA==
X-Forwarded-Encrypted: i=1; AJvYcCVhjVN+TEve4yl9TUKq1wyaVz9mOzMVLvgY9OjLM4/m3DRZM6908eiA/ZA080/4FpmigY8Hs+/Pkfj8uelGCe8h@lists.infradead.org
X-Gm-Message-State: AOJu0YwFryrPPStFLfdxHRe75/gsCiHnn9NkEVSjNtgrPcFKeXJxaqhS
	fNqJki1a3J1myLZ0OFUamu4+kltnAXr8D71CBSnd8Pk2I5md9CE9E4PV
X-Gm-Gg: ASbGnctxOGowJoauPN70XCFwa4YKaoUUxazywpmullx0/bzaGDp7FiFAV9wldWIZnWG
	/5JkuBVZ8G+MvcZ5bvVf/FarQkVI1jaDPuNAte2JmsAEtkCPjixQgOG+e3NmOYIfipVkdQc9Mwg
	8H+yNLlbmky32z55ld7xAuhGbmJNUpbi0N0jqPFXoOMgPfqxuX9J49zJb3ch1Y8mMkJXBAOh9cA
	JpU7blpw92xZZxR8JJbusiIF8S54VejehF25Rz9OficgATrBUvFCyaEw/L/GeYJL3aouK8HCnkk
	dmXmbQ8wis+C7YQshJbQH/B/rCqqfcybJ6wk8I1oIgIDJbwz6LDZWvbvwOEm9AOYBlYJmwcEPbL
	DBuhvm6NuH0YKZ2CJZt//cvTa9V4g1nLRoVbB
X-Google-Smtp-Source: AGHT+IHUW/wTOhIs1KEMt39SwXanfpFrThAcQacQ2rNisK/1xxjIdZlvOMm825vyXwIFErVxjOFrJQ==
X-Received: by 2002:a17:90b:2c8c:b0:324:e96a:2ada with SMTP id 98e67ed59e1d1-32ee3f2ffefmr1335606a91.21.1758095520454;
        Wed, 17 Sep 2025 00:52:00 -0700 (PDT)
Received: from meta-device ([2001:b400:e359:6d3b:3881:d7b4:5e6b:c23a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54f6d51fdbsm253168a12.26.2025.09.17.00.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 00:52:00 -0700 (PDT)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: aspeed: add Meta Yosemite5 board
Date: Wed, 17 Sep 2025 15:51:56 +0800
Message-ID: <20250917075156.4043936-1-kevin.tung.openbmc@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_005201_355726_BEB1AB90 
X-CRM114-Status: UNSURE (   9.29  )
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

Document the new compatibles used on Meta Yosemite5.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 456dbf7b5ec8..6f2b12f96bd6 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -89,6 +89,7 @@ properties:
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
+              - facebook,yosemite5-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
               - ibm,fuji-bmc
-- 
2.47.1


