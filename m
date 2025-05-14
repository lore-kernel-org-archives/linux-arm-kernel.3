Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F57C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2agCRR6IRGaR3EtCVbw6MISEmkDLJru9ZVgwOeM9qk=; b=HXyMVoh6VatybwnmqhAhUcXpLU
	XqwcHf0sem3Li+EVXTfCo7DFEW4piq3kmP4qlzpJyYORSL6hiC4n/KjXaLa01TOcoAkSCIMQ9TRiS
	Cyt95JB5BQ9rtwcBLKY/xdGGml69gGj/tQK3xtlutOz5SeTxnzRf1Mw01e/jDKMMUAgmHmLtpKlwN
	6dWT1FlxEiSQwHusge/TPo3sTONFXni4im+9Kq67+UrcI+k9iG2V/F8C31RHVFQlNUoSYhmsGE+Cq
	No9je4KiINX59rbsIJz498f2FhSu8aQhqQVN4jtkdKMgN1Opw5rw54InF3EpcnNCDBeIYpBat0DxA
	8gYTajyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF87I-0000000EcRN-0s0E;
	Wed, 14 May 2025 09:09:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7QR-0000000EUdE-3vCX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 08:25:17 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so67395985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 01:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211114; x=1747815914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2agCRR6IRGaR3EtCVbw6MISEmkDLJru9ZVgwOeM9qk=;
        b=gvwX3Cq7HoTXTkdj+Oy+HvurJlw9axq9ZTG5cqh/Wl2ZPy7xNfnvVuyWniWIvoayUl
         auxxl9Ve9Wyhh2ZSk62y3JBTgIPBbxWZUWz88BRAFm55GTPWbGYPOXTWrtEhVeAQKq2K
         RgFy5CTv56uLWqDJJ2fPIXuoXpF26OOoSlYrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211114; x=1747815914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2agCRR6IRGaR3EtCVbw6MISEmkDLJru9ZVgwOeM9qk=;
        b=NZ3el6ErQHlgEWakmF1eE9NO4eClVpB1goOM8UQuf+DZIF0XNLbfGljFDieJ91jzSP
         00Q/756xDClXSiHeISovTLlmgZqepfI48iacjwRx+aVPyWhhVv42Ov3JClVAqivtm16t
         OGeCRY1139XCjJukkZRiKj79tzUG15pZA6DcYrzkhlfVl09d+LXt2kIUEVvATgQLbyHs
         88rxiUQrqVYw+WEJ2VDIkYURie2WcSDhnmypNPNj7dckawDeoxsBRev+s2yY+Y2FKiq7
         5LCRuOtupYbNc4ad43wqPBLrSeDmWwBZvY+gimYws1Mb69SxoBqqviJWheMuUDbsYt4f
         kFCA==
X-Forwarded-Encrypted: i=1; AJvYcCXdsAdxOZYDgpvDF1EKVwsIyXSkN/4VfIOy+oOeTHj/wBakXSqja5UdmHQUfY++tyAlRrDY77DzY5klIsrbvZVg@lists.infradead.org
X-Gm-Message-State: AOJu0YyJudHvRJ+mLPY6VzOSy9udCc00FZFk6dqf75fWlBWmi43H0EOy
	xlaWtO8wk556dELN5NF6uFopB1lXYhdFWIh6yW0Hvn5ChcmwjcwPmcH11C2tjLo=
X-Gm-Gg: ASbGnctOPEhbUDfVYN2hfytrS/lErB/DgEE1EnIYo00C+1kQhgD4ceZzXyeoOb6cyWb
	b9G6aBq/T1oVEZRh62mYV4oEVO6RPduGFGMXags5aei5aZtENY7nRs8IavedKgoGxTUoDh3ZUcA
	kVArpCVCA1pQA+1CLfEx9egtdyujddig7Ihf2Y4Jqgkndn59kyFrNHuAvANYCJh27hqzoEzFdkb
	BBoA9Ey93xnJeMGJnRr4y9obdGnpo0MujRk/1I1oF0zB7UyPERJaNW97un/AlZ8a+gp4/lg77t5
	OeFm04TyRCundmsxN7Z+1PdMyfOMrYWOW3XWKOJZMCOn3DQJSdLtaF2l5beY0tZKNwHoo79JS87
	orSxrEExkTbastf3CLG4XtgmLMMK2B8COqIy/Pjg57bU=
X-Google-Smtp-Source: AGHT+IHVtazkKOvjOJrOfm04DNRArnB952epM/1Ur7L3bzWPScmWVjAQPWu02+n0E7WC/TG7fAuzAQ==
X-Received: by 2002:a05:600c:34cf:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-442f21683cemr21843635e9.20.1747211114278;
        Wed, 14 May 2025 01:25:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/9] arm64: dts: imx8mn-bsh-smm-s2-common: Leave regulator under hw state machine
Date: Wed, 14 May 2025 10:24:56 +0200
Message-ID: <20250514082507.1983849-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012515_973226_998652C8 
X-CRM114-Status: UNSURE (   9.88  )
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

From: Michael Trimarchi <michael@amarulasolutions.com>

Let regulator to be controlled by hardware state machine.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index 5a1ec2f6a552..0d343ffdb7f9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -144,6 +144,7 @@ buck4_reg: BUCK4 {
 				regulator-max-microvolt = <3300000>;
 				regulator-boot-on;
 				regulator-always-on;
+				rohm,no-regulator-enable-control;
 			};
 
 			buck5_reg: BUCK5 {
@@ -153,6 +154,7 @@ buck5_reg: BUCK5 {
 				regulator-max-microvolt = <1995000>;
 				regulator-boot-on;
 				regulator-always-on;
+				rohm,no-regulator-enable-control;
 			};
 
 			buck6_reg: BUCK6 {
@@ -162,6 +164,7 @@ buck6_reg: BUCK6 {
 				regulator-max-microvolt = <1400000>;
 				regulator-boot-on;
 				regulator-always-on;
+				rohm,no-regulator-enable-control;
 			};
 
 			ldo1_reg: LDO1 {
-- 
2.43.0


