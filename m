Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF22CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=; b=bIksSEm5LrGwdNbvOJhSjHb189
	AJi7oCIG07torblxZdoTbR3Fmtl7AvbUMZPDx7YMQm/qzG47OvebZ0T4iiLffukraqcEiUkLt1tr5
	ZJuiC46jOBrtiv6okIHJ0N+UXhTKKNgc7kkb4iHPVno9inIHxmtsUGDR0Z+tbqLtdvBI/0TFe/Q5D
	/XKUmsGMlK7x4/pWkNNPNrUAvorg7EicHN9p07jc5GQsNo06FPbhKIm0l/DvGrWOx69Un+6vznpvJ
	PSTRGdVPL2pKefkNOaDIV7aeNdxnDmUtXv0sTDhAzy6UppgeqpBRd2Qb9vkdTPqGustMzFMoyoAAy
	7wMBbR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0U7-00000008CVD-36kX;
	Tue, 09 Sep 2025 15:42:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvL1-00000006Hhp-0dJz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3e34dbc38easo2296263f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412753; x=1758017553; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
        b=lRoGKRVO/QeB5Xtu3mFOL+E6bXpw59SQIozjb0zo7BJUXQihUytSrjU9WTlkoFJSjb
         fT6C5p/DqX9Bt5PntJWsGS7lkDqJeCasEJxWBCfN//KYz6S7Cixh04o7KxS4b9hHWI0s
         pXEdw4UsB3npY3kQzTnEUtojhrOVB/Fmyhu4zFqF870x/FFq23tt2lo1H2ibB2oj4n5K
         tW0LO61Nfyee6io7Sr/Og/xKm83QK4eVcznPcbgILuvKVuLV7AMeMoJjO/5LPFYOtLp7
         y5jfop2Wp69aFy2A+kQCa2JDowp/eOObg6wB1vEOoVZ1M/K2ca/JQBl7Pqg2+XbpF5RH
         ttmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412753; x=1758017553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
        b=uG7oqOqSW9c12Tko+78GR2haAkCkdQuTF97u/ihyACa6trGar4AA83pvOrpqh/KQvs
         dFUUJPiQbVgmvbawxydFM55RE3pjpUhNSj2jeSpfIdYE+6vXg31PZa2+DMFYeswQixuO
         I9woydcv2J4itQzd4tRtMRuVng3324/Ori2hr2eNgIVUvVljwwg6XdO3hNyzQC2Nfmlu
         M3b3ecrqqGmSXCh3ky4f+5HvVPC7i8R3bJPFtx4eEoRvyKwkOuM21JLlEFdc/Gb0KLuW
         zjQkc70yvkkBAqPocKwNmQ0P/2CEqHj2HSeP7FO6iE4tgiMCWrBPgWxhcLdMTrJVXPrk
         +bdg==
X-Forwarded-Encrypted: i=1; AJvYcCUe0DiLSNZdDzj1MNRv4ITpXqSH+c0bC8l8SujGaNZ1z+Jiii57cVTekpN+Yg+knOwM4t8BIHmUWyR7w5upRKsl@lists.infradead.org
X-Gm-Message-State: AOJu0YzP+wKfVP+DImHm2Aq0Y2hXTRpTh/PN5PpNzh9IE2+WfI12NQDL
	2Xjm40BDZ9oGK7KejcUqryjaCxiYxiq5VeXtMXYbs6RIw2I2A1QrIGBk
X-Gm-Gg: ASbGncu93gtvuAJ9vu8i7bJM7uwOnGARGEtpFLMfRYMtat/58HguNMifPMC+qmGyixU
	mWE6eu0txdBxvfyLsuYWrOfrVdFuazpwvG2XkzLLK/VJ9cULjvojGLAHHgQC7Hqy+Kv0I4K/Lgr
	kdkoAcJVD3Dr3qUYURdpAHITx4QxbfeWeApbhMwtjr4P4E6KqMN8grk+CbuXyeVRP7LDNsXYuZJ
	st4OElfHPBhnKEv8PnaJ8haIsm9iRWjIXxRAjWe3IXPIrTSQSKfuhlq4IFVqf3AjlcbTIxIfXYj
	27fr8HU4IoeqQucwA/0LT1EOkirwHK7lxe1eS7qnQDtpZrnjRWvl6f7m58cHXdkdiZwtMizH9bb
	NxR2K0qoFgdL6ETCBfuKlghdaV+WVQXzCVyOH58yfsqq7gCLv+zwtiaGBsMmlGJ+P1lAQO+qilz
	qgN+8H/BX7GA1AdeuKxjFhbouJ/g==
X-Google-Smtp-Source: AGHT+IH7hqeCncC0SVXTGumU9OSJ/aNPQ9AiaGhyarE4EKX3TbC/TVNGGH8t45lQyiAq41/6hdfmvg==
X-Received: by 2002:a05:6000:2883:b0:3e0:57e1:e3c1 with SMTP id ffacd0b85a97d-3e64d22bbadmr8510036f8f.63.1757412753401;
        Tue, 09 Sep 2025 03:12:33 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75223f2e5sm1994403f8f.52.2025.09.09.03.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:33 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:16 +0200
Subject: [PATCH v6 09/20] dt-bindings: memory: SDRAM channel: standardise
 node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-9-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_031235_362465_D7222D43 
X-CRM114-Status: GOOD (  10.94  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add a pattern for sdram channel node name.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 .../bindings/memory-controllers/ddr/jedec,sdram-channel.yaml       | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
index 866af40b654d..5cdd8ef45100 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
@@ -17,6 +17,9 @@ maintainers:
   - Julius Werner <jwerner@chromium.org>
 
 properties:
+  $nodename:
+    pattern: "sdram-channel-[0-9]+$"
+
   compatible:
     enum:
       - jedec,ddr4-channel
@@ -118,7 +121,7 @@ additionalProperties: false
 
 examples:
   - |
-    lpddr-channel0 {
+    sdram-channel-0 {
       #address-cells = <1>;
       #size-cells = <0>;
       compatible = "jedec,lpddr3-channel";
@@ -133,7 +136,7 @@ examples:
       };
     };
 
-    lpddr-channel1 {
+    sdram-channel-1 {
       #address-cells = <1>;
       #size-cells = <0>;
       compatible = "jedec,lpddr4-channel";

-- 
2.43.0


