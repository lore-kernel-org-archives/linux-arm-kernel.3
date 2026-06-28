Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417DBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 17:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6EXA0Eq4U3xfkyZSos69NYqUAWxpb1BwEfcIVdoTYs=; b=DfefCmu0oLDPyWz4jgc4jmemoK
	Il/hzcWrI0UpuzBAIEN9bKx8D3sK42MUIwQ+YP666Q10xTrYFrfw9lXNtHwKH1uu7dnK32kCPkFcy
	A8rc8bUuwnv1sYkUxF7fradYWi2reQCZbARIsKAs0KTmJWLZiumIcfBIhlft68SrMrQUGDxMWS6rL
	RbKo8+Ao1bHTn7M4UkCYqH93kGmv6DSfC0KmlvIMLtnrlNcbjCfeiotf89PUqIFjiGT+86Apdf/qF
	eaevzNe7xJLCTDQRRQHafQpMrXQVXe/jEF7MdDPsoNorYBW3czNhOJqeyvegd3gKlP5XhKAISwsj1
	sC2nTqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdsyI-0000000DE5K-2PcS;
	Sun, 28 Jun 2026 17:07:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdsyG-0000000DE3s-1pOw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 17:07:05 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493a613571eso5442015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 10:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782666422; x=1783271222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6EXA0Eq4U3xfkyZSos69NYqUAWxpb1BwEfcIVdoTYs=;
        b=EfzU0OMx5BIbazYqft8JL/0QJNhaGtUUZi6ikpQEuboTx600hjiJPVeOtSXEAE6ofr
         DtSvpKoYl1p0dtlGkcpSAiECku6u05XGnRJRQRHT1mIF4o2VWScLPHRjMnQx2h4ekLV8
         k+P+Ey3BQcieyY9Qmq4XA/BLOIgUcxF16fUGbvgWxjCKGglBxXNgAN+cpHqXw3yoi1dc
         08uSRjWJRNlIBFC7AB6KLWrlFG6cngVfj5sRid7SLpYnL05npbUPZbemXlKdwI8QgsI7
         ZuWV4idDxhnfJa2PWFx+HEHSD9C8fVjTADgBaLJRsoZmPh9gEJexYvOCjAWk1le1Ep7T
         6mlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782666422; x=1783271222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F6EXA0Eq4U3xfkyZSos69NYqUAWxpb1BwEfcIVdoTYs=;
        b=ZAzkSkXW00vtgCOP3FFkzdR5Sp63vsdN7S1zxUi4NfyQC1PgWlNWSf1Ite9w3occk9
         klJ5261g73FcgKSAjxbp2VfAZ67iVPkztU6fmxnnx2j7jzI2OGtthlcZK2APqQrJbC+F
         kw2zJjzlT4RNfH6Bz950VmTkRhWVTSKftxAjU4D4KfCLfnC7XrfOUmsr3KGCWbq5VC9f
         6B2IHFpl7eG72s50571DiQ6gTDHOliym10NLiyZbfHirL8YEH2k6RMc8pcsNCIT/LqiY
         zaaRmWRRUyLnxsf/fIYytUpxrmiTVFYz65VTWJhqM2RLEzwKooQYg4/KyZj0DbySTAaf
         +7TA==
X-Forwarded-Encrypted: i=1; AFNElJ8MehqncQy/FyJohVy55CQ+BtYm6vYZGw9p6ngM5THPRi9R7AAnJXqsmSLfAps2nP5YzNG1mLaoa2x4CIzZcS8B@lists.infradead.org
X-Gm-Message-State: AOJu0Yz83WzVGUeCYAyepOLVdzTQD9e+DbYVWafmqdMiEpK2Z1CBVXVg
	yT7zhQFIElJjoOpsEKVaPTF5Ff2e58Q/EpKtFAcYnVAs0ORbaEiIaE04
X-Gm-Gg: AfdE7ckIOm7nBts1sssnmwCu2yb58txHyn2pnJVgK3k/ly1oWmbLnayJSTPaFb0UbCY
	L5oSDasZnYr7VcaDk1iO//lEzTCL4rjHcBLxzAAg5hR1jCuFVl3hbmqkB+M9YrZhg+Uil2BovLO
	JmK7x8X1FbBI56hfbKo6OazubYAzdiUXLQI4j3Vi8lnWRBLWBM7RCVzcKDe9Ep0pImloDelA0b2
	sE+ly7H9DwOkJv+IvFQXKuGo60tx5mVzRtqTnXUtTCKaecLGZd119bFS4MaabdJhAZs20dav+v9
	VSd3/AXCCwjMKF1Mpd88b+BsoG92ETYpRUf5YJlBLnBwtusDA6uC19/ggu4A5H19rUECqY1LXXC
	jG4yOsbKX0xsomPjIWN9jFIqmM3+DAQ/z24d1QrhU2lSDy6fsjjBk0v9LCubHBHC1UwxyRs8N0r
	TAiaN6UubbM/Ih7wFhOrB06VrWtSoRtXLibCgpAEs0r+AZN0Jg6XZphkg3jI5/ZUvyuu8xTIjA8
	6FevW/pZ5IRxkg9rNZrA8P9AA==
X-Received: by 2002:a05:600c:3e8d:b0:493:a5d4:3798 with SMTP id 5b1f17b1804b1-493a5d438e1mr51953535e9.1.1782666422446;
        Sun, 28 Jun 2026 10:07:02 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a7fd1b0fsm54217195e9.1.2026.06.28.10.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 10:07:01 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 2/4] arm64: dts: ti: var-som-am62p: update audio codec configuration
Date: Sun, 28 Jun 2026 19:06:47 +0200
Message-ID: <d59a4590cab14865f5caa5249c4c6ec7632f7d5f.1782665899.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782665899.git.stefano.r@variscite.com>
References: <cover.1782665899.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_100704_488489_DB873643 
X-CRM114-Status: GOOD (  13.49  )
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

Update the WM8904 audio codec configuration on the VAR-SOM-AM62P.

Set the audio reference clock rate to 12 MHz and add the codec DRC, GPIO
and DMIC configuration required by the board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index be19cbaffc4b..9440891339b3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -152,7 +152,7 @@ simple-audio-card,cpu {
 };
 
 &audio_refclk1 {
-	assigned-clock-rates = <100000000>;
+	assigned-clock-rates = <12000000>;
 };
 
 &cpsw3g {
@@ -204,6 +204,25 @@ wm8904: audio-codec@1a {
 		DBVDD-supply = <&reg_3v3>;
 		DCVDD-supply = <&reg_1v8>;
 		MICVDD-supply = <&reg_1v8>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
 	};
 };
 
-- 
2.47.3


