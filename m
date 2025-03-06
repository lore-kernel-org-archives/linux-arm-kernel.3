Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A565C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=; b=GNv/KVgpvHY2b9dfTWM82TvrWu
	aO5f4TPL8bkg25GJa37uCFBV00t7NJvIB+UdnHLV05sGv3CTWAFMgem+EvjRrSOFQvZ9V9esYHvLA
	hWCbs6nFscY6Xca1Mk6RIRE5PduZ9+PyLUhMmtBz8k8qLBe3Yxua4X6jQvngVMhHKtfRZtivINZpN
	IuI306sC2DMAhGuH2JbIAYgcdWsjjHbQMKbHHrZiHYuVbH6uJHoeshu2qOuDgOt5m+w9x9y+WX+25
	rnJ8wMLZ5IYkWu+1EEnhomq1j4TNaimrFx6Ji4MRjYgOj4aMlmbeW5UB6pGK78u5ZDbSOyiNWjVyD
	i+Dt7+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAPt-0000000Avgi-2Pyr;
	Thu, 06 Mar 2025 12:33:33 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9R7-0000000AmkV-2VOT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:30:46 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso1272342f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260644; x=1741865444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=C4xOkHMnC0KJU3wTVOnDEbExm1SpNmp9O0HxCCwvrH7xgL/HxMb4crehS9SRUCwRaC
         8u0pAkJFf/DHjO1FH9wNeCerJJImVTuXGrYzY3Uc9BfpCflVu/1PUjYNCfHgQa/emfdJ
         DNDLKcTrydwqXPhaaGMPmzSUWkAJbuFBuSSQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260644; x=1741865444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=enIz1EpvNDR+bj8+XC/GXvxSOMTRZ6cQVFatA5aO1VVZY2S3tSdcrlEOQj2lhLDXPQ
         BdRKmEXYQ6fwm70osGyVmZem3ZZdDfWdckXzP5JGlXETc22DtY0XFQ+Br+7tZVr38Ruy
         X7Xa5gBsy7N5EYiC9vLrU0fIYrssLYrYicR9bM5GqZ+TehnqQW1ovlWXHWbl4T5635Az
         Pb66zAdcywzagVHIlzSdENLrQwZMtuHJZiFVLThfJ0ZaykG8799YiFZWZS3/I7n7oycl
         pze2xwz8SYm6HvMcmmHQVVFvo4gqBB7LX9YnyPV6B5oQeQ6g/SR3TiaAUOuH5ZPAxC6o
         hI2g==
X-Forwarded-Encrypted: i=1; AJvYcCX/1/UXKO1e4v7otETBnFZoCBn5rayeb/t733Xn/EYbbQshq73eTfl0MZOfMjH8LVbH4w1Sc2jSWMKWVrvufSoT@lists.infradead.org
X-Gm-Message-State: AOJu0YzBXc4kyOiGCETR51SEKo4bJbqtCLlxKrs/sBCWbFeDlzLZfLzy
	8MXWfjuoDyXU4QGYwpqV+cZZ2PA2vPQc7Xw1Tu2U2luTV3Dlb632tLaJSteB8mw=
X-Gm-Gg: ASbGnct+k7G5SvhBgHAx3Vln0dYN6XXha624LSuKe6l/m8IK9fApSzs+fvLbDEvgKgZ
	5mTd7qUTy+sXgeXTSPcDUKd7ag6WD4yPzgb5D9/uQi8EuSsAXJ3injmZISGl7Dk5PMVnFX0CE1J
	7pqfehE5Lb4V6EfcO0xleCspAB8VA+aCauE0Q8tBlVimuMU5GAuggxEjw2jE6UmMaihN5By5uuy
	TjKxJGWkB6Ob0kIBduAT9sSWH5C+7iEGt7T08kLBg024KoeJKqCLudjWRoAAvExM6ktt/bltoc9
	j80LGyD0GZvNL9WIYL68Q+pSTATE6KVc1R2S7lOq6yFJD9d1/QUQlBnoJtbyuLcW4zgH7ua6u7h
	YwiXECQ==
X-Google-Smtp-Source: AGHT+IF+Uv003+XSltPn5ffM4uC4mlgaqPhLJOFsDdkfqP+MvIZaA9k6d3mtHBYRHEnmB+I/uE5LEw==
X-Received: by 2002:a05:6000:4185:b0:390:feb7:1f69 with SMTP id ffacd0b85a97d-391296d3e2amr2365832f8f.4.1741260644016;
        Thu, 06 Mar 2025 03:30:44 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:43 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v10 08/18] arm64: dts: imx8mp: add anatop clocks
Date: Thu,  6 Mar 2025 12:27:57 +0100
Message-ID: <20250306112959.242131-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033045_642867_2B9D8FCE 
X-CRM114-Status: UNSURE (   9.59  )
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..0b928e173f29 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -709,6 +709,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


