Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116F5CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0YQhBtC/ubH1Q0Mrdh/TGxhsAQ0oS6iny3Z+QMvfNE=; b=4/bO/SszXb1njOdFcbbuTVSqvx
	a5dMfcOfUPsE+T0eAd0+B2lsfxJjiKBUm4zORE8o871oFIYWegtz5Ukrt+Q176uA/dpQRfszUmM7R
	+IeWrDSUQqeTZyLUPSgQ/xHpOLq7N7SXIuoh7yq1I96vNHWS0wqQe6kJRtLLkXe1NsrByWc4Wdx0N
	3/gc+9L1f9R3foHcp+R3OmTlBOQjyAqsziMjHRHjDsD6P/Td5EBavZUANbH9wSv76s4UqrC2xF/K3
	uqioRZSyUyUqdCDNUczn/Sg3Qvs/8QovupXWrxGXyFx2iXC/BcEOptYKL939I3TCdQDLw4HyLGz0f
	V70ldqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28n-00000006ReG-2GdO;
	Tue, 23 Jun 2026 14:30:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28W-00000006RXG-31XV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:30:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso39574635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782224999; x=1782829799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0YQhBtC/ubH1Q0Mrdh/TGxhsAQ0oS6iny3Z+QMvfNE=;
        b=BDBtqOrsu9iYphNpH7Hj4jygNmdjhnyKrSKKLjPJls2KSfvxk0JWx8u5f7rvy35UgJ
         rhYQP/rn85pa2pbhg0d6uNpMxLxrx/Fvlam24VpaQXOVh/yA63ENcNMPZgTer+yV+b3D
         Rr4V61R3kUCGc0C+AhIjJJ6hvOzePt6hFAZ2qNhyF7xBPnKjSSV4nQZhvLsws8OUiPVL
         SghqaaV7sbNTIJ9aKJeoH+6rQigdRUz37+J753rcqrIjoAl0AvaPmiZd3weVdhhrG3K6
         VXDUJRe6a/HuMrfb1bOW/Z8ET+XyhV25ZpM6RRCQRuTaGPUxeGgLisP8Iks3i9McAQ8H
         RzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224999; x=1782829799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w0YQhBtC/ubH1Q0Mrdh/TGxhsAQ0oS6iny3Z+QMvfNE=;
        b=nkjuxLKTKjuVBcuAHzGK/RAdbiv6Su7YT6ZKHYY18pp2vRnhghxm13GjB/awy3Szqt
         npZt8uoYa557lpKMGbqRqq/hliP3ndVrD/+NKHL7pxQcJjme1cj0ENmq6kWEdcE6ix69
         tAJFxh2bqGVLW9pEDTl0ss32zGhIxasYSdmEWPPCNngDh4fO8aNahSRkquVPfb9ZZ3Gf
         N65ThrSm9fqfLdH3HQNGAfHAe/2VtMzQvt1vgYL6BxP6qRXnRPQYJjaojUfviUTxBi6W
         PlIc6oReXyAUiH7QDEkT6jQCR/08zcQAHsQpDs5RGwV/zobxf3Bl7Dg0SdgIVhcPsIrW
         YBNA==
X-Forwarded-Encrypted: i=1; AFNElJ80dWq5OzHWh7eyPvnup55yBVcZPOCAgLajyRWydVBs0A5u9TNks8V/aAlY2Zls6dl0cqdOQg6Eie3FdQ93R+Du@lists.infradead.org
X-Gm-Message-State: AOJu0YwKIiyofVXrA5J/xo5Lce8W4D1l90PJG7XHuQxCRcAb6I+ZbjcR
	OjzIsSVIjpwAU7nZp4RN9zPSUnSVXTBOUBNX/Q8GJhx0HFOj1IbHqxV1wkwZHZ8iNQM=
X-Gm-Gg: AfdE7cl7vWjm87l8QQK2BZeI4bpLClOCKrAXFbc+nQjWIMhYL1+FabvWrCBYvkcrMtk
	M3Q8OStsFVNMHjy8BcGeai091Zk3yDFkv+V+gE9VUpJlr9m7v8vNaFTilANu4YzqTbVc1xIQN7a
	0vS0a+O2grr3MVRH/mfjc+OOFtSFtbeptRX827WYXkQ4xAVpVwViS349y3WSEZYT2pNnkd/DSDv
	Q1g7IfwVgPl/coYK9AmlxqDqt5Zvr5zumynjuTgXF5Q/8WcOYC9b/SjtxkHS55o3fxZBQdReYlt
	AS5nQPY9dwPXUAfSlNVvfcObjSnbaHqGi+ctN5aemH7iklF1sa3RD+w4VDG5LuEVFFN5ib53sbA
	nWv6y9sJgfwGNczLztf9tKpcLmsKwVCJNXJG1yJOdiIsnYJFWScAS8o0W2KncPD4Uo/0WoZ0pv5
	S8DoI7P4I5xyY6JzefVQ1aeO8EI6c6ijmDAw6mRcElpYdFdBHrRFpt6fxurq+gX1te1zOoVubpx
	ZPM7HLnq757wjvBmz/+0Y+1A0PT
X-Received: by 2002:a05:600c:4886:b0:490:d354:d15b with SMTP id 5b1f17b1804b1-49240e9545amr189390855e9.29.1782224998752;
        Tue, 23 Jun 2026 07:29:58 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240efc160sm362507805e9.2.2026.06.23.07.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:29:58 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 6/7] ARM: dts: aspeed: g6: Change vuart compatible string for ast2600
Date: Tue, 23 Jun 2026 14:25:44 +0000
Message-ID: <30aedaa9ffd5ba2d763d8802a07b77ef2d5bfcf0.1782224060.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782224059.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_073000_810560_26ED87C0 
X-CRM114-Status: GOOD (  10.06  )
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

Use the ast2600 compatible string.
This makes it more precise and enables specific ast2600 properties.
Still use the ast2500 compatible string as a fallback.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..7c02633f2bd6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
 			};
 
 			vuart1: serial@1e787000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
@@ -717,7 +717,7 @@ vuart1: serial@1e787000 {
 			};
 
 			vuart3: serial@1e787800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
@@ -727,7 +727,7 @@ vuart3: serial@1e787800 {
 			};
 
 			vuart2: serial@1e788000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
@@ -737,7 +737,7 @@ vuart2: serial@1e788000 {
 			};
 
 			vuart4: serial@1e788800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.54.0


