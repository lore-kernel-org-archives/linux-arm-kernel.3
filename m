Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21A0CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKLAYC4j9KDlgpKElsaQCZMFHUJovZT20hAAdQtCFec=; b=XjlXxp1KbCwUb/w3qpRt8WK4EG
	eCJXuyqkJmWAY78jodml8aygGvYVcboBzma7T5RZL4a0EmrSK4JxEdyhDZ69ZQwsWZCIF8pnId1WL
	7LQ++XNczUF4IUTqOSAQMvLcSG/udL2tWTXYUeRns6wmbcKptRi705i/8Qa/ClSYQdQ4Nhxx+wRZL
	t6hTuP63aNyZvJVQjN0eoMY9x3rjFMRxpnrjSwvl+qzra8VODayKXpkoTWT9YcftT4+ww1Ufpyawl
	onBaCzil8dE612JOOAZQyAuMVO4s+NfLnZmYMJqjwq50T3UjJuB/LXHU8s4dPgrU+joNC3yPmiRPY
	LMcxWI5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtr6-00000009plC-0Wp6;
	Mon, 03 Nov 2025 12:40:16 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtr4-00000009pkM-0Jyh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:40:15 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b714b1290aeso90261266b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762173612; x=1762778412; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKLAYC4j9KDlgpKElsaQCZMFHUJovZT20hAAdQtCFec=;
        b=HtVY2aVbjUFB/5y0ePusl0qbihV9KVAF3azJkw0cmQCic/0kYpgQBceoWDnQb33l43
         WcfhxvuLtIux85+EUtCdv095YLCJO1j/Iz9O3bjmkw7+h/ztGqTyxDMTMfNknN7W1i1K
         8E6CAx+5H5kXYy9ejfVp96MLl7/LBScEX4Lwqbf7tuc4JthRHWGj4gu/lQ96GT63agFw
         1JoOBME1mXzHcDb5IrqopMyxEYzF7EuXIp+LbGXn3NHudWrAdKJtgvAaEHyfZrwfvFLr
         T+YM55nVWiN9urtAduCKyhFDG16D0sLREr3yFcWrls6L0AM0TGOJ0UsxL5uFmtpUis7f
         NWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173612; x=1762778412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKLAYC4j9KDlgpKElsaQCZMFHUJovZT20hAAdQtCFec=;
        b=vSZZ+AbkzTAfBOWvuR/AzTtl+6/4D2cwswknrnHIFbKDiH+dyz0vYk+hpAvdGM+XQc
         d5PZvN+MhsZEQtrsYQPrEZlG7eLXr/wX68RD2Cihe5KRKCGcg1YAefPI1P3jGMOTFwuU
         GGS72FPS5/uVUVWoUo6GakHzrAVmiQNf923OfeZIaJeY7uOVRULU2oKvr+Wofl3vUApJ
         qG8irdSxeT9QDuySgtFrEUhP3myd9teV4DQs3cAI8iL/LFd7L+WgGHXsc7d8o1mjS02V
         91oXO3D5tVcgnPfXYugZfadXcdhSE7sXgctm//6NF/DW0metOwGIofLRJtjk4ygkxxZ+
         x71w==
X-Gm-Message-State: AOJu0YxGAaiIuwDNMkv1ZVjyBu24L1GJ490C1HMEBxV579J12EGiO5rP
	J0bIsubchvI46dZz9VbDk7Qd3zdLhbsJENuXDSl4hWCI9PmXoZhkRm/rgRr+mtGDZ3c=
X-Gm-Gg: ASbGnctOW3w6SFYLr1VgJ3nzGmz1/BfzJxzB+YbzkCKD0kLQwvPxTvNA1GbnHR1RuEl
	yAQ2EDB5OLR+5uJXPic6Pfe4xJU+CmbWL6MTlQG8RHThfdc1j6pVxoGtrAfe5PtkzrZ6VXafGKW
	XfXSzHA96FQWuyLAiXI0Kgu0db1MJpjQeiRftdUdug2FAtt/iG6YfS9Ivwpw/o1EYjybidarSyD
	XdGbz9spxF1SMBYBYpBTs60xONCLAN0JKZBP1tq+m1IFL9tCLeel8c+RLCHZymFZJoTFbbZpFxw
	ddo1PZu/45LWwZKmZ2OSk0HVzz0cFMYyx9RE6oRub10YsH6wghPe0mkDvyvOTOryPnRLSQs4IUg
	8ILaiNYdLpSszO4cRTkMd+QKeOReHZC3+KKe800TIrbEVfNb6BGhEQ6lXOFkqCZysH56ObSwpRK
	vQBqbqOQ==
X-Google-Smtp-Source: AGHT+IEJLGHUCqJbKodNhVUSRCa7L5Wjlnz8ENzdksAajWD/eFBThYHb+p1nQw21ODRf5Sv8XEPCww==
X-Received: by 2002:a17:906:7952:b0:b70:df0d:e2e9 with SMTP id a640c23a62f3a-b70df0de647mr267854666b.44.1762173612081;
        Mon, 03 Nov 2025 04:40:12 -0800 (PST)
Received: from localhost ([2001:4090:a247:830a:fe22:a8:f29a:a5c3])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b70b91e44a8sm382716766b.33.2025.11.03.04.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:40:11 -0800 (PST)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Mon, 03 Nov 2025 13:39:28 +0100
Subject: [PATCH v5 1/6] arm64: dts: ti: k3-am62: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-topic-am62-dt-partialio-v6-15-v5-1-b8d9ff5f2742@baylibre.com>
References: <20251103-topic-am62-dt-partialio-v6-15-v5-0-b8d9ff5f2742@baylibre.com>
In-Reply-To: <20251103-topic-am62-dt-partialio-v6-15-v5-0-b8d9ff5f2742@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217; i=msp@baylibre.com;
 h=from:subject:message-id; bh=CD8jS3mi5l0ptE5mloshmhyPStp+3Ujo5r6yvkMZV70=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkyORV0vpu16rjT3+a7vb0R3TszcFcrt92hu81YxJ38VX
 tdzoj+3dpSyMIhxMciKKbJ0Joam/ZffeSx50bLNMHNYmUCGMHBxCsBEYpwZGd5tfh/GeyTA/SrT
 yRlZ7d9XH5n25+zHmMeLmmTOTVwo+X8ZI8ODHdKH/mUcedG6ce2kdX26gkIFflmaHZyJM3ttpq7
 92scHAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_044014_128453_12A7CD0F 
X-CRM114-Status: UNSURE (   9.35  )
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

Add the system states that are available on TI AM62 SoCs.

Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62.dtsi b/arch/arm64/boot/dts/ti/k3-am62.dtsi
index 59f6dff552ed40e4ac0f9c7077aa25d68d3b5283..b08b7062060ca12ecae83917a831ee779f1a288f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62.dtsi
@@ -46,6 +46,28 @@ pmu: pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	system-idle-states {
+		system_partial_io: system-partial-io {
+			compatible = "system-idle-state";
+			idle-state-name = "off-wake";
+		};
+
+		system_deep_sleep: system-deep-sleep {
+			compatible = "system-idle-state";
+			idle-state-name = "mem";
+		};
+
+		system_mcu_only: system-mcu-only {
+			compatible = "system-idle-state";
+			idle-state-name = "mem-mcu-active";
+		};
+
+		system_standby: system-standby {
+			compatible = "system-idle-state";
+			idle-state-name = "standby";
+		};
+	};
+
 	cbass_main: bus@f0000 {
 		bootph-all;
 		compatible = "simple-bus";

-- 
2.51.0


