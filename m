Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFE0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=; b=yBhgSSmnSLUSfq25PGD9YBVm8I
	spG1spc2mKAyR0qunMmpDNpNulxIDZTgfZnM3sgoR9It8WC7fADHkK3uVZK4LACwmWFtT12x5wr+2
	Jtmq4yD1C26NyeLNIbllKRE/7QPaQZoK9G4vwMyUL1eZ2bGPUtKxUpuAgF9vkl5NFttFyZLWMs/75
	6APj4bm52l32av9AnW7pDbV8/NrUql+vvXiE7yOAYJyMA28juHFEKlTGbXY/dHz3cORXdyzktvLKS
	8H3+lOQChp4SoIF1PNfK++TmkkWiwQXbeRXsQzwxaIFgRph6papqRP+FYt9IXfh/Tjj7d62kjy+Qa
	BkTL3c7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlJw-00000005GsJ-2O6h;
	Fri, 01 Aug 2025 08:40:56 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhl2r-00000005Erp-3wRO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 08:23:19 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so1662571a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 01:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754036597; x=1754641397; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=bXDU7Mqz4x30Tq7SmGGjspVWQARt/WdU6O5JTInvYtgEexyafCZ6goj7FSrZJWZcab
         RmHJtt/hcb/jI54fgCA/jIrrReramyZwWx2kcYFR/GA8U0B1RuSPZeqGdV6mFM3RFCKP
         HtVvuk/N7X89CScv5GRnDuRvxbEJ/LRiInv186K7F4RFb5DUBkVxkHI3PBfVU0RKYeaA
         V9WEz4rlGAV6mhRwwmZIJh/Ly3S3QUsD+bumvXBuDHycSmTsldZ0LJ3EaBiNFqBEVW7t
         3ONogAPMRUZFCOvgSmW/PaV08g1Hksw3Q/vjzo3D/Lujedl1ZaQ4u/Tutxq4Z+s4aOQW
         FsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754036597; x=1754641397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=vZVUGkdyNjgN7x9rkSMylGsP4txbQD7a6/6zkg2MbF2L9EDYbHqKEC9tajVxqIrJgw
         OEvJlL3T7r0kvJ9ghfw2W2kPCOS2vXG7vXLLsyNPVi8lDEI25bx4/tBPtxbchskE5E8I
         E38PjDWMseYcsd2V/fn0ikIupX8w47Bgc7eV3awE0d51H5SdA9/BRfp6yNVsGail7rr/
         eN5Y1Tq7amBTJDPIoYNJjjbVKhQTdMlc8x3CZMI0CnAaLdLp3uBEau7JRgnVhaMO/4HZ
         ygRBeK5R8xr4UapdGC57Yes7O03S1KvdKvlmGXG50pi+GR5PdjoDlVPjDrA2qwlxa6H2
         s4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXhfdbTl7GOGvFk6gwSG+KSSweBS8s0daxBTfWi9U+YdjcJdWZZ4XFs9UfGcnYKnfON5IAZMPO6PQpM3j1gnqNp@lists.infradead.org
X-Gm-Message-State: AOJu0YwCW71Rm9QtGPHEK4CJ/0OxEDcfwjXb6wQYRkbjKNcFtUQtGeJI
	MYsXL/x+Bg1Wv8Fp/NFvw2ARFTZXjMbYbdnm+wPukf7tYxy+PX8pkHrr
X-Gm-Gg: ASbGncu5iYnsfQuoqTCFhEV4TeJ1QbFmXnjvlethkL2SFQl30hAEPTY5XUfnwL1yfjM
	Q5zXGmZEzAWjD0T2uSJubsa0M9vnZp+KE5vPCkFe7oHKVuv7F6+6Xw1F7uJQtZtlD18JyubdY+i
	lllSStAX6FUiLgeHQess63z9NRtG+fbeg4mhwm2SE7czE0pxg43XkwC7zk2MUDeEkHQ6XJE5T9b
	+75qxvp4X90QFViVzrNnE99D2LBj1MOmzgqcDo+N/kAkSkbk5Ejvpv7e+C5KENCy8cYkrW6wiM1
	D1vRBtfKhYq/fWNl2lhNEbVfca6wAaL1KSuoV4csgA1XInk8H8VY1rbmFvCeYnOvSRGlnN9szXp
	aqB/eI9DCbzojRui9xuID3GAvR9RyfAkagfH2kGZyJG/jOj3YLyCbluR0UE4rqAsm5lI=
X-Google-Smtp-Source: AGHT+IHLtttObr6RHLUMlfSn58gWBnWQ8BzmxATeW5ja8/S767K+9n/KyoKQzTRXAXlfXE6gGtutXg==
X-Received: by 2002:a17:90b:17cb:b0:30e:5c7f:5d26 with SMTP id 98e67ed59e1d1-31f5de6b82dmr13898114a91.24.1754036597066;
        Fri, 01 Aug 2025 01:23:17 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3209a850417sm3992725a91.35.2025.08.01.01.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:23:16 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Fri, 01 Aug 2025 16:22:48 +0800
Subject: [PATCH v10 1/3] dt-bindings: arm: aspeed: add Meta Clemente board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-add-support-for-meta-clemente-bmc-v10-1-c1c27082583d@fii-foxconn.com>
References: <20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com>
In-Reply-To: <20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 bruce.jy.hung@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754036588; l=933;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=UnfBA/U+nB3GVshcJhQl74M74uA3eyzQykqLq1TeLXk=;
 b=b1s0dY3wOYlRo25bgL2yW3RNY+qHI7/86y7H7T8KzTP9Zb9gw8I3bewSY5hsNYMx+JHrCQ7ZZ
 9KoQpnFuP5HCVeQ6ga8sPILxNRyQvLe3FifzvyCLDcB+V/LhtjPANo2
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_012317_991125_4EFDD127 
X-CRM114-Status: GOOD (  10.59  )
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

From: Leo Wang <leo.jt.wang@gmail.com>

Document the new compatibles used on Meta Clemente.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fbb076582a6c0e801903c3500b459f..ff3fea63cecd99ec2dc56d3cf71403f897681a98 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc

-- 
2.43.0


