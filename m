Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D383CC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 15:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=521A9KUhtW0cKM/KRBSLU9rkYQy9/A8z8nlm+NiGrho=; b=0snOWgg4VpJoR2dmUsLp51M2MH
	qmWGZ7wCwIuk7SFJ+MIVVdXbceZx3jmeJ814nrMctqxSKxRazxyLLJWQF+0EOdxyILAHZKZTIN+bl
	4j7r+GRTRLtlSM3haj1kXlea6oZ2AeSPA6+s+7w6F91SpSgwmUh9UJDF2mJBUvMF/iviKO4gNCfs4
	LAgoep8UytZnnZlZVxzWmlk8uMEDpNuos0XkGDIW72er9fy09SZg+SHYVztJfdS5JouquWPlLsIoe
	TuDSeJ7AuV+EkuHUvETADGXHEN5xSvTr50b9qgWST9k5KXUSF+szA9mKEyl60yJIKx66l8rBCU5+P
	jTMV7q9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Kqk-000000073ck-2WEA;
	Sat, 29 Aug 2026 15:20:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Kqh-000000073bj-2BHp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 15:20:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so19195625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 08:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788016800; x=1788621600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=521A9KUhtW0cKM/KRBSLU9rkYQy9/A8z8nlm+NiGrho=;
        b=JqjXw0Pisau1t8jZ0b9Tn6/DRIAu5iPEwkWw6Y8Qh+mUSpOl92RzVU9l8qWLnOWb4Z
         Vzgo39gRXWXPpHfGOaXq26rV9NI4Nj2vuHpg6zmyM4jdzuJkUW82HGsaozSaL75UxrwD
         325AuVPMfiv4QZTkzSP/z1BXe3mmPlcjfMvEJiIzxo0y//coUNul5Jn2rF+l8dOXABm3
         CPnBWUeQLllQER0PUGkpukADh62Ekc6pSY9Md6EIBNHI3gZfPP/IMZBHPub+4cBDE8z0
         SuOesrYQbj9RGI9bYeWkwdopHe5ESLIvNagHzHygfhLkAQCbE430OeIugAkyvkAjsVRU
         UNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788016800; x=1788621600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=521A9KUhtW0cKM/KRBSLU9rkYQy9/A8z8nlm+NiGrho=;
        b=J9DK1TTCGIj15ZosdDhvB63wj+WwxQmmyVUP2fDYotbAJdl1znmdXlOdo7OTdMpl7y
         n6SY71wFzugca/79/gxn0axohHKHeCW+JMlIJ0fyFZ+pwLntSVj0umKsRdJdpSjPIY1K
         j6Tl1Q8ro/m+2ScyBstAs9NGR9qvhgS6tyQ3qHT+jb1GQzVSVcvoZDCrT5hymEeG04nc
         Pcl6drcA1FNAg9dWPhbb4nb8VGFz84Kyq4zsIXvv/f3RGBLTiJ3UYMp3E6Ob+K5uc4MX
         uUVjfWXOYRNCurkCryYrcecLU3rKdZsCgmeUlzK+mkXEzuPrlmGvEX3kaiLrtLSzqVkk
         spOQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+a05tMzDk5m0CNIQt2z3LykfFN3sxzLyzck7bZS8R4iL7QR3hQNRNhZeO0qg8U6GAZklDcyj4duxMbkWIY291@lists.infradead.org
X-Gm-Message-State: AFuF++n7FaK0C0Czs4mCH6e2dA2U7LqoJ3Kz0gNl3kg86868CFoeN4eI
	pXDqu0N8bO5FfJuswXuqXmyb+M0FLpgmLhpz7SNVjERyf8QlxwLDMug=
X-Gm-Gg: AR+sD115JONkBi7Qq5xiFWdbtd9PfTZlYh3ih/r5umMjy7+wOI16l35fbQVz0ktecjd
	2GF5yaXsK2hxr4CG+UqyVXSBHI8NlQqFABQwg4wt0VGWyZTlfjidTBwhwU+HoVSXXbWGwRP5ps3
	CaoBm1coLVV5cRm+VXPXj2M+J9FMJnJj4Frrw4x2XjalFss4HBthK5UXp/OZ+l4CfHg4xQOPr0w
	nEew0Jb7NRSsy4hixJklevu4bfjcDMiwCaJ79AyjehD5xxCrSHBPndHRQj8tm6692YWrBhXlZ0v
	J0ps+x0IyrEzpMlHWDF3rou2ETMqyGTp8kPyYSA4EG/2smolVJ5UEM2dPDrmW5i5W6ctShiBgh0
	SL1OH1iFiEity8mVBW6VAg0RjWRt5593nul/T53Xq13zMuHD1pdL40jULfO64aICa4rEzVyYfsg
	F0klrb/NP9w2bNHR2WB+ZY1dqsEwNKCFDBj1ClQjKOXd8AKI4ZsZGxc2NP1P+/xYVwNdkEZpqO1
	R+xXIgJUKmBuTS7+/xd6gCRmnz71dgpCwZBPIS3
X-Received: by 2002:a05:600c:3546:b0:499:dbc0:370d with SMTP id 5b1f17b1804b1-49b91c1dad9mr216188385e9.2.1788016799980;
        Sat, 29 Aug 2026 08:19:59 -0700 (PDT)
Received: from localhost.localdomain ([193.160.247.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm38959855e9.0.2026.08.29.08.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:19:59 -0700 (PDT)
From: Andrea Pesaresi <andreapesaresi82@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sam Shih <sam.shih@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt7986: correct timer frequency
Date: Sat, 29 Aug 2026 17:19:55 +0200
Message-ID: <20260829151955.3661893-1-andreapesaresi82@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_082003_765439_B71EDA6C 
X-CRM114-Status: GOOD (  11.77  )
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

The MT7986 architected timer runs at 12,986,200 Hz rather than 13 MHz.
Firmware reports 13 MHz through CNTFRQ_EL0, causing the system clock to
run slow by about 1062 ppm. This exceeds the kernel's 500 ppm NTP
correction limit and leaves clock discipline saturated.

The corrected rate comes from MediaTek's downstream OpenWrt feed, where
it is applied to both MT7986A and MT7986B. Since upstream mt7986b.dtsi
includes mt7986a.dtsi, add it once to the common timer node so the
architected timer driver uses the actual counter rate.

Fixes: 50137c150f5f ("arm64: dts: mediatek: add basic mt7986 support")
Cc: stable@vger.kernel.org
Link: https://github.com/mediatek/mtk-openwrt-feeds/commit/6a4c41c41410cd5042ad10c39da6593ba036283c
Link: https://github.com/openwrt/openwrt/issues/24789
Signed-off-by: Andrea Pesaresi <andreapesaresi82@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 9ebc19610..318639a7c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -657,6 +657,7 @@ cpu_trip_active_low: active-low {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
+		clock-frequency = <12986200>;
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,

base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
-- 
2.43.0


