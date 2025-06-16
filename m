Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9718AC71157
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 02:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=; b=DXp492eN+V3cXsioVyEzTELrGI
	abpWrEsVg8+FPZt/eoYM1KiBMTEeM06LxlsCX6pDEGozlPNuCN7EYTaNQnKwHDPv43RmG7i3Hp9FJ
	r0opWfK77BbXa6Fz/3OUlrijEFuSkJKevlVleqn1zKNDBpkO+UOHJIqgQRFA2W/vfRCvtpCDlRh4N
	LBVvwmxaBKGNvhdUCjtoSQIAmSaxbPQ/Dv7wv1LyMJrCxsr/NfPR7xsKnD7CO2lOaBfGJTmPKvZFt
	HW+ILWnn+oY/3hhq8zN4DVVr8eqfEnDyXbf6WoBXzuHJY93HrNxKKv4op+TFpl7AbjyqrMBVXDcaK
	b0Oit/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQzLB-000000038Ty-1Gsr;
	Mon, 16 Jun 2025 02:12:53 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyik-000000034PG-3XhC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:33:11 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2363616a1a6so29687935ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037590; x=1750642390; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=W3VtbIMI1dSGY+PWFl8zWXLJG3+K3h5Vh8DwhyWtbMGwpt6w9SMCtk7tZoMAZ3TU6i
         fuIXK0jfgIwk7QjMc3mOCV0IikJw/lkeo2wOnWPL8mGKMUSMo9BllopMsb2X/apo1EZj
         nU/aIQAYpzKsJFNqt4C5uGi9gxOD7KQ7Pd2QW+v9VE9m0S8hs15jIJ6o6qG5Y/hig4ZE
         6OeS5n7uJXbE+KBTX1/6IxPrWPnatoCusL4TMyqCYI5rWGZEhrqc4gW1/V7hF+9dQQYm
         Zm7KSPFZ/3yr3T3S8jgiF/8TGcvD8n19LNR5NMXu+Lh3fD5BAJxabQOMQDnSqx+a3lSo
         AOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037590; x=1750642390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=Kpji6XM1n5F61PsQHymoEy6FXc56T+wNNxsj+8841kHPgynahRERx5SwJuhKNIiVOQ
         6aQyz7L5zEv8bYtFEWKE/RN1e+GOZK/LWh6iOfEIXAXRlzkLhJyaqAlmt4wqKKn3T28S
         nmlqG40ZIQwHdFgTaQxxAGOU/CV8L+JG2ikoh+HfzmGKfDEAQx+k0hDy51jxhGbe0tsu
         KdQWjUgjYH+WwYW9yuiHgDe+vgW1sN8QrxjFR8v7BAnte5s9JtTy3v/wW6AkJmJ71OjM
         M7772czhaDmZC5+byJAClbcqprbj8C4Hs1K29pnepNC0ee9ulVe959TSkcrFOs3t9CHx
         WP+A==
X-Forwarded-Encrypted: i=1; AJvYcCX7GFU2Kf7PlBSWynEOdzZBew6epHxuM6CTPKMnvuWeWBfBz3LSP0W9eYFw3fy/N0RtrglhPFMJmA/RXGSociFd@lists.infradead.org
X-Gm-Message-State: AOJu0YzV8Y4+U1gkiVUABL+R+IbuEnf/gunuNx7y2ok9tzLUEY1vcoJX
	Qefbv2UB1edn/S/Ges8ShI0YFpd6iZ1jOGpRUZQicIiVv1KTT2/Lj7O3
X-Gm-Gg: ASbGncvxBll0ebKkuS2CZ7w0Vfh5JpSxvG44sicpHiiXwYOsk0QhIJanE643VyHhbb9
	aoaB1BOPQTylqTSvKDvwlLdRmLgK0NrqHnBZtTw09CeN1SZQdGMUwyiSQTAXyKdmJ7GGqvN/Tji
	Kx1SMwgqTnYVQOqTgN2eWm0v5qdqOWUwSsBN8F4FU5fyRERta7Bwsgdag7pFJ27YktcVxXVSz4A
	rd3Jz9FPP1SUe0Siv5WyJydZg3eVie6yha42R9UkDqX1FkuyHW2nZme4iGr1JGPMSnyEBeU93Uu
	6X+WC4AbOymM94F8GsaqWuydbxHRQ8DyMETSFZxYdd/sHLIljSb+CHWwOYW0AOhiGbnbelJe4Rw
	4plejTu/M0kumdQ==
X-Google-Smtp-Source: AGHT+IE3CoHqmpfLy1DzF8kDoAHeOUuTULE+bjRl7YCy9LgCR6uXCb2k/LnCPpIUZv7XDGB11/5vmw==
X-Received: by 2002:a17:902:ccc2:b0:235:eb71:a37b with SMTP id d9443c01a7336-2366b17c413mr110186025ad.46.1750037590096;
        Sun, 15 Jun 2025 18:33:10 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:33:09 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:06 +0800
Subject: [PATCH RESEND v7 17/21] arm64: dts: apple: s8001: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-17-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=umS18Mpui1EoUACcGD+WdVdka5VgnqwULsO8fA+OvnQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QZQhUOZouPvn3IHsPwwoR4uGTf/Nhz2lJMe
 hJ2wzVTKkKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GQAKCRABygi3psUI
 JIdMEAC3ItExFqP6qy4Q2p90/jpYVFMlGe8vDrr7GdPt6sPfMPUziMg+wWWX+44QTRWBUdKLbrq
 SyNFEuUG2P/Ll5Au4+7I/kArzdCAx65VfuN6Pkm2yxndRGLtnxpQT4yBPoaTfzv0OIGIXj4f5Ab
 JcAAeb5+N1yMPskCCid+MjxAAUDVAkXAbA+yg1DmdqSHrcgafPoRjJMqn0Kc3ozCePU/lIG0w3Z
 MxqIQprBMRxoupCzexUTRypr81q1MyTKF5LuwgdvYPHTanABq1kWujlGu/34Ik4U1S5rg+y9cOe
 YH2GHSOkAQ5ZJRDfmBtbudkgl/Vw2iuKUhi8xPeAzUQQxGAal3pJFfPa4QAxPp1yZfX109KfO/Q
 Nfzv0pFTl3ATI80a1MmoXX/6eCAXCNBJH4fI3f2XQBLH9SYKw3LK9nePx8mBzIo+SOURZHVUtZN
 7oBQL7qZCS0dGEftVMDWjcm1GhA34O7ELjktmBbI7dkwyA3TfyL0KL1E6UhquqotEuh5xvYRePX
 8bmW7nPsYlg6NhKJuydIOAHMHiApGsN0UVVgLXPwbih9561APtM+blVDQDWUE8Fcf8gkT6v4sMn
 vLtoQ3DSxRsNgMau1tpASWTTHkS4HmEKvJ8CpSthb0Vx8oljvCpTrKadzHD2bSPQIr0xHerThJm
 LuwvvRayA9EYP3A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183310_889381_B570CF7D 
X-CRM114-Status: UNSURE (   9.46  )
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

Add CPU PMU nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index d56d49c048bbf55e5f2edf40f6fd1fcff6342a9f..33760c60a9189df5491256f81db7f413cada27a7 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -209,6 +209,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s8001-pmgr.dtsi"

-- 
2.49.0


