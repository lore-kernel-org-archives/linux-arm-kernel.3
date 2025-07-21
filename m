Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E5EC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ic0V3M7sRH2Zp1RRAt0YlGJ6GUFWs58JzWsEOf9cIOU=; b=3OS7aBjlHuvyK2xoOFTRT2OCU0
	F2yVLy9sckKTfE+saszgjZnZtmHX7su4D0YS0PUGex2UtZ/4trcnMEIurSwxhQNXG5/eYVVGP0/lH
	ynSGJvZm2vS9sPd5vBCaS9DBP6A5NH8PsEA0UXMHV+vM/A6wdLYhNdg94GokcWiczr0f1OCGTYKHz
	ZJsqvZ4KIMNyv6fD7bCGeAVTQPO04iTPrqumZjbavNW8wuUcMmBbuNRRqes60M/DZNyhc1OCDXQeL
	CJ5ByWUqHjORZgP18odItFuryCZzoVquQoA4FmAZxDlSirgabr+/jHFq7LrguTPyPuu547T6IgizS
	8GYyH+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvhx-00000000Rsx-3Mbc;
	Mon, 21 Jul 2025 18:57:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduvI-00000000ON9-0N4A;
	Mon, 21 Jul 2025 18:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ic0V3M7sRH2Zp1RRAt0YlGJ6GUFWs58JzWsEOf9cIOU=; b=qAfXe0Um9lkjYVUX9zOWp8Pw7n
	nxdXB8kqZ6zIoRF+sZ/AJEqqmiCO8tkh16CH6QJblg+NghFszW3LVFm/c34WTLDcIpMLpho8/rEPT
	ExhU0+HsL2+SK1XB8rzElN467+pR5HO3LhqjjIJt0gK1eAUqeHY2TlWuGsgZnknmx3XNJo0VMZhJW
	0Uu3OAL78JtSGBtUMPtvFr4dGtGNeMaawF4Zp0QdaLp7TjABhevlxXKSHzcsDp1zYBq5HNfQ5opuG
	GOxviCFHaKy/Pt3k7aqfMBaMgeo7sQCS7jST/2rQYegepW1lNrE/RheLjHCl3IKuoP/CsZ2I/xlP7
	GK9KR7pw==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduvF-0000000B6sf-0wsy;
	Mon, 21 Jul 2025 18:07:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so32690995e9.1;
        Mon, 21 Jul 2025 11:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753121251; x=1753726051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ic0V3M7sRH2Zp1RRAt0YlGJ6GUFWs58JzWsEOf9cIOU=;
        b=TEic/xECl1et+Imo7DFwJMx2hDs2ZZjAFMSBEqiywbe3/QQqiGWRdpU9uy2z8ehYte
         sNwjrJBULkdq8fT1I3R+7U/ox0GlZT5AiWpIklVcPB+8V6D2t0lJZPCNKzJT1qLqDaxh
         2zYgke/bOds6dFS3zoYFeevIDHejh6JDLVGkD0RM+x4dRPQHTZHvDJKWqtkgzxl4Rfz8
         0odPZiD+Oe099U/wNMo6gegTm0a1veEMSnPSozCV/GLe9wPVnShQ7V8irp3yNMj0/r76
         hDlaz7tPfybvimWEpQ3MU3D5zEFoNcw0b86jVupYfqJ+6y+4R/goXzX1O+6imXqKy7dX
         bllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753121251; x=1753726051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ic0V3M7sRH2Zp1RRAt0YlGJ6GUFWs58JzWsEOf9cIOU=;
        b=QH+nY9ZA9/YIRXI3WNRxU7GEXNTMO610dDqUW4P9qV2p2NF4k1zhGqRoJgxxPvzdZn
         ixH/govJrhcJWEDwGAV14gZOtIjKDaHNPH/gYH3LyPxvcbgro3QQaDFrmdXFVhCIgqBH
         DJSzD3hpWpBy4e2UsbQuu7GYNP8HDlGzUBva7H4bqseqZTxJlCk2X7Bi7SZsYFlymWjd
         qn+mno0ZCl3gkwQ94YiqXKdFBCxvOdpwlfeTOn4y7MIMDt1bi1caQmYtJcbA2z+606BV
         go6BkGUByuB0v9negyd+B8UO7kPtCtZBJuRXRlUgTcNjZ9AsU9g6oQ6NvkqBfGDPYE2a
         VYkw==
X-Forwarded-Encrypted: i=1; AJvYcCUaFgSh1VEua1YQ5V3uak9hFiGwIxUdzjOitOuXY8psfNiu7TgKD3D9rHLId7O/G+jg9p6kYlODK2hdoQPQ7ds=@lists.infradead.org, AJvYcCWCcsbKC48NGHUyIifkuKenaE7EigrxtThSScYcckiDArmL1U7DwqjFdF9qFeTqTQ1+Z46rFu6Aj1nx1ENdoHZZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwNtVb4bp5XGqIT07Br/GMAVWasMGR8sMRjzC+mYzGy94RKOUUT
	bOUE42INtPQ1kUU9ZMGjm4DvffuCwC2/WEeTXmugINrw9SJzlfMCUGk5
X-Gm-Gg: ASbGnctoPU06ABcLdkPMZKeXlQ3U7UuHD7GRAgtiNvdJJamNDlhwmPyESkjHMYSNZG8
	GyO9KBRNcYBBXebPKNc7Y3aLePPKuMwqGGd6CpT6S9JX0pALWtXWxZ6mDcu0tz/8xhBal4YLbD7
	QhCINXfTplcOtwSVpTMEX9ioDxA40DMnmPrrTcZJFItFqHIxWciWkpLjI7iY7nHb1WJuaY8KUak
	C9oT1q8UANjbi+oPZEbnmPVoZwSaA7tvBvMeyWmBbloYDY0T33PIXFrurbuxEG4oXrVSsDJ78p7
	hWojXS/8DlhVdiMkjnM0QIkUxfu9JMIVZMMYuwmvmncATsQ4epqjT5HvuMe+PsMrlpRnbKJDDbe
	7Ucw5U/2U6ARKCf5H/Oyyvx8=
X-Google-Smtp-Source: AGHT+IEztSiq1VvfDAe7vlwj5FXCH2q3wnt65o36wdrhDBUN+Og6tmvcBZ2eJisaFxgmoXC6DUiqQg==
X-Received: by 2002:a05:6000:2310:b0:3b5:e7f4:74ee with SMTP id ffacd0b85a97d-3b60dd6a8f8mr18711660f8f.16.1753121251425;
        Mon, 21 Jul 2025 11:07:31 -0700 (PDT)
Received: from Ansuel-XPS24 ([109.52.136.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca25443sm11183370f8f.9.2025.07.21.11.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:07:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 3/5] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Mon, 21 Jul 2025 20:05:54 +0200
Message-ID: <20250721180710.2116-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250721180710.2116-1-ansuelsmth@gmail.com>
References: <20250721180710.2116-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_190733_409248_C3AAD08F 
X-CRM114-Status: GOOD (  10.01  )
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

Airoha SoC implement the same Mediatek logic for I2C bus with the only
difference of not having a dedicated reset line to reset it.

Add a dedicated compatible for the Airoha AN7581 SoC and reject the
unsupported property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/i2c/mediatek,mt7621-i2c.yaml          | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..8223fbc74f14 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    enum:
+      - airoha,an7581-i2c
+      - mediatek,mt7621-i2c
 
   reg:
     maxItems: 1
@@ -38,6 +40,16 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: airoha,an7581-i2c
+then:
+  properties:
+    resets: false
+    reset-names: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.50.0


