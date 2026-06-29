Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6F1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L6V4gGpbEy0fZNQjjmmHmHR8RvVrPmpP6jHF02hQyRM=; b=lONK3zzksXnZGscK4v8qIxtjfP
	zQxkWIvlPKteXtXxKkCaplzdz1iNLAPen0HYhphx00hlO4llhCOaW0pTlmUxGNbSWmToK6odVgYXv
	f0sV9kVBfz4jLih6YxQClSBSaVAyFFO6MclGcXSQapQk2Ifn9tH4bH1NqFqvq0o975e4Iyj7cYasD
	0+0tbXa8FR2R5Q9laMEy6TJbfH33/+lX1NtImGM49X2ZJ9ROn33B2hoTdBVWZVmif3msslYXjcawd
	xczn7rFnO0gq8zbo/uSk0azVUxAq4Vm1BU6Tn6mo+haHS3oWv4Sl0X9E193WVOYKuveGgwW7AlnDD
	camONcKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weB1S-0000000EXiQ-2lMY;
	Mon, 29 Jun 2026 12:23:34 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weB1P-0000000EXhP-0boL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:23:32 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c9e89fded0so9704495ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782735810; x=1783340610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L6V4gGpbEy0fZNQjjmmHmHR8RvVrPmpP6jHF02hQyRM=;
        b=ZcLcuYZHrmrhw7YIABFGFDLegOOfPCFwsk70XxPaRAfkzx4YYsncdO79lrMNr7ImdT
         Yhv72EW2xbDW8psQQWPkiu4505gHP+D/KOeZBsgLDRn8l0yD5c8gKX3EVdK9kxfDnYfb
         EQ0VBokx8ppXSuES8LV4P/wbavMqptBZy843nUSXxOYktD+uIySkdco8QDY1uD92nOIw
         gjyKE8a8YzIuOZP/dU2rcnlTmf2tW6P4mBqo15bhuvHOj+DNE3a9P49KJf8vJghEhC1S
         +KG22mSE9b+xnS+pU+OFo2TGqLxRRu86YTiGkZj2ZuqZu6gvygQdffm/O5YButJ2UQY7
         cjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735810; x=1783340610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6V4gGpbEy0fZNQjjmmHmHR8RvVrPmpP6jHF02hQyRM=;
        b=f3d3tEAC1SRAiwBSwgz7OIu/qUAE83Wz4m7QNPMW7pVwMVVWn8VY28/YsyzRaGaabl
         qsTbf0py6PgGngBI3H7StvDaxMEUKlFIaAElcrqhs6D2SRsuA6GC88j2Pc4WMSI2ZpOa
         0VavJFioZpm4pV0CuwYRcZ90HMienmwfgMLVeG5Mic8WZr/HTFCW8a9sp5wgfbKOQZik
         9BtcH3b5O3XZOuXwYui2V+BSa4+biewJ+EeXuHXWb3BUNdXkY4RADuhcOzcOZ7/tC7/R
         fHu/4p+F/cr2D097u3RCr9QhHsjSjc4Y42ov2fb9NMwiZ4l7LyAQWEbovQtSBqpgDIyH
         cpXw==
X-Forwarded-Encrypted: i=1; AHgh+Rol3DqZC5xdE/9U8T4BZaOyIVhdT4ylmQ6HoMIC86no81rJfiezLL0QUVl1lPNKuXO9yCYjLdYKJgIjAy/BM4uC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3cbQHoJJraMcv2k8IwYSa8HNs1s5EeBotQeYPjNcOUOQqA6++
	/kBb1fJaISfuhOd/SkZzd5aO/na/y0oPP8YwLUctRicH94CP6tCNJmzD
X-Gm-Gg: AfdE7ckdPIpEMlaJa0bcYesP/RK1Di4Mq69CUbIYGNEOA2lzyTleG4XK9xJHt1VE0Pi
	tTRXsYh6fOibK1xk1Wf1npp+Brfjy9DXbKfMZUtYok2zfTv4RWSCNmm9HZwDjli5pmcoEqTSK5u
	XkFoxOeaQqpiwrkarKk1TdyZSQpDWtqofKCkKijur0v7Iqhkp0dqTZh43OzcTdRLA7zq1XrBTuE
	notxGt7o4qIIQK8b52/cvoYQvPNhl86aA+PiEPN7AtJ94q9mOzTj/QxwsAMulkcSAbygarPJt7W
	chVvcnZ7LT44yIrq0Xbr7ObpL+3xNbtMi6MJo+edW2SQZGOu9Wg5T61xFup1NKpwJIMJejc757O
	KSJmWiVYAgtpvmoaERdN4H03OreiSv+2HvGgB2JCzHMSRO/iDJiRiQ5hw8k1QUb9HfKlRJPJXCG
	AJUTLkRV8su3RK36sxNzdhz1k5/RudNd0ORW0vaseffVCm
X-Received: by 2002:a17:902:ecd1:b0:2c9:fa31:850c with SMTP id d9443c01a7336-2c9fa318680mr27451165ad.39.1782735809679;
        Mon, 29 Jun 2026 05:23:29 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c89d9bdde7sm57104195ad.75.2026.06.29.05.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:23:29 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH] arm: dts: mediatek: mt6589: Fix timer interrupt trigger type
Date: Mon, 29 Jun 2026 21:22:46 +0900
Message-ID: <20260629122246.148696-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_052331_184207_4A6DA2E7 
X-CRM114-Status: GOOD (  11.85  )
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

MT6589 uses IRQ_TYPE_LEVEL_LOW for arch timer, but I sent a patch using
IRQ_TYPE_LEVEL_HIGH.
The timer worked correctly regardless of whether IRQ_TYPE_LEVEL_LOW or
IRQ_TYPE_LEVEL_HIGH was used in the Device Tree, therefore, there is no
actual impact. However, this is not a correct description of the hardware
so correct it.

Fixes: 2a5d54507c68 ("arm: dts: mediatek: mt6589: Add Arm Generic Timer node")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index 46dea445742b..df3b7bfeac33 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -45,10 +45,10 @@ cpu@3 {
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupt-parent = <&gic>;
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		clock-frequency = <13000000>;
 		arm,cpu-registers-not-fw-configured;
 	};
-- 
2.54.0


