Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C1BD5AE7D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IN95TsZhKzuxf3wXQLN3cqZMNtXRheqBLbmEr8nS2fc=; b=S3/C4TltFFZz8Ba0WF9IdooKOh
	5faDx1YXTamG+8jw/CLS7RdzNaPPzfVmdPhQymTNZqSE5INJSpYCMpZKwfkPsQPBohOaJYG19VrK+
	pRL3LZfXpwHg0e9eEtPrATO/D+7AIgWxz2Teif8beCn9Ytsd3z67Dequ9uFl47xl1y0IH4j41NjmB
	UOu7ZCzCacSH7BjFf5aIi9ulxGs/iHbDVmX1PlcJMDl2r5GXHhKl1q2kvUs92JBYUk4y0LsheAJG6
	wFy6wNyQgQeObEWBbxUNFoXLmvbY+RUoPN64lqs/SJ9iA3UlTR44hw6gLMZqnpEVAaPI2aWlTbmUk
	CdkbwnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zPq-00000006PEE-1TbL;
	Thu, 07 Nov 2024 10:07:02 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zJ4-00000006Nlx-2we7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 10:00:04 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso11192221fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 02:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730973600; x=1731578400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IN95TsZhKzuxf3wXQLN3cqZMNtXRheqBLbmEr8nS2fc=;
        b=Fo0sT46VVxq94suHM5PS+UUOmwCq8pwxJN5idodNhJhcF+HdvrtJVEZ5uCynRIxB5w
         tehreu+hgV6pbJLU5kAy6P/x4jfIc2TCnjnxKmZzdTI/jRNqGFbiDukqM7+xYqyxhPah
         W209iOk1gpBqdMZSAsfarDKjRNdSDg2+LRiqhkiIm+9tNsyR3+e5sSJyLJfXha6AYBFa
         77OL8HlSLkcS4D4ZB+uGB9FpoGXorYCUYW5o+imyXB9bXbdGvM924q1pp1BjPv2XLdqQ
         CMJmzCAr4B+WVyUE28enLenxmte2HZfiNhXZ0lqELl+iYwTnxpzBghC0/3IsX2QQ4WoW
         gXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730973600; x=1731578400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IN95TsZhKzuxf3wXQLN3cqZMNtXRheqBLbmEr8nS2fc=;
        b=EMXMfGTNvbZumGLoFlK3Arh1SWSUt/zU5lxR23AGegla2UCttZ489WSWJ9WYmhZr1d
         F3/SQ7hPvzM4SPt0n+9HZW/JcU3qRE9tNLLHJM/f645NRGdM+2p3wHLg5i9xJKnPxbrs
         Fl8ffPpMiN2RL1Z5+9iqMjBcpxCzEh1HO4HHJgiJr04LpzSc4E1xBcaa7Wy58j+cvlCo
         Rxp1ELilWVBOvdYz+A4PBEwloCr8063Q0kPITINUHyCPewr4kYLR5b/UQQlG7w2WMfeX
         apxcMiAhh+TIZdVXWgeh4OFR/uzFFEJkYdpWwEQ0J/KqCzqD0LYCPJrm9k+h1wQ+eo4C
         H9lw==
X-Forwarded-Encrypted: i=1; AJvYcCXwYrMFHtsPjWd0EqPoJtqjAcct8h4FrXnNsBeaUCJjMKaXutR0Xja4qSSDrBjSbWd2cSUWwNcFwQKdeqYNjzpe@lists.infradead.org
X-Gm-Message-State: AOJu0YxppVghOCgFxzk8HkmjSPW8N0UUEjmUPPrW96G0I/vzmiTYIEgH
	yY1F0P6PAURMvJYTw2mssp3drdOrMFCgyZII7vpwSxHrxnWKdOzh98ll6i+HsJw=
X-Google-Smtp-Source: AGHT+IFCiFNbVvRuQfoFDwv+RPdYoiKrDS08WoKMvLYSNKcFfmHvemOy+zCjZFBgqMyl2WR5wPEciQ==
X-Received: by 2002:a05:651c:19a5:b0:2fa:de13:5c34 with SMTP id 38308e7fff4ca-2fedb7c7ad4mr180086761fa.19.1730973599705;
        Thu, 07 Nov 2024 01:59:59 -0800 (PST)
Received: from localhost (p200300f65f28bb0063ffae39110fa2df.dip0.t-ipconnect.de. [2003:f6:5f28:bb00:63ff:ae39:110f:a2df])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc577fsm70612366b.93.2024.11.07.01.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 01:59:59 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: socfpga_cyclone5_mcvevk: Drop unused #address-cells/#size-cells
Date: Thu,  7 Nov 2024 10:59:52 +0100
Message-ID: <20241107095952.73926-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=po4N9CwjBZgXso+4pKcXeUTXi6JnMCQw0mFDrt6dX5o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnLI+ZUNMbOpZaUhvAo4+rsYExY3P3TcxuIcfsx yHtGtx40nGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZyyPmQAKCRCPgPtYfRL+ Ti2OCAC6JZMVR/TlHLkoWK1XnqrgoC8ZZ2/KnTklmBleznsLFzrRmKwimHfjj7lBCrchzlbjYfQ KiAKaTL3IJX5dpbfAoJauRk9uEiR0MCl8RJ6C17ScGXwqkI7FyiQYS5G4tkkoK55iHj9Vav+rZS LsxP0DrkXwLrqn9g3K91sYTTdLu9udPA1987cNSIW1m1i93/HOCRZSCnY99emZvVzyUykNo+Y8i U78MceAWFPNbq9lUcuhS/jDDc+T1f1n+IwAzYcI28+roXklobnbT6doOCT+zju7REwT3vbKqokp BLMRbDkITSm5E90lkK8LyDOjlN9eSw/qmyg45n1To/0nJ0r4
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_020003_108506_86A62EEB 
X-CRM114-Status: GOOD (  10.48  )
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

The properties #address-cells and #size-cells are only useful if there
is a ranges property or child nodes with "reg" properties.

This fixes a W=1 warning:

	arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dts:51.22-72.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@ffc04000/stmpe811@41: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dts
index ceaec29770c6..c1e1264bcb09 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dts
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dts
@@ -50,8 +50,6 @@ &i2c0 {
 
 	stmpe1: stmpe811@41 {
 		compatible = "st,stmpe811";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		reg = <0x41>;
 		id = <0>;
 		blocks = <0x5>;

base-commit: 5b913f5d7d7fe0f567dea8605f21da6eaa1735fb
-- 
2.45.2


