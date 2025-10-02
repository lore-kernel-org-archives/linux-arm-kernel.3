Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A55ECAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 19:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d/gbplP1B7qXcxXjextCIPtkE0JJrRNYjBjwQhhQcJg=; b=fCOnOjXOo73My38Ctg3q5sBWWa
	bysFDHFUfuEYyh+TE8qJ7hzmLEiy9+XwtHPwACul/21RgoSba5s+r+0Kj9v1hkU/8yTYhWPpSYZt1
	spIZvZEu3HKyarfHGUUacruIK9RW29dCeeQlmKt+eRiH4NMiXy+fRZB3oAS26qZiuT4uWDaGh3BlF
	m89v0NAKm8uLmm6qTPsxzPOm8TnZsFYzgGaIP6BFfxfJ884w8gpJigTnfFO0o1BVEOcPGTZGeQJVI
	Kqyw8TlsVz3+K3XiMdP1A11uIsqFHT6umO+a5iyE6Nl2iMF5lhmk9/J2bGHfCwfJ+RIvx4ohlGFJj
	XBG7bzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4PI8-0000000B8Ao-0VxW;
	Thu, 02 Oct 2025 19:48:40 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4PI5-0000000B8AQ-1P4H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 19:48:38 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3652d7800a8so10830241fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 12:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759434515; x=1760039315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d/gbplP1B7qXcxXjextCIPtkE0JJrRNYjBjwQhhQcJg=;
        b=MfpGu4XNtrtsvuMjDE8FVbESD95RU8ZUTsb3cBIyjP6jKY2TA/tVv+OQMrxDX/PCR+
         R/ucvdvsrH7w51HPD9BoCsSXYCQOCrevjvaT68cQ9Gps4256Zmwx4+4j8v7vHAp2UJ1J
         w8QIrXyBcfaVvUhorDAVcUOGXt2F/hRONGgSMKAFlKPqZj4Ifk5beLxlFScrDvX/RJDp
         +e0ErzK9f1MC1a3TYRNXikHFgrADHHAixcSmnSEiYMl8k6hQuFk/ncRSoMmFFVFDn0KT
         Gk6jWpP4AWHoP5MU272pWuVbUeuZpTC513F8TY7PUvyrDY6IljnYj6NPOqENaOmqBVCK
         WXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759434515; x=1760039315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/gbplP1B7qXcxXjextCIPtkE0JJrRNYjBjwQhhQcJg=;
        b=Yxy2MpUFCqFML+uXC39nG4wkK+Kqa93b5ajhUNnhe16oVIKFkgNbnynRN4td1+mVU9
         N4SoU7/kyl76ZBZUzWKKNNFZLytK2a/6FwhDp3zbu3EzOuzVoHU+DFO/UAk16NuHD3XQ
         Eok46u97OvAXT/+MkfJKk+H6+BtMHM0cd4xz448UOOHmtV5WXtAYWC+vc3Bp+fPOyCD2
         Mwow4MAaxvZdVAjKxlr90YTTjCniL8S7SgCIKAPFzkyrvECGmnkCDXZh2bpH9fzPsbfL
         bX6ujwIiIxqX7LKmU2hI5PNdaDl61ViHJwv1QCR7iXaBERl+wcuofXhDMsootAR2EVyT
         cQoA==
X-Forwarded-Encrypted: i=1; AJvYcCV2hOCQVNV3FvVq3b1/m2LYJbdSoka+IQB8+LbnKmZEzTxX+sJL3/25jWwIk5q1vRfGyEXwVUl5glvfHDfyjOOo@lists.infradead.org
X-Gm-Message-State: AOJu0YxdLroFQqzvnpQoBMDPaJJo+lNgNEkZflTH33C1dKJ6u6a4yyEL
	z3aumF9ch3QfHs4OuZu5mGhM8CGc8AWWj2a1hvJP/g0Hzxmfqqa08OFC
X-Gm-Gg: ASbGnct4R7rImSIBLbDCEvgoxsWxE8OSVFx9KpTShsXzKOo8IN8Bx7Ats5BVFPHjK3U
	zCr7cdGo4wrbSQiGwb3aP7v8+FQL6Bq8ofD/jEotwsXXZ1qdMNwee09gFGQp5Xcx1AWekQtmvxR
	Mr3bzgsA4NVk3L4a9/uhzXvUxDDgHhMQyN6wHMRkWLCLPneW5IoQ3oEv7W3fsVzcb2Pd2IpCp7P
	1Sl5XKS2Gvp3LkzCGyPODDaJ5KZwSJrBYQnwlpCC19OOx3PDVG/XEP5pRPzSeLdNh5QkKllPXOq
	wELsuq39lwoCZ+0ZKeqj5ujZE8o0OPVO5hnnhX8WuWIhSfIx3Yq9EfPnMlkPMSJF9mKdopojinX
	WaPQzWTnlcwrTzHErTTxud+xibvTnb+guKEOPtdlJwRVC7gKD5jfJITkh
X-Google-Smtp-Source: AGHT+IELrL05mo/onWVydfWqyfhsUUiXFwKvaXehHGtbG7WXIyXgpRg+lJEHtfppQeAj6E4CWfYJ6Q==
X-Received: by 2002:a05:651c:1506:b0:36f:284:56db with SMTP id 38308e7fff4ca-374c37e9b65mr1127731fa.23.1759434514466;
        Thu, 02 Oct 2025 12:48:34 -0700 (PDT)
Received: from localhost.localdomain.pl ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba3127a2sm8783171fa.29.2025.10.02.12.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 12:48:34 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] ARM: dts: BCM53573: Fix address of Luxul XAP-1440's Ethernet PHY
Date: Thu,  2 Oct 2025 21:48:52 +0200
Message-ID: <20251002194852.13929-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_124837_383360_D63AD0EA 
X-CRM114-Status: GOOD (  12.74  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Luxul XAP-1440 has BCM54210E PHY at address 25.

Fixes: 44ad82078069 ("ARM: dts: BCM53573: Fix Ethernet info for Luxul devices")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts b/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts
index ac44c745bdf8..a39a021a3910 100644
--- a/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47189-luxul-xap-1440.dts
@@ -55,8 +55,8 @@ &gmac0 {
 	mdio {
 		/delete-node/ switch@1e;
 
-		bcm54210e: ethernet-phy@0 {
-			reg = <0>;
+		bcm54210e: ethernet-phy@25 {
+			reg = <25>;
 		};
 	};
 };
-- 
2.51.0


