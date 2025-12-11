Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE79D41C02
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpT9+i/Mb1SzFndodK6pjHk1FnR6Em20V+C0liaihVU=; b=YtUWogrMnbtZUv2NwBSQ6BxkHs
	RW6wKpZ6fRYuOeRb9vvN/QF92MvY9DO85XXpQ8dPiwcXqxDvKwCHUhQsQqFwJ07CRfLkRKqFgu4Cb
	9MsbZaaKTkj72JWzGtt73fBz3TGwFo6+NDYUJgXoxBj5ueGHZWgImk/KeCc9qCbVlTFoVhHUI+1L1
	CSwKRRwbjikhTsYaT2ocbyBNcsQ85SRKQC8oCR5YqNZ+BDTOadibOMwS3cI7ucfu/io48kEVLs/xD
	dB5ut0BtYbsxnygMk3ZKrHzsuQNA3fWBjHm3/iPYxykNioiqpgYUghhozt4jdV2soTVE30Tu2+o/L
	VLbNai4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKr-0000000GPH1-3APo;
	Thu, 11 Dec 2025 08:47:41 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKp-0000000GPDc-1wtr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442857;
	bh=rpT9+i/Mb1SzFndodK6pjHk1FnR6Em20V+C0liaihVU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mPJU9qQDNoqh6NyKrVyLU5d/zHaZ3HmrsgYxTaXWxGDJqrLl9XCO5Kyym/D44eTwb
	 kw3QVLMOGJo0VhETRgFYBiU0uaQUx/4B831bSKtILSHUHMLX+9NU2qc8owG/48faS6
	 VfbuLxJRbGLUJmhfw01dlr+OJrYK1h2k8VVY2ycPQoJ2PKNEt0i/Kwu4GcaJ7cWDly
	 XJuikW9rtL/XPJF8nFDxgHeOM2duqxRRlLO0KUMuRt19FeCfqi0gKNNF7nhS7kCgoi
	 GgnaR3/gCJhRcVhSrYyWsnBQTrJxgkhKzdlt5wthe8DSysaNhnzafs8KSTLLOmIGop
	 ZgjwksnDNe0Tg==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B49F87D6B0;
	Thu, 11 Dec 2025 16:47:32 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:55 +0900
Subject: [PATCH RFC 13/16] ARM: dts: aspeed: ast2600-evb: Tidy up A0
 work-around for UART5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-13-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-iio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_004739_701073_DB856BF3 
X-CRM114-Status: UNSURE (   7.13  )
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

Changing the compatible changes the properties allowed -
snps,dw-apb-uart doesn't specify no-loopback-test, so remove it.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
index c51977dcb56b..3f2ca9da0be2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
@@ -205,6 +205,7 @@ flash@0 {
 &uart5 {
 	// Workaround for A0
 	compatible = "snps,dw-apb-uart";
+	/delete-property/ no-loopback-test;
 };
 
 &i2c0 {

-- 
2.47.3


