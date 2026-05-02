Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D63ECD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 07:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m+ZeSxbLTHdUprUeLJ8FV3dNcTYT+WtrO6078xK0XsY=; b=3Ueynrldipm0yExDUKoP5R7XhN
	mZ3vT11dKL8Ptcj6DHaUaTQdg9f41miwcKBkKpb7wRIShoHIyfntr82/umu2WyLnwWgTDxJG+UWAj
	yQGxwqGqBmdtI+WamzqspjwTbzNSn7kXsOlz49b2NLfmsFwEOJyLmzj+Ccgj2GKe6x1hJL3BdoUC6
	cAJPgjdBfXFjQY6v5lYWGadnVPFykTODVZf2yDdO/200VNpzMB2vSsb+JnWBEd9WyaWCtsuQJVKp3
	LnoaMJpvQMYdsSRZq+g/3+C1XQRjHT8v+2+iRvqSEsovLShZn0nXpDmN5pTFilTby0j19DbG4CL6U
	zu6O8iew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ56q-00000008YXH-0ANZ;
	Sat, 02 May 2026 07:49:56 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ56n-00000008YWA-0fkL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 07:49:54 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so6796135eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 May 2026 00:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pcc-me-uk.20251104.gappssmtp.com; s=20251104; t=1777708192; x=1778312992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m+ZeSxbLTHdUprUeLJ8FV3dNcTYT+WtrO6078xK0XsY=;
        b=z6vxzO4HgNC/Vkww7IS+I719SC98LIxX2D+5kQ1T2wLEH60+J8WOIgkmvRTYWT98di
         FU8feqb3in26NokVyLl606BYV26Z4KRnPCEvUBvFybM9PRxdmQP9PP7/poh+uJD52G7q
         dan0eXwIES+oBQkts3MLV9KG8eXtHjwYlgqpUOLPT2zTPZF2E251E+nhnAABdDGtZe1I
         Zfnso+R4OCZAaTPb+4S7yuTXj/qjueP3XmcnYY38ht4dazfE84tRCBIbIgk9i0MxSAUR
         gXXp85zcIS/UqbZZXOm+OH8ghPWuQYIqhnSLP9M93prqSzzfK1DZO/17N8cuwf3V71pv
         kE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777708192; x=1778312992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+ZeSxbLTHdUprUeLJ8FV3dNcTYT+WtrO6078xK0XsY=;
        b=CAPIuECw07UssQwO8BEoobMB3uo7WDalOIjCMLmhVaXMnRj23BU05cqt/3sFx+p6kr
         89TbzhULrgs6+4b9vLPKWA0GMo7KRD5TL9//bd8MminhcSSIJQeWAGLliTorVXS/xNba
         ywN71Sm0M9ZO5IiKmJELW3FyOHg+waF/12iJtqPJRJ2znJWTrB57a4BzkM/SWQ6rtWBz
         eBd+fiSqmcHBc+zzBZy1SYKbUwO6FjOGfVjrEnHLHUYe/QNwp0bKfl4xmSYKsBurT6rj
         PrvZzSObElZJv/JtLVtIdPuK81D8zcBEDy+xpMgghIVNIDkTFyEPKCAdcOBL7XjQO3NB
         gATQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yagyuZ5QzYABzhUd13RcFwfhUR4QuwPYYlWUUX3x4S/YfazWxpY9k9AYydU5EctlOi4WqC563ZjBkY1a+as3/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv4Je3nA0W8+DRzYj41sLFThXgT/GkoBFBw2fzaIQkEhuAijWT
	9lEG+BNfaieZcSuPNyze2wrCPw4f3pDKV2kzL8WUe5QTEaffAje3bOqUCFlNChKtHoQ=
X-Gm-Gg: AeBDieue0gsFm446pmKKjCOeFAEzBu8VXYRJeyLS5NHjDSQN1DlKi/I57pB0tjV/1hn
	fKlU1h44MhHJuNXVtiSqpxykQC9xCHhvkzQzHEBl+6L+zZADX7WJliHMdWQOnetVQIZCCk7UDc2
	ZS39wA6H+R9NDFHydZPAGdG0HBVF1zDFBjE00hN20m0k3GbPzSI4B5EZVrPM4D3Pe7d3/6/4idI
	cNkCnMRwqj8N8hmPH7C8ybLPBrFoCzb7FxUN1AP4IEN9lTuOTnB8WW5cCDe6fCiRlykwRKVESGc
	ikV9noP39Mcn006zhJc1pHhp2KPONVDvjD2PmfuJ4fA7jSSbNtiO/OgiyoJB7CeiTbkBIT5CCQ0
	MdaQEG9EveOv+b/p5a6uGgEg72WNq9dSigB8wzzUXC0rH8FWOoKX5CVQ+2HqKbnHrOzXjqqto+6
	dRh1SfsUIkGyrhAzxLr5gGbJ7Jgrya2maLBqUgWVXBG91tF5/iwdQ5v6QxVvV3/S+U+g==
X-Received: by 2002:a05:7301:6706:b0:2ef:1d11:18ae with SMTP id 5a478bee46e88-2efbb29039bmr1022967eec.28.1777708191723;
        Sat, 02 May 2026 00:49:51 -0700 (PDT)
Received: from localhost (c-67-180-161-137.hsd1.ca.comcast.net. [67.180.161.137])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ee3bb63c5fsm7422380eec.25.2026.05.02.00.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 00:49:51 -0700 (PDT)
From: Peter Collingbourne <peter@pcc.me.uk>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Peter Collingbourne <peter@pcc.me.uk>
Subject: [PATCH] arm64: dts: mediatek: mt7981b: Add PMU
Date: Sat,  2 May 2026 00:49:12 -0700
Message-ID: <20260502074912.12193-1-peter@pcc.me.uk>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_004953_455218_EAF41D85 
X-CRM114-Status: GOOD (  10.19  )
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

The interrupt number was taken from a downstream DTS of the similar MT7987
[1] and verified on my OpenWrt One.

Signed-off-by: Peter Collingbourne <peter@pcc.me.uk>
Link: [1] https://github.com/openwrt/openwrt/blob/e4b3d5c799aef3be20b7f6079e8e5a14b215c116/target/linux/mediatek/dts/mt7987.dtsi#L246
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 4084f4dfa3e5..3c6fbb6c5333 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -38,6 +38,12 @@ oscillator-40m {
 		#clock-cells = <0>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.54.0


