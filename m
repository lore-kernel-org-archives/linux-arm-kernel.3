Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D712ECE9D4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLUdw3G1Oa8h+gUfTU4WhFpXDYDSf42qjb0ihw6v2cM=; b=Iy4tGCzaaqfAqf5jMBin3ZZMcp
	E3RKN7AIzSrkNtcpHT1eR2CAhR8WTTWA+4qQy9C8ouTYgXrz84HMRVHXvTxUKR3pDt0jum9+1i4HE
	XN2tqVKm5303Gqh91bB6Jn7/I+iLQqDNrqMmwEParKX0UgPJwc5ttWBko1gdk6dC23NKJzQu3CMLU
	hIOaKAVtlx5i9MR7pjrOcq2ZHdi6obwMrzPSaaqe3AEIJlVsVvaAOJfe3ercHFFjWQpT6PmRL4bP0
	OypjCyTgiz4u/44q5TTtVkcKy3EjpoC8Ec4sYWapyso6K9+dflkT2aN6eGUAg/uXqqUXaIAcic+nk
	zmCnso9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8sK-0000000DOUF-1qyz;
	Tue, 06 Jan 2026 15:21:36 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8s9-0000000DOPg-3PZl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:21:28 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-450be85b7d9so719685b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767712883; x=1768317683; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLUdw3G1Oa8h+gUfTU4WhFpXDYDSf42qjb0ihw6v2cM=;
        b=gRqtxNyry1rUjBhr0NKCxJOHt3XXhtzdup5sxErIsr7iz57qA/0+ChJkAjrzOzyPMG
         4ColKU6Q0BWoCJZVY7wvjPin8dmy353m2KM4N+ecj7AC7jJ+U5/5E49z3OqIfJyYG13J
         VoWXQTgfRTWDjUL86jglipD6/WEPThByVWs2z5Fgm46fY2e4Zy1Bp1pjT14oNKs1cj86
         cssDIPkbApSyP/dvVZarhpvJImAbAkJY6xV9FhTu5wA4fZMKtMiQLxwj72NIugOfVmA0
         UG9x1HRtijXhtlIXpJGjZCeOJK5+TeJ7hPqdlkXkTXy4/pW/MsXrtfql8eX4IVYBcQwc
         /YDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767712883; x=1768317683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yLUdw3G1Oa8h+gUfTU4WhFpXDYDSf42qjb0ihw6v2cM=;
        b=bQt7dJ/EVDdf2fvl1JmyRh4a7+zxi2cK1yr/bBv4n83DhXwuZoNdGNDBFEVlrS+c7V
         MRNwRcpMW8dxuIrgBtODikWaWtHbtqoanNFxB8S2IbAY8PchhkT6pIk3f4f74VmX1rsV
         lNis1GzB39aYHAPDymrYYRiZG0gxOBg/2HkrEjTQcxEdxqFV6FPdkPQX+Oq8ZwrQK2T3
         z1rncSaAsZxQa361Ua+MGFhWLDUSD5y9LVXTLbeLDjfV6QoTeGH5FghZZxkAfO85BSHC
         RP7936KOj/KvoGyBUHtWClP1NHCU4hYb4v4pRJFhisIxAB7pKH93ZjscOhYroEV0WNGQ
         bm/g==
X-Forwarded-Encrypted: i=1; AJvYcCV9Z2ScOCmq24BTV6DJJ7hQ9UELq69DeQTPW6ZfXsRfHznoLvRi5kzTYQ/K4mz4iFEABiFfyUt7shQqS8KVlYPF@lists.infradead.org
X-Gm-Message-State: AOJu0YzUigUAI08KUnJIcQ/B2koCr81+OnXde+1DH/CyQO6tiTkZJZzj
	BwcvQUGHIUjnj1N2mp4qYpQxjE3HoBZ+ni5j0oN9GAkkr4NtLvzZlMlh+pSxVAoGlqM=
