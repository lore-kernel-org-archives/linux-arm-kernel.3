Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D9EC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 00:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gScTzSF5SmDK0ItX+9bERNg9WxTsYpnT5wGwYZDdZ9I=; b=oyhopPJ4r2dorfmWVkZHMEJpwc
	CIIdhOr2g+gNpGhx5Ny4vapLJg15NnjwYcTw6orFP+5FqNOd48fI1Svn03H955xN3uEfaKIgTRzfr
	d6X6a/yG/fe/Jzn9P7R1Z3QOBm6IlvZlsToz4yMgHSEZUJWT162S9ig/eVOK0pAGAoZh9Z4aFXZXt
	iqiffw3WoX4cwPGcYdRmlszZEUKNfrjyUC7DFtHyqkAftpEkZwvVB9c8wz8BSCCvcqERnU5ushloK
	wO+hDCsV/Sh2yhwZdAXtKYYKziW/YCkBpXpUqZ/mA9AMVAPlRqiumg5rQUC9IqA9/jKTlmshY0FaE
	rL6+7obw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdrb-00000001w4k-13fP;
	Tue, 11 Feb 2025 00:10:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcRi-00000001gyP-2pwz;
	Mon, 10 Feb 2025 22:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gScTzSF5SmDK0ItX+9bERNg9WxTsYpnT5wGwYZDdZ9I=; b=XCC1xDDdvYyc6lwEh97dksD5qK
	Gz2nlLCAOjx1zgIp3+lBm70jOg2s7sBC9XDJve4ippUvKM9WOGivNj0EYWOTc1794+oZ2Z62klTYT
	XAlaFDsH2R/yd452SUs2DnBfDFUCq3keKf41yMKHtKkwb7Jlsj4h/YhAMEA4Kj7v06Dy6Egs1cZ9i
	9rZvkKBmuGuS3AHirwRS4y19SqDSYzEmQRdOxXzvo7q3uGliJ2IyKYjb+1aENAN6hbc7msKmOKvNI
	+WBjt7M3RDAt2HKVDHRogMwAkDmRKPJuRbCm0jXn5VO+iR456QWYX2QgHfjQQYUeY6+in75Id02ir
	MFtZy8kA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcRf-00000000KcE-1uMM;
	Mon, 10 Feb 2025 22:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gScTzSF5SmDK0ItX+9bERNg9WxTsYpnT5wGwYZDdZ9I=; b=oJ0JHXkE7TVR/IUDGFwKNeI/sD
	mG4q1HpllgYfpklOgYi3M8OvVd8odOMeYCCpTRlnppuqFvdkL9ULod0fQgCrcaxQRBOPTmEzRkgyr
	uEKAUcyu/cijniZStr8pCC9+1RwkdK9niCffAZnbBPAKVYw3KUoi6mHqqatbe+DAZfNw70St5M9b8
	8Kum7Gj3oYJsbm96A4286h/Qp3t4O+foRoxYDzD1LhTatDDyKAea2xAa9KG9G8X90+sK0tFegrIfv
	xt5GXGoxCUaAMhr6XozoL/RpaZ4vlHrmBbyrKGXNX6mc/QEqHWGUapkVW2KbQIAhouVuMUYv1BZGr
	laD9CE1w==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcKc-0008Cw-Uu; Mon, 10 Feb 2025 23:32:47 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 3/6] dt-bindings: nvmem: rockchip,otp: add missing limits for clock-names
Date: Mon, 10 Feb 2025 23:32:16 +0100
Message-ID: <20250210223219.1193346-11-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210223219.1193346-1-heiko@sntech.de>
References: <20250210223219.1193346-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_224003_620295_29D230D0 
X-CRM114-Status: GOOD (  10.46  )
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

The clocks property correctly declares minItems and maxItems for its
variants, but clock-names does not. Both properties are always used
together, so should declare the same limits.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index a44d44b32809..3201ff8f9334 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -62,6 +62,8 @@ allOf:
       properties:
         clocks:
           maxItems: 3
+        clock-names:
+          maxItems: 3
         resets:
           maxItems: 1
         reset-names:
@@ -78,6 +80,8 @@ allOf:
       properties:
         clocks:
           minItems: 4
+        clock-names:
+          minItems: 4
         resets:
           minItems: 3
         reset-names:
-- 
2.47.2


