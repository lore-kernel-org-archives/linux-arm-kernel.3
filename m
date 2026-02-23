Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C702EA4FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRCjL+EE42kWhMnb2piV+g1yh/Py8//tJ9ex6KvyCIo=; b=x17yTC2XK7WLgwOaY+oceRvGBM
	lNQNI4lX8kuTsQ/y+ulvt8/4ocx+zCSQ+cUHGsggD/VdA0QypmuMdBzFLo1OLlKM8gImsKkRJTwIH
	13DSGjVLYf+eylvNA+LvBVSg+Ply6No9X3UYAnZftj39Cd+fuLwSnrOVNPUqT513XLQ4InDvS6+ns
	eHgYK/6chtFPD1YOXXQ7U1Cqrj4G6+GXI9M48+6tSaUILCZHQRZ8CBVqm2cxYnM5w8zEC8TeTj313
	W1s2zM69wKv8fcM19G7stDomJMG9DSzbq2fBYbrFZzTzd7da9ZI4LrMz26slxH871NY5YGCKm2xBI
	/JtIY35Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwp-000000009C7-0GA5;
	Mon, 23 Feb 2026 11:17:55 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwm-0000000099i-0zhZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:17:53 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a929245b6aso39734445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771845471; x=1772450271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRCjL+EE42kWhMnb2piV+g1yh/Py8//tJ9ex6KvyCIo=;
        b=iHqmNUBq8qIqMZPJjZv6bGqaS8LDXEjT4A1Sk5hwUB2Ni2tIkR1fKPiyKIz5oJOPEo
         RRHTEUxzcivQZA65GN4z9kf6vw3U1jDjj4sLPz3BWQ7s1ivl3hi4SU1aL9IR8LNBdYq5
         adzS/5Qz4XFkc3HLmqkMRhphP4j1ctpsER3XT/ZTKAKzLxwKGB6XDy3JTCyJlsqFgTFV
         z/i9DE1Z6muqrY4LQe9mFTYq4vQ1FubgsaZ7b3w3FxUaCzkLjXaDJA7XuY4g8iGXMt/T
         Kw4jQjtimrd4twY8YcnxdHXr9lLRKmJ6rDeA3JpnB9cWl4elxS19TXHDSCK/qwNyJ70a
         VffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845471; x=1772450271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hRCjL+EE42kWhMnb2piV+g1yh/Py8//tJ9ex6KvyCIo=;
        b=lY7d9PNQGPDgAnrS/PCKIY1qzRMfZ+Xzp7cYdsj6mbZhFqAHXGAGsG6n9L2VHBPZ/i
         UqSDQsP3XfkiTJzUwqVoorLs3c6vFHR5gOjuKek5I9PBxjieya+3MI7Mk2wbNM0lFJX8
         5jcy9rZni+MOuqUvfr057Ef5yVERgBeWL0a/pbAJAGsIPYj78t4f1tmYFA+e2+4wXbIy
         feKnO9qFIQIqf8FQvveEsadmmv97HizXUzDzqfac/qKe0sfb1KR05l+BouEa5u8hS/aP
         jOq9USNJw67Ps3+ng6NNZAssDCva9Q619lPRiLuvvUZogFIEkBK4tFRMZeTkHDZTSvar
         O3tg==
X-Forwarded-Encrypted: i=1; AJvYcCUKO7+LblYa3dBFWlXbk9sERCSEiDUyjchh0hF//vu0j2qTQjYWL8PPd32/SgkVRLgvq3bf9DELjxDniNpUDzmR@lists.infradead.org
X-Gm-Message-State: AOJu0YyK5RwGidt5RG3dkzkySzBsxxV15AqzqaRkqXSSg6b0MsxjuGsy
	R4ZzgZfPstIIlXof9OuJndse2gqxfW6PaHii61TVbjasZpTXjssb1tOX
X-Gm-Gg: ATEYQzxW7slBLihGoxXpiHgnnjzi0F9N1y9uJDxQQbAdDsJfrPVsFx0y+BlRsrPtaQu
	BKqC7wRPoeKnF/7pIqB3wKotLFbiY2iCqfYRDFYlUHF09atl+RZaImvkPn4fDcKvCosUiwEa9LS
	jjfQfiYVy5fuMBe1RhwHn5U/zm4EpnHXUtnjKbdhNTJ8pYs/q1I9U3fb4e2+7H57rS+fpOKbuU2
	QKydtoLqsvR6LNJQBy42rt0V/qmJNQ4E5OrXf0R/jBYQ2ts7wfuYCz3xVvJ6UiezrVZxPc7GwQ2
	rU22QGEJaUAbornh6UsjmehbBJjeN1+ohvXgjgZnBruQA5TqoRfRF8bPKhDOt/ZaAoWgR7HipdT
	T12oncBr2hjkYc7wliEdvgQucxr/gywmvij1XykaiwRVW4le5BL6pVIpWChJtN0ssUsFUbm4YpF
	Bl+6vzcwWiYqMNnieuG0KEIE6Ls9aLLzK8uaDmR4aHvqfOZo2++oN3R9VYbq9df9iHHqlkjimTa
	OmsfiTS8Vi/2C1k9flA5yRUyq8yN65aNNI4Iw8im170v5dAARUC/jkubxBrmysfaKpgOCy7SLzu
	gMk1rYx13DOTMWi2FX5Sp42QFSoXVYg=
X-Received: by 2002:a17:903:1a2b:b0:2a9:6414:719c with SMTP id d9443c01a7336-2ad74463c78mr70338135ad.16.1771845471195;
        Mon, 23 Feb 2026 03:17:51 -0800 (PST)
Received: from 2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net (2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net. [2001:b400:e3a6:b683:40b:c296:4cb:fbc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74d36911sm71799335ad.0.2026.02.23.03.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:17:50 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 23 Feb 2026 19:17:36 +0800
Subject: [PATCH v5 4/8] ARM: dts: aspeed: yosemite5: Add IPMB node for OCP
 debug card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-yv5_revise_dts-v5-4-fc913e902488@gmail.com>
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
In-Reply-To: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Daniel Hsu <Daniel-Hsu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771845456; l=881;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=av+7nUIzNcRonWagw3z99/fjVjTYsiFRkATkeneAA4s=;
 b=Ws5ihelxDVqIQUxXO7hw5CQ8FFbcVwALjS3z506cbC48qdvhgLgy/1do0c8xHzKjvqTLQPwIa
 6QORwth6PbQBSujcIM/QV5/IyS/+WnHx6oDBUJmTR5cy5cxV0So2jxG
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_031752_331153_C9F1C765 
X-CRM114-Status: GOOD (  10.95  )
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

Add the device tree node to enable the IPMB interface used by
the OCP debug card.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 983aebc394d9159c7e3db2e7c39e963f7b64c855..84d3731b17f7c7c87338672bbcc859de2b89b722 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -365,7 +365,14 @@ i2c6mux0ch3: i2c@3 {
 
 /* SCM CPLD I2C */
 &i2c7 {
+	multi-master;
 	status = "okay";
+
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
 };
 
 &i2c8 {

-- 
2.53.0


