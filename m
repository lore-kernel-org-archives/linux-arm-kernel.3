Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F03C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 22:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LvYS8NKwdWmh3EA3ib7bv++8n3IVYdz0vmZXYG0F4Hs=; b=CDwi8bdUHNxbQk50RxjyMQ1kky
	DU4TSbQtZPeTbsBQvnrHXjogty190sdKxNzXwdY5q6c9Z+rU/94biC0s37GOEGFKUT0F6ct82q1aD
	yDv7j97vYyCpPjqjT2JkaZCFd4sp4aKrgcJikvE9ueLx6boAIZmODlNw+Xt68VtnB11D673YKga5m
	DTbJk+MPWv9N+1RdnJqPZpbvyE7KFRDfBRsZeqsK+KP6crdlMzPJfk6Ny3mfc9HPR3ymo+/D3DU/z
	AvsEEPhYTwMj9bCO3F+xmOlzVDTYRS2e/rkpN2Dt/orKi4HI5BvVx9uNVM2N5y0ZHFJLzmO0HORUz
	hbWxEGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnkMM-00000000jdJ-3Qoo;
	Sat, 25 Jul 2026 21:56:42 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnkMJ-00000000jcw-3YSA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 21:56:41 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2163088a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 14:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785016598; x=1785621398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LvYS8NKwdWmh3EA3ib7bv++8n3IVYdz0vmZXYG0F4Hs=;
        b=dXkUgp8QnhV+oY0kgyPxxtcXS018mvteL5ah63iSWg/uogcaNy3PVVXHMXxRrK0X8z
         BnSdpXo28l7YRjGaIUPxG0oOuQtYaIMyucP8fz71OqUrRjScJA/uF9cnD5631sU8iny6
         nbq0dSSESDjXWsJcu4+0A3KngNraRb0z8eu/cS5U/lgRwGlZMhvPmOi1CDAhyWuFuGIh
         ARHkHRcxtQNaTS24Goq0sTvgH9j7cPmPKDJKo9/7wewqOnoLeZCce6L19R7SG+oeyMHZ
         15iYbpBTOORALq7Z/epvLTIpYiBX2hg7i9hq36KXXwJby6rWwyJL3JyXGBX+CRdrUVfU
         ZZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785016598; x=1785621398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LvYS8NKwdWmh3EA3ib7bv++8n3IVYdz0vmZXYG0F4Hs=;
        b=rvdmuA4u9aSQro96etVm8fIhfLLc+WJGvk4EGGQxVMMh2vah7IzgLpPfNpdT1LIZcQ
         kBuNa82qGrS9/LrT7Vo4brRcB3Vq95wXoFxegr1hfi3G/a0GSgXCV3hXRbFTwupQPkVt
         jiYltHUCjCZAXpcoGYl5vN3LSJIPqIYg6BRqFvVLsrGSicYfrWhFlGlkolmVkNanpEZC
         It9Rha1H/TGCLOeaO57dOXh9tsT8r9rB68VL2sJ4AqErEhRSqiS8AJz9Atogxe+U8ErK
         4VrK40lWMf6tBF9NI44C6vpIVRUz3+2rm9LMEAirqHigpjLZsG+GyeZRj3y6kRfwizL/
         VIsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/3ewd2UEh/5IYNYitPb9ELb2df2S3AVXVob3xcaUc/9XoJeLXdaBdoGmcmYsb/dLDUvFM6/vZmOcd9aExz8eD@lists.infradead.org
X-Gm-Message-State: AOJu0YxHW1oxTKZjJWyvfRxpH/ceR0L3iTj84pt5OZbNNbf3xAaKpsc5
	q0MkPDt/Y/pETWvY/g9Q2msvfeIBCmxuyliyU1ASLMEG0EVxSOG+yEKk
X-Gm-Gg: AR+sD11LmmkZgvqdegCDimsA7QqCZGtPICJBm6RQ1OkB9532zmSa3fYRZ7An9PFwHdx
	5Aribv6pYIuB9J/m+C5yorlsIc0j5U3g5c4mYnU/okDOIb/CkLjgGJ700vQqp+IANR1d3KPCqFV
	R0pXBLYbyo+YhWAczj70j1jmOMRFd7AVaVAnbTnSbf8ZlfINVBxSbDzmI+INU4mm1bjE0d+lqw9
	SE8U6dAkQXtoUuW0oiNn7Xs5gdYlFmn2XZ6kbExlqPxl9IwNm4EYoEgKEKOYHjdahfHhtmwTq67
	9FnoKMWbPfVqOObaLiwwRU72ANUEJe2oUree6gCKnDydy6v/Ak1Fp/karxZkCIyrXWBVQYmT2Ht
	+cQ2008tKDt0XB5bN8PLHashuFt+mJgC5jHS9O2gpiB9FD+q6U1CaORUMuq38F9EcZzm9+N/nX5
	2rWdktkkQqnHLsxq1vH+L2vHymQaIRHA60ozbG7VhhHpDFz3YO4lSdWT2f7RDxpZ4rrqaVCBWqD
	BVA/y/Py5xaY8OD99cA57od4EzRMT1GKx26TfuzKB/+n8FzyEJZvPc=
X-Received: by 2002:a17:90b:4b09:b0:38e:120d:df09 with SMTP id 98e67ed59e1d1-38f296554e1mr3503484a91.25.1785016598427;
        Sat, 25 Jul 2026 14:56:38 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f0583bcd0sm2267757a91.1.2026.07.25.14.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 14:56:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: R8000 add NVRAM with MAC address for WAN port
Date: Sat, 25 Jul 2026 14:56:34 -0700
Message-ID: <20260725215634.9181-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_145639_912742_9E0C3E6B 
X-CRM114-Status: GOOD (  10.60  )
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

The R8000 stores the WAN MAC address at a fixed offset in NVRAM.
Define the NVRAM region and attach nvmem-cells to the WAN port
so the MAC is assigned automatically by the DSA framework.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
index e85693fba16a..a4b135d37659 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
@@ -36,6 +36,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et2macaddr: et2macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -211,6 +220,9 @@ port@3 {
 
 		port@4 {
 			label = "wan";
+
+			nvmem-cells = <&et2macaddr 1>;
+			nvmem-cell-names = "mac-address";
 		};
 
 		port@5 {
-- 
2.55.0


