Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F022DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 06:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w02SH6PIRFOFu6YnjfK7owcWnXxBUkNw8szwIzUQj54=; b=458NqqR/MH4DZdacTqvYVRS6sw
	YGOUVMf8vSdoi58raL20O7gt3izcuuAo7J4q65CGKf5SCRgwiE6A15idTqZiuIt/PZ8/kPaRNlcdi
	hLonYZK/zD5cuN+KcYoDlq3w+P8jg1gWrSINQTE1C12LlXRt65K0OmM2AujypCP44Ve3PjgVHkT30
	NjA6tAu6JLK+UAomDpF2BhW8SOf1NBvhcnHG16oGPVu8f+xzhs5tT0gtv0ywkxKxDRQ59Nun0GxJj
	cYrhcF6hII0/uRVwF2Eof78NJYWY/53pOjZtBK/FwDiwo3KE9u8/uEEePrZqobMQKgqVde/3seBqg
	GrdUMSZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPoi-00000004kBm-3UAx;
	Thu, 14 May 2026 06:45:08 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPog-00000004kB5-0YrN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 06:45:07 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2b4520f6b32so12748197eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 23:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pcc-me-uk.20251104.gappssmtp.com; s=20251104; t=1778741105; x=1779345905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w02SH6PIRFOFu6YnjfK7owcWnXxBUkNw8szwIzUQj54=;
        b=a7Z9/U+92OadBnT3XYA1t1n/S1ulG1bCuFdj4jIwJJ2udgTJ80VwYPu7gHumYcFeyF
         qwF1HJI+EfCPokCWZZ97Kp+JzhDiisOdE663q0JfcmcBpvvl8hHuby7f8A1H0M54mVp8
         syAxux9DR9Cyj2uiBBta0OpspIjip05fFIGhHxE5JPA0IQhV7/qz8LPk6v0GccSzOG/2
         Vy/qKK+XKdiYwSIli4K2zoGIGgBKaLRlzipQ34e3fWRs1+Whxts9s0ENz5Wuaa68saDB
         t6v7VA8DlOtPGCn3Dc7zEmZLa2fPyc7Ecrua2u9F0reodf+mEh0yIPhVBjGrZcvMSHH2
         wFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741105; x=1779345905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w02SH6PIRFOFu6YnjfK7owcWnXxBUkNw8szwIzUQj54=;
        b=Wi3SCZT6gBq3p/SnmYN+CIrIGYzcQBXRNZZK8/j7jt+/ssWLtBt9k432nvefxpADrr
         0iV2q8O0T1CAnj7BtuJjIm7AEGFm+QWdq6Q1XfysWItgejl6JRnuT4kobFZvhxHnt2cE
         V+OyygsBjyjeZta9PgHb2tb9jkTj3B2vWAfWtKRgNuGzSUcrEZnmihnjKzavVvALI2Kh
         M+Sh2ooaih511ihM3LhpFj4FE4pqf/CVHYiB9iB1PB6gVaep0c/ZBj5rruCqsah6vbtD
         vVFSQ68lhv/5u+Vl1l/3LkiwotVLqtX5e1CTlJnKwnR+ICUJTSnKveden/mFSx7uK1Ll
         53pg==
X-Forwarded-Encrypted: i=1; AFNElJ/xeinkWcBJzHfvEtwVVlt+lfu/2gljjY4wnMskKXFkp7xltoM/Y/kw0NLKEneb72KgLvHWb/aN5nwGjzbkoa5J@lists.infradead.org
X-Gm-Message-State: AOJu0Yye0sSZAOYBk2duulhWNA0EDQk6SvMG3IzU7G+4dOABhiYU0cYZ
	I1eLF6A6B+yn+lmTwzaFKuPW4kB3liCC6jh/OxWQ1PLFf/QCCmU2z2bu8oTkPTFgy30=
X-Gm-Gg: Acq92OG3UJ/Em4jx2eJz6ETV9U6PiQ7DNKEbwShMKCZV4hQroQw1lMCPsHnl/kelmLw
	YuZLBFSRQrfurxjY/umLoDoyaOUo8mQVXNEcFM27Z/1MwUPJw2Zv2Zqpmbt6d1Vor95Sl6kjRoW
	B19iFpA0ckRkYOCLH8g1w/nfPjWb7AVgYSvOqnQ7WqGBtRWQILYtm03S53A5fNpjX4cLc2rucet
	Wa1nfYdyFvxj/UcQqvCCUrTEmxburrbKZsQ4dWPrMDSeAqJF6Q/M+b/rdfTW8F2cYHnMC8jeXgl
	Cq/tp1D8gU5kkSTspDgJEOHzovXHnAlE5X0wV7Xcpdd7ZOqoHyDhLW9VRBtqlaMoj90mjj9/3E/
	iyjot+Gz1+h+bTWDWQn3IPqbmxgk2dU/rpkPs2KcsjQqjDVCZKALM4UtOwvkStHTv0OB7sgq1kd
	iSnpVZ+Y/ooZTKAIzE++/PviF+IVV6PjXGkGmgJJYxtl9To5YJCrnptPA=
X-Received: by 2002:a05:7301:3d0f:b0:2e6:ffa8:ef85 with SMTP id 5a478bee46e88-301512632c6mr3381953eec.0.1778741104665;
        Wed, 13 May 2026 23:45:04 -0700 (PDT)
Received: from localhost (c-67-180-161-137.hsd1.ca.comcast.net. [67.180.161.137])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-302973bc8ddsm1807663eec.21.2026.05.13.23.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 23:45:03 -0700 (PDT)
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
Subject: [PATCH v2] arm64: dts: mediatek: mt7981b: Add PMU
Date: Wed, 13 May 2026 23:44:45 -0700
Message-ID: <20260514064445.83487-1-peter@pcc.me.uk>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_234506_423834_ABF3C784 
X-CRM114-Status: GOOD (  10.59  )
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
v2:
* Remove interrupt-parent

 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 1bbe219380f9..ba6720031908 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -38,6 +38,11 @@ oscillator-40m {
 		#clock-cells = <0>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.54.0


