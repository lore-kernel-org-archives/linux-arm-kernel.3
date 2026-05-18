Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5833CD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiWA+rwoYmnp1xtUJ+3qeQunLZa44uT6rtS6A38xJwA=; b=FSobMtwgr7HfskDAV8z9afzYx2
	zgrYbskjKBuLqh5UurJRXEOQ/YfgMbJVjrvWjT+oqOaTLblxBHmDYNGSDQZIdLu7ZX01MRkdjhVoU
	ZLyYH7D/0ejQYkWdCALDlgCBa6m9Ch56b2tzqh3dJKAG2Gcdyx8fcC5XEyZfyiNKtwpNh8OChjrKm
	nES3x96MMdeF2CLvugn7xfq66W/s4j5oido1mVcRkUp0yeRZmyJybsaZuS8w2+pa0rMiHEGCUKdpl
	Ac3LDUx7AfYjuzYPXh2pbQx/3MP9j5grEQQm2nYsqCf1maLPDWIUHk+LL5JQBQIFdQD9+0jwRVm1O
	Q+tfMSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0o-0000000Fz5v-0WYA;
	Mon, 18 May 2026 14:32:06 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0l-0000000Fz3d-2otd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:32:04 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-67bc8609a9bso4958899a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114722; x=1779719522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NiWA+rwoYmnp1xtUJ+3qeQunLZa44uT6rtS6A38xJwA=;
        b=SskcJokcLURLoOVuf2zEyVEFMbGCsHgRbDr9pmkj+wlifh4qWzqNAj2bvoSSR96Rxz
         QaXZANN38dIa0P1qiWICPwrUAJ9ucgOvKrK92xnTFT1iB21KXBfUNGX2Lmr8mbiW/Iw8
         8biGMaeig18/V/+xAd+Klqlo1PP/09cfFHlm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114722; x=1779719522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NiWA+rwoYmnp1xtUJ+3qeQunLZa44uT6rtS6A38xJwA=;
        b=TPNeSFX4wZNbr1GBcLALGOHxrJfGUUXP6YFSWyrhyTFYChsIvSflC8d5febp+S6NxC
         Dq4Ec+V4bNeFDs5OI5jmbSHoB/2by/5iymlI4tM0k7Vdb0Z0tb6AVKraDgJG5ulfyXzn
         vbOhK8AQYsbdNaFRhErmQzEf+xP4vMsNiLmrmbbYwFuqgs/DoYEO+HHMylBoP7c7lwit
         V94laoryH5LaCc83a8bPYhf5JeDu3e4d9Y3vntRFmCDEXqfQUCuM6iEh7Z79qsxUijGw
         o4VqVRvCZgBjO+yxlIPTiE/xGmHXurAk/3COFCRAlT243puDAgxwbhgBLVsWhHZ3XIs+
         my+A==
X-Forwarded-Encrypted: i=1; AFNElJ+wgJC3fdcMOX3aN3RHAEKWEtFili5E5oYXHHm0klyB9NAQkJLQrGD4EDuFrKXDZTGuXD7L5FZnUwYx2BkYQjpm@lists.infradead.org
X-Gm-Message-State: AOJu0YyhL+82NlPE4NKmZGAI9KXsa4cmpNeEfCsRin/4o5c4avFmTRio
	BC9KVFrXBsRTjSA7QxK+n9DomJOp3ZfeQyJfPmK6SGnL2kESrn8f/a7WoxN+9U+RlKU=
X-Gm-Gg: Acq92OGjPo5lyVd6Xn1/jxAwyrx11HuDWSAnAKsySRUVgLAIlUoqG1jSldJukHtQtoS
	QlIiEkXaLXGtbmuyurfQXaC1tjjNhR+wDt9AwcxHR03KCL6qAUBb7WKo1P7OEl92EwsRUOoDcGF
	+q4VNrESp+6LECXLnAO4HZXua0mnJHSzxA4VaG8jDng4gH6hzxjgLRgpkOgLW1N7sZbA5setyb8
	zr8tn793XTV/SxTKLSznXGRl6B9oKvpKTuXuKfmhTLqP9zUoj+I9FfeYiwGf5RUFwtV47Qme0Xd
	QxHomvwfu9OPvQT12HoJJvBD/P4rDs0WhRu0JxL85F3QOUaVPDd4e0SHcp/2dKxWZMCeSsVM15Q
	PKUdv7mD07lmQL+UDLpo//fqhpP5y9vj994vBSE0c8daLtZrlvfkAkoKAr1iHKDEH4TMFlRKDyG
	/903JpxVlCYyQrgizM/bv7CRPUYKfw0FrOoIyh16Z5ypoYbTNUi77VzxkUbS6z/p06B5THXgrvX
	p1ZMWGWrmu8/3BwYSWxk6NzT0vAU23R6y8DbijnqPlqF9rZ
X-Received: by 2002:a17:907:15d5:b0:bd3:1b44:2ec with SMTP id a640c23a62f3a-bd51785f67amr615296866b.15.1779114721773;
        Mon, 18 May 2026 07:32:01 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH 02/15] arm64: dts: st: add SDMMC2 support on stm32mp25
Date: Mon, 18 May 2026 16:31:17 +0200
Message-ID: <20260518143150.3138712-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073203_748324_238D4890 
X-CRM114-Status: UNSURE (   9.53  )
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

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 673fbc5632e6..5e46024d2215 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1667,6 +1667,21 @@ sdmmc1: mmc@48220000 {
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
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.43.0


