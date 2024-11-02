Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9C7E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 11:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrQRRxSZDGbNXWX1+ilmaa9mcEbyxpp7VpcIwNpNg5M=; b=ldULNPkQ9AC8vi+ieYxLxwqYSX
	+/9zdSENpuh2/Ii8LNTtGOlVfG7LRZOdYqJoZnBnyLNY3tsDNAGICgcgnmxeEghrnG1e1sXI4X/+F
	jiKeEGpSJcOzB+IezEHyhkAeTJuBugthVQcIQqYobGXj7mUSCzWv+YJ+Ac2A+r6E5C5wcq+Wc6AAn
	bBX3xeY95F8iaLVePdAzsTA1Z4lfCF5A4POYXgGxsl8THgadx40Ao140Fe2mBMm27l94a63o4XwvR
	9brXEoqyVwh9CzYQvSKVscOqFQFiBC2OJfi0J/d5qL5lgKVltazkWB6F/TbZR3YCE22pNgUkt6V5t
	gMa1POkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CTh-00000009b5C-3FTZ;
	Sat, 02 Nov 2024 11:39:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7COf-00000009aAD-08Ud
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 11:34:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 74F5DA407EB;
	Sat,  2 Nov 2024 11:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 871B4C4CED2;
	Sat,  2 Nov 2024 11:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730547263;
	bh=mrf6lKlF96SpNcTN0gbN/Kkk9/u7S84IM9hSP1KPBDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F2C6lb0QH32WyNtReKR9i50Ivgo1GHFYE9nzCQQyIYvyPHuC40RKtBzlMbglV0GVq
	 bTwz24CKcAJ+ZpRBt7Q4UgFL9v1uPT7Gy5o3efYNk48U6KCM/NqjcRjSmyNtvMgZLg
	 4VRP4tYuVBP+l+4BY2ojFpoaM+5yrqKqJKLq8ur2r/QmEiZJ+N6vwbD2Kh10KkkLL0
	 /oxT50JA6BMbQj/ygQOi2F2d4A0vav7HaedIUdN/2XoKE2S6MB0Ils9RwuTpNzA8fh
	 G141548sTToVM19FntqIV3VLd75d2y4Aqf4vJuTk/8D+NhmxVRhk21yr0zSzWoIWla
	 sQyxG2DqngGRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708E2E677F9;
	Sat,  2 Nov 2024 11:34:23 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Sat, 02 Nov 2024 12:34:20 +0100
Subject: [PATCH 1/5] arm64: dts: apple: t8103: Fix spi4 power domain sort
 order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241102-asahi-spi-dt-v1-1-7ac44c0a88f9@jannau.net>
References: <20241102-asahi-spi-dt-v1-0-7ac44c0a88f9@jannau.net>
In-Reply-To: <20241102-asahi-spi-dt-v1-0-7ac44c0a88f9@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=dM/GrGK9N/5tAToyLPPTWx70HidhWtGG6XOo893Pexw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhnQ1Ptvp6+cnpq9tM70WkXdTq6l03hTzE/Nj0s2OFi5Rt
 4z1bK7oKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJELpYwMy2VeOE7e8ENw+Re/
 ZKat79iT9+5eNve/c/HMG4GymzLlqhn+uye9YdflnfXw4HvOJTMl5MzLIjILV8oW3VBZtbhEulO
 BDQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_043425_286162_9F30D1DA 
X-CRM114-Status: UNSURE (   8.89  )
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
Reply-To: j@jannau.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
index 9645861a858c1a7c46c25a614c2cc4b03083bf46..c41c57d63997a59a9fe3c88de31fddb31781398e 100644
--- a/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
@@ -387,6 +387,15 @@ ps_spi3: power-controller@258 {
 		power-domains = <&ps_sio>, <&ps_spi_p>;
 	};
 
+	ps_spi4: power-controller@260 {
+		compatible = "apple,t8103-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x260 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi4";
+		power-domains = <&ps_sio>, <&ps_spi_p>;
+	};
+
 	ps_uart_n: power-controller@268 {
 		compatible = "apple,t8103-pmgr-pwrstate", "apple,pmgr-pwrstate";
 		reg = <0x268 4>;
@@ -558,15 +567,6 @@ ps_mcc: power-controller@2f8 {
 		apple,always-on; /* Memory controller */
 	};
 
-	ps_spi4: power-controller@260 {
-		compatible = "apple,t8103-pmgr-pwrstate", "apple,pmgr-pwrstate";
-		reg = <0x260 4>;
-		#power-domain-cells = <0>;
-		#reset-cells = <0>;
-		label = "spi4";
-		power-domains = <&ps_sio>, <&ps_spi_p>;
-	};
-
 	ps_dcs0: power-controller@300 {
 		compatible = "apple,t8103-pmgr-pwrstate", "apple,pmgr-pwrstate";
 		reg = <0x300 4>;

-- 
2.47.0



