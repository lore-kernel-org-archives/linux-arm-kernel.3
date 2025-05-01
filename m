Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0037C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgNFNroZGE50So2AWpgZdGIy0x5cNaOcuHUkn58CMQw=; b=ZoBkTduf3B+9RunSXT84+0PwEQ
	pjYZnMFnozQRGEbTj66g6r5GgZaLwp/o5ul3Sc5qWLIsWxWbLeqU4o0pVWuLz2s81eIR6gvdymFki
	0kjptdSTSrIowCULLmt87S4lPU0Uepgfz0gyreQ6CTFhIFQVipsOisyTmNj6Q88A1MBxkrPq6XH7W
	MZOT3M/q1Bsf8FyAugX68cPEx7aqmW1vz75i8fmWyBit9W/oYHcvjh0S8tZ3QQQ222YVO452Oj86f
	SlHiAZGOj10NsSIm2/I2YYAxUSKOB3yCgXnWcFp0Gg736UY8p0Jv33HwHN489RFIczyvaQ0vl/Owv
	g81I9Izw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATQ3-0000000Fjli-044a;
	Thu, 01 May 2025 12:53:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATAH-0000000FhoH-0VJB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 12:37:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so6878205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 05:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746103039; x=1746707839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgNFNroZGE50So2AWpgZdGIy0x5cNaOcuHUkn58CMQw=;
        b=miCeWMSs6p7KQi8C+1eu//iaos1JBdPvgG8P2JFjyJDL/H7MaKliQBIxoG3vVDJ8dr
         x1oWRQD1xybl24bh6KX3s5H+CTaNyX4z4vLfTY7CZctn+m3hyFb/Z/UrByxBG4Reoci8
         xHartpON0XVjHh6W30d/+jpG2l0SL8w5eM282LcxQRWoE6uIeHdE0eU5XzU3Ic20B8A7
         kiMPbyD2bnmbVyyHYNxlkw28RByJ79yLAc22FD4wX2P6+VsJAunCVowCEMhOZfvF44BH
         hYPQgym6tVsvAJlKZ2i6yR1X0IG3ljeteny8ljJc2y8EWjaeclpKNZOZoRLFCTvAWFwi
         vITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746103039; x=1746707839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgNFNroZGE50So2AWpgZdGIy0x5cNaOcuHUkn58CMQw=;
        b=TD1tbtm5cLgzwhfSicKx7SUuDDPg34ZnQKMT85eH5UfEoFzihvbBO+1+AguDdgP1MP
         fjzTbHg27hszZiU0/OHCFGT1U3jAVou6t2gTg9UZukHUXbPsHUkYkYxf0mG2YGayoW0z
         LP40u27Pb7AW46dlBoV7/Ek08NR/kfv7LOyWSv+8LbFXuaMcJ3hQnIg7AvXa9rocu+EU
         G1MIVIpU+jQ0oYbvUJ1iVQMSf+MVmw2ryK9figmSGDAFUeXFbRBkiwXmnWHinlA45xx2
         WpVj/qkSJ96pL9PeWJCdoHxWZY4NshNZMA1jfikiAlUAcljAD8IQBThDPZ41n88U3thY
         fIDA==
X-Forwarded-Encrypted: i=1; AJvYcCUChuDf56bJdV0wrMXxZljF+cK6AgwM68M1t3g135u5Ew1UdecbExFJCDgw3w9Abnz9tFjlvIHF7yiyDvSQOHRx@lists.infradead.org
X-Gm-Message-State: AOJu0YwaN/iYjB9EplLl2fA+I/nFKpRZxjrB0MEXJss3cE1OWFdCHRy9
	his1PvK2hGqnuFYSEzGroqSX2uO4lfUv+zksEV4srCHKLhzq9HK1
X-Gm-Gg: ASbGnct4nle6vbrKEXaBQqGEo6t3OWftEI13PX2qk35bovsNp5XnlJ284rT7atJCUP5
	r83IYlgQI3toGhTZ0WZ62XyOMJ0wPYKizJaglWnpVMpBwZJTbyPm3RV53YSlg01pDKm2poRldDd
	Q/ZO52dAhILuimkBMp6ykmF0Ek1WiDO4a9pcTuQW44E88tElBIWfh+OAaICftwm8nDrh8IgZKm5
	kian+qiJZMSMoap6EnxWjrdpSPW2QBtP6n0nBR8pZECRJDFrR9igC5qM4BA01u+178P/QVLW1NA
	ooLukrmM4ik3I08peV5hUXDH4Jpm0/ujyVzwfHNbz1hXtyUO9SE66kIKV96ug/RmDFlbuTnEdcY
	=
X-Google-Smtp-Source: AGHT+IGZmSJD1oy0UDx7tiBsVyBgeklEmdSHp8LD1zMwNv+uQkPtE63Em2e0OxJJDKeaXfUi9AR2yw==
X-Received: by 2002:a05:600c:5128:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-441b705a882mr13841645e9.26.1746103039065;
        Thu, 01 May 2025 05:37:19 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:f0e:4490:d947:2c92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm11144765e9.6.2025.05.01.05.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 05:37:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] clocksource/drivers/renesas-ostm: Enable OSTM reprobe for RZ/V2N SoC
Date: Thu,  1 May 2025 13:37:09 +0100
Message-ID: <20250501123709.56513-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_053721_158035_8371755F 
X-CRM114-Status: GOOD (  14.17  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add CONFIG_ARCH_R9A09G056 to the probe condition in renesas-ostm.c so that
the OSTM platform driver can reprobe for the RZ/V2N (R9A09G056) SoC. Like
RZ/G2L and RZ/V2H(P), the RZ/V2N contains the Generic Timer Module (OSTM)
which requires its reset to be deasserted before any register access.
Enabling the platform_device probe path ensures the driver defers until
resets are available.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clocksource/renesas-ostm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 3fcbd02b2483..c9919811542e 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
 
-#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
+#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057) || defined(CONFIG_ARCH_R9A09G056)
 static int __init ostm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.49.0


