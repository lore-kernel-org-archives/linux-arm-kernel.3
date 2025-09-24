Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC20CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 12:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7ZUVg/Nr4pBk2YqBecru/L6TvemL+I2eAgpr8B6DmM=; b=NCyZUjoMtR4pRzqm9GAQeYPv/O
	xojwZnXMwHDAmoyM2RC5hG4KBuE2AfkaBoAII8qKNiD1C0w71qNiNm5HlxloHXfjxvB23Zv86EPAj
	wZjwJJWhqFu0pmzyZaghi99N7FOIkG0CNYlOkBpWXZWhpWGn6G2t+C8NVbhNb1/fcxf0K/PiEyN2v
	GiRDDqflFc/tSmwDr9TRo/JRi6rCle4JsQrYmkpIuhu5FC1Aw8QgKJu9ZtEig3woQEkS0zYHPmJkN
	YZ8Yxs8hQC5CTMnuijmpTv6OCIu1Ztb97S7TXEY0PZRAWGtVumd3H8fF8krwuT1+SORq0ttQ+CEa+
	R/nayd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OcM-0000000HNrU-28sA;
	Wed, 24 Sep 2025 12:29:06 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OcI-0000000HNp3-12aO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 12:29:03 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-77f1f8a114bso874751b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 05:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716941; x=1759321741; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7ZUVg/Nr4pBk2YqBecru/L6TvemL+I2eAgpr8B6DmM=;
        b=BOZ/4ZM+2n2yfSHZc2yi259PY4mRket4TQpOj//sJqV3h/qpTXn409VisOePWJqf1m
         K5FJVsVEYimeAiYHbdx+hPy4o6qQ8XeZ+Vp5fqvW2Wi7RQS9TLIBR9UIVveMPCpUxgLk
         rxGJpeFQmFwwQZ4uLWgpwfQ2zUwXCpzip7Farqx0IYueg90XAheDAwxcoFdV92PuDLnq
         5Rk72dNxB32I9m12S/klHSXHYjQ3Gc+X75UmmPzoPGi8FKYlIRUorBzZa9J8CbxPcVCJ
         KMdXwnV1M0+FkV1oTaGBXhJJXWCZHzvD7W/xM/DCsD7sR6OG2BAucrEBox6nOh8RctpA
         oBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716941; x=1759321741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7ZUVg/Nr4pBk2YqBecru/L6TvemL+I2eAgpr8B6DmM=;
        b=nvBilm1z1QibrHSCF0gxbK+4dERwCGaUq70AaMjhljJ8UjS/UaSlkRKRE5w9R/TesX
         lSkK03lVAI3HYQJoqKv+0hUktzptqeIQsq6EX9NLYDLIcu2SNNawUBKlLmhVd+rbA+c7
         07oh3cO/DT+7Ef4wtP/LfGyBuI61bEPIq/pVHYCcwl+2aT0DbsLiurp8hoKSj+G5cce1
         dF5xKsT4MjOsB5fQkH5+1VtAFNbbe6uZL1PFabcD6reZvLyg48hIYFCqLzqhvbVy8dsq
         crSEFkQaCZXm9hdSz2P+YwCus+Wh7F0xlgD9Wp0ygwDlNBuIUmWoIHhcd96D4h8Z/Obz
         jSWA==
X-Forwarded-Encrypted: i=1; AJvYcCW2F5gZXnK8UAMi8mCkyvFyI/YbLiuSQCBsuvm0ekxFROgVV6QcEzz/CGLu0jN5vRWRGhc3QpMXX7GsQgTNWmzD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4zNOFssR5sIcKFP1E+TAStXb/fRInj4CiR3bZ/fPnBGhDngid
	sHUdVJDo56O5KtKRZ28OQckLvkk+EHjWieFkdqj/ec7QbZFSP2pQtwV9
X-Gm-Gg: ASbGncspJ0Ivuii00H7El9XaINNcfqZCiHJc5r3sn+yYaS6vBXHV1l67AyzCcdNlJTK
	W6Eu87M2VWZUScWiDJ/M8sJtZQGzFcxOfCFrpo+0Chf5F3+HjqNCLclVQ+Iesul5QZ5htgaS4Wi
	ZdUiVsZcZ75inScd166Pk+f8ksDQ5K1OvC/TIflc4zNWvxkVPwfCLaxudnUMDMo1IEUKlOqoGkn
	RiaJZgOfzYghMHbxY6eK7zB8GpHw/jhRhCM9e/imu5RP9eeL6RGTaARk4NZbWdbKX+tP/wHiphu
	whr3kreGn547WpB0yvKfEtOoHKaPgiTCG8Fltp+bOFOLE60fGZ1RIyR95YM4fHsuqmyCBDcJnl8
	3bXNkpcj4gvTusVOWjsvJS2U1fYM85AHtZkhx3CnyFASQ1vuACZn8Kr4iNWXcVT8T9gSG3iDg1Z
	puG9eF+tlXhQgsDdqFngbQmGNt7PrqbMp+HtBf/a4o54LPfv9GoB48dHlHzialzoRLdjm15z3W7
	Y+YbLUXdIRDRB8Z6wEcirc=
X-Google-Smtp-Source: AGHT+IH06rBToc1Of5UN6Ch+ySAAkAq1UnVhWSHME11cpwxSnnZRbpfNLzn2Dr2TU8ADryfYeNx7XA==
X-Received: by 2002:a05:6a00:4f94:b0:770:4753:b984 with SMTP id d2e1a72fcca58-77f6984f9b0mr3074239b3a.16.1758716941404;
        Wed, 24 Sep 2025 05:29:01 -0700 (PDT)
Received: from 2001-b400-e384-7809-32b4-db27-121a-a0aa.emome-ip6.hinet.net (2001-b400-e384-7809-50d7-4f66-57aa-588c.emome-ip6.hinet.net. [2001:b400:e384:7809:50d7:4f66:57aa:588c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f254f8f68sm11058495b3a.56.2025.09.24.05.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:29:00 -0700 (PDT)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Wed, 24 Sep 2025 20:28:50 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta Yosemite5 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-yv5_add_dts-v2-1-39a4a8e3c9e6@gmail.com>
References: <20250924-yv5_add_dts-v2-0-39a4a8e3c9e6@gmail.com>
In-Reply-To: <20250924-yv5_add_dts-v2-0-39a4a8e3c9e6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
 Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
 Leo Yang <Leo-Yang@quantatw.com>, Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758716933; l=886;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=YB1a54MMJXi5nKTH9gbuafJV6b8bO8PW9GeT78qICUA=;
 b=niNRJVGxu/G3iuEdL49yqUkGn3N0ZSiWXbUk1WNZzk0EayhrlvQV4FUn6veJSMmD9Z72xEqo8
 RLa9pscBXnjBtD5vl3CExk+zp4wJKthnmKhKAmJe/yDHYmpwL2Tw5fS
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_052902_296642_7F70E869 
X-CRM114-Status: GOOD (  10.38  )
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
index 456dbf7b5ec8f4442be815284e1ad085287dc443..6f2b12f96bd6ce31b4175e109a78d931dffdfe28 100644
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
2.51.0


