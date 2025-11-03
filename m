Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A00CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 03:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DZ/Hzt/Z4dyeSpA3JZAv4iA86Nxbb9HIqSS2XvFzQ8=; b=F1mU9WZDD8OPP2n+kXvanQe9PK
	4elLqZSnhJaylc9RLnMKJdU+JZV8izsZcRo599FM3G3OM9pnB9w520kVlyyQ55a2IOXHiSxvNsnFp
	neJ+RtV0pIqWwE+bZCvJJFJ7nbzp57O+uHkIsGyYjVHoUKuRi6K58PZrUqhx9CKZ8sHqN/WfdzwOR
	abIL4JrjV3AviR6y2+OJKC+7BpHGBetfEtjbQHFjOmf/V8h2Xj34xwmwwNU4nGc2ace/65aSVNuRA
	5v55spogMP3vWc/KdzTBmjfFOAX1xOGWorH1RwrDaWFTXWaddhzGZnpoLbidPPnnj5Zzvg/Mj21z2
	d91fEsxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFktG-000000096DG-3YiE;
	Mon, 03 Nov 2025 03:05:54 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFkt9-000000096BJ-0RtA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 03:05:53 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-34077439166so3193647a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 19:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762139146; x=1762743946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DZ/Hzt/Z4dyeSpA3JZAv4iA86Nxbb9HIqSS2XvFzQ8=;
        b=a86dm8ccd5m3KlI+jE5baG//XBjm9j14CcouOHV8XyBcQft3/ptYq6cAMl7LOZ9IIT
         4kpP2v0Zxq7q0dNgyFzzNtj8BO1YUUvkUehjAil3gBkBde/RxozI7UujyHTB4xH7If7J
         kp8ENQaZTtMqu37T0fOpFyHxOK/gRBo7cJ0MpHB6xNZQLB3buNV/2naEc0M1VMaC0JlF
         RHodv/QpqDgPDYUAqzVsa5HTph6f7GSg2Ws8I8yLNACWnLsYbAAjWEPonyENTGqinw3q
         y+E/k1g+j0p2OmSBUKhzcdtRCaeskjRi6/3O4WRvpkv11/IIFjin3NziMudkrBi8SnhK
         BOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762139146; x=1762743946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DZ/Hzt/Z4dyeSpA3JZAv4iA86Nxbb9HIqSS2XvFzQ8=;
        b=Rpj1JORV1pHCOXTv4KDzaR7ArSzAc4YMdHhZBx1ZcL6gJvTVJCbDRVCuCkngLFGETY
         mdf2V6+JQ0r9c20YRW7GFcJakgob6Mgoicl1U9LssUIZVuSp3F8vtgSEzMZVOY/grzGh
         5Cw1VlJWyRh/ZxHC9YO+L5tcyOEsmJFkQgEe0KxE8GiANF5w6OGt6X6+96DdGg/jEFgu
         2lVZc3GfqVRrPTqGwGGWwvVNfjlKHXpTd/AZr3X9E8eUIK3gL3uKGF/ADyXI0vIGpLBi
         PB6WoNzo4q5Y4aOnuI31x/EprzUXabB2ZA6+fje9q/k5b6YX538tCLShdgit5ykJTnsr
         F/GQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2nj0oNIwqNSJOtWvdP9Bw80rihCu+ZXZe209s1+uPY2iAQ93lcAaosemIDHM9EcDCZy4jtPDGmprWNGlZRd2e@lists.infradead.org
X-Gm-Message-State: AOJu0YyUt7qF/nXm71SMa7+jpyRJx19XU8j+CiFA/0VLQKj2veaxA7zK
	s/3jzfG294HqH0r1YwlklFdFxKndtJ8JUK5n4az7qUxX8WQltUUR83lf
X-Gm-Gg: ASbGncsiDz1tjmWj5sBrRwQBj8ZBIGhoQj48ORb3WPZvd3rM7nJ/dNdDeyY0vVqsZl9
	uGW2nFCQkJtj/SFZluYRsNvpjpRiJ4rNdyUONdYaMW8QWBJ/AMsOvM2VDqK85gA4JAHs/DaxEk6
	RL6u/7T/F0hpNEGC4T9L9kX2gDeRNXB8Ew//cZviTkMAhVZgcXdVIe5m2ouWgpMmTnipK+4hgka
	cj9STlUIE3TE4v1Qc02lbvNnuuw9Ynzrcd/Xj50aaUhUTtbvKJOiMmWRGrX8weuFblZ3jdJTIJN
	4lzyMgVUCqyzOkHHrTj8OnaqgUTnTG4OdFi/TNlskwtkRYfeBQizqm49Fgx+hAhDskc2LcjJDoc
	4Dfcqbq+b9nTNOFLGqlQlE5kYtT2SKW3xRJzuBpJXOfbCtSYQJ/Zq6gcce0bbKf6TDodK7aIYRf
	WgYfCDuCgCNA==
X-Google-Smtp-Source: AGHT+IG+udK6Bhw4W8KPlkD75NTM1WqC0W+OR++Yhtjf/iYFIJkPzmpXbccgIuGWio8g01Hhjhz5ug==
X-Received: by 2002:a17:90b:4a43:b0:340:c64d:38d3 with SMTP id 98e67ed59e1d1-340c64d3b78mr7086982a91.12.1762139146285;
        Sun, 02 Nov 2025 19:05:46 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340d1a4a587sm5157684a91.3.2025.11.02.19.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 19:05:46 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
Date: Mon,  3 Nov 2025 11:05:24 +0800
Message-ID: <20251103030526.1092365-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251103030526.1092365-1-inochiama@gmail.com>
References: <20251103030526.1092365-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_190549_570532_7901CCBE 
X-CRM114-Status: GOOD (  10.36  )
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

As the ethernet controller of SG2044 and SG2042 only supports
RGMII phy. Add phy-mode property to restrict the value.

Also, since SG2042 has internal rx delay in its mac, make
only "rgmii-txid" and "rgmii-id" valid for phy-mode.

Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index ce21979a2d9a..ce6fc458be61 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -70,6 +70,25 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2042-dwmac
+    then:
+      properties:
+        phy-mode:
+          enum:
+            - rgmii-txid
+            - rgmii-id
+    else:
+      properties:
+        phy-mode:
+          enum:
+            - rgmii
+            - rgmii-rxid
+            - rgmii-txid
+            - rgmii-id
 
 unevaluatedProperties: false
 
-- 
2.51.2


