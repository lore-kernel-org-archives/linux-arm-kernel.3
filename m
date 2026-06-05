Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F512CD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R546pyhcBIoOcNDyoI1JxBWHAliuH/MVaGxXBQ6qTQU=; b=o15UuKWtFHdOBNchZ7rQYrpHzz
	xF/WY9/nXMowodFqMQhY4EW5VJhkc7le9kjjlzqza3VDQH4heXzcGR8dwkiJ+3bqHtVmnQTpjO1SF
	oB1cp1uby/wKdMskVOewJXLmkQVrNKWH9Afy+KE//8VMJr+6Fs/evGxG0KTR5wYOVe6J7lOiCuXvY
	HbtTPTDSDDXoMWPg669uavS1LViUKZ7TWMtvDz9cCPRM7nR5EHhowIaMjwMqkdu5p0nKi46ZeLv7n
	0U2KhOofH3fTB6+1Sjyl3BWfFxnTSQ9711GhZkFA+GPWyj9DWQSiQ4EsbqG6ejhp/XZZAKE+IbtFq
	1emE4gFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTX3-00000000bYC-2CGS;
	Fri, 05 Jun 2026 12:20:13 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTWz-00000000bVa-3KVd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:20:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so1284232f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662008; x=1781266808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R546pyhcBIoOcNDyoI1JxBWHAliuH/MVaGxXBQ6qTQU=;
        b=cblqY+YTgApG3PVLNH2UXhpEeD4mNbBYZfrRndlfgkuFUt87GFn5OdK8RjQm0pXprD
         y8UEKVNyVPJN9U8PY7dgkT9AjG09SYaMXm/TroZ0Gypi/WdSPyg2VxDM8U8WpOz5PAYK
         t4lXj3C5T+0O8g+DNJ8vM2EldpwKtxL2fWw6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662008; x=1781266808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R546pyhcBIoOcNDyoI1JxBWHAliuH/MVaGxXBQ6qTQU=;
        b=NTLhmoSNoV1S612B7QgXJu3n1jYCoIhY69wjEL/Y7is0aMKgz4PWaNh++faZLvfGdH
         8yzAPE0nFmv7T8WHD9ANCuhbfob/ToqYkMT00GoAEHynuYHZDcxhzlr0RFsCqjWJIVB9
         Bng5tb427K3F6m5u/vSuewD2wJyYmyzTwbleZJfcVSgV9bOJ9MvysK3dcUZSCYeTOBTL
         Jg36oDbw6j7LkPagLlMX1XZ/pKYMjr+2Ba5KtKTpCHBOIumCAVOD4cWOLKYlbz6x73M2
         ah9ooNPSWHAfZixBNgiOuaN+zGOKEyLBY4BY7iW6gZM/AMIVPOhz8NPBMSD3oyZm7ZSU
         3uJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AGreBMdF40+YeATxkEuuoaHfv3OG3Ta2MSkUsCreaJ1K7t1PV/CGgq/taQA+BBxTK0nT1NGwsJAb60QSeXswQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6vnXH4sJhO/NtFi0g5/RlR7dZMlxTf24t2w8l3nybUBbxN5vj
	o7bw5kHX/A+WCUFNPBL5p+VtuZRc14LPQXc42C0LbmXdkQOeA2d9fItoJoHexJlr0j8=
X-Gm-Gg: Acq92OGnZI5dob5jmGHDpMLeUCcaOYbQHqNajuw71PKOeDn31YTh+xM5tgwwvFgojrR
	8aiYXCFcYAq0XhqOFnCSlg99JE+dkUlSCBgcORtezaLiPEFLu7rz3k/fO03EClNP/LokfZ8NpCB
	sxDr9mD1+p+4ZZz9SiGktypVG2kX9tGTas5zT2pGyeh8lemENRM0b2mnRRFCdv0yNqOUCxpkcZV
	OOx+gJHT/EY6YwhD2WoHg91owLsz09HFQsVFqW4U3x7LUSn2WTsj0E6zKDaa8H40AKwG4rn+B/D
	GFNHNmrlztFby+uBCly7H//gzVr35tNH5URJBfSiG49MnMsV+Xk9ptD71/sYlgPL3lfEWyyjMv5
	Hho2auxEtPYAV74sNbCrl+nnKC4tHwPR7ACZi6LpeXvMu0s2lr2nyeZADHKi15Yj9ijjgYzHMc7
	EQAHGJjU1/magJ4x+kzdcKZk/l3OTafppjk+5/xV6UDBqLClJ+/7VGYGPu2XDlN4OcTeYqZD8Rd
	uoZFdH846u8YTt4TYByj94Anb+Su8maZii/26lZZCSyjX2J0vhA/zcq8Ljogb1FCA9feaQmAHhz
	m/zp/B0J0DDLkMDuR39iP0k2h09c5sHayQI=
X-Received: by 2002:a05:6000:25c4:b0:454:35b9:803 with SMTP id ffacd0b85a97d-4603061fcfemr5612501f8f.30.1780662007855;
        Fri, 05 Jun 2026 05:20:07 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 02/14] arm64: dts: st: add SDMMC2 support on stm32mp25
Date: Fri,  5 Jun 2026 14:18:13 +0200
Message-ID: <20260605121957.78409-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_052009_872345_F34BC2BF 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Add power-domains property. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 673fbc5632e6..faa1355948e8 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1667,6 +1667,22 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				access-controllers = <&rifsc 77>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.43.0


