Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868EFC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 21:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lzc9qKm8dmXSPcgTXQ3553GN0a3t6/Bk61nGECYnQec=; b=DShC2vagmFfIxtcvehZxMm4h2l
	EePkTOBv7XBoc+S9u83JXb1CrAbV0w0HndhIh9IX8kaE+q4uhO8ZVB14kVF3N7xC0+hAXHHh86Zmt
	ou++bR2wSc3SoGzBq2eas8D9sIXRw/pQRXYmDunmvFC8cMuaKjbyB7fxL4QRpg+ikfssxEDDLeVg4
	y6sS28qlTuGvdAzcUB4ZifIwlCafcMyrc8t3tbHBTSeno6vElb3b5u9ZtV3nN1hz4fTpRo0a8PZNk
	2ZD95PfxDYDLfgqFw9piQzX8PBFCOa7EthUKnNmQLhYI30akJvlmZIdY9i2X5iRUGVNPHAT1yHhY/
	3zGTDzdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAlw-0000000D8Nk-17Wa;
	Wed, 15 Jan 2025 21:17:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAke-0000000D843-1599
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 21:16:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso220735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 13:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736975794; x=1737580594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzc9qKm8dmXSPcgTXQ3553GN0a3t6/Bk61nGECYnQec=;
        b=A9MMXcd7cjCNBaI9tW2HEm9h+OuPvdsHcyetLs9zjjRSG2IAgte7dXOp2PJq1fs2oe
         cOuawgAQi7K21JSIYcz7dybuVq6CsLE9lLynHHp/QyQN3fAIRIMWrUohecCk0L51eqbU
         URMTvcH42rxklbvy9NZdplsPMa4EYjDm40rfFF8HjR+Pe3pwF0QIVKWdDFBjN1JBeHlP
         zbVQOWnOqIwr+O6HTkxGMua8gykqEfUyOAYvzgSOlV7PMLouDW4+Ybg0SLc6uxfV1tMf
         CQtjczHX5tHhVJvWKQkiCqbbkRxoSOch6exl9VtUVhAasU02OBqTvKzjm20VSGGYkDko
         fjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736975794; x=1737580594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzc9qKm8dmXSPcgTXQ3553GN0a3t6/Bk61nGECYnQec=;
        b=BZzcHYK4p+f7oCZGC8sTiGFWR7TlDwfdXcHVogNTkBmt0Gp4Zpv1Kno7I7nUhSyngP
         urVKUDRawZHP7Om/E23+1qXPXQzBcmSo3ayLOXRr3lvTtMX8qs+xc9xxrfbmD7X4Qp9U
         pdUbnR0xglKIc44Lmhmg8XRMUJduK9KbAp6diarJWIOJ6HKInkPwPz8BuO5DsLDAKA7i
         392HKdQYfaMz+uC4WMtHOFGCc9LfRLV6PcFBSf75Pv1yChZdyw5KBsznWhkyvW39Mq6z
         D+KsO21/1YsGQr0EYaKG4sxQkZJdSoOF15jYoQVqwzsBaD6fMpWKeTdphJ1tnDSkKk6H
         wuCA==
X-Forwarded-Encrypted: i=1; AJvYcCUunojsAFvD/u37RoASUstcvcXm3m5nSv9gcoU1zQ6io17dNe4jDsEE86LqIjn4w8A08Elogw4AmlczuzAOk8/v@lists.infradead.org
X-Gm-Message-State: AOJu0YwVITSrZQvN9Xp0Io/NzccnXskZZ7+8vmsugt32xrlgsSJFDfYg
	DpZNNwXZvB8ttp9HknioHnAQhLD1O40Akqcr2LPk68rkn89ANYrs2fmdc7WHgyM=
X-Gm-Gg: ASbGncvaEjCJljFOK8MIt2Wb6CN+BNWLyjKqHvZ7aRrGXr2wrnGMr7okO1qHHG+EbVg
	Afm7nR5a3tGP0RKuRuvQ7V/czusVqy0Ow+1sNYh40RtZOd3jBHeS7nAV45FwMpucFfDMELGz+OG
	lhf0DHhou0GW8odYRq1rq4vVXS9RRSo/5mg8MYhw04qYpUNntvVajWj2Mu8eJuWVdByQuNYhOPM
	4JqzLF3TZGdF5FlW6j/PNLZFMNbhLhiyywMIKZlDr887VFEiYIeTlPv7i4xrIBYpNSQZbI=
X-Google-Smtp-Source: AGHT+IHAwBkkJQE1j6aBQc+CAv1b8S07mYuvH4FAxmy5cW/IGFYtvGzcPCt82UzHpzg+eM0x/k7Zgw==
X-Received: by 2002:a05:600c:1d07:b0:436:1902:23b5 with SMTP id 5b1f17b1804b1-436e26f4abbmr109899705e9.4.1736975794389;
        Wed, 15 Jan 2025 13:16:34 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ace90sm36585405e9.16.2025.01.15.13.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 13:16:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: st: ste-nomadik: Align GPIO hog name with bindings
Date: Wed, 15 Jan 2025 22:16:27 +0100
Message-ID: <20250115211627.193961-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_131636_300343_36B0437A 
X-CRM114-Status: GOOD (  12.64  )
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

Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
to fix dtbs_check warning:

  ste-nomadik-s8815.dtb: mmcsd-gpio: $nodename:0: 'mmcsd-gpio' does not match '^.+-hog(-[0-9]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/st/ste-nomadik-s8815.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/ste-nomadik-s8815.dts b/arch/arm/boot/dts/st/ste-nomadik-s8815.dts
index c905c2643a12..2f642c88f288 100644
--- a/arch/arm/boot/dts/st/ste-nomadik-s8815.dts
+++ b/arch/arm/boot/dts/st/ste-nomadik-s8815.dts
@@ -23,7 +23,7 @@ aliases {
 
 	gpio3: gpio@101e7000 {
 		/* This hog will bias the MMC/SD card detect line */
-		mmcsd-gpio {
+		mmcsd-hog {
 			gpio-hog;
 			gpios = <16 0x0>;
 			output-low;
-- 
2.43.0