X-Gm-Gg: AY/fxX4fkIXhij2Cm+4nih40k/aJdX2yvpv8MLv2itdwbICowi0wbFNoDqQgL9gCPtj
	uFxdfVXF1bBIseU93hQa1ebot+HzopOxWwYjdwx+ogjs6493ZLDWuzlloWPbfkdGwr2bRImyBbG
	NtB9584icqoHDX1uGsH1luQBEo4biqbuv3DEH8+i6CNL4FXmUmmzmINEzVGXEEueXQhhXIf7lN/
	zUln3d20OFcL3Ddq59PXc/b5NJwUU+ctofATzi91YbgBjlb4ZlvRQjoFUJxwLEu/kO76/c8VRx7
	19LRoGanjDQfXpBBd6UifaIyqYO5sLh+aLylfts0dvAT/GKS9MO60o/4Z551jnRItJW8TyAzupt
	TfN6O9M39Cl0YWHuxP4scLxTNt67Uw9rl1L9EU2wMxbD2orwUcNZSiZ8kxgpOBWaKFuvzmrTlau
	kcPstGeLsash85i8c=
X-Google-Smtp-Source: AGHT+IGup1AjpsgEeM6td0S+GkAIxXyYXzINH73dTVDxFtfVdWjCyqWoDbH0jNu3XakXCV9kxL+hzQ==
X-Received: by 2002:a05:6808:2393:b0:459:9961:5114 with SMTP id 5614622812f47-45a5b0326a1mr2002013b6e.16.1767712882948;
        Tue, 06 Jan 2026 07:21:22 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7f98:2205:4ba4:3e65])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e17cd81sm1041992b6e.2.2026.01.06.07.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:21:22 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Jan 2026 09:20:56 -0600
Subject: [PATCH 2/2] arm: dts: mediatek: mt8135: fix pinctrl node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-mtk-fix-mt7623-pinctl-name-v1-2-33817c7f78ee@baylibre.com>
References: <20260106-mtk-fix-mt7623-pinctl-name-v1-0-33817c7f78ee@baylibre.com>
In-Reply-To: <20260106-mtk-fix-mt7623-pinctl-name-v1-0-33817c7f78ee@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=853; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=/r4SI0+l+6elgaFXyZuBmLqw3XZThStXnYZaeAp4zQ8=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpXShqRYtO7Y/t+spHv4BW7bgN+6A//HOuBgp4E
 HzT+WaCxgKJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaV0oagAKCRDCzCAB/wGP
 wMXjB/47mtvPI+cDCbmMMGZhiz/J8R7kY1W5YrlWURnb37g533eh2nPklEmdwNJ7W9bfuovn+6y
 8J+V+GFuA/oXsstge/NYuB4OFPzPv7VVLZK5jQvIqS7grLwTX1ghJW7L84Xv5IHPl6iWkYMMvOy
 Om7ghHzt+7BYMfJWt/T7VqxcAqOq5W4D9hhSnIFqApiu+pCskNV6Eu4MJ/eml8y7kpB0iACoGiv
 Z1A3bKfyjj7le0YNc5efuHLqrqpkDiRZZSU+FSWQ4LEaYZU7KCAiTlt45bq4j6IwisjvL80aU0S
 9FAiOQX5axA8Gb4VTM1NZVnSa7J7NwISmc15RsHIERiV0nfj
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_072125_896694_2DA39907 
X-CRM114-Status: GOOD (  13.52  )
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

Correct the pinctrl node name to use the same address as the reg
property.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 arch/arm/boot/dts/mediatek/mt8135.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt8135.dtsi b/arch/arm/boot/dts/mediatek/mt8135.dtsi
index 0f291ad22d3a..b03bd980ec37 100644
--- a/arch/arm/boot/dts/mediatek/mt8135.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt8135.dtsi
@@ -148,7 +148,7 @@ pericfg: pericfg@10003000 {
 		 * Pinctrl access register at 0x10005000 and 0x1020c000 through
 		 * regmap. Register 0x1000b000 is used by EINT.
 		 */
-		pio: pinctrl@10005000 {
+		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8135-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
 			mediatek,pctl-regmap = <&syscfg_pctl_a &syscfg_pctl_b>;

-- 
2.43.0


